SHOW databases;
USE sushant;
SHOW tables;

SELECT * FROM learner;

-- count of number of who joined by linkedin,Instagram,Google
SELECT SourceOfJoining, COUNT(*) as num_of_students FROM Learner GROUP BY SourceOfJoining;
-- 1) SELECT SourceOfJoining,Location, COUNT(*) as num_of_students FROM Learner GROUP BY SourceOfJoining;  wrong query
-- because of location is non agreegated column bcoz there is no agreegation above
-- whatever you column(non agreegated column) you use after select that columns you want to use after GROUP BY non agreegated column

-- 2) Aggregated column  - using COUNT,MAX,MIN,SUM
-- directly use GROUP BY 
SELECT SourceOfJoining,Location, COUNT(*) as num_of_students FROM Learner GROUP BY SourceOfJoining,Location;

-- Corresponding to each course how many students are enrolled
SELECT SelectedCourses , COUNT(*) FROM learner GROUP BY SelectedCourses;
SELECT SelectedCourses , COUNT(*) FROM learner GROUP BY SelectedCourses;

SELECT * FROM course;

-- corresponding to individual source of joining, give maximum year of experience in all SourceOfJoining
SELECT SourceOfJoining , MAX(YearsOfExperience) FROM learner GROUP BY SourceOfJoining ;
SELECT * FROM Learner;

SELECT  YearsOfExperience,SourceOfJoining ,COUNT(*) FROM learner GROUP BY YearsOfExperience,SourceOfJoining ORDER BY MAX(YearsOfExperience) DESC;

-- corresponding to individual source of joining, give minimum year of experience in all SourceOfJoining
SELECT SourceOfJoining , MIN(YearsOfExperience) FROM learner GROUP BY SourceOfJoining ;

-- corresponding to individual source of joining, give avg year of experience in all SourceOfJoining
SELECT SourceOfJoining , AVG(YearsOfExperience) FROM learner GROUP BY SourceOfJoining ;

-- corresponding to individual source of joining, give summation year of experience in all SourceOfJoining
SELECT SourceOfJoining , SUM(YearsOfExperience) FROM learner GROUP BY SourceOfJoining ;
-- GROUP BY it will check unique values in entries of column

-- Display the records of those learners who have joined course via more than 1 source of joining
-- whenever filteration is required on aggregation after group by apply having clause
SELECT SourceOfJoining , COUNT(*) as counts FROM learner GROUP BY SourceOfJoining HAVING counts>1;
SELECT SourceOfJoining , COUNT(*) as counts FROM learner GROUP BY SourceOfJoining HAVING counts>2;

-- Display the records of those learners who have joined course via Linkedin
INSERT INTO Learner (LearnerFirstName, LearnerLastName, LearnerPhone, LearnerEmailID, LearnerEnrollmentDate, SelectedCourses, YearsOfExperience, LearnerComany, SourceOfJoining, BatchStartDate, location)
VALUES 
("John", "Pati;", "9876543280", "john.patil@example.com", '2024-02-08', 1, 5, "ABC Corp", "LinkedIn", '2024-09-18', "Kolhapur"),
("Jane", "Bhosale", "9876523211", "jane.bhosale@example.com", '2024-06-08', 4, 2, "XYZ Ltd", "Google", '2024-09-18', "Mumbai");
SELECT * FROM Learner;
SELECT SourceOfJoining , COUNT(*) as counts FROM learner GROUP BY SourceOfJoining HAVING SourceOfJoining='LinkedIn';
SELECT SourceOfJoining , COUNT(*) as counts FROM learner GROUP BY SourceOfJoining HAVING SourceOfJoining='Facebook';
-- Never use WHERE clause after GROUP BY for filteration

-- DIsplay the course which doesn't include "Excel"
-- write like LIKE command use before NOT
SELECT * FROM Course WHERE courseName NOT LIKE "%Excel%";

-- Display the records of those who having less than 4 years of experience and source of joining FACEBOOK and location is Mumbai
SELECT * FROM learner WHERE YearsOfExperience<4 AND SourceOfJoining='Facebook' AND location='Chennai';

-- Display the records of those who having experience between 1-3 
-- 1 and 3 are inclusive
SELECT * FROM learner WHERE YearsOfExperience BETWEEN 1 AND 3;

-- Display the records of those who having less than 3 years of experience or source of joining FACEBOOK or location is Mumbai
SELECT * FROM learner WHERE YearsOfExperience<3 OR SourceOfJoining='Facebook' OR location='Chennai';

-- ALTER command in SQL
DESC Employee;
ALTER TABLE employee ADD column jobPosition varchar(50);
ALTER TABLE employee MODIFY column FirstName varchar(40);
ALTER TABLE employee DROP column jobPosition ;
-- ALTER TABLE employee DROP PRIMARY KEY;   when we auto increment then DROP PRIMARY KEY doesn't work


-- Truncate command in SQL
-- DELETE vs TRUNCATE Command in SQL -->Research 




-- DATATYPES IN SQL
-- IMPLICIT TYPECASTING
DESC course;
 INSERT INTO Course (courseName, Course_duration_months, CourseFee)
VALUES ("Foundation of data science", 3.5, 2100);  -- Course_duration_months --> 4

SELECT * FROM course;
DROP TABLE Course2_UPDATED;
CREATE TABLE Course2_UPDATED (
    courseID INT AUTO_INCREMENT,
    courseName VARCHAR(50) NOT NULL,
    Course_duration_months DECIMAL(3,1) NOT NULL,   -- (PRECISION,SCALE)
    CourseFee INT NOT NULL,
    changed_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW(),  -- ON UPDATE NOW() when you change anything time will be recorded
    PRIMARY KEY (courseID)
);

-- it gives error
 -- INSERT INTO Course2_UPDATED (courseName, Course_duration_months, CourseFee) VALUES ("Foundation of science", 1113.5, 2100);  
 -- INSERT INTO Course2_UPDATED (courseName, Course_duration_months, CourseFee) VALUES ("Foundation of science", 113.55, 2100);
 
INSERT INTO Course2_UPDATED (courseName, Course_duration_months, CourseFee)
VALUES ("The Complete Excel Mastery Course", 2.5, 2100);

INSERT INTO Course2_UPDATED (courseName, Course_duration_months, CourseFee)
VALUES ("DSA fr interview preparation", 2, 4999);

INSERT INTO Course2_UPDATED (courseName, Course_duration_months, CourseFee)
VALUES ("SQL bootcamp", 1, 2999);

 INSERT INTO Course2_UPDATED (courseName, Course_duration_months, CourseFee)
VALUES ("Statistics for data science", 1.5, 4555);  

 INSERT INTO Course2_UPDATED (courseName, Course_duration_months, CourseFee)
VALUES ("Foundation of data science", 3.5, 2100);  

SELECT * FROM Course2_UPDATED;

-- update courseFee of SQL bootcamp to 3999
UPDATE Course2_UPDATED set CourseFee = 3999 where courseID = 4;
-- update and delete work with primary key in safe mode
-- it work with other also but we want to change safe mode
-- UPDATE Course2_UPDATED set CourseFee = 3999 where courseName = "SQL bootcamp";

