USE Inventory
GO
--Selects all customers where they are a business
SELECT FirstName, Address, PhoneNumber, EmailAddress
FROM Customers
WHERE Business = 'TRUE'