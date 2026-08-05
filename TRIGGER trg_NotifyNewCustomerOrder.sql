-- Trigger: Mark ExtraOrderNeeded if StockOrder is placed
CREATE TRIGGER trg_MarkExtraOrder
ON StockOrders
AFTER INSERT
AS
BEGIN
    UPDATE InventoryLists
    SET ExtraOrderNeeded = 1
    FROM InventoryLists il
    JOIN inserted i ON il.InventoryID = i.InventoryID AND il.WarehouseID = i.WarehouseID
    WHERE il.Quantity < 10 -- Assuming low stock threshold is 10
END
GO
--Helps automate inventory management by ensuring items with low stock are flagged for restocking.