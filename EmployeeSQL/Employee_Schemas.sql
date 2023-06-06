DROP TABLE departments;

-- Create the various tabels needed to import the CSV's
CREATE TABLE "departments" (
    "id" SERIAL   NOT NULL,
    "dept_no" VARCHAR (10)  NOT NULL UNIQUE,
    "dept_name" VARCHAR NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "id"
     )
);

-- Included a select command for each table to ensure a proper import
SELECT * FROM departments;

--Add foreign keys to reference other tables
CREATE TABLE "dept_emp" (
    "id" SERIAL   NOT NULL,
    "emp_no" INT NOT NULL,
    "dept_no" VARCHAR (10) NOT NULL,
	FOREIGN KEY ("emp_no") REFERENCES "employees" ("emp_no"), 
    FOREIGN KEY ("dept_no") REFERENCES "departments" ("dept_no"),
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "id"
     )
);

SELECT * FROM dept_emp;

CREATE TABLE "dept_manager" (
    "id" SERIAL NOT NULL,
	"dept_no" VARCHAR (10)  NOT NULL,
    "emp_no" INT NOT NULL,
    FOREIGN KEY ("emp_no") REFERENCES "employees" ("emp_no"), 
    FOREIGN KEY ("dept_no") REFERENCES "departments" ("dept_no"),
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "id"
     )
);

SELECT * FROM dept_manager;


CREATE TABLE "employees" (
    "id" SERIAL NOT NULL,
    "emp_no" INT NOT NULL UNIQUE,
    "emp_title" VARCHAR (10) NOT NULL,
    "birth_date" DATE NOT NULL,
    "first_name" VARCHAR NOT NULL,
    "last_name" VARCHAR NOT NULL,
    "sex" VARCHAR NOT NULL,
    "hire_date" DATE NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "id"
     ),
	FOREIGN KEY ("emp_title") REFERENCES "titles"("title_id")
);

SELECT * FROM employees;

CREATE TABLE "salaries" (
    "id" SERIAL NOT NULL,
    "emp_no" INT NOT NULL,
    "salary" INT NOT NULL,
	FOREIGN KEY ("emp_no") REFERENCES "employees" ("emp_no"), 
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "id"
     )
);

SELECT * FROM salaries;

CREATE TABLE "titles" (
    "id" SERIAL PRIMARY KEY NOT NULL,
    "title_id" VARCHAR (10) NOT NULL UNIQUE,
    "title" VARCHAR NOT NULL
);
SELECT * FROM titles;