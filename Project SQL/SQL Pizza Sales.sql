--Create Table
CREATE TABLE pizza_sales
(pizza_id integer, order_id integer, pizza_name_id varchar,
 quantity integer, order_date date, order_time time,
 unit_price float, total_price float, pizza_size varchar,
 pizza_category varchar, pizza_ingredients varchar,
 pizza_name varchar);

-- Total Revenue
SELECT SUM(total_price) AS total_revenue FROM pizza_sales

--Average Order Value
SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS Avg_order_Value 
FROM pizza_sales

--Total Pizza Sold 
SELECT SUM(quantity) AS total_pizza_sold FROM pizza_sales

--Total Order 
SELECT COUNT(DISTINCT order_id) AS total_order from pizza_sales

--Average Pizzas Per Order
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL (10,2)) AS DECIMAL (10,2))
Avg_pizzas_per_order  FROM pizza_sales

--Daily Trend for Total Order
SELECT TO_CHAR(order_date, 'Day') AS day_name, COUNT(DISTINCT order_id) AS 
total_orders FROM pizza_sales
GROUP BY day_name

--Monthly Trend for Total Order
SELECT TO_CHAR(order_date, 'Month') AS month_name, COUNT(DISTINCT order_id) AS 
total_orders FROM pizza_sales
GROUP BY month_name

--Percentage Sales by Pizza Category
SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) AS total_revenue, 
CAST(SUM(total_price) * 100 /
(SELECT SUM(total_price) FROM pizza_sales)AS DECIMAL (10,2)) AS percentage 
FROM pizza_sales
GROUP BY pizza_category

--Percentage Sales by Pizza Size
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) AS total_revenue, 
CAST(SUM(total_price) * 100 /
(SELECT SUM(total_price) FROM pizza_sales)AS DECIMAL (10,2)) AS percentage 
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size ASC

--Top 5 Pizza by Revenue
SELECT pizza_name, SUM(total_price) AS total_revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_revenue DESC
LIMIT 5

--Bottom 5 Pizza by Revenue
SELECT pizza_name, SUM(total_price) AS total_revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_revenue ASC
LIMIT 5

--Top 5 Pizza by Quantity
SELECT pizza_name, SUM(quantity) AS total_pizza_sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_pizza_sold DESC
LIMIT 5

--Bottom 5 Pizza by Quantity
SELECT pizza_name, SUM(quantity) AS total_pizza_sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_pizza_sold ASC
LIMIT 5

--Top 5 Pizza by Total Orders
SELECT pizza_name, COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_orders DESC
LIMIT 5

--Bottom 5 Pizza by Total Orders
SELECT pizza_name, COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_orders ASC
LIMIT 5

