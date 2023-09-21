CREATE DATABASE db_pizzaria_legal;

USE db_pizzaria_legal;

CREATE TABLE tb_categorias(
	Id BIGINT IDENTITY(1,1),
	Tipo VARCHAR(255) NOT NULL,
	Complementos VARCHAR (255) NOT NULL,
	PRIMARY KEY (Id)
);

CREATE TABLE tb_pizzas(
	Id BIGINT IDENTITY(1,1),
	Sabor VARCHAR(255) NOT NULL,
	Tamanho INT, 
	Promocional VARCHAR (255) NOT NULL,
	Preco DECIMAL (6,2) NOT NULL,
	PRIMARY KEY(Id),
	Categoria_id BIGINT,
	FOREIGN KEY (Categoria_id) REFERENCES tb_categorias(Id)
);

INSERT INTO tb_categorias 
(Tipo, Complementos)
VALUES
('Vegana', 'Tomate, Azeitona e Azeite'),
('Prote�na Peixe', 'Azeite e Tomate'),
('Prote�na Porco', 'Tomate'),
('Prote�na Vaca', 'Tomate e Azeitona'),
('Prote�na Ave', 'Azeite e Tomate'),
('Ovolactovegetariana', 'Tomate, Azeitona e Azeite')
;

SELECT * FROM tb_categorias;

INSERT INTO tb_pizzas
(Sabor, Tamanho, Promocional, Preco, Categoria_id)
VALUES
('Calabresa', 8, 'SIM', 38.90, 3),
('Cogumelos', 8, 'N�O', 55.50, 1),
('R�cula', 6, 'SIM', 35.50, 1),
('Portuguesa', 8, 'N�O', 45.90, 3),
('Atum', 6, 'N�O', 42.50, 2),
('Mussarela', 8, 'SIM', 38.00, 6),
('A Moda', 8, 'N�O', 52.90, 3),
('Bauru', 8, 'SIM', 39.90, 3)
;

SELECT * FROM tb_pizzas;

SELECT * FROM tb_pizzas WHERE preco > 45;

SELECT * FROM tb_pizzas WHERE preco BETWEEN 50 AND 100;

SELECT * FROM tb_pizzas WHERE Sabor LIKE '%M%';

SELECT * FROM tb_pizzas INNER JOIN tb_categorias
ON tb_categorias.Id = tb_pizzas.Categoria_id;