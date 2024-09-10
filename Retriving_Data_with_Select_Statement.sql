show databases;
USE sqlwithankit;
SHOW TABLES;
select * from employee;

CREATE TABLE courses(
 	CourseId INT PRIMARY KEY AUTO_INCREMENT,
	CourseName varchar(50) NOT NULL,
	CourseDuration_Months INT NOT NULL,
    CourseInstructor varchar(50) NOT NULL,
    CourseFee INT NOT NULL 
);

SHOW TABLES;


INSERT INTO courses (CourseName, CourseDuration_Months, CourseInstructor, CourseFee) VALUES ("The Complete Excel Mastery Course", "3", "Ankit Yadav","1499");
INSERT INTO courses (CourseName, CourseDuration_Months, CourseInstructor, CourseFee) VALUES ("DSA for Interview Preparation", "2", "Sahil Vadia","4999");
INSERT INTO courses (CourseName, CourseDuration_Months, CourseInstructor, CourseFee) VALUES ("SQL Bootcamp", "1", "Nikhil Rathod","2999");
select * from courses;

DESC courses;	


CREATE TABLE learners(
	learnerId INT PRIMARY KEY AUTO_INCREMENT,
    learner_firstName varchar(50) NOT NULL,
    learner_lastName varchar(50) NOT NULL,
    learner_phoneNo varchar(50) NOT NULL,
    learner_email varchar(50) UNIQUE,
    learner_enrollmentDate TIMESTAMP NOT NULL,
    selectedCourse INT NOT NULL,
    yearsOfExperience INT NOT NULL,
    learnerOrg varchar(50),
    learner_sourceOfJoining varchar(50) NOT NULL,
    batch_startDate TIMESTAMP NOT NULL,
    location varchar(50) NOT NULL,
    FOREIGN KEY(selectedCourse) REFERENCES courses(CourseId)
);

desc learners;


INSERT INTO learners (learner_firstName,learner_lastName,learner_phoneNo,learner_email,learner_enrollmentDate,selectedCourse,yearsOfExperience,learnerOrg,learner_sourceOfJoining,batch_startDate,location) VALUES ("Akash", "Mishra","9998887776","akash@gmail.com",'2024-01-21',1,4,"Amazon","Linkedin",'2024-09-07',"Ahmedabad");
INSERT INTO learners (learner_firstName,learner_lastName,learner_phoneNo,learner_email,learner_enrollmentDate,selectedCourse,yearsOfExperience,learnerOrg,learner_sourceOfJoining,batch_startDate,location) VALUES ("Akhil", "George","9978897786","akhil.george.8743@gmail.com",'2024-07-28',3,2,"Flipkart","Facebok",'2024-10-04',"Rajkot");
INSERT INTO learners (learner_firstName,learner_lastName,learner_phoneNo,learner_email,learner_enrollmentDate,selectedCourse,yearsOfExperience,learnerOrg,learner_sourceOfJoining,batch_startDate,location) VALUES ("Rishikesh", "Joshi","8754213265","carjkop@gmail.com",'2024-08-15',2,1,"Google","Tweeter",'2024-10-01',"Gandhinagar");
INSERT INTO learners (learner_firstName,learner_lastName,learner_phoneNo,learner_email,learner_enrollmentDate,selectedCourse,yearsOfExperience,learnerOrg,learner_sourceOfJoining,batch_startDate,location) VALUES ("Madhuram", "Ravichandran","6532215487","ravichandran.madhuram@gmail.com",'2024-01-21',1,4,"Amazon","Linkedin",'2024-09-07',"Gota");
INSERT INTO learners (learner_firstName,learner_lastName,learner_phoneNo,learner_email,learner_enrollmentDate,selectedCourse,yearsOfExperience,learnerOrg,learner_sourceOfJoining,batch_startDate,location) VALUES ("Jeevan", "Hegde","6598784525","jeevanhegde@gmail.com",'2024-01-21',3,4,"Lenskart","Facebook",'2024-10-04',"Ahmedabad");
INSERT INTO learners (learner_firstName,learner_lastName,learner_phoneNo,learner_email,learner_enrollmentDate,selectedCourse,yearsOfExperience,learnerOrg,learner_sourceOfJoining,batch_startDate,location) VALUES ("Sidhish", "Kumar","6523214591","sidhishkumar@gmail.com",'2024-01-21',2,4,"Meta","Tweeter",'2024-10-01',"Ahmedabad");

UPDATE learners set batch_startDate = '2024-03-25'
WHERE selectedCourse = 3;

select *  from learners;

-- Data Analysis[employee, courses, learners]
-- 1. Give me the record of the employee getting highest salary
SELECT * from employee
ORDER BY salary desc
limit 1;

select * from employee
WHERE salary   = (
SELECT MAX(salary) FROM employee)
;

SELECT MAX(salary) as max_salary FROM employee;

-- 2. Give me the records of the employee getting highest salary and age is grater than 30.

SELECT * from employee
Where age > 30
order by salary desc
limit 1;

-- 3. Display the number of enrollments in the website of sqlwithankit

SELECT COUNT(*) as Number_of_Enrollments
FROM learners;

-- 4. Display the number of enrollments for the courseId = 3[SQL Bootcamp]

SELECT COUNT(learnerId) as SQL_Bootcamp
FROM learners WHERE selectedCourse = 3;

-- 5. Display the number of learners enrolled in month of jan

SELECT COUNT(learnerId) as jan_enrollements
FROM learners
WHERE learner_enrollmentDate LIKE '%-01-21%'; 

UPDATE learners 
SET yearsOfExperience = 7, learnerOrg = "Lenskart"
WHERE learnerId = 7;




select * from learners;

-- 7. Countr the number of companies where learners currently doing their job 

Select Count(learnerOrg) from learners;