--1. Retrieve the birth date and address of the employee(s) whose name is ‘John B. Smith’. 
SELECT Bdate, Address FROM EMPLOYEE WHERE Fname = 'John' AND minit = 'B' AND Lname = 'Smith';
-- Retrieve the name and address of all employees who work for the ‘Research’ department.
SELECT Fname,minit,Lname Address FROM EMPLOYEE NATURAL JOIN DEPARTMENT1 WHERE DName  = 'Research';

--2. For every project located in ‘Stanford’, list the project number, the controlling
--department number, and the department manager’s last name, address, and birth date.
SELECT  p.Pnumber, p.Dnum, e.Lname,e.Address, e.Bdate,d.Dnumber FROM EMPLOYEE e, PROJECT p, DEPARTMENT1 d WHERE d.mgr_ssn = e.ssn AND d.Dnumber =  p.Dnum AND p.Plocation = 'Stafford';  

--3. Find all distinct salaries of employees.
SELECT DISTINCT (salary) from EMPLOYEE;

--4. For each employee, retrieve the employee’s first and last name and the first and last name of his or her immediate supervisor.
SELECT emp.Fname, emp.Lname, sup.Fname, sup.Lname FROM EMPLOYEE emp, EMPLOYEE sup WHERE emp.super_ssn = sup.ssn;     

--5. Make a list of all project numbers for projects that involve an employee whose last name is ‘Smith’, either as a worker or as a manager of the department that controls the project.
SELECT p.PNo 