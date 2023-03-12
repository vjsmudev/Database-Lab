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

--5. Make a list of all project numbers for projects that involve an employee whose last name is ‘Smith’, either as a worker or as a manager of the department that controls the project
SELECT Pno,Essn,Fname FROM PROJECT,WORKS_ON,EMPLOYEE  WHERE Lname = 'Smith' AND Essn = ssn AND pno = pnumber;

--6. Retrieve all employees who reside is in Houston, Texas.
SELECT Fname FROM EMPLOYEE WHERE Address LIKE '%Houston, TX';

--7. Show the resulting salaries if every employee working on the ‘ProductX’ project is given a 10 percent raise.
SELECT Fname, Salary* 1.1 Raised_Salary FROM EMPLOYEE,PROJECT WHERE Pname = 'ProductX';

--8. Retrieve all employees in department 5 whose salary is between 30,000 and 40,000
SELECT e.Fname, e.salary from EMPLOYEE e, DEPARTMENT1 d WHERE d.Dnumber = 5 AND e.salary BETWEEN 30000 AND 40000;

/*9. Retrieve a list of employees and the projects they are working on, ordered by department and
, within each department, ordered alphabetically by last name, then first name.*/

SELECT Fname,Lname,Pname,PNo,Dno FROM WORKS_ON,EMPLOYEE, PROJECT WHERE essn = ssn  ORDER BY Lname, Fname, Dno;

--10. Retrieve the names of all employees who do not have supervisors
SELECT Fname FROM EMPLOYEE WHERE super_ssn IS NULL;

--11. Retrieve the name of each employee who has a dependent with the same first name and is the same sex as the employee.
SELECT e.Fname FROM EMPLOYEE e, DEPENDENT d WHERE e.Fname = d.Dependent_name;

--12. Retrieve the names of employees who have no dependents
SELECT Fname,ssn FROM EMPLOYEE, DEPENDENT WHERE Fname NOT IN (SELECT Dependent_name FROM DEPENDENT);

--13. List the names of managers who have at least one dependent.
SELECT Fname FROM EMPLOYEE,DEPARTMENT1,DEPENDENT WHERE essn = ssn AND mgr_ssn = essn;

--14. Retrieve the Social Security numbers of all employees who work on project numbers 1, 2, or 3.
SELECT essn, pno from WORKS_ON WHERE pno in (1,2,3);

--15. Find the sum of the salaries of all employees, the maximum salary, the minimum salary, and the average salary.
SELECT SUM(salary), MAX(salary), MIN(salary), AVG(salary) from EMPLOYEE;

--16. Find the sum of the salaries of all employees of the ‘Research’ department, as well as the maximum salary, the minimum salary, and the average salary in this department.
SELECT SUM(e.salary), AVG(e.salary), MIN(e.salary), MAX(e.salary) FROM EMPLOYEE e, DEPARTMENT1 d WHERE  e.dno = d.dnumber and e.super_ssn = d.mgr_ssn;

--17. For each project, retrieve the project number, the project name, and the number of employees who work on that project.
WITH Prj(Pno,Count) AS (select Pno, COUNT(*) from WORKS_ON GROUP BY Pno) SELECT Prj.Pno,Pname,Prj.Count FROM Prj, Project WHERE Prj.Pno = Pnumber;

--18. For each project on which more than two employees work, retrieve the project number, the project name, and the number of employees who work on the project.
SELECT p.Pnumber, p.Pname,COUNT(*) FROM PROJECT p, WORKS_ON w WHERE p.Pnumber = w.Pno GROUP BY p.Pnumber, p.Pname HAVING COUNT(*) > 2 ORDER BY p.Pnumber;

