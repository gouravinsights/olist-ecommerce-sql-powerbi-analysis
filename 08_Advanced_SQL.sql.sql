/*=====================================================================
PROJECT:
Olist E-Commerce Analytics

FILE:
08_Advanced_SQL.sql

AUTHOR:
Gourav Dutta

DESCRIPTION:
This script demonstrates advanced SQL techniques including CTEs,
Window Functions, Ranking Functions, Customer Analytics,
Revenue Analysis, and Business Intelligence reporting.

TOOLS:
- Microsoft SQL Server
- SQL Server Management Studio (SSMS)

=====================================================================*/
/*=====================================================================
BUSINESS QUESTION 1

Who are the Top 10 customers by total spending?

Business Purpose:
Identify high-value customers for loyalty programs.

=====================================================================*/

WITH CustomerRevenue AS
(
SELECT
o.customer_id,
SUM(p.payment_value) AS TotalSpent
FROM Orders o
JOIN Payments p
ON o.order_id=p.order_id
GROUP BY o.customer_id
)

SELECT TOP 10 *
FROM CustomerRevenue
ORDER BY TotalSpent DESC;

/*
Business Insight

Top customers contribute significantly more revenue.

Business Recommendation

Reward high-value customers through loyalty programs.
*/
/*=====================================================================
BUSINESS QUESTION 2

Rank sellers by total revenue.

=====================================================================*/

SELECT
seller_id,
SUM(price) AS Revenue,
RANK() OVER(ORDER BY SUM(price) DESC) AS SellerRank
FROM Order_Items
GROUP BY seller_id;

/*
Business Insight

Ranking sellers helps identify top business partners.

Business Recommendation

Support top-performing sellers with promotional opportunities.
*/
/*=====================================================================
BUSINESS QUESTION 3

Rank product categories by revenue.

=====================================================================*/

SELECT
pct.product_category_name_english,
SUM(oi.price) AS Revenue,

DENSE_RANK() OVER
(
ORDER BY SUM(oi.price) DESC
)
AS CategoryRank

FROM Order_Items oi

JOIN Products p
ON oi.product_id=p.product_id

JOIN ProductCategoryTranslation pct
ON p.product_category_name=pct.product_category_name

GROUP BY pct.product_category_name_english;

/*
Business Insight

Category rankings identify the strongest-performing business segments.
*/
/*=====================================================================
BUSINESS QUESTION 4

Calculate cumulative monthly revenue.

=====================================================================*/

WITH MonthlyRevenue AS
(
SELECT

YEAR(o.order_purchase_timestamp) AS SalesYear,

MONTH(o.order_purchase_timestamp) AS SalesMonth,

SUM(p.payment_value) AS Revenue

FROM Orders o

JOIN Payments p
ON o.order_id=p.order_id

GROUP BY

YEAR(o.order_purchase_timestamp),
MONTH(o.order_purchase_timestamp)
)

SELECT

SalesYear,
SalesMonth,
Revenue,

SUM(Revenue)
OVER
(
ORDER BY SalesYear,SalesMonth
) AS RunningRevenue

FROM MonthlyRevenue;

/*
Business Insight

Running revenue illustrates business growth over time.
*/
/*=====================================================================
BUSINESS QUESTION 5

Compare monthly revenue with the previous month.

=====================================================================*/

WITH MonthlyRevenue AS
(
SELECT

YEAR(o.order_purchase_timestamp) AS SalesYear,

MONTH(o.order_purchase_timestamp) AS SalesMonth,

SUM(p.payment_value) Revenue

FROM Orders o

JOIN Payments p
ON o.order_id=p.order_id

GROUP BY

YEAR(o.order_purchase_timestamp),
MONTH(o.order_purchase_timestamp)
)

SELECT

SalesYear,

SalesMonth,

Revenue,

LAG(Revenue)
OVER
(
ORDER BY SalesYear,SalesMonth
)
AS PreviousMonthRevenue

FROM MonthlyRevenue;

/*
Business Insight

Month-over-month comparison highlights revenue trends.
*/
/*=====================================================================
BUSINESS QUESTION 6

Find the highest-priced product in each category.

=====================================================================*/

WITH RankedProducts AS
(
SELECT

pct.product_category_name_english,

oi.product_id,

oi.price,

ROW_NUMBER()
OVER
(
PARTITION BY pct.product_category_name_english

ORDER BY oi.price DESC
)
AS RowNum

FROM Order_Items oi

JOIN Products p
ON oi.product_id=p.product_id

JOIN ProductCategoryTranslation pct
ON p.product_category_name=pct.product_category_name
)

SELECT *

FROM RankedProducts

WHERE RowNum=1;

/*
Business Insight

Premium products vary significantly across categories.
*/
/*=====================================================================
BUSINESS QUESTION 7

Segment customers based on total spending.

=====================================================================*/

WITH CustomerSpend AS
(
SELECT

o.customer_id,

SUM(payment_value) Spending

FROM Orders o

JOIN Payments p

ON o.order_id=p.order_id

GROUP BY customer_id
)

SELECT

customer_id,

Spending,

CASE

WHEN Spending>=1000 THEN 'High Value'

WHEN Spending>=500 THEN 'Medium Value'

ELSE 'Low Value'

END AS CustomerSegment

FROM CustomerSpend;

/*
Business Insight

Customer segmentation supports targeted marketing campaigns.

Business Recommendation

Create different retention strategies for each customer segment.
*/
/*=====================================================================
BUSINESS QUESTION 8

Find the Top 3 sellers by revenue.

=====================================================================*/

SELECT TOP 3

seller_id,

SUM(price) Revenue

FROM Order_Items

GROUP BY seller_id

ORDER BY Revenue DESC;

/*
Business Insight

A small number of sellers generate a significant portion of sales.
*/
/*=====================================================================
BUSINESS QUESTION 9

Divide customers into four spending groups.

=====================================================================*/

WITH CustomerRevenue AS
(
SELECT

o.customer_id,

SUM(payment_value) Revenue

FROM Orders o

JOIN Payments p

ON o.order_id=p.order_id

GROUP BY customer_id
)

SELECT

customer_id,

Revenue,

NTILE(4)
OVER
(
ORDER BY Revenue DESC
)
AS RevenueQuartile

FROM CustomerRevenue;

/*
Business Insight

Quartile analysis identifies top-spending customer groups.
*/
/*=====================================================================
BUSINESS QUESTION 10

Find the Top 5 products by revenue within each category.

=====================================================================*/

WITH ProductRevenue AS
(
SELECT

pct.product_category_name_english,

oi.product_id,

SUM(oi.price) Revenue,

ROW_NUMBER()
OVER
(
PARTITION BY pct.product_category_name_english

ORDER BY SUM(oi.price) DESC
)
AS ProductRank

FROM Order_Items oi

JOIN Products p
ON oi.product_id=p.product_id

JOIN ProductCategoryTranslation pct
ON p.product_category_name=pct.product_category_name

GROUP BY

pct.product_category_name_english,

oi.product_id
)

SELECT *

FROM ProductRevenue

WHERE ProductRank<=5;

/*
Business Insight

Top-performing products differ across categories.

Business Recommendation

Feature these products in marketing campaigns and maintain inventory availability.
*/
