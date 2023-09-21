CREATE DATABASE db_construindo_vidas;

USE db_construindo_vidas;

CREATE TABLE tb_categorias(
    Id BIGINT IDENTITY (1,1),
    Tipo VARCHAR (255),
    Tipo_Especifico VARCHAR (255),
    PRIMARY KEY (Id) 
);
INSERT INTO tb_categorias (Tipo,Tipo_Especifico)
VALUES
('Ferramentas','Máquinas'),
('Fechadura & Segurança','Fechadura Para Banheiro'),
('Móveis','Gabinete Suspenso Para Banheiro'),
('Decoração','Capachos'),
('Material Elétrico','Tomadas');

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
UPDATE tb_categorias SET Tipo_Especifico = 'Gabinete Suspenso'
WHERE Id = 3;

UPDATE tb_categorias SET Tipo_Especifico = 'Fechadura'
WHERE Id = 2;

INSERT INTO tb_produtos 
(Nome, Marca, Preco, Estoque, Tipo_Id)
VALUES
('Esmeril','Stanley', 446.00, 15, 1),
('Fechadura Digital', 'Elsys', 1099.00, 52, 2),
('Gabinete Suspenso para Banheiro', 'Turim', 189.90, 10, 3),
('Capacho Fibra de Coco', 'Sodimac', 79.9, 85, 4),
('Conjunto Interruptor Simples', 'Aria', 4.90, 250, 5),
('Betoneira de Caminhão', 'Siti', 9900.00, 5, 1),
('Lâmpada Retrô', 'Philips', 55.00, 42, 4),
('Contatora Guarda Motor', 'DC', 550.02, 18, 1);

SELECT * FROM tb_produtos;

SELECT * FROM tb_produtos WHERE Preco > 100.00

SELECT * FROM tb_produtos WHERE Preco BETWEEN 70.00 AND 150.00;

SELECT * FROM tb_produtos WHERE Nome LIKE '%c%';

SELECT * FROM tb_produtos INNER JOIN tb_categorias
ON tb_categorias.Id = tb_produtos.Tipo_Id;

SELECT * FROM tb_produtos INNER JOIN tb_categorias
ON tb_categorias.Id = tb_produtos.Tipo_Id 
WHERE Tipo_Id = 4;

