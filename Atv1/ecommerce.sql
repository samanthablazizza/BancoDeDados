CREATE DATABASE db_ecommerce;

USE db_ecommerce;

CREATE TABLE tb_produtos(
	Id BIGINT IDENTITY(1,1),
	Tipo VARCHAR(255) NOT NULL,
	Quantidade INT, 
	DataDeEntrada DATE,
	Preco DECIMAL NOT NULL,
	PRIMARY KEY(Id)
);

SELECT * FROM tb_produtos;

ALTER TABLE tb_produtos ALTER COLUMN Preco DECIMAL (6,2);

INSERT INTO tb_produtos
(Tipo, Quantidade, DataDeEntrada, Preco)
VALUES
('Celular', 50, '2023-08-10', 1480.00),
('Geladeira', 15,'2023-07-28', 3800.00),
('Jogo de Panelas', 85, '2023-08-05', 250.00),
('Mesa de Jantar', 32, '2023-05-18', 900.00),
('Notebook', 26, '2023-09-02', 2900.00),
('Fogão', 25, '2023-07-16', 850.00),
('Airfryer', 64, '2023-08-28', 365.00),
('Sofá', 18, '2023-06-25', 1700.00)
;
SELECT * FROM tb_produtos WHERE Preco > 500.00;

SELECT * FROM tb_produtos WHERE Preco < 500.00;

ALTER TABLE tb_produtos ADD Marca VARCHAR (255);

UPDATE tb_produtos SET Marca = 'Tramontina' WHERE Id = 9;

ALTER TABLE tb_produtos DROP COLUMN Nome;


