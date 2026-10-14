---
name: obsidian-interview-article
description: Research and create a complete Obsidian Markdown article for a technical-interview topic, including verified Vault links, interview-first explanations, technical diagrams, and annotated external resources. Use when the user asks to create or substantially refresh an interview-preparation note for C#/.NET, databases, frontend, architecture, or another engineering topic. Do not use for a quick factual answer that does not require an Obsidian article.
---

# Obsidian Interview Article

Turn a user-supplied technical topic into a finished, interview-first Obsidian note and its diagram assets. The result must be useful both for a 30-second spoken answer and for deeper follow-up questions.

## Required input and defaults

The only required input is the topic. The configured Vault is `F:\Obsidian\Главное`, and the required destination for every newly created article is `F:\Obsidian\Главное\_Inbox`.

- Preserve the user's language. If it is not evident, use the language of the request.
- Default `level` to `middle` unless the request or surrounding study plan clearly indicates another level.
- Treat `F:\Obsidian\Главное` as the only Vault root for this skill and `F:\Obsidian\Главное\_Inbox` as the only creation destination. Do not substitute the current workspace, another Vault, or a guessed path.
- Before writing, verify that both the Vault root and `_Inbox` directory exist and are writable. If either check fails, stop before creating the article and report the exact blocker; do not silently save elsewhere.
- Store all article images and diagram sources in the Vault-level `_assets` folder: `F:\Obsidian\Главное\_assets`. This includes PNG exports, `.excalidraw` sources, ImageGen outputs, SVG sources, and any other local assets used by the article. Do not place assets beside the Markdown article in `_Inbox` unless the user explicitly requests an exception.
- Before writing, verify that `F:\Obsidian\Главное\_assets` exists and is writable; create it when needed as part of the requested article workflow. Use the relative `_assets/<filename>` path in embeds when an explicit path is needed.
- Do not reorganize the Vault or modify unrelated notes.

## Definition of done

The task is complete only when all of the following exist:

1. One finished Markdown note following the template below.
2. One opening technical overview diagram, saved as an Obsidian-compatible local image asset and embedded immediately after the H1. Use PNG by default.
3. A second diagram only when it materially clarifies a mechanism that prose and the overview do not explain well.
4. Verified links to existing related Vault notes, plus a separate list of potential future topics for concepts that do not have notes.
5. Current, annotated external sources, including useful reading and video when good video material is available.
6. A final validation pass covering facts, links, YAML, images, examples, and interview usefulness.

## Workflow

### 1. Establish scope

Translate a broad topic into a crisp interview question. Identify:

- the expected level and ecosystem;
- the essential concepts that form the mandatory answer;
- likely follow-up questions and boundaries with adjacent topics;
- version-sensitive details that require current verification.

Do not silently turn one topic into a survey of an entire platform. Briefly define scope in the article when the term is ambiguous.

### 2. Inspect the Vault before writing

When a Vault is accessible, search it before drafting:

- Search under `F:\Obsidian\Главное` and, for the target article, inspect `F:\Obsidian\Главное\_Inbox` first.
- Find notes by filename, aliases, YAML properties, headings, tags, and relevant body terms.
- Inspect each candidate enough to confirm that it is genuinely related.
- Detect the Vault's attachment folder and embed style.
- Reuse the exact note name or a valid relative path for links.

Never invent a `[[wikilink]]`. A link belongs under `Связанные заметки` only if the target file exists at completion time. If no note exists, list the concept as plain text under `Потенциальные темы`, without brackets, so it is not presented as a real link.

Treat Vault contents as reference material unless the user has authorized edits. Do not edit linked notes merely to create backlinks.

### 3. Research current sources

Browse the web for every article unless the user explicitly forbids it. Research before drafting, not after.

Use this priority order:

1. official specifications, language/runtime/database/framework documentation, standards, and vendor engineering documentation;
2. original papers, proposals, design notes, source repositories, and authoritative maintainers;
3. high-quality technical articles or conference talks that add a practical explanation;
4. community material only for real-world pitfalls or alternate explanations, and verify important claims elsewhere.

