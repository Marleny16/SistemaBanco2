-- =============================================
-- Author:		Astrid Chacon
-- Create date: 20-02-2025
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE usp_cuentas_crear

	-- Parametros de entrada
	(
	@CodigoCliente int,
	@NumeroCuenta varchar(50),
	@TipoCuenta varchar(50),
	@Saldo decimal(10,2),
	@FechaApertura datetime,
	@Estado varchar(15)
	)

AS
BEGIN

	SET NOCOUNT ON;
	Insert into tbl_cuentas
	(
		CodigoCliente,
		NumeroCuenta,
		TipoCuenta,
		Saldo,
		FechaApertura,
		Estado

		
	) values
	(
		@CodigoCliente,
		@NumeroCuenta,
		@TipoCuenta,
		@Saldo,
		@FechaApertura,
		@Estado
	)
END

