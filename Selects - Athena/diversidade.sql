-- DIVERSIDADE

-- 1) Distribuição de gênero por ano (% do total)
SELECT
    ano_pesquisa,
    genero,
    SUM(total_profissionais) AS total,
    ROUND(100.0 * SUM(total_profissionais) / SUM(SUM(total_profissionais)) OVER (PARTITION BY ano_pesquisa), 1) AS pct
FROM gold_diversidade
GROUP BY ano_pesquisa, genero
ORDER BY ano_pesquisa, total DESC;

-- 2) Gênero por senioridade (ano mais recente)
SELECT senioridade_comparavel, genero, SUM(total_profissionais) AS total
FROM gold_diversidade
WHERE ano_pesquisa = '2025-2026'
GROUP BY senioridade_comparavel, genero
ORDER BY senioridade_comparavel, total DESC;

-- 3) Gênero por região (ano mais recente)
SELECT regiao, genero, SUM(total_profissionais) AS total
FROM gold_diversidade
WHERE ano_pesquisa = '2025-2026'
GROUP BY regiao, genero
ORDER BY regiao, total DESC;

-- 4) Gênero por cargo (ano mais recente)
SELECT cargo_atual, genero, SUM(total_profissionais) AS total
FROM gold_diversidade
WHERE ano_pesquisa = '2025-2026'
GROUP BY cargo_atual, genero
ORDER BY cargo_atual, total DESC;
