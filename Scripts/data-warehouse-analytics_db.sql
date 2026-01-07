/*
=============================================================
Create Database and Tables (MySQL)
=============================================================
Project: SQL Data Warehouse Analytics
Layer  : Gold (Analytics-ready tables)

WARNING:
    Running this script will DROP the entire database if it exists.
=============================================================
*/

-- Drop and recreate database
DROP DATABASE IF EXISTS DataWarehouseAnalytics;
CREATE DATABASE DataWarehouseAnalytics;

USE DataWarehouseAnalytics;

-- ============================
-- GOLD DIMENSION TABLES
-- ============================

CREATE TABLE gold_dim_customers (
    customer_key INT,
    customer_id INT,
    customer_number VARCHAR(50),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    country VARCHAR(50),
    marital_status VARCHAR(50),
    gender VARCHAR(50),
    birthdate DATE,
    create_date DATE
);

ALTER TABLE gold_dim_customers
MODIFY birthdate DATE NULL;


CREATE TABLE gold_dim_products (
    product_key INT,
    product_id INT,
    product_number VARCHAR(50),
    product_name VARCHAR(50),
    category_id VARCHAR(50),
    category VARCHAR(50),
    subcategory VARCHAR(50),
    maintenance VARCHAR(50),
    cost INT,
    product_line VARCHAR(50),
    start_date DATE
);

-- ============================
-- GOLD FACT TABLE
-- ============================

CREATE TABLE gold_fact_sales (
    order_number VARCHAR(50),
    product_key INT,
    customer_key INT,
    order_date DATE,
    shipping_date DATE,
    due_date DATE,
    sales_amount INT,
    quantity TINYINT,
    price INT
);

-- ============================
-- LOAD DATA FROM CSV FILES
-- ============================

TRUNCATE TABLE gold_dim_customers;

LOAD DATA INFILE
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/gold.dim_customers.csv'
INTO TABLE gold_dim_customers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(
    customer_key,
    customer_id,
    customer_number,
    first_name,
    last_name,
    country,
    marital_status,
    gender,
    @birthdate,
    create_date
)
SET birthdate = NULLIF(@birthdate, '');
-- =====================================================
TRUNCATE TABLE gold_dim_products;

LOAD DATA INFILE
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/gold.dim_products.csv'
INTO TABLE gold_dim_products
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(
    product_key,
    product_id,
    product_number,
    product_name,
    category_id,
    category,
    subcategory,
    maintenance,
    @cost,
    product_line,
    @start_date
)
SET
    cost       = NULLIF(TRIM(@cost), ''),
    start_date = NULLIF(TRIM(@start_date), '');

-- ==============================================================

TRUNCATE TABLE gold_fact_sales;

LOAD DATA INFILE
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/gold.fact_sales.csv'
INTO TABLE gold_fact_sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(
    order_number,
    product_key,
    customer_key,
    @order_date,
    @shipping_date,
    @due_date,
    @sales_amount,
    @quantity,
    @price
)
SET
    order_date    = NULLIF(TRIM(@order_date), ''),
    shipping_date = NULLIF(TRIM(@shipping_date), ''),
    due_date      = NULLIF(TRIM(@due_date), ''),
    sales_amount  = NULLIF(TRIM(@sales_amount), ''),
    quantity      = NULLIF(TRIM(@quantity), ''),
    price         = NULLIF(TRIM(@price), '');


-- =================================================================

-- DataBase Exploration
select * from  gold_dim_customers;
select * from  gold_dim_products;
select * from  gold_fact_sales;

