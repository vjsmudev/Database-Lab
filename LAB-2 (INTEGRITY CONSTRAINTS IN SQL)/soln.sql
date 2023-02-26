create table employee(
    empno numeric(8) PRIMARY KEY,
    empname varchar(20) NOT NULL,
    gender char(1) CHECK (gender = 'M' or gender = 'F'),
    salary numeric(8) NOT NULL,
    address varchar(20) NOT NULL,
    DNo numeric(8));

create table dept(
    deptno numeric(8) PRIMARY KEY,
    deptname varchar(20) UNIQUE,
    locn varchar(20));

ALTER TABLE employee ADD CONSTRAINT FK_DNo FOREIGN KEY (DNo) REFERENCES  dept (deptno); 

insert into dept values(1, 'BIO', 'HYD');
insert into dept values(2, 'MATH', 'MAA');
insert into dept values(3, 'PHY', 'IXE');

insert into employee values(1,'ALAN','M', 45000, 'HYD',2);
insert into employee values(2,'TOBEY','M', 50000, 'LA',3);
insert into employee values(3,'TOM','M', 90000, 'SIN',1);

select* from employee;
select* from dept;

insert into dept values(1, 'CHEM', 'HYD');
insert into employee values(3,'JIMIN','M', 45000, 'SEO',3);

ALTER TABLE employee DROP CONSTRAINT FK_DNo;
ALTER TABLE employee ADD CONSTRAINT FK_DNo FOREIGN KEY (DNo) REFERENCES dept (deptno) ON DELETE CASCADE;

ALTER TABLE EMPLOYEE MODIFY salary DEFAULT 10000;

INSERT INTO employee values(4,'JENNA','F',DEFAULT,'CA',1);

SELECT name,dept_name from student;

SELECT id ,name instructor takes where dept_name = 'Comp. Sci.' and credits = 3;

SELECT title,course_id from course NATURAL JOIN takes where id = 12345;

SELECT id,name,salary from instructor where salary BETWEEN 40000 AND 90000;

SELECT instructor.id from instructor WHERE ID NOT IN (SELECT DISTINCT course_id FROM takes);  

SELECT student.name, course.title, takes.year FROM student,course,takes,section WHERE student.id = takes.id and course.course_id = section.course_id and course.course_id = takes.course_id and takes.year = section.year and takes.semester = section.semester and takes.sec_id = section.sec_id and room_number = 303;

SELECT student.name,takes.course_id,course.title as c_name from student,course,takes where student.id = takes.id and takes.course_id = course.course_id and takes.year = 2010;

SELECT T.name, T.salary as inst_salary from instructor T, instructor S where T.salary > S.salary and S.dept_name = 'Comp. Sci.';

SELECT name from instructor where dept_name LIKE '%ch%';

SELECT name, LEN (name) from student;

SELECT dept_name,substr (dept_name,3,3) from instructor as ExtractString;

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

SELECT empname, TRUNC(MONTHS_BETWEEN(SYSDATE,dob)/12) as age FROM employee; 

