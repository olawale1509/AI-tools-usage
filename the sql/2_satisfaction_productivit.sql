-- Which specific AI tools and primary use cases yield the highest percentage of productivity gains, and how does user experience level mediate this relationship?
-- the data by tool and use case, calculating the average productivity gain and the average hours saved, giving you a straightforward leaderboard.          
--Objective: Quantify the operational impact of different AI use cases (e.g., Automation, Data Analysis, Translation) to determine the most value-generating tools and whether prior technical expertise is required to unlock this value.
CREATE VIEW satisfaction_productivity as
SELECT ai_tool,
    primary_use_case,
    COUNT(user_id) AS total_users,
    ROUND(AVG(productivity_gain_pct), 2) AS avg_productivity_gain_pct,
    round(
        SUM(productivity_gain_pct) * 100.0 / SUM(SUM(productivity_gain_pct)) OVER (),
        2
    ) AS rate_productivity,
    40 - ROUND(AVG(usage_hours_per_week), 2) AS avg_hours_saved_weekly,
    CASE
        WHEN round(
            SUM(productivity_gain_pct) * 100.0 / SUM(SUM(productivity_gain_pct)) OVER (),
            2
        ) > 0.20 THEN 'Expert'
        WHEN round(
            SUM(productivity_gain_pct) * 100.0 / SUM(SUM(productivity_gain_pct)) OVER (),
            2
        ) >= 0.17 THEN 'Intermediate'
        ELSE 'Beginner'
    END as User_Level
FROM ai_users
GROUP BY ai_tool,
    primary_use_case
ORDER BY avg_productivity_gain_pct DESC;