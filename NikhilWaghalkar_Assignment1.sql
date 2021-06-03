SELECT * FROM hr.countries;
SELECT * FROM hr.departments;
SELECT * FROM hr.employees;
SELECT * FROM hr.job_history;
SELECT * FROM hr.jobs;
SELECT * FROM hr.locations;
SELECT * FROM hr.regions;
use hr;
#Que_1_=============================================================================================
SELECT first_name "First Name",  last_name "Last Name" FROM employees;
#Que_2_=============================================================================================
SELECT DISTINCT department_id FROM employees;
#Que_3_=============================================================================================
SELECT * FROM employees ORDER BY first_name DESC;
#Que_4_=============================================================================================
SELECT first_name, last_name, salary, salary*.15 PF FROM employees;
#Que_5_=============================================================================================
SELECT employee_id, first_name, last_name, salary FROM employees ORDER BY salary;
#Que_6_=============================================================================================
SELECT SUM(salary) FROM employees;
#Que_7_=============================================================================================
SELECT MAX(salary), MIN(salary) FROM employees;
#Que_8_=============================================================================================
SELECT AVG(salary), COUNT(*) FROM employees;
#Que_9_=============================================================================================
SELECT COUNT(*) FROM employees;
#Que_10_=============================================================================================
SELECT COUNT(DISTINCT job_id) FROM employees;
#Que_11_=============================================================================================
SELECT UPPER(first_name) FROM employees;
#Que_12_=============================================================================================
SELECT SUBSTRING(first_name,1,3) FROM employees;
#Que_13_=============================================================================================
SELECT TRIM(first_name) FROM employees;
#Que_14_=============================================================================================
SELECT first_name,last_name, LENGTH(first_name)+LENGTH(last_name)  'Length of  Names'
 FROM employees;
#Que_15_=============================================================================================
SELECT * FROM employees WHERE  first_name REGEXP  '[0-9]';
#Que_16_=============================================================================================
SELECT first_name, last_name, salary FROM employees WHERE salary NOT BETWEEN 10000 AND 15000;
#Que_17_=============================================================================================
SELECT first_name, last_name, department_id FROM employees WHERE department_id IN (30, 100) 
ORDER BY  department_id  ASC;
#Que_18_=============================================================================================
SELECT first_name, last_name, salary, department_id FROM employees
WHERE salary NOT BETWEEN 10000 AND 15000  AND department_id IN (30, 100);
#Que_19_=============================================================================================
SELECT first_name, last_name, hire_date FROM employees WHERE YEAR(hire_date)  LIKE '1987%';
#Que_20_=============================================================================================
SELECT first_name FROM employees WHERE first_name LIKE '%b%' AND first_name LIKE '%c%';
#Que_21_=============================================================================================
SELECT last_name, job_id, salary FROM employees 
WHERE job_id IN ('IT_PROG', 'SH_CLERK') AND salary NOT IN (4500,10000, 15000);
#Que_22_=============================================================================================
SELECT last_name FROM employees WHERE last_name LIKE '______';
#Que_23_=============================================================================================
SELECT last_name FROM employees WHERE last_name LIKE '__e%';
#Que_24_=============================================================================================
SELECT job_id, GROUP_CONCAT(employee_id, ' ')  'Employees ID' FROM employees GROUP BY job_id;
#Que_25_=============================================================================================
UPDATE employees SET phone_number = REPLACE(phone_number, '124', '999') WHERE phone_number LIKE '%124%';
#Que_26_=============================================================================================
SELECT * FROM employees WHERE LENGTH(first_name) >= 8;
#Que_27_=============================================================================================
UPDATE employees SET email = CONCAT(email, '@example.com');
#Que_28_=============================================================================================
SELECT RIGHT(phone_number, 4) as 'Ph.No.' FROM employees;
#Que_29_=============================================================================================
SELECT location_id, street_address,
SUBSTRING_INDEX(REPLACE(REPLACE(REPLACE(street_address,',',' '),')',' '),'(',' '),' ',-1) 
AS 'Last--word-of-street_address' FROM locations;
#Que_30_=============================================================================================
SELECT * FROM locations WHERE LENGTH(street_address) <= (SELECT  MIN(LENGTH(street_address)) 
FROM locations);
#Que_31_=============================================================================================
SELECT job_title, SUBSTR(job_title,1, INSTR(job_title, ' ')-1) FROM jobs;
#Que_32_=============================================================================================
SELECT first_name, last_name FROM employees WHERE INSTR(last_name,'C') > 2;
#Que_33_=============================================================================================
SELECT first_name "Name",LENGTH(first_name) "Length" 
FROM employees WHERE first_name LIKE 'J%' OR first_name LIKE 'M%' OR first_name LIKE 'A%' 
ORDER BY first_name ;
#Que_34_=============================================================================================
SELECT first_name,LPAD(salary, 10, '$') SALARY FROM employees;
#Que_35_=============================================================================================
SELECT left(first_name, 8),
REPEAT('$', FLOOR(salary/1000))
'SALARY($)',salary
FROM employees
ORDER BY salary DESC;
#Que_36_=============================================================================================
SELECT employee_id,first_name,last_name,hire_date 
FROM employees 
WHERE POSITION("07" IN DATE_FORMAT(hire_date, '%d %m %Y'))>0;

use northwind;
SELECT * FROM northwind.categories;
SELECT * FROM northwind.customers;
SELECT * FROM northwind.employees;
SELECT * FROM northwind.order details;
SELECT * FROM northwind.orders;
SELECT * FROM northwind.products;
SELECT * FROM northwind.shippers;
SELECT * FROM northwind.suppliers;
#Que_1_=============================================================================================
SELECT ProductName, QuantityPerUnit 
FROM Products;
#Que_2_=============================================================================================
SELECT ProductID, ProductName
FROM Products;
#Que_3_=============================================================================================
SELECT ProductID, ProductName
FROM Products
WHERE Discontinued = 1; 
#Que_4_=============================================================================================
SELECT ProductName, UnitPrice 
FROM Products 
ORDER BY UnitPrice DESC;
#Que_5_=============================================================================================
SELECT ProductID, ProductName, UnitPrice
FROM Products
WHERE (((UnitPrice)<20) AND ((Discontinued)=False))
ORDER BY UnitPrice DESC;
#Que_6_=============================================================================================
SELECT ProductName, UnitPrice
FROM Products
WHERE (((UnitPrice)>=15 And (UnitPrice)<=25) 
AND ((Products.Discontinued)=False))
ORDER BY Products.UnitPrice DESC;
#Que_7_=============================================================================================
SELECT DISTINCT ProductName, UnitPrice
FROM Products
WHERE UnitPrice > (SELECT avg(UnitPrice) FROM Products)
ORDER BY UnitPrice;
#Que_8_=============================================================================================
SELECT DISTINCT ProductName as Twenty_Most_Expensive_Products, UnitPrice
FROM Products AS a
WHERE 20 >= (SELECT COUNT(DISTINCT UnitPrice)
FROM Products AS b
WHERE b.UnitPrice >= a.UnitPrice)
ORDER BY UnitPrice desc;
#Que_9_=============================================================================================
SELECT Count(ProductName)
FROM Products
GROUP BY Discontinued;
#Que_10_=============================================================================================
SELECT ProductName,  UnitsOnOrder , UnitsInStock
FROM Products
WHERE (((Discontinued)=False) AND ((UnitsInStock)<UnitsOnOrder));