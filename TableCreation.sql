USE Inventory
GO
--query that joins inventory items, jobs and the customer tables together
SELECT c.FirstName, c.LastName, j.JobDescription, i.InventoryItem, i.Category 
FROM Customers c
INNER JOIN CustomerOrders co ON c.CustomerID = co.CustomerID
INNER JOIN Jobs j ON co.JobID = j.JobID
INNER JOIN InventoryItems i ON j.Category = i.Category