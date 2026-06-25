INSERT INTO dim_customer
SELECT *
FROM customers;

INSERT INTO dim_product (
    product_id,
    product_name,
    category
)
SELECT
    product_id,
    product_name,
    category
FROM products;

INSERT INTO dim_date (full_date, month, year)
SELECT DISTINCT
order_date,
EXTRACT(MONTH FROM order_date),
EXTRACT(YEAR FROM order_date)
FROM orders;

INSERT INTO fact_sales (
    customer_id,
    product_id,
    date_id,
    quantity,
    total_amount
)
SELECT
o.customer_id,
o.product_id,
d.date_id,
o.quantity,
(o.quantity * p.price)
FROM orders o
JOIN products p
ON o.product_id = p.product_id
JOIN dim_date d
ON o.order_date = d.full_date;
