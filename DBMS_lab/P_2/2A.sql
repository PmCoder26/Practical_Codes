use dbms_ASsignments;



-- creating the department table
CREATE TABLE IF NOT EXISTS DEPT(
	DEPTNO NUMERIC(2) PRIMARY KEY NOT NULL,
	DNAME VARCHAR(20) NOT NULL,
	LOC VARCHAR(10)
);

-- creating the employee table.
CREATE TABLE IF NOT EXISTS EMP(
    EMPNO NUMERIC(5) PRIMARY KEY NOT NULL,  
    ENAME VARCHAR(20) NOT NULL,    
    JOB CHAR(10),                  
    SSN NUMERIC(10) UNIQUE,        
    HIREDATE DATETIME,             
    COMM NUMERIC(7, 2) CHECK (COMM > 5000),
    BRANCH VARCHAR(10) DEFAULT 'FC Road', 
    DEPTNO NUMERIC(2),    
);


INSERT INTO DEPT(DEPTNO, DNAME, LOC)
VALUES
(10, 'ACCOUNTING', 'NEW YORK'),
(20, 'RESEARCH', 'DALLAS'),
(30, 'SALES', 'CHICAGO'),
(40, 'OPERATIONS', 'BOSTON');

INSERT INTO EMP(EMPNO, ENAME, JOB, SSN, HIREDATE, COMM, BRANCH, DEPTNO)
VALUES
(1, 'Alice', 'Manager', 1234567890, '2023-01-15', 6000.00, 'Main St', 10),
(2, 'Bob', 'Engineer', 2345678901, '2023-02-20', 7200.00, 'Central', 20),
(3, 'Charlie', 'Clerk', 3456789012, '2023-03-10', 5500.00, 'Oak St', 30),
(4, 'David', 'Analyst', 4567890123, '2023-04-25', 8000.00, 'Pine St', 10),
(5, 'Eve', 'Engineer', 5678901234, '2023-05-30', 7500.00, 'Maple', 20),
(6, 'Frank', 'Clerk', 6789012345, '2023-06-15', 6200.00, 'Elm St', 30),
(7, 'Grace', 'Manager', 7890123456, '2023-07-10', 8500.00, 'Cedar', 10),
(8, 'Hank', 'Technician', 8901234567, '2023-08-20', 6800.00, 'Birch', 20),
(9, 'Ivy', 'Clerk', 9012345678, '2023-09-05', 6000.00, 'Willow', 30),
(10, 'Jack', 'Manager', 1234509876, '2023-10-15', 9000.00, 'Spruce', 10);


ALTER TABLE EMP ADD COLUMN SAL NUMERIC(9, 2);

SELECT * FROM EMP;

CREATE UNIQUE INDEX INDEX_SSN ON EMP(SSN);

CREATE VIEW EMP_V1 AS SELECT EMPNO, ENAME, JOB, HIREDATE FROM EMP;
SELECT * FROM EMP_V;

CREATE SEQUENCE SEQ
INCREMENT BY 1
START WITH 1 
MINVALUE 1 MAXVALUE 25
CYCLE;

CREATE SYNONYM Department FOR DEPT;

ALTER TABLE DEPT DROP PRIMARY KEY;
