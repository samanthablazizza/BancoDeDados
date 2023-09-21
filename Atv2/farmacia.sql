CREATE DATABASE db_farmacia_bem_estar;

USE db_farmacia_bem_estar;

CREATE TABLE tb_categorias(
    Id BIGINT IDENTITY (1,1),
	Principio_Ativo VARCHAR (255),
    Descricao VARCHAR (255),
    PRIMARY KEY (Id) 
);
INSERT INTO tb_categorias (Principio_Ativo, Descricao)
VALUES
('Loratadina','Antialérgico'),
('Dipirona','Analgésico'),
('Naproxeno Sódico','Anti-inflamatório'),
('Ácido Cítrico e Carbonato de Sódio', 'Antiácido'),
('Sulfato de Salbutamol ','Broncodilatador');

SELECT * FROM tb_categorias;

CREATE TABLE tb_produtos(
    Id BIGINT IDENTITY (1,1),
    Nome VARCHAR (255),
    Marca VARCHAR (255),
    Preco DECIMAL (6,2),
    Estoque INT,
    PRIMARY KEY (Id), 
    Tipo_Id BIGINT,
    FOREIGN KEY (Tipo_Id) REFERENCES tb_categorias(Id)
);

INSERT INTO tb_produtos 
(Nome, Marca, Preco, Estoque, Tipo_Id)
VALUES
('Loratamed 10mg','Cimed', 20.33, 85, 1),
('Sal de Frutas 100g', 'Eno', 22.59, 95, 4),
('Aerolin 100mcg spray 200 doses', 'GSK', 20.39, 150, 5),
('Dorflex UNO 1g', 'Dorflex', 26.31, 56, 2),
('Naxotec 500mg', 'União Química', 16.19, 26, 3),
('Neosaldina DIP', 'Neosaldina', 26.99, 65, 2),
('Claritin 10mg', 'Schering-Plough', 11.69, 38, 1),
('Flanax XR', 'Bayer', 28.79, 35, 3)
;
SELECT * FROM tb_produtos;

SELECT * FROM tb_produtos WHERE Preco > 25.00

SELECT * FROM tb_produtos WHERE Preco BETWEEN 15.00 AND 25.00;

SELECT * FROM tb_produtos WHERE Nome LIKE '%c%';

SELECT * FROM tb_produtos INNER JOIN tb_categorias
ON tb_categorias.Id = tb_produtos.Tipo_Id;

SELECT * FROM tb_produtos INNER JOIN tb_categorias
ON tb_categorias.Id = tb_produtos.Tipo_Id 
WHERE Tipo_Id = 2;

