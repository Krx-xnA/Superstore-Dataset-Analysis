CREATE DATABASE ECOM;
USE ECOM;

SELECT * FROM superstoredataset LIMIT 10;

-- 1. Total Sales & Profit
SELECT 
SUM(sales) AS total_sales,
SUM(profit) AS total_profit
FROM superstoredataset;

-- 2. Sales by Region
SELECT 
region,
SUM(sales) AS total_sales
FROM superstoredataset
GROUP BY region
ORDER BY total_sales DESC;

-- 3. Top 10 Products by Sales
SELECT 
product_name,
SUM(sales) AS revenue
FROM superstoredataset
GROUP BY product_name
ORDER BY revenue DESC
LIMIT 10;

-- 4. Profit by Category
SELECT 
category,
SUM(profit) AS total_profit
FROM superstoredataset
GROUP BY category;

-- 5. Loss-Making Products
SELECT 
product_name,
SUM(profit) AS total_profit
FROM superstoredataset
GROUP BY product_name
HAVING total_profit < 0
ORDER BY total_profit;

-- 6. Monthly Sales Trend
SELECT 
DATE_FORMAT(order_date,'%Y-%m') AS month,
SUM(sales) AS revenue
FROM superstoredataset
GROUP BY month
ORDER BY month;

-- 7. Top Customers
SELECT 
customer_name,
SUM(sales) AS total_spent
FROM superstoredataset
GROUP BY customer_name
ORDER BY total_spent DESC
LIMIT 5;

-- 8. Customer Ranking (Window Function)
SELECT
customer_name,
SUM(sales) AS total_spent,
RANK()OVER(ORDER BY SUM(sales) DESC) AS RANK_POSITION
FROM superstoredataset
GROUP BY customer_name;
