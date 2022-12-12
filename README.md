# Pewlett-Hackard-Analysis
## Employee Retirement Analysis

Code ref: Pandas, Python 3.7.6, SQL, VSCode

### Overview of Project

The purpose of this analysis was to identify all employees eligible for retirment, the number of employees retiring, and which employees are eligible for a mentorship program.

## Dev 1: Retrievie the Number of Retiring Employees by Title
file reference: retiring_titles.csv
### Results: 
1. Employee data from employee.csv and title data from titles.csv where collected in tables and combined. Filtering by birth_date between 1952-01-01 and 1955-12-31 then ordering by employee number. A new table was created to hold this data.

![Emp_title_birth](https://user-images.githubusercontent.com/115188500/207109337-ffbe0156-22fa-4863-8165-0589292b0bb0.png)


2. Further filtering using Distinct by creating a new table to sort through current employees and counting the occurance of unique titles. 

- The table below shows that there are 7 unique titles
- The senior engineer title category contains the most number of employees ready to retire
- The manager title category contains the least number of employees ready to retire
- Total number of employees ready to retire: 46,542

![Emp_unique_title_count](https://user-images.githubusercontent.com/115188500/207110360-3f6b1e68-72ac-4e7f-afc3-63cc59d5e5fb.png)


3. Created a new table: unique_titles to sort in ascending order by employee number and descending order by the last date of the most recent title.

- From this table we can determine that 2382 employees are eligble for the mentorship program

![Emp_unique_title_list](https://user-images.githubusercontent.com/115188500/207110307-1021633e-f92b-4d16-a646-0a950dfa49ce.png)


## Dev 2: Employees Eligible for Menroship Program
file reference: mentorship_eligibility.csv
### Results:
1. Created a new table to collect data containing current employeees who were born between January 1, 1965 and December 31, 1965 and which employees are eligible for the menroship program.

2. Joined 3 data tables from employee.csv, dept_emp.csv, and titles.csv. Filtered the data on the to_date to collect current employees then filtered by birth_date to collect employees between January 1, 1965 and December 31, 1965. Ordered the table by employee number.

![Emp_mentorship_table](https://user-images.githubusercontent.com/115188500/207111914-8f5ec5c4-5c7c-4a22-b584-08335c2eb023.png)


### Summary
From the mentorship table we can determine that 2382 employees are eligible for the mentorship program.

