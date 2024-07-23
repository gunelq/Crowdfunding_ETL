
--Query based on campaign dataframe 
-- 1. List company_name,goal,pledged,backers_count,country,launch_date,end_date for records with outcome is successful value
SELECT
        company_name,
        goal,
        pledged,
        backers_count,
        country,
        launch_date,
        end_date
    FROM
        campaign
    WHERE
        outcome = 'successful';

-- 2. Group sum of column by category_id
SELECT
        category_id,
        SUM(pledged) AS total
    FROM
        campaign
    GROUP BY
        category_id;
-- 3. Group average rate ( pledged/goal) by country
 SELECT
        country,
        AVG(pledged / goal) AS avg_rate
    FROM
        campaign
    GROUP BY
        country;

-- Summarize campaign_count by launch month
  SELECT
        EXTRACT(MONTH FROM launch_date) AS launch_month,
        COUNT(*) AS campaign_count
    FROM
        campaign
    GROUP BY
        EXTRACT(MONTH FROM launch_date)
    ORDER BY
        launch_month;
-- Create table  and summarize outcome (seperate all options) by category  
SELECT
    category_id AS Row_Labels,
    SUM(CASE WHEN outcome = 'canceled' THEN 1 ELSE 0 END) AS canceled,
    SUM(CASE WHEN outcome = 'failed' THEN 1 ELSE 0 END) AS failed,
    SUM(CASE WHEN outcome = 'live' THEN 1 ELSE 0 END) AS live,
    SUM(CASE WHEN outcome = 'successful' THEN 1 ELSE 0 END) AS successful,
    COUNT(*) AS Grand_Total
FROM
    campaign
GROUP BY
    category_id
ORDER BY
    category_id;


-- Create a breakdown of outcome by goal (create 12 goal ranges) , 

SELECT
    CASE
        WHEN goal < 1000 THEN '<1000'
        WHEN goal BETWEEN 1000 AND 4999 THEN '1000 to 4999'
        WHEN goal BETWEEN 5000 AND 9999 THEN '5000 to 9999'
        WHEN goal BETWEEN 10000 AND 14999 THEN '10000 to 14999'
        WHEN goal BETWEEN 15000 AND 19999 THEN '15000 to 19999'
        WHEN goal BETWEEN 20000 AND 24999 THEN '20000 to 24999'
        WHEN goal BETWEEN 25000 AND 29999 THEN '25000 to 29999'
        WHEN goal BETWEEN 30000 AND 34999 THEN '30000 to 34999'
        WHEN goal BETWEEN 35000 AND 39999 THEN '35000 to 39999'
        WHEN goal BETWEEN 40000 AND 44999 THEN '40000 to 44999'
        WHEN goal BETWEEN 45000 AND 49999 THEN '45000 to 49999'
        ELSE '>=50000'
    END AS Goal_Range,
    SUM(CASE WHEN outcome = 'successful' THEN 1 ELSE 0 END) AS Number_Successful,
    SUM(CASE WHEN outcome = 'failed' THEN 1 ELSE 0 END) AS Number_Failed,
    SUM(CASE WHEN outcome = 'canceled' THEN 1 ELSE 0 END) AS Number_Canceled,
    COUNT(*) AS Total_Projects,
    CONCAT(ROUND(SUM(CASE WHEN outcome = 'successful' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 0), '%') AS Percentage_Successful,
    CONCAT(ROUND(SUM(CASE WHEN outcome = 'failed' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 0), '%') AS Percentage_Failed,
    CONCAT(ROUND(SUM(CASE WHEN outcome = 'canceled' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 0), '%') AS Percentage_Canceled
FROM
    campaign
GROUP BY
    Goal_Range
ORDER BY
    MIN(goal);


-- List statistic metrics based on backers_count column for faoled and successful projects 
SELECT
    outcome,
    AVG(backers_count) AS mean,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY backers_count) AS median,
    MIN(backers_count) AS minimum,
    MAX(backers_count) AS maximum,
    VARIANCE(backers_count) AS variance,
    STDDEV(backers_count) AS st_dev,
    MAX(backers_count) - MIN(backers_count) AS range
FROM
    campaign
WHERE
    outcome IN ('successful', 'failed')
GROUP BY
    outcome;



    SELECT
        company_name,
        backers_count
    FROM
        campaign
    WHERE
        backers_count > 1000
          ;