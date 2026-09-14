-- TRABALHO

-- 1) Distribuição do modelo de trabalho por ano (% do total)
SELECT
    ano_pesquisa,
    modelo_trabalho,
    SUM(total_profissionais) AS total,
    ROUND(100.0 * SUM(total_profissionais) / SUM(SUM(total_profissionais)) OVER (PARTITION BY ano_pesquisa), 1) AS pct
FROM gold_trabalho
GROUP BY ano_pesquisa, modelo_trabalho
ORDER BY ano_pesquisa, total DESC;

-- 2) Evolução do modelo 100% remoto ao longo dos 3 anos
SELECT ano_pesquisa, SUM(total_profissionais) AS total
FROM gold_trabalho
WHERE modelo_trabalho = 'Modelo 100% remoto'
GROUP BY ano_pesquisa
ORDER BY ano_pesquisa;

-- 3) Relação entre modelo de trabalho e faixa salarial (ano mais recente)
SELECT modelo_trabalho, faixa_salarial, SUM(total_profissionais) AS total
FROM gold_trabalho
WHERE ano_pesquisa = '2025-2026'
GROUP BY modelo_trabalho, faixa_salarial
ORDER BY modelo_trabalho, total DESC;

-- 4) Modelo de trabalho por senioridade (ano mais recente)
SELECT senioridade_comparavel, modelo_trabalho, SUM(total_profissionais) AS total
FROM gold_trabalho
WHERE ano_pesquisa = '2025-2026'
GROUP BY senioridade_comparavel, modelo_trabalho
ORDER BY senioridade_comparavel, total DESC;
