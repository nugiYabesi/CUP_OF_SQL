----CREATION OF TABLE coffee_shop_sales-----

CREATE TABLE coffee_shop_sales (
    sale_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    customer_name VARCHAR2(100),
    drink_type VARCHAR2(50),
    price NUMBER(5,2),
    sale_time TIMESTAMP,
    quantity NUMBER(5) DEFAULT 1
);