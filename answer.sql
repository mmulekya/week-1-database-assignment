-- Week 1 Database Assignment
-- Topic: Restaurant Management System



-- Create the database

CREATE DATABASE restaurant_management;

-- Select the database

USE restaurant_management;

-- Create the customers table

CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    phone VARCHAR(20),
    email VARCHAR(100)
);

-- Create the menu table

CREATE TABLE menu (
    menu_id INT AUTO_INCREMENT PRIMARY KEY,
    item_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10, 2) NOT NULL
);

-- Create the orders table

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Insert customers

INSERT INTO customers (first_name, last_name, phone, email)
VALUES
('John', 'Kamau', '0712345678', 'john@example.com'),
('Mary', 'Wanjiku', '0723456789', 'mary@example.com'),
('David', 'Otieno', '0734567890', 'david@example.com');

-- Insert menu items

INSERT INTO menu (item_name, category, price)
VALUES
('Chicken Burger', 'Main Course', 850.00),
('Beef Pizza', 'Main Course', 1200.00),
('French Fries', 'Side Dish', 350.00),
('Fresh Juice', 'Drinks', 250.00);

-- Insert orders

INSERT INTO orders (customer_id, total_amount)
VALUES
(1, 1100.00),
(2, 1450.00),
(3, 1200.00);

-- Display all databases

SHOW DATABASES;

-- Display all tables

SHOW TABLES;

-- Display customers

SELECT * FROM customers;

-- Display menu items

SELECT * FROM menu;

-- Display orders

SELECT * FROM orders;

-- Display table structures

DESCRIBE customers;
DESCRIBE menu;
DESCRIBE orders;
