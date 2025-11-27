--KPI's
select *from pizza_sales
--Toatl Renvueue
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales;
--Avg Order value
SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value FROM pizza_sales
--Toatl pizza sold
SELECT SUM(quantity) AS Total_pizza_sold FROM pizza_sales
-- Total Orders
SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales
-- Avg pizza per order
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM pizza_sales


--Daily Trends for Total Orders
SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales
GROUP BY DATENAME(DW, order_date)
--Monthly Trends for Total Orders
select DATENAME(MONTH, order_date) as Month_Name, COUNT(DISTINCT order_id) as Total_Orders
from pizza_sales
GROUP BY DATENAME(MONTH, order_date)


--Percentages Of Sales by pizza category
SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category
--Percentages of sales by pizza size
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT FROM pizza_sales
GROUP BY pizza_size ORDER BY pizza_size
--Total pizza sold by category
SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_salesWHERE MONTH(order_date) = 2
GROUP BY pizza_category ORDER BY Total_Quantity_Sold DESC

--Top 5 pizza by Renvueue
SELECT Top 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales GROUP BY pizza_name ORDER BY Total_Revenue DESC

--Top 5 pizza by Quantity
SELECT Top 5 pizza_name, SUM(quantity) AS Total_quantity
FROM pizza_sales GROUP BY pizza_name ORDER BY Total_quantity DESC

--Top 5 pizza by Total Orders
SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales GROUP BY pizza_name ORDER BY Total_Orders DESC

--Bottom 5 pizza by renvueue
SELECT Top 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales GROUP BY pizza_name ORDER BY Total_Revenue ASC

--Bottom 5 pizza by Quantity
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales GROUP BY pizza_name ORDER BY Total_Pizza_Sold ASC

--Bottom 5 pizza by Total Orders
SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales GROUP BY pizza_name ORDER BY Total_Orders ASC


