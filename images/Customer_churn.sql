show databases ;
use churn_project ;
select * from churn_data limit 10 ;
/*Overall Churn Rate*/
SELECT 
    COUNT(*) AS total_customers,
    SUM(churn_flag) AS total_churn,
    ROUND(SUM(churn_flag)/COUNT(*), 2) AS churn_rate
FROM churn_data;
/*Churn by Contract*/
SELECT 
    Contract,
    COUNT(*) AS total_customers,
    SUM(churn_flag) AS total_churn,
    ROUND(SUM(churn_flag)/COUNT(*), 2) AS churn_rate
FROM churn_data
GROUP BY Contract;
/*Churn by Tenure Group*/
SELECT 
    CASE 
        WHEN tenure < 12 THEN 'New'
        WHEN tenure < 24 THEN 'Medium'
        ELSE 'Long-term'
    END AS tenure_group,
    ROUND(SUM(churn_flag)/COUNT(*), 2) AS churn_rate
FROM churn_data
GROUP BY tenure_group;
/*Churn by Charges*/
SELECT 
    CASE 
        WHEN MonthlyCharges < 50 THEN 'Low'
        WHEN MonthlyCharges < 80 THEN 'Medium'
        ELSE 'High'
    END AS charge_group,
    ROUND(SUM(churn_flag)/COUNT(*), 2) AS churn_rate
FROM churn_data
GROUP BY charge_group;
/*Churn by Payment Method*/
SELECT 
    PaymentMethod,
    ROUND(SUM(churn_flag)/COUNT(*), 2) AS churn_rate
FROM churn_data
GROUP BY PaymentMethod;

SELECT 
    Contract,
    CASE 
        WHEN MonthlyCharges < 50 THEN 'Low'
        WHEN MonthlyCharges < 80 THEN 'Medium'
        ELSE 'High'
    END AS charge_group,
    ROUND(SUM(churn_flag)/COUNT(*), 2) AS churn_rate
FROM churn_data
GROUP BY Contract, charge_group;
