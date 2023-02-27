--1. Find courses that ran in Fall 2009 or in Spring 2010

SELECT course_id FROM section WHERE semester = 'Fall' AND year = 2009 UNION SELECT course_id FROM section WHERE semester = 'Spring' and year = 2010; 

--2. Find courses that ran in Fall 2009 and in spring 2010

SELECT course_id FROM section WHERE semester = 'Fall' AND year = 2009 INTERSECT SELECT course_id FROM section WHERE semester = 'Spring' and year = 2010; 

--3. Find courses that ran in Fall 2009 but not in Spring 2010

SELECT course_id FROM section WHERE semester = 'Fall' AND year = 2009 MINUS SELECT course_id FROM section WHERE semester = 'Spring' and year = 2010; 

--4. Find the name of the course for which none of the students registered

SELECT course_id FROM course where course_id NOT IN (SELECT course_id from section);

--5. Find courses offered in Fall 2009 and in Spring 2010.

SELECT course_id FROM section WHERE semester = 'Fall' AND year = 2009 AND course_id IN (SELECT course_id FROM section WHERE semester = 'Spring' AND year = 2010);

--6. Find the total number of students who have taken course taught by the instructor with ID 10101.

SELECT COUNT(DISTINCT id) FROM takes WHERE course_id in (SELECT course_id FROM teaches WHERE id = 10101);

--7. Find courses offered in Fall 2009 but not in Spring 2010.
SELECT course_id FROM section WHERE semester = 'Fall' AND year = 2009 AND course_id NOT IN (SELECT course_id FROM section WHERE semester = 'Spring' AND year = 2010);

--8. Find the names of all students whose name is same as the instructor’s name.
SELECT student.name FROM student,instructor WHERE student.name = instructor.name;

--9. Find names of instructors with salary greater than that of some (at least one) instructor in the Biology department.
SELECT name, salary FROM instructor WHERE salary > SOME (SELECT salary  FROM instructor WHERE dept_name = 'Biology'); 

--10. Find the names of all instructors whose salary is greater than the salary of all instructors in the Biology department.
SELECT name, salary FROM instructor WHERE salary > ALL(SELECT salary  FROM instructor WHERE dept_name = 'Biology'); 

--11. Find the departments that have the highest average salary.
SELECT dept_name, AVG(salary) FROM instructor GROUP BY dept_name having AVG(salary) >= ALL(SELECT AVG (salary) FROM instructor GROUP BY dept_name);