CREATE DATABASE EcommerceDB;

CREATE TABLE Users (
	UserID INT PRIMARY KEY AUTO_INCREMENT,
    UserName VARCHAR(50) UNIQUE NOT NULL,
    PasswordHash VARCHAR(255) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Orders (
	OrdersID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    OrderDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    TotalAmount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE Products (
	ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100) NOT NULL,
    `Description` TEXT,
    Price DECIMAL(10,2) NOT NULL,
    Stock INT NOT NULL
);

CREATE TABLE Reviews (
	ReviewID INT PRIMARY KEY AUTO_INCREMENT,
    ProductID INT,
    UserID INT, 
    Rating INT,
    CHECK (rating BETWEEN 1 AND 5),
    ReviewText TEXT,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE OrderDetails (
	OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT, 
    ProductID INT,
    Quantity INT,
    PriceAtOrder DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrdersID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- INSERT
INSERT INTO Users (UserName, PasswordHash, Email) VALUES
('men', 'hashed_password_1', 'Men@gmail.com'),
('mai', 'hashed_password_2', 'mai@gmail.com'),
('mal', 'hashed_password_3', 'mal@gmail.com');

INSERT INTO Products (ProductName, `Description`, Price, Stock) VALUES
('A', 'Description for Product A', 19.99, 100),
('B', 'Description for Product B', 29.99, 50),
('C', 'Description for Product C', 9.99, 200),
('D', 'Description for Product D', 49.99, 30),
('E', 'Description for Product E', 5.99, 150);

INSERT INTO Orders (UserID, TotalAmount) VALUES
(1, 39.98), 
(2, 59.98);

INSERT INTO OrderDetails (OrderID, ProductID, Quantity, PriceAtOrder) VALUES
(1, 1, 2, 19.99),  
(1, 2, 1, 29.99); 


INSERT INTO OrderDetails (OrderID, ProductID, Quantity, PriceAtOrder) VALUES
(2, 3, 3, 9.99),   
(2, 5, 5, 5.99);   

INSERT INTO Reviews (ProductID, UserID, Rating, ReviewText) VALUES
(1, 1, 5, 'Great product! Highly recommend.'),
(2, 2, 4, 'Very good quality, but a bit pricey.'),
(3, 3, 3, 'Average product, nothing special.');

-- UPDATE
UPDATE Products
SET Price = 24.99
WHERE ProductID = 1;  

UPDATE Products
SET Stock = 80
WHERE ProductID = 2;  

UPDATE Users
SET Email = 'TranMen@gmail.com'
WHERE UserID = 1;

-- DELETE
DELETE FROM OrderDetails
WHERE ProductID = 1;

DELETE FROM Reviews
WHERE ProductID = 1;

DELETE FROM Products
WHERE ProductID = 1;

DELETE FROM OrderDetails
WHERE OrderID = 2; 

DELETE FROM Orders
WHERE OrdersID = 2;