DROP TABLE STUDENT;
CREATE TABLE student(
student_id INT PRIMARY KEY,
name VARCHAR(20),
major VARCHAR(20)

);

DESCRIBE student;

#ALTER TABLE student ADD gpa DECIMAL(3,2);

#ALTER TABLE student DROP COLUMN gpa;

INSERT INTO STUDENT VALUES(1,'Jack','Biology');
INSERT INTO STUDENT VALUES(2,'Kate','Sociology');
INSERT INTO STUDENT VALUES(3,'Claire','Chemistry');
INSERT INTO STUDENT VALUES(4,'Jack','Biology');
INSERT INTO STUDENT VALUES(5,'Mike','Comp. Sci.');

SELECT * FROM STUDENT;
SET SQL_SAFE_UPDATES = 0;


UPDATE student SET major = 'Bio' where major = 'Biology';

update student SET major = 'Comp. Sci.' WHERE student_id = 4;

UPDATE student SET major = 'BioChemistry' WHERE major = 'Bio' or major = 'Chemistry';

UPDATE student SET name = 'Ravi', major = 'undecided' WHERE student_id = 1;


SELECT name, major FROM student ORDER BY name DESC;

SELECT * FROM student ORDER BY major, student_id; 

SELECT * FROM student ORDER BY name LIMIT 3;

SELECT name, major FROM student WHERE major = 'Biology' OR name = 'Mike';   

SELECT * FROM student WHERE student_id <= 3 AND name  <> 'Jack';

SELECT * FROM student WHERE name IN ('Jack','Mike','Claire');

SELECT * FROM student WHERE major IN ('Chemistry', 'Biology') AND student_id > 2;