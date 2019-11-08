USE IMOVEIS

/*1.	Liste todas as linhas e os campos cd_Comprador, nm_Comprador e ds_Email da tabela COMPRADOR
*/

Select cd_Comprador, nm_Comprador, ds_Email from Comprador

/*
2.	Liste todas as linhas e os campos cd_Vendedor, nm_Vendedor e ds_Email da tabela VENDEDOR em ordem alfabética decrescente.
*/
Select cd_Vendedor, nm_Vendedor, ds_Email from Vendedor
Order by nm_Vendedor DESC
/*
3.	Liste as colunas cd_Imovel, cd_Vendedor e vl_Imovel de todos os imóveis do vendedor 2.
*/
Select cd_Imovel, cd_Vendedor, vl_Imovel from Imovel
where cd_Vendedor = 2
/*
4.	Liste as colunas cd_Imovel, cd_Vendedor, vl_Imovel e sg_Estado dos imóveis cujo preço de venda seja inferior a 150 mil e sejam do Estado do RJ.
*/
Select cd_Imovel, cd_Vendedor, vl_Imovel, sg_Estado from Imovel
Where vl_Imovel < 150000 AND sg_Estado = 'RJ'
/*
5.	Liste as colunas cd_Imovel, cd_Vendedor, vl_Imovel e sg_Estado dos imóveis cujo preço de venda seja inferior a 150 mil e o vendedor não seja 2.
*/
Select cd_Imovel, cd_Vendedor, vl_Imovel, sg_Estado from Imovel
Where vl_Imovel < 150000 AND cd_Vendedor != 2
/*
6.	Liste as colunas cd_Comprador, nm_Comprador, ds_Endereco e sg_Estado da tabela COMPRADOR em que o Estado seja nulo.
*/
Select cd_Comprador, nm_Comprador, ds_Endereco, sg_Estado from Comprador
Where sg_Estado is Null

/*
7.	Liste todas as ofertas cujo valor esteja entre 100 mil e 150 mil.
*/
Select * from Oferta
where vl_Oferta Between 100000 AND 150000
/*
8.	Liste todos vendedores que tenham a letra A na segunda posição do nome
*/
Select nm_Vendedor from Vendedor
Where nm_Vendedor like '_A%'

/*
9.	Liste todas as ofertas cujo imóvel seja 2 ou 3 e o valor da oferta seja maior que 140 mil, em ordem decrescente de data.
*/

Select * from Oferta
Where cd_Imovel in (2,3) AND vl_Oferta > 140000
Order by dt_Oferta DESC



/*
10.	Liste todos os imóveis cujo preço de venda esteja entre 110 mil e 200 mil ou seja do vendedor 1 em ordem de área útil.
*/

Select * from Imovel
Where vl_Imovel Between 110000 AND 200000 OR cd_Vendedor = 1
Order by qt_AreaUtil 

/*
11.	Verifique a maior, a menor e o valor médio das ofertas na tabela.
*/

Select max(vl_Oferta) maior, min(vl_Oferta) menor, AVG(vl_Oferta) media from Oferta

/*
12.	Mostre o maior, o menor, o total e a média de preço de venda dos imóveis.
*/

Select max(vl_Imovel) maior, min(vl_Imovel) menor, SUM(vl_Imovel) soma, AVG(vl_Imovel) media from Imovel

/*
13.	Modifique o comando anterior para que sejam mostrados os mesmos índices por bairro.
*/

Select cd_Bairro, max(vl_Imovel) maior, min(vl_Imovel) menor, SUM(vl_Imovel) soma, AVG(vl_Imovel) media from Imovel
Group by cd_Bairro, cd_Cidade, sg_Estado


/*
14.	Faça uma busca que retorne o total de ofertas realizadas nos anos de 2008, 2009 e 2010.
*/

Select Count(*) TotalOfertas from Oferta
Group by dt_Oferta
Having YEAR(dt_Oferta) Between 2008 AND 2010

