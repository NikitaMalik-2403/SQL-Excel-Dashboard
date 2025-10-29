SELECT * FROM Pizza_project.pizza_sales;

-- Total Revenue - The sum of total price of all the pizza orders

SELECT SUM(total_price) AS total_revenue
FROM pizza_sales;

-- Average order value -  The average amount spent per order, calculated by dividing the total revenue by the total no of orders.

SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS Average_order_value
FROM pizza_sales;

-- Total pizzas sold: the sum of quantities of all the pizza sold

SELECT SUM(quantity) AS total_pizza_sold 
From pizza_sales;

-- Total Orders - the total number of orders placed

SELECT COUNT(DISTINCT order_id)  AS Total_orders
FROM pizza_sales;

-- Average Pizzas per order - The average number of pizzas sold per order, 
-- calculated by dividing the total number of pizzas sold by total numbers of orders.

SELECT ROUND(SUM(quantity) / COUNT(DISTINCT order_id), 2) AS Avg_pizza_per_order
FROM pizza_sales;

-- Daily trend for total orders
SELECT DAYNAME( order_date) as order_day, 
COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY DAYNAME(order_date );

-- Hourly Trend for Total orders
SELECT HOUR(order_time) as order_hours,
COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY HOUR(order_time)
ORDER BY HOUR(order_time);

-- Percentage of Sales by Pizza Category

SELECT pizza_category ,SUM(total_price) * 100/  (SELECT Sum(total_price) FROM pizza_sales WHERE MONTH(order_date) = 1) 
as percentage_contribution
FROM pizza_sales
WHERE MONTH(order_date) = 1
GROUP BY pizza_category;

-- Percentage of sales by Pizza Size

SELECT pizza_size ,SUM(total_price) as total_sales,
ROUND(SUM(total_price) * 100/  (SELECT Sum(total_price) FROM pizza_sales WHERE QUARTER(order_date) = 1) ,2)
as PCT
FROM pizza_sales
WHERE QUARTER(order_date) = 1
GROUP BY pizza_size
ORDER BY PCT DESC ;

-- Total Pizzas Sold by Pizza Category

SELECT pizza_category, SUM(quantity) AS Total_pizza_sold
FROM pizza_sales
GROUP BY pizza_category;
 
-- Top 5 Sellers by total Pizza sold

SELECT pizza_name , SUM(quantity) AS Total_pizza_sold
FROM pizza_Sales
GROUP BY pizza_name
ORDER BY Total_pizza_sold DESC
LIMIT 5;

-- Bottom 5 Sellers by total_pizza_sold

SELECT pizza_name , SUM(quantity) AS Total_pizza_sold
FROM pizza_Sales
GROUP BY pizza_name
ORDER BY Total_pizza_sold ASC
LIMIT 5;







