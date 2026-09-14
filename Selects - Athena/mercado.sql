-- MERCADO: estrutura do mercado brasileiro de Dados

-- 1) Quantidade total de profissionais analisados, por ano
SELECT ano_pesquisa, SUM(total_profissionais) AS total_profissionais
FROM gold_mercado
GROUP BY ano_pesquisa
ORDER BY ano_pesquisa;

-- 2) Distribuição por senioridade em cada ano (% do total do ano)
SELECT
    ano_pesquisa,
    senioridade_comparavel,
    SUM(total_profissionais) AS total,
    ROUND(100.0 * SUM(total_profissionais) / SUM(SUM(total_profissionais)) OVER (PARTITION BY ano_pesquisa), 1) AS pct
FROM gold_mercado
GROUP BY ano_pesquisa, senioridade_comparavel
ORDER BY ano_pesquisa, total DESC;

-- 3) Top 10 cargos mais comuns, por ano
SELECT ano_pesquisa, cargo_atual, SUM(total_profissionais) AS total
FROM gold_mercado
GROUP BY ano_pesquisa, cargo_atual
ORDER BY ano_pesquisa, total DESC
LIMIT 10;

-- 4) Distribuição regional, por ano
SELECT
    ano_pesquisa,
    regiao,
    SUM(total_profissionais) AS total,
    ROUND(100.0 * SUM(total_profissionais) / SUM(SUM(total_profissionais)) OVER (PARTITION BY ano_pesquisa), 1) AS pct
FROM gold_mercado
GROUP BY ano_pesquisa, regiao
ORDER BY ano_pesquisa, total DESC;
