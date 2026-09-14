# Tech Challenge Fase 3 - O Mercado Brasileiro de Dados

**Autor: Pedro Eduardo Garcia Silva - rm374179**

## Problema de negócio

> "Como evoluiu o mercado brasileiro de Dados entre 2023 e 2025/2026 e quais competências, tecnologias, perfis profissionais e características de trabalho devem ser consideradas por uma instituição financeira que pretende expandir sua área de Dados, Analytics e Inteligência Artificial?"

A instituição precisa de evidência de dados para decidir sobre **contratação, capacitação, investimento em tecnologia, desenvolvimento de profissionais, estratégia de IA e retenção de talentos**.

## Objetivos

| Frente | O que a análise responde |
|---|---|
| Contratação | Quais perfis, cargos e senioridades priorizar |
| Capacitação | Quais competências desenvolver internamente |
| Tecnologia | Quais linguagens, clouds e ferramentas priorizar |
| Estratégia de IA | Como preparar os times para a adoção já quase universal |
| Localização | Onde está concentrado o talento no Brasil |
| Retenção | Quais fatores de trabalho pesam na permanência |

## Fonte dos dados

Pesquisa **State of Data Brasil**, realizada pela comunidade **Data Hackers** em parceria com a **Bain**. Utilizadas as **3 pesquisas mais recentes disponíveis** nos arquivos fornecidos:

| Ano | Arquivo | Linhas | Colunas | Duplicidades (bruto) |
|---|---|---:|---:|---:|
| 2023 | `state_of_data_2023.csv` | 5.293 | 399 | 0 |
| 2024 | `state_of_data_2024.csv` | 5.217 | 403 | 2 |
| 2025-2026 | `state_of_data_2025-2026.csv` | 3.495 | 388 | 1 |

> ⚠️ **PS:** Há arquivos dos 3 anos mais recentes efetivamente disponíveis são 2023, 2024 e 2025-2026 (confirmado e decidido no início do projeto).

Diagnóstico estrutural completo (nulos, padrão de nomenclatura, amostras) em [`exploracao_CSV.ipynb`](exploracao_CSV.ipynb).
---

