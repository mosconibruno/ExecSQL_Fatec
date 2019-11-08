Create Database Teste
go
Use Teste
go
-- Criar Tabelas
Create Table Venda (
	cd_Venda int not null,
	dt_Venda datetime,
	vl_Total money)
go
Create Table Produto (
	cd_Produto int not null,
	ds_Produto varchar(40),
	vl_Produto money)
go
Create Table VendaProd (
	cd_Venda int not null,
	cd_Produto int not null,
	qt_Vendida int)
go
-- Chaves Primárias
Alter Table Venda
	Add Primary Key (cd_Venda)
go
Alter Table Produto
	Add Primary Key (cd_Produto)
go
Alter Table VendaProd
	Add Primary Key (cd_Venda,cd_Produto)
go
-- Chaves Estrangeiras
Alter Table VendaProd
	Add Foreign Key (cd_Venda)
	References Venda
go
Alter Table VendaProd
	Add Foreign Key (cd_Produto)
	References Produto
go


