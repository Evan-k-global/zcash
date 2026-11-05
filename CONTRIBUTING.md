# Contributing to IronLimb

Copyright (c) 2026 Zeko Labs. SPDX-License-Identifier: MIT.

IronLimb is currently a proposal and design repository. Contributions should improve precise statements, implementation feasibility, acceptance evidence, and reproducibility. Do not describe planned work, schematic pseudocode, or mocked verification as implemented or benchmarked results.

## Propose a change

Use a focused branch and a pull request explaining the concrete problem, resulting behavior, and validation. Keep changes to the funding request and milestone scope explicit. After filing, the ZCG issue is authoritative; a repository edit alone does not amend an awarded grant.

For protocol changes, identify public inputs and private witnesses, the authenticated state and deployment, domains/VKs, authorization, replay prevention, conservation, recovery assumptions, and what each observer learns. Keep real and mock acceptance profiles distinguishable. Do not silently replace native custody, chain selection, or data availability with operator assertions.

Follow the relevant upstream project's contribution instructions for changes to its code. Use [librustzcash's style guides](https://github.com/zcash/librustzcash/blob/main/CONTRIBUTING.md#styleguides) as the primary Zcash style reference, and follow its applicable [merge workflow](https://github.com/zcash/librustzcash/blob/main/CONTRIBUTING.md#merge-workflow), [branch history](https://github.com/zcash/librustzcash/blob/main/CONTRIBUTING.md#branch-history), [pull request review](https://github.com/zcash/librustzcash/blob/main/CONTRIBUTING.md#pull-request-review), and [commit-message](https://github.com/zcash/librustzcash/blob/main/CONTRIBUTING.md#commit-messages) guidance when contributing there. Follow Zebra, o1Labs, and Zeko-specific instructions when those are the actual upstreams.

## Validate the proposal

Run these commands from the repository root with Ruby 3.3+ and Python 3.10+:

```sh
ruby scripts/validate_proposal.rb
python3 -m unittest discover -s tests -v
python3 scripts/build_package.py
python3 scripts/build_package.py --check
```

The source files are authoritative for the downloadable ZIP. Rebuild it whenever a packaged file changes. The archive excludes historical drafts, local machine files, and itself. The validation fixture mutations happen in temporary directories and do not modify the working proposal.

Future implementation changes must add meaningful tests for their actual acceptance boundaries. Mocked proof acceptance is not evidence that a bridge or consensus mechanism works. Record benchmark hardware, dependency revisions, commands, measured outputs, and remaining gaps; compare candidates against the same statement.

## Review and disclosure

Keep review scopes, reviewers' independence, findings, remediation, and intended-user acceptance evidence explicit. Report delays and unresolved assumptions without waiving acceptance to meet a date. Never publish custody keys, private witnesses, recovery secrets, credentials, or user-identifying test data. Coordinate suspected security issues privately with the project lead rather than including exploit details or secrets in a public issue.

## License

Original contributions are submitted under the repository's [MIT license](LICENSE). Preserve relevant third-party licenses, copyright notices, and attribution. Do not relicense copied Zcash, Zeko, or other upstream code through this repository's license.
