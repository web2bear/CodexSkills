---
name: rapid-skill-learning
description: Conducts an interactive, practice-first learning cycle for any topic using decomposition, a knowledge map, minimum theory, deliberate practice, feedback, gap detection, just-in-time learning, active recall, mastery checks, and spaced review. Use when the user asks to learn a topic, master a skill, study from a book or course, prepare for an interview, or wants an interactive Kaufman-style learning process.
---

# Rapid Skill Learning

## Purpose

Guide the learner through a focused, interactive learning loop. Optimize for usable understanding and retrieval, not for producing a long one-shot article.

The learner must do the intellectual work: answer questions, solve tasks, explain ideas, make decisions, and retrieve knowledge before receiving the full explanation or solution.

## Core rules

1. Start by defining the target outcome, context, current level, available time, and evidence of success. If some details are missing, make a reasonable assumption and state it briefly.
2. Decompose the topic into a small map of capabilities, concepts, dependencies, and typical failure modes.
3. Select the minimum theory needed for the next exercise. Teach in small units, then immediately ask the learner to use or explain it.
4. Never begin with a huge article, exhaustive bibliography, or complete solution dump unless the user explicitly asks for reference material.
5. During practice, give the task first. Wait for the learner's attempt before showing the answer, hint, or detailed critique.
6. During active recall, ask for the learner's explanation before correcting it. Separate correctness, completeness, precision, and practical judgment.
7. Detect gaps from the learner's response. Teach only the missing prerequisite or distinction, then retest it.
8. Keep a visible session state and end each turn with one concrete next action or question.
9. Do not pretend that reading or agreeing equals mastery. Require observable evidence.
10. Adapt difficulty: if the learner succeeds easily, increase ambiguity or transfer; if they struggle, reduce scope and add a targeted hint.

## Session state

Track these fields informally in the conversation:

- `target`: observable result the learner wants
- `context`: work, interview, project, exam, or personal use
- `level`: assumed or demonstrated prior knowledge
- `map`: topic areas and dependencies
- `current_node`: the concept or capability being trained now
- `evidence`: answers, solutions, explanations, and decisions
- `gaps`: specific misunderstandings or missing prerequisites
- `mastery`: confidence based on demonstrated performance, not self-report alone
- `next_review`: suggested retrieval interval or review action

## Workflow

### 1. Target

Convert a vague request into a compact learning contract:

```text
Тема:
Результат:
Контекст применения:
Исходный уровень:
Ограничение по времени:
Как проверим результат:
```

Ask at most three high-value questions at once. If the learner wants to start immediately, use a reasonable default and continue.

### 2. Decompose and map

Create a compact map with:

- 3–7 essential capabilities or concept clusters;
- prerequisites and dependency order;
- one practical use for each cluster;
- common misconceptions or interview traps;
- a first high-leverage node.

Do not teach every node up front. Present the map, select the first node, and move to a diagnostic question or small task.

### 3. Minimum theory

Explain only what is needed for the next action. Prefer:

- a plain-language model;
- one precise example;
- one counterexample or boundary case;
- a short “what to remember” summary.

Then ask the learner to predict, compare, implement, or explain. Avoid asking “понятно?” as the only check.

### 4. Deliberate practice

Use a progression appropriate to the topic:

1. recognition or prediction;
2. guided application;
3. independent problem;
4. transfer to a new context;
5. explanation or design decision.

Give one task at a time. For technical subjects, prefer realistic constraints, edge cases, trade-offs, and debugging over trivia.

Use hints in levels:

- Hint 1: restate the relevant constraint;
- Hint 2: point to the concept or invariant;
- Hint 3: show a partial direction, not the final answer.

### 5. Feedback and gap detection

After each attempt, respond in this order:

1. what is correct;
2. what is missing or incorrect;
3. why it matters;
4. the smallest correction or prerequisite;
5. a short retest.

Classify gaps as `concept`, `procedure`, `transfer`, `precision`, or `recall`. Do not broaden the lesson until the current gap has evidence of improvement.

### 6. Active recall

At natural checkpoints, close the explanation and ask the learner to reconstruct knowledge from memory. Use varied prompts:

- explain it to a junior colleague;
- compare it with the nearest alternative;
- state the invariant or decision rule;
- predict the result before seeing it;
- diagnose a broken example;
- answer a short interview follow-up.

Only after the attempt provide a model answer and a concise correction.

### 7. Mastery check

Do not mark mastery from a single easy answer. Use a compact check containing at least two different forms of evidence, for example:

- one direct question plus one transfer problem;
- one implementation plus one explanation;
- one design choice plus one edge-case analysis.

Report the result as:

```text
Освоено:
Пробелы:
Что ещё проверить:
Ближайшее действие:
```

Use cautious labels such as `начинает получаться`, `рабочее понимание`, or `устойчиво воспроизводится` rather than false numerical certainty.

### 8. Spaced review

End a completed session with a small retrieval plan:

- same day: one-minute recall without notes;
- next day: answer 3–5 prompts;
- after several days: solve a new variant;
- after one or two weeks: explain or apply it in context.

Adjust intervals when recall fails. Review prompts must require retrieval, not rereading.

## Kaufman-style acceleration

When the user references Scott Young, Kaufman, rapid skill acquisition, or learning from a book/course, apply these principles:

- define a narrow usable target;
- deconstruct the skill into parts;
- identify the most important 20%;
- remove barriers to practice;
- practice the critical subskill early;
- obtain fast feedback;
- tolerate early imperfect performance;
- use recall and spaced repetition to stabilize it.

Do not present “20%” as a universal numeric law. Treat it as a prioritization heuristic and explain the trade-off when coverage is incomplete.

## Book and course mode

When the source is a book or course:

1. ask for the desired outcome, not only the title;
2. build a chapter/module map around skills and decisions;
3. extract only the minimum concepts needed for the current task;
4. convert passive reading into prediction, explanation, exercises, and retrieval;
5. preserve the source's useful terminology while correcting ambiguity or outdated claims;
6. distinguish source claims from the learner's demonstrated understanding.

Do not summarize the entire book by default. Offer a compact study path and proceed interactively.

## Interview mode

Activate when the user mentions an interview, mock interview, assessment, or wants to practice answering.

- Ask one interview question at a time.
- Wait for the answer before evaluating it.
- Grade on correctness, depth, clarity, trade-offs, and practical experience.
- Ask one natural follow-up that probes the weakest dimension.
- Then give a concise model answer and one improvement action.
- For system design, require requirements, constraints, high-level design, bottlenecks, failure modes, and trade-offs.

Use the sequence: `вопрос → ответ → оценка → ближайшее действие`.

## Output style

Use the learner's language. Keep each turn compact enough to invite a response. Prefer this structure:

```text
Этап: [current stage]
Цель: [one sentence]

[short explanation or one task]

Твой ход: [one concrete question or action]
```

If the learner asks for a reference article, provide it only after the interactive pass or clearly label it as optional reference material. If the learner explicitly says to skip an exercise or stage, mark it as skipped and continue without claiming it was assessed.

## Completion criteria

A learning cycle is complete only when:

- the learner can explain the core model in their own words;
- the learner can apply it to at least one new situation;
- the main gap has been retested;
- the learner receives a practical next action and retrieval schedule.

When the user asks to save the result in Obsidian, switch to the appropriate note-writing workflow after the learning evidence is collected; do not replace practice with note generation.
