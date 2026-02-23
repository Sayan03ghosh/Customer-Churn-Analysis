
USE churn_project;
GO

/* 1) Dataset size */
SELECT COUNT(*) AS total_rows
FROM clean_telco_churn;
GO

/* 2) Overall churn KPI */
SELECT
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn_Label = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    CAST(
        100.0 * SUM(CASE WHEN Churn_Label = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)
        AS DECIMAL(10, 2)
    ) AS churn_rate_pct
FROM clean_telco_churn;
GO

/* 3) Churn by contract */
SELECT
    Contract,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn_Label = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    CAST(
        100.0 * SUM(CASE WHEN Churn_Label = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)
        AS DECIMAL(10, 2)
    ) AS churn_rate_pct
FROM clean_telco_churn
GROUP BY Contract
ORDER BY churn_rate_pct DESC;
GO

/* 4) Churn by payment method */
SELECT
    Payment_Method,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn_Label = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    CAST(
        100.0 * SUM(CASE WHEN Churn_Label = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)
        AS DECIMAL(10, 2)
    ) AS churn_rate_pct
FROM clean_telco_churn
GROUP BY Payment_Method
ORDER BY churn_rate_pct DESC;
GO

/* 5) Churn by internet type */
SELECT
    Internet_Type,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn_Label = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    CAST(
        100.0 * SUM(CASE WHEN Churn_Label = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)
        AS DECIMAL(10, 2)
    ) AS churn_rate_pct
FROM clean_telco_churn
GROUP BY Internet_Type
ORDER BY churn_rate_pct DESC;
GO

/* 6) Average feature comparison: churn vs non-churn */
SELECT
    Churn_Label,
    CAST(AVG(Tenure_in_Months) AS DECIMAL(10, 2)) AS avg_tenure_months,
    CAST(AVG(Monthly_Charge) AS DECIMAL(10, 2)) AS avg_monthly_charge,
    CAST(AVG(Avg_Monthly_GB_Download) AS DECIMAL(10, 2)) AS avg_monthly_gb_download,
    CAST(AVG(Total_Revenue) AS DECIMAL(10, 2)) AS avg_total_revenue,
    CAST(AVG(Satisfaction_Score) AS DECIMAL(10, 2)) AS avg_satisfaction_score,
    CAST(AVG(Churn_Score) AS DECIMAL(10, 2)) AS avg_churn_score
FROM clean_telco_churn
GROUP BY Churn_Label;
GO

/* 7) Tenure-band churn analysis */
WITH tenure_bucket AS (
    SELECT
        CASE
            WHEN Tenure_in_Months BETWEEN 0 AND 6 THEN '0-6'
            WHEN Tenure_in_Months BETWEEN 7 AND 12 THEN '7-12'
            WHEN Tenure_in_Months BETWEEN 13 AND 24 THEN '13-24'
            WHEN Tenure_in_Months BETWEEN 25 AND 36 THEN '25-36'
            WHEN Tenure_in_Months BETWEEN 37 AND 60 THEN '37-60'
            ELSE '61+'
        END AS tenure_band,
        Churn_Label
    FROM clean_telco_churn
)
SELECT
    tenure_band,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn_Label = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    CAST(
        100.0 * SUM(CASE WHEN Churn_Label = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)
        AS DECIMAL(10, 2)
    ) AS churn_rate_pct
FROM tenure_bucket
GROUP BY tenure_band
ORDER BY
    CASE tenure_band
        WHEN '0-6' THEN 1
        WHEN '7-12' THEN 2
        WHEN '13-24' THEN 3
        WHEN '25-36' THEN 4
        WHEN '37-60' THEN 5
        ELSE 6
    END;
GO

/* 8) Satisfaction score impact */
SELECT
    Satisfaction_Score,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn_Label = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    CAST(
        100.0 * SUM(CASE WHEN Churn_Label = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)
        AS DECIMAL(10, 2)
    ) AS churn_rate_pct
FROM clean_telco_churn
GROUP BY Satisfaction_Score
ORDER BY Satisfaction_Score;
GO

/* 9) Revenue loss from churned customers */
SELECT
    CAST(SUM(Total_Revenue) AS DECIMAL(18, 2)) AS total_revenue_lost,
    CAST(AVG(Total_Revenue) AS DECIMAL(18, 2)) AS avg_revenue_per_churned_customer
FROM clean_telco_churn
WHERE Churn_Label = 'Yes';
GO

/* 10) Churn category distribution */
SELECT
    Churn_Category,
    COUNT(*) AS churn_count
FROM clean_telco_churn
WHERE Churn_Label = 'Yes'
GROUP BY Churn_Category
ORDER BY churn_count DESC;
GO

/* 11) Top churn reasons */
SELECT TOP 10
    Churn_Reason,
    COUNT(*) AS churn_count
FROM clean_telco_churn
WHERE Churn_Label = 'Yes'
GROUP BY Churn_Reason
ORDER BY churn_count DESC;
GO
