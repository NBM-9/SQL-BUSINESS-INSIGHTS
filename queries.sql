SELECT * FROM customers;
SELECT * FROM products
WHERE price > 300;
SELECT COUNT(*) AS total_orders FROM orders;
SELECT product_id, SUM(quantity) AS total_quantity
FROM orders
GROUP BY product_id;
SELECT c.customer_name, o.order_id, o.order_date
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id;
SELECT p.product_name,
       SUM(o.quantity * p.price) AS total_revenue
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.product_name;
SELECT DATE_TRUNC('month', order_date) AS month,
       SUM(o.quantity * p.price) AS revenue
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY month;
SELECT p.product_name,
       SUM(o.quantity) AS total_sold
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC
LIMIT 1;
SELECT p.category,
       SUM(o.quantity * p.price) AS category_revenue
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.category;
SELECT customer_id, COUNT(order_id) AS order_count
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) > 1;
