CREATE DATABASE ford;
USE ford;
CREATE TABLE positionTable (
    position_id INT(10) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    descr VARCHAR(50) NOT NULL
);
CREATE TABLE division (
    division_id INT(10) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);
CREATE TABLE store (
    store_id INT(10) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    address VARCHAR(60) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50) NOT NULL,
    zip INT(20) NOT NULL,
    phone VARCHAR(30) NOT NULL,
    sales VARCHAR(10) NOT NULL
);
CREATE TABLE employee (
    employee_id INT(10) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    name VARCHAR(60) NOT NULL,
    contract_date VARCHAR(20) NOT NULL,
    birth_date VARCHAR(20) NOT NULL
);
CREATE TABLE payroll (
    employee_id INT(10) NOT NULL PRIMARY KEY,
    eff_date VARCHAR(30) NOT NULL,
    position_id INT(10) NOT NULL,
    division_id INT(10) NOT NULL,
    salary DOUBLE NOT NULL,
    FOREIGN KEY (employee_id)
        REFERENCES employee (employee_id),
    FOREIGN KEY (position_id)
        REFERENCES positionTable (position_id),
    FOREIGN KEY (division_id)
        REFERENCES division (division_id)
);