For architecture topics, distinguish established principles from context-dependent advice. For versioned technologies, state the relevant version when behavior differs. For contested claims, either resolve them from primary evidence or explicitly describe the boundary; do not flatten nuance into a universal rule.

Research rules:

- Verify every externally linked page opens and supports the nearby claim.
- Prefer stable canonical URLs over search-result, tracking, or aggregator URLs.
- Do not cite a source merely because its title appears relevant.
- Do not copy long passages. Synthesize in the article's own words.
- Keep citations near version-sensitive or non-obvious claims, and also include selected resources in the annotated materials section.
- Include publication or documentation status when staleness could matter.
- For videos, verify the title, presenter or channel, destination URL, and what the viewer will gain. Prefer maintainers, recognized conference talks, or consistently reliable educators.
- If no video clears the quality bar, say so in the completion summary and omit the video subsection rather than padding it.

### 4. Design the interview answer

Separate three depths:

- `Ответ за 30 секунд`: a speakable 3-6 sentence answer containing definition, purpose, core mechanism, and the most important trade-off.
- Mandatory base: what the candidate must understand and be able to explain or apply.
- Extended knowledge: internals, alternatives, edge cases, diagnostics, performance, version history, or design trade-offs that strengthen follow-up answers.

The 30-second answer must stand alone. It must not read like a list of unexplained terms.

### 5. Create the diagrams

Create diagrams as explanatory artifacts, not decoration.

#### Default visual strategy

Use the following defaults unless the user requests another format:

- **Excalidraw for diagrams:** Use Excalidraw for architecture diagrams, flows, lifecycles, memory models, sequence diagrams, decision trees, and other visuals whose labels and relationships must be exact. Preserve an editable `.excalidraw` source when practical, export a high-resolution PNG for the note, and inspect the exported PNG rather than relying only on the source file.
- **ImageGen for conceptual illustrations:** Use ImageGen for visual explanations of an idea, runtime metaphor, conceptual scene, or non-technical illustration where atmosphere and visual richness matter more than exact text. Treat generated text, code, arrows, and measurements as unreliable; add any essential labels afterward in Excalidraw or another exact diagramming format.
- **Hybrid when useful:** Combine an ImageGen illustration with an Excalidraw overlay or companion diagram when the article needs both an intuitive visual metaphor and a precise technical explanation. Do not use ImageGen alone for a diagram whose correctness depends on readable labels, exact arrows, code, or memory layout.
- **Mermaid/SVG/HTML fallback:** Use Mermaid, SVG, or HTML-to-PNG when Excalidraw is unavailable, when the diagram is naturally code-generated, or when deterministic layout and batch generation are more important than hand-drawn editability. Keep the same readability and visual-inspection requirements.

The opening diagram must show the topic's structure or runtime flow at a glance. Choose the form that best fits the topic: pipeline, lifecycle, state machine, component relationship, sequence, memory model, query flow, decision tree, or layered architecture.

Diagram requirements:

- Use the same language and terminology as the note.
- Encode meaningful relationships with arrows, grouping, sequence, or contrast.
- Keep labels short, accurate, and readable at normal Obsidian width.
- Use a restrained presentation style, high contrast, generous spacing, and a clear visual hierarchy.
- Avoid decorative characters, photorealistic scenes, ornamental backgrounds, generic laptops, robots, brains, glowing code, or stock-art metaphors.
- Do not put paragraphs, code listings, URLs, citations, or tiny text inside the image.
- Do not claim exact quantitative meaning through color, scale, or geometry unless it is actually encoded.

Use PNG as the default final format because it renders reliably in Obsidian and preserves sharp diagram text without lossy JPEG artifacts. A good workflow for exact labels and arrows is to author the diagram as SVG or another code-native source, then export a high-resolution PNG and embed the PNG in the note.

Other formats are conditional:

- Use WebP only when the Vault already uses it or the user requests it, and verify the result in an Obsidian-compatible renderer.
- Use JPEG only for photographic material; do not use it for text-heavy technical diagrams.
- Use GIF only when animation is essential to the explanation.
- Embed SVG directly only when the user explicitly requests SVG or the Vault convention clearly prefers it. Validate the SVG visually and confirm that fonts, text, arrows, and sizing render correctly. When compatibility is uncertain, export and embed PNG instead.

