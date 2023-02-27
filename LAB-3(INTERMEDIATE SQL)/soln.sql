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

--12. Find the names of those departments whose budget is lesser than the average salary of all instructors.
SELECT dept_name from department WHERE budget < ALL(SELECT AVG(salary) FROM instructor);

--13. Find all courses taught in both the Fall 2009 semester and in the Spring 2010 semester.
SELECT course_id FROM section WHERE semester = 'Fall' AND year = 2009 AND EXISTS (SELECT course_id FROM section WHERE semester = 'Spring' AND year = 2010);

--14. Find all students who have taken all courses offered in the Biology department.
SELECT id,name FROM student WHERE EXISTS (SELECT course_id from course where dept_name = 'Biology');  

-- 15.Find all courses that were offered at most once in 2009.
SELECT course_id FROM course WHERE EXISTS (SELECT course_id,semester FROM takes WHERE year = 2009);

--16. Find all the students who have opted at least two courses offered by CSE department
select id from (select id, count(*) count from takes where takes.course_id like 'CS%' group by id) where count >= 2;select id from (select id, count(*) cnt from takes where takes.course_id like 'CS%' group by id) where cnt >= 2;

--17. Find the average instructors salary of those departments where the average salary is greater than 42000
SELECT dept_name, avg_sal FROM (SELECT dept_name, AVG(salary) avg_sal FROM instructor GROUP BY dept_name) WHERE avg_sal > 42000;

--18. Create a view all_courses consisting of course sections offered by Physics department in the Fall 2009, with the building and room number of each section.
CREATE VIEW all_courses AS SELECT course_id, building, room_number FROM course NATURAL JOIN section WHERE semester = 'Fall' AND year = 2009 AND dept_name = 'Physics';

--19. Select all the courses from all_courses view.
SELECT* from all_courses;

--20. Create a view department_total_salary consisting of department name and total salary of that department.
CREATE VIEW department_total_salary AS SELECT dept_name, SUM (salary) FROM instructor GROUP BY dept_name; 

SELECT* FROM department_total_salary;
