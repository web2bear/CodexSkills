<!-- Translate all headings, labels, and prose into the user's language. Replace placeholders and remove this comment. -->
# Architecture review: {{project}}

{{Date · repository/scope · commit and dirty state or diff revisions}}
{{Documented approach / observed design / assumptions}}

## Assessment

{{2–3 sentences: separate CA and VSA verdicts, main reason, practical consequence.}}

| Check | Status | Code evidence or limitation |
|---|---|---|
| {{R1–R8: one row per check; localize its name}} | {{status}} | {{verified link or reason unavailable/inapplicable}} |

{{1–2 evidenced strengths, if present.}}

## Recommendations

### {{Priority · concise finding}}

- **Evidence:** {{symbol, verified file:line links, check ID; both ends of a dependency}}.
- **Impact:** {{observed consequence or explicitly conditional risk}}.
- **Change:** {{smallest useful fix and tradeoff}}.
- **Verify:** {{specific behavior test or dependency check}}.

{{Repeat for findings; if none, state that within the inspected scope.}}

## Coverage and limits

{{Traced scenarios; exclusions; executed checks and results versus inspection only; unresolved questions.}}

## Sources

{{Only sources actually used, linked with their purpose and any verification limits.}}
