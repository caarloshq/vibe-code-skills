---
name: review
description: >
  QA completo de design: age como um Design Director experiente para avaliar frames do Figma
  cruzando com o plano do projeto e a task do gerenciador de tarefas. Cobre cobertura do plano,
  heurísticas de Nielsen com score, avaliação visual, WCAG, UX writing, alinhamento
  estratégico e 2 direções alternativas de redesign. Use como validação de design
  ou de forma standalone quando pedir critique, feedback, review ou validação de um frame, componente ou fluxo. Trigger mesmo em pedidos casuais
  ("o que você acha desse design?", "me dá um feedback", "revisa esse componente").
  Requer conectores Figma e gerenciador de tarefas (ClickUp, Linear, Asana, etc).
argument-hint: "[node-ids dos frames] [link-task?] [resumo-plano?]"
---

# Design Review — QA + Avaliação Estratégica

Age como um Design Director experiente.
Valida o Figma contra o plano original e a spec da task.
Entrega cobertura do plano, heurísticas com score, avaliação visual, UX writing, WCAG e 2 direções de redesign.

---

## Antes de começar — limpar o contexto

**Sempre exibir este aviso antes de qualquer coisa:**

> "Para o review ser preciso, recomendo iniciar uma nova conversa — conversas longas acumulam ruído que afeta a análise.
>
> Quando abrir a nova conversa, traga:
> - Os **node IDs** dos frames criados no Figma
> - O **resumo do plano** do projeto (se houver)
> - O **link da task** do seu gerenciador (opcional)
>
> Prefere continuar aqui mesmo? Tudo bem — só saiba que o resultado pode ser menos preciso."

Aguardar confirmação antes de prosseguir.

---

## Hierarquia de inputs

Quando o usuário fornecer mais de um tipo de input, aplicar esta ordem de prioridade:

1. **Texto escrito pelo usuário** (peso máximo)
   Instrução textual explícita sobrepõe tudo. "Foca na hierarquia", "ignora cores" — isso é lei.
   Nunca contradiga ou ignore uma instrução textual explícita.

2. **Task do gerenciador** (peso médio)
   Define objetivo de negócio, critérios de aceite e contexto da feature.

3. **Plano do projeto** (peso médio)
   Define telas planejadas, estados, corner cases e o que estava fora do escopo.

4. **Frame do Figma** (peso médio)
   É o objeto principal da critique. O que o usuário disser tem mais peso do que o que está no frame.

Se nenhum input for fornecido, perguntar:
> "Qual frame do Figma e/ou task você quer que eu avalie?"

---

## Step 1 — Coletar referências

### Figma
Ler os frames pelos node IDs via MCP (`get_design_context` + `get_screenshot`). Para cada frame, capturar:
- Nome e organização na página
- Componentes utilizados
- Todos os textos visíveis (títulos, labels, botões, mensagens, placeholders)
- Estados representados

### Plano original (se fornecido)
Usar o resumo do plano. Extrair:
- Telas planejadas e seus propósitos
- Estados a cobrir
- Corner cases identificados
- O que estava fora do escopo

### Task do projeto (se link fornecido)
Ler a task e extrair objetivo da feature, critérios de aceite, comentários e decisões já tomadas.
Ignorar threads de conversa sem decisão.
Se não houver task, usar o título do frame como contexto e sinalizar ao final.

---

## Step 2 — Verificar cobertura do plano

*(Pular se não houver plano do projeto)*

Comparar o que existe no Figma com o que está no plano:

| Item planejado | No Figma? | Observação |
|----------------|-----------|------------|
| [Tela / estado] | ✅ / ⚠️ / ❌ | [nota se necessário] |

- ✅ Coberto
- ⚠️ Parcial ou diferente do planejado
- ❌ Ausente

---

## Step 3 — Heurísticas de Nielsen (score 1–5)

Avaliar cada heurística com score e pelo menos um exemplo concreto do design observado.

| # | Heurística | Score | Exemplo observado |
|---|-----------|-------|-------------------|
| 1 | Visibilidade do status do sistema | | |
| 2 | Correspondência com o mundo real | | |
| 3 | Controle e liberdade do usuário | | |
| 4 | Consistência e padrões | | |
| 5 | Prevenção de erros | | |
| 6 | Reconhecimento em vez de lembrança | | |
| 7 | Flexibilidade e eficiência | | |
| 8 | Design estético e minimalista | | |
| 9 | Ajuda para reconhecer e recuperar erros | | |
| 10 | Ajuda e documentação | | |

