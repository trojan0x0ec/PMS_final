-- PostgreSQL SQL Dump
-- version 4.5.1
-- Converted from phpMyAdmin SQL Dump

-- Set the SQL mode and time zone
SET SESSION sql_mode = 'NO_AUTO_VALUE_ON_ZERO';
SET SESSION TIME ZONE '+00:00';

-- Create the database
CREATE DATABASE pharmacy;
\c pharmacy;

-- Create table `company`
CREATE TABLE company (
                         NAME varchar(50) PRIMARY KEY,
                         ADDRESS varchar(50) NOT NULL,
                         PHONE varchar(20) NOT NULL
);

-- Insert data into table `company`
INSERT INTO company (NAME, ADDRESS, PHONE) VALUES
                                               ('Elshark', 'Egypt/\nCairo', '01234567890'),
                                               ('El_Horia', 'Damanhour/\nShobra/\nBus_Station', '01020304050'),
                                               ('Med_City', 'Alexandria /\nStanley  /\nBeach Avenue', '22334455'),
                                               ('PharmaPlus', 'Cairo /\nNasr City /\nTayran Street', '01298765432'),
                                               ('Wellness Inc', 'Giza /\nDokki /\nTharwat Street', '01121314');

-- Create table `users`
CREATE TABLE users (
                       ID serial PRIMARY KEY,
                       NAME varchar(50) NOT NULL,
                       DOB varchar(20) NOT NULL,
                       ADDRESS varchar(100) NOT NULL,
                       PHONE varchar(20) NOT NULL,
                       SALARY double precision NOT NULL,
                       PASSWORD varchar(20) NOT NULL
);

-- Insert data into table `users`
INSERT INTO users (NAME, DOB, ADDRESS, PHONE, SALARY, PASSWORD) VALUES
                                                                    ('John Doe', '1990-01-01', 'Cairo/\nNasr City', '01012345678', 5000, 'password123'),
                                                                    ('Jane Smith', '1985-02-15', 'Giza/\nDokki', '22334455', 4000, 'jane1985'),
                                                                    ('Alice Johnson', '1992-03-10', 'Alexandria/\nStanley', '01233445566', 3000, 'alice1992'),
                                                                    ('Bob Brown', '1980-04-20', 'Cairo/\nMaadi', '01044556677', 4500, 'bob1980'),
                                                                    ('Charlie Davis', '1975-05-25', 'Giza/\nHaram', '55667788', 5500, 'charlie1975');

-- Create table `drugs`
CREATE TABLE drugs (
                       NAME varchar(50) NOT NULL,
                       TYPE varchar(20) NOT NULL,
                       BARCODE varchar(20) PRIMARY KEY,
                       DOSE varchar(10) NOT NULL,
                       CODE varchar(10) NOT NULL,
                       COST_PRICE double precision NOT NULL,
                       SELLING_PRICE double precision NOT NULL,
                       EXPIRY varchar(20) NOT NULL,
                       COMPANY_NAME varchar(50) NOT NULL,
                       PRODUCTION_DATE date NOT NULL,
                       EXPIRATION_DATE date NOT NULL,
                       PLACE varchar(20) NOT NULL,
                       QUANTITY int NOT NULL
);

-- Insert data into table `drugs`
INSERT INTO drugs (NAME, TYPE, BARCODE, DOSE, CODE, COST_PRICE, SELLING_PRICE, EXPIRY, COMPANY_NAME, PRODUCTION_DATE, EXPIRATION_DATE, PLACE, QUANTITY) VALUES
                                                                                                                                                            ('Aspirin', 'Tablets', 'asp12345', '500mg', 'asp01', 0.50, 1.00, 'Available for use', 'Elshark', '2022-01-01', '2024-01-01', 'Shelf A1', 100),
                                                                                                                                                            ('Paracetamol', 'Tablets', 'par67890', '500mg', 'par01', 0.20, 0.50, 'Available for use', 'El_Horia', '2021-05-01', '2023-05-01', 'Shelf B2', 200),
                                                                                                                                                            ('Ibuprofen', 'Capsules', 'ibu11223', '200mg', 'ibu02', 0.30, 0.80, 'Available for use', 'Med_City', '2021-03-15', '2023-03-15', 'Shelf C3', 150),
                                                                                                                                                            ('Amoxicillin', 'Syrup', 'amo44556', '125mg/5ml', 'amo03', 2.00, 3.50, 'Available for use', 'PharmaPlus', '2020-12-01', '2022-12-01', 'Shelf D4', 50),
                                                                                                                                                            ('Lisinopril', 'Tablets', 'lis77889', '10mg', 'lis04', 0.40, 1.20, 'Available for use', 'Wellness Inc', '2022-06-01', '2024-06-01', 'Shelf E5', 120);

-- Create table `expiry`
CREATE TABLE expiry (
                        PRODUCT_NAME varchar(50) NOT NULL,
                        PRODUCT_CODE varchar(20) NOT NULL,
                        DATE_OF_EXPIRY varchar(10) NOT NULL,
                        QUANTITY_REMAIN int NOT NULL
);

