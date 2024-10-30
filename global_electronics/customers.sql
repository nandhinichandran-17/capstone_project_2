use capstone_2;
SELECT * FROM capstone_2.customers;
/*Gender Distribution with Total and Percentage*/
SELECT 
    Gender, 
    COUNT(*) AS count_gender,
    ROUND((COUNT(*) / (SELECT COUNT(*) FROM customers)) * 100, 2) AS percentage
FROM customers
GROUP BY Gender;

/*Age Group Distribution for All Customers*/
SELECT
    CASE
        WHEN TIMESTAMPDIFF(YEAR, STR_TO_DATE(birthday, '%Y-%m-%d'), CURDATE()) <= 18 THEN '<=18'
        WHEN TIMESTAMPDIFF(YEAR, STR_TO_DATE(birthday, '%Y-%m-%d'), CURDATE()) BETWEEN 19 AND 25 THEN '19-25'
        WHEN TIMESTAMPDIFF(YEAR, STR_TO_DATE(birthday, '%Y-%m-%d'), CURDATE()) BETWEEN 26 AND 35 THEN '26-35'
        WHEN TIMESTAMPDIFF(YEAR, STR_TO_DATE(birthday, '%Y-%m-%d'), CURDATE()) BETWEEN 36 AND 45 THEN '36-45'
        WHEN TIMESTAMPDIFF(YEAR, STR_TO_DATE(birthday, '%Y-%m-%d'), CURDATE()) BETWEEN 46 AND 55 THEN '46-55'
        WHEN TIMESTAMPDIFF(YEAR, STR_TO_DATE(birthday, '%Y-%m-%d'), CURDATE()) BETWEEN 56 AND 65 THEN '56-65'
        ELSE '>65'
    END AS age_bucket,
    COUNT(*) AS customer_count
FROM customers
GROUP BY age_bucket
ORDER BY customer_count DESC;

/*Geographical Distribution of Customers (By Continent, Country, and City)*/
SELECT 
    Continent, 
    Country, 
    State, 
    City, 
    COUNT(CustomerKey) AS customer_count
FROM customers
GROUP BY Continent, Country, State, City
ORDER BY customer_count DESC;

 /*Average Age by Gender*/
 SELECT 
    Gender, 
    AVG(TIMESTAMPDIFF(YEAR, STR_TO_DATE(birthday, '%Y-%m-%d'), CURDATE())) AS avg_age
FROM customers
GROUP BY Gender;

/*Top Cities with Customer Gender Concentration*/
SELECT 
    City, 
    State, 
    Country,
    COUNT(CASE WHEN Gender = 'Female' THEN 1 END) AS female_count,
    COUNT(CASE WHEN Gender = 'Male' THEN 1 END) AS male_count,
    ROUND((COUNT(CASE WHEN Gender = 'Female' THEN 1 END) / COUNT(*)) * 100, 2) AS female_percentage,
    ROUND((COUNT(CASE WHEN Gender = 'Male' THEN 1 END) / COUNT(*)) * 100, 2) AS male_percentage
FROM customers
GROUP BY City, State, Country
ORDER BY female_percentage DESC
LIMIT 10;  -- Adjust the limit as necessary to get more or fewer results

/*Purchase Patterns*/
SELECT 
    c.CustomerKey,
    c.Name,
    COUNT(DISTINCT s.Order_Number) AS num_purchases,
    AVG(s.Quantity) AS avg_order_quantity -- Calculates average quantity per order
FROM customers c
JOIN sales s ON c.CustomerKey = s.CustomerKey
GROUP BY c.CustomerKey, c.Name;
