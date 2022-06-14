

-- A. How many orders were shipped by Speedy Express in total?

SELECT COUNT(OrderID) FROM Orders
INNER JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID
WHERE ShipperName == "Speedy Express"

-- Result: 54

 
-- B. What is the last name of the employee with the most orders?
SELECT E.LastName 
FROM Employees as E 
INNER JOIN Orders AS O 
ON E.EmployeeID = O.EmployeeID 
GROUP BY O.EmployeeID 
ORDER BY COUNT(O.EmployeeID) DESC 
LIMIT 1 

-- Result: Peacock
 
-- C. What product was ordered the most by customers in Germany?
SELECT P.ProductName 
FROM Products AS P 
INNER JOIN OrderDetails AS OD ON P.ProductID = OD.ProductID 
INNER JOIN Orders AS O ON OD.OrderID = O.OrderID 
INNER JOIN Customers AS C ON O.CustomerID = C.CustomerID 
WHERE C.Country = "Germany"
GROUP BY P.ProductName 
ORDER BY COUNT(P.ProductName) DESC 
LIMIT 1 

-- Result: Gorgonzola Telino
