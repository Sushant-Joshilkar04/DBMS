
 SHOW databases;
 select * from employee;

CREATE TABLE Course (
    courseID INT AUTO_INCREMENT,
    courseName VARCHAR(50) NOT NULL,
    Course_duration_months INT NOT NULL,
    CourseFee INT NOT NULL,
    PRIMARY KEY (courseID)
);


 show tables;
 DESC Course;
 
 INSERT INTO Course (courseName, Course_duration_months, CourseFee)
VALUES ("The Complete Excel Mastery Course", 3, 2100);

INSERT INTO Course (courseName, Course_duration_months, CourseFee)
VALUES ("DSA fr interview preparation", 2, 4999);

INSERT INTO Course (courseName, Course_duration_months, CourseFee)
VALUES ("SQL bootcamp", 1, 2999);

select * from Course;

 show tables;

CREATE TABLE Learner(
Learner_ID INT AUTO_INCREMENT,
LearnerFirstName VARCHAR(50) NOT NULL,
LearnerLastName VARCHAR(50) NOT NULL,
LearnerPhone VARCHAR(15) NOT NULL,
LearnerEmailID VARCHAR(50),
LearnerEnrollmentDate TIMESTAMP NOT NULL,
SelectedCourses INT NOT NULL,
YearsOfExperience INT NOT NULL,
LearnerComany VARCHAR(50) NOT NULL,
SourceOfJoining VARCHAR(50) NOT NULL,
BatchStartDate TIMESTAMP NOT NULL,
location VARCHAR(50) NOT NULL,
PRIMARY KEY(Learner_ID),
UNIQUE KEY(LearnerEmailID),
FOREIGN KEY(SelectedCourses) REFERENCES Course(courseID)
);

INSERT INTO Learner (LearnerFirstName, LearnerLastName, LearnerPhone, LearnerEmailID, LearnerEnrollmentDate, SelectedCourses, YearsOfExperience, LearnerComany, SourceOfJoining, BatchStartDate, location)
VALUES 
("John", "Doe", "9876543210", "john.doe@example.com", '2024-02-08', 1, 5, "ABC Corp", "LinkedIn", '2024-09-18', "Pune"),
("Jane", "Smith", "9876543211", "jane.smith@example.com", '2024-06-08', 2, 2, "XYZ Ltd", "Google", '2024-09-18', "Mumbai"),
("Sam", "Wilson", "9876543212", "sam.wilson@example.com", '2024-01-08', 3, 1, "DEF Inc", "Referral", '2024-09-18', "Delhi"),
("Lisa", "Adams", "9876543213", "lisa.adams@example.com", '2024-03-08', 1, 3, "GHI Solutions", "Facebook", '2024-09-18', "Bangalore"),
("Mike", "Johnson", "9876543214", "mike.johnson@example.com", '2024-03-18', 2, 4, "LMN Tech", "Instagram", '2024-09-18', "Hyderabad"),
("Emily", "Davis", "9876543215", "emily.davis@example.com", '2024-01-21', 3, 0, "None", "Facebook", '2024-09-18', "Chennai");


SELECT * FROM Learner;
SELECT COUNT(*) FROM Learner WHERE LearnerEnrollmentDate LIKE '%-06-%';
SELECT COUNT(*) FROM Learner WHERE LearnerEnrollmentDate LIKE '%-01-21';
UPDATE Learner 
SET YearsOfExperience = 2, LearnerComany = 'Google' 
WHERE Learner_ID = 6;


SELECT COUNT(DISTINCT LearnerComany) AS numberOfCompanies FROM Learner;
UPDATE Learner 
SET YearsOfExperience = 2, LearnerComany = 'ABC Corp' 
WHERE Learner_ID = 6;
SELECT COUNT(*) AS answer FROM Learner WHERE LearnerEnrollmentDate LIKE '%-01-21%';
