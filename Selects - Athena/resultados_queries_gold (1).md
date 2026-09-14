# Resultados das 26 Consultas SQL — Camada Gold - ATHENA (Apenas resultas os scripts estão em outro arquivo)
## Tech Challenge Fase 3 — State of Data Brasil (2023, 2024, 2025-2026)

Todos os números abaixo foram calculados diretamente dos arquivos originais (mesma lógica dos Glue Jobs), validados antes de ir para o Athena. Nenhum valor foi estimado.

---

## Decisões tomadas sobre os 2 achados

### 1) Tratamento do "Não informado"
**Decisão: considerar "Não informado" como categoria válida nos percentuais** (não excluir do denominador). Todas as tabelas abaixo já seguem esse critério — os percentuais somam 100% incluindo essa categoria.

### 2) Erro de digitação na faixa salarial (2023)
O registro `"de R$ 101/mês a R$ 2.000/mês"` (1 linha, 2023) será **desconsiderado** (removido/tratado como não informado) na camada Silver, já que não há forma segura de saber qual era o valor correto pretendido. Ajuste já incorporado ao Glue Job `bronze_to_silver.py`.

---

## MERCADO

**1) Total de profissionais por ano**

| Ano | Total |
|---|---:|
| 2023 | 5.293 |
| 2024 | 5.215 |
| 2025-2026 | 3.494 |

**2) Distribuição por senioridade, por ano (% incluindo "Não informado")**

| Ano | Júnior | Pleno | Sênior | Não informado |
|---|---:|---:|---:|---:|
| 2023 | 19,8% (1.046) | 26,3% (1.392) | 26,8% (1.419) | 27,1% (1.436) |
| 2024 | 16,6% (868) | 26,4% (1.376) | 30,1% (1.572) | 26,8% (1.399) |
| 2025-2026 | 14,8% (518) | 22,2% (775) | 34,5%* (1.207) | 28,4% (994) |

\* Sênior + Especialista/Staff+ (agrupados, conforme tratamento já documentado na Silver).

**3) Top cargos, por ano (completo, confirmado no Athena)**

| Cargo | 2023 | 2024 | 2025-2026 |
|---|---:|---:|---:|
| Não informado | 1.436 | 1.399 | 994 |
| Analista de Dados/Data Analyst | 907 | 957 | 599 |
| Cientista de Dados/Data Scientist | 687 | 687 | 423 |
| Engenheiro de Dados/Data Engineer/Data Architect | 684 | 612 | 402 |
| Analista de BI/BI Analyst | 506 | 396 | 215 |
| Outra Opção | 262 | 254 | 206 |
| Analista de Negócios/Business Analyst | 195 | 184 | 141 |
| Analytics Engineer | 139 | 228 | 135 |
| Desenvolvedor/Engenheiro de Software/Analista de Sistemas | 105 | 122 | 106 |
| Engenheiro de Machine Learning/ML Engineer/AI Engineer | 75 | 103 | 106 |
| Data Product Manager/Product Manager | 81 | 80 | 33 |
| Analista de Suporte/Analista Técnico | 72 | 78 | 55 |
| Arquiteto de Dados/Data Architect | — | 48 | 28 |
| Analista de Inteligência de Mercado/Market Intelligence | 39 | — | — |
| Outras Engenharias (não inclui dev) | 31 | 29 | 26 |
| Professor/Pesquisador | 28 | 21 | 16 |
| Estatístico | 21 | 17 | 9 |
| DBA/Administrador de Banco de Dados | 20 | — | — |
| Economista | 5 | — | — |

*(células "—" significam que a categoria não apareceu como opção de resposta naquele ano, provavelmente por mudança no formulário entre pesquisas — não é dado perdido)*

**4) Distribuição regional, por ano**

| Ano | Sudeste | Sul | Nordeste | Centro-Oeste | Norte | Não informado |
|---|---:|---:|---:|---:|---:|---:|
| 2023 | 59,9% | 18,2% | 11,5% | 6,5% | 1,6% | 2,3% |
| 2024 | 60,0% | 19,8% | 9,9% | 6,4% | 1,2% | 2,7% |
| 2025-2026 | 62,1% | 15,5% | 10,9% | 6,6% | 1,4% | 3,6% |

---

## REMUNERAÇÃO

**1) Faixa salarial mais comum, por ano (top 3)**

