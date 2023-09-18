CREATE DATABASE db_estudantes;

USE db_estudantes;

CREATE TABLE tb_estudantes(
	Id BIGINT IDENTITY(1,1),
	Nome VARCHAR(255) NOT NULL,
	Serie INT,
	TipoSerie VARCHAR(255) NOT NULL,
	Materia VARCHAR(255) NOT NULL,
	Nota DECIMAL,
	PRIMARY KEY(Id)
);

SELECT * FROM tb_estudantes;

ALTER TABLE tb_estudantes ALTER COLUMN Nota DECIMAL (6,2);

INSERT INTO tb_estudantes
(Nome, Serie, TipoSerie, Materia, Nota)
VALUES
('Mariana', 6,'Fundamental', 'L�ngua Portuguesa', 8.6),
('Fl�vio', 1,'M�dio','Biologia', 6.8),
('Luiz Miguel', 9, 'Fundamental','Ingl�s', 7.2),
('Caio', 2, 'M�dio', 'Hist�ria', 9.0),
('Aline', 7, 'Fundamental', 'Matem�tica', 6.6),
('Gabriel', 3, 'M�dio', 'Geografia', 7.8),
('Patr�cia', 8, 'Fundamental', 'Ci�ncias', 9.4),
('Valentina', 2, 'M�dio', 'Filosofia', 6.2)
;

SELECT * FROM tb_estudantes WHERE Nota > 7.0;

SELECT * FROM tb_estudantes WHERE Nota < 7.0;

ALTER TABLE tb_estudantes ADD QuantidadeFaltas VARCHAR (255);

UPDATE tb_estudantes SET QuantidadeFaltas = 5 WHERE Id = 4;

UPDATE tb_estudantes SET QuantidadeFaltas = 2 WHERE Id = 7;
