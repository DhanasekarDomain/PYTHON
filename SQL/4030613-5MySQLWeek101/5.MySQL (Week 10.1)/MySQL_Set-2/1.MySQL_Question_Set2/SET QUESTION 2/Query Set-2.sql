CREATE DATABASE setquestion2queries;

USE setquestion2queries;

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Salary DECIMAL(10, 2),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

INSERT INTO Employees (EmployeeID, Name, Age, Salary, DepartmentID) VALUES
(1, 'John', 30, 60000.00, 101),
(2, 'Emily', 25, 48000.00, 102),
(3, 'Michael', 40, 75000.00, 103),
(4, 'Sara', 35, 56000.00, 101),
(5, 'David', 28, 49000.00, 102),
(6, 'Robert', 45, 90000.00, 103),
(7, 'Sophia', 29, 51000.00, 102);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(101, 'HR'),
(102, 'Finance'),
(103, 'IT');

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    CustomerID INT,
    Amount DECIMAL(10, 2),
    SaleDate DATE
);

INSERT INTO Sales (SaleID, CustomerID, Amount, SaleDate) VALUES
(1, 101, 4500.00, '2023-03-15'),
(2, 102, 5500.00, '2023-03-16'),
(3, 103, 7000.00, '2023-03-17'),
(4, 104, 3000.00, '2023-03-18'),
(5, 105, 6000.00, '2023-03-19');

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10, 2)
);

INSERT INTO Products (ProductID, ProductName, Price) VALUES
(1, 'Laptop', 1000.00),
(2, 'Mobile', 500.00),
(3, 'Tablet', 300.00),
(4, 'Headphones', 100.00),
(5, 'Smartwatch', 200.00);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    OrderDate DATE,
    OrderAmount DECIMAL(10, 2)
);

INSERT INTO Orders (OrderID, CustomerName, OrderDate, OrderAmount) VALUES
(1, 'John', '2023-05-01', 500.00),
(2, 'Emily', '2023-05-02', 700.00),
(3, 'Michael', '2023-05-03', 1200.00),
(4, 'Sara', '2023-05-04', 450.00),
(5, 'David', '2023-05-05', 900.00),
(6, 'John', '2023-05-06', 600.00),
(7, 'Emily', '2023-05-07', 750.00);

-- Retrieve all employees whose salary is greater than 60000.
SELECT EmployeeID, Name, Age, Salary, DepartmentID
FROM Employees
WHERE Salary > 60000;

-- Calculate the total sales amount for each customer from the sales table.
SELECT CustomerID, SUM(Amount) AS TotalSales
FROM Sales
GROUP BY CustomerID;

-- Retrieve the names and salaries of all employees working in the Finance department.
SELECT e.Name, e.Salary
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Finance';

-- Find the total sales amount made on 2023-03-17 from the sales table.
SELECT SUM(Amount) AS TotalSales
FROM Sales
WHERE SaleDate = '2023-03-17';

-- Get the names of customers who have placed an order of more than 600 from the orders table.
SELECT DISTINCT CustomerName
FROM Orders
WHERE OrderAmount > 600;


