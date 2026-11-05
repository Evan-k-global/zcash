# IronLimb: Cryptographic Fit, Settlement Choice, and Alternatives

Supporting document 3 · November 5, 2026 · Source-backed rationale and benchmark hypotheses

## Application wording

IronLimb brings private applications and programmability to the Zcash ecosystem through Zeko execution and Ethereum settlement. Shared Pasta foundations make Zeko a natural cryptographic fit for testing cross-verification, while Ethereum provides the selected verifier infrastructure and connectivity to financial assets; implementation and benchmarks must establish the resulting guarantees.

## Why Ethereum is part of this design

The product goal is useful private financial applications for ZEC holders. Ethereum is selected for three practical reasons: access paths to financial assets and applications; an established security and developer-tooling ecosystem; and programmable proof verification and contract-enforced settlement. These capabilities allow the application work to proceed while Zcash-native extension and redemption mechanisms develop.

The settlement and execution choices remain distinct. Ethereum's transparent base ledger does not provide application confidentiality by default; its ecosystem also includes privacy technologies. IronLimb implements its own confidential note/accounting and exchange logic. [Ethereum privacy overview](https://ethereum.org/privacy/)

Ethereum proof acceptance does not automatically provide data availability, administrative safety, or access to every DeFi protocol. Zeko applications use zkApps rather than EVM bytecode, so external protocol composability needs separate integration. The initial RFQ market is a scoped application, not a promise of arbitrary private Ethereum yield access. [Zeko execution model](https://docs.zeko.io/about/faq), [Ethereum rollup architecture](https://ethereum.org/developers/docs/scaling/zk-rollups/)

Native ZEC remains subject to the Zcash-side custody mechanism. Gate 4 studies a local consensus-enforced alternative; actual production enforcement requires review and adoption. The Ethereum-settled design must also authenticate the canonical accepted checkpoint for redemption, not merely any valid Zeko proof.

## What is shared

ECC designed Pallas and Vesta for Halo2 and explicitly invited other projects to adopt them for shared analysis, engineering, and interoperability. The cycle relates the base field of each curve to the scalar field of the other, supporting efficient recursive constructions. [ECC announcement](https://zodl.com/the-pasta-curves-for-halo-2-and-beyond/)

Zcash's current specification identifies Halo2 for Ironwood Action proofs. Pickles uses Pasta for recursive Kimchi verification. Kimchi is a distinct PLONK variant; Pickles is its recursion layer. These are related cryptographic foundations, not interchangeable proof formats or an existing Ironwood verifier. [Zcash specification](https://zips.z.cash/protocol/protocol.pdf), [Kimchi specification](https://o1-labs.github.io/proof-systems/specs/kimchi/), [Pickles overview](https://o1-labs.github.io/proof-systems/pickles/overview/)

The shared foundations include inner-product-argument polynomial commitments and recursive-verification ideas. Common curve names do not prove every scalar and transcript computation is native in a particular circuit. Verifier transcripts, polynomial identities, encodings, commitment-opening rules, and deferred checks still require explicit implementation and validation.

## Why this matters for IronLimb

The proposed advantage is specific: implementing Zcash-related verification inside an application stack already built around Pasta arithmetic and recursive Kimchi proofs. That offers a plausible route to reducing some translation overhead and composing the result with application proofs.

It may also allow reuse of analyzed cryptographic primitives and relevant engineering expertise. Bridge safety still depends on the new relation, authenticated state, custody, accounting, and recovery rules. Shared primitives neither certify those rules nor provide independent cryptographic failure domains.

The output of Gate 1 must distinguish this architectural fit from measured superiority. No 10–100× cost claim, automatic native verification, or uniquely affordable bidirectional bridge is established by the current evidence.

## Why Ethereum settlement does not negate the fit

Zeko retains Mina-derived execution, zkApps, and proof formats while the selected Ethereum settlement path uses an SP1 adapter. [Zeko FAQ](https://docs.zeko.io/about/faq), [Ethereum settlement implementation](https://github.com/zeko-labs/ethereum-settlement)

The fit for IronLimb resides in that retained execution/proof layer. Converting a final proof for Ethereum verification does not remove its application-level arithmetic or recursion capabilities. Settlement choice introduces different security dependencies; it does not establish or disprove the proposed cross-verification advantage.

This answers the technical objection behind “why leave Mina.” The cited material documents the architecture, not a verified business motive for every strategic decision. IronLimb should not claim that Zeko changed settlement for Zcash or that its roadmap guarantees support indefinitely. The delivery document addresses that operational dependency directly.

## Alternatives

| Candidate | Relevant strength | Why IronLimb starts with Zeko; what must be tested |
| --- | --- | --- |
| **Mina** | Same Kimchi/Pickles family and TypeScript zkApp model | Curves alone cannot distinguish Zeko. IronLimb selects Zeko's Ethereum-connected execution/deployment path for its ETH-paired application. Compare complete acceptance paths if choosing between them. |
| **Ztarknet** | Proposed Cairo/STARK execution with Zcash settlement | Its proposal centers on a Zcash STARK-verification extension. IronLimb first delivers proof/claim infrastructure and trading without requiring public activation. Compare cryptographic cost, DA, and exits rather than claim STARK-based approaches cannot work. |
| **Aztec** | Integrated private/public execution, encrypted private state, and application tooling | It may reduce application-layer privacy work. IronLimb tests the Pasta-aligned verification route; any advantage must be weighed against the shielded-pool machinery IronLimb still has to build. |

Sources: [Mina zkApps](https://docs.minaprotocol.com/zkapps/writing-a-zkapp), [Ztarknet proposal](https://forum.zcashcommunity.com/t/proposal-ztarknet-a-starknet-l2-for-zcash/52926), [Aztec documentation](https://docs.aztec.network/).

No alternative is represented as incapable of Zcash integration. Upstream acceptance or consumption of IronLimb libraries is an opportunity, not a confirmed commitment.

## Benchmark that would establish the advantage

Fix the same deposit statement, security target, chain-authentication assumption, bundle size, hardware, and implementation coverage. Separate native verification, circuit/zkVM execution, full proof generation, and on-chain acceptance. Record non-native arithmetic, peak memory, latency, proof bytes, verifier cost, batching, and user witness burden.

Compare full bundle verification against note-opening/inclusion verification on the selected host. Compare an alternative host only with enough implementation coverage for a fair result; estimates must remain labeled. Benchmark the reverse Zeko-to-Zcash statement separately: accepting a deposit says nothing about enforceable native redemption.

If no external-host prototype is built, the report may establish feasibility on Zeko but cannot claim comparative superiority. Publish numerical continuation criteria before the final measurement pass and include unsuccessful routes.

## Positioning discipline

Use “natural cryptographic fit” and explain the actual connection IronLimb will build. A deployed, authenticated architecture is required before describing Zeko as an existing extension of Zcash. Support each claim with a source, benchmark, or explicitly proposed construction. The purpose of this alignment is to justify a focused engineering experiment with useful software outcomes, not to replace its evidence.

