# ☕👉🛢️ **CUP_OF_SQL**

> *“SQL MUST BE ENJOYED LIKE A GOOD CUP OF COFFEE.”*

---

## 📚 **Project Title**  
**Exploring SQL Window Functions – Coffee Shop Sales Analysis**

---

## 👥 **Team Members**
- 👨‍💻 *Iyukuri Nugi Yabesi* — `ID: 27327`  
- 👨‍💻 *Kwizera Innocent* — `ID: 27472`

---

## 🧑‍🏫 **Instructor**
- *Eric Maniraguha*  
  🔗 GitHub: [@ericmaniraguha](https://github.com/ericmaniraguha)

---

## 🎯 **Objectives**

This project demonstrates the power of **SQL Window Functions** through real-world analytical queries on a simulated coffee shop dataset. Our goals include:

- 🔍 Comparing records using `LAG()` and `LEAD()`
- 🏅 Ranking data using `RANK()` and `DENSE_RANK()`
- ⏱ Extracting earliest records with `ROW_NUMBER()`
- 📊 Aggregating data using `MAX()` with `PARTITION BY`
- 🧠 Providing practical, real-life applications
- 🖼 Visualizing queries with screenshots and results

---

## 📦 **Repository Contents**

📁 CUP_OF_SQL/ 
├── 📸 COFFEE_SHOP_SALES_SCREENSHOOTS/ → Screenshots of SQL Developer outputs

├── 🧾 SEPARATE FUNCTION SYNTAX/ → Table creation, insert statements & queries

├── 📜 coffee_shop_sales.sql → Full SQL syntax

└── 📘 README.md → Explanation, visuals & findings


---

## ☕ **Dataset Description**

Simulated small-scale coffee shop sales log with the following attributes:

- 👤 Customer Names  
- 🥤 Drink Types  
- 💲 Prices  
- ⏰ Sale Timestamps  
- 🔢 Quantities Sold  

> Perfect for showcasing **Oracle SQL Window Functions** in an intuitive way.

---

## ✅ **Assignment Requirements & Query Explanations**

---

### 🔧 Table Setup

- [🧱 Table Creation](https://github.com/nugiYabesi/CUP_OF_SQL/blob/main/SEPARATE%20FUNCTION%20SYNTAX/CREATION%20OF%20TABLE%20coffee_shop_sales.sql)

```sql
CREATE TABLE coffee_shop_sales (
    sale_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    customer_name VARCHAR2(100),
    drink_type VARCHAR2(50),
    price NUMBER(5,2),
    sale_time TIMESTAMP,
    quantity NUMBER(5) DEFAULT 1
);
```

- [📥 Data Insertion](https://github.com/nugiYabesi/CUP_OF_SQL/blob/main/SEPARATE%20FUNCTION%20SYNTAX/INSERTION%20OF%20VALUES%20IN%20COFFEE_SHOP_SALES.sql)

 ```sql
INSERT INTO coffee_shop_sales (customer_name, drink_type, price, sale_time, quantity)
VALUES ('IYUKURI YABES', 'Latte', 3.50, TO_TIMESTAMP('2025-04-01 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1);

INSERT INTO coffee_shop_sales (customer_name, drink_type, price, sale_time, quantity)
VALUES ('IYUKURI YABES', 'Espresso', 2.00, TO_TIMESTAMP('2025-04-01 08:15:00', 'YYYY-MM-DD HH24:MI:SS'), 2);

INSERT INTO coffee_shop_sales (customer_name, drink_type, price, sale_time, quantity)
VALUES ('JAMES MANZI', 'Cappuccino', 3.00, TO_TIMESTAMP('2025-04-01 08:20:00', 'YYYY-MM-DD HH24:MI:SS'), 3);

INSERT INTO coffee_shop_sales (customer_name, drink_type, price, sale_time, quantity)
VALUES ('ERIC MANIRAGUHA', 'Mocha', 4.00, TO_TIMESTAMP('2025-04-01 08:45:00', 'YYYY-MM-DD HH24:MI:SS'), 4);

INSERT INTO coffee_shop_sales (customer_name, drink_type, price, sale_time, quantity)
VALUES ('KWIZERA INNOCENT', 'Latte', 3.50, TO_TIMESTAMP('2025-04-01 08:50:00', 'YYYY-MM-DD HH24:MI:SS'), 4);

INSERT INTO coffee_shop_sales (customer_name, drink_type, price, sale_time, quantity)
VALUES ('MUGISHA BOB', 'Americano', 2.50, TO_TIMESTAMP('2025-04-01 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), 5);

INSERT INTO coffee_shop_sales (customer_name, drink_type, price, sale_time, quantity)
VALUES ('AMATA STELLA', 'Latte', 3.50, TO_TIMESTAMP('2025-04-01 09:15:00', 'YYYY-MM-DD HH24:MI:SS'), 1);
```
 
 - ![Table Creation and insertion of data insertion Screenshot](https://github.com/nugiYabesi/CUP_OF_SQL/blob/main/COFFEE_SHOP_SALES_SCREENSHOOTS/CREATION%20OF%20TABLE%20AND%20INSERTION%20OF%20VALUES%20IN%20COFFEE_SHOP_SALES.png)

📝 *Initial table setup for running all window function queries.*

---

### 🔄 Using `LAG()` & `LEAD()` to Compare Purchases

- [📊 Using `LAG()` & `LEAD()` to Compare Purchases](https://github.com/nugiYabesi/CUP_OF_SQL/blob/main/SEPARATE%20FUNCTION%20SYNTAX/using%20LAG%20and%20LEAD%20()%20Compare%20Values%20with%20Previous%20records.sql)

```sql
SELECT
  customer_name,
  drink_type,
  price,
  LAG(price) OVER (PARTITION BY customer_name ORDER BY sale_time) AS previous_price,
  LEAD(price) OVER (PARTITION BY customer_name ORDER BY sale_time) AS next_price,
  CASE
    WHEN price > LAG(price) OVER (PARTITION BY customer_name ORDER BY sale_time) THEN 'HIGHER'
    WHEN price < LAG(price) OVER (PARTITION BY customer_name ORDER BY sale_time) THEN 'LOWER'
    ELSE 'EQUAL'
  END AS trend_from_last_price
FROM coffee_shop_sales;
```

- ![LAG & LEAD Screenshot](https://github.com/nugiYabesi/CUP_OF_SQL/blob/main/COFFEE_SHOP_SALES_SCREENSHOOTS/using%20LAG%20and%20LEAD%20()%20Compare%20Values%20with%20Previous%20records.png)

📌 *Compare each customer's current drink price to their previous purchase.*

🧩 Real-life: Track pricing behavior or customer loyalty tiering.

---

### 🏅 Rank Drinks per Customer (`RANK()` vs `DENSE_RANK()`)

- [📈 Rank Drinks per Customer (`RANK()` vs `DENSE_RANK()](https://github.com/nugiYabesi/CUP_OF_SQL/blob/main/SEPARATE%20FUNCTION%20SYNTAX/Using%20RANK()%20and%20DENSE_RANK()%20to%20%20Ranking%20Data%20within%20a%20Category.sql)

```sql
SELECT
  customer_name,
  drink_type,
  price,
  RANK() OVER (PARTITION BY customer_name ORDER BY price DESC) AS price_rank,
  DENSE_RANK() OVER (PARTITION BY customer_name ORDER BY price DESC) AS price_dense_rank
FROM coffee_shop_sales;
```

- ![RANK Screenshot](https://github.com/nugiYabesi/CUP_OF_SQL/blob/main/COFFEE_SHOP_SALES_SCREENSHOOTS/Using%20RANK()%20and%20DENSE_RANK()%20to%20%20Ranking%20Data%20within%20a%20Category.png)

📌 *Highlights ranking differences (ties vs no ties).*

🎯 Real-life: Loyalty levels or performance-based analysis.

---

### 💎 Top 3 Drinks by Price per Customer

- [🍾 Top 3 Drinks by Price per Customer](https://github.com/nugiYabesi/CUP_OF_SQL/blob/main/SEPARATE%20FUNCTION%20SYNTAX/fetching%20top%203%20most%20expensive%20drinks%20per%20customer.sql)
  
```sql
SELECT *
FROM (
  SELECT
    customer_name,
    drink_type,
    price,
    RANK() OVER (PARTITION BY customer_name ORDER BY price DESC) AS drink_rank
  FROM coffee_shop_sales
)
WHERE drink_rank <= 3;
```
  
- ![Top 3 Screenshot](https://github.com/nugiYabesi/CUP_OF_SQL/blob/main/COFFEE_SHOP_SALES_SCREENSHOOTS/fetching%20top%203%20most%20expensive%20drinks%20per%20customer.png)

📌 *Extracts each customer’s top 3 luxury purchases.*

💼 Real-life: Identify top spenders & optimize product pricing.

---

### ⏳ First 2 Purchases per Customer

- [🕵️ First 2 Purchases per Customer](https://github.com/nugiYabesi/CUP_OF_SQL/blob/main/SEPARATE%20FUNCTION%20SYNTAX/retrieving%20the%20first%202%20records%20per%20customers%20%20on%20sale_column.sql)

```sql
SELECT *
FROM (
  SELECT
    customer_name,
    drink_type,
    price,
    sale_time,
    ROW_NUMBER() OVER (PARTITION BY customer_name ORDER BY sale_time ASC) AS row_num
  FROM coffee_shop_sales
)
WHERE row_num <= 2;
```

- ![First 2 Purchases Screenshot](https://github.com/nugiYabesi/CUP_OF_SQL/blob/main/COFFEE_SHOP_SALES_SCREENSHOOTS/retrieving%20the%20first%202%20records%20per%20customers%20%20on%20sale_column.png)

📌 *Uses `ROW_NUMBER()` to capture early purchase behavior.*

🔍 Real-life: Understand new customer preferences.

---

### 📊 Aggregation with `MAX() OVER()`

- [📈Aggregation with `MAX() OVER()](https://github.com/nugiYabesi/CUP_OF_SQL/blob/main/SEPARATE%20FUNCTION%20SYNTAX/Aggregation%20with%20Window%20Functions.sql)


```sql
SELECT
  customer_name,
  drink_type,
  price,
  MAX(price) OVER (PARTITION BY customer_name) AS max_price_per_customer,
  MAX(price) OVER () AS overall_max_price
FROM coffee_shop_sales;
```


- ![Aggregation Screenshot](https://github.com/nugiYabesi/CUP_OF_SQL/blob/main/COFFEE_SHOP_SALES_SCREENSHOOTS/Aggregation%20with%20Window%20Functions.png)

📌 *Returns highest priced drink per customer and globally.*

💡 Real-life: Highlights VIP customers and best-sellers.

---

## 📌 **Real-Life Applications Summary**

| 🧠 Function      | 🌍 Application Example                                |
|------------------|------------------------------------------------------|
| `LAG`, `LEAD`     | Salary/sales trend tracking                          |
| `RANK`, `DENSE_RANK` | Leaderboards, loyalty segmentation              |
| `ROW_NUMBER`      | Customer onboarding analysis                         |
| `MAX() OVER()`    | High-value customer/product analysis                 |

---

## 🧰 **Tech Stack**

- 🐘 **Oracle SQL Developer**  
- 🧠 **Visual Studio Code**  
- 📂 **GitHub**

---

## 🙏 **Special Thanks**

Big thanks to our instructor **Eric Maniraguha** for guidance and challenge, and to all teammates for professionalism and teamwork! 💪🚀

---

## 🎉 **Did You Know?**

> Both SQL and a good cup of coffee can make you **rich** ☕💰😂

---

## 🗓️ **Submission Details**

- 📅 Submitted: **April 12, 2025, at 8:25 PM**  
- 📎 [📥 Download Full Project SQL File](https://github.com/nugiYabesi/CUP_OF_SQL/blob/main/coffee_shop_sales.sql)

---
