----Using RANK() and DENSE_RANK() to Rank Data within a Category---



SELECT
    customer_name,
    drink_type,
    price,
    RANK() OVER (PARTITION BY customer_name ORDER BY price DESC) AS rank_price,
    DENSE_RANK() OVER (PARTITION BY customer_name ORDER BY price DESC) AS dense_rank_price
FROM coffee_sales;