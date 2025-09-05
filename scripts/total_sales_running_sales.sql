--Calculate the total sales per month 
-- and the running total of sales over time
SELECT
order_date,
total_sales,
SUM(total_sales) OVER (PARTITION BY order_date ORDER BY order_date) AS running_total_sales
FROM 
(
SELECT
DATETRUNC(month,order_date) AS order_date,
SUM(sales_amount) AS total_sales
FROM  gold.fact_sales
WHERE Order_Date IS NOT NUll
GROUP BY DATETRUNC(month,order_date)
)t


SELECT
order_date,
total_sales,
SUM(total_sales) OVER ( ORDER BY order_date) AS running_total_sales,
AVG(total_sales) OVER ( ORDER BY order_date) AS moving_average_price
FROM 
(
SELECT
DATETRUNC(year,order_date) AS order_date,
SUM(sales_amount) AS total_sales,
AVG(Price) AS avg_price
FROM  gold.fact_sales
WHERE Order_Date IS NOT NUll
GROUP BY DATETRUNC(year,order_date)
)t
