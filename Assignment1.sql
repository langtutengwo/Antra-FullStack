use AdventureWorks2019
go

--Question 1
SELECT p.ProductID, p.Name, p.Color, p.ListPrice
FROM Production.Product AS p

--Question 2
SELECT p.ProductID, p.Name, p.Color, p.ListPrice
FROM Production.Product AS p
WHERE p.ListPrice != 0

--Question 3
SELECT p.ProductID, p.Name, p.Color, p.ListPrice
FROM Production.Product AS p
WHERE p.Color is not null

--Question 4
SELECT p.ProductID, p.Name, p.Color, p.ListPrice
FROM Production.Product AS p
WHERE p.Color is not null and p.ListPrice > 0

--Question 5
SELECT p.Name + ' ' + p.Color AS NameAndColor
FROM Production.Product AS p
WHERE p.Color is not null

--Question 6
SELECT 'NAME:' + p.Name + ' -- ' + 'COLOR:' + p.Color AS NameAndColor
FROM Production.Product AS p
WHERE p.Color is not null

--Question 7
SELECT p.ProductID, p.Name
FROM Production.Product AS p
WHERE p.ProductID between 400 and 500

--Question 8
SELECT p.ProductID, p.Name, p.Color
FROM Production.Product AS p
WHERE p.Color in ('black', 'blue')

--Question 9
SELECT p.Name
FROM Production.Product AS p
WHERE p.Name like 'S%'

--Question 10
SELECT p.Name, p.ListPrice
FROM Production.Product AS p
WHERE p.Name like '[A,S]%'
ORDER BY p.Name

--Question 11
SELECT *
FROM Production.Product AS p
WHERE p.Name like 'SPO[^K]%'
ORDER BY p.Name

--Question 12
SELECT distinct IsNull(p.ProductSubcategoryID, '-1') AS IDOfUniqueCombation, IsNull(p.Color, 'N/A') AS ColorOfUniqueCombation
FROM Production.Product AS p
