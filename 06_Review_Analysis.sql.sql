/*=====================================================================
PROJECT:
Olist E-Commerce Analytics

FILE:
06_Review_Analysis.sql

AUTHOR:
Gourav Dutta

DESCRIPTION:
This script analyzes customer reviews to evaluate satisfaction,
identify top-performing product categories, seller performance,
and customer feedback trends.

TOOLS:
- Microsoft SQL Server
- SQL Server Management Studio (SSMS)

=====================================================================*/
/*=====================================================================
BUSINESS QUESTION 1

What is the overall average customer review score?

Business Purpose:
Measure overall customer satisfaction.

=====================================================================*/

SELECT
    ROUND(AVG(review_score),2) AS AverageReviewScore
FROM Reviews;

/*
Business Insight

• The overall review score reflects customer satisfaction across all orders.

Key Takeaway

A high average review score indicates a positive customer experience.

Business Recommendation

Continue monitoring customer feedback to maintain service quality.
*/
/*=====================================================================
BUSINESS QUESTION 2

How are review scores distributed?

Business Purpose:
Understand customer sentiment.

=====================================================================*/

SELECT
    review_score,
    COUNT(*) AS TotalReviews
FROM Reviews
GROUP BY review_score
ORDER BY review_score;

/*
Business Insight

• Most customers leave positive ratings.

Key Takeaway

Review distribution provides an overall picture of customer satisfaction.

Business Recommendation

Investigate low ratings to identify recurring issues.
*/
/*=====================================================================
BUSINESS QUESTION 3

What percentage of reviews are positive (4 or 5 stars)?

Business Purpose:
Measure positive customer experience.

=====================================================================*/

SELECT
ROUND(
COUNT(CASE WHEN review_score>=4 THEN 1 END)*100.0
/
COUNT(*),2
) AS PositiveReviewPercentage
FROM Reviews;

/*
Business Insight

Positive reviews dominate customer feedback.

Business Recommendation

Identify factors contributing to positive reviews and replicate them.
*/
/*=====================================================================
BUSINESS QUESTION 4

Which product categories have the highest average review score?

Business Purpose:
Identify categories with the happiest customers.

=====================================================================*/

SELECT TOP 10
    pct.product_category_name_english AS Category,
    ROUND(AVG(r.review_score),2) AS AverageRating
FROM Reviews r
INNER JOIN Orders o
ON r.order_id=o.order_id
INNER JOIN Order_Items oi
ON o.order_id=oi.order_id
INNER JOIN Products p
ON oi.product_id=p.product_id
INNER JOIN ProductCategoryTranslation pct
ON p.product_category_name=pct.product_category_name
GROUP BY pct.product_category_name_english
HAVING COUNT(*)>=30
ORDER BY AverageRating DESC;

/*
Business Insight

These categories consistently receive excellent customer feedback.

Business Recommendation

Promote highly-rated categories to increase customer trust.
*/
/*=====================================================================
BUSINESS QUESTION 5

Which product categories have the lowest average review score?

Business Purpose:
Identify categories requiring quality improvement.

=====================================================================*/

SELECT TOP 10
    pct.product_category_name_english AS Category,
    ROUND(AVG(r.review_score),2) AS AverageRating
FROM Reviews r
INNER JOIN Orders o
ON r.order_id=o.order_id
INNER JOIN Order_Items oi
ON o.order_id=oi.order_id
INNER JOIN Products p
ON oi.product_id=p.product_id
INNER JOIN ProductCategoryTranslation pct
ON p.product_category_name=pct.product_category_name
GROUP BY pct.product_category_name_english
HAVING COUNT(*)>=30
ORDER BY AverageRating;

/*
Business Insight

Some categories consistently receive poor ratings.

Business Recommendation

Review product quality and seller performance for these categories.
*/
/*=====================================================================
BUSINESS QUESTION 6

Which sellers receive the highest average ratings?

Business Purpose:
Identify top-performing sellers.

=====================================================================*/

SELECT TOP 10
    oi.seller_id,
    ROUND(AVG(r.review_score),2) AS AverageRating,
    COUNT(*) AS Reviews
FROM Reviews r
INNER JOIN Orders o
ON r.order_id=o.order_id
INNER JOIN Order_Items oi
ON o.order_id=oi.order_id
GROUP BY oi.seller_id
HAVING COUNT(*)>=20
ORDER BY AverageRating DESC;

/*
Business Insight

Top-rated sellers consistently deliver excellent customer experiences.

Business Recommendation

Use these sellers as benchmarks for service quality.
*/
/*=====================================================================
BUSINESS QUESTION 7

Which sellers receive the lowest average ratings?

Business Purpose:
Identify sellers requiring improvement.

=====================================================================*/

SELECT TOP 10
    oi.seller_id,
    ROUND(AVG(r.review_score),2) AS AverageRating,
    COUNT(*) AS Reviews
FROM Reviews r
INNER JOIN Orders o
ON r.order_id=o.order_id
INNER JOIN Order_Items oi
ON o.order_id=oi.order_id
GROUP BY oi.seller_id
HAVING COUNT(*)>=20
ORDER BY AverageRating;

/*
Business Insight

Poor-performing sellers negatively impact customer satisfaction.

Business Recommendation

Review seller performance and provide corrective actions.
*/
/*=====================================================================
BUSINESS QUESTION 8

Do delivered orders receive better reviews?

Business Purpose:
Compare customer satisfaction by order status.

=====================================================================*/

SELECT
    o.order_status,
    ROUND(AVG(r.review_score),2) AS AverageReview
FROM Orders o
INNER JOIN Reviews r
ON o.order_id=r.order_id
GROUP BY o.order_status
ORDER BY AverageReview DESC;

/*
Business Insight

Delivered orders generally receive higher customer ratings.

Business Recommendation

Improve operational processes to maximize successful deliveries.
*/
/*=====================================================================
BUSINESS QUESTION 9

How many reviews does each score have?

Business Purpose:
Understand customer sentiment.

=====================================================================*/

SELECT
review_score,
COUNT(*) AS Reviews
FROM Reviews
GROUP BY review_score
ORDER BY review_score DESC;

/*
Business Insight

Higher review scores dominate customer feedback.

Business Recommendation

Continue monitoring review trends over time.
*/
/*=====================================================================
BUSINESS QUESTION 10

Which customer states provide the highest average review score?

Business Purpose:
Identify regional differences in customer satisfaction.

=====================================================================*/

SELECT TOP 10
    c.customer_state,
    ROUND(AVG(r.review_score),2) AS AverageReview
FROM Customers c
INNER JOIN Orders o
ON c.customer_id=o.customer_id
INNER JOIN Reviews r
ON o.order_id=r.order_id
GROUP BY c.customer_state
HAVING COUNT(*)>=100
ORDER BY AverageReview DESC;

/*
Business Insight

Customer satisfaction varies across different states.

Business Recommendation

Investigate low-performing regions to improve service quality.
*/
