# SQL query examples

In this example, SQL database was established based on a number of sample CSV files:
  * departments
  * dept_emp
  * dept_manager
  * employees
  * salaries
  * titles

### Several major steps were taken to set up the SQl databse, including:

#### Data Modeling
* CSV files were first inspected
* ERD (Entity Relationship Diagram) was constructed using [http://www.quickdatabasediagrams.com](http://www.quickdatabasediagrams.com).

#### Data Engineering

* Created a table schema for each of the six CSV files, including specifying data types, primary keys, foreign keys, and other constraints.

* Imported each CSV file into the corresponding SQL table.

#### Data Analysis and Summary 
##### see `ouput` folder for corresponding examples of SQL query results

  * **1_empno_ln_fn_sal.csv** - Details of each employee: employee number, last name, first name, gender, and salary.
  * **2_hiredin86.csv** - Employees who were hired in 1986.
  * **3_manger_info.csv** - Managers from each department including department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
  * **4_empno_ln_fn_dept.csv** - Department each employee belongs to, including employee number, last name, first name, and department name.
  * **5_herculesb.csv** - Identification of all employees with specific first and last name, e.g., first name "Hercules" and last names that begin with "B."
  * **6_empno_ln_fn_salesdpt.csv** - List of all employees in the Sales department, including their employee number, last name, first name, and department name.
  * **7_empno_ln_fn_sales_dev_dpts.csv** - List of all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
  * **8_lastname_counts.csv** - List the frequency count of employee last names, i.e., how many employees share each last name, presented in descending order.
  * **9_extra.csv** and `analysis_9_extra.ipynb` - Summary of salar by position and query based on specific employee ID #.