**Fonte dos dados:** [State of Data Brasil — Data Hackers](https://www.kaggle.com/datahackers/datasets), pesquisa realizada em parceria com a Bain.

## Storytelling inicial (dados brutos, antes do tratamento)

Antes de qualquer limpeza ou padronização (camadas Silver/Gold), fizemos uma primeira leitura direto sobre os 3 CSVs originais, com `pandas`. O objetivo aqui **não é** sustentar as conclusões finais do trabalho — é diagnosticar o que os dados brutos já sugerem e identificar os problemas que justificam o pipeline de tratamento que vem a seguir. Os números finais (pós-tratamento) estão na seção [Principais resultados](#principais-resultados), calculados sobre a camada Gold.

### Quem responde à pesquisa

**Gênero** (% dos respondentes):

| Ano | Masculino | Feminino | Outro/Prefiro não informar |
|---|---:|---:|---:|
| 2023 | 75,1% | 24,4% | 0,5% |
| 2024 | 76,1% | 23,5% | 0,5% |
| 2025-2026 | 77,5% | 22,0% | 0,6% |

A participação feminina cai ano a ano (24,4% → 23,5% → 22,0%) — um recuo de 2,4 pontos percentuais em 3 pesquisas. Não é uma virada brusca, mas é uma tendência consistente e negativa.

**Escolaridade:**

| Ano | Pós-graduação | Graduação | Mestrado | Doutorado/PhD |
|---|---:|---:|---:|---:|
| 2023 | 34,3% | 34,0% | 12,8% | 4,0% |
| 2024 | 37,2% | 32,8% | 12,7% | 4,1% |
| 2025-2026 | 40,2% | 30,6% | 12,7% | 4,3% |

A fatia com pós-graduação cresceu quase 6 pontos percentuais em 3 anos, enquanto "apenas graduação" caiu — sinal de mercado exigindo (ou atraindo) profissionais cada vez mais qualificados formalmente.

**Concentração regional:**

| Ano | Sudeste | Sul | Nordeste | Centro-Oeste | Norte |
|---|---:|---:|---:|---:|---:|
| 2023 | 61,4% | 18,6% | 11,8% | 6,7% | 1,6% |
| 2024 | 61,7% | 20,3% | 10,2% | 6,5% | 1,3% |
| 2025-2026 | 64,4% | 16,0% | 11,3% | 6,9% | 1,4% |

O Sudeste concentra quase 2/3 dos profissionais de dados do país, com leve tendência de alta. O Norte permanece residual (~1,5%) nos 3 anos.

### Cargos, senioridade e remuneração

Os **cargos mais comuns** se mantêm estáveis no top 3 nos 3 anos — Analista de Dados/Data Analyst, Cientista de Dados/Data Scientist e Engenheiro de Dados — indicando um mercado maduro, não um "hype" de um cargo específico.

**Senioridade:**

| Ano | Júnior | Pleno | Sênior | Especialista/Staff+ |
|---|---:|---:|---:|---:|
| 2023 | 27,1% | 36,1% | 36,8% | — (não existia) |
| 2024 | 22,7% | 36,1% | 41,2% | — (não existia) |
| 2025-2026 | 20,7% | 31,0% | 34,3% | 14,0% |

A fatia de Júnior cai (27,1% → 22,7% → 20,7%), sugerindo mercado mais seletivo para quem está entrando. **Ressalva metodológica:** a categoria "Especialista/Staff+" só existe em 2025-2026 e provavelmente drenou parte do que antes seria contado como "Sênior" — somando Sênior + Especialista/Staff+ em 2025-2026, chega-se a 48,3%.

**Faixa salarial** (top faixas, estáveis nos 3 anos): R$ 8.001-12.000/mês lidera com ~22% em todos os anos; a faixa R$ 12.001-16.000 vem crescendo (13,7% → 14,7% → 15,0%); e a faixa mais alta (Acima de R$ 40.001) mais que dobrou proporcionalmente (1,5% → 2,1% → 3,6%) — o topo da pirâmide salarial está se alargando.

### Modelo de trabalho — a virada do remoto

| Ano | 100% remoto | 100% presencial | Híbrido (dias fixos) | Híbrido flexível |
|---|---:|---:|---:|---:|
| 2023 | 46,3% | 16,6% | 16,6% | 20,5% |
| 2024 | 45,7% | 16,3% | 17,5% | 20,5% |
| 2025-2026 | 39,7% | 20,8% | 20,0% | 19,5% |

O trabalho 100% remoto, predominante e estável em 2023-2024 (~46%), caiu quase 7 pontos percentuais em 2025-2026, enquanto o 100% presencial subiu de ~16% para quase 21% — a evidência mais clara de "retorno ao escritório" em toda a base.

### Tecnologia: Python domina, cloud se fragmenta

**Linguagem preferida:** Python é dominante e estável — 88,0% (2023), 88,8% (2024). Em 2025-2026 a pergunta virou multi-seleção (mudança metodológica), mas mesmo assim 92,0% mencionam Python e 84,2% mencionam SQL — reforçando Python + SQL como o par não-negociável para qualquer contratação técnica em dados.

**Cloud preferida:**

| Ano | AWS | GCP | Azure | Não sabe/sem preferência |
|---|---:|---:|---:|---:|
| 2023 | 43,5% | 27,8% | 27,0% | ~0,3% |
| 2024 | 32,0% | 19,4% | 15,7% | 32,5% |
| 2025-2026 | 31,7% | 20,6% | 14,7% | 32,5% |

**Cuidado ao ler:** a opção "Não sei opinar" salta de ~0,3% para ~32% entre 2023 e 2024 — sinal de mudança na formulação da pergunta, não necessariamente mudança real de mercado. Descontando essa opção, AWS segue líder folgado entre quem tem preferência formada. Variável marcada como **parcialmente comparável**.

### Inteligência Artificial: adoção quase universal e em aceleração

| Ano | Usa alguma solução de IA generativa | Não usa |
|---|---:|---:|
| 2023 | 80,3% | 19,7% |
| 2024 | 93,5% | 6,5% |
| 2025-2026 | 97,9% | 2,1% |

**O dado mais forte de toda a análise exploratória.** Em 3 pesquisas, a não-adoção de IA generativa caiu de ~20% para ~2%. A IA deixou de ser diferencial e virou padrão de mercado. Não faz mais sentido perguntar "se" a instituição vai adotar IA generativa na área de Dados — a pergunta que resta é "com que governança".

### Síntese executiva (Dado → Insight → Implicação)

| Dado | Insight | Implicação para a instituição financeira |
|---|---|---|
| Participação feminina caiu de 24,4% para 22,0% | Tendência negativa de diversidade de gênero | Política de diversidade precisa ser ativa, não passiva |
| Pós-graduação subiu de 34,3% para 40,2% | Mercado cada vez mais qualificado formalmente | Exigir/valorizar pós-graduação em critérios de contratação sênior |
| Júnior caiu de 27,1% para 20,7% (parte migrou para "Especialista/Staff+") | Mercado mais seletivo na entrada, mais estratificado no topo | Programas de trainee/júnior viram diferencial competitivo de atração |
| 100% remoto caiu de 46,3% para 39,7%; presencial subiu de 16,6% para 20,8% | Reversão da tendência remota pós-pandemia | Política de trabalho híbrido/presencial não é mais "nadar contra a maré" |
| Python (88-92%) e SQL (84%+) dominam sem rival relevante | Stack técnico do mercado é estável e consolidado | Critério técnico mínimo e não-negociável em qualquer vaga de dados |
| Não-uso de IA generativa caiu de 19,7% para 2,1% | Adoção de IA virou padrão, não diferencial | Investir em governança de uso de IA, não em "se" vai usar |

### Limitações identificadas nesta primeira leitura

1. **Sem base de 2022** — os 3 anos efetivamente disponíveis são 2023, 2024 e 2025-2026.
2. **Senioridade**: categoria "Especialista/Staff+" só existe em 2025-2026 — comparação de "% Sênior" isolada entre os 3 anos deve vir com essa nota.
3. **Linguagem preferida**: pergunta de resposta única em 2023/2024, virou múltipla escolha em 2025-2026 — números comparáveis apenas como "% que menciona", não linha a linha.
4. **Cloud preferida**: mudança aparente na formulação da pergunta entre 2023 e 2024 — variável marcada como parcialmente comparável.
5. **1 erro de digitação pontual** identificado na faixa salarial de 2025-2026 ("R$ 25.001 a R$ 3000", claramente deveria ser R$ 30.000).

> ⚠️ **PS:** Todos os dados foi calculados diretamente dos 3 arquivos CSV originais, sem nenhuma limpeza ou padronização prévia 
