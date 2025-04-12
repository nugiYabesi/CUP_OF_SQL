SELECT
    customer_name,
    drink_type,
    price,
    LAG(price) OVER (PARTITION BY customer_name ORDER BY sale_time) AS prev_price,
    CASE
        WHEN price > LAG(price) OVER (PARTITION BY customer_name ORDER BY sale_time) THEN 'HIGHER'
        WHEN price < LAG(price) OVER (PARTITION BY customer_name ORDER BY sale_time) THEN 'LOWER'
        WHEN price = LAG(price) OVER (PARTITION BY customer_name ORDER BY sale_time) THEN 'EQUAL'
        ELSE 'N/A'
    END AS price_comparison
FROM coffee_sales;