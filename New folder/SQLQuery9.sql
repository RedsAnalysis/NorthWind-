SELECT 
    e.EmployeeID,
    e.FirstName,
    e.Title,
    e.Address,
    e.HomePhone,
    -- Concatenate FirstName and LastName for FullName
    e.FirstName + ' ' + e.LastName AS FullName,
	e.ReportsTo,
	e.HireDate,
	e.TitleOfCourtesy
FROM 
    Employees e;
