use capstone_2;
SELECT * FROM capstone_2.sales;
/*Total Sales by Month*/
SELECT 
    DATE_FORMAT(Order_Date, '%Y-%m') AS Sales_Month,
    SUM(Quantity) AS Total_Sales
FROM sales
GROUP BY Sales_Month
ORDER BY Sales_Month;

/* Top Products by Sales Quantity*/
SELECT 
    ProductKey,
    SUM(Quantity) AS Total_Quantity_Sold
FROM sales
GROUP BY ProductKey
ORDER BY Total_Quantity_Sold DESC
LIMIT 10;  -- Top 10 products

/*Sales Performance by Store*/
SELECT 
    StoreKey,
    SUM(Quantity) AS Total_Sales
FROM sales
GROUP BY StoreKey
ORDER BY Total_Sales DESC;

/* Customer Purchase Frequency*/
SELECT 
    CustomerKey,
    COUNT(Order_Number) AS Order_Count
FROM sales
GROUP BY CustomerKey
ORDER BY Order_Count DESC
LIMIT 10;  -- Top 10 customers by order count

/*Sales by Currency*/
SELECT 
    Currency_Code,
    SUM(Quantity) AS Total_Sales
FROM sales
GROUP BY Currency_Code
ORDER BY Total_Sales DESC;

-- sales by revenue performance

SELECT
  product_name,
  ROUND(SUM((unit_price_usd)*quantity),2) AS total_revenue_USD
FROM
	merged_data
GROUP BY
  product_name
order by total_revenue_USD desc limit 10
