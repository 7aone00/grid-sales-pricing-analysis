--combing the order years 

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
    FROM Orders_2025)

--buliding the main dataset query 
    select 
       a.OrderID,
        a.CustomerID,
        c.Region ,

        a.ProductID,
        a.OrderDate ,
        DATEADD(WEEK,DATEDIFF(WEEK,0,a.OrderDate),0) as week_date,
        c.CustomerJoinDate ,
        a.Quantity,
        a.Revenue,
        case when a.Revenue is null then p.Price * a.Quantity else a.Revenue end as cleandrevenue ,
        a.Revenue - a.COGS as profit,
        a.COGS ,
        p.ProductName ,
        p.ProductCategory ,
        p.Price ,
        p.Base_Cost 
        from all_orders as a
        left join customers c 
        on a.CustomerID = c.CustomerID
        left join products as p 
        on a.ProductID = p.ProductID
        where a.CustomerID is not null --droping noon customers id 