| Ano | #1 | #2 | #3 |
|---|---|---|---|
| 2023 | R$ 8.001-12.000 (1.026) | R$ 4.001-6.000 (745) | R$ 12.001-16.000 (650) |
| 2024 | R$ 8.001-12.000 (1.080) | R$ 12.001-16.000 (716) | R$ 6.001-8.000 (656) |
| 2025-2026 | R$ 8.001-12.000 (707) | R$ 12.001-16.000 (484) | R$ 6.001-8.000 (367) |

**2) Faixa salarial por senioridade (2023, exemplo — faixa mais comum de cada nível)**

| Senioridade | Faixa mais comum | Contagem |
|---|---|---:|
| Júnior | R$ 4.001-6.000 | 294 |
| Pleno | R$ 6.001-8.000 | 369 |
| Sênior | R$ 8.001-12.000 | 506 |

**5) Evolução salarial (contagem por faixa, 3 anos)**

| Faixa salarial | 2023 | 2024 | 2025-2026 |
|---|---:|---:|---:|
| Menos de R$ 1.000 | 30 | 33 | 21 |
| R$ 1.001-2.000 | 215 | 155 | 117 |
| R$ 2.001-3.000 | 288 | 237 | 130 |
| R$ 3.001-4.000 | 352 | 270 | 157 |
| R$ 4.001-6.000 | 745 | 592 | 344 |
| R$ 6.001-8.000 | 637 | 656 | 367 |
| R$ 8.001-12.000 | 1.026 | 1.080 | 707 |
| R$ 12.001-16.000 | 650 | 716 | 484 |
| R$ 16.001-20.000 | 328 | 456 | 323 |
| R$ 20.001-25.000 | 195 | 246 | 213 |
| R$ 25.001-30.000 | 128 | 159 | 135 |
| R$ 30.001-40.000 | 86 | 157 | 114 |
| Acima de R$ 40.001 | 72 | 104 | 115 |

*(consultas 3 e 4 — por cargo e por região — retornam volume grande de combinações; recomendo rodar diretamente no Athena filtrando por um cargo/região específico quando for montar o gráfico correspondente, para não sobrecarregar o documento com uma tabela de centenas de linhas)*

---

## TECNOLOGIAS

**1) Top 5 tecnologias mencionadas, por ano (todas as categorias)**

| Ano | #1 | #2 | #3 | #4 | #5 |
|---|---|---|---|---|---|
| 2023 | Python (3.299) | Microsoft PowerBI (2.154) | AWS (1.529) | Azure (1.141) | GCP (1.106) |
| 2024 | Python (3.040)* | — | — | — | — |
| 2025-2026 | Python (1.928) | SQL (1.763) | — | — | — |

\* 2024 e 2025-2026 truncados na visualização (mostrei só top 60 linhas gerais, dominadas por 2023); recomendo rodar a query isolada por ano no Athena para o ranking completo de 2024.

**2) Evolução de Python (linguagem)**

| Ano | Menções |
|---|---:|
| 2023 | 3.299 |
| 2024 | 3.040 |
| 2025-2026 | 1.928 |

*(queda nominal explicada pela base 2025-2026 ser menor em volume total — em % de quem respondeu, Python segue dominante: ~92% em 2025-2026, como já vimos no storytelling)*

**5) Clouds mais usadas em 2023 (exemplo)**

| Cloud | Menções |
|---|---:|
| AWS | 1.529 |
| Azure | 1.141 |
| GCP | 1.106 |
| Servidores On Premise / Não usa cloud | 582 |
| Cloud Própria | 251 |
| Oracle Cloud | 154 |

---

## INTELIGÊNCIA ARTIFICIAL

**1) Evolução da não-adoção de IA generativa**

| Ano | Não usa | Total | % não usa |
|---|---:|---:|---:|
| 2023 | 744 | 3.772 | 19,7% |
| 2024 | 236 | 3.617 | 6,5% |
| 2025-2026 | 44 | 2.105 | 2,1% |

**3) Adoção de IA por senioridade (2025-2026)**

| Senioridade | Usa IA | Total | % |
|---|---:|---:|---:|
| Sênior | 1.031 | 1.050 | 98,2% |
| Pleno | 651 | 665 | 97,9% |
| Júnior | 379 | 390 | 97,2% |

**4) Adoção de IA por cargo (2025-2026, top 5)**

| Cargo | Usa IA | Total |
|---|---:|---:|
| Analista de Dados | 532 | 549 |
| Cientista de Dados | 380 | 386 |
| Engenheiro de Dados | 372 | 379 |
| Analista de BI | 189 | 190 |
| Analytics Engineer | 125 | 126 |

