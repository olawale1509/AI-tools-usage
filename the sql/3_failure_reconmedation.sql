-- To what extent do infrastructural deficits (such as poor internet quality) versus inherent tool limitations dictate the failure rates of AI implementations?
-- Objective: Diagnose the root causes of AI deployment failures, isolating environmental and infrastructural bottlenecks from technical shortcomings, to propose strategic implementation solutions for businesses.
SELECT ai_tool,
    user_type,
    experience_level,
    industry,
    primary_use_case,
    satisfaction_score,
    failure_reason
FROM ai_users
WHERE success IS FALSE
    AND failure_reason is NOT NULL
    AND internet_quality IN ('Poor', 'Good')
    AND satisfaction_score < 2.6
GROUP BY user_id
HAVING productivity_gain_pct < 75
LIMIT 10;
select DISTINCT satisfaction_score,
    count(satisfaction_score)
FROM ai_users
WHERE satisfaction_score < 2.6
GROUP BY satisfaction_score
ORDER BY satisfaction_score DESC