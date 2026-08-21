SELECT 
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate
FROM telco_churn_clean;


SELECT
    TenureGroup,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate
FROM telco_churn_clean
GROUP BY TenureGroup
ORDER BY churn_rate DESC;


SELECT
    InternetService,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate
FROM telco_churn_clean
GROUP BY InternetService
ORDER BY churn_rate DESC;


SELECT
    Contract,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate
FROM telco_churn_clean
GROUP BY Contract
ORDER BY churn_rate DESC;


SELECT
    PaymentMethod,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate
FROM telco_churn_clean
GROUP BY PaymentMethod
ORDER BY churn_rate DESC;


SELECT
    Churn,
    COUNT(*) AS customers,
    ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_charges,
    ROUND(MIN(MonthlyCharges), 2) AS min_monthly_charges,
    ROUND(MAX(MonthlyCharges), 2) AS max_monthly_charges
FROM telco_churn_clean
GROUP BY Churn;


SELECT
    customerID,
    Contract,
    MonthlyCharges,
    TenureGroup,
    InternetService
FROM telco_churn_clean
WHERE Churn = 'No'
  AND Contract = 'Month-to-month'
  AND MonthlyCharges > (
      SELECT AVG(MonthlyCharges)
      FROM telco_churn_clean
  )
ORDER BY MonthlyCharges DESC;


SELECT
    ROUND(SUM(MonthlyCharges) * 12, 2) AS annualized_revenue_from_churned_customers
FROM telco_churn_clean
WHERE Churn = 'Yes';