---

## DIVERSIDADE

**1) Gênero por ano**

| Ano | Masculino | Feminino | Prefiro não informar | Outro |
|---|---:|---:|---:|---:|
| 2023 | 75,1% (3.975) | 24,4% (1.293) | 0,3% (16) | 0,2% (9) |
| 2024 | 76,1% (3.967) | 23,5% (1.225) | 0,3% (15) | 0,2% (8) |
| 2025-2026 | 77,5% (2.707) | 22,0% (767) | 0,4% (13) | 0,2% (7) |

**2) Gênero por senioridade (2025-2026)**

| Senioridade | Masculino | Feminino |
|---|---:|---:|
| Júnior | 367 | 146 |
| Pleno | 599 | 173 |
| Sênior | 951 | 248 |

**3) Gênero por região (2025-2026)**

| Região | Masculino | Feminino |
|---|---:|---:|
| Sudeste | 1.650 | 508 |
| Sul | 421 | 115 |
| Nordeste | 303 | 77 |
| Centro-Oeste | 194 | 35 |
| Norte | 41 | 7 |

**4) Gênero por cargo (2025-2026, top 5)**

| Cargo | Masculino | Feminino |
|---|---:|---:|
| Analista de Dados | 450 | 147 |
| Engenheiro de Dados | 328 | 73 |
| Cientista de Dados | 325 | 94 |
| Analista de BI | 162 | 49 |
| Analista de Negócios | 101 | 39 |

---

## TRABALHO

**1) Modelo de trabalho por ano**

| Ano | 100% remoto | 100% presencial | Híbrido dias fixos | Híbrido flexível | Não informado |
|---|---:|---:|---:|---:|---:|
| 2023 | 41,6% (2.201) | 14,9% (790) | 14,9% (790) | 18,4% (972) | 10,2% (540) |
| 2024 | 42,6% (2.221) | 15,2% (792) | 16,3% (850) | 19,1% (998) | 6,8% (354) |
| 2025-2026 | 36,7% (1.281) | 19,2% (670) | 18,5% (645) | 18,1% (631) | 7,6% (267) |

**2) Evolução do 100% remoto**

| Ano | Total |
|---|---:|
| 2023 | 2.201 |
| 2024 | 2.221 |
| 2025-2026 | 1.281 |

**4) Modelo de trabalho por senioridade (2025-2026)**

| Senioridade | 100% remoto | 100% presencial | Híbrido dias fixos | Híbrido flexível |
|---|---:|---:|---:|---:|
| Júnior | 134 | 190 | 114 | 80 |
| Pleno | 309 | 176 | 147 | 143 |
| Sênior | 606 | 150 | 230 | 221 |

---

## Decisões aplicadas nesta versão

1. ✅ Percentuais agora incluem "Não informado" como categoria própria em todas as tabelas (mercado, diversidade, trabalho) — consistente em todo o documento.
2. ✅ Top cargos completo e confirmado para os 3 anos (validado contra consulta real no Athena).
3. ✅ Registro com erro de digitação (`"R$ 101/mês a R$ 2.000/mês"`, 2023) será desconsiderado na Silver — ajuste incorporado ao Glue Job.

## Pendências remanescentes

1. Ranking completo de tecnologias por ano (mostrei só um recorte truncado) — recomendo rodar `tecnologias.sql` consulta 1 filtrando por `ano_pesquisa` no Athena para o ranking completo de cada ano antes do PPTX.
2. Consultas de remuneração/tecnologia "por cargo" e "por região" (consultas 3 e 4 de cada arquivo) têm muitas combinações — sugiro recortar no Athena só o cargo/região que for virar gráfico específico.

**⚠️ Nota importante:** essa mudança de critério só afeta variáveis que **têm nulo** (cargo, senioridade, região, modelo de trabalho). Já conferi que **gênero não tem nenhum valor nulo em nenhum dos 3 anos** (é pergunta obrigatória no início do formulário) — então os percentuais de gênero do storytelling inicial (ex.: "24,4% de mulheres em 2023") continuam exatamente corretos e não mudam com essa decisão. Já os percentuais de **senioridade** do storytelling inicial (ex.: "36,8% Sênior em 2023") ficam desatualizados — usar os novos valores desta tabela (26,8%) ao montar os KPIs finais.
