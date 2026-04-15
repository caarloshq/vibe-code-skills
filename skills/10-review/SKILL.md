---
name: 10-review
description: >
  Full design QA: acts as an experienced Design Director to evaluate Figma frames
  against the project plan and task manager task. Covers plan coverage, Nielsen heuristics
  with scores, visual evaluation, WCAG, UX writing, strategic alignment, and 2 alternative
  redesign directions. Use as design validation or standalone when asked for critique,
  feedback, review, or validation of a frame, component, or flow. Triggers on casual
  requests too ("what do you think of this design?", "give me feedback", "review this component").
  Requires Figma and task manager connectors (ClickUp, Linear, Asana, etc).
argument-hint: "[frame node-ids] [task-link?] [plan-summary?]"
---

# Design Review — QA + Strategic Evaluation

Acts as an experienced Design Director.
Validates Figma against the original plan and task spec.
Delivers plan coverage, heuristics with scores, visual evaluation, UX writing, WCAG, and 2 redesign directions.

## Skill workflow position

```
  1-new-project     Technical foundation (architecture, CLAUDE.md)
  2-design-base     Visual foundation (globals.css, shadcn, styleguide)
  3-plan            Implementation planning (how to build it)
  4-spec            Product specification (what the app does)
  5-new-component   Add/install components
  6-new-page        Build pages from designs
  7-doc-sync        Keep documentation in sync
  8-plan-design     Understand scope, generate visual map
  9-figma           Execute in Figma based on the plan
→ YOU ARE HERE
  10-review         QA: compare Figma with plan and spec
```

---

## Before starting — clean context (recommended)

> **Tip:** For a more accurate review, consider starting a fresh conversation — long conversations accumulate noise that can affect analysis. If you prefer to continue here, that's fine.
>
> When starting, bring:
> - The **node IDs** of the frames created in Figma
> - The **plan summary** (if available)
> - The **task link** from your task manager (optional)

Proceed directly with what the user provided. Don't wait for confirmation.

---

## Input hierarchy

When the user provides more than one type of input, apply this priority order:

1. **User's written text** (highest weight)
   Explicit textual instruction overrides everything. "Focus on hierarchy", "ignore colors" — that's law.
   Never contradict or ignore an explicit textual instruction.

2. **Task manager task** (medium weight)
   Defines business objective, acceptance criteria, and feature context.

3. **Project plan** (medium weight)
   Defines planned screens, states, corner cases, and what was out of scope.

4. **Figma frame** (medium weight)
   The main object of the critique. What the user says carries more weight than what's in the frame.

If no input is provided, ask:
> "Which Figma frame and/or task do you want me to evaluate?"

---

## Step 1 — Collect references

### Figma
Read frames by node IDs via MCP (`get_design_context` + `get_screenshot`). For each frame, capture:
- Name and organization on the page
- Components used
- All visible text (titles, labels, buttons, messages, placeholders)
- States represented

### Original plan (if provided)
Use the plan summary. Extract:
- Planned screens and their purposes
- States to cover
- Identified corner cases
- What was out of scope

### Project task (if link provided)
Read the task and extract the feature objective, acceptance criteria, comments, and decisions already made.
Ignore conversation threads without decisions.
If no task is available, use the frame title as context and flag it at the end.

---

## Step 2 — Verify plan coverage

*(Skip if no project plan was provided)*

Compare what exists in Figma with what's in the plan:

| Planned item | In Figma? | Notes |
|-------------|-----------|-------|
| [Screen / state] | ✅ / ⚠️ / ❌ | [note if needed] |

- ✅ Covered
- ⚠️ Partial or different from planned
- ❌ Missing

---

## Step 3 — Nielsen heuristics (score 1–5)

Evaluate each heuristic with a score and at least one concrete example from the observed design.

