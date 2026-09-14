-- TECNOLOGIAS

-- 1) Top 10 tecnologias mais mencionadas por ano (todas as categorias)
SELECT ano_pesquisa, categoria, tecnologia, SUM(total_mencoes) AS total
FROM gold_tecnologias
GROUP BY ano_pesquisa, categoria, tecnologia
ORDER BY ano_pesquisa, total DESC
LIMIT 10;

-- 2) Evolução de uma linguagem específica ao longo dos 3 anos (exemplo: Python)
SELECT ano_pesquisa, SUM(total_mencoes) AS total
FROM gold_tecnologias
WHERE categoria = 'linguagem' AND tecnologia = 'Python'
GROUP BY ano_pesquisa
ORDER BY ano_pesquisa;

-- 3) Tecnologias mais usadas por senioridade (ano mais recente)
SELECT categoria, tecnologia, senioridade_comparavel, SUM(total_mencoes) AS total
FROM gold_tecnologias
WHERE ano_pesquisa = '2025-2026'
GROUP BY categoria, tecnologia, senioridade_comparavel
ORDER BY total DESC
LIMIT 20;

-- 4) Tecnologias mais usadas por cargo (ano mais recente)
SELECT categoria, tecnologia, cargo_atual, SUM(total_mencoes) AS total
FROM gold_tecnologias
WHERE ano_pesquisa = '2025-2026'
GROUP BY categoria, tecnologia, cargo_atual
ORDER BY total DESC
LIMIT 20;

-- 5) Ranking de clouds mais usadas, por ano
SELECT ano_pesquisa, tecnologia AS cloud, SUM(total_mencoes) AS total
FROM gold_tecnologias
WHERE categoria = 'cloud'
GROUP BY ano_pesquisa, tecnologia
ORDER BY ano_pesquisa, total DESC;
