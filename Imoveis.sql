CREATE DATABASE IMOVEIS
go

USE IMOVEIS
go

-- Tabelas

CREATE TABLE Bairro (
       cd_Bairro            int NOT NULL,
       cd_Cidade            int NOT NULL,
       sg_Estado            char(2) NOT NULL,
       nm_Bairro            varchar(20) NULL
)
go

CREATE TABLE Cidade (
       cd_Cidade            int NOT NULL,
       sg_Estado            char(2) NOT NULL,
       nm_Cidade            varchar(20) NULL
)
go

CREATE TABLE Comprador (
       cd_Comprador         int NOT NULL,
       nm_Comprador         varchar(20) NULL,
       ds_Endereco          varchar(20) NULL,
       cd_CPF               int NULL,
       nm_Cidade            varchar(20) NULL,
       nm_Bairro            varchar(20) NULL,
       sg_Estado            varchar(20) NULL,
       cd_Telefone          varchar(20) NULL,
       ds_Email             varchar(20) NULL
)
go

CREATE TABLE Estado (
       sg_Estado            char(2) NOT NULL,
       nm_Estado            varchar(20) NULL
)
go

CREATE TABLE Faixa_Imovel (
       cd_Faixa             int NOT NULL,
       nm_Faixa             varchar(30) NULL,
       vl_Maximo            money NULL,
       vl_Minimo            money NULL
)
go

CREATE TABLE Imovel (
       cd_Imovel            int NOT NULL,
       cd_Vendedor          int NULL,
       cd_Bairro            int NULL,
       cd_Cidade            int NULL,
       sg_Estado            char(2) NULL,
       ds_Endereco          varchar(40) NULL,
       qt_AreaUtil          decimal(10,2) NULL,
       qt_AreaTotal         decimal(10,2) NULL,
       ds_Imovel            varchar(300) NULL,
       vl_Imovel            money NULL,
       qt_Ofertas           int NULL,
       ic_Vendido           char(1) NULL,
       dt_Lancto            datetime NULL,
       qt_ImovelIndicado    int NULL
)
go

CREATE TABLE Oferta (
       cd_Comprador         int NOT NULL,
       cd_Imovel            int NOT NULL,
       vl_Oferta            money NULL,
       dt_Oferta            datetime NULL
)
go

CREATE TABLE Vendedor (
       cd_Vendedor          int NOT NULL,
       nm_Vendedor          varchar(40) NULL,
       ds_Endereco          varchar(40) NULL,
       cd_CPF               decimal(11) NULL,
       nm_Cidade            varchar(20) NULL,
       nm_Bairro            varchar(20) NULL,
       sg_Estado            char(2) NULL,
       cd_Telefone          varchar(20) NULL,
       ds_Email             varchar(80) NULL
)
go

-- Chaves Primárias

ALTER TABLE Bairro
       ADD PRIMARY KEY (cd_Bairro, cd_Cidade, sg_Estado)
go
ALTER TABLE Cidade
       ADD PRIMARY KEY (cd_Cidade, sg_Estado)
go
ALTER TABLE Comprador
       ADD PRIMARY KEY (cd_Comprador)
go
ALTER TABLE Estado
       ADD PRIMARY KEY (sg_Estado)
go
ALTER TABLE Faixa_Imovel
       ADD PRIMARY KEY (cd_Faixa)
go
ALTER TABLE Imovel
       ADD PRIMARY KEY (cd_Imovel)
go
ALTER TABLE Oferta
       ADD PRIMARY KEY (cd_Comprador, cd_Imovel)
go
ALTER TABLE Vendedor
       ADD PRIMARY KEY (cd_Vendedor)
go

-- Chaves Estrangeiras

ALTER TABLE Bairro
       ADD FOREIGN KEY (cd_Cidade, sg_Estado)
                             REFERENCES Cidade
go
ALTER TABLE Cidade
       ADD FOREIGN KEY (sg_Estado)
                             REFERENCES Estado
go
ALTER TABLE Imovel
       ADD FOREIGN KEY (cd_Vendedor)
                             REFERENCES Vendedor
go
ALTER TABLE Imovel
       ADD FOREIGN KEY (cd_Bairro, cd_Cidade, sg_Estado)
                             REFERENCES Bairro
go
ALTER TABLE Oferta
       ADD FOREIGN KEY (cd_Comprador)
                             REFERENCES Comprador
go
ALTER TABLE Oferta
       ADD FOREIGN KEY (cd_Imovel)
                             REFERENCES Imovel
go

