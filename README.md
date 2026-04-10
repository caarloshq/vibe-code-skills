# Vibe Code Workflow Skills

**7 skills que transformam vibe coding em desenvolvimento profissional.**

> Por [Carlos Henrique](https://carloshq.design). Product Designer.

---

## Sobre

Product designer. Background em brand, UX e design systems. Construo aplicações inteiras com IA e Claude Code no dia a dia. Penso em sistemas antes de pensar em telas. Esse jeito de trabalhar me levou a tratar o processo de vibe coding como um problema de design: se a estrutura é boa, o output é bom.

---

## Para que isso existe

Milhares de tokens gastos, muitos erros, e um workflow que finalmente funciona. Essas skills nasceram desse processo.

IA com processo gera código profissional. IA sem processo gera protótipo descartável. Essas 7 skills criam um pipeline estruturado onde cada etapa tem input claro, output definido, e chama a próxima automaticamente.

---

## Fluxo

```
         ┌─────────────────┐
         │  1-new-project   │  Fundação técnica
         │  architecture.md │  design.md, CLAUDE.md
         └────────┬────────┘
                  ▼
         ┌─────────────────┐
         │  2-design-base   │  Fundação visual
         │  globals.css     │  shadcn + MCP, styleguide
         └────────┬────────┘
                  ▼
         ┌─────────────────┐
         │  3-plan          │  Como construir
         │  prd.md          │  Arquivos exatos por task
         └────────┬────────┘
                  ▼
         ┌─────────────────┐
         │  4-spec          │  O que o app faz
         │  spec.md         │  Pages → Components → Behaviors
         └────────┬────────┘
                  ▼
     ┌────────────────────────┐
     │   Implementation Loop   │
     │                         │
     │  5-new-component ◀────▸ │
     │  6-new-page             │
     └────────────┬────────────┘
                  ▼
         ┌─────────────────┐
         │  7-doc-sync      │  Sincroniza docs
         │  após cada batch │  com o código atual
         └─────────────────┘
```

---

## As 7 skills

### 1-new-project
Fundação técnica. Gera `architecture.md`, `design.md` e `CLAUDE.md`. Define stack, folder structure, naming conventions, separação de responsabilidades, regras de segurança.

### 2-design-base
Fundação visual. Recebe referência (screenshot, Figma, brand guide), extrai tokens, inicializa shadcn/ui + MCP, cria `globals.css`, styleguide, e `docs/design.md`.

### 3-plan
Pesquisa o codebase, identifica código reutilizável, gera PRD com a lista EXATA de arquivos a criar/modificar. Tasks pequenas que cabem no contexto da IA. Ao final, pergunta se quer limpar o contexto antes de continuar.

### 4-spec
Especificação do produto em 4 camadas: Overview → Pages → Components → Behaviors. Cada comportamento tem happy path, error cases e edge cases. Ao final, pergunta se quer começar a implementar.

### 5-new-component
Busca no codebase antes de criar. Consulta shadcn MCP antes de construir do zero. Estende ao invés de recriar.

### 6-new-page
Monta páginas reutilizando componentes existentes. Protótipo visual com mock data. Funcionalidade vem depois.

### 7-doc-sync
Lê o código, compara com os docs, mostra relatório e só aplica após confirmação. Nunca toca em CSS ou código.

---

## Princípio central

Se o token não existe no `globals.css`, ele não existe no projeto. Se a decisão não está no `architecture.md`, ela não foi tomada.

```
globals.css          → VERDADE PRIMÁRIA (design tokens)
architecture.md      → VERDADE PRIMÁRIA (decisões técnicas)
  ↓
styleguide/page.tsx  → espelho visual (1:1)
  ↓
component code       → consome tokens via Tailwind
  ↓
docs/design.md       → documentação (batch updates)
```

---

## Instalação

```bash
cp -r skills/ your-project/.claude/skills/
```

---

## Configuração rápida

Cole no `CLAUDE.md` do seu projeto:

```markdown
## Workflow Skills

Este projeto usa um workflow de 7 skills para desenvolvimento estruturado.
As skills estão em `.claude/skills/` e devem ser consultadas na ordem:

1. `--1-new-project` · Fundação técnica (rode uma vez no início)
2. `--2-design-base` · Fundação visual (rode uma vez após o projeto ser criado)
3. `--3-plan` · Planejamento de implementação (rode antes de codar cada feature)
4. `--4-spec` · Especificação do produto (rode para cada feature ou app completo)
5. `--5-new-component` · Adicionar componentes (rode conforme necessário)
6. `--6-new-page` · Montar páginas (rode conforme necessário)
7. `--7-doc-sync` · Sincronizar docs (rode após batches de implementação)

### Regras:
- `app/globals.css` é a verdade primária para design tokens
- `architecture.md` é a verdade primária para decisões técnicas
- Sempre busque componentes existentes antes de criar novos
- Páginas são protótipos visuais primeiro, funcionalidade vem depois
- Nunca hardcode hex, rgb ou pixel values
- Pesquise o codebase antes de implementar qualquer task
```

---

## Como modificar

Cada skill é um `SKILL.md` dentro da sua pasta. Edite livremente. Troque a stack, adicione etapas (`8-test`, `8-deploy`), ajuste o fluxo. Os padrões funcionam com qualquer stack.

---

## Estrutura

```
.claude/skills/
├── START-HERE.md
├── 1-new-project/SKILL.md
├── 2-design-base/SKILL.md
├── 3-plan/SKILL.md
├── 4-spec/SKILL.md
├── 5-new-component/SKILL.md
├── 6-new-page/SKILL.md
└── 7-doc-sync/SKILL.md
```

---

# English

## About

Product designer. Background in brand, UX, and design systems. I build entire applications with AI and Claude Code daily. I think in systems before I think in screens. That approach led me to treat vibe coding as a design problem: if the structure is good, the output is good.

---

## Why this exists

Thousands of tokens spent, plenty of mistakes, and a workflow that finally works. These skills were born from that process.

AI with process produces professional code. AI without process produces disposable prototypes. These 7 skills create a structured pipeline where each step has a clear input, a defined output, and chains into the next automatically.

---

## Flow

```
         ┌─────────────────┐
         │  1-new-project   │  Technical foundation
         │  architecture.md │  design.md, CLAUDE.md
         └────────┬────────┘
                  ▼
         ┌─────────────────┐
         │  2-design-base   │  Visual foundation
         │  globals.css     │  shadcn + MCP, styleguide
         └────────┬────────┘
                  ▼
         ┌─────────────────┐
         │  3-plan          │  How to build it
         │  prd.md          │  Exact files per task
         └────────┬────────┘
                  ▼
         ┌─────────────────┐
         │  4-spec          │  What the app does
         │  spec.md         │  Pages → Components → Behaviors
         └────────┬────────┘
                  ▼
     ┌────────────────────────┐
     │   Implementation Loop   │
     │                         │
     │  5-new-component ◀────▸ │
     │  6-new-page             │
     └────────────┬────────────┘
                  ▼
         ┌─────────────────┐
         │  7-doc-sync      │  Sync docs
         │  after each batch│  with current code
         └─────────────────┘
```

---

## The 7 skills

### 1-new-project
Technical foundation. Generates `architecture.md`, `design.md`, and `CLAUDE.md`. Defines stack, folder structure, naming conventions, separation of concerns, security rules.

### 2-design-base
Visual foundation. Takes a reference (screenshot, Figma, brand guide), extracts tokens, initializes shadcn/ui + MCP, creates `globals.css`, styleguide, and `docs/design.md`.

### 3-plan
Researches the codebase, identifies reusable code, generates a PRD with the EXACT list of files to create/modify. Small tasks that fit within the AI's context window. At the end, asks if you want to clear context before continuing.

### 4-spec
Product specification in 4 layers: Overview → Pages → Components → Behaviors. Each behavior has happy path, error cases, and edge cases. At the end, asks if you want to start implementing.

### 5-new-component
Searches the codebase before creating. Checks shadcn MCP before building from scratch. Extends instead of recreating.

### 6-new-page
Assembles pages by reusing existing components. Visual prototype with mock data. Functionality comes later.

### 7-doc-sync
Reads the code, compares against docs, shows a report, and only applies after user confirmation. Never touches CSS or code.

---

## Core principle

If the token doesn't exist in `globals.css`, it doesn't exist in the project. If the decision isn't in `architecture.md`, it hasn't been made.

```
globals.css          → PRIMARY TRUTH (design tokens)
architecture.md      → PRIMARY TRUTH (technical decisions)
  ↓
styleguide/page.tsx  → visual mirror (1:1)
  ↓
component code       → consumes tokens via Tailwind
  ↓
docs/design.md       → documentation (batch updates)
```

---

## Installation

```bash
cp -r skills/ your-project/.claude/skills/
```

---

## Quick setup

Paste in your project's `CLAUDE.md`:

```markdown
## Workflow Skills

This project uses a 7-skill workflow for structured development.
Skills are in `.claude/skills/` and should be consulted in order:

1. `--1-new-project` · Technical foundation (run once at the start)
2. `--2-design-base` · Visual foundation (run once after project creation)
3. `--3-plan` · Implementation planning (run before coding each feature)
4. `--4-spec` · Product specification (run for each feature or full app)
5. `--5-new-component` · Add components (run as needed)
6. `--6-new-page` · Build pages (run as needed)
7. `--7-doc-sync` · Sync docs (run after implementation batches)

### Rules:
- `app/globals.css` is the primary source of truth for design tokens
- `architecture.md` is the primary source of truth for technical decisions
- Always search for existing components before creating new ones
- Pages are visual prototypes first, functionality comes later
- Never hardcode hex, rgb, or pixel values
- Research the codebase before implementing any task
```

---

## How to modify

Each skill is a `SKILL.md` inside its folder. Edit freely. Swap the stack, add steps (`8-test`, `8-deploy`), adjust the flow. The patterns work with any stack.

---

## File structure

```
.claude/skills/
├── START-HERE.md
├── 1-new-project/SKILL.md
├── 2-design-base/SKILL.md
├── 3-plan/SKILL.md
├── 4-spec/SKILL.md
├── 5-new-component/SKILL.md
├── 6-new-page/SKILL.md
└── 7-doc-sync/SKILL.md
```

---

## Credits

Created by **Carlos Henrique**. [carloshq.design](https://carloshq.design) | [LinkedIn](https://www.linkedin.com/in/carlospsd/)

Inspired by the [Epic CLI methodology](https://substack.com/home/post/p-192844567) by Deborah Folloni.

Use, modify, and share freely. Credit appreciated.
