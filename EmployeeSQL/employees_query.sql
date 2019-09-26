-- List the following details of each employee: employee number, last name, first name, gender, and salary.
select employees.emp_no, employees.first_name, employees.last_name, employees.gender, salaries.salary from employees
join salaries
on employees.emp_no = salaries.emp_no
;


-- List employees who were hired in 1986.
select first_name, last_name, hire_date 
from employees 
WHERE hire_date between '1986-01-01' AND '1986-12-31'
;



-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
select departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name, dept_manager.from_date,dept_manager.to_date
from departments 
join dept_manager
on departments.dept_no = dept_manager.dept_no 
join employees 
on dept_manager.emp_no = employees.emp_no
;



-- List the department of each employee with the following information: employee number, last name, first name, and department name.
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name 
from employees
join dept_emp 
on dept_emp.emp_no = employees.emp_no
join departments 
on departments.dept_no = dept_emp.dept_no
;


-- List all employees whose first name is "Hercules" and last names begin with "B."
select employees.first_name, employees.last_name 
from employees 
where first_name = 'Hercules' and last_name like 'B%'
;


-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
select dept_emp.emp_no, employees.first_name, employees.last_name, departments.dept_name 
from employees
join dept_emp
on employees.emp_no = dept_emp.emp_no
join departments
on dept_emp.dept_no = departments.dept_no
where dept_name = 'Sales'
;


-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select dept_emp.emp_no, employees.first_name, employees.last_name, departments.dept_name from employees
join dept_emp
on employees.emp_no = dept_emp.emp_no
join departments
on dept_emp.dept_no = departments.dept_no
where departments.dept_name = 'Sales' or departments.dept_name = 'Development'
;


--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select employees.last_name, count(employees.last_name) from employees 
group by employees.last_name
order by count(last_name) DESC;