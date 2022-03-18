Create database Botanical_Garden
go
use Botanical_Garden
go

CREATE TABLE Employees
(id INT PRIMARY KEY IDENTITY,
first_name VARCHAR(50),
last_name VARCHAR(50))

CREATE TABLE Plants
(id INT PRIMARY KEY IDENTITY,
name VARCHAR(50),
color VARCHAR(50))

CREATE TABLE Plant_Employees
(id_plant INT FOREIGN KEY REFERENCES Plants(id),
id_employee INT FOREIGN KEY REFERENCES Employees(id)
CONSTRAINT PK_PlantEmpl PRIMARY KEY(id_plant,id_employee))

CREATE TABLE Clients 
(id INT PRIMARY KEY IDENTITY,
first_name VARCHAR(50),
last_name VARCHAR(50),
email VARCHAR(50),
address VARCHAR(50),
age int ,
)





CREATE TABLE Visits 
(id_plant INT FOREIGN KEY REFERENCES Plants(id),
id_client INT FOREIGN KEY REFERENCES Clients(id),
CONSTRAINT PK_Visits PRIMARY KEY(id_plant,id_client),
)

CREATE TABLE Vouchers 
(id INT PRIMARY KEY IDENTITY,
type VARCHAR(50),
summ INT,
id_client INT FOREIGN KEY REFERENCES Clients(id)
)

CREATE TABLE Souvenirs 
(id INT PRIMARY KEY IDENTITY,
type VARCHAR(50)
)


CREATE TABLE Vanzari 
(id_client INT FOREIGN KEY REFERENCES Clients(id),
id_souvenir INT FOREIGN KEY REFERENCES Souvenirs(id)
CONSTRAINT PK_Vanzari PRIMARY KEY(id_client,id_souvenir))
