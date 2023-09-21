USE db_quitanda;

SELECT * FROM tb_produtos;

SELECT * FROM tb_produtos ORDER BY Preco ASC; -- PREÇO POR ORDEM CRESCENTE

SELECT * FROM tb_produtos ORDER BY Preco DESC; -- PREÇO POR ORDEM DECRESCENTE

SELECT * FROM tb_produtos WHERE NOT Id = 1; -- MOSTRA TODOS OS IDs MENOS O 1 // TAMBÉM PODE SER != 1

SELECT * FROM tb_produtos WHERE Preco IN (8, 5, 10.25) ORDER BY Nome ASC; -- SELECIONA O INTERVALO E ORDENA OS NOMES

SELECT * FROM tb_produtos WHERE Preco BETWEEN 5 AND 8;

SELECT * FROM tb_produtos WHERE Nome LIKE 'm%'; -- SELECIONA PALAVRAS COM "M" NO INÍCIO

SELECT * FROM tb_produtos WHERE Nome LIKE '%a'; --SELECIONA PALAVRAS QUE TERMINAM COM "A" (A MAÇÃ NÃO PEGA POR CAUSA DO ACENTO)

SELECT * FROM tb_produtos WHERE Nome LIKE '%a%'; --SELECIONA PALAVRAS QUE CONTÉM COM "A"

SELECT COUNT (*) AS 'NÚMEROS DE LINHAS' FROM tb_produtos; -- CONTA O NÚMERO DE LINHAS E O "AS" NOMEOU A PESQUISA

SELECT SUM (Preco) AS 'SOMA TOTAL' FROM tb_produtos;

SELECT AVG (Preco) AS 'MÉDIA DE VALORES' FROM tb_produtos;

SELECT MAX (Preco) AS 'VALOR MÁXIMO' FROM tb_produtos;

SELECT MIN (Preco) AS 'VALOR MÍNIMO' FROM tb_produtos;

--RELACIONAMENTO ENTRE TABELAS

CREATE TABLE tb_categoria(
	Id BIGINT IDENTITY (1,1),
	Descricao VARCHAR (255) NOT NULL,
	PRIMARY KEY (Id)
);

SELECT * FROM tb_categoria;

-- Insere dados na tabela tb_categoriasINSERT INTO tb_categoria (Descricao)VALUES ('Frutas');INSERT INTO tb_categoria (Descricao)VALUES ('Verduras');INSERT INTO tb_categoria (Descricao)VALUES ('Legumes');INSERT INTO tb_categoria (Descricao)VALUES ('Temperos');INSERT INTO tb_categoria (Descricao)VALUES ('Ovos');INSERT INTO tb_categoria (Descricao)VALUES ('outros');

DROP TABLE tb_produtos;

CREATE TABLE tb_produtos(
	Id BIGINT IDENTITY (1,1),
	nome VARCHAR (255) NOT NULL, 
	quantidade INT,
	dtvalidade DATE,
	preco DECIMAL (6,2),
	PRIMARY KEY (Id),
	categoria_id BIGINT,
	FOREIGN KEY (categoria_id) REFERENCES tb_categoria(Id)
);

SELECT * FROM tb_produtos;

SELECT * FROM tb_categoria;

INSERT INTO tb_produtos
(nome, quantidade, dtvalidade, preco, categoria_id)
VALUES
('Abacate', 45, '2023-09-22', 5.25, 1),
('Maçã', 1000, '2022-03-07', 1.99, 1),('Banana', 1300, '2022-03-08', 5.00, 1),('Batata doce', 2000, '2022-03-09', 10.00, 3),('Alface', 300, '2022-03-10', 7.00, 2),('Cebola', 1020, '2022-03-08', 5.00, 3),('Ovo Branco', 1000, '2022-03-07', 15.00, 5),('Agrião', 1500, '2022-03-06', 3.00, 2),('Cenoura', 1800, '2022-03-09', 3.50, 3),('Pimenta', 1100, '2022-03-15', 10.00, 4),('Alecrim', 130, '2022-03-10', 5.00, 4),('Manga', 200, '2022-03-07', 5.49, 1),('Laranja', 3000, '2022-03-13', 10.00, 1);

SELECT tb_produtos.Id, nome, quantidade, dtvalidade, preco, categoria_id, Descricao
FROM tb_produtos INNER JOIN tb_categoria ON tb_categoria.Id = tb_produtos.categoria_id; -- RELACIONAMENTO DE TABELAS SELECIONANDO O QUE VAI APARECER E OCULTANDO OUTRAS

SELECT tb_produtos.Id, nome, quantidade, dtvalidade, preco, categoria_id, Descricao
FROM tb_categoria LEFT JOIN tb_produtos ON tb_categoria.Id = tb_produtos.categoria_id;	-- PRIORIDADE DA TABELA DA ESQUERDA

INSERT INTO tb_produtos (Nome, Quantidade, Preco)
VALUES ('Panela', 1118, 150.80);

SELECT tb_produtos.Id, nome, quantidade, dtvalidade, preco, categoria_id, Descricao
FROM tb_categoria RIGHT JOIN tb_produtos -- MUDANDO PARA LEFT JOIN A PANELA NÃO APARECE POIS A TABELA DA ESQUERDA SERÁ PRIORIZADA
ON tb_categoria.Id = tb_produtos.categoria_id
WHERE nome LIKE '%n%' ORDER BY tb_categoria.Id ASC --ORDENANDO ELEMENTOS PELA CATEGORIA.ID DE PRODUTOS QUE CONTÉM A LETRA 'N'