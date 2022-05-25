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
WHERE DATEDIFF(year, o.OrderDate, GETDATE())< 25

--Question 4
SELECT TOP 5 o.ShipPostalCode, SUM(od.Quantity) as qty 
FROM Orders o JOIN [Order Details] od ON o.OrderID =  od.OrderID
WHERE o.ShipPostalCode IS NOT NULL AND DATEDIFF(year, o.OrderDate, GETDATE())< 25
GROUP BY ShipPostalCode
ORDER BY qty DESC

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
SELECT c.CustomerID, c.CompanyName, c.ContactName, SUM(od.Quantity) AS QTY
FROM Customers c LEFT join Orders o ON c.CustomerID = o.CustomerID LEFT JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY c.CustomerID, c.CompanyName, c.ContactName
ORDER BY QTY

--Question 8
SELECT c.CustomerID, SUM(od.Quantity) AS QTY
FROM Customers c LEFT join Orders o ON c.CustomerID = o.CustomerID LEFT JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY c.CustomerID
HAVING SUM(od.Quantity) > 100
ORDER BY QTY

--Question 9
SELECT su.CompanyName 'Supplier Company Name', sh.CompanyName 'Shipping Company Name'
FROM Suppliers su CROSS JOIN Shippers sh
ORDER BY 2, 1

--Question 10
SELECT o.OrderDate, p.ProductName
FROM Products p JOIN [Order Details] od ON p.ProductID = od.ProductID JOIN Orders o ON od.OrderID = o.OrderID

--Question 11
SELECT LastName, FirstName, Title
FROM Employees
ORDER BY Title

--Question 12
SELECT T1.EmployeeId, T1.LastName, T1.FirstName,T2.ReportsTo, COUNT(T2.ReportsTo) AS Subordinate  
FROM Employees T1 JOIN Employees T2 ON T1.EmployeeId = T2.ReportsTo
GROUP BY T1.EmployeeId, T1.LastName, T1.FirstName,T2.ReportsTo
HAVING COUNT(T2.ReportsTo) > 2

--Question 13
SELECT c.City, c.CompanyName, c.ContactName, 'Customer' as Type
FROM Customers c
UNION
SELECT s.City, s.CompanyName, s.ContactName, 'Supplier' as Type
FROM Suppliers s;

--Question 14
SELECT DISTINCT City
FROM Employees
WHERE City IN (SELECT City FROM Customers)

--Question 15
--a.
SELECT City
FROM Customers
WHERE City NOT IN (SELECT City FROM Employees)
--b.
select distinct city from Customers  
except 
select distinct city from Employees

--Question 16
SELECT p.ProductName, SUM(od.Quantity) SumQuantity
FROM Products p JOIN [Order Details] od ON p.ProductID = od.ProductID
GROUP By p.ProductName

--Question 17
--a.
select city from Customers
except
(
select city from customers
group by city
having COUNT(*)=1
union 
select city from customers
group by city
having COUNT(*)=0)
--b.
select city 
from customers 
group by city 
having COUNT(*)>=2

--Question 18
SELECT DISTINCT c.City
FROM Customers c join Orders o ON c.CustomerID = o.CustomerID join [Order Details] od ON o.OrderID = od.OrderID
GROUP BY c.City
HAVING COUNT(od.ProductID) >= 2

--Question 19
select top 5 ProductID,AVG(UnitPrice) as AvgPrice,(
select top 1 City 
from Customers c join Orders o on o.CustomerID=c.CustomerID join [Order Details] od2 on od2.OrderID=o.OrderID 
where od2.ProductID=od1.ProductID 
group by city 
order by SUM(Quantity) desc
) as City 
from [Order Details] od1
group by ProductID 
order by sum(Quantity) desc

--Question 20
select (
select top 1 City 
from Orders o join [Order Details] od on o.OrderID=od.OrderID join Employees e on e.EmployeeID = o.EmployeeID
group by e.EmployeeID,e.City
order by COUNT(*) desc
) as MostOrderedCity,

(select top 1 City 
from Orders o join [Order Details] od on o.OrderID=od.OrderID join Employees e on e.EmployeeID = o.EmployeeID
group by e.EmployeeID,e.City
order by sum(Quantity) desc) as MostQunatitySoldCity

--Question 21
--use CTE and row_number() to find the duplicate rows, then delete from CTE where rn > 1
