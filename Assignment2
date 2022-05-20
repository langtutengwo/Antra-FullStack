USE AdventureWorks2019
GO

--Question 1
SELECT pc.Name AS Country, ps.Name AS Province
FROM Person.CountryRegion pc JOIN Person.StateProvince ps ON pc.CountryRegionCode = ps.CountryRegionCode

--Question 2
SELECT pc.Name AS Country, ps.Name AS Province
FROM Person.CountryRegion pc JOIN Person.StateProvince ps ON pc.CountryRegionCode = ps.CountryRegionCode
WHERE pc.Name IN ('Germany', 'Canada')

USE Northwind
GO
--Question 3
SELECT p.ProductName
FROM Products p JOIN [Order Details] od ON p.ProductID = od.ProductID JOIN Orders o ON od.OrderID = o.OrderID
WHERE o.OrderDate > '1997-05-19'

--Question 4
SELECT TOP 5 o.ShipPostalCode, COUNT(od.OrderID) TotalNumOfOrders
FROM Products p JOIN [Order Details] od ON p.ProductID = od.ProductID JOIN Orders o ON od.OrderID = o.OrderID
WHERE o.OrderDate > '1997-05-19'
GROUP BY o.ShipPostalCode
ORDER BY TotalNumOfOrders DESC

--Question 5
SELECT City, COUNT(CustomerID) NumOfCustomers
FROM Customers
GROUP BY City

--Question 6
SELECT City, COUNT(CustomerID) NumOfCustomers
FROM Customers
GROUP BY City
HAVING COUNT(CustomerID) > 2

--Question 7
SELECT c.ContactName, COUNT(p.ProductID) NumOfProducts
FROM Customers c join Orders o ON c.CustomerID = o.CustomerID 
join [Order Details] od ON o.OrderID = od.OrderID join Products p ON od.ProductID = p.ProductID
GROUP BY c.ContactName

--Question 8
SELECT o.CustomerID, COUNT(p.ProductID) NumOfProducts
FROM Orders o join [Order Details] od ON o.OrderID = od.OrderID join Products p ON od.ProductID = p.ProductID
GROUP BY o.CustomerID
HAVING COUNT(p.ProductID) > 100

--Question 9
SELECT su.CompanyName 'Supplier Company Name', sh.CompanyName 'Shipping Company Name'
FROM Suppliers su, Shippers sh


--Question 10
SELECT o.OrderDate, p.ProductName
FROM Products p JOIN [Order Details] od ON p.ProductID = od.ProductID JOIN Orders o ON od.OrderID = o.OrderID

--Question 11
SELECT LastName, FirstName, Title
FROM Employees
ORDER BY Title

--Question 12
SELECT 
FROM Employees

--Question 13


--Question 14
SELECT City
FROM Employees
WHERE City IN (SELECT City FROM Customers)

--Question 15
--a.
SELECT City
FROM Customers
WHERE City NOT IN (SELECT City FROM Employees)
--b.

--Question 16
SELECT p.ProductName, SUM(od.Quantity) SumQuantity
FROM Products p JOIN [Order Details] od ON p.ProductID = od.ProductID
GROUP By p.ProductName

--Question 17
--a.

--Question 18

--Question 19

--Question 20

--Question 21
--use CTE and row_number() to find the duplicate rows, then delete from CTE where rn > 1
