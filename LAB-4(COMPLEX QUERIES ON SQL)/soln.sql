--1.Find the number of students in each course.
SELECT COUNT(DISTINCT id), dept_name FROM student GROUP BY dept_name;

--2. Find those departments where the average number of students are greater than 10.
SELECT AVG(avg_sal) FROM (SELECT AVG(salary) avg_sal FROM instructor GROUP BY dept_name having AVG(salary) > 42000);

--3. Find the total number of courses in each department.
SELECT dept_name, count(course_id) FROM course GROUP BY dept_name;

--4. Find the names and average salaries of all departments whose average salary is greater than 42000.
SELECT dept_name,AVG(salary) FROM instructor GROUP BY dept_name having AVG(salary) > 42000;

--5. Find the enrolment of each section that was offered in Spring 2009.
select sec_id, count(id) from takes natural join section where semester = 'Spring' and year = 2009 group by sec_id;

--6.List all the courses with prerequisite courses, then display course id in increasing order.
SELECT course_id, prereq_id FROM prereq ORDER BY course_id ASC;

--7. Display the details of instructors sorting the salary in decreasing order.
SELECT name,salary FROM instructor ORDER BY salary DESC;

--8. Find the maximum total salary across the departments.
SELECT MAX(tot_sal) FROM (SELECT SUM (salary) AS tot_sal FROM instructor GROUP BY dept_name);

--9. Find the average instructors’ salaries of those departments where the average salary is greater than 42000.
SELECT AVG(avg_sal) FROM (SELECT AVG(salary) avg_sal FROM instructor GROUP BY dept_name having AVG(salary) > 42000); 

--10. Find the sections that had the maximum enrolment in Spring 2010
SELECT MAX (e_roll) FROM (SELECT COUNT(id) e_roll FROM takes GROUP BY sec_id,year,semester HAVING  semester = 'Spring' and year = 2010);

--11. Find the names of all instructors who teach all students that belong to ‘CSE’ department.
SELECT DISTINCT name FROM instructor NATURAL JOIN teaches WHERE course_id in (SELECT course_id FROM takes NATURAL JOIN student WHERE dept_name = 'Comp. Sci.');

--12. Find the average salary of those department where the average salary is greater than 50000 and total number of instructors in the department are more than 5.
 SELECT AVG(avg_sal) FROM (SELECT COUNT(id),dept_name, AVG(salary) avg_sal FROM instructor GROUP BY dept_name HAVING AVG(salary) > 50000 AND COUNT(id) > 5);

--13. Find all departments with the maximum budget
with maxbud(val) as (select max(budget)from department) select dept_name,budget from department,maxbud where department.budget = maxbud.val;

--14. Find all departments where the total salary is greater than the average of the total salary at all departments
with dept_total(dept_name, value) as (select dept_name, sum(salary) from instructor group by dept_name),dept_total_avg(value) as (select avg(value) from dept_total) select dept_name from dept_total, dept_total_avg where dept_total.value >= dept_total_avg.value;

--15. Find the sections that had the maximum enrolment in Fall 2009
WITH temp AS (SELECT max(count(id)) AS T FROM takes WHERE semester='Fall' and year=2009 group by sec_id) SELECT sec_id FROM temp,takes WHERE semester='Fall' and year=2009 group by sec_id,temp.T having count(id) = temp.T;

--16. Select the names of those departments where the total credits earned by all the students is greater than the total credits earned by all the students in the Finance Department
WITH temp AS (SELECT sum(tot_cred) AS T FROM student WHERE dept_name='Finance') SELECT dept_name FROM student,temp group by dept_name,temp.T having sum(tot_cred) > temp.T;

--17.Delete all the instructors of Finance department.
SAVEPOINT S;

DELETE FROM instructor WHERE dept_name = 'Finance';

SELECT* FROM instructor;

ROLLBACK to S;

SELECT* FROM instructor;
--18. Delete all courses in CSE department.
SAVEPOINT S1;

DELETE FROM course WHERE dept_name = 'Comp. Sci.';

SELECT* FROM course;

ROLLBACK to S1;

--19.Transfer all the students from CSE department to IT department.
SAVEPOINT S2;

INSERT INTO department values('IT', 'ORCL',100000);

SELECT* from department;

UPDATE student SET dept_name = 'IT' WHERE dept_name = 'Comp. Sci.';

SELECT* FROM student;

ROLLBACK TO S2;

--20. Increase salaries of instructors whose salary is over $100,000 by 3%, and all others receive a 5% raise
SAVEPOINT S3;

update instructor set salary = case when salary > 90000 then salary*1.03 else salary*1.05 end;

SELECT* FROM instructor;

ROLLBACK TO S3;
