/*=====================================================================
PROJECT:
Olist E-Commerce Analytics

FILE:
07_Logistics_Analysis.sql

AUTHOR:
Gourav Dutta

DESCRIPTION:
This script analyzes shipping performance, delivery efficiency,
freight costs, and logistics KPIs using Microsoft SQL Server.

TOOLS:
- Microsoft SQL Server
- SQL Server Management Studio (SSMS)

=====================================================================*/
/*=====================================================================
BUSINESS QUESTION 1

What is the average delivery time?

Business Purpose:
Measure the average number of days taken to deliver an order.

=====================================================================*/

SELECT
ROUND(
AVG(
DATEDIFF(DAY,
order_purchase_timestamp,
order_delivered_customer_date)
),2) AS AvgDeliveryDays
FROM Orders
WHERE order_delivered_customer_date IS NOT NULL;

/*
Business Insight

• Average delivery time represents the efficiency of the logistics network.

Key Takeaway

Lower delivery times generally improve customer satisfaction.

Business Recommendation

Continue optimizing delivery routes and warehouse operations.
*/
/*=====================================================================
BUSINESS QUESTION 2

What is the average shipping time?

Business Purpose:
Measure the time between purchase and carrier dispatch.

=====================================================================*/

SELECT
ROUND(
AVG(
DATEDIFF(DAY,
order_purchase_timestamp,
order_delivered_carrier_date)
),2) AS AvgShippingDays
FROM Orders
WHERE order_delivered_carrier_date IS NOT NULL;

/*
Business Insight

Shipping time reflects warehouse processing efficiency.

Business Recommendation

Reduce warehouse processing delays.
*/
/*=====================================================================
BUSINESS QUESTION 3

How many orders were delivered late?

Business Purpose:
Measure on-time delivery performance.

=====================================================================*/

SELECT
COUNT(*) AS LateDeliveries
FROM Orders
WHERE order_delivered_customer_date >
order_estimated_delivery_date;

/*
Business Insight

Late deliveries negatively impact customer satisfaction.

Business Recommendation

Monitor delayed shipments and investigate root causes.
*/
/*=====================================================================
BUSINESS QUESTION 4

What percentage of deliveries were late?

Business Purpose:
Evaluate delivery reliability.

=====================================================================*/

SELECT
ROUND(
COUNT(
CASE
WHEN order_delivered_customer_date >
order_estimated_delivery_date
THEN 1
END
)*100.0/
COUNT(*),2)
AS LateDeliveryPercentage
FROM Orders
WHERE order_delivered_customer_date IS NOT NULL;

/*
Business Insight

Late delivery percentage is an important logistics KPI.

Business Recommendation

Aim to reduce late deliveries through better route planning.
*/
/*=====================================================================
BUSINESS QUESTION 5

Which states receive the highest number of deliveries?

Business Purpose:
Identify major delivery destinations.

=====================================================================*/

SELECT
c.customer_state,
COUNT(*) AS Deliveries
FROM Orders o
INNER JOIN Customers c
ON o.customer_id=c.customer_id
WHERE order_delivered_customer_date IS NOT NULL
GROUP BY customer_state
ORDER BY Deliveries DESC;

/*
Business Insight

High-volume states require stronger logistics infrastructure.

Business Recommendation

Increase warehouse capacity in major delivery regions.
*/
/*=====================================================================
BUSINESS QUESTION 6

Which states have the longest average delivery time?

Business Purpose:
Identify logistics bottlenecks.

=====================================================================*/

SELECT
c.customer_state,
ROUND(
AVG(
DATEDIFF(DAY,
order_purchase_timestamp,
order_delivered_customer_date)
),2) AS AvgDeliveryDays
FROM Orders o
INNER JOIN Customers c
ON o.customer_id=c.customer_id
WHERE order_delivered_customer_date IS NOT NULL
GROUP BY customer_state
ORDER BY AvgDeliveryDays DESC;

/*
Business Insight

Remote states generally experience longer delivery times.

Business Recommendation

Review shipping partners serving slower regions.
*/
/*=====================================================================
BUSINESS QUESTION 7

Which product categories have the highest freight costs?

Business Purpose:
Understand shipping cost drivers.

=====================================================================*/

SELECT TOP 10
pct.product_category_name_english,
ROUND(AVG(oi.freight_value),2) AS AvgFreight
FROM Order_Items oi
INNER JOIN Products p
ON oi.product_id=p.product_id
INNER JOIN ProductCategoryTranslation pct
ON p.product_category_name=pct.product_category_name
GROUP BY pct.product_category_name_english
ORDER BY AvgFreight DESC;

/*
Business Insight

Large or heavy products typically incur higher freight costs.

Business Recommendation

Negotiate shipping contracts for expensive categories.
*/
/*=====================================================================
BUSINESS QUESTION 8

Which sellers handled the most orders?

Business Purpose:
Identify high-volume sellers.

=====================================================================*/

SELECT TOP 10
seller_id,
COUNT(*) AS OrdersHandled
FROM Order_Items
GROUP BY seller_id
ORDER BY OrdersHandled DESC;

/*
Business Insight

A small number of sellers process a large share of total orders.

Business Recommendation

Support top-performing sellers with priority logistics services.
*/
/*=====================================================================
BUSINESS QUESTION 9

What is the average freight cost?

Business Purpose:
Measure shipping expenses.

=====================================================================*/

SELECT
ROUND(
AVG(freight_value),2
) AS AverageFreightCost
FROM Order_Items;

/*
Business Insight

Freight cost directly impacts profitability.

Business Recommendation

Optimize packaging and shipping to reduce logistics costs.
*/
/*=====================================================================
BUSINESS QUESTION 10

What is the average estimated delivery window?

Business Purpose:
Understand customer delivery expectations.

=====================================================================*/

SELECT
ROUND(
AVG(
DATEDIFF(
DAY,
order_purchase_timestamp,
order_estimated_delivery_date)
),2)
AS AvgEstimatedDeliveryDays
FROM Orders;

/*
Business Insight

Estimated delivery dates influence customer expectations.

Business Recommendation

Provide realistic delivery estimates to improve customer satisfaction.
*/
