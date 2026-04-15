# Vibe Code Workflow Skills

**10 skills que transformam vibe coding em desenvolvimento profissional.**

> Por [Carlos Henrique](https://carloshq.design). Product Designer.

---

## Sobre

Product designer. Background em brand, UX e design systems. Construo aplicações inteiras com IA e Claude Code no dia a dia. Penso em sistemas antes de pensar em telas. Esse jeito de trabalhar me levou a tratar o processo de vibe coding como um problema de design: se a estrutura é boa, o output é bom.

---

## Para que isso existe

Milhares de tokens gastos, muitos erros, e um workflow que finalmente funciona. Essas skills nasceram desse processo.

IA com processo gera código profissional. IA sem processo gera protótipo descartável. Essas 10 skills criam um pipeline estruturado onde cada etapa tem input claro, output definido, e chama a próxima automaticamente.

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
         └────────┬────────┘
                  ▼
         ┌─────────────────┐
         │  8-plan-design   │  Escopo visual
         │                  │  fluxo de telas, estados
         └────────┬────────┘
                  ▼
         ┌─────────────────┐
         │  9-figma         │  Execução no Figma
         │                  │  frames via MCP
         └────────┬────────┘
                  ▼
         ┌─────────────────┐
         │  10-review       │  QA de design
         │                  │  Nielsen, WCAG, UX writing
         └─────────────────┘
```

---

## As 10 skills

### 1-new-project
Fundação técnica. Gera `architecture.md`, `design.md` e `CLAUDE.md`. Define stack, folder structure, naming conventions, separação de responsabilidades, regras de segurança.

### 2-design-base
Fundação visual. Recebe referência (screenshot, Figma, brand guide), extrai tokens, inicializa shadcn/ui + MCP, cria `globals.css`, styleguide e `design.md`.

### 3-plan
Pesquisa o codebase, identifica código reutilizável, gera PRD com a lista exata de arquivos a criar/modificar. Tasks pequenas que cabem no contexto da IA. Intercambiável em ordem com `/4-spec`.

### 4-spec
Especificação do produto em 4 camadas: Overview → Pages → Components → Behaviors. Cada comportamento tem happy path, error cases e edge cases. Intercambiável em ordem com `/3-plan`.

### 5-new-component
Busca no codebase antes de criar. Consulta shadcn MCP antes de construir do zero. Estende ao invés de recriar.

### 6-new-page
Monta páginas reutilizando componentes existentes. Protótipo visual com mock data. Funcionalidade vem depois.

### 7-doc-sync
Lê o código, compara com os docs, mostra relatório e só aplica após confirmação. Nunca toca em CSS ou código.

### 8-plan-design
Gera o mapa visual antes de abrir o Figma: fluxo de telas, estados alternativos e corner cases. Se um link do ClickUp for fornecido, lê a task automaticamente. Rode antes do `/9-figma`.

### 9-figma
Executa o plano no Figma via MCP. Lê os estilos da página atual, cria os frames na ordem certa e aplica UX writing consistente. Rode após o `/8-plan-design`.

### 10-review
QA completo como Design Director. Avalia cobertura do plano, heurísticas de Nielsen com score, WCAG, UX writing e entrega 2 direções de redesign. Funciona também como critique standalone.

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
design.md       → documentação (batch updates)
```

---

## Instalação

### Opção mais fácil — direto no Claude Code

1. Abra o Claude Code
2. Cole essa mensagem no chat:

```
Execute esse comando para instalar as vibe-code-skills:
curl -fsSL https://raw.githubusercontent.com/caarloshq/vibe-code-skills/main/install.sh | bash
```

3. Reinicie o Claude Code

Pronto. Skills disponíveis em todas as conversas.

---

### Opção para desenvolvedores — terminal

```bash
curl -fsSL https://raw.githubusercontent.com/caarloshq/vibe-code-skills/main/install.sh | bash
```

Ou clonando o repositório:

```bash
git clone https://github.com/caarloshq/vibe-code-skills.git && cd vibe-code-skills && ./install.sh
```

---

## Estrutura

```
vibe-code-skills/
├── .claude-plugin/
│   └── plugin.json
├── skills/
│   ├── 1-new-project/SKILL.md
│   ├── 2-design-base/SKILL.md
│   ├── 3-plan/SKILL.md
│   ├── 4-spec/SKILL.md
│   ├── 5-new-component/SKILL.md
│   ├── 6-new-page/SKILL.md
│   ├── 7-doc-sync/SKILL.md
│   ├── 8-plan-design/SKILL.md
│   ├── 9-figma/SKILL.md
│   └── 10-review/SKILL.md
└── install.sh
```

---

## Como modificar

Cada skill é um `SKILL.md` dentro da sua pasta. Edite livremente. Troque a stack, adicione etapas, ajuste o fluxo. Os padrões funcionam com qualquer stack.

---

# English

## About

Product designer. Background in brand, UX, and design systems. I build entire applications with AI and Claude Code daily. I think in systems before I think in screens. That approach led me to treat vibe coding as a design problem: if the structure is good, the output is good.

---

## Why this exists

Thousands of tokens spent, plenty of mistakes, and a workflow that finally works. These skills were born from that process.

AI with process produces professional code. AI without process produces disposable prototypes. These 10 skills create a structured pipeline where each step has a clear input, a defined output, and chains into the next automatically.

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
         └────────┬────────┘
                  ▼
         ┌─────────────────┐
         │  8-plan-design   │  Visual scope
         │                  │  screen flow, states
         └────────┬────────┘
                  ▼
         ┌─────────────────┐
         │  9-figma         │  Execute in Figma
         │                  │  frames via MCP
         └────────┬────────┘
                  ▼
         ┌─────────────────┐
         │  10-review       │  Design QA
         │                  │  Nielsen, WCAG, UX writing
         └─────────────────┘
```

---

## The 10 skills

### 1-new-project
Technical foundation. Generates `architecture.md`, `design.md`, and `CLAUDE.md`. Defines stack, folder structure, naming conventions, separation of concerns, security rules.

### 2-design-base
Visual foundation. Takes a reference (screenshot, Figma, brand guide), extracts tokens, initializes shadcn/ui + MCP, creates `globals.css`, styleguide, and `design.md`.

### 3-plan
Researches the codebase, identifies reusable code, generates a PRD with the exact list of files to create/modify. Small tasks that fit within the AI's context window. Interchangeable in order with `/4-spec`.

### 4-spec
Product specification in 4 layers: Overview → Pages → Components → Behaviors. Each behavior has happy path, error cases, and edge cases. Interchangeable in order with `/3-plan`.

### 5-new-component
Searches the codebase before creating. Checks shadcn MCP before building from scratch. Extends instead of recreating.

### 6-new-page
Assembles pages by reusing existing components. Visual prototype with mock data. Functionality comes later.

### 7-doc-sync
Reads the code, compares against docs, shows a report, and only applies after user confirmation. Never touches CSS or code.

### 8-plan-design
Generates a visual map before opening Figma: screen flow, alternative states, and corner cases. If a ClickUp link is provided, reads the task automatically. Run before `/9-figma`.

### 9-figma
Executes the plan in Figma via MCP. Reads the current page's styles, creates frames in the correct order, and applies consistent UX writing. Run after `/8-plan-design`.

### 10-review
Full QA as Design Director. Evaluates plan coverage, Nielsen heuristics with scores, WCAG, UX writing, and delivers 2 redesign directions. Also works as a standalone design critique.

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
design.md       → documentation (batch updates)
```

---

## Installation

### Easiest — directly in Claude Code

1. Open Claude Code
2. Paste this message in the chat:

```
Run this command to install vibe-code-skills:
curl -fsSL https://raw.githubusercontent.com/caarloshq/vibe-code-skills/main/install.sh | bash
```

3. Restart Claude Code

Done. Skills available in all conversations.

---

### For developers — terminal

```bash
curl -fsSL https://raw.githubusercontent.com/caarloshq/vibe-code-skills/main/install.sh | bash
```

Or cloning the repository:

```bash
git clone https://github.com/caarloshq/vibe-code-skills.git && cd vibe-code-skills && ./install.sh
```

---

## File structure

```
vibe-code-skills/
├── .claude-plugin/
│   └── plugin.json
├── skills/
│   ├── 1-new-project/SKILL.md
│   ├── 2-design-base/SKILL.md
│   ├── 3-plan/SKILL.md
│   ├── 4-spec/SKILL.md
│   ├── 5-new-component/SKILL.md
│   ├── 6-new-page/SKILL.md
│   ├── 7-doc-sync/SKILL.md
│   ├── 8-plan-design/SKILL.md
│   ├── 9-figma/SKILL.md
│   └── 10-review/SKILL.md
└── install.sh
```

---

## How to modify

Each skill is a `SKILL.md` inside its folder. Edit freely. Swap the stack, add steps, adjust the flow. The patterns work with any stack.

---

## Credits

Created by **Carlos Henrique**. [carloshq.design](https://carloshq.design) | [LinkedIn](https://www.linkedin.com/in/carlospsd/)

Inspired by the [Epic CLI methodology](https://substack.com/home/post/p-192844567) by Deborah Folloni.

Use, modify, and share freely. Credit appreciated.
