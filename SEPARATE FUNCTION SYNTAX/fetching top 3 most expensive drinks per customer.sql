-----fetching top 3 most expensive drinks per customer----

SELECT 
        customer_name,
        drink_type,
        price,
        RANK() OVER (PARTITION BY customer_name ORDER BY price DESC) AS drink_rank
    FROM coffee_sales
)
WHERE drink_rank <= 3;