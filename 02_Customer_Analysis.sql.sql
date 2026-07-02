/*=====================================================================
PROJECT:
Olist E-Commerce Analytics

FILE:
02_Customer_Analysis.sql

DESCRIPTION:
This script analyzes customer distribution, geographic concentration,
and customer purchasing behavior.

=====================================================================*/
/*=====================================================================
BUSINESS QUESTION 1

How many unique customers have placed orders?

Business Purpose:
Determine the active customer base.

=====================================================================*/
SELECT
COUNT(DISTINCT customer_id) AS UniqueCustomers
FROM Orders;
/*
Business Insight

• Nearly every registered customer placed at least one order.
• Indicates a healthy customer acquisition process.
*/
/*=====================================================================
BUSINESS QUESTION 2

Which states have the highest customer concentration?

Business Purpose:
Identify major customer markets for targeted marketing.

=====================================================================*/
SELECT
customer_state,
COUNT(*) AS TotalCustomers
FROM Customers
GROUP BY customer_state
ORDER BY TotalCustomers DESC;
/*
Business Insight

• São Paulo represents the largest customer base.
• Marketing investments should prioritize high-volume states.
*/
/*=====================================================================
BUSINESS QUESTION 3

Which cities have the largest customer base?

Business Purpose:
Understand urban customer concentration.

=====================================================================*/
SELECT TOP 10
customer_city,
COUNT(*) AS Customers
FROM Customers
GROUP BY customer_city
ORDER BY Customers DESC;
/*
Business Insight

• São Paulo city has the largest customer base.
• Metropolitan cities dominate online purchasing.
*/
/*=====================================================================
BUSINESS QUESTION 4

Top 10 ZIP code regions by customers.

Business Purpose:
Identify geographic hotspots.

=====================================================================*/
SELECT TOP 10
customer_zip_code_prefix,
COUNT(*) AS Customers
FROM Customers
GROUP BY customer_zip_code_prefix
ORDER BY Customers DESC;
/*
Business Insight

• Certain ZIP code regions contribute significantly more customers.
• Useful for logistics planning and regional marketing.
*/
/*=====================================================================
BUSINESS QUESTION 5

Which customer states generated the most orders?

Business Purpose:
Compare customer distribution with purchasing activity.

=====================================================================*/
SELECT
c.customer_state,
COUNT(o.order_id) AS OrdersPlaced
FROM Customers c
INNER JOIN Orders o
ON c.customer_id=o.customer_id
GROUP BY c.customer_state
ORDER BY OrdersPlaced DESC;
/*
Business Insight

• States with the highest customer count also generate the highest order volume.
• Regional demand is concentrated in southeastern Brazil.
*/
/*=====================================================================
BUSINESS QUESTION 6

Average orders per customer.

Business Purpose:
Measure customer purchasing frequency.

=====================================================================*/
SELECT
CAST(COUNT(order_id) AS FLOAT)
/COUNT(DISTINCT customer_id)
AS AvgOrdersPerCustomer
FROM Orders;
/*
Business Insight

• Average orders per customer provide a baseline for customer retention analysis.
*/
/*=====================================================================
BUSINESS QUESTION 7

Customers without orders.

Business Purpose:
Identify inactive customers.

=====================================================================*/
SELECT
COUNT(*) AS CustomersWithoutOrders
FROM Customers c
LEFT JOIN Orders o
ON c.customer_id=o.customer_id
WHERE o.order_id IS NULL;
/*
Business Insight

• Helps identify customers who registered but never completed a purchase.
*/
