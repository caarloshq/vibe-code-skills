---
name: 8-plan-design
description: >
  Gera um plano visual de design antes de ir pro Figma. Use sempre que o usuário mencionar
  "planejar", "plan", "o que preciso criar", "fluxo de telas", "quais telas fazer" ou
  quiser entender o escopo antes de executar no Figma. Se um link do ClickUp for fornecido,
  lê a task automaticamente. Rode antes do 9-figma.
argument-hint: "[link-clickup?] [descrição do que precisa ser feito]"
---

# Plan Design

Gera um mapa visual do que será construído no Figma: fluxo de telas, estados e corner cases.
Serve de referência para o `9-figma` e o `10-review`.

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

## Step 1 — Coletar contexto

### Se um link do ClickUp foi fornecido
Buscar a task via MCP do ClickUp e extrair:
- Título e descrição
- Subtasks (se existirem)
- Comentários relevantes — focar em decisões e requisitos, ignorar threads de conversa

### Se não foi fornecido link
Trabalhar apenas com o que o usuário descreveu. Não buscar nada no ClickUp.

### Perguntas de clarificação (máximo 2, só se necessário)
Perguntar apenas se algum desses pontos não estiver claro após ler o contexto:
- **Quem usa essa tela?** (investidor, operador, admin)
- **O que o usuário precisa conseguir fazer?** (ação principal)

Se o contexto já deixar claro, pular direto pro Step 2.

---

## Step 2 — Gerar o mapa visual

Gerar um diagrama de fluxo de telas diretamente no chat usando a ferramenta de visualização.

O diagrama deve mostrar:
- **Telas principais** — cada tela como um nó
- **Fluxo de navegação** — setas indicando a sequência
- **Estados alternativos** — loading, empty, error quando relevantes
- **Corner cases** — situações excepcionais (ex: sem permissão, dados vazios, ação já executada)

Manter o diagrama simples. Se o fluxo tiver mais de 7 telas, dividir em dois diagramas.

---

## Step 3 — Resumo do plano

Após o diagrama, gerar um resumo curto:

```
## Plano — [nome da feature]

Fonte: [ClickUp: título da task | Descrição fornecida]

Telas a criar
- [Nome da tela] — [propósito em uma linha]

Estados a cobrir
- [tela]: [estados relevantes — default, loading, empty, error]

Corner cases
- [Situação]: [como tratar]

Fora do escopo
- [O que não será feito nesse ciclo]

Ordem de execução
- [Tela base primeiro, corner cases por último]
```

---

## UX Writing — práticas a aplicar no plano

Ao nomear telas, estados e corner cases, seguir:

- **Use verbos orientados à ação do usuário** — "Confirmar recompra", não "Modal de confirmação"
- **Nomeie estados pelo que o usuário vê**, não pelo estado técnico — "Nenhuma nota encontrada" em vez de "Empty state"
- **Corner cases têm nome de situação real** — "Investidor sem saldo suficiente", não "Erro de validação"
- **Seja específico** — "Investidor visualiza posição consolidada" é melhor que "Tela de dashboard"
- **Evite jargão técnico nos nomes** — eles viram a base dos labels que aparecem na tela

---

## Next step

After generating the plan, suggest:

> "Plan ready. Next step: open the Figma file in Dev Mode and run `9-figma` — I'll read the page styles and create the frames in the order defined in the plan."
