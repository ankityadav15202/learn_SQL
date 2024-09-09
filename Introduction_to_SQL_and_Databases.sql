SHOW DATABASES;
CREATE DATABASE IF NOT EXISTS sqlwithankit;
USE sqlwithankit;
SELECT database();

CREATE TABLE employee (
	EID INT AUTO_INCREMENT,
    FirstName varchar(50) NOT NULL, 
    LastName varchar(50) NOT NULL,
    Age	INT NOT NULL,
    Salary INT NOT NULL,
    Location varchar(50) NOT NULL,
    PRIMARY KEY(EID)
); 

SHOW TABLES;
DESC employee;

-- INSERT INTO employee VALUES(1,"Ankit","Yadav",21,50000,"Ahmedabad"); write this if you are inserting all the values for all the columns, but we have used the AUOT_INCREMENT constraints for the EID we can't use this formate

INSERT INTO employee (FirstName, LastName, Age, Salary, Location) VALUES("Ankit","Yadav","21",50000,"Ahmedabad");
INSERT INTO employee (FirstName, LastName, Age, Salary, Location) VALUES("Nikhil","Rathod","29",20000,"Nikol");
INSERT INTO employee (FirstName, LastName, Age, Salary, Location) VALUES("Aryan","Panchal","18",30000,"Vastral");
INSERT INTO employee (FirstName, LastName, Age, Salary, Location) VALUES("Sahil","Vadia","35",40000,"Vatva");
INSERT INTO employee (FirstName, LastName, Age, Salary, Location) VALUES("Tanvi","Gohel","25",45000,"Sarkhej");
INSERT INTO employee (FirstName, LastName, Age, Salary, Location) VALUES("Heli","Acharya","55",50000,"Ashram Road");
INSERT INTO employee (FirstName, LastName, Age, Salary, Location) VALUES("Salomi","Gadhiya","28",55000,"Vatva");

SELECT * FROM employee;

-- Give me the employee detail having salary more than 50,000

SELECT * FROM employee WHERE Salary >= 50000;
SELECT FirstName, LastName FROM employee WHERE Salary >= 50000;

SELECT * FROM employee WHERE Age > 25;

-- Update the last name of Ankit with Ahir

UPDATE employee SET LastName = "Ahir"
WHERE EID = 1; 

-- Delete the record from EID 1'

DELETE FROM employee
WHERE EID = 1;

SELECT * FROM employee;


