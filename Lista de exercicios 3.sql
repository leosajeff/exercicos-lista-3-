CREATE DATABASE EmpresaDB;

USE EmpresaDB;

CREATE TABLE Departamento(
	Id INT PRIMARY KEY IDENTITY(1,1),
	Nome VARCHAR(100) NOT NULL,
	DataCriacao DATE  
);

CREATE TABLE Funcionarios (

	Id INT PRIMARY KEY IDENTITY (1,1),
	Nome VARCHAR (100) NOT NULL,
	Email VARCHAR (200) UNIQUE,
	Salario DECIMAL (8,2),
	DataAdmissao DATE,
	IdDepartamento INT FOREIGN KEY REFERENCES Departamento (Id)
);

CREATE TABLE Projetos(

	Id INT PRIMARY KEY IDENTITY (1,1),
	Nome VARCHAR (100) NOT NULL,
	Orcamento DECIMAl (10,2),
	DataInicio DATE,
	DataFim DATE

);

CREATE TABLE FuncionariosProjetos(
	IdFuncionariosProjetos INT PRIMARY KEY IDENTITY (1,1),
	IdFuncionarios INT FOREIGN KEY REFERENCES Funcionarios (Id),
	IdProjeto INT FOREIGN KEY REFERENCES Projetos (Id),
	
);

ALTER TABLE FuncionariosProjetos
ADD DataEntrada DATE;

INSERT INTO Departamento (Nome, DataCriacao)
VALUES 
('TI', '2020-01-01'),
('RH', '2021-03-15'),
('Financeiro', '2019-07-10');

SELECT * FROM Departamento;

INSERT INTO Funcionarios (Nome, Email,Salario, 
						DataAdmissao, IdDepartamento)
VALUES 
('Carlos Silva', 'carlos@empresa.com',
5000, '10-05-2022', 1),
('Ana Souza', 'ana@empresa.com',
7000, '20-08-2021',2),
('Pedro Lima', 'pedro@empresa.com'
,4500, '15-01-2023', 3);

SELECT * FROM Funcionarios;

UPDATE Funcionarios
	SET Salario = 5000
	WHERE Nome = 'Carlos Silva'

UPDATE Funcionarios
	SET Salario = 7000
	WHERE Nome = 'Ana Souza'

UPDATE Funcionarios
	SET Salario = 4500
	WHERE Nome = 'Pedro Lima';

SELECT * FROM Funcionarios;

INSERT INTO Projetos (Nome, Orcamento, DataInicio, DataFim)
VALUES 
('Sistemas ERP', 100000, '01-01-2023', '31-12-2023' ),
('Recrutamento Digital', 50000,'01-06-2023', '01-10-2023'),
('Controle Financeiro', 75000, '01-03-2023', '30-09-2023');

INSERT INTO FuncionariosProjetos
(IdFuncionarios, IdProjeto, DataEntrada)
VALUES
(1,1, '2024-02-08'),
(1, 3, '2024-02-08'),
(2, 2, '2024-06-12'),
(3,1, '2024-02-08'),
(3,3 , '2024-02-08');

SELECT 
    F.Nome AS Funcionario, 
    P.Nome AS Projeto,
    FP.DataEntrada
FROM FuncionariosProjetos FP
JOIN Funcionarios F ON FP.IdFuncionarios = F.Id
JOIN Projetos P ON FP.IdProjeto = P.Id;