**Score médio**: X/5

---

## Step 4 — Avaliação visual

**Hierarquia visual**
O olhar segue o fluxo esperado? Onde há quebra de hierarquia?

**Tipografia**
Escala, peso, contraste, legibilidade. Consistência com design system do projeto.

**Cor**
Uso semântico, consistência com design system do projeto.
Contraste WCAG: texto passa AA (4.5:1)? Elementos de UI passam AA (3:1)?

**Espaçamento e ritmo**
Densidade, respiração, alinhamento, consistência de grid.

---

## Step 5 — UX Writing

Para cada texto encontrado nos frames, verificar:

- **Botões**: têm verbo + objeto direto? ("Confirmar ação", não "OK")
- **Títulos de tela**: descrevem a ação do usuário? ("Confirmar ação", não "Ação")
- **Estados vazios**: explicam por que está vazio e o que fazer a seguir?
- **Mensagens de erro**: dizem o que aconteceu e orientam o próximo passo?
- **Labels de campo**: são substantivos diretos, sem instrução embutida? ("Valor", não "Digite o valor")
- **Linguagem**: adequada ao perfil do usuário da tela?
- **Consistência de termos**: o mesmo conceito tem o mesmo nome em todos os frames?

---

## Step 6 — Usabilidade e acessibilidade

**Carga cognitiva**
Quantas decisões o usuário precisa tomar? O que pode ser simplificado?

**Clareza de interação**
CTAs estão claros? Estados (hover, disabled, error, empty) estão cobertos?
Feedback de ação está presente?

**WCAG**
- Contraste de texto: passa / não passa AA (4.5:1)
- Touch targets: mínimo 44×44px
- Itens críticos de acessibilidade identificados

---

## Step 7 — Alinhamento estratégico

O design resolve o objetivo da task?
O que torna essa solução melhor que a óbvia?
Alguma decisão de design contradiz critérios de aceite?

---

## Step 8 — Relatório final

```
## Design Review — [nome da feature]

### Cobertura do plano
[X de Y itens cobertos — ou "Sem plano de referência"]
[tabela de cobertura]

### Heurísticas de Nielsen
Score médio: X/5
[tabela com score e exemplo]

### Avaliação visual
[Hierarquia / Tipografia / Cor+WCAG / Espaçamento]

### UX Writing
[tabela de problemas — ou "Textos dentro do padrão"]

### Usabilidade e acessibilidade
[carga cognitiva, clareza de interação, WCAG]

### Alinhamento estratégico
[resumo — ou "Sem task de referência"]

### Priorização de correções

🔴 Critical — Quebra usabilidade ou acessibilidade
- [item]

🟡 Important — Compromete experiência ou consistência
- [item]

🟢 Polish — Refinamento estético ou de detalhe
- [item]

### 2 direções alternativas de redesign

Direção A: [nome]
Princípio norteador: [o que guia essa direção]
O que muda: [descrição clara]
Por quê funciona melhor: [justificativa]

Direção B: [nome]
Princípio norteador: [o que guia essa direção]
O que muda: [descrição clara]
Por quê funciona melhor: [justificativa]

### Aprovado para handoff?
[✅ Sim | ⚠️ Sim, com ressalvas | ❌ Não — ajustes necessários]
```

---

## Próximo passo

Se aprovado:
> "Design validado. Próximo passo: handoff para desenvolvimento ou atualizar a task com o link dos frames."

Se há ajustes críticos:
> "Corrija os pontos 🔴 listados, abra uma nova conversa e rode `review` novamente."

---

## Regras

- Tom construtivo, acionável e educativo — nunca crítica sem direção de solução
- Sempre ancorar críticas em exemplos concretos do design observado
- Priorizar impacto no usuário final, não preferências estéticas
- Referenciar o design system do projeto quando relevante
- Se o frame não carregar ou o acesso ao Figma falhar, pedir o link correto
- Se o contexto da task estiver ausente, inferir pelo design e sinalizar