For raster output, use an opaque high-contrast background and enough resolution for readable text at normal and zoomed Obsidian widths. Prefer at least 1600 pixels on the long edge unless the Vault has another established convention. Inspect the final embedded-format image before accepting it; regenerate or repair it if labels are garbled, relationships are wrong, important content is cropped, or scaling makes text unreadable.

Name assets predictably from the note slug, for example:

- `<slug>-overview.png`
- `<slug>-details.png`

If an editable source is worth preserving, name it `<slug>-overview.svg` or `<slug>-details.svg`, but do not embed it instead of the PNG unless the SVG exception above applies.

Use the Vault's established embed syntax. Otherwise use `![[<asset-name>]]`. Add a short italic caption below each image that states what to notice.

Create a second diagram only if it explains a distinct difficult mechanism such as a GC lifecycle, async continuation flow, event loop, query plan, transaction anomaly, middleware pipeline, distributed consistency sequence, or React render cycle. It must not repeat the overview.

### 6. Write the note

Use precise, speakable language. Define terms before relying on them. Connect mechanism to consequences: correctness, performance, failure modes, maintainability, and when relevant security.

Practical examples must be minimal but realistic:

- compile or be syntactically credible for the stated platform;
- demonstrate the central mechanism, not unrelated setup;
- include the expected result or explanation;
- contrast a correct and incorrect approach when that teaches an interview-relevant distinction;
- avoid fake benchmark numbers and unverified performance claims.

Interview questions should include concise answer cues, not questions alone. Pitfalls must explain why the mistake occurs and how to avoid or diagnose it.

### 7. Save safely

- Derive a clear note filename from the topic unless the user supplied one, and save the new note specifically under `F:\Obsidian\Главное\_Inbox`.
- Preserve existing user content if updating a note. Make focused changes rather than replacing unrelated sections.
- Store diagrams and all other local article assets in `F:\Obsidian\Главное\_assets`, never in the article's folder. Keep the Markdown note itself under `F:\Obsidian\Главное\_Inbox`.
- Use ISO date format `YYYY-MM-DD` for `created` and `updated`.
- On creation, set both dates to the current local date. On update, preserve the original `created` value and change only `updated`.
- Do not report success until the note and every local asset actually exist at the required Vault paths and the embeds resolve from the note's location.

## Exact note template

Follow this structure. Replace all angle-bracket placeholders and remove instructional comments. Omit only conditionally marked subsections; do not omit required sections.

````markdown
---
title: "<Название темы>"
type: interview-topic
topic: "<Каноническая тема или технология>"
level: <junior|middle|senior|lead|architect>
tags:
  - interview
  - <technology-tag>
  - <topic-tag>
created: YYYY-MM-DD
updated: YYYY-MM-DD
---

# <Название темы>

![[<slug>-overview.png]]

*<Одно предложение: что показывает схема и на что смотреть.>*

## Ответ за 30 секунд

<Самодостаточный устный ответ из 3-6 предложений: определение, назначение, механизм, ключевой компромисс.>

## Что нужно знать на собеседовании

<Краткая обязательная теория. Чётко отделить определения, гарантии, ограничения и область применимости.>

### Ключевые понятия

- **<Термин>:** <точное объяснение>.

## Как это работает

<Пошаговое объяснение механизма. Связать причины с наблюдаемым поведением.>

<!-- Добавлять только если вторая схема действительно нужна. -->
![[<slug>-details.png]]

*<Что именно проясняет дополнительная схема.>*

## Практические примеры

### <Сценарий или задача>

```<language>
<Минимальный реалистичный пример>
```

<Ожидаемое поведение и почему пример важен на интервью.>

## Типичные вопросы на интервью

### <Вопрос?>

**Краткий ответ:** <суть ответа и важное уточнение>.

**Могут спросить дальше:** <вероятный follow-up и направление ответа>.

## Подводные камни и частые ошибки

- **<Ошибка>:** <почему возникает, последствие, как избежать или диагностировать>.

## Расширенные знания

> [!info] За пределами обязательной базы
> Этот раздел нужен для углубляющих вопросов уровня Senior/Lead/Architect.

