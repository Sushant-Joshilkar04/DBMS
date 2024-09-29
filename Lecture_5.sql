use sushant;
show tables; 

desc learner;
SELECT * FROM learner;

desc course;
SELECT * FROM course2_updated;

SELECT SelectedCourses , COUNT(*) as enrollment
FROM learner
GROUP BY SelectedCourses
ORDER BY enrollment desc
LIMIT 1;

-- courseID,courseName,Enrollment count
-- Inner Join
-- subqueries in SQL
-- it is more optimized because it firstly filters records and then join
-- so less join operations are required
SELECT courseID,courseName ,temp.enrollment FROM course
join
(SELECT SelectedCourses , COUNT(*) as enrollment
FROM learner
GROUP BY SelectedCourses
ORDER BY enrollment desc
LIMIT 1)as temp
on course.courseID=temp.SelectedCourses;
-- Another approach
SELECT courseID,courseName, COUNT(*) as enrollment
FROM learner
JOIN course
on course.courseID=learner.SelectedCourses
GROUP BY SelectedCourses
ORDER BY enrollment desc
LIMIT 1;
