
USE IMOVEIS
/* Exec1 
Fazer um procedimento que no ato da inclusão de uma nova oferta  o banco atualize automaticamente a quantidade de ofertas no campo qt_Ofertas
da tabela Imóvel
*/

Create Trigger AtualizaqtOferta on Oferta
	For Insert
As
	Begin
		Declare @qt_Ofertas int, @cd_Imovel int
		set @cd_Imovel = (Select cd_Imovel from Inserted group by cd_Imovel)
		set @qt_Ofertas = (Select Count(cd_Imovel) from Oferta where cd_Imovel = @cd_Imovel)
		update Imovel set qt_Ofertas = @qt_Ofertas where cd_Imovel = @cd_Imovel
End


/*
	Select * from Imovel
	Select * from Oferta order by cd_Imovel
	Select * from Parcelas
	


	Insert into Oferta 
		values (2,5,200000,'11-10-2011')
	go

	Insert into Imovel
		values (7, 2, 1, 1,'SP','Rua dos Bobos, nº 0', 200, 500, 'Casa do Seu Zé', 500000, 1, NULL, NULL, NULL)
	go
*/
/* Exe 2
Criar uma tabela com o nome Contrato e outra tabela com o nome Parcelas, conforme descrição abaixo

No ato da gravação do contrato, o banco deverá gerar automaticamente os registros de mensalidades do parcelamento com os Imóveis, 
mesmo em pagamento a vista, deverá gerar um registro.
*/


Create Table Contrato
		( cd_Contrato int IDENTITY(1,1), cd_Imovel int NOT NULL, dt_Contrato date, vl_Contrato money, qt_Parcelas int)
go

Create Table Parcelas
		( cd_Parcela int NOT NULL, cd_Contrato int NOT NULL, vl_Parcela money, dt_Vencimento date, dt_Pagamento date, vl_Multa money )
go

Alter Table Contrato
	Add Constraint PK_Contrato
		Primary Key (cd_Contrato)
go

Alter Table Contrato
	Add Constraint FK_Imovel
		Foreign Key (cd_Imovel)
		References Imovel
go
Alter Table Parcelas
	Add Constraint PK_Parcela
		Primary Key (cd_Parcela, cd_Contrato)
go

Create Trigger CriaParcela on Contrato
	For Insert
As
	Begin
		Declare @cd_Contrato int, @vl_Contrato money, @qt_Parcelas money, @cd_Parcela int, @dt_Contrato date
		set @cd_Contrato = (Select cd_Contrato from Inserted group by cd_Contrato)
		set @vl_Contrato = ( Select vl_Contrato from Contrato where cd_Contrato = @cd_Contrato )
		set @qt_Parcelas = ( Select qt_Parcelas from Contrato where cd_Contrato = @cd_Contrato )
		set @dt_Contrato = ( Select dt_Contrato from Contrato where cd_Contrato = @cd_Contrato )
		set @cd_Parcela = 0
	while( @qt_Parcelas > @cd_Parcela )
		Begin
		set @dt_Contrato = DATEADD(MONTH, 1, @dt_Contrato)
		set @cd_Parcela = @cd_Parcela + 1
		Insert into Parcelas
			values ( @cd_Parcela, @cd_Contrato, @vl_Contrato/@qt_Parcelas, @dt_Contrato, NULL, NULL)				 
		End		
		
End

/*

Insert into Contrato
		values (5,'05-01-2018', 1000000, 4)
	go

	Select * from Contrato
	Select * from Parcelas

	Delete from Parcelas
	Delete from Contrato

*/
/*Exe 3
Fazer um procedimento que no ato da alteração da data do pagamento de uma parcela, o banco atualize automaticamente o valor da multa, 
caso existir atraso. Calcular o valor da multa em 3% por dia de atraso. Caso a data de pagamento seja nula, o banco deve zerar o valor da multa.
*/

CREATE TRIGGER AtualizarDtPagamento ON Parcelas
	FOR UPDATE
AS
	BEGIN
		Declare @dt_Pagamento date, @dt_Vencimento date, @cd_Parcela int, @cd_Contrato int, @vl_Parcela money, @diasematraso int, @vl_Multa money
		set @cd_Contrato = ( Select cd_Contrato from Inserted group by cd_Contrato )
		set @cd_Parcela = ( Select cd_Parcela from Inserted group by cd_Parcela )
		set @dt_Pagamento = (Select dt_Pagamento from Parcelas where cd_Contrato = @cd_Contrato and cd_Parcela = @cd_Parcela )
		set @dt_Vencimento = (Select dt_Vencimento from Parcelas where cd_Contrato = @cd_Contrato and cd_Parcela = @cd_Parcela )
		set @vl_Parcela = ( Select vl_Parcela from Parcelas where cd_Contrato = @cd_Contrato and cd_Parcela = @cd_Parcela )
	END

		--calculo da multa em 3% por dia de atraso)
		set @diasematraso = (DATEDIFF(DAY,@dt_Vencimento,@dt_Pagamento))
				
		if ((DATEDIFF(DAY,@dt_Vencimento,@dt_Pagamento) > 0))
		BEGIN
			update Parcelas
			 set vl_Multa = @vl_Parcela * 1.03
			 where cd_Contrato = @cd_Contrato
			 and cd_Parcela = @cd_Parcela

			
			
		
			
					update Parcelas
					set vl_Multa = vl_Parcela * ( 1 + (@diasematraso * 0.03))
					where cd_Contrato = @cd_Contrato
					and cd_Parcela = @cd_Parcela
					
					
					
				END
		-- condição para Caso a data de pagamento seja nula, o banco deve zerar o valor da multa.
		if (@dt_Pagamento <=  @dt_Vencimento)
		Begin
		update Parcelas set vl_Multa = 0
		where cd_Parcela = @cd_Parcela	
		and cd_Contrato = @cd_Contrato
			End
			

			select * from Parcelas

			Update Parcelas
			Set dt_Pagamento = '2018-03-01'
			Where cd_Parcela = 2 and cd_Contrato = 1

			Update Parcelas
			Set dt_Pagamento = '2018-03-01'
			Where cd_Parcela = 1 and cd_Contrato = 1
	



/*Exe 4
Fazer um procedimento para gerar uma tabela Inadimplentes informando o código do imóvel, o número da parcela, 
a data de vencimento e o valor a ser pago dos Imóveis que estão inadimplentes no mês anterior ao mês corrente, 
para gerar a cobrança dos pagamentos em atraso.
*/

CREATE PROCEDURE Usp_Inadimplentes
	
AS

	CREATE TABLE Inadimplentes (cd_Imovel int not null,
								cd_Parcela int not null,
								dt_Vencimento date,
								vl_Parcela money)
	
	
	INSERT INTO Inadimplentes
		SELECT C.cd_Imovel, P.cd_Parcela, P.dt_Vencimento, P.vl_Parcela 
		FROM Parcelas P, Contrato C
		WHERE P.cd_Contrato = C.cd_Contrato 
							AND P.dt_Pagamento IS NULL 
							AND P.dt_Vencimento < DATEADD(MONTH,-1,GETDATE ())
		

SELECT * FROM Inadimplentes
 
Drop Table Inadimplentes
GO




-- teste

EXEC Usp_Inadimplentes

select * from Parcelas
