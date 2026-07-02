/*=====================================================================
PROJECT NAME:
Olist E-Commerce Analytics using Microsoft SQL Server

AUTHOR:
Gourav Dutta

PROJECT DESCRIPTION:
This project analyzes the Brazilian Olist E-Commerce dataset by designing
a relational database, validating data quality, and answering business
questions using SQL.

OBJECTIVES:
• Understand customer purchasing behavior
• Analyze order fulfillment
• Study payment preferences
• Explore product distribution
• Build a foundation for Power BI reporting

DATASET:
Brazilian E-Commerce Public Dataset by Olist (Kaggle)

DATABASE:
Microsoft SQL Server

=====================================================================*/
/*=====================================================================
BUSINESS QUESTION 1

How many records exist in each table?

Business Purpose:
Before performing any analysis, it is important to understand the size
of the database and validate that all datasets were imported successfully.

=====================================================================*/
SELECT COUNT(*) AS TotalCustomers
FROM Customers;

SELECT COUNT(*) AS TotalOrders
FROM Orders;

SELECT COUNT(*) AS TotalOrderItems
FROM Order_Items;

SELECT COUNT(*) AS TotalPayments
FROM Payments;

SELECT COUNT(*) AS TotalProducts
FROM Products;

SELECT COUNT(*) AS TotalSellers
FROM Sellers;

SELECT COUNT(*) AS TotalReviews
FROM Reviews;

SELECT COUNT(*) AS TotalGeolocations
FROM Geolocation;

SELECT COUNT(*) AS TotalProductCategories
FROM ProductCategoryTranslation;
/*
Business Insight

• Database successfully imported.
• Total of 9 relational tables.
• Referential integrity validated.
• Database ready for business analysis.
*//*=====================================================================
BUSINESS QUESTION 2

What is the distribution of order statuses?

Business Purpose:
Understanding order status helps evaluate operational performance and
customer fulfillment efficiency.

=====================================================================*/
SELECT
    order_status,
    COUNT(*) AS TotalOrders
FROM Orders
GROUP BY order_status
ORDER BY TotalOrders DESC;
/*
Business Insight

• Approximately 97% of orders were successfully delivered.
• Only a small percentage were cancelled or unavailable.
• Indicates a highly efficient order fulfillment process.
*/
/*=====================================================================
BUSINESS QUESTION 3

Which payment methods are preferred by customers?

Business Purpose:
Understanding payment preferences helps businesses optimize payment
gateways and improve customer experience.

=====================================================================*/
SELECT
    payment_type,
    COUNT(*) AS TotalPayments
FROM Payments
GROUP BY payment_type
ORDER BY TotalPayments DESC;
/*
Business Insight

• Credit Card is the dominant payment method.
• Boleto is the second most popular payment option.
• Debit Card usage is comparatively low.
*/
/*=====================================================================
BUSINESS QUESTION 4

Which product categories have the largest product catalog?

Business Purpose:
Identify categories with the highest inventory available for sale.

=====================================================================*/
SELECT TOP 10
    pct.product_category_name_english AS Category,
    COUNT(*) AS TotalProducts
FROM Products p
INNER JOIN ProductCategoryTranslation pct
ON p.product_category_name = pct.product_category_name
GROUP BY pct.product_category_name_english
ORDER BY TotalProducts DESC;
/*
Business Insight

• Bed, Bath & Table is the largest product category.
• Sports & Leisure and Furniture & Decor also contribute significantly.
• Home and lifestyle categories dominate the marketplace.
*/
/*=====================================================================
BUSINESS QUESTION 5

Which states have the highest number of customers?

Business Purpose:
Identify geographical markets with the largest customer base.

=====================================================================*/
SELECT
    customer_state,
    COUNT(*) AS TotalCustomers
FROM Customers
GROUP BY customer_state
ORDER BY TotalCustomers DESC;
/*
Business Insight

• São Paulo (SP) has the largest customer base.
• Rio de Janeiro (RJ) and Minas Gerais (MG) are also major markets.
• Marketing efforts should focus on high-density customer regions.
*/
/*=====================================================================
BUSINESS QUESTION 6

Which cities have the highest number of customers?

Business Purpose:
Identify cities with the highest customer concentration.

=====================================================================*/
SELECT TOP 10
    customer_city,
    COUNT(*) AS TotalCustomers
FROM Customers
GROUP BY customer_city
ORDER BY TotalCustomers DESC;
/*
Business Insight

• São Paulo city contributes the highest number of customers.
• Large metropolitan cities dominate customer acquisition.
*/
/*=====================================================================
BUSINESS QUESTION 7

What is the average customer review score?

Business Purpose:
Measure overall customer satisfaction.

=====================================================================*/
SELECT
    AVG(review_score) AS AverageReviewScore
FROM Reviews;
/*
Business Insight

• Average customer review score indicates generally positive satisfaction.
• Customer reviews can be further analyzed by seller and product category.
*/