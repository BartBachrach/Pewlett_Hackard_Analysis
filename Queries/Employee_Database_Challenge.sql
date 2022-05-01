SELECT e.emp_no, e.first_name, 
		e.last_name,
		 titles.title, titles.from_date,
		titles.to_date
INTO retirement_titles
FROM employees AS e
INNER JOIN titles
ON e.emp_no = titles.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31');

SELECT * FROM retirement_titles;

SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_titles as rt
WHERE rt.to_date = '9999-01-01'
ORDER BY rt.emp_no, rt.to_date DESC;

SELECT * FROM unique_titles;

SELECT COUNT (ut.emp_no), ut.title 
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY COUNT (ut.emp_no) DESC;

SELECT * FROM retiring_titles;

SELECT DISTINCT ON (e.emp_no, titles.title) e.emp_no, e.first_name,
	e.last_name, e.birth_date,
	de.from_date, de.to_date,
	titles.title
INTO mentorship_eligibility
FROM employees AS e
INNER JOIN dept_emp AS de
ON e.emp_no = de.emp_no
INNER JOIN titles
ON e.emp_no = titles.emp_no
WHERE (titles.to_date = '9999-01-01')
	AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no ASC;

SELECT * FROM mentorship_eligibility;


