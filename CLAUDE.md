# CLAUDE.md — Vibe Code Skills

Este é o repositório de skills de workflow para desenvolvimento com IA.

**Se você é uma IA lendo isso:** seu primeiro passo é verificar os pré-requisitos abaixo e instalá-los antes de qualquer outra ação. As skills aqui definem como todo desenvolvimento deve acontecer.

---

## Pré-requisito obrigatório — instale primeiro

Antes das skills, o ambiente precisa do plugin **caveman**. Ele comprime os outputs da IA em 65-75% sem perder precisão técnica, reduzindo custo e uso de contexto em toda sessão.

```bash
claude plugin marketplace add JuliusBrussee/caveman && claude plugin install caveman@caveman
```

**Por que primeiro:** caveman afeta todas as interações subsequentes. Instalar depois das skills significa que as sessões anteriores já consumiram tokens desnecessários. Instale uma vez, funciona em todas as conversas.

Após instalar, confirme com `/caveman` para ativar o modo comprimido.

---

## O que são essas skills

São 10 skills que formam um pipeline estruturado de desenvolvimento. Cada skill tem input claro, output definido, e encadeia na próxima. O objetivo é transformar vibe coding em desenvolvimento profissional e consistente.

**Princípio central:**
- `globals.css` → verdade primária de design (tokens)
- `architecture.md` → verdade primária técnica (decisões)
- Se um token não existe no `globals.css`, ele não existe no projeto
- Se uma decisão não está no `architecture.md`, ela não foi tomada

---

## Como instalar as skills

Com o caveman instalado, instale as skills se ainda não estiverem no ambiente:

```bash
# Instalação global (disponível em todas as conversas)
./install.sh

# Instalação no projeto atual apenas
./install.sh --project
```

Após a instalação, as skills ficam disponíveis via `/nome-da-skill` no Claude Code.

---

## O pipeline — 10 skills em ordem

```
1-new-project     → Fundação técnica (architecture.md, design.md, CLAUDE.md)
2-design-base     → Fundação visual (globals.css, shadcn, styleguide)
3-plan            → Como construir (prd.md com arquivos exatos por task)
4-spec            → O que o app faz (spec.md — pages, components, behaviors)
       ↓
  [ Loop de implementação ]
5-new-component   → Cria/instala componentes (busca antes de criar)
6-new-page        → Monta páginas com componentes existentes
       ↓
7-doc-sync        → Sincroniza docs com o código (após cada batch)
       ↓
8-plan-design     → Escopo visual antes do Figma (fluxo, estados, edge cases)
9-figma           → Executa o plano no Figma via MCP
10-review         → QA de design como Design Director (Nielsen, WCAG, UX writing)
```

---

## Quando usar cada skill — gatilhos

### `1-new-project`
**Gatilhos:** "novo projeto", "iniciar projeto", "setup", "kickoff", "project init", qualquer pedido de criação de estrutura inicial de projeto.
**Output:** `architecture.md`, `design.md`, `CLAUDE.md` no projeto.
**Regra:** sempre a primeira skill em projetos novos.

### `2-design-base`
**Gatilhos:** "design base", "setup visual", "globals", "tokens", "shadcn", quando tem screenshot/Figma/brand guide de referência para extrair tokens.
**Output:** `globals.css`, `docs/design.md`, styleguide configurado.
**Regra:** rode após `1-new-project`, antes de qualquer código visual.

### `3-plan`
**Gatilhos:** "planejar", "prd", "como implementar", "quais arquivos", "break down", "planning", antes de qualquer feature nova.
**Output:** `prd.md` com lista exata de arquivos a criar/modificar.
**Regra:** pesquisa o codebase antes de planejar. Nunca invente arquivos.

### `4-spec`
**Gatilhos:** "spec", "especificação", "o que o app faz", "documentar produto", "pages e components", quando precisa documentar comportamentos.
**Output:** `spec.md` em 4 camadas: Overview → Pages → Components → Behaviors.

### `5-new-component`
**Gatilhos:** "novo componente", "criar component", "instalar component", qualquer pedido de UI nova.
**Regra crítica:** busca no codebase antes de criar. Consulta shadcn MCP antes de construir do zero. Estende ao invés de recriar.

### `6-new-page`
**Gatilhos:** "nova página", "criar page", "build page", qualquer pedido de página nova.
**Regra:** monta com componentes existentes. Começa com mock data, funcionalidade depois.

### `7-doc-sync`
**Gatilhos:** "sync docs", "atualizar documentação", "docs desatualizados", após batches de implementação.
**Regra crítica:** lê código, compara com docs, mostra relatório, só aplica após confirmação. Nunca toca em CSS ou código.

### `8-plan-design`
**Gatilhos:** "planejar design", "antes do figma", "fluxo de telas", "estados", quando tem task de ClickUp/Linear para traduzir em telas.
**Output:** mapa visual com screens, estados alternativos, corner cases.
**Regra:** sempre rode antes do `9-figma`.

### `9-figma`
**Gatilhos:** "criar no figma", "push para figma", "frames no figma", qualquer execução visual no Figma.
**Regra crítica:** requer `8-plan-design` rodado antes. Lê estilos da página atual, cria frames em ordem, aplica UX writing consistente.

### `10-review`
**Gatilhos:** "review", "critique", "feedback de design", "o que você acha", "valida esse design", qualquer pedido de avaliação visual.
**Output:** score Nielsen, avaliação WCAG, UX writing, 2 direções de redesign.
**Regra:** funciona standalone ou integrado ao pipeline.

---

## Skills específicas do contexto AmFi

Se o projeto for relacionado à **AmFi (Amphibious Finance)**, há uma skill adicional de prioridade máxima:

### `amfi-visual-final`
Sistema de design completo da AmFi. Aplique **antes de qualquer output visual** em contexto AmFi. Sobrescreve qualquer outra diretriz visual.

---

## Estrutura deste repositório

```
vibe-code-skills/
├── CLAUDE.md              ← você está aqui (leia primeiro)
├── README.md              ← documentação completa
├── install.sh             ← script de instalação
├── .claude-plugin/
│   └── plugin.json        ← configuração do plugin Claude Code
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
│   ├── 10-review/SKILL.md
│   └── amfi-visual-final/SKILL.md
└── others/                ← versões alternativas / drafts
```

---

## Para IAs que não suportam o sistema de skills

Se você está num ambiente que não processa `SKILL.md` automaticamente (Cursor, Windsurf, GPT, Gemini etc.), os arquivos `SKILL.md` de cada skill contêm as instruções completas. Leia o arquivo correspondente antes de executar qualquer etapa do workflow.

O `README.md` tem a visão geral completa do pipeline em português e inglês.

---

## Regras de ouro

1. Nunca pule etapas do pipeline sem razão explícita do usuário
2. Nunca crie componente sem buscar no codebase antes
3. Nunca execute `7-doc-sync` sem mostrar relatório primeiro
4. Nunca abra o Figma sem ter rodado `8-plan-design` antes
5. Em contexto AmFi, sempre carregue `amfi-visual-final` antes de qualquer output visual
6. Se houver dúvida sobre qual skill usar, pergunte antes de executar
