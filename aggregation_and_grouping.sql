USE sqlwithankit;
SHOW TABLES;
SELECT * FROM learners;

-- Count of the number of students who joined the course via Linkedin, Youtube, Community


SELECT learner_sourceOfJoining, COUNT(*) as no_of_students
FROM learners
GROUP BY learner_sourceOfJoining;


SELECT yearsOfExperience, count(location) as no_of_students_from_same_location
From learners
GROUP BY yearsOfExperience;

-- Corresponding to each course, how many students have enrolled

SELECT selectedCourse, COUNT(learnerId) as No_Of_Student
FROM learners
GROUP BY selectedCourse; 

Select * from courses;


-- UPDATE learners SET learner_sourceOfJoining = "Facebook"
-- WHERE learnerId = 4;


-- corresponding to individual source of joining give me the max yaer of experience;

SELECT learner_sourceOfJoining, MAX(yearsOfExperience)  as Max_Year_Of_Experience
FROM learners
GROUP BY learner_sourceOfJoining;

-- corresponding to individual source of joining give me the avg yaer of experience;
SELECT  learner_sourceOfJoining, AVG(yearsOfExperience) as avg_yrs_of_experience
FROM learners
GROUP BY learner_sourceOfJoining;

-- corresponding to individual source of joining give me the Summation of yaer of experience;

SELECT learner_sourceOfJoining, SUM(yearsOfExperience) as Sum_Of_Experience_Year 
FROM learners
GROUP BY learner_sourceOfJoining;

-- Display the count of learners joined the course from perticular Source Of joining ( The count of learners should be more than 2 )

SELECT learner_sourceOfJoining, COUNT(selectedCourse) as More_than_1_joining
FROM learners
GROUP BY learner_sourceOfJoining
HAVING More_than_1_joining > 2;



INSERT INTO learners (learner_firstName,learner_lastName,learner_phoneNo,learner_email,learner_enrollmentDate,selectedCourse,yearsOfExperience,learnerOrg,learner_sourceOfJoining,batch_startDate,location) VALUES ("Sidhish", "kumar","6532215487","sidhish.madhuram@gmail.com",'2024-01-21',1,4,"Amazon","Linkedin",'2024-09-07',"Gota");
INSERT INTO learners (learner_firstName,learner_lastName,learner_phoneNo,learner_email,learner_enrollmentDate,selectedCourse,yearsOfExperience,learnerOrg,learner_sourceOfJoining,batch_startDate,location) VALUES ("Aman", "Chauhan","6532215487","aman.madhuram@gmail.com",'2024-01-21',1,4,"Lenskart","Facebook",'2024-09-07',"Gota");


-- Count of students who joined via linkedin

SELECT learner_sourceOfJoining, COUNT(learnerId) as num_of_student_joined
FROM learners
GROUP BY learner_sourceOfJoining
HAVING learner_sourceOfJoining = "Facebook";

-- -------------------------LOGICAL OPERATOR (AND, OR, NOT, BETWEEN)-----------------------------------

-- Select Course Name NOT Having Excel

SELECT * FROM Courses
WHERE CourseName NOT LIKE "%excel%";

-- Display the records of those students who have less than or equal  4 Years of experience AND source of joining is likendin

SELECT * FROM learners
WHERE yearsOfExperience <= 4 AND learner_sourceOfJoining = "Linkedin";

-- Display the records of those student who have years of experience between 1 to 3 years

SELECT * FROM learners
WHERE yearsOfExperience BETWEEN 2 AND 4;

-- Display the records of learners who have more than 4 years of experience OR sourceof joining is Faceboo

SELECT * FROM learners
WHERE yearsOfExperience > 4 OR learner_sourceOfJoining = "Facebook"; 



-- -------------------------ALTER COMMAND-----------------------------

DESC employee;
 
-- ADD a new column in the table

ALTER TABLE employee
ADD COLUMN jobposition varchar(50);

-- MODIFY the existing column in the table

ALTER TABLE employee
MODIFY COLUMN FirstName varchar(25);

-- DROP the existing column in the table

ALTER TABLE employee 
DROP COLUMN jobposition;


-- ---------------Datatype in sql (varchar(),INT,TIMESTAMP, DECIMAL)---------------------------

DESC courses;

INSERT INTO courses (CourseName, CourseDuration_Months, CourseInstructor, CourseFee) VALUES ("Foundation of machine learning", "3.5", "Ankit Yadav","1499");
SELECT * from Courses;


ALTER TABLE Courses
MODIFY COLUMN CourseDuration_Months DECIMAL(3,1);


UPDATE Courses SET CourseDuration_Months = 3.5
WHERE CourseId = 4;


CREATE TABLE Course_update(
	CourseId INT PRIMARY KEY AUTO_INCREMENT,
    Course_Name varchar(50) NOT NULL,
    Course_Duration DECIMAL(3,1) NOT NULL,
    Course_Fee INT NOT NULL,
    Changed_at timestamp DEFAULT NOW() ON UPDATE NOW()
);
DESC Course_update;

INSERT INTO Course_update(Course_Name,Course_Duration,Course_Fee) VALUES("MERN",3.5,5999);

-- DROP TABLE Course_update; 

SELECT * FROM Course_update;

INSERT INTO Course_update(Course_Name,Course_Duration,Course_Fee) VALUES("MEAN",3.2,4999);

UPDATE Course_update SET Course_Name = "SPRING BOOT"
WHERE CourseId = 2;

ALTER TABLE Course_update
RENAME COLUMN Changed_at to Created_at;


-- Update  the CourseFee of MEAN to 2999

UPDATE Course_update 
SET Course_Fee = 2999
WHERE CourseId = 2;