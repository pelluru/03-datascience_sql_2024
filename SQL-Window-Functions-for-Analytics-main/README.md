# SQL-Window-Functions-for-Analytics

This repository contains SQL scripts and data files for learning and practicing SQL window functions for analytics.

## What are window functions?

Window functions are a type of SQL function that allow you to perform calculations over a set of rows, called a window, that are related to the current row. Window functions can help you answer questions such as:

- How does each row compare to the average of the whole table?
- What is the cumulative sum or running total of a column?
- How do I rank rows within a group or partition?
- How do I calculate the percentage of total for each row?

## What are the files in this repository?

This repository contains the following files:

- **SQL-Window-Functions-for_Analytics.sql**: This file contains the SQL scripts that demonstrate how to use various window functions such as `ROW_NUMBER`, `RANK`, `DENSE_RANK`, `NTILE`, `LAG`, `LEAD`, `FIRST_VALUE`, `LAST_VALUE`, `SUM`, `AVG`, `MIN`, `MAX`, `COUNT`, and `PERCENT_RANK`. The scripts use the data from the `Customers.csv` and `Sales.csv` files.
- **Customers.csv**: This file contains the data of the customers who made purchases from an online store. The columns are: `CustomerID`, `FirstName`, `LastName`, `Email`, `Phone`, `Address`, `City`, `State`, `ZipCode`, and `Country`.
- **Sales.csv**: This file contains the data of the sales transactions made by the customers. The columns are: `OrderID`, `OrderDate`, `CustomerID`, `ProductID`, `Quantity`, and `UnitPrice`.
- **project-db.txt**: This file contains the instructions on how to create a database and import the data from the CSV files using SQLite.

