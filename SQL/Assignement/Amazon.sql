CREATE DATABASE AmazonDB;
USE AmazonDB;
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    registered_date DATE NOT NULL,
    membership ENUM('Basic', 'Prime') DEFAULT 'Basic'
);

CREATE TABLE products (
	product_id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(200) NOT NULL,
	price DECIMAL(10, 2) NOT NULL,
	category VARCHAR(100) NOT NULL,
	stock INT NOT NULL
);

SELECT*FROM products;
ALTER TABLE users
RENAME TO Users;
ALTER TABLE products
RENAME TO Products;

CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Orderdetails (
	order_details_id INT PRIMARY KEY AUTO_INCREMENT,
	order_id INT, 
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
	product_id INT,
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
	quantity INT NOT NULL
);	

INSERT INTO Users (name, email, registered_date, membership)
VALUES
('Alice Johnson', 'alice.j@example.com', '2024-01-15', 'Prime'),
('Bob Smith', 'bob.s@example.com', '2024-02-01', 'Basic'),
('Charlie Brown', 'charlie.b@example.com', '2024-03-10', 'Prime'),
('Daisy Ridley', 'daisy.r@example.com', '2024-04-12', 'Basic');

INSERT INTO Products (name, price, category, stock)
VALUES
('Echo Dot', 49.99, 'Electronics', 120),
('Kindle Paperwhite', 129.99, 'Books', 50),
('Fire Stick', 39.99, 'Electronics', 80),
('Yoga Mat', 19.99, 'Fitness', 200),
('Wireless Mouse', 24.99, 'Electronics', 150);

INSERT INTO Orders (user_id, order_date, total_amount)
VALUES
(1, '2024-05-01', 79.98),
(2, '2024-05-03', 129.99),
(1, '2024-05-04', 49.99),
(3, '2024-05-05', 24.99);

INSERT INTO OrderDetails (order_id, product_id, quantity)
VALUES
(1, 1, 2),
(2, 2, 1),
(3, 1, 1),
(4, 5, 1);

# 1. List all customers who have made purchases of more than $80.
SELECT u.user_id, u.name, u.email, SUM(o.total_amount) AS total_spent
FROM Users u
JOIN Orders o ON u.user_id = o.user_id
GROUP BY u.user_id, u.name, u.email
HAVING SUM(o.total_amount) > 80;

# 2. Retrieve all orders placed in the last 280 days along with the customer name and email.
SELECT 
    o.order_id,
    o.order_date,
    o.total_amount,
    u.name AS customer_name,
    u.email AS customer_email
FROM Orders o
JOIN Users u ON o.user_id = u.user_id
WHERE o.order_date >= '2024-01-01' - INTERVAL 280 DAY;

# 3. Find the average product price for each category.
SELECT 
    category, 
    AVG(price) AS average_price
FROM Products
GROUP BY category;

# 4. List all customers who have purchased a product from the category Electronics.
SELECT DISTINCT u.user_id, u.name, u.email
FROM Users u
JOIN Orders o ON u.user_id = o.user_id
JOIN OrderDetails od ON o.order_id = od.order_id
JOIN Products p ON od.product_id = p.product_id
WHERE p.category = 'Electronics';
 
# 5. Find the total number of products sold and the total revenue generated for each product.
SELECT 
	p.product_id,
    p.name AS product_name,
    SUM(od.quantity) AS total_products_sold,
    SUM(od.quantity * p.price) AS total_revenue
FROM Products p
JOIN OrderDetails od ON p.product_id = od.product_id
GROUP BY p.product_id, p.name;

# 6. Update the price of all products in the Books category, increasing it by 10%. Query. 
SET SQL_SAFE_UPDATES = 0;
UPDATE Products
SET price = price * 1.10
WHERE category = 'Books';

# 7. Remove all orders that were placed before 2020.
DELETE FROM OrderDetails
WHERE order_id IN (
    SELECT order_id FROM Orders WHERE order_date < '2020-01-01'
);
DELETE FROM Orders
WHERE order_date < '2020-01-01';

# 8. Write a query to fetch the order details, including customer name, product name, and quantity, for orders placed on 2024-05-01.
SELECT 
    u.name AS customer_name,
    p.name AS product_name,
    od.quantity
FROM Orders o
JOIN Users u ON o.user_id = u.user_id
JOIN OrderDetails od ON o.order_id = od.order_id
JOIN Products p ON od.product_id = p.product_id
WHERE o.order_date = '2024-05-01';

# 9. Fetch all customers and the total number of orders they have placed.
SELECT 
    u.user_id,
    u.name AS customer_name,
    COUNT(o.order_id) AS total_orders
FROM Users u
LEFT JOIN Orders o ON u.user_id = o.user_id
GROUP BY u.user_id, u.name;

# 10. Retrieve the average rating for all products in the Electronics category.
ALTER TABLE Products
ADD rating INT CHECK (rating BETWEEN 1 AND 5);

UPDATE Products
SET rating = 4
WHERE product_id = 1;
UPDATE Products
SET rating = 3
WHERE product_id = 2;
UPDATE Products
SET rating = 3
WHERE product_id = 3;
UPDATE Products
SET rating = 3
WHERE product_id = 4;
UPDATE Products
SET rating = 2
WHERE product_id = 5;

SELECT 
    category,
    AVG(rating) AS avg_rating
FROM Products
WHERE category = 'Electronics';

# 11. List all customers who purchased more than 1 units of any product, including the product name and total quantity purchased.
SELECT 
    u.name AS customer_name,
    p.name AS product_name,
    SUM(od.quantity) AS total_quantity
FROM Users u
JOIN Orders o ON u.user_id = o.user_id
JOIN OrderDetails od ON o.order_id = od.order_id
JOIN Products p ON od.product_id = p.product_id
GROUP BY u.user_id, u.name, p.product_id, p.name
HAVING SUM(od.quantity) > 1;

# 12. Find the total revenue generated by each category along with the category name.
SELECT 
    p.category,
    SUM(od.quantity * p.price) AS total_revenue
FROM Products p
JOIN OrderDetails od ON p.product_id = od.product_id
GROUP BY p.category;
    

