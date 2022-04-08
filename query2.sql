

-- find all empl order by slaray
select * from employee order by salary;

-- Find all employees ordered by sex then name
select * from employee order by sex,  first_name;

-- Find the first 5 employees in the table
select * from employee limit 5; 

-- Find the first and last names of all employees
select employee.first_name, employee.last_name from employee;

-- Find the forename and surnames names of all employees
select first_name as forename , last_name as surname from employee;


-- Find out all the different genders
select DISTINCT sex from employee;

-- Find all male employees
select * from employee where sex = 'M';

-- Find all employees at branch 2
select * from employee where branch_id = 2;

-- Find all employee's id's and names who were born after 1969
select emp_id, first_name, last_name from employee where birth_day >= 1970-01-01;

-- Find all female employees at branch 2
select * from employee where branch_id = 2 and sex = 'F';

-- Find all employees who are female & born after 1969 or who make over 80000
select * from employee where (sex = 'F' and birth_day >= 1970-01-01) or salary > 80000;

-- Find all employees born between 1970 and 1975
select * from employee where birth_day between '1970-01-01' and '1975-01-01';

-- Find all employees named Jim, Michael, Johnny or David
select * from employee where first_name in ('Jim','Michael','Johnny','David');


-- Function
-- Find the number of employees
select count(super_id) from employee;

-- Find the average of all employee's salaries
select avg(salary) from employee;

-- Find the sum of all employee's salaries
select sum(salary) from employee;

-- Find out how many males and females there are
select count(sex), sex from employee group by sex;


select * from work_with;
-- Find the total sales of each salesman
select sum(total_sales),emp_id from work_with group by emp_id;

-- Find the total amount of money spent by each client
SELECT SUM(total_sales), client_id FROM work_with GROUP BY client_id;


-- Wildcards
select * from client;
-- Find any client's who are an LLC
select * from client where client_name like '%LLC';


select * from branch_supplier;
-- Find any branch suppliers who are in the label business
select * from branch_supplier where supplier_name like '% Label%';

select * from employee;
-- Find any employee born on the 10th day of the month
select * from employee where birth_day like '_____10%';

-- Find any clients who are schools
select * from client where client_name like '%school%';
select * from branch;

-- Find a list of employee and branch names
select employee.first_name as emp_branch_name 
from employee
union
select branch.branch_name
from branch;

select * from client;
select * from branch_supplier;
-- Find a list of all clients & branch suppliers' names
select client.client_name as non_emp_entities, client.branch_id as Branch_id from client
union
select branch_supplier.supplier_name, branch_supplier.branch_id from branch_supplier;

-- Joins
-- Add the extra branch
INSERT INTO branch VALUES(4, "Buffalo", NULL, NULL);

-- find all branches and the name of their managers
select employee.emp_id, employee.first_name, branch.branch_name
from employee
join branch
on employee.emp_id = branch.mrg_id;


-- Nested Queries
select * from employee;
select * from work_with;
select * from client;
select * from branch;
-- Find names of all employees who have sold over 50,000
select employee.first_name, employee.last_name from employee
where employee.emp_id in (select work_with.emp_id from work_with where total_sales > 50000);

-- Find all clients who are handles by the branch that Michael Scott manages
-- Assume you know Michael's ID
select client.client_name,client.branch_id from client 
where client.branch_id in (select branch.branch_id from branch where branch.mrg_id = 102);


 -- Find all clients who are handles by the branch that Michael Scott manages
 -- Assume you DONT'T know Michael's ID
 select client.client_name,client.branch_id from client
 where client.branch_id = (
 select branch.branch_id from branch
 where branch.mrg_id = (select employee.branch_id from employee where employee.first_name = 'Michael'and  employee.last_name = 'Scott' )
 
 );



 -- Find the names of employees who work with clients handled by the scranton branch
select employee.first_name, employee.last_name
from employee 
where employee.emp_id in (
select work_with.emp_id 
from work_with 
)
and employee.branch_id = 2;

select * from employee;
select * from client;
select * from branch;
select * from work_with;
select * from branch_supplier;
-- Find the names of all clients who have spent more than 100,000 dollars
SELECT client.client_name
FROM client
WHERE client.client_id IN (
                          SELECT client_id
                          FROM (
                                SELECT SUM(work_with.total_sales) AS totals, client_id
                                FROM work_with
                                GROUP BY client_id) as total_sales_client
                          WHERE totals > 100000
);





 
 
  
