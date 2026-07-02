SELECT
    order_status,
    COUNT(*) AS TotalOrders
FROM Orders
GROUP BY order_status
ORDER BY TotalOrders DESC;

SELECT
    payment_type,
    COUNT(*) AS TotalPayments
FROM Payments
GROUP BY payment_type
ORDER BY TotalPayments DESC;
SELECT TOP 10
    product_category_name,
    COUNT(*) AS TotalProducts
FROM Products
GROUP BY product_category_name
ORDER BY TotalProducts DESC;