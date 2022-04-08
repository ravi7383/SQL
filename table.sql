CREATE TABLE employee(
emp_id INT PRIMARY KEY,
first_name VARCHAR(20),
last_name VARCHAR(20),
birth_day DATE,
sex VARCHAR(1),
salary INT,
super_id INT,
branch_id INT
);


CREATE TABLE branch(
branch_id INT PRIMARY KEY,
branch_name VARCHAR(40),
mrg_id INT,
mrg_start_date DATE,
FOREIGN KEY(mrg_id) REFERENCES employee(emp_id) ON DELETE SET NULL
);


ALTER TABLE employee
ADD FOREIGN KEY(branch_id) 
references branch(branch_id) ON DELETE SET NULL;

ALTER TABLE employee
ADD FOREIGN KEY(super_id)
references employee(emp_id) ON DELETE SET NULL;

CREATE TABLE client(
client_id INT PRIMARY KEY,
client_name VARCHAR(40),
branch_id INT,
FOREIGN KEY(branch_id) references branch(branch_id) ON DELETE SET NULL

);

CREATE TABLE work_with(
emp_id INT,
client_id INT,
total_sales INT,
PRIMARY KEY(emp_id,client_id),
FOREIGN KEY(emp_id) references employee(emp_id) ON DELETE cascade,
FOREIGN KEY(client_id) references client(client_id) ON DELETE CASCADE
);


CREATE TABLE branch_supplier(
branch_id INT,
supplier_name VARCHAR(40),
supply_type VARCHAR(40),
PRIMARY KEY(branch_id, supplier_name),
FOREIGN KEY(branch_id) references branch(branch_id) ON DELETE CASCADE
);














