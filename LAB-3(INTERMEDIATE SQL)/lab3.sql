select course_id from section where semester = 'Fall' and year = 2009 union select course_id from section where semester = 'Spring' and year = 2010;

select course_id from section where semester = 'Fall' and year = 2009 intersect select course_id from section where semester = 'Spring' and year = 2010;

select course_id from section where semester = 'Fall' and year = 2009 minus select course_id from section where semester = 'Spring' and year = 2010;

select course.course_id from course where course.course_id not in (select takes.course_id from takes);

SELECT s1.course_id from section s1 where semester = 'Fall' AND year = 2009 AND s1.course_id in (SELECT s2.course_id from  section s2 where semester = 'Spring' and year = 2010);

SELECT COUNT (UNIQUE takes.id) from takes where takes.course_id in (SELECT teaches.course_id from teaches where teaches.id = 10101); 

SELECT s1.course_id from section s1 where semester = 'Fall' and year = 2009 and s1.course_id not in (select s2.course_id from section s2 where semester = 'Spring' and year = 2010);

SELECT student.name from student where student.name in (SELECT instructor.name from instructor);

SELECT t1.name from instructor t1 where t1.salary > SOME (SELECT t2.salary from instructor t2 where dept_name = 'Biology');

SELECT dept_name, AVG(salary) FROM instructor group by dept_name HAVING AVG(salary) >= ALL(SELECT AVG(salary) from instructor by dept_name);

select department.dept_name from department where department.budget <  (SELECT avg (instructor.salary) from instructor);

select course_id from section where semester = 'Fall' and year = 2009 and EXISTS (SELECT course_id from section where semester = 'Spring' and year = 2010);

