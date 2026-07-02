/*=====================================================================
PROJECT:
Olist E-Commerce Analytics

FILE:
03_Sales_Analysis.sql

AUTHOR:
Gourav Dutta

DESCRIPTION:
This script analyzes sales performance, order trends, revenue, and
business growth using transactional data.

TOOLS:
- Microsoft SQL Server
- SQL Server Management Studio (SSMS)

=====================================================================*/
/*=====================================================================
BUSINESS QUESTION 1

How many orders were placed?

Business Purpose:
Understand the overall transaction volume of the business.

=====================================================================*/

SELECT
    COUNT(*) AS TotalOrders
FROM Orders;

/*
Business Insight

• The platform processed 99,441 orders.

Key Takeaway

The marketplace has a substantial transaction volume.

Business Recommendation

Use this as the baseline KPI for future growth analysis.
*/
/*=====================================================================
BUSINESS QUESTION 2

What is the monthly order trend?

Business Purpose:
Identify seasonality and business growth.

=====================================================================*/

SELECT
    YEAR(order_purchase_timestamp) AS OrderYear,
    MONTH(order_purchase_timestamp) AS OrderMonth,
    COUNT(*) AS TotalOrders
FROM Orders
GROUP BY
    YEAR(order_purchase_timestamp),
    MONTH(order_purchase_timestamp)
ORDER BY
    OrderYear,
    OrderMonth;

/*
Business Insight

• Monthly order trends highlight periods of increased and decreased demand.

Key Takeaway

Understanding seasonality helps forecast inventory and staffing requirements.

Business Recommendation

Prepare marketing campaigns and inventory for peak order months.
*/
/*=====================================================================
BUSINESS QUESTION 3

What is the total revenue generated?

Business Purpose:
Measure total sales generated through the platform.

=====================================================================*/

SELECT
    SUM(payment_value) AS TotalRevenue
FROM Payments;

/*
Business Insight

• Total revenue represents the cumulative value of all customer payments.

Key Takeaway

Revenue is the primary KPI for evaluating marketplace performance.

Business Recommendation

Monitor revenue trends regularly and identify opportunities for growth.
*/
/*=====================================================================
BUSINESS QUESTION 4

What is the average order value?

Business Purpose:
Measure customer spending per transaction.

=====================================================================*/

SELECT
    AVG(payment_value) AS AverageOrderValue
FROM Payments;

/*
Business Insight

• Average Order Value (AOV) measures the average amount spent per payment.

Key Takeaway

Increasing AOV can significantly improve overall revenue.

Business Recommendation

Introduce product bundles and cross-selling strategies to increase AOV.
*/
/*=====================================================================
BUSINESS QUESTION 5

How many orders fall into each order status?

Business Purpose:
Evaluate order fulfillment performance.

=====================================================================*/

SELECT
    order_status,
    COUNT(*) AS TotalOrders
FROM Orders
GROUP BY order_status
ORDER BY TotalOrders DESC;

/*
Business Insight

• Nearly 97% of orders were successfully delivered.

Key Takeaway

The fulfillment process is highly efficient.

Business Recommendation

Investigate cancelled and unavailable orders to reduce operational losses.
*/
/*=====================================================================
BUSINESS QUESTION 6

Which states generated the highest number of orders?

Business Purpose:
Identify high-demand geographic markets.

=====================================================================*/

SELECT
    c.customer_state,
    COUNT(o.order_id) AS TotalOrders
FROM Customers c
INNER JOIN Orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_state
ORDER BY TotalOrders DESC;

/*
Business Insight

• Customer demand is concentrated in a few major states.

Key Takeaway

Regional demand is uneven across Brazil.

Business Recommendation

Prioritize logistics and marketing investment in high-performing states.
*/
/*=====================================================================
BUSINESS QUESTION 7

Which cities generated the highest number of orders?

Business Purpose:
Identify the strongest urban markets.

=====================================================================*/

SELECT TOP 10
    c.customer_city,
    COUNT(o.order_id) AS TotalOrders
FROM Customers c
INNER JOIN Orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_city
ORDER BY TotalOrders DESC;

/*
Business Insight

• Major metropolitan cities contribute the highest order volumes.

Key Takeaway

Urban markets drive platform growth.

Business Recommendation

Develop city-specific promotional campaigns.
*/
/*=====================================================================
BUSINESS QUESTION 8

How many orders were placed each day of the week?

Business Purpose:
Understand customer purchasing behavior throughout the week.

=====================================================================*/

SELECT
    DATENAME(WEEKDAY, order_purchase_timestamp) AS Weekday,
    COUNT(*) AS TotalOrders
FROM Orders
GROUP BY DATENAME(WEEKDAY, order_purchase_timestamp)
ORDER BY TotalOrders DESC;

/*
Business Insight

• Certain weekdays experience higher purchasing activity.

Key Takeaway

Order volume varies across the week.

Business Recommendation

Schedule promotions on lower-performing days to improve sales consistency.
*/
/*=====================================================================
BUSINESS QUESTION 9

What percentage of orders were cancelled?

Business Purpose:
Measure revenue risk due to order cancellations.

=====================================================================*/

SELECT
    ROUND(
        COUNT(CASE WHEN order_status = 'canceled' THEN 1 END) * 100.0
        / COUNT(*),2) AS CancellationRate
FROM Orders;

/*
Business Insight

• Cancellation rate is relatively low.

Key Takeaway

The marketplace maintains strong operational performance.

Business Recommendation

Analyze cancellation reasons to further reduce lost revenue.
*/
/*=====================================================================
BUSINESS QUESTION 10

What percentage of orders were successfully delivered?

Business Purpose:
Measure fulfillment efficiency.

=====================================================================*/

SELECT
    ROUND(
        COUNT(CASE WHEN order_status='delivered' THEN 1 END) *100.0
        /COUNT(*),2) AS DeliveryRate
FROM Orders;

/*
Business Insight

• Approximately 97% of all orders were successfully delivered.

Key Takeaway

Customers generally receive their orders successfully.

Business Recommendation

Continue monitoring delivery performance and improve the remaining unsuccessful deliveries.
*/
