create table employee(
    emp_no numeric(5) primary key,
    emp_name varchar(20) not null,
    gender char(1) check (gender = 'm' or gender = 'f'),
    emp_address varchar(20) not null,
    DNo numeric(5),
    salary numeric(8) not null
);

create table department(
    deptno numeric(5) primary key,
    deptname varchar(20) unique,
    location varchar(20) 
);

alter table employee add constraint Fk_Dno foreign key (DNo) references department (deptno);


insert into department values(1,'CS','SIN');
insert into department values(2,'ELECTRONICS','LA');
insert into department values(3,'MEDIA','HYD');


insert into employee values(1,'james','m','SIN',3,45000);
insert into employee values(2,'charlie','m','LA',1,9000);
insert into employee values(3,'alex','f','hyd',2,53000);

insert into department values(1,'MEDICAL','SIN');
insert into employee values(1,'james','m','SIN',3);

alter table employee drop constraint FK_Dno;
alter table employee add constraint FK_Dno foreign key (Dno) references department (deptno) on delete cascade;

alter table employee add constraint default_salary default 10000 for salary;

select* from employee;

 select name, dept_name from student;
 
 select name from instructor where dept_name = 'Comp. Sci.';

SELECT name from course where credits =3;

select title,course_id from course natural join takes where
 ID = 12345;

 select name from instructor where salary between 40000 and 90000;

 