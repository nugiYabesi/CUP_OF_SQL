---Aggregation with Window Functions by maximum value and overall maximum value, and Using PARTITION BY to differentiate between category-level and overall calculations-------




SELECT
    customer_name,
    drink_type,
    price,
    quantity,
    MAX(price) OVER (PARTITION BY customer_name) AS max_price_per_customer,
    MAX(price) OVER () AS overall_max_price
FROM coffee_sales;