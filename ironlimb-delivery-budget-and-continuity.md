# IronLimb: Delivery, Budget, Team Evidence, and Network Continuity

Supporting document 2 · November 5, 2026 · Proposed commitments; no IronLimb benchmarks or code claimed

## Funded delivery

Request: **$400,000 over 45 weeks**. Planning baseline: January 4, 2027; adjust dates to the actual funded start before filing. Gates measure working software and reproducible evidence, with feasibility research paid as its own deliverable.

| Gate | Duration | Payment | Completion evidence |
| --- | --- | --- | --- |
| Startup | Before Gate 1 | $5,000 | Repositories, environments, dependency inventory, reporting/validation schedule |
| 1: feasibility | 5 weeks | $50,000 | Both-direction statements, candidate measurements, authentication design, published continuation decision |
| 2: testnet bridge | 10 weeks | $85,000 | Shielded round trip, threshold setup, refunds, recovery manifest, 10 external testers |
| 3: verification and exchange | 8 weeks | $95,000 | Real accepted-root/deposit verification, atomic confidential RFQ, leakage/performance report |
| 4: consensus prototype | 14 weeks | $94,000 | Local real-proof custody rules, migration, exact effects, DA/recovery exercises |
| 5: review and release | 8 weeks | $71,000 | External findings, remediation, reproduced workflows, release and production-dependency report |

Gate 2 pays for the bridge integration and operational workflows the later proof-verified exchange needs: shielded wallet flows, claim accounting, threshold reserve operations, withdrawal/refund handling, deployment and recovery, and external validation. An attested mint alone would not satisfy it.

Gate 5 funds review, fixes, reproduction, and handoff. A decision document alone would not satisfy it. An honest no-go conclusion does not waive undelivered engineering or review commitments.

### Review readiness and calendar

The schedule preserves fourteen weeks for consensus integration and reverse-state authentication, followed by eight weeks for independent review, remediation, and verification. Total duration is 45 weeks; with the January 4, 2027 planning start, Gate 4 ends September 19 and Gate 5 ends November 14, 2027. The request totals $400,000, including startup, with the category allocations and aggregate team effort reconciled below. Martin manages contributor assignments and available capacity against the proposed 45-week schedule and milestone requirements.

Before Gate 5 begins, record the confirmed reviewer scope and slot, frozen code/design snapshot, reproducible commands, and named remediation capacity. Plan weeks 1–4 for independent review with rolling findings, weeks 5–7 for fixes and regressions, and week 8 for independent remediation verification, user reproduction, and handoff. This sequence is a planning assumption to validate with the selected reviewer, not a committed vendor timetable.

Gate 5's approximately 9.82 person-weeks are implementation-team effort, separate from the $40,000 external service allocation; neither amount guarantees a particular review duration. Review readiness must show that the scoped work fits both budgets and that team capacity is reserved when findings arrive. Reserve at least 8 team person-weeks ($22,000) for technical remediation and regression testing; the remaining approximately 1.82 person-weeks ($5,000) covers review coordination, independent-user reproduction support, documentation, and handoff. These are allocations within the $27,000 team compensation, not additional costs. The existing $4,000 Gate 5 infrastructure cap covers the proposed eight-week window. If scope, review timing, or findings exceed the plan, report the delay and agree any necessary schedule or budget amendment; do not waive unresolved acceptance criteria to meet a date. Acceptance depends on completed deliverables and verified remediation. Delays require an updated schedule; elapsed time does not constitute acceptance.

An intended-user representative must reproduce the worked deposit-10/trade-4/redeem-6 example from a clean deployment, record request-bound payout evidence and post-step balances, and reconcile native reserves, claim states, and separately recorded fees. The illustration omits fees for clarity; the runnable fixture funds and records them separately so the 10/4/6 amounts remain reproducible. This is a test-fixture convention, not a production fee policy.


## Budget reconciliation

| Payment | Hardware/software | External services | Compensation | Total |
| --- | ---: | ---: | ---: | ---: |
| Startup | $4,000 | $0 | $1,000 | $5,000 |
| Gate 1 | $6,000 | $2,000 | $42,000 | $50,000 |
| Gate 2 | $9,000 | $3,000 | $73,000 | $85,000 |
| Gate 3 | $8,500 | $5,000 | $81,500 | $95,000 |
| Gate 4 | $9,000 | $10,000 | $75,000 | $94,000 |
| Gate 5 | $4,000 | $40,000 | $27,000 | $71,000 |
| **Total** | **$40,500** | **$60,000** | **$299,500** | **$400,000** |

The five milestones total $395,000: $298,500 compensation, $36,500 hardware/software, and $60,000 external services. Startup adds $1,000 compensation and $4,000 hardware/software. The category totals above are derived from those six payment allocations; startup is included, not added again. The documentation/specification and startup coordination allocation includes the $1,000 scheduling effort.

### Cost rationale by gate

