Create Database Imobiliario
go
Use Imobiliario
go
-- Criar Tabelas
Create Table Vendedor (
	cd_Vendedor int not null,
	nm_Vendedor varchar(40),
	ds_Endereco varchar(40),
	cd_CPF decimal(11),
	nm_Cidade varchar(20),
	nm_Bairro varchar(20),
	sg_Estado char(2),
	cd_Telefone varchar(20),
	ds_Email varchar(80))
go
Create Table Imovel (
	cd_Imovel int not null,
	cd_Vendedor int,
	cd_Bairro int,
	cd_Cidade int,
	sg_Estado char(2),
	ds_Endereco varchar(40),
	qt_AreaUtil decimal(10,2),
	qt_AreaTotal decimal(10,2),
	ds_Imovel varchar(300),
	vl_Imovel money,
	qt_Ofertas int,
	ic_Vendido char(1),
	dt_Lancto datetime,
	qt_ImovelIndicado int)
go
Create Table Comprador (
	cd_Comprador int not null,
	nm_Comprador varchar(20),
	ds_Endereco varchar(20),
	cd_CPF int,
	nm_Cidade varchar(20),
	nm_Bairro varchar(20),
	sg_Estado varchar(20),
	cd_Telefone varchar(20),
	ds_Email varchar(20))
go
Create Table Oferta (
	cd_Comprador int not null,
	cd_Imovel int not null,
	vl_Oferta money,
	dt_Oferta datetime)
go
Create Table Estado (
	sg_Estado char(2) not null,
	nm_Estado varchar(20))
go
Create Table Cidade (
	cd_Cidade int not null,
	sg_Estado char(2) not null,
	nm_Cidade varchar(20))
go
Create Table Bairro (
	cd_Bairro int not null,
	cd_Cidade int not null,
	sg_Estado char(2) not null,
	nm_Bairro varchar(20))
go
Create Table Faixa_Imovel (
	cd_Faixa int not null,
	nm_Faixa varchar(30),
	vl_Maximo money,
	vl_Minimo money)
go
-- Chaves Primárias
Alter Table Vendedor
	Add Primary Key (cd_Vendedor)
go
Alter Table Imovel
	Add Primary Key (cd_Imovel)
go
Alter Table Comprador
	Add Primary Key (cd_Comprador)
go
Alter Table Oferta
	Add Primary Key (cd_Comprador,cd_Imovel)
go
Alter Table Estado
	Add Primary Key (sg_Estado)
go
Alter Table Cidade
	Add Primary Key (cd_Cidade,sg_Estado)
go
Alter Table Bairro
	Add Primary Key (cd_Bairro,cd_Cidade,sg_Estado)
go
Alter Table Faixa_Imovel
	Add Primary Key (cd_Faixa)
go
-- Chaves Estrangeiras
Alter Table Imovel
	Add Foreign Key (cd_Vendedor)
	References Vendedor
go
Alter Table Imovel
	Add Foreign Key (cd_Bairro,cd_Cidade,sg_Estado)
	References Bairro
go
Alter Table Oferta
	Add Foreign Key (cd_Comprador)
	References Comprador
go
Alter Table Oferta
	Add Foreign Key (cd_Imovel)
	References Imovel
go
Alter Table Bairro
	Add Foreign Key (cd_Cidade,sg_Estado)
	References Cidade
go
Alter Table Cidade
	Add Foreign Key (sg_Estado)
	References Estado
go