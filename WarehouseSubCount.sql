USE Inventory
GO
CREATE TABLE Customers
(
	CustomerID INT IDENTITY(1, 1) PRIMARY KEY,
	FirstName VARCHAR(20) NOT NULL,
	LastName VARCHAR(20) NOT NULL,
	Address VARCHAR(100) NOT NULL,
	Business BIT DEFAULT('FALSE'),
	PhoneNumber VARCHAR(12) NOT NULL,
	EmailAddress VARCHAR(50) NOT NULL
)

CREATE TABLE InventoryItems
(
	InventoryID INT IDENTITY(1, 1) PRIMARY KEY,
	InventoryItem VARCHAR(30) NOT NULL,
	SellingPrice MONEY NOT NULL,
	Category VARCHAR(20) NOT NULL,
	Discontinued BIT DEFAULT('FALSE')
)

CREATE TABLE Warehouse
(
	WarehouseID INT IDENTITY(1, 1) PRIMARY KEY,
	WarehouseName VARCHAR(20) NOT NULL,
	Suburb VARCHAR(20) NOT NULL,
	PhoneNumber VARCHAR(12) NOT NULL,
	PostalCode INT NOT NULL,
	Address VARCHAR(100) NOT NULL,
	ExclusiveInventory BIT DEFAULT('FALSE')
)

CREATE TABLE InventoryLists
(
	ListID INT IDENTITY(1, 1) PRIMARY KEY,
	InventoryID INT REFERENCES InventoryItems(InventoryID) NOT NULL,
	WarehouseID INT REFERENCES Warehouse(WarehouseID) NOT NULL,
	Quantity INT NOT NULL,
	ExtraOrderNeeded BIT DEFAULT('FALSE')
)

CREATE TABLE StockOrders
(
	StockOrderID INT IDENTITY(1, 1) PRIMARY KEY,
	InventoryID INT REFERENCES InventoryItems(InventoryID) NOT NULL,
	Quantity INT NOT NULL,
	WarehouseID INT REFERENCES Warehouse(WarehouseID) NOT NULL,
	Delivered BIT DEFAULT('FALSE'),
	Logged BIT DEFAULT('FALSE')
)

CREATE TABLE Jobs
(
	JobID INT IDENTITY(1, 1) PRIMARY KEY,
	JobDescription VARCHAR(500) NOT NULL,
	Category VARCHAR(20) NOT NULL
)

CREATE TABLE CustomerOrders
(
	CustomerOrderID INT IDENTITY(1, 1) PRIMARY KEY,
	JobID INT REFERENCES Jobs(JobID) NOT NULL,
	CustomerID INT REFERENCES Customers(CustomerID) NOT NULL
)