Effort below is compensation divided by the single $2,750 planning rate; one person-week is 40 hours. Effort is derived from the dollar allocations and rounded for display: approximately 108.55 person-weeks across the five milestones plus 0.36 startup person-weeks, or 108.91 in total. Dollar allocations are authoritative; these figures are not additional effort or confirmed staffing commitments.

| Payment | Approx. person-weeks | Funded work |
| --- | ---: | --- |
| Startup | 0.36 | Dependency inventory and validation scheduling; $4,000 infrastructure and $1,000 compensation are included in category totals |
| Gate 1 | 15.27 | Both verification statements, candidate benchmarks, and complete reverse-authentication architecture and cost assessment |
| Gate 2 | 26.55 | Wallet/claim integration, threshold operations, withdrawals/refunds, deployment/recovery, UI, and 10-tester validation |
| Gate 3 | 29.64 | Deposit and authenticated-state proof integration; differential/negative fixtures; encrypted-note accounting/recovery; atomic RFQ; proving and leakage instrumentation |
| Gate 4 | 27.27 | Selected reverse-authentication path and native withdrawal rules in local Zebra; migration/opening state; DA/recovery drills; design-review remediation |
| Gate 5 | 9.82 | Findings remediation, workflow reproduction, release, integration documentation, and handoff |
| **Total** | **108.91** | **Aggregate team effort over 45 calendar weeks** |

The category table separately allocates compute, node/tooling costs, and independent services to each gate. Gate 3's $95,000 includes $81,500 team effort, $8,500 infrastructure, and $5,000 external validation. Its 29.64 person-weeks average approximately 3.70 FTE during its eight-week window; the team allocation must support that peak. Gate 4's $94,000 includes $75,000 team effort (approximately 27.27 person-weeks, averaging 1.95 FTE across fourteen weeks), $9,000 infrastructure, and $10,000 external design/security review. Gate 5's $71,000 includes $40,000 external review/remediation verification, $27,000 team effort (approximately 9.82 person-weeks, averaging 1.23 FTE across eight weeks), and $4,000 infrastructure. External review does not replace the team's responsibility to fix findings. At Gate 1, the technical lead must validate these effort allocations against measured scope and named capacity. Required Gate 4 outputs must be completed before its acceptance. If the allocations cannot support the required work, seek an agreed amendment before proceeding.

Proposed planning caps, not vendor quotes. Hardware/software covers $20,000 proving compute, $14,000 nodes/test environments/CI (including $4,000 startup infrastructure), and $6,500 storage/backups/tooling. Services cover $50,000 external review/remediation verification, allocated across Gates 4 and 5, and $10,000 independent integration/leakage/reproduction support across Gates 1–3. No liquidity or mainnet trading capital is included. An external security reviewer will be selected from qualified existing relationships or Zcash-community-recommended specialists through a scoped engagement and quote. No firm is represented as committed to IronLimb; historical zkSecurity assessments remain prior-work evidence only.

| Budgeted role | Weekly planning rate | Approx. person-weeks | Compensation |
| --- | ---: | ---: | ---: |
| ZK implementation/circuit lead | $2,750 | 36 | $99,000 |
| SP1/protocol engineer | $2,750 | 24 | $66,000 |
| Zeko engineer | $2,750 | 30 | $82,500 |
| Protocol reviewer | $2,750 | 15 | $41,250 |
| Documentation/specification and startup coordination | $2,750 | 3.91 | $10,750 |
| **Total** | | **108.91** | **$299,500** |

The effort estimate is approximately 108.91 aggregate person-weeks across the Zeko team, averaging 2.42 FTE over 45 calendar weeks. We use a single internal planning rate of $2,750 per 40-hour person-week ($68.75/hour) for all workstreams. This prices pooled incremental team capacity; it does not assert equal individual salaries and is not a confirmed salary or vendor quote. The allocation funds implementation and validation in both proof directions, authenticated-state integration, confidential exchange, recovery, and remediation. Payments include all categories; unused allocations are not permission to expand scope or spend past a failed gate.

Martin Ondejka leads technical delivery through the Zeko Labs engineering team. The five compensation workstreams represent aggregate team effort rather than five distinct hires; individual implementation assignments will be managed against milestone requirements and available capacity. The ZK implementation role concerns established cryptography and new application constraints, not invention of a new proof system. The budgeted protocol-review workstream is separate from the independent security-review service. Operational responsibilities, review engagements, and intended-user validators are assigned and documented at the relevant delivery gates. External review is a separate service, not implementation capacity.

## Sourced team record

