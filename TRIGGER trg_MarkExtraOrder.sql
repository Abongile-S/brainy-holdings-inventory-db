-- Trigger: Log Discontinued Items
CREATE TABLE DiscontinuedLog (
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    InventoryID INT,
    DiscontinuedDate DATETIME DEFAULT GETDATE()
)
GO

CREATE TRIGGER trg_LogDiscontinued
ON InventoryItems
AFTER UPDATE
AS
BEGIN
    INSERT INTO DiscontinuedLog (InventoryID)
    SELECT i.InventoryID
    FROM inserted i
    JOIN deleted d ON i.InventoryID = d.InventoryID
    WHERE i.Discontinued = 1 AND d.Discontinued = 0
END
GO
--Helps maintain a historical record of all discontinued items for auditing or inventory analysis.