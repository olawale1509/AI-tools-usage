--- let us create table into the schema of the new database created
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