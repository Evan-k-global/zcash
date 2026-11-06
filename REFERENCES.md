# IronLimb references

Copyright (c) 2026 Zeko Labs. SPDX-License-Identifier: MIT.

Sources reviewed November 5, 2026. These links support the proposed design and team record; they do not establish completed IronLimb implementation, performance, an engagement, or upstream endorsement. Protocol and deployment status must be revalidated against pinned revisions during Gate 1.

| Source | What it supports |
| --- | --- |
| [Zcash protocol specification](https://zips.z.cash/protocol/protocol.pdf) | Shielded-pool relations, proof-system details, commitments, and consensus rules |
| [ZIP 258](https://zips.z.cash/zip-0258) | Ironwood deployment specification and status |
| [ZIP 222](https://zips.z.cash/zip-0222) | Proposed TZE framework; research context, not proof that the required public custody rules exist |
| [ECC Pasta announcement](https://zodl.com/the-pasta-curves-for-halo-2-and-beyond/) | Curve design and intended reuse/interoperability |
| [o1Labs proof systems](https://o1-labs.github.io/proof-systems/) | Kimchi/Pickles specifications and implementation context |
| [Pickles overview](https://o1-labs.github.io/proof-systems/pickles/overview/) | Recursive proof machinery, distinct from a finished Ironwood verifier |
| [Zeko FAQ](https://docs.zeko.io/about/faq) | zkApp execution model and architecture |
| [Zeko Ethereum settlement](https://github.com/zeko-labs/ethereum-settlement) | Verifier and settlement implementation to pin and inspect |
| [Zeko settlement security model](https://ethereum.docs.zeko.io/reference/security-model) | Deployment-specific verifier, administrative, DA, and exit assumptions |
| [Independent Sepolia runbook](https://docs.zeko.io/operators/guides/launch-sepolia-rollup) | Reproducible operator deployment; mock defaults must not be mistaken for real proof acceptance |
| [Ethereum rollup architecture](https://ethereum.org/developers/docs/scaling/zk-rollups/) | Settlement/DA distinctions; settlement alone is not application privacy or automatic composability |
| [Ethereum privacy overview](https://ethereum.org/privacy/) | Privacy context beyond Ethereum's transparent base ledger |
| [Zeko audit index](https://github.com/zeko-labs/zeko/tree/compatible/audits) | Historical component assessments; these do not audit IronLimb |
| [ZCG application template](https://github.com/ZcashCommunityGrants/zcashcommunitygrants/blob/main/.github/ISSUE_TEMPLATE/grant_application.yaml) | Form fields, license selection, contribution expectations, and forum requirement |
| [Zcash contribution guidance](https://github.com/zcash/librustzcash/blob/main/CONTRIBUTING.md) | Primary style and review reference for relevant upstream work |
| [MIT license text](https://opensource.org/license/mit) | License used for original material in this repository |

The [technical design](ironlimb-technical-design-and-threat-model.md) and [alternatives comparison](ironlimb-cryptographic-fit-and-alternatives.md) explain how these sources enter the architecture and which assumptions still need measurement or review.
