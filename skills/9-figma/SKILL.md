---
name: 9-figma
description: >
  Executa o plano de design no Figma via MCP. Use depois do 8-plan-design, quando o usuário
  quiser criar frames, telas ou componentes no Figma com base num plano definido. Lê apenas
  os estilos da página atual — rápido e sem varrer o arquivo inteiro.
argument-hint: "[página do figma onde criar]"
---

# Figma — Execução

Cria os frames no Figma com base no plano gerado pelo `8-plan-design`.
Enxuto por design: lê só o necessário, cria na ordem certa.

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
→ YOU ARE HERE
  9-figma           Execute in Figma based on the plan
  10-review         QA: compare Figma with plan and spec
```

---

## Step 1 — Ler estilos da página atual

Usar o MCP do Figma para ler **apenas a página atual**. Não navegar pelo arquivo inteiro.

Extrair somente:
- **Cores** — estilos de cor disponíveis (nome + valor hex)
- **Tipografia** — estilos de texto disponíveis (nome, fonte, tamanho, peso)
- **Componentes** — componentes já importados na página (nome + node ID)

Se não houver estilos na página, pausar e perguntar:
> "Não encontrei estilos na página atual. Quer que eu use os tokens padrão do projeto ou prefere importar os estilos antes de continuar?"

Não continuar sem estilos ou confirmação explícita do usuário.

---

## Step 2 — Criar os frames

Criar os frames na ordem definida no plano do `8-plan-design`.

Regras de criação:
- **Um frame por tela/estado** — não misturar estados num mesmo frame
- **Nomear pelo que o usuário vê**, não pelo estado técnico — ex: `Recompra / Nenhuma nota disponível`, não `Recompra / Empty state`
- **Usar os estilos encontrados** — nunca inventar cores ou fontes fora do que foi lido
- **Componentes existentes têm prioridade** — se existe na página, usar; não recriar
- **Agrupar por fluxo** — frames do mesmo fluxo ficam próximos, com label de seção

### Ordem de criação
- Tela base / estado default primeiro
- Estados alternativos (carregando, vazio, erro)
- Corner cases por último

---

## UX Writing — práticas a aplicar nos frames

Ao criar textos, labels, títulos e mensagens nos frames:

- **Títulos de tela**: descrevem o que o usuário está fazendo — "Confirmar recompra", não "Recompra"
- **Botões**: verbo + objeto direto — "Confirmar operação", "Cancelar recompra", não "OK" ou "Confirmar"
- **Estados vazios**: explicam por que está vazio e o que fazer — "Você não tem notas disponíveis para recompra. Aguarde o vencimento de uma operação."
- **Mensagens de erro**: dizem o que aconteceu e o próximo passo — "Não foi possível processar a recompra. Tente novamente ou entre em contato com o suporte."
- **Labels de campo**: substantivos diretos — "Valor da recompra", não "Digite o valor"
- **Tooltips**: uma frase, sem ponto final — "Calculado com base no saldo disponível na data de hoje"
- **Evitar**: "Ops!", "Hmm...", linguagem excessivamente informal, textos placeholder genéricos como "Lorem ipsum" ou "Digite aqui"

---

## Step 3 — Confirmar entrega

Após criar todos os frames, listar o que foi feito:

```
## Frames criados

| Frame | Estado | Node ID |
|-------|--------|---------|
| [Nome] | default | [id] |
| [Nome] | vazio | [id] |
| ... | ... | ... |

Estilos utilizados: [lista resumida]
Componentes reaproveitados: [lista ou "nenhum"]
```

---

## Next step

> "Frames ready. To validate before handoff, run `10-review` — it compares what was created with the plan and the original task, and runs through usability heuristics."
