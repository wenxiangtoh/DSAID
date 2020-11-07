DROP TABLE IF EXISTS Saleperson CASCADE;
DROP TABLE IF EXISTS Customer CASCADE ;
DROP TABLE IF EXISTS Manufacturer CASCADE;
DROP TABLE IF EXISTS Car CASCADE;

CREATE TABLE Saleperson (
	saleperson_name varchar(100) PRIMARY KEY
);

CREATE TABLE Customer (
	customer_name varchar(100) PRIMARY KEY,
	customer_phone varchar(50)
);

CREATE TABLE Manufacturer (
	manufacturer_identificationcode varchar(50) PRIMARY KEY,
	manufacturer_companyName varchar(50)
);

CREATE TABLE Car (
	car_serialno varchar(50) PRIMARY KEY,
	car_model varchar(50),
	car_variant varchar(50),
	car_weight int,
	car_engineCubicCapacity int,
	car_price float,
	manufacturer_identificationcode varchar(50),
	saleperson_name varchar(100),
	FOREIGN KEY (manufacturer_identificationcode) 
	 REFERENCES Manufacturer (manufacturer_identificationcode),
	FOREIGN KEY (saleperson_name) 
	 REFERENCES Saleperson (saleperson_name)
);

INSERT INTO 
Saleperson (saleperson_name)
VALUES 
('Alex'),
('Alan'),
('David'),
('Cheryl'),
('Susan');


INSERT INTO
Customer (customer_name, customer_phone)
VALUES
('Jerry','92458329'),
('Jayden','95236283'),
('May','83248536'),
('Alice','85239428'),
('Kyle','87532837');

INSERT INTO 
Manufacturer (manufacturer_identificationcode, manufacturer_companyName)
VALUES
('K2346234','ABC Automotive'),
('K3858392','Best Automotive'),
('K5632567','Number 1 Automotive'),
('K3572534','A Automotive'),
('K2874632','Jenny Automotive');

INSERT INTO 
Car (car_serialno, car_model, car_variant, car_weight, car_engineCubicCapacity, car_price, manufacturer_identificationcode, saleperson_name)
VALUES
('123456', 'Toyota', 'New', 45, 120, 5000.00, 'K2346234', 'Alex'),
('234567', 'BMW', 'New', 50, 150, 10000.00, 'K3858392', 'Alan'),
('346256', 'Hyundai', 'Old', 40, 100, 8000.00, 'K5632567', 'David'),
('625324', 'Proton', 'Old', 60, 90, 4500.00, 'K3572534', 'Cheryl'),
('385375', 'Subaru', 'Old', 50, 80, 7000.00, 'K2874632', 'Susan');

