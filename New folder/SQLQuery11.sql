-- Create the ImageInfo table
CREATE TABLE ImageInfo (
    ImageID INT IDENTITY(1,1) PRIMARY KEY,
    ImageName VARCHAR(255),
    ImageData VARBINARY(MAX),
    EmployeeID INT
);

-- Enable Ad Hoc Distributed Queries to use OPENROWSET for importing the image
EXEC sp_configure 'show advanced options', 1;
RECONFIGURE;
EXEC sp_configure 'Ad Hoc Distributed Queries', 1;
RECONFIGURE;

-- Insert an image into the ImageInfo table
INSERT INTO ImageInfo (ImageName, ImageData, EmployeeID)
SELECT 'girl.png', BulkColumn, 9
FROM OPENROWSET(BULK 'D:\Red The Analyst\northwind\girl.png', SINGLE_BLOB) as Image;
