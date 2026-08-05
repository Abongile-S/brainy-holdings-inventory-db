USE Inventory
GO 
--Average Selling Price of Inventory Items
SELECT AVG(SellingPrice) AS [Average Price]
FROM InventoryItems -- Table name
WHERE Category = 'Technology'