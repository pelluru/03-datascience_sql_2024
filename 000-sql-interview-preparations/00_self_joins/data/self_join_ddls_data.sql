-- Data for following article on self join  
-- https://www.stratascratch.com/blog/illustrated-guide-about-self-join-in-sql/
-- https://platform.stratascratch.com/coding/10322-finding-user-purchases?code_type=1

-- SQL Self Join Syntax
-- We mentioned that self join is not a particular type of join in SQL. This means joining the table with itself works with any join you’re familiar with:

-- (INNER) JOIN
-- LEFT (OUTER) JOIN
-- RIGHT (OUTER) JOIN
-- FULL (OUTER) JOIN
-- CROSS JOIN
-- It means you can use any JOIN and then reference the same table twice: in FROM and join type keyword of your choosing.

-- If you need to refresh your knowledge about JOINs, here’s the Types of SQL JOINs article.

-- The syntax on the example of JOIN is:

-- SELECT …
-- FROM table_1 AS t1
-- JOIN table_1 AS t2
-- ON …;
-- One important note is that giving table aliases is mandatory here. As we join a table with itself, we have to give different aliases so the query knows which table the columns in SELECT and ON are from. Basically, you’re doing the regular JOIN, but you’re treating one table like these are two distinct tables in JOIN.

-- The condition in ON reflects that, as the condition is comprised of the column(s) from the ‘first’ table and the column(s) from the ‘second’ table.

-- This is a general syntax used whenever you want to self join a table in SQL. Let’s now see the different applications of self join on the examples from our platform. We’ll have to write plenty of code, which is the best way to practice syntax.

 
DROP SCHEMA IF exists "000_sql_interviews" CASCADE;

CREATE SCHEMA IF NOT exists "000_sql_interviews";

CREATE TABLE IF NOT exists  "000_sql_interviews"."employee" (
  "id" BIGINT PRIMARY KEY,
  "employee_first_name" TEXT NOT NULL,
  "employee_last_name" TEXT NOT NULL,
  "manager_id" BIGINT NULL
);

INSERT INTO "000_sql_interviews"."employee" ("id", "employee_first_name", "employee_last_name", "manager_id")
VALUES
(1, 'Frank', 'Cappa', 8),
(2, 'Carlos', 'Montana', 1),
(3, 'Dennis', 'Mopper', NULL),
(4, 'Tina', 'Burner', 3),
(5, 'Roni', 'Mitchell', 4),
(6, 'Rita', 'Franklin', 1),
(7, 'Barry', 'Seinfield', 1),
(8, 'Mike', 'Dyson', 3),
(9, 'John', 'Elton', 4),
(10, 'Sophia', 'Koren', 1),
(11, 'Phil', 'Ypung', 4);



-- create amazon_tranactions table

-- Create table
CREATE TABLE "000_sql_interviews"."amazon_transactions" (
    id BIGINT PRIMARY KEY,
    user_id INT NOT NULL,
    item TEXT NOT NULL,
    created_at DATE NOT NULL,
    revenue INT NOT NULL
);

