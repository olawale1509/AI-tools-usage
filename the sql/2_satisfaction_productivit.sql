-- Which specific AI tools and primary use cases yield the highest percentage of productivity gains, and how does user experience level mediate this relationship?
-- the data by tool and use case, calculating the average productivity gain and the average hours saved, giving you a straightforward leaderboard.          
--Objective: Quantify the operational impact of different AI use cases (e.g., Automation, Data Analysis, Translation) to determine the most value-generating tools and whether prior technical expertise is required to unlock this value.
set search_path to ai_users;
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
[
  {
    "ai_tool": "Tableau AI",
    "primary_use_case": "Data Analysis",
    "total_users": "382",
    "avg_productivity_gain_pct": "84.16",
    "rate_productivity": "0.21",
    "avg_hours_saved_weekly": "9.94",
    "user_level": "Expert"
  },
  {
    "ai_tool": "Power BI Copilot",
    "primary_use_case": "Learning",
    "total_users": "330",
    "avg_productivity_gain_pct": "83.32",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "10.20",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Deepgram",
    "primary_use_case": "Automation",
    "total_users": "328",
    "avg_productivity_gain_pct": "83.04",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "8.95",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Mistral",
    "primary_use_case": "Marketing",
    "total_users": "347",
    "avg_productivity_gain_pct": "83.01",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "10.21",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Codeium",
    "primary_use_case": "Marketing",
    "total_users": "372",
    "avg_productivity_gain_pct": "82.92",
    "rate_productivity": "0.20",
    "avg_hours_saved_weekly": "10.45",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Claude",
    "primary_use_case": "Content Writing",
    "total_users": "375",
    "avg_productivity_gain_pct": "82.91",
    "rate_productivity": "0.20",
    "avg_hours_saved_weekly": "8.68",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Boston Dynamics AI",
    "primary_use_case": "Translation",
    "total_users": "349",
    "avg_productivity_gain_pct": "82.61",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "10.80",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Figma AI",
    "primary_use_case": "Data Analysis",
    "total_users": "365",
    "avg_productivity_gain_pct": "82.37",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "10.37",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "TensorFlow",
    "primary_use_case": "Customer Support",
    "total_users": "364",
    "avg_productivity_gain_pct": "82.27",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "9.33",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Khanmigo",
    "primary_use_case": "Learning",
    "total_users": "372",
    "avg_productivity_gain_pct": "82.23",
    "rate_productivity": "0.20",
    "avg_hours_saved_weekly": "9.41",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "HeyGen",
    "primary_use_case": "Data Analysis",
    "total_users": "357",
    "avg_productivity_gain_pct": "82.19",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "9.86",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Cursor AI",
    "primary_use_case": "Research",
    "total_users": "342",
    "avg_productivity_gain_pct": "82.11",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.54",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "IBM Watson",
    "primary_use_case": "Data Analysis",
    "total_users": "377",
    "avg_productivity_gain_pct": "81.92",
    "rate_productivity": "0.20",
    "avg_hours_saved_weekly": "9.70",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Gemini",
    "primary_use_case": "Coding",
    "total_users": "390",
    "avg_productivity_gain_pct": "81.82",
    "rate_productivity": "0.21",
    "avg_hours_saved_weekly": "8.59",
    "user_level": "Expert"
  },
  {
    "ai_tool": "Stable Diffusion",
    "primary_use_case": "Customer Support",
    "total_users": "415",
    "avg_productivity_gain_pct": "81.66",
    "rate_productivity": "0.22",
    "avg_hours_saved_weekly": "8.94",
    "user_level": "Expert"
  },
  {
    "ai_tool": "Tabnine",
    "primary_use_case": "Learning",
    "total_users": "388",
    "avg_productivity_gain_pct": "81.66",
    "rate_productivity": "0.20",
    "avg_hours_saved_weekly": "9.51",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "DALL-E",
    "primary_use_case": "Coding",
    "total_users": "375",
    "avg_productivity_gain_pct": "81.62",
    "rate_productivity": "0.20",
    "avg_hours_saved_weekly": "8.69",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Grok",
    "primary_use_case": "Marketing",
    "total_users": "382",
    "avg_productivity_gain_pct": "81.59",
    "rate_productivity": "0.20",
    "avg_hours_saved_weekly": "10.61",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Gemini",
    "primary_use_case": "Customer Support",
    "total_users": "353",
    "avg_productivity_gain_pct": "81.58",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "8.25",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Devin",
    "primary_use_case": "Content Writing",
    "total_users": "341",
    "avg_productivity_gain_pct": "81.57",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.81",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "DeepSeek",
    "primary_use_case": "Learning",
    "total_users": "334",
    "avg_productivity_gain_pct": "81.55",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "8.59",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Kensho",
    "primary_use_case": "Data Analysis",
    "total_users": "363",
    "avg_productivity_gain_pct": "81.54",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "9.59",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Grok",
    "primary_use_case": "Translation",
    "total_users": "351",
    "avg_productivity_gain_pct": "81.53",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "8.51",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Khanmigo",
    "primary_use_case": "Content Writing",
    "total_users": "331",
    "avg_productivity_gain_pct": "81.49",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "9.92",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "IBM Watson",
    "primary_use_case": "Marketing",
    "total_users": "376",
    "avg_productivity_gain_pct": "81.48",
    "rate_productivity": "0.20",
    "avg_hours_saved_weekly": "9.78",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Canva AI",
    "primary_use_case": "Content Writing",
    "total_users": "343",
    "avg_productivity_gain_pct": "81.47",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "8.59",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Elicit",
    "primary_use_case": "Video Creation",
    "total_users": "373",
    "avg_productivity_gain_pct": "81.42",
    "rate_productivity": "0.20",
    "avg_hours_saved_weekly": "10.00",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Grok",
    "primary_use_case": "Content Writing",
    "total_users": "382",
    "avg_productivity_gain_pct": "81.33",
    "rate_productivity": "0.20",
    "avg_hours_saved_weekly": "9.48",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Power BI Copilot",
    "primary_use_case": "Design",
    "total_users": "366",
    "avg_productivity_gain_pct": "81.27",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "8.71",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "TensorFlow",
    "primary_use_case": "Automation",
    "total_users": "385",
    "avg_productivity_gain_pct": "81.26",
    "rate_productivity": "0.20",
    "avg_hours_saved_weekly": "8.54",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Whisper",
    "primary_use_case": "Marketing",
    "total_users": "370",
    "avg_productivity_gain_pct": "81.10",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "8.98",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "TensorFlow",
    "primary_use_case": "Translation",
    "total_users": "337",
    "avg_productivity_gain_pct": "81.08",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.71",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "DataRobot",
    "primary_use_case": "Translation",
    "total_users": "370",
    "avg_productivity_gain_pct": "81.06",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "10.35",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Synthesia",
    "primary_use_case": "Automation",
    "total_users": "364",
    "avg_productivity_gain_pct": "81.03",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "10.05",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Elicit",
    "primary_use_case": "Design",
    "total_users": "363",
    "avg_productivity_gain_pct": "80.95",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "8.38",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Hugging Face",
    "primary_use_case": "Design",
    "total_users": "346",
    "avg_productivity_gain_pct": "80.91",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "8.15",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Duolingo Max",
    "primary_use_case": "Customer Support",
    "total_users": "362",
    "avg_productivity_gain_pct": "80.87",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "9.79",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Grok",
    "primary_use_case": "Video Creation",
    "total_users": "324",
    "avg_productivity_gain_pct": "80.82",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "10.27",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Duolingo Max",
    "primary_use_case": "Research",
    "total_users": "375",
    "avg_productivity_gain_pct": "80.78",
    "rate_productivity": "0.20",
    "avg_hours_saved_weekly": "8.81",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Claude",
    "primary_use_case": "Automation",
    "total_users": "371",
    "avg_productivity_gain_pct": "80.76",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "9.29",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "AutoGPT",
    "primary_use_case": "Automation",
    "total_users": "364",
    "avg_productivity_gain_pct": "80.75",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "10.97",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Khanmigo",
    "primary_use_case": "Marketing",
    "total_users": "330",
    "avg_productivity_gain_pct": "80.63",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "8.09",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "LLaMA",
    "primary_use_case": "Automation",
    "total_users": "358",
    "avg_productivity_gain_pct": "80.61",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "9.19",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Duolingo Max",
    "primary_use_case": "Marketing",
    "total_users": "370",
    "avg_productivity_gain_pct": "80.60",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "8.85",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Canva AI",
    "primary_use_case": "Translation",
    "total_users": "348",
    "avg_productivity_gain_pct": "80.59",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "10.61",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Claude",
    "primary_use_case": "Data Analysis",
    "total_users": "347",
    "avg_productivity_gain_pct": "80.54",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "10.67",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Tableau AI",
    "primary_use_case": "Marketing",
    "total_users": "383",
    "avg_productivity_gain_pct": "80.50",
    "rate_productivity": "0.20",
    "avg_hours_saved_weekly": "9.79",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "GPT-4",
    "primary_use_case": "Customer Support",
    "total_users": "384",
    "avg_productivity_gain_pct": "80.48",
    "rate_productivity": "0.20",
    "avg_hours_saved_weekly": "10.23",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Tabnine",
    "primary_use_case": "Video Creation",
    "total_users": "414",
    "avg_productivity_gain_pct": "80.47",
    "rate_productivity": "0.21",
    "avg_hours_saved_weekly": "9.86",
    "user_level": "Expert"
  },
  {
    "ai_tool": "Tableau AI",
    "primary_use_case": "Content Writing",
    "total_users": "369",
    "avg_productivity_gain_pct": "80.46",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "10.81",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "AlphaFold",
    "primary_use_case": "Learning",
    "total_users": "395",
    "avg_productivity_gain_pct": "80.41",
    "rate_productivity": "0.20",
    "avg_hours_saved_weekly": "9.20",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Tabnine",
    "primary_use_case": "Content Writing",
    "total_users": "370",
    "avg_productivity_gain_pct": "80.40",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "9.79",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Claude",
    "primary_use_case": "Design",
    "total_users": "386",
    "avg_productivity_gain_pct": "80.39",
    "rate_productivity": "0.20",
    "avg_hours_saved_weekly": "9.47",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Runway ML",
    "primary_use_case": "Content Writing",
    "total_users": "377",
    "avg_productivity_gain_pct": "80.39",
    "rate_productivity": "0.20",
    "avg_hours_saved_weekly": "8.95",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Runway ML",
    "primary_use_case": "Data Analysis",
    "total_users": "373",
    "avg_productivity_gain_pct": "80.38",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "9.08",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Khanmigo",
    "primary_use_case": "Translation",
    "total_users": "364",
    "avg_productivity_gain_pct": "80.37",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "8.89",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "GitHub Copilot",
    "primary_use_case": "Design",
    "total_users": "366",
    "avg_productivity_gain_pct": "80.36",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "9.73",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Tesla Optimus",
    "primary_use_case": "Customer Support",
    "total_users": "337",
    "avg_productivity_gain_pct": "80.34",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "10.87",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Mistral",
    "primary_use_case": "Design",
    "total_users": "347",
    "avg_productivity_gain_pct": "80.29",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.60",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Mistral",
    "primary_use_case": "Video Creation",
    "total_users": "394",
    "avg_productivity_gain_pct": "80.29",
    "rate_productivity": "0.20",
    "avg_hours_saved_weekly": "10.41",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Stable Diffusion",
    "primary_use_case": "Content Writing",
    "total_users": "382",
    "avg_productivity_gain_pct": "80.28",
    "rate_productivity": "0.20",
    "avg_hours_saved_weekly": "10.16",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Figma AI",
    "primary_use_case": "Coding",
    "total_users": "355",
    "avg_productivity_gain_pct": "80.27",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "10.21",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "IBM Watson",
    "primary_use_case": "Translation",
    "total_users": "387",
    "avg_productivity_gain_pct": "80.26",
    "rate_productivity": "0.20",
    "avg_hours_saved_weekly": "9.79",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "IBM Watson",
    "primary_use_case": "Coding",
    "total_users": "347",
    "avg_productivity_gain_pct": "80.25",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "10.00",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Microsoft Copilot",
    "primary_use_case": "Learning",
    "total_users": "304",
    "avg_productivity_gain_pct": "80.25",
    "rate_productivity": "0.16",
    "avg_hours_saved_weekly": "7.72",
    "user_level": "Beginner"
  },
  {
    "ai_tool": "Whisper",
    "primary_use_case": "Content Writing",
    "total_users": "350",
    "avg_productivity_gain_pct": "80.23",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.20",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Jasper",
    "primary_use_case": "Data Analysis",
    "total_users": "362",
    "avg_productivity_gain_pct": "80.21",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "10.63",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "GPT-4",
    "primary_use_case": "Design",
    "total_users": "383",
    "avg_productivity_gain_pct": "80.20",
    "rate_productivity": "0.20",
    "avg_hours_saved_weekly": "9.48",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Codeium",
    "primary_use_case": "Video Creation",
    "total_users": "385",
    "avg_productivity_gain_pct": "80.19",
    "rate_productivity": "0.20",
    "avg_hours_saved_weekly": "8.30",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "GitHub Copilot",
    "primary_use_case": "Marketing",
    "total_users": "317",
    "avg_productivity_gain_pct": "80.19",
    "rate_productivity": "0.16",
    "avg_hours_saved_weekly": "9.81",
    "user_level": "Beginner"
  },
  {
    "ai_tool": "Mistral",
    "primary_use_case": "Translation",
    "total_users": "371",
    "avg_productivity_gain_pct": "80.17",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "11.78",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Copy.ai",
    "primary_use_case": "Translation",
    "total_users": "372",
    "avg_productivity_gain_pct": "80.13",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "10.18",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Qwen",
    "primary_use_case": "Research",
    "total_users": "392",
    "avg_productivity_gain_pct": "80.11",
    "rate_productivity": "0.20",
    "avg_hours_saved_weekly": "9.17",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "GPT-5",
    "primary_use_case": "Content Writing",
    "total_users": "374",
    "avg_productivity_gain_pct": "80.10",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "8.02",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Power BI Copilot",
    "primary_use_case": "Translation",
    "total_users": "336",
    "avg_productivity_gain_pct": "80.09",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "8.53",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Tabnine",
    "primary_use_case": "Translation",
    "total_users": "375",
    "avg_productivity_gain_pct": "80.09",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "10.33",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "GrammarlyGO",
    "primary_use_case": "Marketing",
    "total_users": "392",
    "avg_productivity_gain_pct": "80.09",
    "rate_productivity": "0.20",
    "avg_hours_saved_weekly": "10.22",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "TensorFlow",
    "primary_use_case": "Data Analysis",
    "total_users": "376",
    "avg_productivity_gain_pct": "80.08",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "9.65",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "ElevenLabs",
    "primary_use_case": "Learning",
    "total_users": "347",
    "avg_productivity_gain_pct": "80.05",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.30",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Boston Dynamics AI",
    "primary_use_case": "Video Creation",
    "total_users": "388",
    "avg_productivity_gain_pct": "79.99",
    "rate_productivity": "0.20",
    "avg_hours_saved_weekly": "10.96",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Jasper",
    "primary_use_case": "Video Creation",
    "total_users": "374",
    "avg_productivity_gain_pct": "79.98",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "10.27",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Copy.ai",
    "primary_use_case": "Customer Support",
    "total_users": "325",
    "avg_productivity_gain_pct": "79.96",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "9.34",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "AutoGPT",
    "primary_use_case": "Learning",
    "total_users": "371",
    "avg_productivity_gain_pct": "79.95",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "8.74",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "GitHub Copilot",
    "primary_use_case": "Data Analysis",
    "total_users": "352",
    "avg_productivity_gain_pct": "79.92",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.82",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Gemini",
    "primary_use_case": "Design",
    "total_users": "350",
    "avg_productivity_gain_pct": "79.83",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.86",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "AutoGPT",
    "primary_use_case": "Translation",
    "total_users": "361",
    "avg_productivity_gain_pct": "79.82",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "10.91",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Khanmigo",
    "primary_use_case": "Customer Support",
    "total_users": "384",
    "avg_productivity_gain_pct": "79.81",
    "rate_productivity": "0.20",
    "avg_hours_saved_weekly": "10.02",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Duolingo Max",
    "primary_use_case": "Data Analysis",
    "total_users": "357",
    "avg_productivity_gain_pct": "79.81",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.07",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Codeium",
    "primary_use_case": "Automation",
    "total_users": "352",
    "avg_productivity_gain_pct": "79.80",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.11",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Deepgram",
    "primary_use_case": "Marketing",
    "total_users": "388",
    "avg_productivity_gain_pct": "79.78",
    "rate_productivity": "0.20",
    "avg_hours_saved_weekly": "11.18",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Perplexity AI",
    "primary_use_case": "Coding",
    "total_users": "369",
    "avg_productivity_gain_pct": "79.74",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "8.01",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Jasper",
    "primary_use_case": "Research",
    "total_users": "369",
    "avg_productivity_gain_pct": "79.73",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "9.36",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "DataRobot",
    "primary_use_case": "Research",
    "total_users": "352",
    "avg_productivity_gain_pct": "79.69",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.22",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Falcon",
    "primary_use_case": "Learning",
    "total_users": "356",
    "avg_productivity_gain_pct": "79.69",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.25",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "DALL-E",
    "primary_use_case": "Automation",
    "total_users": "327",
    "avg_productivity_gain_pct": "79.66",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "9.05",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Qwen",
    "primary_use_case": "Learning",
    "total_users": "380",
    "avg_productivity_gain_pct": "79.65",
    "rate_productivity": "0.20",
    "avg_hours_saved_weekly": "10.62",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "LangChain",
    "primary_use_case": "Learning",
    "total_users": "375",
    "avg_productivity_gain_pct": "79.63",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "8.81",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Power BI Copilot",
    "primary_use_case": "Coding",
    "total_users": "366",
    "avg_productivity_gain_pct": "79.59",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "10.39",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Whisper",
    "primary_use_case": "Data Analysis",
    "total_users": "381",
    "avg_productivity_gain_pct": "79.58",
    "rate_productivity": "0.20",
    "avg_hours_saved_weekly": "10.49",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Notion AI",
    "primary_use_case": "Marketing",
    "total_users": "369",
    "avg_productivity_gain_pct": "79.58",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "8.86",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "BloombergGPT",
    "primary_use_case": "Translation",
    "total_users": "377",
    "avg_productivity_gain_pct": "79.56",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "8.84",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Midjourney",
    "primary_use_case": "Marketing",
    "total_users": "403",
    "avg_productivity_gain_pct": "79.55",
    "rate_productivity": "0.21",
    "avg_hours_saved_weekly": "10.57",
    "user_level": "Expert"
  },
  {
    "ai_tool": "Whisper",
    "primary_use_case": "Customer Support",
    "total_users": "351",
    "avg_productivity_gain_pct": "79.55",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "10.22",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Falcon",
    "primary_use_case": "Coding",
    "total_users": "360",
    "avg_productivity_gain_pct": "79.54",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "10.09",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Hugging Face",
    "primary_use_case": "Research",
    "total_users": "358",
    "avg_productivity_gain_pct": "79.54",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.21",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Microsoft Copilot",
    "primary_use_case": "Marketing",
    "total_users": "378",
    "avg_productivity_gain_pct": "79.52",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "9.95",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Falcon",
    "primary_use_case": "Customer Support",
    "total_users": "327",
    "avg_productivity_gain_pct": "79.51",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "9.99",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Gemini",
    "primary_use_case": "Research",
    "total_users": "358",
    "avg_productivity_gain_pct": "79.49",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "10.17",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "BloombergGPT",
    "primary_use_case": "Research",
    "total_users": "375",
    "avg_productivity_gain_pct": "79.49",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "7.13",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "DataRobot",
    "primary_use_case": "Content Writing",
    "total_users": "356",
    "avg_productivity_gain_pct": "79.49",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "8.60",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "GrammarlyGO",
    "primary_use_case": "Design",
    "total_users": "355",
    "avg_productivity_gain_pct": "79.46",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "8.22",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "GPT-5",
    "primary_use_case": "Learning",
    "total_users": "356",
    "avg_productivity_gain_pct": "79.44",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "10.29",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Synthesia",
    "primary_use_case": "Video Creation",
    "total_users": "380",
    "avg_productivity_gain_pct": "79.43",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "9.08",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "IBM Watson",
    "primary_use_case": "Customer Support",
    "total_users": "334",
    "avg_productivity_gain_pct": "79.39",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "7.85",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "BloombergGPT",
    "primary_use_case": "Content Writing",
    "total_users": "361",
    "avg_productivity_gain_pct": "79.36",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.20",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Microsoft Copilot",
    "primary_use_case": "Coding",
    "total_users": "356",
    "avg_productivity_gain_pct": "79.35",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "7.67",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Kensho",
    "primary_use_case": "Translation",
    "total_users": "324",
    "avg_productivity_gain_pct": "79.33",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "8.19",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "GPT-5",
    "primary_use_case": "Coding",
    "total_users": "373",
    "avg_productivity_gain_pct": "79.33",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "10.50",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "HeyGen",
    "primary_use_case": "Customer Support",
    "total_users": "357",
    "avg_productivity_gain_pct": "79.33",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "8.98",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "DataRobot",
    "primary_use_case": "Data Analysis",
    "total_users": "351",
    "avg_productivity_gain_pct": "79.31",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "7.44",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "TensorFlow",
    "primary_use_case": "Research",
    "total_users": "349",
    "avg_productivity_gain_pct": "79.31",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.12",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Tesla Optimus",
    "primary_use_case": "Marketing",
    "total_users": "369",
    "avg_productivity_gain_pct": "79.30",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "10.23",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "DataRobot",
    "primary_use_case": "Learning",
    "total_users": "380",
    "avg_productivity_gain_pct": "79.29",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "8.96",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "PyTorch",
    "primary_use_case": "Translation",
    "total_users": "359",
    "avg_productivity_gain_pct": "79.29",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "10.80",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Jasper",
    "primary_use_case": "Marketing",
    "total_users": "362",
    "avg_productivity_gain_pct": "79.27",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "8.86",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Khanmigo",
    "primary_use_case": "Design",
    "total_users": "343",
    "avg_productivity_gain_pct": "79.27",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.24",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "LLaMA",
    "primary_use_case": "Customer Support",
    "total_users": "363",
    "avg_productivity_gain_pct": "79.24",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "10.58",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "GrammarlyGO",
    "primary_use_case": "Data Analysis",
    "total_users": "395",
    "avg_productivity_gain_pct": "79.23",
    "rate_productivity": "0.20",
    "avg_hours_saved_weekly": "8.41",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "LLaMA",
    "primary_use_case": "Video Creation",
    "total_users": "369",
    "avg_productivity_gain_pct": "79.23",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "8.76",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Jasper",
    "primary_use_case": "Learning",
    "total_users": "366",
    "avg_productivity_gain_pct": "79.22",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "9.14",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "DALL-E",
    "primary_use_case": "Data Analysis",
    "total_users": "325",
    "avg_productivity_gain_pct": "79.21",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "9.45",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "IBM Watson",
    "primary_use_case": "Learning",
    "total_users": "368",
    "avg_productivity_gain_pct": "79.21",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "11.00",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Hugging Face",
    "primary_use_case": "Customer Support",
    "total_users": "392",
    "avg_productivity_gain_pct": "79.21",
    "rate_productivity": "0.20",
    "avg_hours_saved_weekly": "9.26",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Grok",
    "primary_use_case": "Design",
    "total_users": "362",
    "avg_productivity_gain_pct": "79.21",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.34",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "TensorFlow",
    "primary_use_case": "Video Creation",
    "total_users": "391",
    "avg_productivity_gain_pct": "79.19",
    "rate_productivity": "0.20",
    "avg_hours_saved_weekly": "10.48",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "GitHub Copilot",
    "primary_use_case": "Learning",
    "total_users": "357",
    "avg_productivity_gain_pct": "79.17",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.69",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Canva AI",
    "primary_use_case": "Coding",
    "total_users": "382",
    "avg_productivity_gain_pct": "79.17",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "9.48",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "AlphaFold",
    "primary_use_case": "Marketing",
    "total_users": "332",
    "avg_productivity_gain_pct": "79.13",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "10.36",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Deepgram",
    "primary_use_case": "Content Writing",
    "total_users": "365",
    "avg_productivity_gain_pct": "79.11",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "10.37",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "DeepSeek",
    "primary_use_case": "Translation",
    "total_users": "353",
    "avg_productivity_gain_pct": "79.10",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "8.62",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Falcon",
    "primary_use_case": "Data Analysis",
    "total_users": "334",
    "avg_productivity_gain_pct": "79.10",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "12.42",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "GPT-5",
    "primary_use_case": "Data Analysis",
    "total_users": "380",
    "avg_productivity_gain_pct": "79.09",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "10.08",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "LLaMA",
    "primary_use_case": "Learning",
    "total_users": "361",
    "avg_productivity_gain_pct": "79.08",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "10.26",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "HeyGen",
    "primary_use_case": "Automation",
    "total_users": "404",
    "avg_productivity_gain_pct": "79.08",
    "rate_productivity": "0.21",
    "avg_hours_saved_weekly": "9.02",
    "user_level": "Expert"
  },
  {
    "ai_tool": "Figma AI",
    "primary_use_case": "Automation",
    "total_users": "357",
    "avg_productivity_gain_pct": "79.05",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.07",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Mistral",
    "primary_use_case": "Coding",
    "total_users": "393",
    "avg_productivity_gain_pct": "79.04",
    "rate_productivity": "0.20",
    "avg_hours_saved_weekly": "11.64",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Canva AI",
    "primary_use_case": "Learning",
    "total_users": "348",
    "avg_productivity_gain_pct": "79.04",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "8.72",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "BloombergGPT",
    "primary_use_case": "Video Creation",
    "total_users": "351",
    "avg_productivity_gain_pct": "79.03",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "8.63",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "AlphaFold",
    "primary_use_case": "Research",
    "total_users": "352",
    "avg_productivity_gain_pct": "79.03",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "10.77",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Devin",
    "primary_use_case": "Design",
    "total_users": "357",
    "avg_productivity_gain_pct": "79.01",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.31",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Devin",
    "primary_use_case": "Translation",
    "total_users": "406",
    "avg_productivity_gain_pct": "79.00",
    "rate_productivity": "0.21",
    "avg_hours_saved_weekly": "9.24",
    "user_level": "Expert"
  },
  {
    "ai_tool": "Falcon",
    "primary_use_case": "Design",
    "total_users": "379",
    "avg_productivity_gain_pct": "78.98",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "9.69",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Duolingo Max",
    "primary_use_case": "Automation",
    "total_users": "381",
    "avg_productivity_gain_pct": "78.97",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "9.89",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Codeium",
    "primary_use_case": "Research",
    "total_users": "348",
    "avg_productivity_gain_pct": "78.95",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "7.80",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Tesla Optimus",
    "primary_use_case": "Video Creation",
    "total_users": "344",
    "avg_productivity_gain_pct": "78.94",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "8.42",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Qwen",
    "primary_use_case": "Design",
    "total_users": "355",
    "avg_productivity_gain_pct": "78.94",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.43",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Khanmigo",
    "primary_use_case": "Research",
    "total_users": "353",
    "avg_productivity_gain_pct": "78.93",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "10.35",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Synthesia",
    "primary_use_case": "Marketing",
    "total_users": "380",
    "avg_productivity_gain_pct": "78.91",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "10.04",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Grok",
    "primary_use_case": "Automation",
    "total_users": "353",
    "avg_productivity_gain_pct": "78.91",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "8.48",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Stable Diffusion",
    "primary_use_case": "Coding",
    "total_users": "336",
    "avg_productivity_gain_pct": "78.89",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "10.54",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Whisper",
    "primary_use_case": "Automation",
    "total_users": "365",
    "avg_productivity_gain_pct": "78.89",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "11.51",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Jasper",
    "primary_use_case": "Customer Support",
    "total_users": "339",
    "avg_productivity_gain_pct": "78.86",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "9.86",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Runway ML",
    "primary_use_case": "Research",
    "total_users": "407",
    "avg_productivity_gain_pct": "78.81",
    "rate_productivity": "0.21",
    "avg_hours_saved_weekly": "9.72",
    "user_level": "Expert"
  },
  {
    "ai_tool": "Microsoft Copilot",
    "primary_use_case": "Research",
    "total_users": "320",
    "avg_productivity_gain_pct": "78.76",
    "rate_productivity": "0.16",
    "avg_hours_saved_weekly": "9.36",
    "user_level": "Beginner"
  },
  {
    "ai_tool": "Microsoft Copilot",
    "primary_use_case": "Video Creation",
    "total_users": "353",
    "avg_productivity_gain_pct": "78.75",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.32",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Claude",
    "primary_use_case": "Video Creation",
    "total_users": "371",
    "avg_productivity_gain_pct": "78.75",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "9.54",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "BloombergGPT",
    "primary_use_case": "Automation",
    "total_users": "362",
    "avg_productivity_gain_pct": "78.73",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "8.04",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Cursor AI",
    "primary_use_case": "Translation",
    "total_users": "342",
    "avg_productivity_gain_pct": "78.72",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "9.66",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "LangChain",
    "primary_use_case": "Marketing",
    "total_users": "348",
    "avg_productivity_gain_pct": "78.71",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.56",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "GPT-4",
    "primary_use_case": "Translation",
    "total_users": "374",
    "avg_productivity_gain_pct": "78.70",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "9.09",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "DataRobot",
    "primary_use_case": "Design",
    "total_users": "374",
    "avg_productivity_gain_pct": "78.70",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "10.46",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Canva AI",
    "primary_use_case": "Design",
    "total_users": "363",
    "avg_productivity_gain_pct": "78.69",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.54",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "DeepSeek",
    "primary_use_case": "Content Writing",
    "total_users": "351",
    "avg_productivity_gain_pct": "78.69",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "11.19",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Cohere",
    "primary_use_case": "Research",
    "total_users": "393",
    "avg_productivity_gain_pct": "78.69",
    "rate_productivity": "0.20",
    "avg_hours_saved_weekly": "9.33",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Power BI Copilot",
    "primary_use_case": "Content Writing",
    "total_users": "379",
    "avg_productivity_gain_pct": "78.68",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "9.12",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Copy.ai",
    "primary_use_case": "Data Analysis",
    "total_users": "342",
    "avg_productivity_gain_pct": "78.63",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "10.37",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "GrammarlyGO",
    "primary_use_case": "Automation",
    "total_users": "324",
    "avg_productivity_gain_pct": "78.60",
    "rate_productivity": "0.16",
    "avg_hours_saved_weekly": "10.65",
    "user_level": "Beginner"
  },
  {
    "ai_tool": "GPT-5",
    "primary_use_case": "Design",
    "total_users": "370",
    "avg_productivity_gain_pct": "78.60",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "10.10",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Cursor AI",
    "primary_use_case": "Automation",
    "total_users": "389",
    "avg_productivity_gain_pct": "78.59",
    "rate_productivity": "0.20",
    "avg_hours_saved_weekly": "8.76",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "LLaMA",
    "primary_use_case": "Data Analysis",
    "total_users": "374",
    "avg_productivity_gain_pct": "78.55",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "9.48",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Devin",
    "primary_use_case": "Coding",
    "total_users": "366",
    "avg_productivity_gain_pct": "78.55",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "9.99",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Tesla Optimus",
    "primary_use_case": "Learning",
    "total_users": "360",
    "avg_productivity_gain_pct": "78.52",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.79",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Codeium",
    "primary_use_case": "Content Writing",
    "total_users": "341",
    "avg_productivity_gain_pct": "78.50",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "9.73",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "DALL-E",
    "primary_use_case": "Customer Support",
    "total_users": "349",
    "avg_productivity_gain_pct": "78.49",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.23",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "LangChain",
    "primary_use_case": "Video Creation",
    "total_users": "309",
    "avg_productivity_gain_pct": "78.47",
    "rate_productivity": "0.16",
    "avg_hours_saved_weekly": "9.98",
    "user_level": "Beginner"
  },
  {
    "ai_tool": "DeepSeek",
    "primary_use_case": "Research",
    "total_users": "364",
    "avg_productivity_gain_pct": "78.41",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "11.53",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Cursor AI",
    "primary_use_case": "Learning",
    "total_users": "404",
    "avg_productivity_gain_pct": "78.41",
    "rate_productivity": "0.20",
    "avg_hours_saved_weekly": "10.09",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "AlphaFold",
    "primary_use_case": "Video Creation",
    "total_users": "369",
    "avg_productivity_gain_pct": "78.40",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "8.80",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "AutoGPT",
    "primary_use_case": "Design",
    "total_users": "345",
    "avg_productivity_gain_pct": "78.37",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "9.10",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Gemini",
    "primary_use_case": "Translation",
    "total_users": "394",
    "avg_productivity_gain_pct": "78.36",
    "rate_productivity": "0.20",
    "avg_hours_saved_weekly": "10.19",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "AlphaFold",
    "primary_use_case": "Design",
    "total_users": "370",
    "avg_productivity_gain_pct": "78.36",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "10.42",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Tesla Optimus",
    "primary_use_case": "Design",
    "total_users": "379",
    "avg_productivity_gain_pct": "78.35",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "8.74",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "DeepSeek",
    "primary_use_case": "Coding",
    "total_users": "368",
    "avg_productivity_gain_pct": "78.34",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "10.64",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Boston Dynamics AI",
    "primary_use_case": "Marketing",
    "total_users": "409",
    "avg_productivity_gain_pct": "78.34",
    "rate_productivity": "0.21",
    "avg_hours_saved_weekly": "9.75",
    "user_level": "Expert"
  },
  {
    "ai_tool": "DeepSeek",
    "primary_use_case": "Marketing",
    "total_users": "419",
    "avg_productivity_gain_pct": "78.33",
    "rate_productivity": "0.21",
    "avg_hours_saved_weekly": "8.09",
    "user_level": "Expert"
  },
  {
    "ai_tool": "HeyGen",
    "primary_use_case": "Learning",
    "total_users": "358",
    "avg_productivity_gain_pct": "78.32",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "8.92",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Deepgram",
    "primary_use_case": "Data Analysis",
    "total_users": "368",
    "avg_productivity_gain_pct": "78.28",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "10.43",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "GPT-4",
    "primary_use_case": "Data Analysis",
    "total_users": "370",
    "avg_productivity_gain_pct": "78.28",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "7.91",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Midjourney",
    "primary_use_case": "Learning",
    "total_users": "363",
    "avg_productivity_gain_pct": "78.28",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "8.36",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "GPT-4",
    "primary_use_case": "Content Writing",
    "total_users": "367",
    "avg_productivity_gain_pct": "78.27",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "9.57",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Tabnine",
    "primary_use_case": "Design",
    "total_users": "393",
    "avg_productivity_gain_pct": "78.26",
    "rate_productivity": "0.20",
    "avg_hours_saved_weekly": "10.00",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "AutoGPT",
    "primary_use_case": "Coding",
    "total_users": "349",
    "avg_productivity_gain_pct": "78.26",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "11.28",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "IBM Watson",
    "primary_use_case": "Design",
    "total_users": "335",
    "avg_productivity_gain_pct": "78.25",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "9.53",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Runway ML",
    "primary_use_case": "Coding",
    "total_users": "362",
    "avg_productivity_gain_pct": "78.25",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.63",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Cohere",
    "primary_use_case": "Automation",
    "total_users": "346",
    "avg_productivity_gain_pct": "78.25",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "11.52",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "PyTorch",
    "primary_use_case": "Data Analysis",
    "total_users": "365",
    "avg_productivity_gain_pct": "78.21",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "8.54",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Perplexity AI",
    "primary_use_case": "Automation",
    "total_users": "404",
    "avg_productivity_gain_pct": "78.21",
    "rate_productivity": "0.20",
    "avg_hours_saved_weekly": "9.48",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "LangChain",
    "primary_use_case": "Content Writing",
    "total_users": "346",
    "avg_productivity_gain_pct": "78.20",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "10.35",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Khanmigo",
    "primary_use_case": "Video Creation",
    "total_users": "368",
    "avg_productivity_gain_pct": "78.19",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "9.68",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Stable Diffusion",
    "primary_use_case": "Research",
    "total_users": "347",
    "avg_productivity_gain_pct": "78.18",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "9.52",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Notion AI",
    "primary_use_case": "Translation",
    "total_users": "343",
    "avg_productivity_gain_pct": "78.16",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "8.75",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "HeyGen",
    "primary_use_case": "Coding",
    "total_users": "359",
    "avg_productivity_gain_pct": "78.16",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.34",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Duolingo Max",
    "primary_use_case": "Coding",
    "total_users": "386",
    "avg_productivity_gain_pct": "78.15",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "10.40",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "PyTorch",
    "primary_use_case": "Marketing",
    "total_users": "341",
    "avg_productivity_gain_pct": "78.15",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "9.79",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Deepgram",
    "primary_use_case": "Research",
    "total_users": "362",
    "avg_productivity_gain_pct": "78.14",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "10.10",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Canva AI",
    "primary_use_case": "Research",
    "total_users": "400",
    "avg_productivity_gain_pct": "78.14",
    "rate_productivity": "0.20",
    "avg_hours_saved_weekly": "10.91",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Tabnine",
    "primary_use_case": "Research",
    "total_users": "369",
    "avg_productivity_gain_pct": "78.13",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "9.72",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Khanmigo",
    "primary_use_case": "Coding",
    "total_users": "365",
    "avg_productivity_gain_pct": "78.12",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.65",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Falcon",
    "primary_use_case": "Content Writing",
    "total_users": "341",
    "avg_productivity_gain_pct": "78.11",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "8.74",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Cohere",
    "primary_use_case": "Learning",
    "total_users": "348",
    "avg_productivity_gain_pct": "78.10",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "8.94",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Whisper",
    "primary_use_case": "Design",
    "total_users": "390",
    "avg_productivity_gain_pct": "78.07",
    "rate_productivity": "0.20",
    "avg_hours_saved_weekly": "9.51",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Kensho",
    "primary_use_case": "Automation",
    "total_users": "341",
    "avg_productivity_gain_pct": "78.04",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "8.83",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "GPT-5",
    "primary_use_case": "Research",
    "total_users": "364",
    "avg_productivity_gain_pct": "78.03",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "7.86",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Elicit",
    "primary_use_case": "Automation",
    "total_users": "362",
    "avg_productivity_gain_pct": "78.03",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "8.86",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Cohere",
    "primary_use_case": "Marketing",
    "total_users": "378",
    "avg_productivity_gain_pct": "78.03",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "11.52",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Perplexity AI",
    "primary_use_case": "Marketing",
    "total_users": "337",
    "avg_productivity_gain_pct": "78.01",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "10.26",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "IBM Watson",
    "primary_use_case": "Content Writing",
    "total_users": "354",
    "avg_productivity_gain_pct": "78.00",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "8.89",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Hugging Face",
    "primary_use_case": "Data Analysis",
    "total_users": "357",
    "avg_productivity_gain_pct": "77.97",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.84",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Qwen",
    "primary_use_case": "Marketing",
    "total_users": "336",
    "avg_productivity_gain_pct": "77.97",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "10.05",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Synthesia",
    "primary_use_case": "Coding",
    "total_users": "354",
    "avg_productivity_gain_pct": "77.97",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "10.27",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Tesla Optimus",
    "primary_use_case": "Content Writing",
    "total_users": "338",
    "avg_productivity_gain_pct": "77.96",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "10.01",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "LLaMA",
    "primary_use_case": "Marketing",
    "total_users": "358",
    "avg_productivity_gain_pct": "77.95",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.49",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Tableau AI",
    "primary_use_case": "Translation",
    "total_users": "380",
    "avg_productivity_gain_pct": "77.95",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "9.09",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Figma AI",
    "primary_use_case": "Learning",
    "total_users": "355",
    "avg_productivity_gain_pct": "77.92",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.78",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Hugging Face",
    "primary_use_case": "Video Creation",
    "total_users": "362",
    "avg_productivity_gain_pct": "77.92",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "8.86",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "GrammarlyGO",
    "primary_use_case": "Research",
    "total_users": "390",
    "avg_productivity_gain_pct": "77.91",
    "rate_productivity": "0.20",
    "avg_hours_saved_weekly": "9.00",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Stable Diffusion",
    "primary_use_case": "Design",
    "total_users": "381",
    "avg_productivity_gain_pct": "77.89",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "10.39",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Devin",
    "primary_use_case": "Customer Support",
    "total_users": "359",
    "avg_productivity_gain_pct": "77.89",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "8.10",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Canva AI",
    "primary_use_case": "Marketing",
    "total_users": "339",
    "avg_productivity_gain_pct": "77.89",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "9.79",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Elicit",
    "primary_use_case": "Learning",
    "total_users": "368",
    "avg_productivity_gain_pct": "77.89",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "8.19",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Power BI Copilot",
    "primary_use_case": "Data Analysis",
    "total_users": "394",
    "avg_productivity_gain_pct": "77.88",
    "rate_productivity": "0.20",
    "avg_hours_saved_weekly": "10.21",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "PyTorch",
    "primary_use_case": "Learning",
    "total_users": "364",
    "avg_productivity_gain_pct": "77.87",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.56",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Claude",
    "primary_use_case": "Learning",
    "total_users": "386",
    "avg_productivity_gain_pct": "77.87",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "9.43",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "GitHub Copilot",
    "primary_use_case": "Video Creation",
    "total_users": "340",
    "avg_productivity_gain_pct": "77.86",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "7.14",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Microsoft Copilot",
    "primary_use_case": "Design",
    "total_users": "345",
    "avg_productivity_gain_pct": "77.85",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "11.37",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Duolingo Max",
    "primary_use_case": "Design",
    "total_users": "397",
    "avg_productivity_gain_pct": "77.83",
    "rate_productivity": "0.20",
    "avg_hours_saved_weekly": "9.35",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Deepgram",
    "primary_use_case": "Learning",
    "total_users": "332",
    "avg_productivity_gain_pct": "77.83",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "9.35",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "AutoGPT",
    "primary_use_case": "Video Creation",
    "total_users": "378",
    "avg_productivity_gain_pct": "77.82",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "9.45",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "AlphaFold",
    "primary_use_case": "Data Analysis",
    "total_users": "363",
    "avg_productivity_gain_pct": "77.81",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.24",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Figma AI",
    "primary_use_case": "Research",
    "total_users": "365",
    "avg_productivity_gain_pct": "77.80",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "10.19",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Tesla Optimus",
    "primary_use_case": "Translation",
    "total_users": "339",
    "avg_productivity_gain_pct": "77.80",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "8.31",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "PyTorch",
    "primary_use_case": "Content Writing",
    "total_users": "348",
    "avg_productivity_gain_pct": "77.79",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "10.00",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Tesla Optimus",
    "primary_use_case": "Research",
    "total_users": "386",
    "avg_productivity_gain_pct": "77.79",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "11.50",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "LLaMA",
    "primary_use_case": "Design",
    "total_users": "395",
    "avg_productivity_gain_pct": "77.78",
    "rate_productivity": "0.20",
    "avg_hours_saved_weekly": "9.43",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Tableau AI",
    "primary_use_case": "Automation",
    "total_users": "357",
    "avg_productivity_gain_pct": "77.76",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "8.93",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "AlphaFold",
    "primary_use_case": "Customer Support",
    "total_users": "369",
    "avg_productivity_gain_pct": "77.75",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "7.86",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Jasper",
    "primary_use_case": "Coding",
    "total_users": "376",
    "avg_productivity_gain_pct": "77.74",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "8.52",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Perplexity AI",
    "primary_use_case": "Learning",
    "total_users": "384",
    "avg_productivity_gain_pct": "77.73",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "10.38",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Deepgram",
    "primary_use_case": "Video Creation",
    "total_users": "375",
    "avg_productivity_gain_pct": "77.73",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "10.72",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Gemini",
    "primary_use_case": "Learning",
    "total_users": "360",
    "avg_productivity_gain_pct": "77.72",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.07",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "TensorFlow",
    "primary_use_case": "Coding",
    "total_users": "367",
    "avg_productivity_gain_pct": "77.71",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.42",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Boston Dynamics AI",
    "primary_use_case": "Automation",
    "total_users": "370",
    "avg_productivity_gain_pct": "77.70",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "10.77",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "AutoGPT",
    "primary_use_case": "Content Writing",
    "total_users": "357",
    "avg_productivity_gain_pct": "77.69",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "8.89",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Midjourney",
    "primary_use_case": "Design",
    "total_users": "332",
    "avg_productivity_gain_pct": "77.68",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "11.04",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Cohere",
    "primary_use_case": "Customer Support",
    "total_users": "381",
    "avg_productivity_gain_pct": "77.68",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "8.10",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Cohere",
    "primary_use_case": "Content Writing",
    "total_users": "347",
    "avg_productivity_gain_pct": "77.68",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "8.78",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Mistral",
    "primary_use_case": "Data Analysis",
    "total_users": "365",
    "avg_productivity_gain_pct": "77.67",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "8.45",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Khanmigo",
    "primary_use_case": "Data Analysis",
    "total_users": "371",
    "avg_productivity_gain_pct": "77.65",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "10.26",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Tabnine",
    "primary_use_case": "Customer Support",
    "total_users": "362",
    "avg_productivity_gain_pct": "77.65",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.03",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Jasper",
    "primary_use_case": "Design",
    "total_users": "407",
    "avg_productivity_gain_pct": "77.61",
    "rate_productivity": "0.20",
    "avg_hours_saved_weekly": "9.07",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "DeepSeek",
    "primary_use_case": "Design",
    "total_users": "352",
    "avg_productivity_gain_pct": "77.59",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "8.55",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Canva AI",
    "primary_use_case": "Customer Support",
    "total_users": "391",
    "avg_productivity_gain_pct": "77.58",
    "rate_productivity": "0.20",
    "avg_hours_saved_weekly": "8.03",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "HeyGen",
    "primary_use_case": "Translation",
    "total_users": "373",
    "avg_productivity_gain_pct": "77.57",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "11.04",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Qwen",
    "primary_use_case": "Data Analysis",
    "total_users": "336",
    "avg_productivity_gain_pct": "77.56",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "9.33",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "HeyGen",
    "primary_use_case": "Video Creation",
    "total_users": "365",
    "avg_productivity_gain_pct": "77.56",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.23",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Perplexity AI",
    "primary_use_case": "Customer Support",
    "total_users": "374",
    "avg_productivity_gain_pct": "77.53",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "9.33",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Elicit",
    "primary_use_case": "Customer Support",
    "total_users": "370",
    "avg_productivity_gain_pct": "77.52",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.36",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Runway ML",
    "primary_use_case": "Video Creation",
    "total_users": "362",
    "avg_productivity_gain_pct": "77.52",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.45",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Notion AI",
    "primary_use_case": "Customer Support",
    "total_users": "354",
    "avg_productivity_gain_pct": "77.51",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.29",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Qwen",
    "primary_use_case": "Customer Support",
    "total_users": "350",
    "avg_productivity_gain_pct": "77.50",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "9.66",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "GPT-4",
    "primary_use_case": "Video Creation",
    "total_users": "380",
    "avg_productivity_gain_pct": "77.48",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "10.48",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "GPT-5",
    "primary_use_case": "Video Creation",
    "total_users": "351",
    "avg_productivity_gain_pct": "77.47",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.19",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "IBM Watson",
    "primary_use_case": "Automation",
    "total_users": "387",
    "avg_productivity_gain_pct": "77.47",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "9.52",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Khanmigo",
    "primary_use_case": "Automation",
    "total_users": "322",
    "avg_productivity_gain_pct": "77.44",
    "rate_productivity": "0.16",
    "avg_hours_saved_weekly": "9.11",
    "user_level": "Beginner"
  },
  {
    "ai_tool": "Midjourney",
    "primary_use_case": "Research",
    "total_users": "379",
    "avg_productivity_gain_pct": "77.43",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "9.34",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "LangChain",
    "primary_use_case": "Research",
    "total_users": "375",
    "avg_productivity_gain_pct": "77.42",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "10.50",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Mistral",
    "primary_use_case": "Automation",
    "total_users": "390",
    "avg_productivity_gain_pct": "77.42",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "10.75",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Gemini",
    "primary_use_case": "Content Writing",
    "total_users": "346",
    "avg_productivity_gain_pct": "77.41",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "9.35",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Tabnine",
    "primary_use_case": "Coding",
    "total_users": "399",
    "avg_productivity_gain_pct": "77.40",
    "rate_productivity": "0.20",
    "avg_hours_saved_weekly": "9.43",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Elicit",
    "primary_use_case": "Translation",
    "total_users": "360",
    "avg_productivity_gain_pct": "77.39",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.20",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Tableau AI",
    "primary_use_case": "Customer Support",
    "total_users": "350",
    "avg_productivity_gain_pct": "77.39",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "9.46",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Stable Diffusion",
    "primary_use_case": "Learning",
    "total_users": "349",
    "avg_productivity_gain_pct": "77.39",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "8.72",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Midjourney",
    "primary_use_case": "Video Creation",
    "total_users": "370",
    "avg_productivity_gain_pct": "77.38",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "10.47",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "GrammarlyGO",
    "primary_use_case": "Learning",
    "total_users": "365",
    "avg_productivity_gain_pct": "77.38",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.92",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "LLaMA",
    "primary_use_case": "Translation",
    "total_users": "383",
    "avg_productivity_gain_pct": "77.36",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "12.37",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Microsoft Copilot",
    "primary_use_case": "Content Writing",
    "total_users": "383",
    "avg_productivity_gain_pct": "77.36",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "9.04",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "LangChain",
    "primary_use_case": "Translation",
    "total_users": "402",
    "avg_productivity_gain_pct": "77.36",
    "rate_productivity": "0.20",
    "avg_hours_saved_weekly": "9.71",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Mistral",
    "primary_use_case": "Research",
    "total_users": "405",
    "avg_productivity_gain_pct": "77.34",
    "rate_productivity": "0.20",
    "avg_hours_saved_weekly": "9.38",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Cursor AI",
    "primary_use_case": "Customer Support",
    "total_users": "373",
    "avg_productivity_gain_pct": "77.33",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "8.78",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Notion AI",
    "primary_use_case": "Learning",
    "total_users": "376",
    "avg_productivity_gain_pct": "77.33",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "9.19",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Kensho",
    "primary_use_case": "Customer Support",
    "total_users": "358",
    "avg_productivity_gain_pct": "77.32",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "10.29",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Gemini",
    "primary_use_case": "Automation",
    "total_users": "348",
    "avg_productivity_gain_pct": "77.32",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "9.90",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Qwen",
    "primary_use_case": "Coding",
    "total_users": "336",
    "avg_productivity_gain_pct": "77.31",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "8.81",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Boston Dynamics AI",
    "primary_use_case": "Content Writing",
    "total_users": "358",
    "avg_productivity_gain_pct": "77.29",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.57",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "ElevenLabs",
    "primary_use_case": "Customer Support",
    "total_users": "390",
    "avg_productivity_gain_pct": "77.29",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "7.48",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "TensorFlow",
    "primary_use_case": "Learning",
    "total_users": "345",
    "avg_productivity_gain_pct": "77.28",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "9.55",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Figma AI",
    "primary_use_case": "Video Creation",
    "total_users": "350",
    "avg_productivity_gain_pct": "77.24",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "8.46",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Tesla Optimus",
    "primary_use_case": "Coding",
    "total_users": "375",
    "avg_productivity_gain_pct": "77.24",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "10.66",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Falcon",
    "primary_use_case": "Research",
    "total_users": "350",
    "avg_productivity_gain_pct": "77.23",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "9.87",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Mistral",
    "primary_use_case": "Customer Support",
    "total_users": "394",
    "avg_productivity_gain_pct": "77.23",
    "rate_productivity": "0.20",
    "avg_hours_saved_weekly": "10.59",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Whisper",
    "primary_use_case": "Research",
    "total_users": "370",
    "avg_productivity_gain_pct": "77.22",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "10.04",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Copy.ai",
    "primary_use_case": "Content Writing",
    "total_users": "336",
    "avg_productivity_gain_pct": "77.20",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "8.58",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Hugging Face",
    "primary_use_case": "Translation",
    "total_users": "375",
    "avg_productivity_gain_pct": "77.20",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "9.89",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Devin",
    "primary_use_case": "Learning",
    "total_users": "349",
    "avg_productivity_gain_pct": "77.19",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "10.12",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Codeium",
    "primary_use_case": "Coding",
    "total_users": "334",
    "avg_productivity_gain_pct": "77.15",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "10.09",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Boston Dynamics AI",
    "primary_use_case": "Design",
    "total_users": "357",
    "avg_productivity_gain_pct": "77.14",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "6.83",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "AlphaFold",
    "primary_use_case": "Content Writing",
    "total_users": "385",
    "avg_productivity_gain_pct": "77.13",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "10.07",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "GPT-5",
    "primary_use_case": "Customer Support",
    "total_users": "357",
    "avg_productivity_gain_pct": "77.13",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.51",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Whisper",
    "primary_use_case": "Learning",
    "total_users": "362",
    "avg_productivity_gain_pct": "77.13",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.03",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Perplexity AI",
    "primary_use_case": "Data Analysis",
    "total_users": "384",
    "avg_productivity_gain_pct": "77.12",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "10.36",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Hugging Face",
    "primary_use_case": "Learning",
    "total_users": "410",
    "avg_productivity_gain_pct": "77.12",
    "rate_productivity": "0.20",
    "avg_hours_saved_weekly": "8.43",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Tabnine",
    "primary_use_case": "Marketing",
    "total_users": "353",
    "avg_productivity_gain_pct": "77.12",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.46",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "GitHub Copilot",
    "primary_use_case": "Research",
    "total_users": "400",
    "avg_productivity_gain_pct": "77.11",
    "rate_productivity": "0.20",
    "avg_hours_saved_weekly": "8.95",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Deepgram",
    "primary_use_case": "Coding",
    "total_users": "361",
    "avg_productivity_gain_pct": "77.10",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.97",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Power BI Copilot",
    "primary_use_case": "Research",
    "total_users": "364",
    "avg_productivity_gain_pct": "77.10",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "8.77",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Copy.ai",
    "primary_use_case": "Coding",
    "total_users": "334",
    "avg_productivity_gain_pct": "77.09",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "8.82",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "LangChain",
    "primary_use_case": "Coding",
    "total_users": "383",
    "avg_productivity_gain_pct": "77.08",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "9.80",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Elicit",
    "primary_use_case": "Data Analysis",
    "total_users": "359",
    "avg_productivity_gain_pct": "77.08",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "10.73",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Hugging Face",
    "primary_use_case": "Automation",
    "total_users": "360",
    "avg_productivity_gain_pct": "77.08",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "10.63",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "HeyGen",
    "primary_use_case": "Research",
    "total_users": "356",
    "avg_productivity_gain_pct": "77.07",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.30",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "ElevenLabs",
    "primary_use_case": "Translation",
    "total_users": "382",
    "avg_productivity_gain_pct": "77.07",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "9.59",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Gemini",
    "primary_use_case": "Video Creation",
    "total_users": "376",
    "avg_productivity_gain_pct": "77.07",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "10.11",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "GPT-4",
    "primary_use_case": "Research",
    "total_users": "359",
    "avg_productivity_gain_pct": "77.06",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "11.61",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Copy.ai",
    "primary_use_case": "Design",
    "total_users": "351",
    "avg_productivity_gain_pct": "77.05",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "10.34",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Kensho",
    "primary_use_case": "Research",
    "total_users": "400",
    "avg_productivity_gain_pct": "77.03",
    "rate_productivity": "0.20",
    "avg_hours_saved_weekly": "10.53",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "ElevenLabs",
    "primary_use_case": "Design",
    "total_users": "382",
    "avg_productivity_gain_pct": "77.03",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "9.41",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Notion AI",
    "primary_use_case": "Automation",
    "total_users": "339",
    "avg_productivity_gain_pct": "77.02",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "8.60",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "TensorFlow",
    "primary_use_case": "Design",
    "total_users": "328",
    "avg_productivity_gain_pct": "77.01",
    "rate_productivity": "0.16",
    "avg_hours_saved_weekly": "9.42",
    "user_level": "Beginner"
  },
  {
    "ai_tool": "Claude",
    "primary_use_case": "Marketing",
    "total_users": "405",
    "avg_productivity_gain_pct": "77.01",
    "rate_productivity": "0.20",
    "avg_hours_saved_weekly": "11.03",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Falcon",
    "primary_use_case": "Automation",
    "total_users": "384",
    "avg_productivity_gain_pct": "77.00",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "8.15",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "DALL-E",
    "primary_use_case": "Design",
    "total_users": "361",
    "avg_productivity_gain_pct": "76.98",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "10.14",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "DeepSeek",
    "primary_use_case": "Data Analysis",
    "total_users": "418",
    "avg_productivity_gain_pct": "76.95",
    "rate_productivity": "0.21",
    "avg_hours_saved_weekly": "7.94",
    "user_level": "Expert"
  },
  {
    "ai_tool": "Codeium",
    "primary_use_case": "Design",
    "total_users": "366",
    "avg_productivity_gain_pct": "76.95",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.93",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "AutoGPT",
    "primary_use_case": "Customer Support",
    "total_users": "376",
    "avg_productivity_gain_pct": "76.94",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "9.01",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Hugging Face",
    "primary_use_case": "Content Writing",
    "total_users": "335",
    "avg_productivity_gain_pct": "76.93",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "8.99",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "GitHub Copilot",
    "primary_use_case": "Automation",
    "total_users": "359",
    "avg_productivity_gain_pct": "76.91",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.02",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "HeyGen",
    "primary_use_case": "Content Writing",
    "total_users": "357",
    "avg_productivity_gain_pct": "76.90",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.68",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Cursor AI",
    "primary_use_case": "Video Creation",
    "total_users": "352",
    "avg_productivity_gain_pct": "76.89",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "10.86",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "ElevenLabs",
    "primary_use_case": "Video Creation",
    "total_users": "380",
    "avg_productivity_gain_pct": "76.89",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "7.58",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "GPT-4",
    "primary_use_case": "Marketing",
    "total_users": "344",
    "avg_productivity_gain_pct": "76.89",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "9.93",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Claude",
    "primary_use_case": "Coding",
    "total_users": "356",
    "avg_productivity_gain_pct": "76.86",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "10.89",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "HeyGen",
    "primary_use_case": "Design",
    "total_users": "354",
    "avg_productivity_gain_pct": "76.84",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.75",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Notion AI",
    "primary_use_case": "Coding",
    "total_users": "351",
    "avg_productivity_gain_pct": "76.84",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "9.51",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "BloombergGPT",
    "primary_use_case": "Design",
    "total_users": "348",
    "avg_productivity_gain_pct": "76.83",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "10.25",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Codeium",
    "primary_use_case": "Learning",
    "total_users": "345",
    "avg_productivity_gain_pct": "76.81",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "9.63",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Synthesia",
    "primary_use_case": "Content Writing",
    "total_users": "361",
    "avg_productivity_gain_pct": "76.81",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.13",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Notion AI",
    "primary_use_case": "Video Creation",
    "total_users": "361",
    "avg_productivity_gain_pct": "76.81",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.34",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Claude",
    "primary_use_case": "Research",
    "total_users": "356",
    "avg_productivity_gain_pct": "76.81",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.06",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "PyTorch",
    "primary_use_case": "Research",
    "total_users": "340",
    "avg_productivity_gain_pct": "76.80",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "10.22",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Perplexity AI",
    "primary_use_case": "Video Creation",
    "total_users": "359",
    "avg_productivity_gain_pct": "76.80",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "8.92",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Copy.ai",
    "primary_use_case": "Automation",
    "total_users": "377",
    "avg_productivity_gain_pct": "76.80",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "11.09",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "GPT-4",
    "primary_use_case": "Coding",
    "total_users": "363",
    "avg_productivity_gain_pct": "76.79",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "10.40",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Cursor AI",
    "primary_use_case": "Content Writing",
    "total_users": "340",
    "avg_productivity_gain_pct": "76.77",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "8.80",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "GitHub Copilot",
    "primary_use_case": "Customer Support",
    "total_users": "335",
    "avg_productivity_gain_pct": "76.76",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "7.98",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "DataRobot",
    "primary_use_case": "Coding",
    "total_users": "364",
    "avg_productivity_gain_pct": "76.75",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "8.35",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Mistral",
    "primary_use_case": "Learning",
    "total_users": "377",
    "avg_productivity_gain_pct": "76.75",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "9.44",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Stable Diffusion",
    "primary_use_case": "Marketing",
    "total_users": "372",
    "avg_productivity_gain_pct": "76.74",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "10.33",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Kensho",
    "primary_use_case": "Learning",
    "total_users": "358",
    "avg_productivity_gain_pct": "76.73",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "8.59",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Hugging Face",
    "primary_use_case": "Marketing",
    "total_users": "336",
    "avg_productivity_gain_pct": "76.70",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "8.13",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Devin",
    "primary_use_case": "Data Analysis",
    "total_users": "390",
    "avg_productivity_gain_pct": "76.70",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "8.69",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "AlphaFold",
    "primary_use_case": "Automation",
    "total_users": "367",
    "avg_productivity_gain_pct": "76.68",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.49",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "BloombergGPT",
    "primary_use_case": "Customer Support",
    "total_users": "351",
    "avg_productivity_gain_pct": "76.67",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "9.65",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "DataRobot",
    "primary_use_case": "Video Creation",
    "total_users": "390",
    "avg_productivity_gain_pct": "76.66",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "8.85",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Power BI Copilot",
    "primary_use_case": "Automation",
    "total_users": "372",
    "avg_productivity_gain_pct": "76.65",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "10.35",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Runway ML",
    "primary_use_case": "Marketing",
    "total_users": "359",
    "avg_productivity_gain_pct": "76.61",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "8.37",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "ElevenLabs",
    "primary_use_case": "Automation",
    "total_users": "370",
    "avg_productivity_gain_pct": "76.61",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "8.99",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Kensho",
    "primary_use_case": "Coding",
    "total_users": "342",
    "avg_productivity_gain_pct": "76.59",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "8.03",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Qwen",
    "primary_use_case": "Video Creation",
    "total_users": "412",
    "avg_productivity_gain_pct": "76.59",
    "rate_productivity": "0.20",
    "avg_hours_saved_weekly": "9.61",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Synthesia",
    "primary_use_case": "Customer Support",
    "total_users": "356",
    "avg_productivity_gain_pct": "76.57",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "8.97",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Stable Diffusion",
    "primary_use_case": "Automation",
    "total_users": "347",
    "avg_productivity_gain_pct": "76.57",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "9.01",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Grok",
    "primary_use_case": "Customer Support",
    "total_users": "352",
    "avg_productivity_gain_pct": "76.56",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "9.70",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Qwen",
    "primary_use_case": "Content Writing",
    "total_users": "342",
    "avg_productivity_gain_pct": "76.56",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "9.26",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Mistral",
    "primary_use_case": "Content Writing",
    "total_users": "365",
    "avg_productivity_gain_pct": "76.55",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.24",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Power BI Copilot",
    "primary_use_case": "Customer Support",
    "total_users": "348",
    "avg_productivity_gain_pct": "76.54",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "10.35",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Cohere",
    "primary_use_case": "Data Analysis",
    "total_users": "329",
    "avg_productivity_gain_pct": "76.53",
    "rate_productivity": "0.16",
    "avg_hours_saved_weekly": "8.01",
    "user_level": "Beginner"
  },
  {
    "ai_tool": "Cohere",
    "primary_use_case": "Video Creation",
    "total_users": "359",
    "avg_productivity_gain_pct": "76.50",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "8.24",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "DataRobot",
    "primary_use_case": "Customer Support",
    "total_users": "388",
    "avg_productivity_gain_pct": "76.46",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "9.89",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Kensho",
    "primary_use_case": "Video Creation",
    "total_users": "396",
    "avg_productivity_gain_pct": "76.44",
    "rate_productivity": "0.20",
    "avg_hours_saved_weekly": "10.20",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "PyTorch",
    "primary_use_case": "Coding",
    "total_users": "386",
    "avg_productivity_gain_pct": "76.44",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "8.69",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Duolingo Max",
    "primary_use_case": "Learning",
    "total_users": "342",
    "avg_productivity_gain_pct": "76.44",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "9.62",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Elicit",
    "primary_use_case": "Research",
    "total_users": "327",
    "avg_productivity_gain_pct": "76.43",
    "rate_productivity": "0.16",
    "avg_hours_saved_weekly": "8.05",
    "user_level": "Beginner"
  },
  {
    "ai_tool": "Cohere",
    "primary_use_case": "Design",
    "total_users": "346",
    "avg_productivity_gain_pct": "76.43",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "10.10",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "GitHub Copilot",
    "primary_use_case": "Content Writing",
    "total_users": "381",
    "avg_productivity_gain_pct": "76.43",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "8.07",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Elicit",
    "primary_use_case": "Marketing",
    "total_users": "351",
    "avg_productivity_gain_pct": "76.42",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "8.72",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "AlphaFold",
    "primary_use_case": "Translation",
    "total_users": "369",
    "avg_productivity_gain_pct": "76.35",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "10.47",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Stable Diffusion",
    "primary_use_case": "Translation",
    "total_users": "349",
    "avg_productivity_gain_pct": "76.32",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "8.82",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Runway ML",
    "primary_use_case": "Design",
    "total_users": "370",
    "avg_productivity_gain_pct": "76.26",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.12",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Elicit",
    "primary_use_case": "Content Writing",
    "total_users": "358",
    "avg_productivity_gain_pct": "76.26",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "8.91",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Figma AI",
    "primary_use_case": "Content Writing",
    "total_users": "392",
    "avg_productivity_gain_pct": "76.26",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "9.80",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "PyTorch",
    "primary_use_case": "Video Creation",
    "total_users": "366",
    "avg_productivity_gain_pct": "76.25",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "8.89",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Boston Dynamics AI",
    "primary_use_case": "Learning",
    "total_users": "354",
    "avg_productivity_gain_pct": "76.24",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "10.15",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Deepgram",
    "primary_use_case": "Design",
    "total_users": "339",
    "avg_productivity_gain_pct": "76.22",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "10.27",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "DALL-E",
    "primary_use_case": "Marketing",
    "total_users": "352",
    "avg_productivity_gain_pct": "76.20",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "10.10",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Notion AI",
    "primary_use_case": "Content Writing",
    "total_users": "359",
    "avg_productivity_gain_pct": "76.16",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.04",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "GPT-4",
    "primary_use_case": "Learning",
    "total_users": "355",
    "avg_productivity_gain_pct": "76.15",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "8.46",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Power BI Copilot",
    "primary_use_case": "Marketing",
    "total_users": "370",
    "avg_productivity_gain_pct": "76.15",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "8.92",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Midjourney",
    "primary_use_case": "Automation",
    "total_users": "364",
    "avg_productivity_gain_pct": "76.12",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.32",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "TensorFlow",
    "primary_use_case": "Content Writing",
    "total_users": "403",
    "avg_productivity_gain_pct": "76.12",
    "rate_productivity": "0.20",
    "avg_hours_saved_weekly": "10.37",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Copy.ai",
    "primary_use_case": "Video Creation",
    "total_users": "379",
    "avg_productivity_gain_pct": "76.12",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "10.21",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Tableau AI",
    "primary_use_case": "Video Creation",
    "total_users": "348",
    "avg_productivity_gain_pct": "76.08",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "10.42",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "ElevenLabs",
    "primary_use_case": "Data Analysis",
    "total_users": "336",
    "avg_productivity_gain_pct": "76.08",
    "rate_productivity": "0.16",
    "avg_hours_saved_weekly": "10.43",
    "user_level": "Beginner"
  },
  {
    "ai_tool": "GrammarlyGO",
    "primary_use_case": "Coding",
    "total_users": "321",
    "avg_productivity_gain_pct": "76.03",
    "rate_productivity": "0.16",
    "avg_hours_saved_weekly": "9.42",
    "user_level": "Beginner"
  },
  {
    "ai_tool": "GrammarlyGO",
    "primary_use_case": "Customer Support",
    "total_users": "360",
    "avg_productivity_gain_pct": "76.02",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "8.33",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "LangChain",
    "primary_use_case": "Design",
    "total_users": "346",
    "avg_productivity_gain_pct": "76.01",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "10.26",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Canva AI",
    "primary_use_case": "Automation",
    "total_users": "382",
    "avg_productivity_gain_pct": "75.99",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "9.67",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "AutoGPT",
    "primary_use_case": "Research",
    "total_users": "361",
    "avg_productivity_gain_pct": "75.99",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.27",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "DeepSeek",
    "primary_use_case": "Video Creation",
    "total_users": "393",
    "avg_productivity_gain_pct": "75.98",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "9.53",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Midjourney",
    "primary_use_case": "Coding",
    "total_users": "348",
    "avg_productivity_gain_pct": "75.98",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "8.46",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Deepgram",
    "primary_use_case": "Customer Support",
    "total_users": "356",
    "avg_productivity_gain_pct": "75.96",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "8.14",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Falcon",
    "primary_use_case": "Video Creation",
    "total_users": "376",
    "avg_productivity_gain_pct": "75.96",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "8.66",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Perplexity AI",
    "primary_use_case": "Content Writing",
    "total_users": "385",
    "avg_productivity_gain_pct": "75.95",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "8.53",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "AutoGPT",
    "primary_use_case": "Marketing",
    "total_users": "366",
    "avg_productivity_gain_pct": "75.95",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.61",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Microsoft Copilot",
    "primary_use_case": "Customer Support",
    "total_users": "374",
    "avg_productivity_gain_pct": "75.93",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "10.53",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Falcon",
    "primary_use_case": "Translation",
    "total_users": "339",
    "avg_productivity_gain_pct": "75.93",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "7.99",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "DALL-E",
    "primary_use_case": "Research",
    "total_users": "352",
    "avg_productivity_gain_pct": "75.93",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "8.10",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "BloombergGPT",
    "primary_use_case": "Coding",
    "total_users": "376",
    "avg_productivity_gain_pct": "75.91",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.07",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Duolingo Max",
    "primary_use_case": "Content Writing",
    "total_users": "370",
    "avg_productivity_gain_pct": "75.90",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "8.53",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "GPT-5",
    "primary_use_case": "Automation",
    "total_users": "387",
    "avg_productivity_gain_pct": "75.89",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "8.95",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Grok",
    "primary_use_case": "Learning",
    "total_users": "400",
    "avg_productivity_gain_pct": "75.89",
    "rate_productivity": "0.20",
    "avg_hours_saved_weekly": "7.64",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "PyTorch",
    "primary_use_case": "Automation",
    "total_users": "382",
    "avg_productivity_gain_pct": "75.87",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "10.04",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Elicit",
    "primary_use_case": "Coding",
    "total_users": "361",
    "avg_productivity_gain_pct": "75.85",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.87",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Midjourney",
    "primary_use_case": "Customer Support",
    "total_users": "355",
    "avg_productivity_gain_pct": "75.84",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "9.00",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Gemini",
    "primary_use_case": "Marketing",
    "total_users": "349",
    "avg_productivity_gain_pct": "75.80",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "9.60",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "PyTorch",
    "primary_use_case": "Customer Support",
    "total_users": "341",
    "avg_productivity_gain_pct": "75.79",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "9.39",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Kensho",
    "primary_use_case": "Content Writing",
    "total_users": "297",
    "avg_productivity_gain_pct": "75.79",
    "rate_productivity": "0.15",
    "avg_hours_saved_weekly": "8.59",
    "user_level": "Beginner"
  },
  {
    "ai_tool": "Cursor AI",
    "primary_use_case": "Data Analysis",
    "total_users": "384",
    "avg_productivity_gain_pct": "75.78",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "9.90",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Tableau AI",
    "primary_use_case": "Design",
    "total_users": "363",
    "avg_productivity_gain_pct": "75.77",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "10.12",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Cursor AI",
    "primary_use_case": "Design",
    "total_users": "366",
    "avg_productivity_gain_pct": "75.74",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "8.14",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "LLaMA",
    "primary_use_case": "Coding",
    "total_users": "349",
    "avg_productivity_gain_pct": "75.73",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "9.73",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Cursor AI",
    "primary_use_case": "Marketing",
    "total_users": "353",
    "avg_productivity_gain_pct": "75.73",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "9.25",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "IBM Watson",
    "primary_use_case": "Research",
    "total_users": "391",
    "avg_productivity_gain_pct": "75.71",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "7.95",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "ElevenLabs",
    "primary_use_case": "Coding",
    "total_users": "364",
    "avg_productivity_gain_pct": "75.71",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.08",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Claude",
    "primary_use_case": "Translation",
    "total_users": "354",
    "avg_productivity_gain_pct": "75.71",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "9.52",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "LLaMA",
    "primary_use_case": "Content Writing",
    "total_users": "402",
    "avg_productivity_gain_pct": "75.71",
    "rate_productivity": "0.20",
    "avg_hours_saved_weekly": "8.72",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Figma AI",
    "primary_use_case": "Marketing",
    "total_users": "358",
    "avg_productivity_gain_pct": "75.70",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "10.00",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Boston Dynamics AI",
    "primary_use_case": "Customer Support",
    "total_users": "406",
    "avg_productivity_gain_pct": "75.68",
    "rate_productivity": "0.20",
    "avg_hours_saved_weekly": "10.61",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "LangChain",
    "primary_use_case": "Customer Support",
    "total_users": "402",
    "avg_productivity_gain_pct": "75.68",
    "rate_productivity": "0.20",
    "avg_hours_saved_weekly": "9.42",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Tesla Optimus",
    "primary_use_case": "Data Analysis",
    "total_users": "376",
    "avg_productivity_gain_pct": "75.66",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.86",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "GrammarlyGO",
    "primary_use_case": "Content Writing",
    "total_users": "354",
    "avg_productivity_gain_pct": "75.61",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "10.83",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Tableau AI",
    "primary_use_case": "Coding",
    "total_users": "384",
    "avg_productivity_gain_pct": "75.59",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "9.96",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "PyTorch",
    "primary_use_case": "Design",
    "total_users": "322",
    "avg_productivity_gain_pct": "75.58",
    "rate_productivity": "0.16",
    "avg_hours_saved_weekly": "9.86",
    "user_level": "Beginner"
  },
  {
    "ai_tool": "Devin",
    "primary_use_case": "Automation",
    "total_users": "325",
    "avg_productivity_gain_pct": "75.54",
    "rate_productivity": "0.16",
    "avg_hours_saved_weekly": "7.97",
    "user_level": "Beginner"
  },
  {
    "ai_tool": "DALL-E",
    "primary_use_case": "Learning",
    "total_users": "371",
    "avg_productivity_gain_pct": "75.52",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.80",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Notion AI",
    "primary_use_case": "Design",
    "total_users": "390",
    "avg_productivity_gain_pct": "75.51",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "9.44",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Boston Dynamics AI",
    "primary_use_case": "Data Analysis",
    "total_users": "332",
    "avg_productivity_gain_pct": "75.48",
    "rate_productivity": "0.16",
    "avg_hours_saved_weekly": "9.68",
    "user_level": "Beginner"
  },
  {
    "ai_tool": "Kensho",
    "primary_use_case": "Marketing",
    "total_users": "354",
    "avg_productivity_gain_pct": "75.47",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "9.41",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Deepgram",
    "primary_use_case": "Translation",
    "total_users": "381",
    "avg_productivity_gain_pct": "75.41",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "10.97",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Perplexity AI",
    "primary_use_case": "Design",
    "total_users": "361",
    "avg_productivity_gain_pct": "75.40",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "7.52",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Gemini",
    "primary_use_case": "Data Analysis",
    "total_users": "339",
    "avg_productivity_gain_pct": "75.39",
    "rate_productivity": "0.16",
    "avg_hours_saved_weekly": "9.59",
    "user_level": "Beginner"
  },
  {
    "ai_tool": "Duolingo Max",
    "primary_use_case": "Video Creation",
    "total_users": "373",
    "avg_productivity_gain_pct": "75.39",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "8.97",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Microsoft Copilot",
    "primary_use_case": "Automation",
    "total_users": "321",
    "avg_productivity_gain_pct": "75.38",
    "rate_productivity": "0.16",
    "avg_hours_saved_weekly": "11.16",
    "user_level": "Beginner"
  },
  {
    "ai_tool": "DALL-E",
    "primary_use_case": "Video Creation",
    "total_users": "369",
    "avg_productivity_gain_pct": "75.37",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "10.33",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Synthesia",
    "primary_use_case": "Translation",
    "total_users": "356",
    "avg_productivity_gain_pct": "75.33",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "9.11",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Runway ML",
    "primary_use_case": "Customer Support",
    "total_users": "369",
    "avg_productivity_gain_pct": "75.33",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.36",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Jasper",
    "primary_use_case": "Automation",
    "total_users": "346",
    "avg_productivity_gain_pct": "75.30",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "8.61",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "GrammarlyGO",
    "primary_use_case": "Video Creation",
    "total_users": "358",
    "avg_productivity_gain_pct": "75.26",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "9.50",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "GPT-5",
    "primary_use_case": "Translation",
    "total_users": "386",
    "avg_productivity_gain_pct": "75.25",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "8.71",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Microsoft Copilot",
    "primary_use_case": "Translation",
    "total_users": "346",
    "avg_productivity_gain_pct": "75.24",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "8.64",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Tabnine",
    "primary_use_case": "Data Analysis",
    "total_users": "353",
    "avg_productivity_gain_pct": "75.20",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "9.92",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Devin",
    "primary_use_case": "Research",
    "total_users": "350",
    "avg_productivity_gain_pct": "75.19",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "10.19",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Tesla Optimus",
    "primary_use_case": "Automation",
    "total_users": "396",
    "avg_productivity_gain_pct": "75.17",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "9.80",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "LangChain",
    "primary_use_case": "Data Analysis",
    "total_users": "349",
    "avg_productivity_gain_pct": "75.14",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "12.40",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Notion AI",
    "primary_use_case": "Data Analysis",
    "total_users": "340",
    "avg_productivity_gain_pct": "75.11",
    "rate_productivity": "0.16",
    "avg_hours_saved_weekly": "10.26",
    "user_level": "Beginner"
  },
  {
    "ai_tool": "Whisper",
    "primary_use_case": "Video Creation",
    "total_users": "345",
    "avg_productivity_gain_pct": "75.10",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "10.53",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Synthesia",
    "primary_use_case": "Design",
    "total_users": "395",
    "avg_productivity_gain_pct": "75.03",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "10.24",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Synthesia",
    "primary_use_case": "Data Analysis",
    "total_users": "372",
    "avg_productivity_gain_pct": "75.03",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "8.87",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Runway ML",
    "primary_use_case": "Translation",
    "total_users": "385",
    "avg_productivity_gain_pct": "75.00",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "10.75",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "DataRobot",
    "primary_use_case": "Automation",
    "total_users": "364",
    "avg_productivity_gain_pct": "74.99",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.94",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "LangChain",
    "primary_use_case": "Automation",
    "total_users": "379",
    "avg_productivity_gain_pct": "74.98",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.44",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "GPT-5",
    "primary_use_case": "Marketing",
    "total_users": "394",
    "avg_productivity_gain_pct": "74.96",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "8.60",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Figma AI",
    "primary_use_case": "Translation",
    "total_users": "376",
    "avg_productivity_gain_pct": "74.95",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "8.84",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "DeepSeek",
    "primary_use_case": "Customer Support",
    "total_users": "388",
    "avg_productivity_gain_pct": "74.93",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "10.06",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Boston Dynamics AI",
    "primary_use_case": "Coding",
    "total_users": "361",
    "avg_productivity_gain_pct": "74.93",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "7.80",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Midjourney",
    "primary_use_case": "Content Writing",
    "total_users": "336",
    "avg_productivity_gain_pct": "74.92",
    "rate_productivity": "0.16",
    "avg_hours_saved_weekly": "10.59",
    "user_level": "Beginner"
  },
  {
    "ai_tool": "IBM Watson",
    "primary_use_case": "Video Creation",
    "total_users": "341",
    "avg_productivity_gain_pct": "74.92",
    "rate_productivity": "0.16",
    "avg_hours_saved_weekly": "10.57",
    "user_level": "Beginner"
  },
  {
    "ai_tool": "AutoGPT",
    "primary_use_case": "Data Analysis",
    "total_users": "361",
    "avg_productivity_gain_pct": "74.91",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "9.69",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Falcon",
    "primary_use_case": "Marketing",
    "total_users": "391",
    "avg_productivity_gain_pct": "74.87",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "9.58",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Codeium",
    "primary_use_case": "Data Analysis",
    "total_users": "361",
    "avg_productivity_gain_pct": "74.86",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "8.52",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "ElevenLabs",
    "primary_use_case": "Content Writing",
    "total_users": "388",
    "avg_productivity_gain_pct": "74.86",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "9.33",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Tabnine",
    "primary_use_case": "Automation",
    "total_users": "368",
    "avg_productivity_gain_pct": "74.84",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "8.40",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "BloombergGPT",
    "primary_use_case": "Learning",
    "total_users": "351",
    "avg_productivity_gain_pct": "74.80",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "10.50",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "BloombergGPT",
    "primary_use_case": "Marketing",
    "total_users": "384",
    "avg_productivity_gain_pct": "74.79",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "9.24",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "DALL-E",
    "primary_use_case": "Content Writing",
    "total_users": "317",
    "avg_productivity_gain_pct": "74.79",
    "rate_productivity": "0.15",
    "avg_hours_saved_weekly": "10.85",
    "user_level": "Beginner"
  },
  {
    "ai_tool": "Kensho",
    "primary_use_case": "Design",
    "total_users": "340",
    "avg_productivity_gain_pct": "74.78",
    "rate_productivity": "0.16",
    "avg_hours_saved_weekly": "9.15",
    "user_level": "Beginner"
  },
  {
    "ai_tool": "Runway ML",
    "primary_use_case": "Learning",
    "total_users": "375",
    "avg_productivity_gain_pct": "74.75",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "10.21",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "TensorFlow",
    "primary_use_case": "Marketing",
    "total_users": "367",
    "avg_productivity_gain_pct": "74.73",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "7.99",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Qwen",
    "primary_use_case": "Automation",
    "total_users": "354",
    "avg_productivity_gain_pct": "74.71",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "10.65",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Codeium",
    "primary_use_case": "Translation",
    "total_users": "391",
    "avg_productivity_gain_pct": "74.67",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "6.54",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Synthesia",
    "primary_use_case": "Research",
    "total_users": "375",
    "avg_productivity_gain_pct": "74.66",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "7.74",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Boston Dynamics AI",
    "primary_use_case": "Research",
    "total_users": "376",
    "avg_productivity_gain_pct": "74.66",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "8.24",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Power BI Copilot",
    "primary_use_case": "Video Creation",
    "total_users": "356",
    "avg_productivity_gain_pct": "74.66",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "8.11",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Canva AI",
    "primary_use_case": "Data Analysis",
    "total_users": "353",
    "avg_productivity_gain_pct": "74.60",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "10.08",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Hugging Face",
    "primary_use_case": "Coding",
    "total_users": "374",
    "avg_productivity_gain_pct": "74.60",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.05",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Canva AI",
    "primary_use_case": "Video Creation",
    "total_users": "378",
    "avg_productivity_gain_pct": "74.60",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "10.53",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "GitHub Copilot",
    "primary_use_case": "Translation",
    "total_users": "395",
    "avg_productivity_gain_pct": "74.59",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "9.33",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Figma AI",
    "primary_use_case": "Customer Support",
    "total_users": "371",
    "avg_productivity_gain_pct": "74.59",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "10.19",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Synthesia",
    "primary_use_case": "Learning",
    "total_users": "366",
    "avg_productivity_gain_pct": "74.57",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "8.96",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Notion AI",
    "primary_use_case": "Research",
    "total_users": "322",
    "avg_productivity_gain_pct": "74.56",
    "rate_productivity": "0.15",
    "avg_hours_saved_weekly": "9.50",
    "user_level": "Beginner"
  },
  {
    "ai_tool": "DeepSeek",
    "primary_use_case": "Automation",
    "total_users": "371",
    "avg_productivity_gain_pct": "74.49",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "7.70",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Perplexity AI",
    "primary_use_case": "Research",
    "total_users": "375",
    "avg_productivity_gain_pct": "74.48",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "8.78",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Claude",
    "primary_use_case": "Customer Support",
    "total_users": "372",
    "avg_productivity_gain_pct": "74.42",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "8.52",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "BloombergGPT",
    "primary_use_case": "Data Analysis",
    "total_users": "365",
    "avg_productivity_gain_pct": "74.33",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "10.32",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "ElevenLabs",
    "primary_use_case": "Marketing",
    "total_users": "360",
    "avg_productivity_gain_pct": "74.32",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "9.09",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Jasper",
    "primary_use_case": "Translation",
    "total_users": "347",
    "avg_productivity_gain_pct": "74.29",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "10.00",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Whisper",
    "primary_use_case": "Translation",
    "total_users": "343",
    "avg_productivity_gain_pct": "74.29",
    "rate_productivity": "0.16",
    "avg_hours_saved_weekly": "8.78",
    "user_level": "Beginner"
  },
  {
    "ai_tool": "Tableau AI",
    "primary_use_case": "Research",
    "total_users": "362",
    "avg_productivity_gain_pct": "74.20",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "10.52",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "LLaMA",
    "primary_use_case": "Research",
    "total_users": "350",
    "avg_productivity_gain_pct": "74.19",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "10.67",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Midjourney",
    "primary_use_case": "Data Analysis",
    "total_users": "385",
    "avg_productivity_gain_pct": "74.19",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.42",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Cohere",
    "primary_use_case": "Coding",
    "total_users": "335",
    "avg_productivity_gain_pct": "74.18",
    "rate_productivity": "0.16",
    "avg_hours_saved_weekly": "11.11",
    "user_level": "Beginner"
  },
  {
    "ai_tool": "Copy.ai",
    "primary_use_case": "Research",
    "total_users": "356",
    "avg_productivity_gain_pct": "74.18",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "9.01",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "HeyGen",
    "primary_use_case": "Marketing",
    "total_users": "366",
    "avg_productivity_gain_pct": "74.17",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "9.27",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Midjourney",
    "primary_use_case": "Translation",
    "total_users": "357",
    "avg_productivity_gain_pct": "74.10",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "10.85",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Devin",
    "primary_use_case": "Video Creation",
    "total_users": "334",
    "avg_productivity_gain_pct": "73.93",
    "rate_productivity": "0.16",
    "avg_hours_saved_weekly": "8.10",
    "user_level": "Beginner"
  },
  {
    "ai_tool": "Tableau AI",
    "primary_use_case": "Learning",
    "total_users": "322",
    "avg_productivity_gain_pct": "73.91",
    "rate_productivity": "0.15",
    "avg_hours_saved_weekly": "9.98",
    "user_level": "Beginner"
  },
  {
    "ai_tool": "ElevenLabs",
    "primary_use_case": "Research",
    "total_users": "353",
    "avg_productivity_gain_pct": "73.90",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "8.76",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Stable Diffusion",
    "primary_use_case": "Data Analysis",
    "total_users": "344",
    "avg_productivity_gain_pct": "73.60",
    "rate_productivity": "0.16",
    "avg_hours_saved_weekly": "9.78",
    "user_level": "Beginner"
  },
  {
    "ai_tool": "Grok",
    "primary_use_case": "Data Analysis",
    "total_users": "354",
    "avg_productivity_gain_pct": "73.60",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "10.60",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Grok",
    "primary_use_case": "Coding",
    "total_users": "380",
    "avg_productivity_gain_pct": "73.56",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.72",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Runway ML",
    "primary_use_case": "Automation",
    "total_users": "380",
    "avg_productivity_gain_pct": "73.49",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.54",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "GPT-4",
    "primary_use_case": "Automation",
    "total_users": "373",
    "avg_productivity_gain_pct": "73.44",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "8.93",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Perplexity AI",
    "primary_use_case": "Translation",
    "total_users": "382",
    "avg_productivity_gain_pct": "73.32",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.87",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Copy.ai",
    "primary_use_case": "Learning",
    "total_users": "406",
    "avg_productivity_gain_pct": "73.30",
    "rate_productivity": "0.19",
    "avg_hours_saved_weekly": "10.73",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Microsoft Copilot",
    "primary_use_case": "Data Analysis",
    "total_users": "340",
    "avg_productivity_gain_pct": "73.24",
    "rate_productivity": "0.16",
    "avg_hours_saved_weekly": "8.76",
    "user_level": "Beginner"
  },
  {
    "ai_tool": "Codeium",
    "primary_use_case": "Customer Support",
    "total_users": "346",
    "avg_productivity_gain_pct": "73.13",
    "rate_productivity": "0.16",
    "avg_hours_saved_weekly": "7.95",
    "user_level": "Beginner"
  },
  {
    "ai_tool": "GrammarlyGO",
    "primary_use_case": "Translation",
    "total_users": "415",
    "avg_productivity_gain_pct": "73.06",
    "rate_productivity": "0.20",
    "avg_hours_saved_weekly": "9.58",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Cohere",
    "primary_use_case": "Translation",
    "total_users": "352",
    "avg_productivity_gain_pct": "73.05",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "9.47",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Duolingo Max",
    "primary_use_case": "Translation",
    "total_users": "362",
    "avg_productivity_gain_pct": "72.92",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "9.95",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Qwen",
    "primary_use_case": "Translation",
    "total_users": "347",
    "avg_productivity_gain_pct": "72.92",
    "rate_productivity": "0.16",
    "avg_hours_saved_weekly": "8.93",
    "user_level": "Beginner"
  },
  {
    "ai_tool": "Grok",
    "primary_use_case": "Research",
    "total_users": "385",
    "avg_productivity_gain_pct": "72.84",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.97",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Cursor AI",
    "primary_use_case": "Coding",
    "total_users": "384",
    "avg_productivity_gain_pct": "72.82",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.09",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "GitHub Copilot",
    "primary_use_case": "Coding",
    "total_users": "369",
    "avg_productivity_gain_pct": "72.77",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "10.04",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Jasper",
    "primary_use_case": "Content Writing",
    "total_users": "359",
    "avg_productivity_gain_pct": "72.61",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "10.32",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Figma AI",
    "primary_use_case": "Design",
    "total_users": "380",
    "avg_productivity_gain_pct": "72.45",
    "rate_productivity": "0.18",
    "avg_hours_saved_weekly": "9.81",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "DALL-E",
    "primary_use_case": "Translation",
    "total_users": "340",
    "avg_productivity_gain_pct": "72.25",
    "rate_productivity": "0.16",
    "avg_hours_saved_weekly": "8.83",
    "user_level": "Beginner"
  },
  {
    "ai_tool": "DataRobot",
    "primary_use_case": "Marketing",
    "total_users": "353",
    "avg_productivity_gain_pct": "71.84",
    "rate_productivity": "0.16",
    "avg_hours_saved_weekly": "8.82",
    "user_level": "Beginner"
  },
  {
    "ai_tool": "Whisper",
    "primary_use_case": "Coding",
    "total_users": "343",
    "avg_productivity_gain_pct": "71.49",
    "rate_productivity": "0.16",
    "avg_hours_saved_weekly": "9.14",
    "user_level": "Beginner"
  },
  {
    "ai_tool": "Copy.ai",
    "primary_use_case": "Marketing",
    "total_users": "331",
    "avg_productivity_gain_pct": "71.33",
    "rate_productivity": "0.15",
    "avg_hours_saved_weekly": "9.87",
    "user_level": "Beginner"
  },
  {
    "ai_tool": "AlphaFold",
    "primary_use_case": "Coding",
    "total_users": "365",
    "avg_productivity_gain_pct": "70.64",
    "rate_productivity": "0.17",
    "avg_hours_saved_weekly": "11.03",
    "user_level": "Intermediate"
  },
  {
    "ai_tool": "Stable Diffusion",
    "primary_use_case": "Video Creation",
    "total_users": "364",
    "avg_productivity_gain_pct": "70.28",
    "rate_productivity": "0.16",
    "avg_hours_saved_weekly": "9.01",
    "user_level": "Beginner"
  },
  {
    "ai_tool": "Devin",
    "primary_use_case": "Marketing",
    "total_users": "351",
    "avg_productivity_gain_pct": "69.75",
    "rate_productivity": "0.16",
    "avg_hours_saved_weekly": "8.81",
    "user_level": "Beginner"
  }
] ```
Insight


```