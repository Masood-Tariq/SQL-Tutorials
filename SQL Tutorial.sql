/* W3School.com
SQL Tutorial
Database - Northwind */

-- Introduction to SQL - Syntax, Clauses/Statements, Operators etc

-- USE OF DISTINCT 
select distinct country
from Customers

-- USE OF COUNT DISTINCT 
select COUNT(distinct country) as 'Distinct Count'
from Customers

-- WHERE CLAUSE WITH AND, OR, NOT
select *
from Customers
where Country = 'Germany' and City = 'Berlin'

select *
from customers
where city = 'Berlin' or city = 'London'

select *
from Customers
where not Country = 'Germany'

---- INSER INTO DATA CLAUSE
--INSERT INTO Customers (CustomerID, CompanyName, City, Country)
--VALUES ('CARDI', 'Cardinal', 'Stavanger', 'Norway')

---- UPDATE DATA CLAUSE
--update Customers
--set ContactName = 'Sabor'
--where CustomerID= 'CARDI'

---- DELETE DATA CLAUSE
--delete from Customers
--where CustomerID = 'STASA'

select *
from Customers
where CustomerID = 'CARDI'

-- TOP () CLAUSE
select top 10 *
from Customers
where Country = 'Germany'

-- AGGREGATE FUNCTIONS
select MIN(unitprice) as 'Minimum Price'
from Products

select MAX(unitprice) as 'Maximum Price'
from Products

select AVG(unitprice) as 'Average Price'
from Products

select SUM(unitprice) as 'Total Price'
from Products

select COUNT(unitprice) as 'Count Price'
from Products

-- LIKE WITH %
select *
from Customers
where city like 'ber%'

select *
from customers
where city like '%es%'

select CustomerID, City
from customers
where city like '%don'

-- NOT IN OPERATOR
select *
from Customers
where Country not in ('Germany', 'France', 'UK')

-- IN OPERATOR WITH SUBQUERY
select CompanyName, Country
from customers
where country in (select country from suppliers)

-- BETWEEN OPERATOR
select OrderID, OrderDate, ShippedDate
from Orders
where ShippedDate between 1996/07/04 and 1996/08/04

-- USING OF ALIAS IN COLUMNS AND TABLES
select o.orderid, o.orderdate, c.CompanyName
from Orders as o, Customers as c
where c.CompanyName = 'Alfreds Futterkiste' and c.CustomerID = o.CustomerID

-- JOINS
select o.CustomerID,
o.ShipName, 
o.Freight, 
c.CompanyName,
c.City,
c.Country
from Orders o
inner join Customers c
on o.CustomerID = c.CustomerID
order by ShipName

-- SELF JOIN
select distinct a.CustomerID as 'Customer',
a.ShipName as 'Ship',
a.ShipCountry as 'Country',
b.ShipCity as 'City'
from Orders a, Orders b
where a.ShipCity = b.ShipCity


select distinct a.CustomerID as 'Customer',
a.ShipName as 'Ship',
a.ShipCountry as 'Country',
b.ShipCity as 'City'
from Orders a, Orders b
where a.ShipCity <> b.ShipCity

-- UNION CLAUSE DISTINCT VLUES - SAME AS APPEND FUNCTION
-- SAME DATA TYPE AND SAME COLUMN STRUCTURE

select city 
from Customers 
union
select city 
from Suppliers 
order by City

SELECT 'Customer' As Type, ContactName, City, Country
FROM Customers
UNION
SELECT 'Supplier', ContactName, City, Country
FROM Suppliers

-- UNION ALL - ALL OR DUPLICATE VALUES

SELECT City, Country FROM Customers
WHERE Country='Germany'
UNION ALL
SELECT City, Country FROM Suppliers
WHERE Country='Germany'
ORDER BY City

-- GROUP BY STATEMENT - NORMALLY USES WITH AGGREGATE FUNCTIONS

SELECT COUNT(CustomerID) AS 'ID', Country
FROM Customers
GROUP BY Country
ORDER BY COUNT(CustomerID) DESC

-- GROUP BY WITH JOIN

SELECT LastName,
COUNT(e.EmployeeID) AS 'Employee ID' 
FROM Employees as e
LEFT JOIN Orders as o
ON e.employeeid = o.employeeid
GROUP BY e.LastName
ORDER BY COUNT(e.EmployeeID)

-- HAVING CLAUSE WITH GROUP BY

SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) > 5

SELECT COUNT(CustomerID) as 'ID', Country
FROM Customers
WHERE Country IN ('USA', 'France', 'Germany')
GROUP BY Country
HAVING COUNT(CustomerID) > 5
ORDER BY COUNT(CustomerID) DESC