The [Zeko AAIF proposal](https://github.com/aaif/project-proposals/issues/68) and [maintainer roster](https://github.com/zeko-labs/aaif/blob/main/MAINTAINERS.md) identify:

- **Zeko Labs Inc.** as contributing entity; `@zekoxyz` is its team maintainer account.
- **Evan Kereiakes, `@Evan-k-global`**, as AAIF liaison/application contact and contributor of reference integrations, compatibility tests, reproducible evidence, and documentation. Contact: contact@zeko.io. IronLimb application contact and delivery coordinator.
- **Martin Ondejka, `@MartinOndejka`**, as core rollup maintainer, including [settlement recovery](https://github.com/zeko-labs/zeko/commit/7acd9a9b23d11282517381e04c15690c5198cbea) and [state updates gated by settlement finality](https://github.com/zeko-labs/zeko/commit/67a453c25d8606ddc55f6e0e0f3e2eb531ac2c2b). IronLimb technical lead, identified by the applicant, leading the Zeko team. The applicant also confirms that he has worked with specialist cryptographers and independent security auditors during Zeko development; Martin manages individual IronLimb assignments against milestone needs and available capacity.

The linked work is evidence of relevant prior implementation, not completed IronLimb work or independent production adoption. The [core audit index](https://github.com/zeko-labs/zeko/tree/compatible/audits) documents component-specific assessments; they do not audit IronLimb's new circuits, custody, or application.

The AAIF proposal discloses Zeko Labs/investor support for existing development and infrastructure. The applicant confirms no previous ZCG grants and no other funding received or planned for IronLimb. The application selects Yes for organizational Other Funding Sources and explains the existing Zeko Labs/investor support separately. The Zeko Labs affiliation is disclosed. Track individual allocations and incremental costs during funded implementation. Separate pre-existing infrastructure from grant-funded additions in time and expense records.

## Settlement and native-custody boundaries

Ethereum is the chosen settlement environment for Zeko execution and a connection to supported financial assets. This does not certify the new application code or remove the deployment's DA, admin, or exit assumptions. The initial exchange requires its own users and liquidity; settlement does not automatically connect it to arbitrary Ethereum protocols.

Gate 1 includes the canonical Ethereum-accepted Zeko checkpoint and finality model in the reverse-verification specification. It must identify and cost the complete authentication construction, including any required Ethereum light-client/finality verification or proof adapter. This can be the dominant feasibility dependency rather than a small extension of escrow. If no sound path fits the agreed resource and budget ceilings, Gate 1 records a no-go and downstream work stops unless an amended scope is approved. Gate 4 implements the selected path with real acceptance in an isolated research prototype; an attested checkpoint is not a substitute. Completion does not activate public Zcash rules or move production ZEC out of threshold custody. These clarifications do not add a mainnet launch or broader DeFi integration to the budget.

## Network continuity

Pinned source is necessary but insufficient. Record chain/genesis identity, endpoints, contracts, asset mappings, verifier programs/VKs, real/mock mode, admin/upgrader/prover permissions, DA membership/quorum, data retention, and reserve signer threshold. Different reference deployment profiles need separate manifests.

Retain source/build manifests, immutable image digests where available, configuration, encrypted operational backups, ledger/DA data, accepted checkpoints, and note/witness recovery material. Separate protected key recovery from public reproducibility artifacts.

The [independent Sepolia runbook](https://docs.zeko.io/operators/guides/launch-sepolia-rollup) provides an operator-owned deployment path. Its demo defaults include mock Ethereum verification; an independently run environment is not automatically a proof-secured or decentralized one. IronLimb must identify its exact profile and separately demonstrate real acceptance where claimed.

| Event | Required action and evidence |
| --- | --- |
| Zeko Labs deprioritizes the shared network | Pause affected acceptance; run IronLimb's reproducible environment or publish a blocked status. Do not claim the replacement continues the old network. |
| Sepolia resets or incompatible interfaces change | Mark old test claims/network distinctly; reconcile fixtures and revalidate the complete path before testing resumes. |
| DA signers rotate or disappear | Verify the authorized membership transition and retained history; otherwise pause. Exercise reconstruction and report where exits depend on unavailable data. |
| Reserve signer loss | Exercise the documented threshold recovery; if the required threshold is unavailable, disclose the limit. Deposit proofs cannot recover inaccessible Zcash keys. |
| Admin/verifier changes | Invalidate the previous assurance manifest until configuration, domains, and acceptance are rechecked. |

Gate 2 includes restoration on a clean environment. Gate 4 tests missing data and operator failure under the consensus design. A snapshot or a new deployment never silently carries old liabilities into new custody. Testnet shutdown documentation must explain note recovery, claim status, remaining redemption dependencies, and data handoff.

## Validation and stopping rules

Confirm a technical reviewer and intended-user representatives before each gate: integrating builder, wallet/testnet representative, and node developer for consensus work. Record their identities, affiliation, test commands, verdict, and unresolved findings. Authors alone do not accept their own deliverables.

Gate 1 failure stops downstream work; Gate 2 failure stops exchange integration; Gate 3 failure stops consensus integration; Gate 4 failure blocks a production recommendation. No failed gate authorizes automatic spending on a replacement product. Publish results and request an agreed amendment for material scope changes. Post monthly progress and evidence in the grant's forum thread.

