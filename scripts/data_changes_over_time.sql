--data changes over time

SELECT
MONTH(Order_Date) as order_month,
YEAR(Order_Date) as order_year,
SUM(Sales_amount) as total_sales,
COUNT(DISTINCT customer_key) as total_customers,
SUM(quantity) as total_quantity
FROM gold.fact_sales
WHERE Order_Date IS NOT NULL
GROUP BY YEAR(Order_Date),MONTH(Order_Date)
ORDER BY YEAR(Order_Date),MONTH(Order_Date)

SELECT
MONTH(Order_Date) as order_month,
SUM(Sales_amount) as total_sales,
COUNT(DISTINCT customer_key) as total_customers,
SUM(quantity) as total_quantity
FROM gold.fact_sales
WHERE Order_Date IS NOT NULL
GROUP BY MONTH(Order_Date)
ORDER BY MONTH(Order_Date)

SELECT
DATETRUNC(month,Order_Date) as order_date,
SUM(Sales_amount) as total_sales,
COUNT(DISTINCT customer_key) as total_customers,
SUM(quantity) as total_quantity
FROM gold.fact_sales
WHERE Order_Date IS NOT NULL
GROUP BY DATETRUNC(month,Order_Date)
ORDER BY DATETRUNC(month,Order_Date)

SELECT
DATETRUNC(YEAR,Order_Date) as order_date,
SUM(Sales_amount) as total_sales,
COUNT(DISTINCT customer_key) as total_customers,
SUM(quantity) as total_quantity
FROM gold.fact_sales
WHERE Order_Date IS NOT NULL
GROUP BY DATETRUNC(YEAR,Order_Date)
ORDER BY DATETRUNC(YEAR,Order_Date)

SELECT
FORMAT(Order_Date,'yyyy-MMM') as order_date,
SUM(Sales_amount) as total_sales,
COUNT(DISTINCT customer_key) as total_customers,
SUM(quantity) as total_quantity
FROM gold.fact_sales
WHERE Order_Date IS NOT NULL
GROUP BY FORMAT(Order_Date,'yyyy-MMM')
ORDER BY FORMAT(Order_Date,'yyyy-MMM')
