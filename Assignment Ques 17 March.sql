Q1. -- Query to retrieve only the odd numbered rows. 

SELECT * FROM (
               SELECT first_name, 
                      rownum rn 
				 FROM xxkpmg_employees_master_stg_ak					
			 ORDER BY first_name
			 ) 
        WHERE  MOD (rn, 2) <> 0;
		
Q2. -- Retrieve the name of employee with manager id IS NULL. 

SELECT * FROM xxkpmg_employees_master_stg_ak
         WHERE manager_id IS NULL

Q3. -- Display the salary and name of employee in every department who has the minimum salary

SELECT XEMA.first_name, XEMA.salary, XEMA.department_id
  FROM xxkpmg_employees_master_stg_ak XEMA
 WHERE salary = (SELECT MIN(salary) FROM xxkpmg_employees_master_stg_ak WHERE department_id=XEMA.department_id)
  
Q4. -- Write a single query to get first 100 number in dummy(1...100) table.

SELECT Level AS FIRST_HUNDRED_NUMBERS
FROM Dual 
CONNECT BY Level <= 100

Q5.  Query to print the following
o	-Get hire date from user
o	-If hire date is in JAN, print 'Welcome to January...!' 
o	-If hire date is in FEB, print 'Welcome to February...!'
o	-....
o	-If hire date is in DEC, print 'Welcome to December...!' 

SELECT XEMA.hire_date
     , XEMA.first_name ||' '||XEMA.last_name        "NAME"
     , XEMA.salary
     , XDA.department_name
     , EXTRACT (YEAR FROM TO_DATE(XEMA.hire_date)) "YEAR"
     , TO_CHAR(XEMA.hire_date,'fmMonth')           "MONTH"
     , CASE TO_CHAR(XEMA.hire_date,'fmMonth')WHEN 'January'  THEN 'Welcome to January'
                                             WHEN 'February' THEN 'Welcome to February'
                                             WHEN 'March'    THEN 'Welcome to March'
                                             WHEN 'April'    THEN 'Welcome to April'
                                             WHEN 'May'      THEN 'Welcome to May'
                                             WHEN 'June'     THEN 'Welcome to June'
                                             WHEN 'July'     THEN 'Welcome to July'
                                             WHEN 'August'   THEN 'Welcome to August'
                                             WHEN 'September'THEN 'Welcome to September'
                                             WHEN 'October'  THEN 'Welcome to October'
                                             WHEN 'November' THEN 'Welcome to November'
                                             WHEN 'December' THEN 'Welcome to December'
                                END "Message"
  FROM xxkpmg_employees_master_stg_ak   XEMA
     , xxkpmg_department_ak XDA
 WHERE XEMA.department_id = XDA.department_id

 
Q6.-- Query to list all the Employee names in a single row

    SELECT    MIN(DECODE(first_name,'Alexander','Alexander')) "1"
			, MIN(DECODE(first_name,'Bruce','Bruce'))        "2"
			, MIN(DECODE(first_name,'Curtis','Curtis'))      "3"
			, MIN(DECODE(first_name,'Diana','Diana'))        "4"
			, MIN(DECODE(first_name,'Kevin','Kevin'))        "5"
			, MIN(DECODE(first_name,'Lex','Lex'))            "6"
			, MIN(DECODE(first_name,'Neena','Neena'))        "7"
			, MIN(DECODE(first_name,'Randall','Randall'))    "8"
			, MIN(DECODE(first_name,'Trenna','Trenna'))      "9"
			, MIN(DECODE(first_name,'Vibhor','Vibhor'))      "10"
       
     FROM  xxkpmg_employees_master_stg_ak