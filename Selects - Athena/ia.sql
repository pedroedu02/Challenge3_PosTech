-- INTELIGENCIA ARTIFICIAL (IA)


-- 1) Evolução da adoção de IA (% que NÃO usa nenhuma solução, por ano)
SELECT
    ano_pesquisa,
    SUM(CASE WHEN uso_chatgpt_copilot LIKE '%Não utilizo%' THEN total_profissionais ELSE 0 END) AS nao_usa,
    SUM(total_profissionais) AS total,
    ROUND(100.0 * SUM(CASE WHEN uso_chatgpt_copilot LIKE '%Não utilizo%' THEN total_profissionais ELSE 0 END)
          / SUM(total_profissionais), 1) AS pct_nao_usa
FROM gold_ia
GROUP BY ano_pesquisa
ORDER BY ano_pesquisa;

-- 2) Distribuição completa das respostas de uso de IA, por ano
SELECT ano_pesquisa, uso_chatgpt_copilot, SUM(total_profissionais) AS total
FROM gold_ia
GROUP BY ano_pesquisa, uso_chatgpt_copilot
ORDER BY ano_pesquisa, total DESC;

-- 3) Adoção de IA por senioridade (ano mais recente)
SELECT
    senioridade_comparavel,
    SUM(CASE WHEN uso_chatgpt_copilot NOT LIKE '%Não utilizo%' THEN total_profissionais ELSE 0 END) AS usa_ia,
    SUM(total_profissionais) AS total,
    ROUND(100.0 * SUM(CASE WHEN uso_chatgpt_copilot NOT LIKE '%Não utilizo%' THEN total_profissionais ELSE 0 END)
          / SUM(total_profissionais), 1) AS pct_usa_ia
FROM gold_ia
WHERE ano_pesquisa = '2025-2026'
GROUP BY senioridade_comparavel
ORDER BY pct_usa_ia DESC;

-- 4) Adoção de IA por cargo (ano mais recente)
SELECT
    cargo_atual,
    SUM(CASE WHEN uso_chatgpt_copilot NOT LIKE '%Não utilizo%' THEN total_profissionais ELSE 0 END) AS usa_ia,
    SUM(total_profissionais) AS total
FROM gold_ia
WHERE ano_pesquisa = '2025-2026'
GROUP BY cargo_atual
ORDER BY total DESC
LIMIT 10;
