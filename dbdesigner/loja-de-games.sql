CREATE TABLE [Produtos] (
	id bigint NOT NULL,
	Nome varchar(255) NOT NULL,
	Descricao varchar(500) NOT NULL,
	Console varchar(255) NOT NULL,
	Quantidade int NOT NULL,
	Preco decimal(8,2) NOT NULL,
	Foto varchar(5000) NOT NULL,
	CategoriaId bigint NOT NULL,
  CONSTRAINT [PK_PRODUTOS] PRIMARY KEY CLUSTERED
  (
  [id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Categoria] (
	id bigint NOT NULL,
	Tipo varchar(255) NOT NULL,
  CONSTRAINT [PK_CATEGORIA] PRIMARY KEY CLUSTERED
  (
  [id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
ALTER TABLE [Produtos] WITH CHECK ADD CONSTRAINT [Produtos_fk0] FOREIGN KEY ([CategoriaId]) REFERENCES [Categoria]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [Produtos] CHECK CONSTRAINT [Produtos_fk0]
GO


