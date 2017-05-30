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
    payrool_id INT(10) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    employee_id INT(10) NOT NULL,
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
insert into positionTable(descr)values
('Secretary'),
('Operator'),
('Quality Assurance'),
('Consultant'),
('Operation Manager'),
('Systems Engineer'),
('Software Engineer'),
('Manager'),
('Departmen Head'),
('CEO');
insert into division(name)values
('Sales'),
('Production'),
('Marketing'),
('Human Resources'),
('Infformation Technology');
insert into store(name,address,city,state,zip,phone,sales)values
('Palma','18 main St','Oakland','CA','94345','717-822-5627','E'),
('Floresta','22 King St','Oakland','CA','94345','717-822-3322','B'),
('Vista Bella','34 Market St','Okland','CA','94346','717-801-5699','B'),
('Vista Hermosa','17 North St','Oakland','CA','94346','717-801-2347','E'),
('Circuito','45 South St','Oakland','CA','94345','717-822-6234','E'),
('SL Teecnologia','345 Main Rd','Oakland','CA','94349','717-829-5157','G'),
('Tecnologia Azul','554 Sun Rd','Hoboken','NJ','94007','201-217-2133','E'),
('Buen Carro','23 Luz Dr','Hoboken','NJ','94006','201-216-2525','G'),
('Tecnologia Verde','34 Koala Rd','Hokoken','NJ','94006','201-216-9987','B'),
('Solo lo Mejor','343 Oak St','Hoboken','NJ','94007','201-217-5627','E');
insert into employee(name,contract_date,birth_date)values
('Martinez, Oscar','1998-01-05','1970-03-05'),
('Lou, Tim','1982-01-15','1952-02-22'),
('Lee Xu','199-05-25','1972-03-18'),
('Ley, Martin','1980-12-05','1950-06-10'),
('Ley, Joseph','1970-04-22','1959-11-11');
insert into payroll(employee_id,eff_date,position_id,division_id,salary)values
('1','1998-01-05','1','1','18000.00'),
('1','1999-04-22','1','1','28000.00'),
('1','1999-12-22','2','1','32000.00'),
('1','2000-04-10','3','4','33000.00'),
('1','2001-11-15','3','4','33500.00'),
('1','2005-08-15','5','5','55007.00'),
('2','1982-01-15','5','5','78000.00'),
('2','1989-12-12','6','5','79060.00'),
('2','1998-02-28','7','5','88502.00'),
('3','1999-05-25','3','2','48502.00'),
('3','1999-11-25','3','3','58502.00'),
('3','2004-05-20','4','2','59965.00'),
('4','1980-12-05','6','2','89965.00'),
('4','1989-09-09','7','2','99965.00'),
('4','1990-10-10','9','2','105909.00'),
('4','2004-12-29','10','2','250000.00'),
('5','1970-04-22','4','3','50000.00'),
('5','1990-06-10','4','4','58000.00');

create table best_store(
best_store_id int (10) auto_increment not null primary key,
name varchar(50) not null,
state varchar(50) not null,
sales varchar(10) not null
);
CREATE VIEW vw_beststores AS
    SELECT 
        name,state,sales
    FROM
        store
    WHERE
        sales='E';
insert into best_store(name,state,sales)
(select name,state,sales from store where sales='E');
SELECT 
    name, state, sales
FROM
    store
WHERE
    sales = 'E' 
UNION ALL SELECT 
    name, state, sales
FROM
    store
WHERE
    state = 'CA';

