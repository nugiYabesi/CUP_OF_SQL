CREATE TABLE coffee_shop_sales (
    sale_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    customer_name VARCHAR2(100),
    drink_type VARCHAR2(50),
    price NUMBER(5,2),
    sale_time TIMESTAMP,
    quantity NUMBER(5) DEFAULT 1
);
INSERT INTO coffee_shop_sales (customer_name, drink_type, price, sale_time,quantity) VALUES ('IYUKURI YABES', 'Latte', 3.50, TO_TIMESTAMP('2025-04-01 08:00:00', 'YYYY-MM-DD HH24:MI:SS'),1);
INSERT INTO coffee_shop_sales (customer_name, drink_type, price, sale_time,quantity) VALUES ('IYUKURI YABES', 'Espresso', 2.00, TO_TIMESTAMP('2025-04-01 08:15:00', 'YYYY-MM-DD HH24:MI:SS'),2);
INSERT INTO coffee_shop_sales (customer_name, drink_type, price, sale_time,quantity) VALUES ('JAMES MANZI', 'Cappuccino', 3.00, TO_TIMESTAMP('2025-04-01 08:20:00', 'YYYY-MM-DD HH24:MI:SS'),3);
INSERT INTO coffee_shop_sales (customer_name, drink_type, price, sale_time,quantity) VALUES ('ERIC MANIRAGUHA', 'Mocha', 4.00, TO_TIMESTAMP('2025-04-01 08:45:00', 'YYYY-MM-DD HH24:MI:SS'),4);
INSERT INTO coffee_shop_sales (customer_name, drink_type, price, sale_time,quantity) VALUES ('KWIZERA INNOCENT', 'Latte', 3.50, TO_TIMESTAMP('2025-04-01 08:50:00', 'YYYY-MM-DD HH24:MI:SS'),4);
INSERT INTO coffee_shop_sales (customer_name, drink_type, price, sale_time,quantity) VALUES ('MUGISHA BOB', 'Americano', 2.50, TO_TIMESTAMP('2025-04-01 09:00:00', 'YYYY-MM-DD HH24:MI:SS'),5);
INSERT INTO coffee_shop_sales (customer_name, drink_type, price, sale_time,quantity)  
VALUES ('AMATA STELLA', 'Cappuccino', 3.00, TO_TIMESTAMP('2025-04-01 09:05:00', 'YYYY-MM-DD HH24:MI:SS'),8);

INSERT INTO coffee_shop_sales (customer_name, drink_type, price, sale_time,quantity) VALUES ('IYUKURI YABES', 'Tea', 3.50, TO_TIMESTAMP('2025-04-01 08:00:00', 'YYYY-MM-DD HH24:MI:SS'),11);
INSERT INTO coffee_shop_sales (customer_name, drink_type, price, sale_time,quantity) VALUES ('JAMES MANZI', 'IKIVUGUTO', 3.00, TO_TIMESTAMP('2025-04-01 08:20:00', 'YYYY-MM-DD HH24:MI:SS'),13);
INSERT INTO coffee_shop_sales (customer_name, drink_type, price, sale_time,quantity) VALUES ('ERIC MANIRAGUHA', 'INSHYUNSHYU', 4.00, TO_TIMESTAMP('2025-04-01 08:45:00', 'YYYY-MM-DD HH24:MI:SS'),14);
INSERT INTO coffee_shop_sales (customer_name, drink_type, price, sale_time,quantity) VALUES ('KWIZERA INNOCENT', 'IGIKOMA', 3.50, TO_TIMESTAMP('2025-04-01 08:50:00', 'YYYY-MM-DD HH24:MI:SS'),14);
INSERT INTO coffee_shop_sales (customer_name, drink_type, price, sale_time,quantity) VALUES ('MUGISHA BOB', 'COFFEE', 2.50, TO_TIMESTAMP('2025-04-01 09:00:00', 'YYYY-MM-DD HH24:MI:SS'),15);
INSERT INTO coffee_shop_sales (customer_name, drink_type, price, sale_time,quantity)  
VALUES ('AMATA STELLA', 'LATTEE', 3.00, TO_TIMESTAMP('2025-04-01 09:05:00', 'YYYY-MM-DD HH24:MI:SS'),18);

SELECT * FROM coffee_shop_sales;



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



SELECT
    customer_name,
    drink_type,
    price,
    RANK() OVER (PARTITION BY customer_name ORDER BY price DESC) AS rank_price,
    DENSE_RANK() OVER (PARTITION BY customer_name ORDER BY price DESC) AS dense_rank_price
FROM coffee_sales;


SELECT *
FROM (
    
    
    
    
    
    SELECT 
        customer_name,
        drink_type,
        price,
        RANK() OVER (PARTITION BY customer_name ORDER BY price DESC) AS drink_rank
    FROM coffee_sales
)
WHERE drink_rank <= 3;


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


SELECT
    customer_name,
    drink_type,
    price,
    quantity,
    MAX(price) OVER (PARTITION BY customer_name) AS max_price_per_customer,
    MAX(price) OVER () AS overall_max_price
FROM coffee_sales;