| # | Heuristic | Score | Observed example |
|---|-----------|-------|------------------|
| 1 | Visibility of system status | | |
| 2 | Match between system and real world | | |
| 3 | User control and freedom | | |
| 4 | Consistency and standards | | |
| 5 | Error prevention | | |
| 6 | Recognition rather than recall | | |
| 7 | Flexibility and efficiency of use | | |
| 8 | Aesthetic and minimalist design | | |
| 9 | Help users recognize and recover from errors | | |
| 10 | Help and documentation | | |

**Average score**: X/5

---

## Step 4 — Visual evaluation

**Visual hierarchy**
Does the eye follow the expected flow? Where does hierarchy break?

**Typography**
Scale, weight, contrast, legibility. Consistency with project design system.

**Color**
Semantic usage, consistency with project design system.
WCAG contrast: text passes AA (4.5:1)? UI elements pass AA (3:1)?

**Spacing and rhythm**
Density, breathing room, alignment, grid consistency.

---

## Step 5 — UX Writing

For each text found in the frames, verify:

- **Buttons**: verb + direct object? ("Confirm action", not "OK")
- **Screen titles**: describe the user's action? ("Confirm action", not "Action")
- **Empty states**: explain why it's empty and what to do next?
- **Error messages**: say what happened and guide the next step?
- **Field labels**: direct nouns, no embedded instructions? ("Amount", not "Enter the amount")
- **Language**: appropriate for the screen's user profile?
- **Term consistency**: does the same concept have the same name across all frames?

---

## Step 6 — Usability and accessibility

**Cognitive load**
How many decisions does the user need to make? What can be simplified?

**Interaction clarity**
CTAs are clear? States (hover, disabled, error, empty) are covered?
Action feedback is present?

**WCAG**
- Text contrast: passes / doesn't pass AA (4.5:1)
- Touch targets: minimum 44×44px
- Critical accessibility items identified

---

## Step 7 — Strategic alignment

Does the design solve the task's objective?
What makes this solution better than the obvious one?
Does any design decision contradict acceptance criteria?

---

## Step 8 — Final report

```
## Design Review — [feature name]

### Plan coverage
[X of Y items covered — or "No reference plan"]
[coverage table]

### Nielsen heuristics
Average score: X/5
[table with score and example]

### Visual evaluation
[Hierarchy / Typography / Color+WCAG / Spacing]

### UX Writing
[issues table — or "Text within standards"]

### Usability and accessibility
[cognitive load, interaction clarity, WCAG]

### Strategic alignment
[summary — or "No reference task"]

### Correction priorities

🔴 Critical — Breaks usability or accessibility
- [item]

🟡 Important — Compromises experience or consistency
- [item]

🟢 Polish — Aesthetic or detail refinement
- [item]

### 2 alternative redesign directions

Direction A: [name]
Guiding principle: [what drives this direction]
What changes: [clear description]
Why it works better: [justification]

Direction B: [name]
Guiding principle: [what drives this direction]
What changes: [clear description]
Why it works better: [justification]

### Approved for handoff?
[✅ Yes | ⚠️ Yes, with caveats | ❌ No — adjustments needed]
```

---

## Context management

This skill loads ~260 lines into context. After completing:
- If approved, suggest handoff to development (back to `/5-new-component` or `/6-new-page`)
- If critical fixes needed, suggest fixing and re-running `/10-review`
- If the conversation is long, suggest starting fresh for the re-review
- Caveman mode stays active across sessions — no need to re-enable

## Next step

**If approved:**
"Design validated. Next step: handoff to development or update the task with the frame links."

**If critical adjustments needed:**
"Fix the 🔴 items listed and run `/10-review` again — preferably in a fresh conversation."

---

## Rules

- Constructive, actionable, educational tone — never critique without a solution direction
- Always anchor critiques in concrete examples from the observed design
- Prioritize end-user impact, not aesthetic preferences
- Reference the project's design system when relevant
- If the frame doesn't load or Figma access fails, ask for the correct link
- If task context is missing, infer from the design and flag it
