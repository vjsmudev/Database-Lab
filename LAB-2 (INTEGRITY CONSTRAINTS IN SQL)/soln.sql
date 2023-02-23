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

SELECT name,course_id,title as c_name from (student natural join takes) where year = 2015; 
