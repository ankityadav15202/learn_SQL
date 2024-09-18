USE sqlwithankit;

SELECT * FROM employee; 

-- For each location, What is the count of each employee and avg salary of those people in those loaction

-- --------------JOIN QUERY------------------------------------------
-- JOIN quer is by default INNNER JOIN, it returns the row that has the matching values of mentioned conditionin both JOIN table


-- But, also display firstname and lastname corresponding to each record.
SELECT FirstName, LastName, employee.location,  Total, Avg_salary
From employee
Join
(SELECT location, COUNT(EID)as Total , AVG (Salary) as Avg_salary
FROM employee
GROUP BY location) as temp
ON employee.location = temp.location;


-- optimize the above query via window function
-- So, we uses PARTITION BY when we  havr to display the non aggergated column or field
-- PARTITION BY has less time complexity compare to JOIN.


SELECT FirstName, LastName, location,
COUNT(location) OVER (PARTITION BY location) as Total,
AVG(salary) OVER (PARTITION BY location) as Avg_Salary
FROM employee;

INSERT INTO employee(FirstName, LastName, Age, Salary, Location) VALUES ("Jeevan","Hedge",27,25000,"Noida");
INSERT INTO employee(FirstName, LastName, Age, Salary, Location) VALUES ("Sidhish","Kumar",25,25000,"Vastral");
INSERT INTO employee(FirstName, LastName, Age, Salary, Location) VALUES ("Jeevan","Yadav",22,25000,"Noida");


-- INTERVIEW QUESTION = Difference Between ROW_NUMBER(), RANK(), and DENSE_RANK()
-- ROW_NUMBER()
SELECT EID,FirstName, LastName, Salary,
ROW_NUMBER() OVER (ORDER BY Salary DESC) AS Priority_EMP
FROM employee;

-- RANK()
SELECT EID, FirstName, LastName, Salary,
RANK() OVER (ORDER BY Salary DESC) as Priority_EMP
FROM employee;

-- DENSE_RANK()
SELECT EID, FirstName, LastName, Salary,
DENSE_RANK() OVER (ORDER BY Salary DESC) AS Priority_EMP
FROM employee;


-- Get the employee with the second highest salary 

SELECT * FROM
(SELECT EID, FirstName, LastName, Salary,
DENSE_RANK() OVER (ORDER BY Salary DESC) AS Priority_EMP
FROM employee) as temp
HAVING priority_emp like '%2%' ;


-- Specify the detail of highest salary people in each location


SELECT * FROM 
(SELECT EID, FirstName, LastName, salary,location,
ROW_NUMBER() OVER (PARTITION BY LOCATION ORDER BY Salary DESC) as rank_priority
from employee) as temp
WHERE rank_priority = 1;

-- Select the employee whose name starts with A.
-- Here we will use the WILD CARD operator LIKE
SELECT * FROM employee
WHERE FirstName Like "%sa%";


