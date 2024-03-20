SELECT 
    o.OrderID,
    o.CustomerID, 
	c.CompanyName,
    o.EmployeeID, 
    o.OrderDate, 
    o.ShippedDate, 
    o.ShipVia, 
    o.ShipCity, 
    o.ShipCountry,
    od.ProductID,
    od.UnitPrice,
    od.Quantity,
    od.Discount,
    ROUND((od.UnitPrice * od.Quantity * (1 - od.Discount)), 2) AS ItemTotalPrice,
    ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) OVER(PARTITION BY o.OrderID), 2) AS TotalOrderPrice,
	DATEDIFF(day, o.OrderDate, o.ShippedDate) AS DaysToShip
FROM 
    dbo.Orders o
    INNER JOIN 
    dbo.[Order Details] od ON o.OrderID = od.OrderID
	INNER JOIN 
    dbo.Customers c ON o.CustomerID = c.CustomerID
ORDER BY 
    o.OrderID;
