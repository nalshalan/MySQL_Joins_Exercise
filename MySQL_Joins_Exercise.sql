/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT products.Name AS 'Product Name', categories.Name AS 'Category Name'
FROM products
INNER JOIN categories
ON products.CategoryID = categories.CategoryID
WHERE categories.Name = 'Computers';

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT Name, Price, Rating
FROM products
INNER JOIN reviews
ON products.ProductID = reviews.ProductID
WHERE Rating = 5;

/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT employees.EmployeeID,  FirstName, MiddleInitial, LastName, EmailAddress, PhoneNumber, Title, DateOfBirth, sum(Quantity) AS 'Total Quantity'
FROM employees 
INNER JOIN sales 
ON employees.EmployeeID = sales.EmployeeID
GROUP BY employees.EmployeeID
ORDER BY sum(Quantity) DESC
LIMIT 2;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT departments.Name, categories.Name 
FROM departments
INNER JOIN categories
ON departments.DepartmentID = categories.DepartmentID
WHERE categories.Name IN ('Appliances', 'Games');

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 SELECT Name, SUM(Quantity) AS 'Total # Sold', SUM(PricePerUnit) AS 'Total Price Sold'
 FROM products
 INNER JOIN sales
 ON products.ProductID = sales.ProductID
 WHERE Name IN ('Eagles: Hotel California');

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT Name, Reviewer, Rating, Comment
FROM products
INNER JOIN reviews
ON products.ProductID = reviews.ProductID
WHERE Name = 'Visio TV'
HAVING Rating = 1;

-- ------------------------------------------ Extra - May be difficult

/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
SELECT employees.EmployeeID, FirstName, LastName, Name, Quantity
FROM employees
INNER JOIN sales ON employees.EmployeeID = sales.EmployeeID
INNER JOIN products ON sales.ProductID = products.ProductID;