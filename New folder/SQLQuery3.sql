SELECT 
    p.ProductID,
    p.ProductName,
    p.SupplierID,
    s.CompanyName,
    p.CategoryID,
    c.CategoryName,
    p.UnitPrice,
    p.UnitsInStock,
    p.UnitsOnOrder,
    p.ReorderLevel,
    -- Convert the Discontinued column to 'Yes' or 'No'
    CASE 
        WHEN p.Discontinued = 1 THEN 'Yes'
        ELSE 'No'
    END AS Discontinued
FROM 
    dbo.Products p
INNER JOIN 
    dbo.Categories c ON p.CategoryID = c.CategoryID
INNER JOIN 
    dbo.Suppliers s ON p.SupplierID = s.SupplierID;
