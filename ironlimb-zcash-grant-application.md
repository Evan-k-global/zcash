# IronLimb — Zcash Community Grants Application

*Private applications for Zcash, powered by Zeko.*

<details>
<summary>Local filing instructions — exclude from the submitted issue</summary>

Revised November 5, 2026. Category verified against the live template: Research & Development is an available option. Top-level field names and ordering match the [current GitHub application template](https://github.com/ZcashCommunityGrants/zcashcommunitygrants/blob/main/.github/ISSUE_TEMPLATE/grant_application.yaml).

Copy only the contents of each code block into the corresponding field. For dropdowns, select the stated value. `Budget Rationale` is an explanatory YAML key added inside Milestone Details; it is not a field supplied by the ZCG template. Complete the live form's Terms and Conditions checkboxes yourself after reviewing them; no agreement or disclosure is made on your behalf here.

The application, forum draft, and three supporting documents are stored together in this project folder. Attach the three supporting files to the GitHub issue or supply accessible links; the supporting entries below link to the Zeko Labs main branch; pin them to the submission commit when filing. Applicant disclosures record no prior ZCG grants and no other IronLimb-specific funding; organizational support for the existing Zeko stack is disclosed under Other Funding Sources. Martin is accountable for technical delivery through the Zeko Labs engineering team. Workstream allocations are aggregate effort rather than five distinct hires; individual assignments and capacity will be managed against milestones. The applicant has confirmed the listed application owners and discovery path. The proposed schedule allocates fourteen weeks to Gate 4 and eight to Gate 5. Reviewer selection, operational assignments, and intended-user validation are managed through the delivery gates, not represented as completed engagements.

Draft scheduling assumption: funded work starts January 4, 2027 and finishes November 14, 2027. Milestone dates reflect 45 sequential weeks and must be updated if the funded start changes. Budget allocations below are proposed planning caps, not vendor quotations. No ZCG application has been submitted. This file is the repository proposal snapshot; once filed, the official ZCG issue governs the request and accepted amendments.


</details>

## Issue title

```text
Grant Application - IronLimb: Private DeFi for ZEC on Zeko
```

## Application Owners (@Octocat, @Octocat1)

```text
@MartinOndejka, @Evan-k-global, @zekoxyz
```

## Organization Name

```text
Zeko Labs Inc. — IronLimb
```

## How did you learn about Zcash Community Grants

```text
Through the Zcash Community Forum and prior Zcash ecosystem contacts.
```

## Requested Grant Amount (USD)

```text
$400,000
```

## Category

```text
Research & Development
```

## Project Lead

```yaml
Name: "Martin Ondejka (@MartinOndejka)"
Role: "Technical lead, Zeko Labs"
Background: "Martin leads the Zeko engineering team building its recursive zero-knowledge rollup. His core protocol work includes Ethereum settlement recovery and state updates gated by settlement finality. He has worked with specialist cryptographers and independent security auditors during Zeko's development. Prior work: https://github.com/zeko-labs/aaif/blob/main/MAINTAINERS.md ; assessment scopes: https://github.com/zeko-labs/zeko/tree/compatible/audits ."
Responsibilities: "Lead the Zeko team's delivery of IronLimb's verification components, protocol integration, confidential applications, and recovery design; coordinate specialist input and independent review."
```

## Additional Team Members

```yaml
- Name: "Zeko Labs engineering team, led by Martin Ondejka"
  Role: "Technical implementation team"
  Background: "Experience building Zeko's recursive rollup, bridge circuits, sequencer/prover pipeline, and recovery tooling. @zekoxyz is the Zeko Labs team maintainer account listed among the application owners; it is not an additional individual or a separate staffing allocation."
  Responsibilities: "Martin Ondejka leads technical delivery through the Zeko Labs engineering team. Budgeted workstreams represent aggregate team effort; individual implementation assignments will be managed against milestone requirements and available capacity. Independent security review is separately budgeted. Person-Weeks are rounded planning estimates; dollar allocations are authoritative."
  Budgeted Workstreams:
    - Role: "ZK implementation/circuit lead"
      Person-Weeks: 36
    - Role: "SP1/protocol engineer"
      Person-Weeks: 24
    - Role: "Zeko engineer"
      Person-Weeks: 30
    - Role: "Protocol reviewer"
      Person-Weeks: 15
    - Role: "Documentation/specification and startup coordination contributor"
      Person-Weeks: 3.91
- Name: "Evan Kereiakes (@Evan-k-global)"
  Role: "Application contact and delivery coordination"
  Background: "Zeko AAIF liaison and contributor of reference integrations, compatibility tests, reproducible evidence, and documentation."
  Responsibilities: "Coordinate the application, reporting, delivery evidence, and external review. Contact: contact@zeko.io."
```

## Project Summary

```text
IronLimb brings private application logic and programmability to the Zcash ecosystem through Zeko, using Ethereum for proof settlement and financial-asset connectivity. It will deliver a shielded-ZEC testnet bridge, confidential ZEC/ETH trading, reusable verification infrastructure, and a separately gated local prototype of Zcash-enforced redemption.
```

## Project Description

```text
IronLimb extends ZEC's utility into private financial applications: logic executes on Zeko, with proofs settled through Ethereum. The first deliverable is a working shielded-ZEC testnet bridge, followed by proof-bound issuance and confidential ZEC/ETH trading. We request $400,000 over 45 weeks for that software, reusable verification components, and a local prototype of Zcash-enforced redemption. The schedule preserves fourteen weeks for consensus integration and reverse-state authentication, followed by eight weeks for independent review, remediation, and verification. Gates 2 and 3 ship a usable testnet bridge and proof-enforced confidential exchange; the grant funds software delivery alongside the gated consensus research. The shared accounting, authenticated-state, and recovery components connect these deliverables, with independent acceptance and payment at each gate.

The architecture combines complementary capabilities. Zcash provides shielded ZEC and cryptographic foundations compatible with Zeko's Pasta-based Kimchi/Pickles stack. Zeko provides programmable execution and recursive application proofs. We choose Ethereum for its established proof-verification and contract-enforced settlement infrastructure, developer tooling, and connectivity to financial assets and applications. The grant will measure the cross-verification advantage of the shared cryptography.

This is a practical route to private applications for Zcash users while Zcash-native programmability and redemption mechanisms continue to develop. Ethereum's base ledger is transparent by default; IronLimb implements confidential application state and exchange logic rather than assuming privacy from settlement. The initial exchange is a ZEC/ETH RFQ venue. Access to other Ethereum DeFi protocols requires additional integrations and liquidity, beyond the baseline deliverable.

IronLimb is an application and interoperability project built around Zcash's existing Ironwood pool. Testnet reserves remain threshold-controlled, and Ethereum settlement does not remove that native custody dependence. Gate 4 investigates Zcash enforcing withdrawals from authenticated, accepted Zeko state on a local network. Production adoption remains separate, and the deployment's data-availability, administrative, and exit assumptions will be disclosed.
```

## Proposed Problem

```text
ZEC holders should be able to use programmable financial applications without exposing their balances and trading activity. Shielded Zcash protects native transfers, while Ethereum provides a developed environment for financial applications and proof settlement; connecting those capabilities requires private application execution and a sound cross-chain custody design.

A payment proof alone cannot compel a reserve signer to redeem ZEC, and Ethereum settlement alone cannot make application activity confidential. Builders need authenticated chain state, duplicate-resistant issuance, confidential asset accounting, and enforceable native-redemption rules. IronLimb develops these components together and publishes them for reuse beyond its initial exchange.
```

## Proposed Solution

```text
We will connect shielded ZEC to private Zeko applications with Ethereum settlement through five delivery gates:

1. Specify both verification directions, benchmark candidate constructions, and establish continuation criteria.
2. Ship an attested/threshold testnet bridge with deposits, withdrawals, refunds, and 10 external testers.
3. Enforce proof-bound issuance and demonstrate atomic confidential ZEC/ETH RFQ settlement.
4. Prototype Zcash-enforced escrow, liability migration, and recovery on an isolated local network.
5. Complete independent review, remediation, reproducible release, and a production-dependency decision.

Gate 2 establishes the bridge integration and operational workflows reused by Gate 3, which enforces proof-bound issuance and confidential exchange rules. Native custody remains threshold-controlled until consensus rules actually govern release; verifier rotation alone cannot change that.
```

## Solution Format

```text
MIT-licensed original code, public specifications, benchmark harnesses, reference fixtures, a testnet bridge, confidential RFQ application, local consensus prototype, integration guides, and external review/remediation reports.

Repositories include CONTRIBUTING.md, reproducible setup, CI, and monthly forum updates. Existing dependencies retain their licenses. The three supporting documents cover technical design, delivery/budget/continuity, and cryptographic fit.
```

## Dependencies

```text
The implementation depends on Zebra and current Ironwood libraries/rules, o1js and Kimchi/Pickles, Zeko execution interfaces, Ethereum settlement contracts, and the selected proof adapters. Any SP1 receipt relied upon by issuance must be enforced in the acceptance path. The testnet requires custody signers and proving resources. External DeFi integrations and liquidity are separate dependencies, not automatic consequences of Ethereum settlement.

Zeko is a network dependency as well as a code dependency. We will record deployment identity, roles, verifier mode, and DA signers, retain an independently reproducible stack, and test restoration. If upstream support or Sepolia changes, affected deposits pause; resumption requires revalidation or an explicitly identified replacement test deployment. No silent balance migration or network substitution is allowed.

Martin leads technical work. An external security reviewer will be selected from qualified existing relationships or Zcash-community-recommended specialists, subject to availability, an agreed scope, and a quote. No engagement or community endorsement is represented as confirmed. Intended-user validation is separate: integrating Zeko builders, external testnet users, and a Zcash protocol reviewer or technical delegate for consensus work; individuals remain to be confirmed. Mainnet Zcash-enforced custody also requires consensus adoption; the local prototype does not assume it. No upstream endorsement or merge is claimed.
```

## Technical Approach

```text
IronLimb reuses Ironwood and Kimchi/o1js implementations, adding verifier and application constraints rather than a new proof system. Gate 1 compares full bundle verification (A) with note-opening/inclusion under authenticated state (B). The following are proposed security requirements, not implemented results.

Deposit statement:
1. The qualifying commitment is included under an authenticated anchor in accepted canonical Zcash history.
2. Its opening binds the amount and designated custody recipient.
3. The resulting private credit belongs to the authorized Zeko recipient.
4. The deposit cannot be credited twice, including across retries and upgrades; uniqueness must meet the declared leakage target.
5. Network, pool, bridge instance, protocol version, and verification key are bound into acceptance.
6. Any required encrypted-note delivery or memo binding is checked.

Redemption statement (Gate 4's proposed consensus path):
1. The checkpoint is canonical Ethereum-accepted Zeko state under the specified finality and deployment rules; an unrelated valid history is insufficient.
2. The withdrawal follows that state and is authorized by the claim holder.
3. The claim cannot be redeemed twice, traded while pending, or both refunded and paid.
4. Authorization binds the exact Zcash transaction effects, including recipient, amount, and fees.
5. Release preserves reserve/liability accounting and the specified remaining escrow state.
6. Zcash enforces the selected release/recovery rules and domain bindings, without an undisclosed signer bypass.

Worked example (Gate 3 testnet; fees omitted):
Alice deposits 10 test ZEC to the threshold-controlled Zcash reserve and receives 10 private zkZEC claims after proof-verified acceptance. ZEC stays on Zcash; the claims live on Zeko. She atomically trades 4 zkZEC for a maker's agreed zkETH amount, leaving her 6 zkZEC and the maker 4. Both parties authorize the terms; the matcher may learn them, and a sequencer can censor submission. The native reserve still holds 10 ZEC. Alice requests redemption of her remaining 6; those claims become unavailable for trading. Reserve signers pay her Zcash recipient, then the claims are finalized against authenticated payout confirmation. The remaining 4 ZEC backs the maker's claims. The custody threshold can steal reserves or refuse payment despite correct proofs; the ETH leg has separate bridge assumptions. Gate 4 researches replacing signer discretion with enforceable release rules.

Gate 1 benchmark questions:
- What are A/B constraint counts, proving time, peak memory, proof size, and verification costs on named hardware?
- What does canonical Zcash authentication cost, including difficulty, upgrades, reorganizations, and anchor freshness?
- Which transcript, encoding, field-arithmetic, and recursion adapters are required?
- Which uniqueness construction prevents repeat credit, what secrets does it require, and what linkage survives rotation or reserve spending?
- How can Zcash authenticate canonical Ethereum-accepted checkpoints, and what are the complete finality-verification/adapter costs?
- Does each complete acceptance path fit precommitted resource ceilings with real proofs, exact public outputs, and adversarial fixtures?

An infeasible reverse-authentication path blocks continuation unless an amended scope is approved. Signed roots, guest execution alone, and mock acceptance cannot satisfy proof-verified gates. Gate 4 uses an isolated local Zebra branch; public activation is separate.

RFQ settlement enforces per-asset conservation, current nullifier state, minimum return, expiry, and replay protection. We measure public, operator, matcher, and network leakage and test encrypted-note recovery. The UI discloses threshold custody, verifier mode, and administrative powers. Migration requires reserve reconciliation; commitments and OP_RETURN anchors establish neither data availability nor enforced custody.

The technical design contains branch-neutral relation sketches, accounting transitions, and validation order. Mina shares the proof foundations; Zeko supplies the selected Ethereum-connected execution path. The alternatives document compares Mina, Ztarknet, and Aztec without unmeasured speed or uniqueness claims.
```

## Upstream Merge Opportunities

```text
Candidate Zcash contributions include Ironwood fixtures, validation/tooling improvements, and a local Zebra research branch. A concrete extension proposal can follow the ZIP process if results justify it. o1Labs/Zeko contributions may include verifier components, differential fixtures, and adapters in the appropriate language and repository.

Seek maintainer feedback at Gate 1 and submit small reviewable changes as ready. Upstream contribution requirements apply. Delivery does not depend on a merge, endorsement, or mainnet activation.
```

## Open Source License

```text
MIT
```

## Hardware/Software Costs (USD)

```text
$40,500
```

## Hardware/Software Justification

```text
Planning caps: $20,000 for CPU/GPU proving; $14,000 for isolated nodes, test environments, and CI (including $4,000 of startup infrastructure); $6,500 for storage, backups, and observability. Total: $40,500. Track usage and refine allocations from Gate 1 measurements. No liquidity or trading capital is included.
```

## Service Costs (USD)

```text
$60,000
```

## Service Costs Justification

```text
Planning caps: $50,000 for independent review of a named circuit/accounting/custody/recovery scope and remediation verification; $10,000 for external integration, reproducibility, and leakage testing. Total: $60,000. An external reviewer will be selected from qualified existing partners or Zcash-community-recommended specialists through a scoped engagement and quote; no firm is represented as committed. Review scope is published; this amount does not imply a comprehensive production audit.
```

## Compensation Costs (USD)

```text
$299,500
```

## Compensation Costs Justification

```text
ZK implementation/circuit lead: $2,750/week × 36 = $99,000.
SP1/protocol engineer: $2,750/week × 24 = $66,000.
Zeko engineer: $2,750/week × 30 = $82,500.
Protocol reviewer: $2,750/week × 15 = $41,250.
Documentation/specification and startup coordination: $10,750, approximately 3.91 person-weeks at $2,750/week, including $1,000 startup compensation.
Total: $299,500; approximately 108.91 person-weeks and 2.42 FTE over 45 weeks. Effort is calculated from compensation divided by the planning rate and rounded; the $1,000 startup compensation is included, not additional. We use one internal planning rate of $2,750 per 40-hour person-week ($68.75/hour) for all workstreams. It prices pooled team capacity rather than asserting that each contributor receives the same salary; it is not a confirmed individual salary or vendor quote. The allocation covers both verification directions, authenticated-state integration, confidential exchange, recovery, and remediation. Martin leads delivery; Martin will manage individual assignments and available capacity against the funded milestones. External review is separately budgeted; milestone payments include all categories.
```

## Total Budget (USD)

```text
$400,000
```

## Previous Funding

```text
No
```

## Previous Funding Details

```text
N/A. We have not received previous funding from Zcash Community Grants.
```

## Other Funding Sources

```text
Yes
```

## Other Funding Sources Details

```text
Zeko Labs and its investors have supported development and infrastructure for the existing Zeko stack, as disclosed in our AAIF proposal: https://github.com/aaif/project-proposals/issues/68 . We disclose that organizational support here because the applicant is Zeko Labs Inc.

No other funding has been received or is planned for IronLimb itself. The request covers new Zcash-specific verification, integration, exchange, and consensus research. Existing Zeko code and prior audits are background assets, not newly funded deliverables. Costs already supported elsewhere are excluded, and grant work will be tracked separately to prevent duplicate funding.
```

## Implementation Risks

```text
Proof cost or chain-authentication errors could prevent safe issuance; Gate 1 measures the routes and rejects an infeasible design. Threshold collusion or unavailability remains a native custody risk until consensus enforcement. Bugs or leakage in the note pool can break privacy/accounting; differential and adversarial tests precede review.

Ethereum settlement verifies the encoded state-transition rules; it does not certify application correctness, make data available by itself, or remove administrative powers. Network support, Sepolia changes, and DA membership can interrupt service. The continuity plan requires backups, independent deployment/recovery exercises, deposit pauses, and explicit revalidation. It does not promise liveness after all operators disappear.

Authenticating canonical Ethereum-accepted Zeko state may require substantial additional proof and consensus work; it is a separately costed Gate 1 feasibility dependency and can block continuation. Zcash-enforced redemption may remain impractical or unadopted. Gate 4 delivers a local research prototype, not public activation. Prior core audits do not cover IronLimb.

Gate 1 failure stops downstream work; Gate 2 failure stops exchange integration; Gate 3 failure stops consensus integration; Gate 4 failure blocks a production recommendation. A negative research result can complete Gate 1, but cannot replace undelivered later software or authorize spending on another product. Material scope changes require an agreed grant amendment.
```

## Potential Side Effects

```text
Users may confuse proof-verified issuance with trustless custody or confidential trading with boundary unlinkability. UI disclosures separate those guarantees and identify matcher/timing/network leakage. Fixed denominations and batching are mitigations, not anonymity proofs.

ETH adds separate bridge and issuer/asset-mapping assumptions. Unsupported legacy claims cannot become certified backing through a verifier change. Test assets and deployment identities remain explicit. Local consensus code stays isolated; no mainnet user funds or public consensus changes are completion metrics.
```

## Success Metrics

```text
- Reproducible candidate-verifier costs and a reviewed Gate 1 continuation decision.
- A working threshold-custody testnet round trip completed by at least 10 external testers.
- Real proof-bound issuance under authenticated state; invalid proof, duplicate claim, wrong recipient/domain, and reorganization fixtures rejected.
- Atomic confidential ZEC/ETH RFQ settlement; no unauthorized, expired, below-limit, or partial fill succeeds in the test suite.
- An intended-user representative reproduces the worked example from a clean deployment: deposit 10 test ZEC, trade 4 zkZEC for agreed zkETH, redeem the remaining 6, and reconcile claims and reserves against the documented fixture, with fees funded and recorded separately.
- Published proving and leakage results for public, operator, matcher, and network observers.
- A reproducible local escrow/migration/recovery prototype and explicit outcomes for censorship, shutdown, and missing data.
- Independent review, remediation evidence, integration documentation, and a versioned release.

Intended-user representatives or delegates validate each milestone using published commands and workflows. Confirm their identities before work starts; authors alone do not accept their own deliverables. Post monthly progress and milestone evidence to the forum.
```

## Startup Funding (USD)

```text
$5,000
```

## Startup Funding Justification

```text
Startup totals $5,000: $4,000 hardware/software for repository/CI infrastructure and reproducible environments; $1,000 compensation for dependency inventory and reviewer/validator scheduling (approximately 0.36 person-weeks at $2,750/week); $0 external services. These amounts are included in the category totals and $400,000 request, not added to them. Startup plus all milestone payments equals the total; no liquidity or mainnet launch expense is added.
```

## Milestone Details

```yaml
- Milestone: 1
  Amount (USD): 50000
  Budget Rationale: "Compensation $42,000 (approximately 15.27 person-weeks); infrastructure $6,000; independent validation $2,000. Funds both-direction statements, candidate-verifier measurements, and the complete Ethereum-accepted checkpoint authentication design and cost assessment."
  Expected Completion Date: "2027-02-07"
  User Stories:
    - "As an integration developer, I want exact deposit and redemption statements so that I can understand what the proofs enforce."
    - "As a grant reviewer, I want reproducible measurements and continuation thresholds so that later funding rests on evidence."
  Deliverables:
    - "Specifications for both directions, accounting, nullifier options, authentication, migration, and privacy."
    - "Candidate-verifier benchmarks with pinned dependencies and a reviewed continuation decision."
  Acceptance Criteria:
    - "The agreed technical representative reproduces the available benchmark harness."
    - "The report labels measured results, estimates, and unimplemented components separately."
    - "Numerical resource ceilings are recorded before the final candidate comparison."
    - "The technical lead validates the proposed effort allocation against measured scope and named team capacity; any shortfall requires an agreed amendment rather than deferring required Gate 4 outputs into Gate 5."
    - "The selected route specifies the real-proof and authenticated-state acceptance path."
    - "The reverse-verification design identifies the required Zcash changes and the canonical Ethereum-accepted Zeko checkpoint authentication/finality assumptions."
    - "The report costs the complete reverse authentication path against the agreed ceilings and records infeasibility as a continuation blocker, not an attestation fallback."
    - "A negative continuation decision stops downstream work and does not substitute for later deliverables."

- Milestone: 2
  Amount (USD): 85000
  Budget Rationale: "Compensation $73,000 (approximately 26.55 person-weeks); infrastructure $9,000; external integration validation $3,000. Funds shielded wallet and claim integration, threshold reserve operations, withdrawals/refunds, recovery, UI disclosures, and validation with at least 10 external testers."
  Expected Completion Date: "2027-04-18"
  User Stories:
    - "As a testnet user, I want to deposit shielded test ZEC and redeem my claim so that I can evaluate the complete bridge workflow."
    - "As an operator, I want documented signer and recovery procedures so that I can restore the deployment and explain its trust model."
  Deliverables:
    - "Working testnet bridge with encrypted claims, threshold signing, withdrawals/refunds, and UI disclosures."
    - "Deployment/recovery manifest, negative tests, demo, and completed workflows from at least 10 external testers."
  Acceptance Criteria:
    - "User representatives reproduce a shielded deposit, claim issuance, and redemption round trip."
    - "User representatives reproduce each specified refund and error workflow."
    - "Threshold custody is configured before external testing begins."
    - "The UI identifies attested issuance, custody threshold, verifier mode, and administrative powers."
    - "An operator reproduces restoration from the recorded deployment and recovery material."
    - "At least 10 external testers complete the documented workflow and their results are recorded."

- Milestone: 3
  Amount (USD): 95000
  Budget Rationale: "Compensation $81,500 (approximately 29.64 person-weeks); infrastructure $8,500; external leakage/reproducibility validation $5,000. Funds selected deposit/authenticated-state proof integration, differential and adversarial fixtures, encrypted-note accounting and recovery, atomic RFQ constraints, and proving/leakage instrumentation."
  Expected Completion Date: "2027-06-13"
  User Stories:
    - "As a builder, I want deposit proofs enforced under authenticated Zcash state so that issuance does not depend on deposit attestation."
    - "As a trader, I want an atomic confidential ZEC/ETH exchange so that either my authorized trade settles completely or neither leg executes."
  Deliverables:
    - "Selected proof components with real accepted-root/deposit verification and differential/negative fixtures."
    - "Encrypted-note pool, atomic RFQ, note recovery, performance/leakage report, and bounded AMM comparison."
  Acceptance Criteria:
    - "A builder representative reproduces real-proof issuance before exchange integration."
    - "No attestation or mock verifier bypass is used in the proof-verified acceptance path."
    - "Invalid proofs, wrong domains/recipients, duplicate claims, and specified reorganization cases fail."
    - "Trader representatives reproduce complete atomic settlement."
    - "An intended-user representative reproduces the deposit-10, trade-4, redeem-6 worked example from clean setup, with request-bound payout evidence, post-step balances, separately funded/recorded fees, and reserve/liability reconciliation recorded."
    - "Double spends, expired orders, unauthorized outputs, and below-limit fills are rejected."
    - "The report separately measures public, operator, matcher, and network leakage."
    - "The UI continues to identify native reserve custody as threshold-controlled."

- Milestone: 4
  Amount (USD): 94000
  Budget Rationale: "Compensation $75,000 (approximately 27.27 person-weeks); infrastructure $9,000; external security review $10,000. Funds the Gate 1-approved reverse authentication path and native withdrawal rules in local Zebra, migration/opening-state fixtures, DA/recovery drills, and design review. Feasibility of that path is a prerequisite, not an assumed funded result."
  Expected Completion Date: "2027-09-19"
  User Stories:
    - "As a Zcash developer, I want executable native-redemption rules so that I can assess the consensus change and its resource costs."
    - "As a claim holder, I want migration and recovery to preserve backing so that unsupported liabilities cannot be certified through an upgrade."
  Deliverables:
    - "Reverse-verification/escrow specification and isolated local Zebra prototype binding accepted Zeko checkpoints to exact withdrawal effects and validation bounds."
    - "Reconciliation/migration fixtures, opening state, DA requirements, reconstruction and failure drills, and review findings."
  Acceptance Criteria:
    - "A protocol representative reproduces real-proof acceptance on the isolated local prototype."
    - "A mocked or attested checkpoint acceptance boundary does not satisfy the prototype; it enforces the Gate 1-approved canonical-checkpoint authentication path."
    - "Unauthorized withdrawal effects, duplicate redemption, and checkpoints outside the specified canonical acceptance path are rejected."
    - "Migration fixtures reject certification of unsupported historical liabilities."
    - "Claimed independent exits succeed under the documented failure assumptions."
    - "Missing-data and censorship results identify unresolved recovery dependencies as blockers."
    - "Public activation and upstream merge are excluded from local-prototype acceptance."
    - "Gate 5 readiness is recorded: confirmed reviewer scope and slot, frozen code/design snapshot, reproducible build/test commands, and named capacity for the budgeted 9.82 team person-weeks, including at least 8 for technical remediation and regression testing."

- Milestone: 5
  Amount (USD): 71000
  Budget Rationale: "Compensation $27,000 (approximately 9.82 person-weeks); infrastructure $4,000; external security review and remediation verification $40,000. Funds independent findings, team fixes, reproduced supported workflows, versioned release, integration documentation, and handoff; at least 8 person-weeks are reserved for technical remediation and regression testing, with the balance for coordination, reproduction, and handoff. The eight-week window plans review in weeks 1–4, remediation in weeks 5–7, and re-verification/reproduction in week 8; engagement scope and team capacity must support that sequence."
  Expected Completion Date: "2027-11-14"
  User Stories:
    - "As an integrating developer, I want reviewed code and reproducible examples so that I can assess whether to use IronLimb components."
    - "As a grant reviewer, I want findings mapped to fixes and release evidence so that I can verify completion and remaining production dependencies."
  Deliverables:
    - "External review, findings, fixes, remediation verification, and final proof/exchange/recovery runs."
    - "Versioned release, integration/handoff guides, CONTRIBUTING.md, evidence index, and production-dependency decision."
  Acceptance Criteria:
    - "The review report identifies its author, independence, and exact code/design scope."
    - "Each finding has an evidenced disposition and remediation status."
    - "Acceptance depends on completed deliverables and verified remediation. Delays require an updated schedule; elapsed time does not constitute acceptance."
    - "User representatives reproduce the documented supported workflows."
    - "The release includes setup, integration, contribution, and handoff documentation."
    - "Unresolved critical custody, accounting, proof, or recovery issues block a production recommendation."
    - "A no-go conclusion does not replace undelivered code, testing, or review."
    - "Material scope changes require an agreed grant amendment."
```

## Supporting Documents

```yaml
- File Name: "ironlimb-technical-design-and-threat-model.md"
  Description: "Technical design: statements, accounting, adversaries, privacy, migration, and required tests. Source: https://github.com/zeko-labs/zcash/blob/main/ironlimb-technical-design-and-threat-model.md"
- File Name: "ironlimb-delivery-budget-and-continuity.md"
  Description: "Delivery plan: budget, acceptance evidence, team record, review scope, and network continuity. Source: https://github.com/zeko-labs/zcash/blob/main/ironlimb-delivery-budget-and-continuity.md"
- File Name: "ironlimb-cryptographic-fit-and-alternatives.md"
  Description: "Cryptographic rationale, alternatives comparison, Mina/Ethereum architecture, and benchmark plan. Source: https://github.com/zeko-labs/zcash/blob/main/ironlimb-cryptographic-fit-and-alternatives.md"
```
