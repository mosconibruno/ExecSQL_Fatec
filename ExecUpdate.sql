/*8.	Aumente o pre�o de vendas dos im�veis em 12%
*/
update Imovel
	SET vl_Imovel = vl_Imovel * 1.12

/*9.	Abaixe o pre�o de venda dos im�veis do vendedor 1 em 5%
*/

update Imovel
	SET vl_Imovel = vl_Imovel * 0.95
	WHERE cd_Vendedor = 1

/*10.	Aumente em 5% o valor das ofertas do comprador 2
*/

update Oferta
	SET vl_Oferta = vl_Oferta * 1.05
	WHERE cd_Comprador = 2
	
/*11.	Altere o endere�o do comprador 3 para R. ANAN�S, 45 e o estado para RJ
*/

update Comprador
	SET ds_Endereco = 'R. ANAN�S, 45', sg_Estado = 'RJ'
	WHERE cd_Comprador = 3
	
/*12.	Altere a oferta do comprador 2 no im�vel 4 para 101.000
*/

update Oferta
	SET vl_Oferta = 101000
	WHERE cd_Comprador = 2 AND cd_Imovel = 4
	
/*13.	Exclua a oferta do comprador 3 no im�vel 1
*/

delete Oferta
	WHERE cd_Comprador = 3 AND cd_Imovel = 1

/*14.	Exclua a cidade 3 do estado SP
*/

delete Cidade
	WHERE cd_Cidade = 3 AND sg_Estado = 'SP'

/*15.	Inclua linhas na tabela FAIXA_IMOVEL:
cd_Faixa 	nmFaixa	vl_Minimo	vl_Maximo
1			BAIXO	0		105000
2			M�DIO	105001	180000
3			ALTO		180001	999999

*/

insert into Faixa_Imovel (cd_Faixa, nm_Faixa, vl_Minimo, vl_Maximo)
	values (1, 'BAIXO', 0, 105000),
	(2, 'M�DIO', 105001, 180000),
	(3, 'ALTO', 180001, 999999)

