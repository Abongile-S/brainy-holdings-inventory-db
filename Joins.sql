USE Inventory
GO
--Selcts all inventory items if they are discontinued
SELECT InventoryID, InventoryItem, SellingPrice, Category 
FROM InventoryItems
WHERE Discontinued = 'TRUE'