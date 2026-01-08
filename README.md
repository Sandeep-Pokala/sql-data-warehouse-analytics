# SQL Data Warehouse Analytics

##  Project Overview
This project focuses on building an **analytics-ready SQL data warehouse (Gold layer)** and performing **advanced analytical SQL analysis** on sales, customer, and product data.  
The goal is to transform raw transactional data into **business-consumable insights** using structured data modeling and analytical SQL.

---

##  Data Warehouse Design
The warehouse follows a **star schema** design optimized for analytics:

- **gold_dim_customers** – customer demographics and attributes  
- **gold_dim_products** – product, category, and cost information  
- **gold_fact_sales** – transactional sales data (orders, quantity, revenue, dates)

This structure enables efficient querying, aggregation, and KPI calculation.

---

##  Key Analyses Performed
- **Time-Series Analysis**: monthly and yearly sales trends
- **Cumulative Analysis**: running totals and moving averages
- **Customer Segmentation**: VIP, Regular, and New customers based on lifespan and spending
- **Product Performance Analysis**: high-, mid-, and low-performing products
- **Part-to-Whole Analysis**: revenue contribution by category
- **Ranking Analysis**: top and bottom products and customers by revenue
- **Magnitude Analysis**: distribution of customers, products, and revenue across dimensions

---

##  Business KPIs Computed
- Total sales, total orders, total quantity
- Customer recency and lifespan
- Average Order Value (AOV)
- Average Monthly Spend
- Product-level revenue and average selling price
- Revenue contribution by category and customer segment

Reusable **SQL views** were created for customer-level and product-level reporting.

---

##  Tools & Technologies
- **SQL (MySQL)**
- **Data Warehousing Concepts**
- **Analytical SQL (CTEs, Window Functions, Aggregations)**

---

##  Outcome
This project demonstrates the ability to:
- Design an analytics-ready data warehouse
- Write complex, business-focused SQL queries
- Translate raw data into actionable business insights
- Build reusable reporting layers for downstream analytics and BI tools

---


---

##  How to Use
1. Run the schema and table creation scripts
2. Load the CSV data into MySQL
3. Execute analytical and reporting queries
4. Query the reporting views for business insights

---

##  Author
**Sandeep Pokala**  
 SQL | Analytics
