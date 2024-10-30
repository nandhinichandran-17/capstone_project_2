use capstone_2;
SELECT * FROM capstone_2.exchangerates;
/*Exchange Rate Trend Over Time*/
SELECT 
    Date,
    Currency,
    AVG(Exchange) AS average_exchange_rate
FROM exchangerates
GROUP BY Date, Currency
ORDER BY Date, Currency;

/*Currency with the Highest Average Exchange Rate*/
SELECT 
    Currency,
    AVG(Exchange) AS average_exchange_rate
FROM exchangerates
GROUP BY Currency
ORDER BY average_exchange_rate DESC
LIMIT 1;

/* Monthly Average Exchange Rates for Each Currency*/
SELECT 
    DATE_FORMAT(Date, '%Y-%m') AS month,
    Currency,
    AVG(Exchange) AS average_exchange_rate
FROM exchangerates
GROUP BY month, Currency
ORDER BY month, Currency;

/*Daily Change in Exchange Rates*/
SELECT 
    Date,
    Currency,
    Exchange,
    LAG(Exchange) OVER (PARTITION BY Currency ORDER BY Date) AS previous_exchange,
    (Exchange - LAG(Exchange) OVER (PARTITION BY Currency ORDER BY Date)) AS daily_change
FROM exchangerates;
