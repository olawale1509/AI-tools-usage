--How do AI adoption density and utilization intensity vary across different global country, professional roles, and industries?
--  but across three different dimensions: geography, profession, and industry.
-- Objective: Map the global demographic distribution of AI usage to identify which specific professional roles (e.g., Data Analysts, Doctors, Startup Founders) and geographic markets are driving heavy adoption and integration.
SELECT --ROW_NUMBER() OVER(PARTITION BY country)
    country,
    industry,
    user_type,
    COUNT(*) AS user_count,
    ROUND(AVG(usage_hours_per_week), 0) as Time_used
FROM ai_users
GROUP BY country,
    industry,
    user_type
ORDER BY user_count DESC;