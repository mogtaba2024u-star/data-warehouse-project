-- Top Customers

SELECT
    c.customer_name,
    SUM(f.total_amount) AS total_sales
FROM fact_sales f
JOIN dim_customer c
ON f.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY total_sales DESC;


-- Top Products

SELECT
    p.product_name,
    SUM(f.quantity) AS total_quantity,
    SUM(f.total_amount) AS revenue
FROM fact_sales f
JOIN dim_product p
ON f.product_id = p.product_id
GROUP BY p.product_name
ORDER BY revenue DESC;


-- Sales By City

SELECT
    c.city,
    SUM(f.total_amount) AS total_sales
FROM fact_sales f
JOIN dim_customer c
ON f.customer_id = c.customer_id
GROUP BY c.city
ORDER BY total_sales DESC;


-- Monthly Sales

SELECT
    d.month,
    d.year,
    SUM(f.total_amount) AS total_sales
FROM fact_sales f
JOIN dim_date d
ON f.date_id = d.date_id
GROUP BY d.month, d.year
ORDER BY d.year, d.month;
