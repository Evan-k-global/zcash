# IronLimb: shielded ZEC deposits and confidential ZEC/ETH trading on Zeko

*Private applications for Zcash, powered by Zeko.*

Forum draft · November 5, 2026 · Not posted

We are proposing IronLimb to bring private application logic and programmability to the Zcash ecosystem through Zeko execution and Ethereum settlement. We will deliver a working shielded-ZEC testnet bridge, reusable deposit-verification components, and confidential ZEC/ETH trading. We are requesting **$400,000 over 45 weeks**, including a separately gated local prototype of Zcash-enforced redemption.

IronLimb is the application and interoperability project, while Ironwood remains the underlying Zcash shielded pool. The practical goal is straightforward: make ZEC useful in financial applications without exposing users' balances and trading amounts, while being clear about who controls native funds at every stage. The first public demonstration is a shielded test-ZEC deposit, a Zeko claim, and redemption back to Zcash. Proof-bound issuance and confidential atomic trading follow.

Applicant: **Zeko Labs Inc.** Application contact: **Evan Kereiakes (@Evan-k-global)**, contact@zeko.io. Our [maintainer record and prior work](https://github.com/zeko-labs/aaif/blob/main/MAINTAINERS.md) identify the existing team and contributions. Martin Ondejka (@MartinOndejka) leads the Zeko team delivering the technical work, drawing on its experience building the rollup with specialist cryptographic input and independent security review. We will select an external security reviewer from qualified existing relationships or Zcash-community-recommended specialists through an agreed scope and quote; no engagement is represented as confirmed. The budget represents aggregate team effort, with individual assignments managed by Martin against milestone requirements and available capacity; independent review is separately budgeted and intended-user validators are confirmed for the relevant gates.

## Why this architecture

Zcash provides shielded ZEC and cryptographic foundations compatible with Zeko's proof stack. Zeko executes programmable applications and aggregates their proofs. Ethereum provides the selected proof-settlement environment, developer tooling, and connectivity to financial assets and applications. The goal is to extend what ZEC holders can do privately while retaining a clear account of where execution, settlement, and native custody occur.

We choose Ethereum because private DeFi needs useful assets and application connections as well as a verifier. Its base ledger is transparent by default, so IronLimb must implement confidential application logic itself. Ethereum's ecosystem also has existing privacy technologies; our contribution is the Zcash-specific integration and its reusable proof infrastructure. [Ethereum privacy overview](https://ethereum.org/privacy/)

The first market is the confidential ZEC/ETH RFQ exchange. Settling on Ethereum does not automatically connect a zkApp to existing Ethereum contracts or provide liquidity. Additional protocol adapters, messages, and liquidity are future integration work. Proof settlement also leaves application, DA, administrative, and exit assumptions to be addressed explicitly. [Zeko execution model](https://docs.zeko.io/about/faq), [Ethereum rollup architecture](https://ethereum.org/developers/docs/scaling/zk-rollups/)

## Why Zeko

The most relevant connection is cryptographic. Zcash and Zeko's Mina-derived proof stack use the same Pasta curve cycle: Pallas and Vesta. ECC designed those curves for Halo2 and explicitly encouraged their adoption to support shared engineering and interoperability. Zeko's recursive Kimchi/Pickles application stack gives us a concrete place to investigate cross-verification on those foundations. [ECC's Pasta announcement](https://zodl.com/the-pasta-curves-for-halo-2-and-beyond/), [Pickles overview](https://o1-labs.github.io/proof-systems/pickles/overview/)

That is a reason to benchmark, not a benchmark result. Kimchi and Halo2 are different protocols; sharing curves does not supply a finished Ironwood verifier. We will compare full bundle verification with note-opening/inclusion verification under authenticated Zcash state, publish costs, and explain the assumptions of the selected construction.

Zeko's Ethereum settlement direction does not erase that relationship. It retains Mina-derived application execution and recursive proofs, with an adapter for Ethereum acceptance. IronLimb's fit depends on the retained proof layer; ETH connectivity supplies the other side of the proposed market. This does not claim Zeko moved to Ethereum for Zcash, or that the current permissioned testnet is a production trust model. [Zeko's current direction](https://docs.zeko.io/about/faq)

Mina shares these proof foundations. Ztarknet explores Cairo/STARK settlement on Zcash. Aztec provides integrated private application machinery. Our case for Zeko is the combination of Pasta-aligned cross-verification, recursive application proofs, and the Ethereum-connected execution path we can implement against. The comparison document explains the tradeoffs; we do not claim exclusive capability.

## What users will be able to test

The testnet bridge will handle shielded deposits, encrypted claims, threshold reserve operations, withdrawals/refunds, and recovery. At least 10 external testers will complete the documented round trip. This integration is the system the later proof-verified exchange will reuse. Its acceptance criteria include the complete round trip and operating procedures.

The exchange baseline is a confidential request-for-quote venue. A trader authorizes terms; one atomic transition settles both assets or neither. We will test minimum return, expiry, replay protection, conservation, encrypted note delivery, and recovery. Matchers or counterparties may see terms needed to fill orders. An AMM is comparison research rather than a prerequisite for this demonstration.

## Custody and privacy, stated separately

Native ZEC remains on Zcash. During testnet operation, a disclosed threshold signer set controls reserve notes. A valid deposit proof does not prevent those signers from refusing a withdrawal or misusing reserves. Replacing deposit attestation with proofs improves issuance verification; it does not remove custody trust.

The later consensus research addresses the reverse direction: Zcash verifying that a withdrawal follows accepted Zeko state, consumes the right claim, and authorizes exact transaction effects. It includes reserve reconciliation, migration, available recovery data, and failure drills. A mocked proof boundary will not satisfy that prototype. For the Ethereum-settled deployment, redemption must bind to the canonical Ethereum-accepted Zeko checkpoint under the specified finality model. Gate 4 demonstrates a local prototype; public consensus adoption and production custody migration remain separate processes.

We also separate confidential pool activity, shielded Zcash handling, and cross-boundary unlinkability. Fixed denominations, client proving, and batching help with particular observations; they do not establish complete anonymity. The leakage report covers public observers, custodians/operators, matchers, and network observers.

## Delivery and funding gates

| Gate | Duration | Payment | Concrete result |
| --- | --- | --- | --- |
| Startup | Setup | $5,000 | Reproducible environments and reporting |
| 1 | 5 weeks | $50,000 | Statements, measured feasibility, authentication design |
| 2 | 10 weeks | $85,000 | Working threshold-custody testnet bridge and 10 testers |
| 3 | 8 weeks | $95,000 | Real proof-bound issuance and confidential RFQ |
| 4 | 14 weeks | $94,000 | Local consensus custody/migration/recovery prototype |
| 5 | 8 weeks | $71,000 | Independent review, fixes, reproduced release |

The request covers $299,500 for 108.91 person-weeks of team effort (2.42 FTE over 45 weeks), $60,000 for external review and validation, and $40,500 for proving infrastructure, nodes, and tooling. These are planning allocations; the scope remains testnet software and a local consensus research prototype. The schedule preserves fourteen weeks for consensus integration and reverse-state authentication, followed by eight weeks for review, remediation, and verification. Gate 5 includes approximately 9.82 person-weeks of team effort, with at least 8 reserved for technical fixes and regression testing; its scope, reviewer slot, frozen snapshot, and named capacity must be established before it starts. Gate 1 validates the effort allocations; required consensus-prototype outputs remain in Gate 4.

Gate 1 must also cost how native redemption authenticates the canonical Ethereum-accepted Zeko checkpoint. That may require substantial finality-verification or proof-adapter work and is a continuation blocker if no sound route fits the agreed ceilings; Gate 4 cannot replace it with a trusted checkpoint.

A failed feasibility gate stops downstream work. A no-go is an honest research result, but it cannot replace undelivered software or permit spending the remainder on a different product. Intended-user representatives validate evidence; authors alone do not accept their own deliverables.

The network continuity plan covers Zeko support changes, Sepolia changes, and DA membership. We will retain deployment manifests and recovery material, exercise independent restoration, and pause affected acceptance when assumptions change. A new deployment will never silently inherit old claims.

## Public outputs and next steps

Original grant-funded software will be MIT licensed. The three supporting documents provide the technical threat model, budget/team/continuity plan, and sourced cryptographic comparison. Existing dependencies retain their licenses; previous Zeko component audits do not cover IronLimb. We have received no previous ZCG grants and have no other funding received or planned for IronLimb. Historical Zeko Labs/investor support for the existing stack is separate from the new work requested here.

When posting, link the three existing supporting documents or their issue attachments and insert the submitted GitHub application link. Martin manages team allocation and review arrangements through the delivery gates. The final forum post should link the issue and the issue should link this thread.

We welcome technical feedback on the deposit statement and uniqueness construction, the two proof routes, the reverse-verification interface, and what independent recovery must demonstrate. The ambition is native ZEC utility with confidential applications; the way to earn that claim is working code and reviewable evidence.
