---
name: 8-plan-design
description: >
  Generate a visual design plan before going to Figma. Use whenever the user mentions
  "plan design", "before figma", "screen flow", "which screens", "what do I need to create"
  or wants to understand scope before executing in Figma. If a ClickUp link is provided,
  reads the task automatically. Run before /9-figma.
argument-hint: "[clickup-link?] [description of what needs to be done]"
---

# Plan Design

Generates a visual map of what will be built in Figma: screen flow, states, and corner cases.
Serves as reference for `/9-figma` and `/10-review`.

## Skill workflow position

```
  1-new-project     Technical foundation (architecture, CLAUDE.md)
  2-design-base     Visual foundation (globals.css, shadcn, styleguide)
  3-plan            Implementation planning (how to build it)
  4-spec            Product specification (what the app does)
  5-new-component   Add/install components
  6-new-page        Build pages from designs
  7-doc-sync        Keep documentation in sync
→ YOU ARE HERE
  8-plan-design     Understand scope, generate visual map
  9-figma           Execute in Figma based on the plan
  10-review         QA: compare Figma with plan and spec
```

---

## Step 1 — Gather context

### If a ClickUp link was provided
Fetch the task via ClickUp MCP and extract:
- Title and description
- Subtasks (if any)
- Relevant comments — focus on decisions and requirements, ignore conversation threads

### If no link was provided
Work only with what the user described. Don't search ClickUp.

### Clarification questions (max 2, only if needed)
Ask only if these points aren't clear after reading the context:
- **Who uses this screen?** (investor, operator, admin)
- **What does the user need to accomplish?** (main action)

If the context already answers these, skip straight to Step 2.

---

## Step 2 — Generate the visual map

Generate a screen flow diagram directly in the chat.

The diagram should show:
- **Main screens** — each screen as a node
- **Navigation flow** — arrows indicating the sequence
- **Alternative states** — loading, empty, error when relevant
- **Corner cases** — exceptional situations (e.g., no permission, empty data, action already taken)

Keep the diagram simple. If the flow has more than 7 screens, split into two diagrams.

---

## Step 3 — Plan summary

After the diagram, generate a short summary:

```
## Plan — [feature name]

Source: [ClickUp: task title | User description]

Screens to create
- [Screen name] — [purpose in one line]

States to cover
- [screen]: [relevant states — default, loading, empty, error]

Corner cases
- [Situation]: [how to handle]

Out of scope
- [What won't be done in this cycle]

Execution order
- [Base screen first, corner cases last]
```

---

## UX Writing — practices to apply in the plan

When naming screens, states, and corner cases, follow:

- **Use action-oriented verbs** — "Confirm buyback", not "Confirmation modal"
- **Name states by what the user sees**, not the technical state — "No notes found" instead of "Empty state"
- **Corner cases have real-situation names** — "Investor without sufficient balance", not "Validation error"
- **Be specific** — "Investor views consolidated position" is better than "Dashboard screen"
- **Avoid technical jargon in names** — they become the basis for labels that appear on screen

---

## Context management

This skill loads ~110 lines into context. After completing:
- Suggest `/9-figma` as the next step but do NOT auto-run it
- If the conversation already has 2+ skills loaded, suggest starting a fresh conversation
- Caveman mode stays active across sessions — no need to re-enable

## Next step

After generating the plan, suggest:

**"Plan ready. Next step: open the Figma file and run `/9-figma` — it reads the page styles and creates frames in the order defined here. Consider starting a fresh conversation to keep context lean."**
