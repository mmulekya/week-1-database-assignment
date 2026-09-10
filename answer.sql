```sql
-- Week 1 Database Assignment
-- Topic: Hotel Management System


-- Create the database

CREATE DATABASE hotel_management;

-- Select the database

USE hotel_management;


-- Create the guests table

CREATE TABLE guests (
    guest_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    phone VARCHAR(20),
    email VARCHAR(100)
);


-- Create the rooms table

CREATE TABLE rooms (
    room_id INT AUTO_INCREMENT PRIMARY KEY,
    room_number VARCHAR(10) NOT NULL UNIQUE,
    room_type VARCHAR(50) NOT NULL,
    price_per_night DECIMAL(10, 2) NOT NULL,
    room_status VARCHAR(20) DEFAULT 'Available'
);


-- Create the bookings table

CREATE TABLE bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    guest_id INT NOT NULL,
    room_id INT NOT NULL,
    check_in DATE NOT NULL,
    check_out DATE NOT NULL,
    booking_status VARCHAR(20) DEFAULT 'Confirmed',
    FOREIGN KEY (guest_id) REFERENCES guests(guest_id),
    FOREIGN KEY (room_id) REFERENCES rooms(room_id)
);


-- Create the payments table

CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT NOT NULL,
    payment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    amount DECIMAL(10, 2) NOT NULL,
    payment_method VARCHAR(30) NOT NULL,
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id)
);


-- Insert guests

INSERT INTO guests (first_name, last_name, phone, email)
VALUES
('John', 'Kamau', '0712345678', 'john.kamau@example.com'),
('Mary', 'Wanjiku', '0723456789', 'mary.wanjiku@example.com'),
('David', 'Otieno', '0734567890', 'david.otieno@example.com'),
('Grace', 'Njeri', '0745678901', 'grace.njeri@example.com');


-- Insert rooms

INSERT INTO rooms (room_number, room_type, price_per_night, room_status)
VALUES
('101', 'Single', 3500.00, 'Available'),
('102', 'Double', 5500.00, 'Booked'),
('201', 'Deluxe', 8500.00, 'Available'),
('202', 'Suite', 12000.00, 'Booked'),
('301', 'Family', 10000.00, 'Available');


-- Insert bookings

INSERT INTO bookings (guest_id, room_id, check_in, check_out, booking_status)
VALUES
(1, 2, '2026-09-10', '2026-09-13', 'Confirmed'),
(2, 4, '2026-09-11', '2026-09-15', 'Confirmed'),
(3, 1, '2026-09-12', '2026-09-14', 'Confirmed'),
(4, 3, '2026-09-15', '2026-09-18', 'Confirmed');


-- Insert payments

INSERT INTO payments (booking_id, amount, payment_method)
VALUES
(1, 16500.00, 'M-Pesa'),
(2, 48000.00, 'Card'),
(3, 7000.00, 'Cash'),
(4, 25500.00, 'M-Pesa');


-- Display all databases

SHOW DATABASES;


-- Select the hotel database

USE hotel_management;


-- Display all tables

SHOW TABLES;


-- Display all guests

SELECT * FROM guests;


-- Display all rooms

SELECT * FROM rooms;


-- Display all bookings

SELECT * FROM bookings;


-- Display all payments

SELECT * FROM payments;


-- Display table structures

DESCRIBE guests;

DESCRIBE rooms;

DESCRIBE bookings;

DESCRIBE payments;


-- Display guest bookings using a JOIN

SELECT
    bookings.booking_id,
    guests.first_name,
    guests.last_name,
    rooms.room_number,
    rooms.room_type,
    bookings.check_in,
    bookings.check_out,
    bookings.booking_status
FROM bookings
JOIN guests
    ON bookings.guest_id = guests.guest_id
JOIN rooms
    ON bookings.room_id = rooms.room_id;


-- Display available rooms

SELECT
    room_number,
    room_type,
    price_per_night
FROM rooms
WHERE room_status = 'Available';


-- Display payments made by guests

SELECT
    guests.first_name,
    guests.last_name,
    payments.amount,
    payments.payment_method,
    payments.payment_date
FROM payments
JOIN bookings
    ON payments.booking_id = bookings.booking_id
JOIN guests
    ON bookings.guest_id = guests.guest_id;
```