-- Insert data
INSERT INTO "000_sql_interviews"."amazon_transactions"  (id, user_id, item, created_at, revenue) VALUES
(1, 109, 'milk', '2020-03-03', 123),
(2, 139, 'biscuit', '2020-03-18', 421),
(3, 120, 'milk', '2020-03-18', 176),
(4, 108, 'banana', '2020-03-18', 862),
(5, 130, 'milk', '2020-03-28', 333),
(6, 103, 'bread', '2020-03-29', 862),
(7, 122, 'banana', '2020-03-07', 952),
(8, 125, 'bread', '2020-03-13', 317),
(9, 139, 'bread', '2020-03-30', 929),
(10, 141, 'banana', '2020-03-17', 812),
(11, 116, 'bread', '2020-03-31', 226),
(12, 128, 'bread', '2020-03-04', 112),
(13, 146, 'biscuit', '2020-03-04', 362),
(14, 119, 'banana', '2020-03-28', 127),
(15, 142, 'bread', '2020-03-09', 503),
(16, 122, 'bread', '2020-03-06', 593),
(17, 128, 'biscuit', '2020-03-24', 160),
(18, 112, 'banana', '2020-03-24', 262),
(19, 149, 'banana', '2020-03-29', 382),
(20, 100, 'banana', '2020-03-18', 599),
(21, 130, 'milk', '2020-03-16', 604),
(22, 103, 'milk', '2020-03-31', 290),
(23, 112, 'banana', '2020-03-23', 523),
(24, 102, 'bread', '2020-03-25', 325),
(25, 120, 'biscuit', '2020-03-21', 858),
(26, 109, 'bread', '2020-03-22', 432),
(27, 101, 'milk', '2020-03-01', 449),
(28, 138, 'milk', '2020-03-19', 961),
(29, 100, 'milk', '2020-03-29', 410),
(30, 129, 'milk', '2020-03-02', 771),
(31, 123, 'milk', '2020-03-31', 434),
(32, 104, 'biscuit', '2020-03-31', 957),
(33, 110, 'bread', '2020-03-13', 210),
(34, 143, 'bread', '2020-03-27', 870),
(35, 130, 'milk', '2020-03-12', 176),
(36, 128, 'milk', '2020-03-28', 498),
(37, 133, 'banana', '2020-03-21', 837),
(38, 150, 'banana', '2020-03-20', 927),
(39, 120, 'milk', '2020-03-27', 793),
(40, 109, 'bread', '2020-03-02', 362),
(41, 110, 'bread', '2020-03-13', 262),
(42, 140, 'milk', '2020-03-09', 468),
(43, 112, 'banana', '2020-03-04', 381),
(44, 117, 'biscuit', '2020-03-19', 831),
(45, 137, 'banana', '2020-03-23', 490),
(46, 130, 'bread', '2020-03-09', 149),
(47, 133, 'bread', '2020-03-08', 658);


-- create worker table
CREATE TABLE "000_sql_interviews"."worker" (
    worker_id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    salary INT NOT NULL,
    joining_date DATE NOT NULL,
    department TEXT NOT NULL
);

-- Insert data
INSERT INTO "000_sql_interviews"."worker" (worker_id, first_name, last_name, salary, joining_date, department) VALUES
(1, 'Monika', 'Arora', 100000, '2014-02-20', 'HR'),
(2, 'Niharika', 'Verma', 80000, '2014-06-11', 'Admin'),
(3, 'Vishal', 'Singhal', 300000, '2014-02-20', 'HR'),
(4, 'Amitah', 'Singh', 500000, '2014-02-20', 'Admin'),
(5, 'Vivek', 'Bhati', 500000, '2014-06-11', 'Admin'),
(6, 'Vipul', 'Diwan', 200000, '2014-06-11', 'Account'),
(7, 'Satish', 'Kumar', 75000, '2014-01-20', 'Account'),
(8, 'Geetika', 'Chauhan', 90000, '2014-04-11', 'Admin'),
(9, 'Agepi', 'Argon', 90000, '2015-04-10', 'Admin'),
(10, 'Moe', 'Acharya', 65000, '2015-04-11', 'HR'),
(11, 'Nayah', 'Laghari', 75000, '2014-03-20', 'Account'),
(12, 'Jai', 'Patel', 85000, '2014-03-21', 'HR');

-- create table for uber trips

-- Create table
CREATE TABLE "000_sql_interviews"."uber_trips" (
    trip_id SERIAL PRIMARY KEY,
    trip_date DATE NOT NULL,
    fare INT NOT NULL,
    driver_id INT NOT NULL,
    is_completed BOOLEAN NOT NULL
);

-- Insert data
INSERT INTO "000_sql_interviews"."uber_trips" (trip_id, trip_date, fare, driver_id, is_completed) VALUES
(1, '2021-07-12', 12, 1, TRUE),
(2, '2021-07-23', 4, 1, FALSE),
(3, '2021-08-02', 43, 1, TRUE),
(4, '2021-09-13', 27, 1, TRUE),
(5, '2021-06-15', 23, 2, TRUE),
(6, '2021-06-18', 15, 2, TRUE),
(7, '2021-08-03', 14, 2, TRUE),
(8, '2021-08-14', 32, 2, TRUE),
(9, '2021-03-18', 12, 3, TRUE),
(10, '2021-04-22', 2, 3, FALSE),
(11, '2021-05-16', 22, 3, TRUE),
(12, '2020-12-06', 32, 4, TRUE),
(13, '2021-01-16', 27, 4, TRUE),
(14, '2021-05-13', 15, 4, TRUE);

-- Create table
CREATE TABLE "000_sql_interviews"."maximum_of_two_numbers" (
    number INT
);

-- Insert data
INSERT INTO "000_sql_interviews"."maximum_of_two_numbers" (number) VALUES
(-2),
(-1),
(0),
(1),
(2);
