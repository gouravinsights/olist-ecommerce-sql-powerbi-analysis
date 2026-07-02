/*=====================================================================
PROJECT:
Olist E-Commerce Analytics

FILE:
04_Product_Analysis.sql

AUTHOR:
Gourav Dutta

DESCRIPTION:
This script analyzes product performance, category distribution,
pricing, freight costs, and product sales using SQL Server.

TOOLS:
- Microsoft SQL Server
- SQL Server Management Studio (SSMS)

=====================================================================*/
/*=====================================================================
BUSINESS QUESTION 1

How many products are available in the marketplace?

Business Purpose:
Understand the size of the product catalog.

=====================================================================*/

SELECT COUNT(*) AS TotalProducts
FROM Products;

/*
Business Insight

• The marketplace contains 32,951 unique products.

Key Takeaway

A large product catalog provides customers with a wide variety of choices.

Business Recommendation

Continuously monitor product assortment and remove inactive products.
*/
/*=====================================================================
BUSINESS QUESTION 2

Which product categories contain the highest number of products?

Business Purpose:
Identify categories with the largest inventory.

=====================================================================*/

SELECT
    pct.product_category_name_english AS Category,
    COUNT(*) AS TotalProducts
FROM Products p
INNER JOIN ProductCategoryTranslation pct
ON p.product_category_name = pct.product_category_name
GROUP BY pct.product_category_name_english
ORDER BY TotalProducts DESC;

/*
Business Insight

• Bed Bath Table, Sports Leisure and Furniture Decor contain the largest product assortment.

Key Takeaway

Home and lifestyle categories dominate the marketplace.

Business Recommendation

Maintain strong inventory levels for high-volume categories.
*/
/*=====================================================================
BUSINESS QUESTION 3

Which product categories generated the highest number of sales?

Business Purpose:
Identify the most popular product categories.

=====================================================================*/

SELECT TOP 10
    pct.product_category_name_english AS Category,
    COUNT(oi.order_id) AS TotalSales
FROM Order_Items oi
INNER JOIN Products p
ON oi.product_id = p.product_id
INNER JOIN ProductCategoryTranslation pct
ON p.product_category_name = pct.product_category_name
GROUP BY pct.product_category_name_english
ORDER BY TotalSales DESC;

/*
Business Insight

• Categories with the highest sales indicate the strongest customer demand.

Key Takeaway

Large catalog size does not always translate into higher sales.

Business Recommendation

Focus marketing efforts on categories with consistently high demand.
*/
/*=====================================================================
BUSINESS QUESTION 4

Which product categories generated the highest revenue?

Business Purpose:
Identify the most profitable categories.

=====================================================================*/

SELECT TOP 10
    pct.product_category_name_english AS Category,
    ROUND(SUM(oi.price),2) AS Revenue
FROM Order_Items oi
INNER JOIN Products p
ON oi.product_id = p.product_id
INNER JOIN ProductCategoryTranslation pct
ON p.product_category_name = pct.product_category_name
GROUP BY pct.product_category_name_english
ORDER BY Revenue DESC;

/*
Business Insight

• Revenue leaders may differ from the categories with the highest sales volume.

Key Takeaway

High-priced categories can outperform high-volume categories.

Business Recommendation

Focus promotional strategies on high-revenue categories.
*/
/*=====================================================================
BUSINESS QUESTION 5

Which products have the highest average selling price?

Business Purpose:
Identify premium-priced products.

=====================================================================*/

SELECT TOP 10
    product_id,
    ROUND(AVG(price),2) AS AveragePrice
FROM Order_Items
GROUP BY product_id
ORDER BY AveragePrice DESC;

/*
Business Insight

• Premium-priced products generate higher revenue per transaction.

Key Takeaway

Luxury products represent an opportunity for premium customer segments.

Business Recommendation

Develop targeted campaigns for premium buyers.
*/
/*=====================================================================
BUSINESS QUESTION 6

What is the average selling price across all products?

Business Purpose:
Understand average product pricing.

=====================================================================*/

SELECT
    ROUND(AVG(price),2) AS AverageProductPrice
FROM Order_Items;

/*
Business Insight

• Average selling price provides a benchmark for pricing strategies.

Business Recommendation

Track pricing trends regularly to remain competitive.
*/
/*=====================================================================
BUSINESS QUESTION 7

Which product categories have the highest average selling price?

Business Purpose:
Identify premium product categories.

=====================================================================*/

SELECT
    pct.product_category_name_english AS Category,
    ROUND(AVG(oi.price),2) AS AveragePrice
FROM Order_Items oi
INNER JOIN Products p
ON oi.product_id = p.product_id
INNER JOIN ProductCategoryTranslation pct
ON p.product_category_name = pct.product_category_name
GROUP BY pct.product_category_name_english
ORDER BY AveragePrice DESC;

/*
Business Insight

• Premium product categories command higher average selling prices.

Business Recommendation

Promote high-margin categories to improve profitability.
*/
/*=====================================================================
BUSINESS QUESTION 8

Which product categories incur the highest freight costs?

Business Purpose:
Evaluate shipping expenses.

=====================================================================*/

SELECT
    pct.product_category_name_english AS Category,
    ROUND(AVG(oi.freight_value),2) AS AverageFreight
FROM Order_Items oi
INNER JOIN Products p
ON oi.product_id = p.product_id
INNER JOIN ProductCategoryTranslation pct
ON p.product_category_name = pct.product_category_name
GROUP BY pct.product_category_name_english
ORDER BY AverageFreight DESC;

/*
Business Insight

• Certain categories have significantly higher shipping costs.

Business Recommendation

Review logistics partnerships for expensive-to-ship products.
*/
/*=====================================================================
BUSINESS QUESTION 9

Which products generated the highest revenue?

Business Purpose:
Identify best-performing products.

=====================================================================*/

SELECT TOP 10
    product_id,
    ROUND(SUM(price),2) AS Revenue
FROM Order_Items
GROUP BY product_id
ORDER BY Revenue DESC;

/*
Business Insight

• A small number of products contribute disproportionately to revenue.

Business Recommendation

Maintain inventory for top-performing products.
*/
/*=====================================================================
BUSINESS QUESTION 10

Which products sold the highest number of units?

Business Purpose:
Identify the most frequently purchased products.

=====================================================================*/

SELECT TOP 10
    product_id,
    COUNT(*) AS UnitsSold
FROM Order_Items
GROUP BY product_id
ORDER BY UnitsSold DESC;

/*
Business Insight

• Frequently purchased products represent customer favorites.

Key Takeaway

High sales volume is not always associated with high revenue.

Business Recommendation

Use top-selling products for promotional campaigns and cross-selling opportunities.
*/
