-- REMUNERACAO

-- 1) Faixa salarial mais comum, por ano
SELECT ano_pesquisa, faixa_salarial, SUM(total_profissionais) AS total
FROM gold_remuneracao
GROUP BY ano_pesquisa, faixa_salarial
ORDER BY ano_pesquisa, total DESC;

-- 2) Faixa salarial por senioridade (para ver se sênior ganha mais - validação de senso comum)
SELECT ano_pesquisa, senioridade_comparavel, faixa_salarial, SUM(total_profissionais) AS total
FROM gold_remuneracao
GROUP BY ano_pesquisa, senioridade_comparavel, faixa_salarial
ORDER BY ano_pesquisa, senioridade_comparavel, total DESC;

-- 3) Faixa salarial por cargo
SELECT ano_pesquisa, cargo_atual, faixa_salarial, SUM(total_profissionais) AS total
FROM gold_remuneracao
GROUP BY ano_pesquisa, cargo_atual, faixa_salarial
ORDER BY ano_pesquisa, cargo_atual, total DESC;

-- 4) Faixa salarial por região
SELECT ano_pesquisa, regiao, faixa_salarial, SUM(total_profissionais) AS total
FROM gold_remuneracao
GROUP BY ano_pesquisa, regiao, faixa_salarial
ORDER BY ano_pesquisa, regiao, total DESC;

-- 5) Evolução salarial: % em cada faixa ao longo dos 3 anos
SELECT
    faixa_salarial,
    SUM(CASE WHEN ano_pesquisa = '2023' THEN total_profissionais ELSE 0 END) AS total_2023,
    SUM(CASE WHEN ano_pesquisa = '2024' THEN total_profissionais ELSE 0 END) AS total_2024,
    SUM(CASE WHEN ano_pesquisa = '2025-2026' THEN total_profissionais ELSE 0 END) AS total_2025_2026
FROM gold_remuneracao
GROUP BY faixa_salarial
ORDER BY faixa_salarial;
