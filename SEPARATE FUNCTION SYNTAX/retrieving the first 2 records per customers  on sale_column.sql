-- retrieving the first 2 records per customers  on sale_column---

SELECT *
FROM (
    SELECT 
        customer_name,
        drink_type,
        sale_time,
        ROW_NUMBER() OVER (PARTITION BY customer_name ORDER BY sale_time) AS order_rank
    FROM coffee_sales
)
WHERE order_rank <= 2;