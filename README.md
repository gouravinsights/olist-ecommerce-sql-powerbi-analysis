# 📊 Olist E-Commerce Sales Analysis | SQL Server & Power BI

## 📌 Project Overview

This project is an end-to-end Business Intelligence solution built using the **Brazilian E-Commerce Public Dataset by Olist**. The objective was to transform raw transactional data into meaningful business insights by designing a relational database in SQL Server, performing business-focused SQL analysis, and developing interactive Power BI dashboards.

The project follows the complete analytics workflow from raw CSV files to business reporting.

**Workflow:**

Raw CSV Files → SQL Server Database → SQL Analysis → Power BI Dashboard → Business Insights

---

# 🎯 Project Objectives

* Import raw CSV files into SQL Server.
* Design a relational database.
* Create Primary Keys and Foreign Keys.
* Validate and clean data.
* Perform business analysis using SQL.
* Build interactive Power BI dashboards.
* Generate actionable business insights.

---

# 🛠️ Tools & Technologies

* Microsoft SQL Server
* SQL Server Management Studio (SSMS)
* Power BI Desktop
* DAX
* GitHub

---

# 📂 Dataset

**Dataset:** Brazilian E-Commerce Public Dataset by Olist

The dataset contains information about:

* Customers
* Orders
* Order Items
* Products
* Sellers
* Payments
* Reviews
* Product Category Translation
* Geolocation

**Dataset Source:**
https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce

---

# 🗄️ Database Design

A relational database was created in SQL Server by importing nine CSV datasets.

### Database Tables

* Customers
* Orders
* Order_Items
* Products
* Sellers
* Payments
* Reviews
* ProductCategoryTranslation
* Geolocation

### Database Tasks Performed

✔ Imported raw CSV files

✔ Renamed imported tables

✔ Created Primary Keys

✔ Created Foreign Keys

✔ Established relationships between tables

✔ Validated data integrity

✔ Created Entity Relationship Diagram (ERD)

---

# 💻 SQL Implementation

This project contains **80+ SQL queries** solving real-world business problems.

## SQL Concepts Used

### Database Design

* CREATE DATABASE
* CREATE TABLE
* ALTER TABLE
* Primary Keys
* Foreign Keys

### Data Exploration

* COUNT()
* DISTINCT
* NULL checks
* Duplicate checks
* Data validation

### SQL Joins

* INNER JOIN
* LEFT JOIN
* Multiple table joins

### Aggregations

* SUM()
* AVG()
* COUNT()
* MIN()
* MAX()

### Filtering

* WHERE
* GROUP BY
* HAVING
* ORDER BY

### Date Functions

* YEAR()
* MONTH()
* DATEDIFF()

### Conditional Logic

* CASE Statements

### Advanced SQL

* Common Table Expressions (CTEs)
* Window Functions
* ROW_NUMBER()
* RANK()
* DENSE_RANK()
* PARTITION BY
* Subqueries

---

# 📜 SQL Analysis

## 01_Database_Setup.sql

* Database Creation
* CSV Import
* Table Renaming
* Primary Keys
* Foreign Keys
* Relationship Validation

---

## 02_Exploratory_Data_Analysis.sql

Business Questions Answered

* How many customers are there?
* How many orders were placed?
* How many sellers exist?
* How many products are available?
* What is the overall revenue?
* Data quality validation

---

## 03_Sales_Analysis.sql

Business Questions Answered

* Monthly Revenue Trend
* Average Order Value
* Revenue by Year
* Order Status Distribution
* Top Revenue Months

---

## 04_Product_Analysis.sql

Business Questions Answered

* Best Selling Categories
* Highest Revenue Categories
* Product Performance
* Freight Cost Analysis
* Category Revenue

---

## 05_Payment_Analysis.sql

Business Questions Answered

* Payment Method Distribution
* Revenue by Payment Type
* Installment Analysis
* Payment Value Analysis

---

## 06_Review_Analysis.sql

Business Questions Answered

* Review Score Distribution
* Average Review Score
* Customer Satisfaction
* Rating Analysis

---

## 07_Logistics_Analysis.sql

Business Questions Answered

* Average Delivery Time
* Shipping Performance
* Delivery Delays
* Logistics KPIs

---

## 08_Advanced_SQL.sql

Advanced SQL Concepts Demonstrated

* Common Table Expressions (CTEs)
* Window Functions
* Ranking Functions
* Business Ranking Queries
* Aggregate Analysis

---

# 📊 Power BI Dashboard

The dashboard was built by connecting Power BI directly to SQL Server.

## Executive Dashboard

### KPIs

* Total Revenue
* Total Orders
* Total Customers
* Average Order Value
* Average Review Score
* Delivered Orders

### Visualizations

* Revenue Trend
* Revenue by Payment Method
* Order Status Distribution
* Top Product Categories
* Top Sellers
* Customer Satisfaction Gauge

---

## Sales & Customer Insights Dashboard

### KPIs

* Revenue
* Orders
* Average Review Score
* Average Delivery Time

### Visualizations

* Monthly Revenue Trend
* Revenue by State
* Top Customers
* Customer Rating Distribution
* Revenue by Payment Method
* Delivery Performance

---

# 💡 Key Business Insights

* Identified the highest revenue-generating product categories.
* Analyzed customer purchasing behaviour.
* Evaluated payment preferences.
* Measured delivery performance.
* Identified top-performing sellers.
* Tracked monthly sales trends.
* Analyzed customer satisfaction using review scores.

---

# 📷 Project Screenshots

## Executive Dashboard

![Executive Dashboard](Executive_Dashboard.png)

---

## Sales & Customer Insights Dashboard

![Sales Dashboard](Sales_Customer_Dashboard.png)

---

## Entity Relationship Diagram

![ER Diagram](ER_Diagram.png)

---

# 📁 Repository Contents

* SQL Server Database Scripts
* SQL Business Analysis Scripts
* Power BI Dashboard
* Dashboard Screenshots
* Entity Relationship Diagram
* README Documentation

---

# 🚀 Skills Demonstrated

### SQL

* Database Design
* Data Import
* Data Validation
* Primary Keys
* Foreign Keys
* Joins
* Aggregate Functions
* GROUP BY
* HAVING
* CASE Statements
* CTEs
* Window Functions
* Ranking Functions
* Business Analytics

### Power BI

* Data Modeling
* DAX Measures
* KPI Cards
* Interactive Dashboards
* Data Visualization
* Slicers
* Business Reporting

### Business Intelligence

* Sales Analytics
* Customer Analytics
* Product Analytics
* Payment Analytics
* Logistics Analytics
* Review Analytics
* Executive Dashboarding

---

# 📈 Project Outcome

This project demonstrates the complete Business Intelligence workflow:

**Raw CSV Files → SQL Server Database → SQL Analysis → Power BI Dashboard → Business Insights**

The project showcases practical SQL, database design, data modeling, DAX, and dashboard development skills commonly required for Data Analyst and Business Intelligence roles.

---

## 👨‍💻 Author

**Gourav Dutta**

If you found this project useful or have any feedback, feel free to connect with me on LinkedIn or explore the repository.
