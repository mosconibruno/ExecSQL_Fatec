use IMOVEIS

insert into Estado
	values( 'SP','SÃO PAULO')
go
insert into Estado
	values( 'RJ','RIO DE JANEIRO')
go


insert into Cidade
	values( 1,'SP','SÃO PAULO')
go
insert into Cidade
	values(2,'SP','SANTO ANDRÉ')
go
insert into Cidade
	values(3,'SP','CAMPINAS')
go
insert into Cidade
	values(1,'RJ','RIO DE JANEIRO')
go
insert into Cidade
	values(2,'RJ','NITEROI')
go


insert into Bairro
	values(1,1,'SP','JARDINS')
go
insert into Bairro
	values(2,1,'SP','MORUMBI')
go
insert into Bairro
	values(3,1,'SP','AEROPORTO')
go
insert into Bairro
	values(1,1,'RJ','AEROPORTO')
go
insert into Bairro
	values(2,1,'RJ','NITEROI')
go


insert into Vendedor (cd_Vendedor, nm_Vendedor,ds_Endereco,ds_Email)
	values(1,'MARIA DA SILVA','RUA DO GRITO, 45','msilva@nova.com')
go
insert into Vendedor (cd_Vendedor, nm_Vendedor,ds_Endereco,ds_Email)
	values(2,'MARCO ANDRADE','AV. DA SAUDADE,325','mandrade@nova.com')
go
insert into Vendedor (cd_Vendedor, nm_Vendedor,ds_Endereco,ds_Email)
	values(3,'ANDRÉ CARDOSO','AV. BRASIL, 401','acardoso@nova.com')
go
insert into Vendedor (cd_Vendedor, nm_Vendedor,ds_Endereco,ds_Email)
	values(4,'TATIANA SOUZA','RUA DO IMPERADOR, 778','tsouza@nova.com')
go


insert into Imovel 
	(cd_Imovel,cd_Vendedor,cd_Bairro,cd_Cidade,sg_Estado,ds_Endereco,qt_AreaUtil,qt_AreaTotal,vl_Imovel)
	values(1,1,1,1,'SP','AL. TIETE, 3304/101',250,400,180000)
go
insert into Imovel
		(cd_Imovel,cd_Vendedor,cd_Bairro,cd_Cidade,sg_Estado,ds_Endereco,qt_AreaUtil,qt_AreaTotal,vl_Imovel)
	values(2,1,2,1,'SP','AV. MORUMBI, 2230',150,250,135000)
go
insert into Imovel
	(cd_Imovel,cd_Vendedor,cd_Bairro,cd_Cidade,sg_Estado,ds_Endereco,qt_AreaUtil,qt_AreaTotal,vl_Imovel)
	values(3,2,1,1,'RJ','R. GAL. OSORIO, 445/34',250,400,185000)
go
insert into Imovel
	(cd_Imovel,cd_Vendedor,cd_Bairro,cd_Cidade,sg_Estado,ds_Endereco,qt_AreaUtil,qt_AreaTotal,vl_Imovel)
	values(4,2,2,1,'RJ','R. D. PEDRO I, 882',120,200,110000)
go
insert into Imovel
	(cd_Imovel,cd_Vendedor,cd_Bairro,cd_Cidade,sg_Estado,ds_Endereco,qt_AreaUtil,qt_AreaTotal,vl_Imovel)
	values(5,3,3,1,'SP','AV. RUBENS BERTA, 2355',110,200,95000)
go
insert into Imovel
	(cd_Imovel,cd_Vendedor,cd_Bairro,cd_Cidade,sg_Estado,ds_Endereco,qt_AreaUtil,qt_AreaTotal,vl_Imovel)
	values(6,4,1,1,'RJ','R. GETULIO VARGAS, 552',200,300,99000)
go


insert into Comprador (cd_Comprador,nm_Comprador,ds_Endereco,ds_Email)
	values(1,'EMMANUEL ANTUNES','R. SARAIVA, 452','eantunes@nova.com')
go
insert into Comprador (cd_Comprador,nm_Comprador,ds_Endereco,ds_Email)
	values(2,'JOANA PEREIRA','AV PROTUGAL, 52','jpereira@nova.com')
go
insert into Comprador (cd_Comprador,nm_Comprador,ds_Endereco,ds_Email)
	values(3,'RONALDO CAMPELO','R. ESTADOS UNIDOS','rcampelo@nova.com')
go
insert into Comprador (cd_Comprador,nm_Comprador,ds_Endereco,ds_Email)
	values(4,'MANFRED AUGUSTO','AV. BRASIL,351','maugusto@nova.com')
go


insert into Oferta
	values(1,1,170000,'10-01-2009')
go
insert into Oferta
	values(1,3,180000,'10-01-2009')
go
insert into Oferta
	values(2,2,135000,'15-01-2009')
go
insert into Oferta
	values(2,4,100000,'15-02-2009')
go
insert into Oferta
	values(3,1,160000,'05-01-2009')
go
insert into Oferta
	values(3,2,140000,'20-02-2009')
go



