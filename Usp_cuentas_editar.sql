-- =============================================
-- Author:		Astrid Chacon
-- Create date: 20-02-2025
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE usp_cuentas_editar

	-- Parametros de entrada
	(
	@Codigo int,
	@NumeroCuenta varchar(50),
	@TipoCuenta varchar(50),
	@Saldo decimal(10,2),
	@FechaApertura datetime,
	@Estado varchar(15)
	)

AS
BEGIN

	SET NOCOUNT ON;
	
	Update tbl_cuentas
	set NumeroCuenta = @NumeroCuenta,
		TipoCuenta = @TipoCuenta,
		Saldo = @Saldo,
		FechaApertura= @FechaApertura,
		Estado = @Estado
	where CodigoCuenta = @Codigo
END

Select * from tbl_cuentas