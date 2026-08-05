CREATE DATABASE Inventory
ON
(
	NAME = InventoryDataFile,
	FILENAME = 'C:\Users\User\Desktop\DBD Assignment DB\data\InventoryDataFile.mdf',
	SIZE = 5MB,
	MAXSIZE = UNLIMITED,
	FILEGROWTH = 10MB
)

LOG ON
(
	NAME = InventoryLogFile,
	FILENAME = 'C:\Users\User\Desktop\DBD Assignment DB\data\InventoryLogFile.ldf',
	SIZE = 5MB,
	MAXSIZE = UNLIMITED,
	FILEGROWTH = 10MB
)