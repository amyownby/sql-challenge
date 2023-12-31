﻿-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/KgCl3n
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Drop the table

-- Create tables
CREATE TABLE `titles` (
    `title_id` VARCHAR(50)  NOT NULL ,
    `title` VARCHAR(50)  NOT NULL ,
    PRIMARY KEY (
        `title_id`
    )
);

CREATE TABLE `employees` (
    `emp_no` INT  NOT NULL ,
    `emp_title_id` VARCHAR(50)  NOT NULL ,
    `birth_date` DATE  NOT NULL ,
    `first_name` VARCHAR(50)  NOT NULL ,
    `last_name` VARCHAR(50)  NOT NULL ,
    `sex` VARCHAR(50)  NOT NULL ,
    `hire_date` DATE  NOT NULL ,
    PRIMARY KEY (
        `emp_no`
    )
);

CREATE TABLE `departments` (
    `dept_no` VARCHAR(50)  NOT NULL ,
    `dept_name` VARCHAR(50)  NOT NULL ,
    PRIMARY KEY (
        `dept_no`
    )
);

CREATE TABLE `dept_manager` (
    `dept_no` VARCHAR(50)  NOT NULL ,
    `emp_no` INTEGER  NOT NULL ,
    PRIMARY KEY (
        `dept_no`,`emp_no`
    )
);

CREATE TABLE `dept_emp` (
    `emp_no` INTEGER  NOT NULL ,
    `dept_no` VARCHAR(50)  NOT NULL ,
    PRIMARY KEY (
        `emp_no`,`dept_no`
    )
);

CREATE TABLE `salaries` (
    `emp_no` INTEGER  NOT NULL ,
    `salary` INTEGER  NOT NULL ,
    PRIMARY KEY (
        `emp_no`
    )
);

ALTER TABLE `employees` ADD CONSTRAINT `fk_employees_emp_title_id` FOREIGN KEY(`emp_title_id`)
REFERENCES `titles` (`title_id`);

ALTER TABLE `dept_manager` ADD CONSTRAINT `fk_dept_manager_dept_no` FOREIGN KEY(`dept_no`)
REFERENCES `departments` (`dept_no`);

ALTER TABLE `dept_manager` ADD CONSTRAINT `fk_dept_manager_emp_no` FOREIGN KEY(`emp_no`)
REFERENCES `employees` (`emp_no`);

ALTER TABLE `dept_emp` ADD CONSTRAINT `fk_dept_emp_emp_no` FOREIGN KEY(`emp_no`)
REFERENCES `employees` (`emp_no`);

ALTER TABLE `dept_emp` ADD CONSTRAINT `fk_dept_emp_dept_no` FOREIGN KEY(`dept_no`)
REFERENCES `departments` (`dept_no`);

ALTER TABLE `salaries` ADD CONSTRAINT `fk_salaries_emp_no` FOREIGN KEY(`emp_no`)
REFERENCES `employees` (`emp_no`);

