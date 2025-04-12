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
- [📥 Data Insertion](https://github.com/nugiYabesi/CUP_OF_SQL/blob/main/SEPARATE%20FUNCTION%20SYNTAX/INSERTION%20OF%20VALUES%20IN%20COFFEE_SHOP_SALES.sql)  
- ![Table Creation and insertion of data insertion Screenshot](https://github.com/nugiYabesi/CUP_OF_SQL/blob/main/COFFEE_SHOP_SALES_SCREENSHOOTS/CREATION%20OF%20TABLE%20AND%20INSERTION%20OF%20VALUES%20IN%20COFFEE_SHOP_SALES.png)

📝 *Initial table setup for running all window function queries.*

---

### 🔄 Using `LAG()` & `LEAD()` to Compare Purchases

- [📊 Query Link](https://github.com/nugiYabesi/CUP_OF_SQL/blob/main/SEPARATE%20FUNCTION%20SYNTAX/using%20LAG%20and%20LEAD%20()%20Compare%20Values%20with%20Previous%20records.sql)  
- ![LAG & LEAD Screenshot](https://github.com/nugiYabesi/CUP_OF_SQL/blob/main/COFFEE_SHOP_SALES_SCREENSHOOTS/using%20LAG%20and%20LEAD%20()%20Compare%20Values%20with%20Previous%20records.png)

📌 *Compare each customer's current drink price to their previous purchase.*

🧩 Real-life: Track pricing behavior or customer loyalty tiering.

---

### 🏅 Rank Drinks per Customer (`RANK()` vs `DENSE_RANK()`)

- [📈 Query Link](https://github.com/nugiYabesi/CUP_OF_SQL/blob/main/SEPARATE%20FUNCTION%20SYNTAX/Using%20RANK()%20and%20DENSE_RANK()%20to%20%20Ranking%20Data%20within%20a%20Category.sql)  
- ![RANK Screenshot](https://github.com/nugiYabesi/CUP_OF_SQL/blob/main/COFFEE_SHOP_SALES_SCREENSHOOTS/Using%20RANK()%20and%20DENSE_RANK()%20to%20%20Ranking%20Data%20within%20a%20Category.png)

📌 *Highlights ranking differences (ties vs no ties).*

🎯 Real-life: Loyalty levels or performance-based analysis.

---

### 💎 Top 3 Drinks by Price per Customer

- [🍾 Query Link](https://github.com/nugiYabesi/CUP_OF_SQL/blob/main/SEPARATE%20FUNCTION%20SYNTAX/fetching%20top%203%20most%20expensive%20drinks%20per%20customer.sql)  
- ![Top 3 Screenshot](https://github.com/nugiYabesi/CUP_OF_SQL/blob/main/COFFEE_SHOP_SALES_SCREENSHOOTS/fetching%20top%203%20most%20expensive%20drinks%20per%20customer.png)

📌 *Extracts each customer’s top 3 luxury purchases.*

💼 Real-life: Identify top spenders & optimize product pricing.

---

### ⏳ First 2 Purchases per Customer

- [🕵️ Query Link](https://github.com/nugiYabesi/CUP_OF_SQL/blob/main/SEPARATE%20FUNCTION%20SYNTAX/retrieving%20the%20first%202%20records%20per%20customers%20%20on%20sale_column.sql)  
- ![First 2 Purchases Screenshot](https://github.com/nugiYabesi/CUP_OF_SQL/blob/main/COFFEE_SHOP_SALES_SCREENSHOOTS/retrieving%20the%20first%202%20records%20per%20customers%20%20on%20sale_column.png)

📌 *Uses `ROW_NUMBER()` to capture early purchase behavior.*

🔍 Real-life: Understand new customer preferences.

---

### 📊 Aggregation with `MAX() OVER()`

- [📈 Query Link](https://github.com/nugiYabesi/CUP_OF_SQL/blob/main/SEPARATE%20FUNCTION%20SYNTAX/Aggregation%20with%20Window%20Functions.sql)  
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

- 📅 Submitted: **April 12, 2025, at 8:00 PM**  
- 📎 [📥 Download Full Project SQL File](https://github.com/nugiYabesi/CUP_OF_SQL/blob/main/coffee_shop_sales.sql)

---
