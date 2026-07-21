-- Combining the order years

;WITH all_orders AS
(
    SELECT
        OrderID,
        CustomerID,
        ProductID,
        OrderDate,
        Quantity,
        Revenue,
        COGS
    FROM Orders_2023

    UNION ALL

    SELECT
        OrderID,
        CustomerID,
        ProductID,
        OrderDate,
        Quantity,
        Revenue,
        COGS
    FROM Orders_2024

    UNION ALL

    SELECT
        OrderID,
        CustomerID,
        ProductID,
        OrderDate,
        Quantity,
        Revenue,
        COGS
    FROM Orders_2025
)

-- Building the main dataset query

SELECT
    a.OrderID,
    a.CustomerID,
    c.Region,
    a.ProductID,
    a.OrderDate,
    DATEADD(WEEK, DATEDIFF(WEEK, 0, a.OrderDate), 0) AS week_date,
    c.CustomerJoinDate,
    a.Quantity,
    a.Revenue,
    CASE
        WHEN a.Revenue IS NULL THEN p.Price * a.Quantity
        ELSE a.Revenue
    END AS cleandrevenue,
    a.Revenue - a.COGS AS profit,
    a.COGS,
    p.ProductName,
    p.ProductCategory,
    p.Price,
    p.Base_Cost
FROM all_orders AS a
LEFT JOIN customers AS c
    ON a.CustomerID = c.CustomerID
LEFT JOIN products AS p
    ON a.ProductID = p.ProductID
WHERE a.CustomerID IS NOT NULL; -- Dropping orders with null CustomerID
