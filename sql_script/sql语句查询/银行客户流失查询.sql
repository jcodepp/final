SELECT
    COUNT(*) AS 全部客户数,
    SUM(Exited) AS 流失客户数,
    ROUND(AVG(Exited),4) AS 整体流失率
FROM bank_clean;


SELECT
    Geography AS 地区,
    Gender AS 性别,
    COUNT(*) AS 客户数量,
    ROUND(AVG(Exited),4) AS 流失率
FROM bank_clean
GROUP BY Geography, Gender
ORDER BY 流失率 DESC;

SELECT
    CASE
        WHEN Age <=30 THEN '30岁以下'
        WHEN Age <=40 THEN '31-40岁'
        WHEN Age <=50 THEN '41-50岁'
        WHEN Age <=60 THEN '51-60岁'
        ELSE '60岁以上'
    END AS age_group,
    ROUND(AVG(Exited),4) AS 流失率
FROM bank_clean
GROUP BY age_group;


SELECT
    CASE
        WHEN Balance = 0 THEN '0余额'
        WHEN Balance <=50000 THEN '0-5万'
        WHEN Balance <=100000 THEN '5-10万'
        ELSE '10万以上'
    END AS balance_level,
    ROUND(AVG(Exited),4) AS 流失率
FROM bank_clean
GROUP BY balance_level;

SELECT
    NumOfProducts,
    ROUND(AVG(Exited),4) AS 流失率
FROM bank_clean
GROUP BY NumOfProducts;

SELECT
    CASE IsActiveMember
        WHEN 1 THEN '活跃客户'
        WHEN 0 THEN '沉睡客户'
    END AS active_status,
    ROUND(AVG(Exited),4) AS 流失率
FROM bank_clean
GROUP BY IsActiveMember;