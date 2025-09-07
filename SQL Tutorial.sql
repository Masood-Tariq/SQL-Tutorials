/* Basic to Advanced SQL Practice*/

-- 1- The Absolute Beginner: Getting Your Feet Wet 

--SELECT Statement
--Syntax: SELECT column1, column2 FROM table_name;

select CustomerName, City, Country
from Customers

--To see all the columns:
--The asterisk (*) is a shortcut for "all columns". 

select *
from Customers

--Insert some data: Add a few students.

--INSERT INTO students (id, name, age) VALUES (1, 'Alice', 20);
--INSERT INTO students (id, name, age) VALUES (2, 'Bob', 22);

-- 2- The Intermediate User: A Little More Power
-- Goal: Filter, sort, and combine data to get more specific answers.

--Filtering Data with WHERE
--Syntax: SELECT column1 FROM table_name WHERE condition;

select CustomerName, City, Country
from Customers
where city = 'paris'

/* You can use a variety of operators:
= (equal to)
> (greater than)
< (less than)
>= (greater than or equal to)
!= or <> (not equal to)
AND, OR (combine conditions)
LIKE (for pattern matching, e.g., names starting with 'A')*/

-- Ordering Data with ORDER BY
--Syntax: SELECT * FROM table_name ORDER BY column_name [ASC|DESC];

select cookiename, costpercookie
from product
order by CookieName asc

/*DESC means descending (highest to lowest).
ASC means ascending (lowest to highest), and is the default.*/

/*Summarizing Data with Aggregate Functions
These functions perform calculations on a set of values.

COUNT(): Counts rows.
SUM(): Adds values in a column.
AVG(): Calculates the average.
MAX(): Finds the maximum value.
MIN(): Finds the minimum value.*/

select sum(revenuepercookie) as 'Revenue'
from product

/* 3- The Advanced User: The Pro-Level

Goal: Work with multiple tables, complex queries, and data manipulation.*/

--Joining Tables with JOIN
--Syntax: SELECT * 
--FROM table1 JOIN table2 ON table1.common_column = table2.common_column;

select CookieName, Quantity
from Order_Product as op
join Product as p on op.CookieID = p.CookieID
order by Quantity desc

/* Types of Joins:

INNER JOIN: Returns rows where there's a match in both tables. This is the most common.

LEFT JOIN: Returns all rows from the left table, and the matched rows from the right table.

RIGHT JOIN: All rows from the right table, matched rows from the left.

FULL OUTER JOIN: All rows from both tables.*/

--Grouping Data with GROUP BY
--This is used with aggregate functions to perform calculations on groups of data.

select CookieName, avg(RevenuePerCookie) as 'Avg Revenue'
from product
group by CookieName

/* The AS keyword is an alias, a shorthand name for the table (e.g., e for employees). This makes your code cleaner.*/

--Data Manipulation: INSERT, UPDATE, DELETE
--These commands change the data in the database.

--INSERT: Adds new rows.
--UPDATE: Changes existing rows.
--DELETE: Removes rows.

/* 4- The Expert Pro: Mastering the Art
Goal: Optimize performance, write complex subqueries, and manage the database.*/

--Subqueries
--A subquery is a query within another query. They are powerful but can be slow if not used correctly.

select CookieName, CostPerCookie
from product
where costpercookie > (select avg(costpercookie) from product)

--HAVING Clause
--This is like a WHERE clause, but for GROUP BY results.
--WHERE filters rows before grouping, HAVING filters groups after grouping.

select orderid, sum(quantity) as "Total Quantity"
from Order_Product
group by orderid 
having sum(quantity) > 100

/* HAING is used to filter aggregate functions/conditions and is used after GROUP BY. However, WHERE is used before GROUP BY.*/

--Window Functions
--These functions operate on a "window" of rows related to the current row. 
--They are beneficial for things like ranking and 
--calculating running totals without a GROUP BY.

select CookieName, costpercookie, RevenuePerCookie,
RANK() over (order by revenuepercookie desc) as "Revenue Rank"
from Product
order by CookieName asc

/* THE END.

