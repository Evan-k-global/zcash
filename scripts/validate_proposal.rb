# Copyright (c) 2026 Zeko Labs
# SPDX-License-Identifier: MIT
require 'yaml'
require 'date'
require 'pathname'
require 'uri'

module IronLimb
  ROOT = Pathname.new(__dir__).parent
  APP = 'ironlimb-zcash-grant-application.md'.freeze
  BUDGET = 'ironlimb-delivery-budget-and-continuity.md'.freeze
  FORUM = 'ironlimb-forum-post.md'.freeze
  SUPPORT = %w[ironlimb-technical-design-and-threat-model.md ironlimb-delivery-budget-and-continuity.md ironlimb-cryptographic-fit-and-alternatives.md].freeze
  DOCS = ['README.md', APP, FORUM, *SUPPORT, 'CONTRIBUTING.md', 'REFERENCES.md'].freeze
  FIELDS = [
    'Issue title', 'Application Owners (@Octocat, @Octocat1)', 'Organization Name',
    'How did you learn about Zcash Community Grants', 'Requested Grant Amount (USD)',
    'Category', 'Project Lead', 'Additional Team Members', 'Project Summary',
    'Project Description', 'Proposed Problem', 'Proposed Solution', 'Solution Format',
    'Dependencies', 'Technical Approach', 'Upstream Merge Opportunities',
    'Open Source License', 'Hardware/Software Costs (USD)', 'Hardware/Software Justification',
    'Service Costs (USD)', 'Service Costs Justification', 'Compensation Costs (USD)',
    'Compensation Costs Justification', 'Total Budget (USD)', 'Previous Funding',
    'Previous Funding Details', 'Other Funding Sources', 'Other Funding Sources Details',
    'Implementation Risks', 'Potential Side Effects', 'Success Metrics',
    'Startup Funding (USD)', 'Startup Funding Justification', 'Milestone Details', 'Supporting Documents'
  ].freeze

  def self.check(condition, message)
    raise ArgumentError, message unless condition
  end

  def self.dollars(value)
    check(value.to_s.match?(/\A\s*\$?[\d,]+\s*\z/), "Invalid dollar value: #{value.inspect}")
    Integer(value.to_s.delete('$,').strip)
  end

  def self.money_in(value)
    value.scan(/\$([\d,]+)/).flatten.map { |v| dollars(v) }
  end

  def self.table(source, pattern)
    source.lines.each_with_object([]) do |line, rows|
      next unless line.match?(pattern)
      rows << line.split('|').map(&:strip).reject(&:empty?)
    end
  end

  def self.validate(root = ROOT)
    root = Pathname.new(root).expand_path
    required = [*DOCS, 'LICENSE', 'scripts/build_package.py', 'tests/test_proposal.py', '.github/workflows/validate.yml']
    required.each { |name| check((root / name).file?, "Missing required file: #{name}") }
    docs = DOCS.to_h { |name| [name, (root / name).read(encoding: 'UTF-8')] }
    docs.each do |name, text|
      check(text.scan('```').length.even?, "Unbalanced fences in #{name}")
      check(!text.match?(/\[CONFIRM|\bTBD\b|\bTODO\b/), "Unresolved filing placeholder in #{name}")
      text.scan(/\]\(([^)]+)\)/).flatten.each do |target|
        next if target.start_with?('#')
        if target.include?('://')
          url = URI.parse(target)
          check(%w[http https].include?(url.scheme) && url.host, "Invalid web link in #{name}: #{target}")
        else
          path = target.split('#', 2).first
          destination = (root / path).cleanpath
          check(destination.to_s.start_with?(root.to_s + '/'), "Link escapes repository in #{name}: #{target}")
          check(destination.exist?, "Missing local link target in #{name}: #{target}")
        end
      end
    end
    app = docs.fetch(APP)
    headings = app.scan(/^## ([^\n]+)$/).flatten
    check(headings == FIELDS, 'Application fields/order differ from the checked ZCG form')
    entries = app.scan(/^## ([^\n]+)\n\n```[^\n]*\n(.*?)\n```/m)
    check(entries.length == FIELDS.length, 'A form field lacks its copyable code block')
    fields = entries.to_h
    check(fields.values.all? { |v| !v.strip.empty? }, 'An application field is empty')
    app.scan(/```yaml\n(.*?)\n```/m).flatten.each { |block| YAML.safe_load(block) }
    check(fields.fetch('Open Source License').strip == 'MIT', 'Application license must match MIT LICENSE')
    check(!fields.fetch('Issue title').downcase.include?('codex'), 'Application title contains an unwanted tool label')
    license = (root / 'LICENSE').read
    check(license.include?('MIT License') && license.include?('Copyright (c) 2026 Zeko Labs') && license.include?('Permission is hereby granted'), 'License/copyright mismatch')

    lead = YAML.safe_load(fields.fetch('Project Lead'))
    check(lead['Name'].include?('Martin Ondejka'), 'Missing accountable technical lead')
    team = YAML.safe_load(fields.fetch('Additional Team Members'))
    work = team.first.fetch('Budgeted Workstreams')
    check(work.length == 5 && work.none? { |w| w.key?('Owner') }, 'Workstreams must represent aggregate effort, not unresolved individual-owner slots')
    check(team.first.fetch('Responsibilities').include?('Martin Ondejka leads technical delivery'), 'Team accountability is missing')

    hardware = dollars(fields.fetch('Hardware/Software Costs (USD)'))
    services = dollars(fields.fetch('Service Costs (USD)'))
    compensation = dollars(fields.fetch('Compensation Costs (USD)'))
    total = dollars(fields.fetch('Total Budget (USD)'))
    startup = dollars(fields.fetch('Startup Funding (USD)'))
    check(hardware + services + compensation == total, 'Category totals do not reconcile')
    check(total == dollars(fields.fetch('Requested Grant Amount (USD)')), 'Requested amount and budget differ')
    check(total == 400_000, 'Unexpected request; update accepted scope and checks deliberately')
    budget = docs.fetch(BUDGET)
    rows = table(budget, /^\| (Startup|Gate [1-5]) \| \$/)
    check(rows.length == 6, 'Budget matrix must include startup and all five milestones')
    costs = rows.map do |row|
      values = row.drop(1).map { |v| dollars(v) }
      check(values.length == 4 && values.take(3).sum == values.last, "Payment split does not reconcile: #{row.first}")
      values
    end
    check((0..3).map { |i| costs.sum { |r| r[i] } } == [hardware, services, compensation, total], 'Budget matrix and application categories differ')
    check(costs.first == [4000, 0, 1000, startup], 'Startup split differs from justification')

    milestones = YAML.safe_load(fields.fetch('Milestone Details'))
    check(milestones.map { |m| m['Milestone'] } == (1..5).to_a, 'Milestone sequence is incomplete')
    check(startup + milestones.sum { |m| m['Amount (USD)'] } == total, 'Milestone payments plus startup differ from total')
    durations = table(budget, /^\| [1-5]:/).map { |row| Integer(row[1].split.first) }
    check(durations == [5, 10, 8, 14, 8], 'Duration allocation differs from the planning baseline')
    elapsed = 0
    milestones.each_with_index do |m, i|
      amount = m.fetch('Amount (USD)')
      check(amount == costs[i + 1].last, "Milestone #{i + 1} payment differs from matrix")
      split = money_in(m.fetch('Budget Rationale'))
      check(split == [costs[i + 1][2], costs[i + 1][0], costs[i + 1][1]], "Milestone #{i + 1} rationale differs from matrix")
      check(split.sum == amount, "Milestone #{i + 1} rationale does not sum")
      elapsed += durations[i]
      expected = Date.new(2027, 1, 4) + elapsed * 7 - 1
      check(m.fetch('Expected Completion Date') == expected.to_s, "Milestone #{i + 1} date is not sequential")
      check(m.fetch('User Stories').length >= 2 && m.fetch('Acceptance Criteria').length >= 6, "Milestone #{i + 1} lacks validation detail")
    end
    forum_rows = table(docs.fetch(FORUM), /^\| [1-5] \|/)
    check(forum_rows.length == 5, 'Forum schedule is incomplete')
    forum_rows.each_with_index do |row, i|
      check(Integer(row[1].split.first) == durations[i] && dollars(row[2]) == milestones[i]['Amount (USD)'], "Forum milestone #{i + 1} differs")
    end
    check(milestones[2]['Acceptance Criteria'].any? { |v| v.include?('deposit-10, trade-4, redeem-6') }, 'Worked example has no reproduction criterion')
    check(milestones[3]['Acceptance Criteria'].any? { |v| v.include?('9.82 team person-weeks') && v.include?('at least 8') }, 'Review-readiness capacity is missing')
    check(milestones[4]['Acceptance Criteria'].any? { |v| v.include?('elapsed time does not constitute acceptance') }, 'Quality-based acceptance is missing')

    role_rows = table(budget, /^\| (ZK implementation|SP1\/protocol|Zeko engineer|Protocol reviewer|Documentation\/specification)/)
    check(role_rows.length == 5, 'Role-cost table is incomplete')
    role_rows.each do |row|
      rate, weeks, cost = dollars(row[1]), Float(row[2]), dollars(row[3])
      check((cost.to_f / rate - weeks).abs < 0.005, "Role effort is inconsistent: #{row.first}")
    end
    check(role_rows.sum { |r| dollars(r[3]) } == compensation, 'Role costs differ from compensation')
    effort = compensation.to_f / 2750
    check((work.sum { |w| w['Person-Weeks'] } - effort).abs < 0.005, 'Team effort differs from compensation')
    check(fields.fetch('Compensation Costs Justification').include?(format('%.2f FTE', effort / elapsed)), 'FTE differs from effort/calendar')
    attachments = YAML.safe_load(fields.fetch('Supporting Documents'))
    check(attachments.map { |a| a['File Name'] } == SUPPORT, 'Supporting document inventory differs')
    attachments.each { |a| check((root / a['File Name']).size > 8000, "Supporting document is empty or incomplete: #{a['File Name']}") }
    check(docs.fetch('README.md').include?('pre-grant design and proposal'), 'README must disclose implementation status')
    true
  end
end

if $PROGRAM_NAME == __FILE__
  begin
    IronLimb.validate(ARGV[0] || IronLimb::ROOT)
    puts 'PASS: proposal fields, budget, startup, effort, dates, staffing, attachments, links, and license'
  rescue StandardError => error
    warn "FAIL: #{error.message}"
    exit 1
  end
end
