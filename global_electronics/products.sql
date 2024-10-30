use capstone_2;
SELECT * FROM capstone_2.products;
/* Overall Product Profitability*/
SELECT 
    ProductKey,
    Product_Name,
    Brand,
    Color,
    (Unit_Price_USD - Unit_Cost_USD) AS Profit,
    (Unit_Price_USD - Unit_Cost_USD) / Unit_Cost_USD * 100 AS ProfitMargin
FROM products
ORDER BY Profit DESC
LIMIT 10;  -- Top 10 most profitable products

/*Average Price and Cost by Category*/
SELECT 
    Category,
    AVG(Unit_Cost_USD) AS Average_Cost,
    AVG(Unit_Price_USD) AS Average_Price,
    AVG(Unit_Price_USD - Unit_Cost_USD) AS Average_Profit
FROM products
GROUP BY Category
ORDER BY Average_Profit DESC;

/*Top Brands by Revenue*/
SELECT 
    Brand,
    SUM(Unit_Price_USD) AS Total_Revenue
FROM products
GROUP BY Brand
ORDER BY Total_Revenue DESC
LIMIT 10;  -- Top 10 brands by revenue

/* Product Count by Color*/
SELECT 
    Color,
    COUNT(*) AS Product_Count
FROM products
GROUP BY Color
ORDER BY Product_Count DESC;

/*Price vs. Cost Analysis*/
SELECT 
    CASE 
        WHEN Unit_Price_USD > Unit_Cost_USD THEN 'Profitable'
        WHEN Unit_Price_USD < Unit_Cost_USD THEN 'Loss'
        ELSE 'Break-even'
    END AS Profit_Status,
    COUNT(*) AS Product_Count
FROM products
GROUP BY Profit_Status;


