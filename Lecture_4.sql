-- For each location , what is the count of each employee corresponding to location and avg of salary of those locations
USE sushant;
SELECT * FROM Employee;
SELECT location , COUNT(*) as counts, AVG(salary) as avg_salary FROM Employee GROUP BY location ;
-- also display first name and last name
SELECT location ,FirstName,LastName, COUNT(location) as counts, AVG(salary) as avg_salary FROM Employee GROUP BY location,FirstName,LastName ; -- but it is not correct

SELECT FirstName,LastName,Employee.location,counts,avg_salary -- if there ia same column name any of twp table write table name.field value temp also have location
FROM employee
JOIN
(SELECT location, COUNT(location) as counts, AVG(salary) as avg_salary 
FROM Employee -- subquery
GROUP BY location)AS temp
ON Employee.location = temp.Location;

-- JOIN() computational expensive task
-- higher join higher complexity
-- at any point of time GROUP BY kind of task is required but requires display of non aggregation columns therefore you cannot grouping properly
-- that is why concept of partition by came into picture
-- allows non aggregation column also to display

-- optimize above query by window function
SELECT FirstName,LastName,location,
COUNT(location) OVER (PARTITION BY location) as total,  -- (PARTITION BY location) - grouping
AVG(salary) OVER (PARTITION BY salary) as avg_salary 
FROM employee;


insert into employee (FirstName,LastName,Age,Salary,Location)values("Rushi","Patil",24,475000,"Noida");
insert into employee (FirstName,LastName,Age,Salary,Location)values("Pranav","Jadhav",25,475000,"Bengluru");

-- ROW_NUMBER() vs RANK() vs DENSE_RANK() 
SELECT FirstName,LastName,salary,
row_number() OVER(ORDER BY salary DESC) as Priority_EMP -- map the values with numbers on basis of sorted data ORDER BY
FROM employee;

SELECT FirstName,LastName,salary,
RANK() OVER(ORDER BY salary DESC) as Priority_EMP -- map the values with numbers on basis of sorted data ORDER BY
FROM employee;

SELECT FirstName,LastName,salary,
DENSE_RANK() OVER(ORDER BY salary DESC) as Priority_EMP -- map the values with numbers on basis of sorted data ORDER BY
FROM employee;
-- if there is no dulicate entries in your data, all three function provide same result

-- give records of employee having second highest salary
SELECT * FROM 
(SELECT FirstName,LastName,salary,
DENSE_RANK() OVER(ORDER BY salary DESC) as Priority_EMP 
FROM employee) as temp
WHERE Priority_EMP = 2;

-- Give the first employee who taking second highest salary
SELECT * FROM 
(SELECT FirstName,LastName,salary,
ROW_NUMBER() OVER(ORDER BY salary DESC) as Priority_EMP 
FROM employee) as temp
WHERE Priority_EMP = 2;

-- Specify details of highest salary people in each location
SELECT * FROM 
(SELECT FirstName,LastName,salary,location,
ROW_NUMBER() OVER(PARTITION BY location ORDER BY salary DESC) as Priority_EMP 
FROM employee) as temp
where Priority_EMP = 1;


SELECT * FROM 
(SELECT FirstName,LastName,salary,location,
ROW_NUMBER() OVER(PARTITION BY location ORDER BY salary DESC) as Priority_EMP 
FROM employee) as temp

