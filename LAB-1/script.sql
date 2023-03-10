create table EMPLOYEE (
emp_no numeric(5),
emp_name varchar(20),
emp_address varchar(50));

insert into EMPLOYEE values('Emp1','Andrew','SIN');
insert into EMPLOYEE values('Emp2','Joshua','MANIPAL');
insert into EMPLOYEE values('Emp3','Micheal','MANGALORE');
insert into EMPLOYEE values('Emp4','John','MANIPAL');
insert into EMPLOYEE values('Emp5','Justin','MANGALORE');

select emp_name from EMPLOYEE;
select* from EMPLOYEE where emp_address = 'MANIPAL';

alter table EMPLOYEE add emp_sal numeric(10);
update EMPLOYEE set emp_sal = 450000;

desc EMPLOYEE;

delete from EMPLOYEE where emp_address = 'MANGALORE';

alter table EMPLOYEE rename to EMPLOYEE1;

drop table EMPLOYEE1;