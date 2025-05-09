-- 1. Achieving 1NF (First Normal Form)

--Create Customers table
CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL
);

--Create Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

--Create Products table
CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL
);

--Create OrderDetails table 
CREATE TABLE OrderDetails (
    OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- insering Customers 
INSERT INTO Customers (FirstName, LastName) VALUES
('John', 'Doe'),
('Jane', 'Smith'),
('Emily', 'Clark');



-- Inserting orders 
INSERT INTO Orders (OrderID, CustomerID) VALUES
(101, 1),
(102, 2),
(103, 3);

-- Inserting orders 
INSERT INTO Products (ProductName) VALUES
('Laptop'),
('Mouse'),
('Tablet'),
('Keyboard'),
('Phone');

-- Inserting order details
INSERT INTO OrderDetails (OrderID, ProductID) VALUES
(101, 1),  -- Laptop
(101, 2),  -- Mouse
(102, 3),  -- Tablet
(102, 4),  -- Keyboard
(102, 2),  -- Mouse
(103, 5);  -- Phone




-- 2. Achieving 2NF (Second Normal Form)

-- 1. Create Orders table (CustomerName depends only on OrderID)
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL
);

-- 2. Create OrderDetails table (Only Product and Quantity remain)
CREATE TABLE OrderDetails (
    OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Inserting orders 
INSERT INTO Orders (OrderID, FirstName, LastName) VALUES
(101, 'John', 'Doe'),
(102, 'Jane', 'Smith'),
(103, 'Emily', 'Clark');

-- Inserting order details
INSERT INTO OrderDetails (OrderID, Product, Quantity) VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);
