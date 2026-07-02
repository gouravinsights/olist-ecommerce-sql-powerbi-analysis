/*=====================================================================
PROJECT:
Olist E-Commerce Analytics

FILE:
05_Payment_Analysis.sql

AUTHOR:
Gourav Dutta

DESCRIPTION:
This script analyzes customer payment behavior, payment methods,
installment trends, and revenue contribution.

TOOLS:
- Microsoft SQL Server
- SQL Server Management Studio (SSMS)

=====================================================================*/
/*=====================================================================
BUSINESS QUESTION 1

Which payment methods are most frequently used?

Business Purpose:
Identify customer payment preferences.

=====================================================================*/

SELECT
    payment_type,
    COUNT(*) AS TotalPayments
FROM Payments
GROUP BY payment_type
ORDER BY TotalPayments DESC;

/*
Business Insight

• Credit Cards dominate customer transactions.
• Boleto remains the second most preferred payment method.

Key Takeaway

The business is highly dependent on digital card payments.

Business Recommendation

Ensure payment gateway reliability and optimize card transaction costs.
*/
/*=====================================================================
BUSINESS QUESTION 2

Which payment methods generate the highest revenue?

Business Purpose:
Understand revenue contribution by payment type.

=====================================================================*/

SELECT
    payment_type,
    ROUND(SUM(payment_value),2) AS Revenue
FROM Payments
GROUP BY payment_type
ORDER BY Revenue DESC;

/*
Business Insight

Revenue contribution varies significantly across payment methods.

Business Recommendation

Promote payment options with higher transaction values.
*/
/*=====================================================================
BUSINESS QUESTION 3

What is the average payment value?

Business Purpose:
Measure average customer spending per payment transaction.

=====================================================================*/

SELECT
ROUND(AVG(payment_value),2) AS AveragePayment
FROM Payments;

/*
Business Insight

Average payment value establishes a benchmark for transaction size.

Business Recommendation

Increase Average Order Value through cross-selling and bundled offers.
*/
/*=====================================================================
BUSINESS QUESTION 4

What is the highest payment received?

Business Purpose:
Identify high-value customer transactions.

=====================================================================*/

SELECT
MAX(payment_value) AS HighestPayment
FROM Payments;

/*
Business Insight

The platform processes both small and very high-value transactions.

Business Recommendation

High-value customers may benefit from premium loyalty programs.
*/
/*=====================================================================
BUSINESS QUESTION 5

What is the lowest payment received?

Business Purpose:
Identify minimum transaction values.

=====================================================================*/

SELECT
MIN(payment_value) AS LowestPayment
FROM Payments;

/*
Business Insight

Very low-value purchases may indicate promotional or discounted orders.

Business Recommendation

Evaluate the profitability of low-value transactions.
*/
/*=====================================================================
BUSINESS QUESTION 6

What is the average number of payment installments?

Business Purpose:
Understand customer financing preferences.

=====================================================================*/

SELECT
ROUND(AVG(payment_installments),2) AS AvgInstallments
FROM Payments;

/*
Business Insight

Customers frequently utilize installment payments.

Business Recommendation

Continue offering flexible installment options.
*/
/*=====================================================================
BUSINESS QUESTION 7

How are payment installments distributed?

Business Purpose:
Analyze installment usage.

=====================================================================*/

SELECT
payment_installments,
COUNT(*) AS Transactions
FROM Payments
GROUP BY payment_installments
ORDER BY payment_installments;

/*
Business Insight

Most customers prefer fewer installments.

BusinessRecommendation

Review installment plans with low adoption.
*/
/*=====================================================================
BUSINESS QUESTION 8

Which orders required multiple payments?

Business Purpose:
Identify split-payment behavior.

=====================================================================*/

SELECT TOP 20
order_id,
COUNT(*) AS NumberOfPayments
FROM Payments
GROUP BY order_id
HAVING COUNT(*)>1
ORDER BY NumberOfPayments DESC;

/*
Business Insight

Some customers split payments across multiple payment records.

Business Recommendation

Investigate whether split payments improve conversion rates.
*/
/*=====================================================================
BUSINESS QUESTION 9

What is the average payment value by payment method?

Business Purpose:
Compare customer spending across payment methods.

=====================================================================*/

SELECT
payment_type,
ROUND(AVG(payment_value),2) AS AvgPayment
FROM Payments
GROUP BY payment_type
ORDER BY AvgPayment DESC;

/*
Business Insight

Different payment methods show different average spending behavior.

Business Recommendation

Target premium payment methods for luxury products.
*/
/*=====================================================================
BUSINESS QUESTION 10

What percentage of total revenue comes from each payment method?

Business Purpose:
Measure dependency on payment channels.

=====================================================================*/

SELECT
payment_type,
ROUND(
SUM(payment_value)*100.0/
(SELECT SUM(payment_value) FROM Payments),2
) AS RevenueSharePercentage
FROM Payments
GROUP BY payment_type
ORDER BY RevenueSharePercentage DESC;

/*
Business Insight

Revenue concentration highlights the business's dependence on specific payment methods.

Business Recommendation

Diversify payment options while ensuring high availability for dominant payment channels.
*/
