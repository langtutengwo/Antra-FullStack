--Question 1
/*
Create a view named “view_product_order_[your_last_name]”, list all products and total ordered quantity for 
that product.
*/
CREATE VIEW view_product_order_yang
AS
SELECT Product, Quantity
FROM Products

--Question 2
/*
Create a stored procedure “sp_product_order_quantity_[your_last_name]” that accept product id as an input 
and total quantities of order as output parameter.
*/

--Question 3
/*
Create a stored procedure “sp_product_order_city_[your_last_name]” that accept product name as an input 
and top 5 cities that ordered most that product combined with the total quantity of that product ordered 
from that city as output.
*/


--Question 4
/*
Create 2 new tables “people_your_last_name” “city_your_last_name”. City table has two records: 
{Id:1, City: Seattle}, {Id:2, City: Green Bay}. People has three records: {id:1, Name: Aaron Rodgers, City: 2},
{id:2, Name: Russell Wilson, City:1}, {Id: 3, Name: Jody Nelson, City:2}. Remove city of Seattle. 
If there was anyone from Seattle, put them into a new city “Madison”. 
Create a view “Packers_your_name” lists all people from Green Bay. 
If any error occurred, no changes should be made to DB. (after test) Drop both tables and view.
*/

--Question 5
/*
Create a stored procedure “sp_birthday_employees_[you_last_name]” that creates a new 
table “birthday_employees_your_last_name” and fill it with all employees that have a birthday on Feb. 
(Make a screen shot) drop the table. Employee table should not be affected.
*/

--Question 6
/*
How do you make sure two tables have the same data?
*/
