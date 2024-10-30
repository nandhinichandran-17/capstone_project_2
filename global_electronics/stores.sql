use capstone_2;
SELECT * FROM capstone_2.stores;
/*Store Count by Country*/
SELECT 
    Country,
    COUNT(StoreKey) AS Store_Count
FROM stores
GROUP BY Country
ORDER BY Store_Count DESC;

/* Average Store Size by State*/
SELECT 
    State,
    AVG(Square_Meters) AS Average_Store_Size
FROM stores
GROUP BY State
ORDER BY Average_Store_Size DESC;

/*New Store Openings by Year*/
SELECT 
    YEAR(Open_Date) AS Open_Year,
    COUNT(StoreKey) AS New_Stores
FROM stores
GROUP BY Open_Year
ORDER BY Open_Year;

/*Store Distribution by Size*/
SELECT 
    CASE 
        WHEN Square_Meters < 500 THEN 'Small'
        WHEN Square_Meters BETWEEN 500 AND 1500 THEN 'Medium'
        ELSE 'Large'
    END AS Store_Size_Category,
    COUNT(StoreKey) AS Store_Count
FROM stores
GROUP BY Store_Size_Category;

/*Oldest Stores by Country*/
SELECT 
    Country,
    StoreKey,
    MIN(Open_Date) AS Oldest_Store_Open_Date
FROM stores
GROUP BY Country;
