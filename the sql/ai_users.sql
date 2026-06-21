--- let us create table into the schema of the new database created
set search_path to ai_users;
CREATE table ai_users(
    user_id INT NOT NULL PRIMARY KEY,
    age INT,
    user_type text,
    experience_level VARCHAR(225),
    industry VARCHAR(225),
    country TEXT,
    city TEXT,
    ai_tool TEXT,
    usage_hours_per_week FLOAT,
    primary_use_case TEXT,
    satisfaction_score FLOAT,
    success BOOLEAN,
    failure_reason VARCHAR(225),
    subscription_type VARCHAR(225),
    device_type VARCHAR(225),
    internet_quality VARCHAR(225),
    productivity_gain_pct FLOAT,
    date_recorded TIMESTAMP
);
-- let  import data/values into the table created to make the above meaningful.
COPY ai_users
FROM 'C:\\AI tools usage\\ai_users.csv' WITH(FORMAT CSV, HEADER TRUE, DELIMITER, ',');
-- we would need to start querying
-- lets clean up this data
-- lets see if there is any type  for each column
SELECT DISTINCT user_type
FROM ai_users -- needed to change junior dev to junior developer so as to rhyme with senior developer and it should look better
UPDATE ai_users
SET user_type = REPLACE(user_type, 'junior dev', 'Junior Developer')
WHERE user_type LIKE '%junior dev%';
-- lets  check experience_level column
SELECT DISTINCT experience_level
FROM ai_users;
--this seem to be very good, no modification
--industry check, no mistake
SELECT DISTINCT industry
FROM ai_users;
SELECT *
FROM ai_users
WHERE country = 'Nigeria'
SELECT *
FROM ai_users
SELECT ROW_NUMBER() OVER(
        PARTITION BY country
        ORDER BY country
    ),
    country
FROM ai_users -- WE have 100 countries
SELECT ROW_NUMBER() OVER(
        ORDER BY country
    ) AS row_num,
    country
FROM ai_users
GROUP BY country;
-- WE have 100 cities
SELECT ROW_NUMBER() OVER(
        ORDER BY city
    ) AS row_num,
    city
FROM ai_users
GROUP BY city;
-- we have 50 ai tools
SELECT ROW_NUMBER() OVER(
        ORDER BY ai_tool
    ) AS row_num,
    ai_tool
FROM ai_users
GROUP BY ai_tool;
--let us change data type for usage per week
ALTER TABLE ai_users
alter COLUMN usage_hours_per_week type NUMERIC;
-- Number of type of users ofin this dataset
WITH count_users as(
    SELECT user_type,
        COUNT(*) total_people
    FROM ai_users
    GROUP BY user_type
    ORDER BY total_people DESC
)
SELECT *
FROM count_users;
--let us change productivity_gain_pct that is FLOAT type to NUMERIC
alter Table ai_users
alter COLUMN productivity_gain_pct type NUMERIC