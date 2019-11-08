use IMOVEIS

/*1.	Fa�a uma busca que mostre cd_Imovel, cd_Vendedor, nm_Vendedor e sg_Estado.
*/
SELECT I.cd_Imovel, I.cd_Vendedor, V.nm_Vendedor, I.sg_Estado
	FROM Imovel as I INNER JOIN Vendedor as V
			ON I.cd_Vendedor = V.cd_Vendedor

/*2.	Fa�a uma busca que mostre cd_Comprador, nm_Comprador, cd_Imovel e vl_Oferta.
*/
SELECT C.cd_Comprador, C.nm_Comprador, O.cd_Imovel, O.vl_Oferta
	FROM Comprador as C INNER JOIN Oferta as O
			ON C.cd_Comprador = O.cd_Comprador
/* 3. Fa�a uma busca que mostre cd_Imovel, vl_Imovel e nm_Bairro, cujo c�digo do vendedor seja 3.
*/

SELECT I.cd_Imovel, I.vl_Imovel, B.nm_Bairro
	FROM Imovel as I INNER JOIN Bairro as B
			ON I.cd_Bairro = B.cd_Bairro and
			   I.cd_Cidade = B.cd_Cidade and
			   I.sg_Estado = B.sg_Estado
			WHERE I.cd_Vendedor = 3

/*4.	Fa�a uma busca que mostre todos os im�veis que tenham ofertas cadastradas.
*/
SELECT * FROM Imovel as I INNER JOIN Oferta as O
			ON I.cd_Imovel = O.cd_Imovel
/*5.	Fa�a uma busca que mostre todos os im�veis e ofertas mesmo que n�o haja ofertas cadastradas para o im�vel.
*/
SELECT * FROM Imovel as I LEFT JOIN Oferta as O
			ON I.cd_Imovel = O.cd_Imovel
/*6.	Fa�a uma busca que mostre os compradores e as respectivas ofertas realizadas por eles.
*/
SELECT * FROM Comprador as C INNER JOIN Oferta as O
			ON C.cd_Comprador = O.cd_Comprador
/*7.	Fa�a a mesma busca, por�m acrescentando os compradores que ainda n�o fizeram ofertas para os im�veis.
*/
SELECT * FROM Comprador as C LEFT JOIN Oferta as O
			ON C.cd_Comprador = O.cd_Comprador
/*8.	Fa�a uma busca que mostre o endere�o do im�vel, o bairro e n�vel de pre�o do im�vel.
*/
SELECT I.ds_Endereco, B.nm_Bairro, I.vl_Imovel
		FROM Imovel as I INNER JOIN Bairro as B
			ON I.cd_Bairro = B.cd_Bairro and
			   I.cd_Cidade = B.cd_Cidade and
			   I.sg_Estado = B.sg_Estado
/*9.	Fa�a uma busca que retorne o total de im�veis por nome de vendedor. Apresente em ordem de total de im�veis.
*/
SELECT V.nm_Vendedor, COUNT(I.cd_Imovel) as qt_Imovel
		FROM Vendedor as V INNER JOIN Imovel as I
			ON V.cd_Vendedor = I.cd_Vendedor
		GROUP BY nm_Vendedor
		ORDER BY qt_Imovel
/*10.	Verifique a diferen�a de pre�os entre o maior e o menor im�vel da tabela.
*/
SELECT MAX(vl_Imovel) as maior, MIN(vl_Imovel) as menor, (MAX(vl_Imovel) - MIN(vl_Imovel)) as diferenca
		FROM Imovel
/*11.	Mostre o c�digo do vendedor e o menor pre�o de im�vel dele no cadastro. Exclua da busca os valores de im�veis inferiores a 100 mil.
*/
SELECT I.cd_Vendedor as codigo, MIN(I.vl_Imovel) as menor
		FROM Imovel as I RIGHT JOIN Vendedor as V
			ON I.cd_Vendedor = V.cd_Vendedor
		WHERE I.vl_Imovel > 100000
		GROUP BY I.cd_Vendedor
/*12.	Mostre o c�digo e o nome do comprador e a m�dia do valor das ofertas e o n�mero de ofertas deste comprador.
*/
SELECT C.cd_Comprador as cod, C.nm_Comprador as nome, AVG(O.vl_Oferta) as media, COUNT(*) as qtde_Oferta
		FROM Comprador as C INNER JOIN Oferta as O
			ON C.cd_Comprador = O.cd_Comprador
		GROUP BY C.nm_Comprador, C.cd_Comprador