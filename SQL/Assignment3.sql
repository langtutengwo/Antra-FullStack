--Use Northwind database. All questions are based on assumptions described by the Database Diagram sent to you yesterday. 
--When inserting, make up info if necessary. Write query for each step. 
--Do not use IDE. BE CAREFUL WHEN DELETING DATA OR DROPPING TABLE.

USE Northwind
GO

--Question 1
/*
Create a view named “view_product_order_[your_last_name]”, list all products and total ordered quantity for 
that product.
*/
CREATE VIEW view_product_order_ZHANG
AS
SELECT p.ProductName, COUNT(od.Quantity) AS TotalQuantity
FROM Products p JOIN [Order Details] od ON p.ProductID = od.ProductID
GROUP BY p.ProductName

--Question 2
/*
Create a stored procedure “sp_product_order_quantity_[your_last_name]” that accept product id as an input 
and total quantities of order as output parameter.
*/
CREATE PROC sp_product_order_quantity_ZHANG
@id int,
@total_quantity INT OUT
AS
BEGIN
SELECT @total_quantity = COUNT(od.Quantity)
FROM Products p JOIN [Order Details] od ON p.ProductID = od.ProductID
WHERE p.ProductID = @id
END


--Question 3
/*
Create a stored procedure “sp_product_order_city_[your_last_name]” that accept product name as an input 
and top 5 cities that ordered most that product combined with the total quantity of that product ordered 
from that city as output.
*/
CREATE PROC sp_product_order_city_ZHANG
@Name varchar(20),
@Cities varchar(30)
AS
BEGIN
SELECT @Cities = TOP 5 o.ShipCity
FROM Orders o
ORDER BY (
SELECT o.ShipCity, COUNT(od.Quantity) 
FROM Products p JOIN [Order Details] od ON p.ProductID = od.ProductID JOIN Orders o ON od.OrderID = o.OrderID
WHERE p.ProductName = @Name
GROUP BY o.ShipCity) DESC
END


--Question 4
/*
Create 2 new tables “people_your_last_name” “city_your_last_name”. City table has two records: 
{Id:1, City: Seattle}, {Id:2, City: Green Bay}. People has three records: {id:1, Name: Aaron Rodgers, City: 2},
{id:2, Name: Russell Wilson, City:1}, {Id: 3, Name: Jody Nelson, City:2}. Remove city of Seattle. 
If there was anyone from Seattle, put them into a new city “Madison”. 
Create a view “Packers_your_name” lists all people from Green Bay. 
If any error occurred, no changes should be made to DB. (after test) Drop both tables and view.
*/
CREATE TABLE city_ZHANG(
Id int,
City varchar(30)
)

INSERT INTO city_ZHANG VALUES(1, 'Seattle'), (2, 'GreenBay')

CREATE TABLE people_ZHANG(
Id int,
Name varchar(30),
City int
)

INSERT INTO people_ZHANG VALUES(1, 'Aaron Rodgers', 2), (2, 'Russell Wilson', 1), (3, 'Jody Nelson', 2)

CREATE VIEW Packers_ZHANG
AS
SELECT p.Name
FROM people_ZHANG p JOIN city_ZHANG c ON p.City = c.Id
WHERE c.City = 'Green Bay'

--Question 5
/*
Create a stored procedure “sp_birthday_employees_[you_last_name]” that creates a new 
table “birthday_employees_your_last_name” and fill it with all employees that have a birthday on Feb. 
(Make a screen shot) drop the table. Employee table should not be affected.
*/
CREATE PROC sp_birthday_employees_ZHANG
AS
BEGIN
CREATE TABLE birthday_employees_ZHANG AS
SELECT LastName, FirstName
FROM Employees
WHERE BirthDate LIKE '%-02-%'
END

DROP TABLE birthday_employees_ZHANG

--Question 6
/*
How do you make sure two tables have the same data?
*/
--List all the columns in GROUP BY to compare the entire table.
--If the result is an empty set, the two tables are identical.
