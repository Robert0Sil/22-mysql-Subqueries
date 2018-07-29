# 1) Write a query to find the name (FIRST_NAME, LAST_NAME)
#  and salary of the employees who earn a salary that is higher than
#  the salary of all the Shipping Clerks (JOB_ID = 'SH_CLERK').
#  Sort the results of the salary of the lowest to highest. Employees

SELECT FIRST_NAME, LAST_NAME, SALARY
FROM Employees
WHERE SALARY > (
  SELECT MAX_SALARY
  FROM Jobs
  WHERE JOB_ID = 'SH_CLERK'
) ORDER BY SALARY ASC;

# 2) Write a query to find the name (FIRST_NAME, LAST_NAME) of the employees
#  who are not supervisors. Employees

SELECT FIRST_NAME, LAST_NAME, SALARY
FROM Employees
WHERE EMPLOYEE_ID <> MANAGER_ID
ORDER BY SALARY ASC;

# 3) Write a query to display the employee ID, first name, last name, and department names of all employees.
#    Employees, Departments

SELECT Employees.FIRST_NAME, Employees.LAST_NAME, Employees.SALARY, Departments.DEPARTMENT_NAME
FROM Employees
INNER JOIN Departments
  ON Departments.DEPARTMENT_ID = Employees.DEPARTMENT_ID
ORDER BY SALARY ASC;

# 4) Write a query to display the employee ID, first name, last name, salary of all employees
#   whose salary is above average for their departments.
#   Employees, Departments

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID
FROM Employees
WHERE
  Salary > (
    SELECT AVG(Salary)
    FROM Employees
  )
  ORDER BY DEPARTMENT_ID DESC;

# 5) Write a query to fetch even numbered records from employees table. Employees

SELECT FIRST_NAME, LAST_NAME, SALARY
FROM Employees
WHERE mod(EMPLOYEE_ID, 2) = 0
ORDER BY SALARY ASC;

# 6) Write a query to find the 5th maximum salary in the employees table. Employees

SELECT FIRST_NAME, LAST_NAME, SALARY, JOB_ID
FROM Employees
WHERE SALARY = (
    SELECT DISTINCT SALARY
    FROM Employees
    ORDER BY SALARY DESC
    LIMIT 4,1
)
ORDER BY JOB_ID ASC;

# 7) Write a query to find the 4th minimum salary in the employees table. Employees


SELECT FIRST_NAME, LAST_NAME, SALARY, JOB_ID
FROM Employees
WHERE SALARY = (
    SELECT DISTINCT SALARY
    FROM Employees
    ORDER BY SALARY ASC
    LIMIT 3,1
)
ORDER BY JOB_ID ASC;

# 8) Write a query to select last 10 records from a table. Employees

SELECT FIRST_NAME, LAST_NAME, SALARY, HIRE_DATE
FROM Employees
WHERE HIRE_DATE > (
    SELECT DISTINCT HIRE_DATE
    FROM Employees
    ORDER BY HIRE_DATE DESC
    LIMIT 10,1
)
ORDER BY HIRE_DATE ASC;

# 9) Write a query to list the department ID and name of all the departments
#   where no employee is working. Employees, Departments

SELECT DEPARTMENT_ID, DEPARTMENT_NAME
FROM Departments
WHERE DEPARTMENT_ID NOT IN (
    SELECT DISTINCT DEPARTMENT_ID
    FROM Employees
)
ORDER BY DEPARTMENT_ID ASC;

# 10) Write a query to get the 3 maximum salaries. Employees

SELECT FIRST_NAME, LAST_NAME, SALARY, JOB_ID
FROM Employees
WHERE SALARY > (
    SELECT DISTINCT SALARY
    FROM Employees
    ORDER BY SALARY DESC
    LIMIT 3,1
)
ORDER BY JOB_ID ASC;

# 11) Write a query to get the 3 minimum salaries. Employees

SELECT FIRST_NAME, LAST_NAME, SALARY, JOB_ID
FROM Employees
WHERE SALARY < (
    SELECT DISTINCT SALARY
    FROM Employees
    ORDER BY SALARY ASC
    LIMIT 3,1
)
ORDER BY JOB_ID ASC;
