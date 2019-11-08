
USE Biblioteca
go

1.	Criar a tabela Autor_Livro do relacionamento N para N, utilizando uma instrução SQL sem especificar as (chaves) restrições de integridade. 
Depois altere a tabela de forma a incluir a chave primária nomeando a restrição para PK_AutorLivro e as chaves estrangeiras,
nomeando as restrições para FK_Autor e FK_Livro
Criar uma instrução em SQL para inserir os registros abaixo na tabela Autor_Livro	
cd_Livro 	cd_Autor	
1		3
1		2		
2		1	
3		4
4		2
4		3	

CREATE TABLE Autor_Livro(
cd_AutorLivro int not null,
cd_Autor int,
cd_Livro int)

Alter Table Autor_Livro
	Add Constraint PK_AutorLivro Primary Key (cd_AutorLivro)
go
ALTER TABLE Autor_Livro
	Add Constraint FK_Autor Foreign Key (cd_Autor)
	References Autor
go
ALTER TABLE Autor_Livro
	Add Constraint FK_Livro Foreign Key (cd_Livro)
	References Livro
go
INSERT INTO Autor_Livro
	(cd_AutorLivro, cd_Livro, cd_Autor)
	Values 	(1,1,3),
			(2,1,2),		
			(3,2,1),	
			(4,3,4),
			(5,4,2),
			(6,4,3)
go

2.	Crie uma instrução para adicionar a coluna qt_Edicao na tabela Livro, essa coluna deve aceitar números inferior a 20. 
Depois escreva outra instrução para remover a coluna qt_Edicao da tabela Livro

Alter Table Livro
	ADD qt_Edicao int Constraint CK_qtEdicao Check (qt_Edicao < 20)
go

Alter Table Livro
	Drop Constraint CK_qtEdicao
go
	
Alter Table Livro
	Drop Column qt_Edicao
go


3.	Apresente o comando para gerar uma listagem dos códigos dos livros que possuem ao menos dois autores

Select cd_Livro
from Autor_Livro
group by cd_Livro
having COUNT(*) > 1
go

4.	Apresente o código do livro, o nome do livro, o nome do assunto de cada livro e o valor do livro, 
onde o valor seja diferente de zero e o assunto igual a “D” ou “A”

Select L.cd_Livro, L.nm_Titulo, A.ds_Assunto, L.vl_Livro
	FROM Livro as L INNER JOIN Assunto as A
			ON L.sg_Assunto = A.sg_Assunto
		Where vl_Livro != 0 and (L.sg_Assunto = 'A' or L.sg_Assunto = 'D')
go