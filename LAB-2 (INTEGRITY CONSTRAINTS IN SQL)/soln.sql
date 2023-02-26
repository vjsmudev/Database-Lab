/*1. Create Employee table with following constraints:
 Make EmpNo as Primary key.
 Do not allow EmpName, Gender, Salary and Address to have null values.
 Allow Gender to have one of the two values: ‘M’, ‘F’.*/
create table employee(
    empno numeric(8) PRIMARY KEY,
    empname varchar(20) NOT NULL,
    gender char(1) CHECK (gender = 'M' or gender = 'F'),
    salary numeric(8) NOT NULL,
    address varchar(20) NOT NULL,
    DNo numeric(8));

/*2. Create Department table with following:
Make DeptNo as Primary key
Make DeptName as candidate key*/
create table dept(
    deptno numeric(8) PRIMARY KEY,
    deptname varchar(20) UNIQUE,
    locn varchar(20));

--3)Make DNo of Employee as foreign key which refers to DeptNo of Department.

ALTER TABLE employee ADD CONSTRAINT FK_DNo FOREIGN KEY (DNo) REFERENCES  dept (deptno); 

--4 )Insert few tuples into Employee and Department which satisfies the above constraints.

insert into dept values(1, 'BIO', 'HYD');
insert into dept values(2, 'MATH', 'MAA');
insert into dept values(3, 'PHY', 'IXE');


insert into employee values(1,'ALAN','M', 45000, 'HYD',2);
insert into employee values(2,'TOBEY','M', 50000, 'LA',3);
insert into employee values(3,'TOM','M', 90000, 'SIN',1);

select* from employee;
select* from dept;

--5)Try to insert few tuples into Employee and Department which violates some of the above constraints.

insert into dept values(1, 'CHEM', 'HYD');
insert into employee values(3,'JIMIN','M', 45000, 'SEO',3);

--7)Modify the foreign key constraint of Employee table such that whenever a department tuple is deleted, the employees belonging to that department will also be deleted.

ALTER TABLE employee DROP CONSTRAINT FK_DNo;
ALTER TABLE employee ADD CONSTRAINT FK_DNo FOREIGN KEY (DNo) REFERENCES dept (deptno) ON DELETE CASCADE;

--8) Create a named constraint to set the default salary to 10000 and test the constraint by inserting a new record

ALTER TABLE EMPLOYEE MODIFY salary DEFAULT 10000;

INSERT INTO employee values(4,'JENNA','F',DEFAULT,'CA',4);

--9) List all Students with names and their department names.

SELECT name,dept_name from student;

--10)List all instructors in CSE department. Find the names of courses in CSE department which have 3 credits

SELECT id ,name instructor takes where dept_name = 'Comp. Sci.' and credits = 3;

--For the student with ID 12345 (or any other value), show all course-id and title of all courses registered for by the student.

SELECT title,course_id from course NATURAL JOIN takes where id = 12345;

--13. List all the instructors whose salary is in between 40000 and 90000.

SELECT id,name,salary from instructor where salary BETWEEN 40000 AND 90000;

--14.  Display the IDs of all instructors who have never taught a course

SELECT instructor.id from instructor WHERE ID NOT IN (SELECT DISTINCT course_id FROM takes);  

--15. Find the student names, course names, and the year, for all students those who have attended classes in room-number 303.

SELECT student.name, course.title, takes.year FROM student,course,takes,section WHERE student.id = takes.id and course.course_id = section.course_id and course.course_id = takes.course_id and takes.year = section.year and takes.semester = section.semester and takes.sec_id = section.sec_id and room_number = 303;

SELECT student.name, takes.course_id, course.title AS c_name FROM student INNER JOIN takes ON student.id = takes.id INNER JOIN course ON takes.course_id = course.course_id WHERE takes.year = 2010;

SELECT T.name, T.salary as inst_salary from instructor T, instructor S where T.salary > S.salary and S.dept_name = 'Comp. Sci.';

SELECT name from instructor where dept_name LIKE '%ch%';

SELECT name, LENGTH (name) from student;

SELECT dept_name,substr (dept_name,3,3) from instructor;

SELECT UPPER(name) from instructor;

SELECT NVL(grade,0) from takes;

SELECT salary, ROUND(salary/3,-2) from instructor;  

ALTER TABLE employee ADD (date dob);

UPDATE employee set dob = '30-NOV-2000' where empno = 1;

UPDATE employee set dob = '8-MAR-2001' where empno = 2;

UPDATE employee set dob = '07-JAN-2002' where empno = 3;

UPDATE employee set dob = '10-OCT-2003' where empno = 4;

SELECT empname,dob from employee;

SELECT empname, TO_CHAR(dob, 'DD-MON-YYYY') FROM employee;

SELECT empname, TO_CHAR(dob, 'DD-MON-YY') FROM employee;

SELECT empname, TO_CHAR(dob, 'YEAR') YEAR FROM employee;

SELECT empname, TO_CHAR(dob, 'Year') YEAR FROM employee;

SELECT empname, TO_CHAR(dob, 'year') YEAR FROM employee;


SELECT empname, TO_CHAR(dob, 'DAY') YEAR FROM employee;

SELECT empname, TO_CHAR(dob, 'Day') YEAR FROM employee;

SELECT empname, TO_CHAR(dob, 'day') YEAR FROM employee;

SELECT empname, TO_CHAR(dob, 'MONTH') YEAR FROM employee;

SELECT empname, TO_CHAR(dob, 'Month') YEAR FROM employee;

SELECT empname, TO_CHAR(dob, 'month') YEAR FROM employee;

SELECT empname, LAST_DAY(dob) from employee;

SELECT  empname, ROUND(MONTHS_BETWEEN(CURRENT_DATE,dob)/12, 0) age from employee;

SELECT empname,dob, NEXT_DAY(ADD_MONTHS(dob,60*12),'SATURDAY') next_sat from employee;

SELECT empname from employee WHERE EXTRACT(YEAR FROM dob) = &x;

SELECT empname from employee WHERE EXTRACT(YEAR FROM dob) BETWEEN &x AND &y;
