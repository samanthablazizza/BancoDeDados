CREATE DATABASE db_rh;

USE db_rh;

CREATE TABLE tb_funcionarios(
	Matricula BIGINT IDENTITY(1,1),
	Nome VARCHAR(255) NOT NULL,
	Cargo VARCHAR(255) NOT NULL, 
	DataContratacao DATE,
	Salario DECIMAL NOT NULL,
	PRIMARY KEY(Matricula)
);

SELECT * FROM tb_funcionarios;

ALTER TABLE tb_funcionarios ALTER COLUMN Salario DECIMAL (6,3);

INSERT INTO tb_funcionarios
(Nome, Cargo, DataContratacao, Salario)
VALUES
('Joana', 'Coordenadora', '2019-02-26', 6.500),
('Glória', 'Recepcionista', '2022-07-15', 1.700),
('Felipe', 'Motorista', '2018-11-03', 2.100),
('Elisa', 'Auxiliar Administrativo', '2023-01-18', 1.600),
('Mário', 'Carregador', '2023-03-12', 1.500)
;
SELECT * FROM tb_funcionarios WHERE Salario > 2.000;

SELECT * FROM tb_funcionarios WHERE Salario < 2.000;

ALTER TABLE tb_funcionarios ADD Idade INT;

UPDATE tb_funcionarios SET Idade = 36 WHERE Matricula = 1;

UPDATE tb_funcionarios SET Idade = 23 WHERE Matricula = 2;

UPDATE tb_funcionarios SET Idade = 28 WHERE Matricula = 3;

UPDATE tb_funcionarios SET Idade = 32 WHERE Matricula = 4;

UPDATE tb_funcionarios SET Idade = 19 WHERE Matricula = 5;