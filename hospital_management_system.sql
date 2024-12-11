drop database hospital;
create database hospital;
use hospital;

create table department(
  dept_id int primary key auto_increment,
  dept_name varchar(50)
  
);
select * from department;

INSERT INTO department (dept_name) 
VALUES 
('Cardiology'),
('Neurology'),
('Orthopedics'),
('Pediatrics'),
('Oncology');


create table Doctor(
   doc_id int primary key auto_increment,
   doc_name varchar(50) not null,
   dept_id int,
   FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);

INSERT INTO Doctor (doc_name, dept_id) VALUES 
('Dr. Smith', 1),
('Dr. Johnson', 2),
('Dr. Brown', 3),
('Dr. Taylor', 1),
('Dr. Wilson', 4);


create table patient(
  pat_id int primary key auto_increment,
  pat_name varchar(50),
  doc_id int,
  foreign key(doc_id) references doctor(doc_id),
  dept_id int ,
  foreign key(dept_id) references department(dept_id)
);

INSERT INTO patient (pat_name, doc_id, dept_id)
VALUES 
('John Doe', 1, 1),  
('Jane Smith', 2, 2), 
('Alice Johnson', 3, 3), 
('Robert Brown', 4, 4),
('Emily Davis', 5, 5);

create table Test(
test_id int primary key auto_increment,
doc_id int,
pat_id int,
foreign key(doc_id) references Doctor(doc_id),
foreign key(pat_id) references patient(pat_id)
);


INSERT INTO Test (doc_id, pat_id)
VALUES 
(1, 1), 
(2, 2),
(3, 3), 
(4, 4),
(2, 5),
(4, 3), 
(4, 1),
(2, 5); 

SELECT * FROM Doctor;
SELECT * FROM Patient;
SELECT * FROM test;
SELECT * FROM department;

-- Query 1: Retrieve the total number of patients assigned to each department.
select dept_id, count(*) as number_of_patients from patient group by dept_id;

-- Query 2: Find the doctor(s) who has performed the maximum number of tests.
select doc_id,count(*) as max_test_performed_doctor from test  group by doc_id ORDER BY max_test_performed_doctor DESC LIMIT 1;

-- Query 3: List all departments along with the total number of doctors in each department.
select d.dept_name,COUNT(doc_id) AS total_doctors
FROM department d
LEFT JOIN doctor dr 
ON d.dept_id = dr.dept_id
GROUP BY d.dept_id;


-- Query 4: Retrieve the names of patients who have undergone more than 2 tests.
select p.pat_id,p.pat_zname
from patient p
join test t
on p.pat_id = t.pat_id
group by pat_id
HAVING COUNT(t.test_id) > 1;


-- Query 5: Find the average number of tests performed by each doctor.
SELECT doc_id, AVG(test_count) AS avg_tests
FROM (
  SELECT doc_id, COUNT(test_id) AS test_count
  FROM test
  GROUP BY doc_id, pat_id
) AS subquery
GROUP BY doc_id;


-- Query 6: Retrieve the details of patients who are being treated by doctors from the Cardiology department
SELECT p.*
FROM patient p
JOIN doctor d ON p.doc_id = d.doc_id
JOIN department dp ON d.dept_id = dp.dept_id
WHERE dp.dept_name = 'Cardiology';

-- Query 7: Find the department with the highest number of patients
SELECT dp.dept_name, COUNT(p.pat_id) AS total_patients
FROM department dp
JOIN patient p ON dp.dept_id = p.dept_id
GROUP BY dp.dept_id
ORDER BY total_patients DESC
LIMIT 1;

-- Query 8: List all patients along with their assigned doctor's name and department.
SELECT p.pat_name, d.doc_name, dp.dept_name
FROM patient p
JOIN doctor d ON p.doc_id = d.doc_id
JOIN department dp ON d.dept_id = dp.dept_id;

-- Query 9: Retrieve the names of doctors who have patients undergoing more than 3 tests.
SELECT d.doc_name
FROM doctor d
JOIN test t ON d.doc_id = t.doc_id
GROUP BY d.doc_id
HAVING COUNT(t.test_id) > 3;

-- Query 10: Find the total number of tests conducted for each department.
SELECT dp.dept_name, COUNT(t.test_id) AS total_tests
FROM test t
JOIN doctor d ON t.doc_id = d.doc_id
JOIN department dp ON d.dept_id = dp.dept_id
GROUP BY dp.dept_id;
