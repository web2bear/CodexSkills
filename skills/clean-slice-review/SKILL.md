---
name: clean-slice-review
description: Review project architecture against Clean Architecture and Vertical Slices, producing a concise Markdown assessment with code evidence and actionable recommendations. Use for architecture reviews targeting these approaches, not routine bug reviews.
---

# Clean Architecture + Vertical Slices Review

Write the report in the user's requested language; otherwise follow their substantive request or conversation language. Localize headings, statuses, and recommendations. Keep code identifiers, paths, and source titles unchanged. English skill instructions and the default prompt do not determine the report language.

## Workflow

1. **Scope.** Accept a project, optional module/diff, target approach, and output path. Default to the workspace and `architecture-review.md`; use a numbered filename if it exists unless updating was requested. Read repository instructions, architecture notes, and dependency manifests. Record the date, commit/dirty state or diff revisions. Distinguish documented intent from observed design and assumptions.
2. **Trace.** Inspect imports, composition root, entry points, implementations, and tests. Sample a write, read, and rule-heavy/integration scenario where available, tracing each from input to outcome. Follow suspicious dependencies to both ends; demonstrate a cycle with its complete chain. Bound diff reviews to changes and affected callers/contracts.
3. **Assess.** Apply the checks below to the inspected scope. Use relevant existing tests or boundary checks when they resolve uncertainty; distinguish inspected tests from executed checks. Merge findings sharing a root cause. Missing evidence belongs in limitations, not findings.
4. **Deliver.** Fill [the report template](assets/report-template.md) in the user's language. Aim for 400–700 words and up to five detailed findings; list additional material risks briefly. Verify code links/lines and the saved UTF-8 file, then return its path and the main conclusion.

Review code and write the report; implementation changes require a separate request. Avoid migrations or production-data operations during verification.

## Evidence checks

| ID | Check | Evidence to inspect |
|---|---|---|
| R1 | Dependencies — Dependency Rule, DIP, ADP | Source dependency direction, contract ownership, component cycles. Distinguish runtime calls from source dependencies. |
| R2 | Boundary data | HTTP/UI/ORM types crossing a protected core boundary; adapters translating external representations. |
| R3 | Business rules | Location of invariants; whether rules can execute without UI, database, or network; decisions embedded in adapters. |
| R4 | Feature cohesion | A complete use case and its collaborators; unrelated modules requiring edits for a demonstrated feature change. |
| R5 | Slice coupling and sharing | Access to another slice's internals, hidden shared-data assumptions, explicit collaboration contracts, divergent copies of the same invariant. |
| R6 | Contract design — SOLID | When present: incompatible substitutions, unsupported interface methods, mixed responsibilities with confirmed change drivers, extension of a known variation. |
| R7 | Behavioral verification | Tests asserting scenario outcomes and boundary behavior; necessary validation, authorization, and transaction guarantees across inspected entry points. |
| R8 | Abstraction payoff | Concrete indirection or shared dispatch that complicates a traced scenario; identify what each abstraction protects before proposing removal. |

Do not infer quality from folder names, class length, file counts, DI, or MediatR. Omit lifecycle-cost, release-cohesion, and stability/abstractness scoring without relevant historical or release evidence.

## Judgment

Use **meets in sample / partial / violates / not applicable / insufficient evidence**, with reasons. Assess CA and VSA separately; avoid aggregate percentages. A hybrid still needs explicit protected boundaries.

Direct ORM access in a protected use case violates strict CA but may suit VSA. Record conformity separately from remediation value. Shared domain rules, a single-implementation port, and simple CRUD can be appropriate; none alone warrants a finding or a prescribed framework.

Prioritize by demonstrated impact: **P1** significant correctness or required-change blocker; **P2** concrete coupling/maintenance problem; **P3** localized improvement. Label conditional consequences as hypotheses; unresolved suspicions are questions. Recommend the smallest effective change and a way to verify it.

Consult [sources](references/sources.md) for attribution or disputed interpretations. Cite only relevant sources; preserve their verification limits and distinguish cached references from sources checked during this review.
