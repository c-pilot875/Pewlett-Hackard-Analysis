CREATE TABLE departments (
  dept_no VARCHAR(4) NOT NULL,
  dept_name VARCHAR(40) NOT NULL,
  PRIMARY KEY (dept_no),
  UNIQUE (dept_name)
);

CREATE TABLE employees (
  emp_no INT NOT NULL,
  birth_date DATE NOT NULL,
  first_name VARCHAR NOT NULL,
  last_name VARCHAR NOT NULL,
  gender VARCHAR NOT NULL,
  hire_date DATE NOT NULL,
  PRIMARY KEY (emp_no)
);

CREATE TABLE dept_manager (
	dept_no VARCHAR(4) NOT NULL,
	emp_no INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR(4) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE titles (
	emp_no INT NOT NULL,
	title VARCHAR(50) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no, title, from_date)
);

CREATE TABLE salaries (
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no, from_date)
);

--creating a new table by joining emplpyees and titles table and filtering by birth date

SELECT e.emp_no,
	e.first_name,
	e.last_name,
t.title,
t.to_date,
t.from_date

INTO retirment_titles

FROM employees as e

INNER JOIN titles as t
ON e.emp_no = t.emp_no
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no

--creating a new table to filter current employees

SELECT DISTINCT ON (emp_no) emp_no, first_name,
last_name,
title

INTO unique_titles
FROM retirment_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

--creating new table to count and filter titles to export

SELECT COUNT (title), title
INTO retiring_titles
FROM unique_titles 
GROUP BY title
ORDER BY COUNT(title) DESC;

--creating a new table to show eligibel employees for mentorship program, 
--filtering by to_date and birth_date

SELECT DISTINCT (e.emp_no),
	e.first_name,
	e.last_name,
	e.birth_date,
de.from_date,
de.to_date,
	t.title
	
INTO mentorship_eligible

FROM employees as e

INNER JOIN dept_emp as de 
ON e.emp_no = de.emp_no 

INNER JOIN titles as t
ON e.emp_no = t.emp_no

WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND de.to_date = '9999-01-01'
ORDER BY e.emp_no, e.emp_no DESC;