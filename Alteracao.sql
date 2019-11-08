/* 8.	Aumente o pre�o de vendas dos im�veis em 10% */
update Imovel
	set vl_Imovel = vl_Imovel * 1.1

/* 9.	Abaixe o pre�o de venda dos im�veis do vendedor 1 em 5%	*/
update Imovel
	set vl_Imovel = vl_Imovel * 0.95
	where cd_Vendedor = 1

/* 10.	Aumente em 5% o valor das ofertas do comprador 2 */	
update Oferta
	set vl_Oferta = vl_Oferta * 1.05
	where cd_Comprador = 2
	
/* 11.	Altere o endere�o do comprador 3 para R. ANAN�S, 45 e o estado para RJ */
update comprador
	set ds_Endereco = 'R. ANAN�S, 45', sg_estado = 'RJ'
	where cd_Comprador = 3
	
/* 12.	Altere a oferta do comprador 2 no im�vel 4 para 101.000 */
update Oferta
	set vl_Oferta = 111000
	where cd_Comprador = 2 and cd_imovel = 4
	
/* 13.	Exclua a oferta do comprador 3 no im�vel 1 */
delete from Oferta
	where cd_Comprador = 3 and cd_imovel = 1

/* 14.	Exclua a cidade 3 do estado SP */
delete from cidade
	where cd_Cidade = 3 and sg_Estado = 'SP'

/* 15.	Inclua linhas na tabela FAIXA_IMOVEL:*/

insert into Faixa_Imovel
	values(1,'BAIXO',0,105000)
go
insert into Faixa_Imovel
	values(2,'M�DIO',105001,180000)
go
insert into Faixa_Imovel
	values(3,'ALTO',180001,999999)
go