### <Внутреннее устройство, компромиссы или продвинутый сценарий>

<Расширенное объяснение с явным указанием практической ценности.>

## Связанные заметки

- [[<Точное имя существующей заметки>]] — <как она связана с темой>.

## Потенциальные темы

- <Название темы без wikilink> — <почему стоит создать отдельную заметку>.

## Материалы для изучения

### Официальная документация и статьи

- [<Название>](<canonical-url>) — <что именно проясняет и кому полезно>.

### Видео

- [<Название>](<url>) — <автор или канал; что даст просмотр>.
````

Template rules:

- `title` and `topic` are quoted YAML strings. Keep `type` exactly `interview-topic`.
- `level` is one lowercase value from the shown set. Choose the primary target; explain mixed-level depth in prose instead of putting a YAML array here.
- Tags are YAML list items, lowercase, stable, and useful for retrieval. Use hyphens instead of spaces. Do not use `#` inside YAML tags and do not create near-duplicate tags.
- The H1 normally equals `title`.
- `Связанные заметки` contains only confirmed existing targets. If none exist, write `Связанные заметки в Vault не найдены.`
- `Потенциальные темы` contains only non-links. If none are useful, omit that section.
- Omit the `Видео` subsection when no verified high-value video is available.
- A source may appear both as an inline citation and in `Материалы для изучения` when it is central to the topic.

## Domain calibration

Adapt depth without changing the overall contract:

- **C#/.NET:** distinguish language, compiler, CLR/runtime, BCL, ASP.NET Core, and library behavior; note version boundaries; cover allocation, concurrency, cancellation, disposal, or generated code when relevant.
- **SQL/PostgreSQL:** separate the SQL standard from PostgreSQL behavior; show data shape and expected results; address plans, indexes, locking, isolation, and `NULL` semantics when relevant.
- **JavaScript/TypeScript/React:** distinguish ECMAScript, host runtime, TypeScript compile-time checks, browser/Node behavior, and React semantics; name relevant versions or modes where behavior changed.
- **Architecture/distributed systems:** state assumptions, constraints, failure model, consistency needs, and trade-offs. Avoid presenting patterns as universally correct.
- **Other topics:** identify the corresponding specification, runtime, implementation, and operational layers rather than forcing one ecosystem's vocabulary onto another.

## Completion checks

Before finishing, inspect the actual files and verify:

### Structure and metadata

- YAML parses and contains all required properties: `title`, `type`, `topic`, `level`, `tags`, `created`, and `updated`.
- No placeholder, instructional comment, empty required section, or template-only text remains.
- The note filename, H1, `title`, and topic scope agree.
- The 30-second answer is concise, accurate, and speakable without the rest of the note.
- Mandatory knowledge and extended knowledge are visibly separate.

### Technical quality

- Core claims agree with current primary sources.
- Version-sensitive claims name or clearly bound the relevant version.
- Examples are coherent and their stated behavior follows from the code or query.
- Interview questions have answer cues and plausible follow-ups.
- Pitfalls include cause and mitigation, not warnings alone.

### Links and sources

- Every `[[wikilink]]` resolves to an existing Vault note; no potential topic is disguised as an existing note.
- Every external URL opens, goes to the intended canonical resource, and is accompanied by a concise value statement.
- Sources are authoritative enough for the claim and no material section relies on unsupported folklore.

### Images

- Each embed resolves to an existing local asset.
- Each embedded image uses PNG by default, or another format whose use is justified by the Vault convention or the user's request.
- The final embedded format—not only an editable SVG source—has been rendered and visually inspected.
- The overview diagram teaches the topic's structure or flow without needing decorative interpretation.
- Labels are legible and technically correct; arrows and grouping mean what the article says they mean.
- A second diagram exists only when it adds a distinct explanation.
- Captions and surrounding prose explain how to read the diagram.

### Safe delivery

- Only requested note and asset files were created or changed.
- The article file is under `F:\Obsidian\Главное\_Inbox`; every local image/diagram asset is under `F:\Obsidian\Главное\_assets`; no substitute workspace path was used.
- Existing `created` metadata and unrelated user content were preserved on updates.
- Report the output paths, research scope, whether a second diagram was justified, and any limitations that remain.
