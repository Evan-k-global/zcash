# IronLimb

Private applications and DeFi for ZEC holders, using Zeko execution and Ethereum settlement.

IronLimb proposes a shielded-ZEC testnet bridge, proof-bound issuance, and a confidential ZEC/ETH exchange. Reusable verification, private accounting, and recovery components support a broader path to programmable ZEC applications.

**Status: pre-grant design and proposal.** This repository contains specifications, supporting research, and executable document-validation checks. No IronLimb bridge, application implementation, cryptographic benchmark, or security audit is claimed as completed. This is the IronLimb project repository; it does not contain the Zcash node implementation.

## Architecture and guarantees

- **Zcash:** shielded ZEC remains on its native chain. Testnet reserves are threshold-controlled.
- **Zeko:** private claims, programmable application constraints, recursive proofs, and atomic confidential order-book settlement.
- **Ethereum:** the selected proof-settlement environment and connections to supported assets, with deployment-specific verifier, data-availability, administrative, and exit assumptions.

Proof-verified deposits bind issuance to qualifying deposits. They cannot force reserve signers to redeem native ZEC. The separately gated consensus workstream investigates Zcash-enforced release on an isolated local network; public activation and production funds are outside this proposal. Shared Pasta proof foundations motivate cross-verification research, rather than establishing compatibility or performance by themselves.

The [technical design](ironlimb-technical-design-and-threat-model.md) contains the architecture schematic, six-point statements in both directions, proposed relation sketches, uniqueness candidates, accounting transitions, and a worked deposit/trade/redemption example. The initial exchange adapts Zeko's existing private order book for confidential zkZEC/zkETH trading. Partial fills are supported; each fill settles both asset legs atomically, and cumulative fills cannot exceed the authorized order quantity. Additional DeFi integrations and agent-payment policies are future applications, not baseline implementation promises.

## Read the project

| Document | Purpose |
| --- | --- |
| [Technical design and threat model](ironlimb-technical-design-and-threat-model.md) | Proposed relations, authority boundaries, accounting, privacy, and recovery |
| [Delivery, budget, and continuity](ironlimb-delivery-budget-and-continuity.md) | Gates, acceptance evidence, costs, team record, and network dependencies |
| [Cryptographic fit and alternatives](ironlimb-cryptographic-fit-and-alternatives.md) | Pasta/Kimchi/Halo2 rationale, alternatives, and benchmark questions |
| [References](REFERENCES.md) | Primary sources and what each supports |
| [Contribution guide](CONTRIBUTING.md) | Changes, reproducibility, validation, and upstream practices |

## Grant proposal

The proposed ZCG request is **$400,000 over 45 weeks**, starting January 4, 2027 and ending November 14, 2027 as a planning baseline. It includes $299,500 compensation (approximately 108.91 person-weeks, 2.42 FTE), $60,000 external services, and $40,500 hardware/software. Startup is included in those totals.

Gates 2 and 3 deliver the working testnet bridge and proof-enforced confidential exchange. The schedule preserves fourteen weeks for consensus integration and eight weeks for review/release. Gate 4 is $94,000; Gate 5 is $71,000 and includes approximately 9.82 team person-weeks, with at least 8 reserved for technical remediation and regression testing.

- [Copyable GitHub grant application](ironlimb-zcash-grant-application.md)
- [Community forum post draft](ironlimb-forum-post.md)
- [Downloadable proposal and resource snapshot](ironlimb-submission-package.zip)

The ZCG application has been submitted as [issue #540](https://github.com/ZcashCommunityGrants/zcashcommunitygrants/issues/540), with community discussion on the [IronLimb forum thread](https://forum.zcashcommunity.com/t/grant-application-ironlimb-private-defi-for-zec-on-zeko/58977). The ZCG issue is authoritative for the funding request and accepted changes; this repository holds the supporting evidence and a versioned application copy. Pin supporting links to the submission commit when filing and keep subsequent amendments explicit. The forum draft is for the discussion, not an additional required application attachment.

## Team and delivery

**Martin Ondejka (@MartinOndejka)** leads technical delivery through the **Zeko Labs engineering team**. **Evan Kereiakes (@Evan-k-global)** coordinates the application, reporting, and delivery evidence. The five budgeted workstreams allocate aggregate team effort rather than five distinct hires; Martin manages individual assignments against milestones and available capacity. Independent security review is separately budgeted and selected through a scoped engagement.

## Run the checks

Use Ruby 3.3+ and Python 3.10+; no third-party packages are required:

```sh
ruby scripts/validate_proposal.rb
python3 -m unittest discover -s tests -v
python3 scripts/build_package.py --check
```

These checks validate the proposal's budgets, effort, dates, staffing representation, required fields, local document links, license, and release snapshot. Negative fixtures exercise rejection of inconsistent budgets, dates, missing documents, and incorrect license/staffing states. They do not verify cryptography, privacy, custody, or an unimplemented bridge. The GitHub workflow runs the same checks.

To rebuild the download after editing source files:

```sh
python3 scripts/build_package.py
```

## License

[MIT](LICENSE). Copyright (c) 2026 Zeko Labs. Existing dependencies and cited third-party material retain their respective licenses and attribution.