-- Insert data into table `expiry`
INSERT INTO expiry (PRODUCT_NAME, PRODUCT_CODE, DATE_OF_EXPIRY, QUANTITY_REMAIN) VALUES
                                                                                     ('Aspirin', 'asp01', '2024-01-01', 90),
                                                                                     ('Paracetamol', 'par01', '2023-05-01', 180),
                                                                                     ('Ibuprofen', 'ibu02', '2023-03-15', 140),
                                                                                     ('Amoxicillin', 'amo03', '2022-12-01', 30),
                                                                                     ('Lisinopril', 'lis04', '2024-06-01', 110);

-- Create table `history_sales`
CREATE TABLE history_sales (
                               USER_NAME varchar(20) NOT NULL,
                               BARCODE varchar(20) NOT NULL,
                               NAME varchar(50) NOT NULL,
                               TYPE varchar(10) NOT NULL,
                               DOSE varchar(10) NOT NULL,
                               QUANTITY int NOT NULL,
                               PRICE double precision NOT NULL,
                               AMOUNT double precision NOT NULL,
                               DATE varchar(15) NOT NULL,
                               TIME varchar(20) NOT NULL
);

-- Insert data into table `history_sales`
INSERT INTO history_sales (USER_NAME, BARCODE, NAME, TYPE, DOSE, QUANTITY, PRICE, AMOUNT, DATE, TIME) VALUES
                                                                                                          ('John Doe', 'asp12345', 'Aspirin', 'Tablets', '500mg', 2, 1.00, 2.00, '2022-07-01', '09:00:00'),
                                                                                                          ('Jane Smith', 'par67890', 'Paracetamol', 'Tablets', '500mg', 1, 0.50, 0.50, '2022-07-02', '10:15:00'),
                                                                                                          ('Alice Johnson', 'ibu11223', 'Ibuprofen', 'Capsules', '200mg', 3, 0.80, 2.40, '2022-07-03', '11:30:00'),
                                                                                                          ('Bob Brown', 'amo44556', 'Amoxicillin', 'Syrup', '125mg/5ml', 1, 3.50, 3.50, '2022-07-04', '12:45:00'),
                                                                                                          ('Charlie Davis', 'lis77889', 'Lisinopril', 'Tablets', '10mg', 2, 1.20, 2.40, '2022-07-05', '14:00:00');

-- Create table `inbox`
CREATE TABLE inbox (
                       MESSAGE_FROM varchar(20) NOT NULL,
                       MESSAGE_TO varchar(20) NOT NULL,
                       MESSAGE_TEXT varchar(200) NOT NULL
);

-- Insert data into table `inbox`
INSERT INTO inbox (MESSAGE_FROM, MESSAGE_TO, MESSAGE_TEXT) VALUES
                                                               ('John Doe', 'Jane Smith', 'Welcome Jane!'),
                                                               ('Jane Smith', 'John Doe', 'Thank you, John.'),
                                                               ('Alice Johnson', 'Bob Brown', 'Hi Bob, how are you?'),
                                                               ('Bob Brown', 'Alice Johnson', 'I am good, Alice. How about you?'),
                                                               ('Charlie Davis', 'John Doe', 'John, please review the new stock.'),
                                                               ('John Doe', 'Charlie Davis', 'Will do, Charlie. Thanks.');

-- Create table `login`
CREATE TABLE login (
                       NAME varchar(50) NOT NULL,
                       TYPE varchar(20) NOT NULL,
                       DATE varchar(20) NOT NULL,
                       TIME varchar(20) NOT NULL
);

-- Insert data into table `login`
INSERT INTO login (NAME, TYPE, DATE, TIME) VALUES
                                               ('John Doe', 'Admin', '2022-07-01', '08:00:00'),
                                               ('Jane Smith', 'Employee', '2022-07-01', '08:05:00'),
                                               ('Alice Johnson', 'Employee', '2022-07-01', '08:10:00'),
                                               ('Bob Brown', 'Employee', '2022-07-01', '08:15:00'),
                                               ('Charlie Davis', 'Admin', '2022-07-01', '08:20:00');

-- Create table `message_history`
CREATE TABLE message_history (
                                 MESSAGE_FROM varchar(20) NOT NULL,
                                 MESSAGE_TO varchar(20) NOT NULL,
                                 MESSAGE_TEXT varchar(200) NOT NULL
);

-- Create table `purchase`
CREATE TABLE purchase (
                          BARCODE varchar(20) NOT NULL,
                          NAME varchar(50) NOT NULL,
                          TYPE varchar(20) NOT NULL,
                          COMPANY_NAME varchar(20) NOT NULL,
                          QUANTITY int NOT NULL,
                          PRICE double precision NOT NULL,
                          AMOUNT double precision NOT NULL,
                          PRIMARY KEY (BARCODE)
);

-- Insert data into table `purchase`
INSERT INTO purchase (BARCODE, NAME, TYPE, COMPANY_NAME, QUANTITY, PRICE, AMOUNT) VALUES
    ('asp12345', 'Aspirin', 'Tablets', 'Elshark', 100, 0.50, 50.00);

-- Create table `sales`
CREATE TABLE sales (
                       BARCODE varchar(20) NOT NULL,
                       NAME varchar(50) NOT NULL,
                       TYPE varchar(10) NOT NULL,
                       DOSE varchar(10) NOT NULL,
                       QUANTITY int NOT NULL,
                       PRICE double precision NOT NULL,
                       AMOUNT double precision NOT NULL,
                       DATE varchar(15) NOT NULL
);
