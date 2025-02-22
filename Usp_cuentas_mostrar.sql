-- =============================================
-- Author:		Astrid Chacon
-- Create date: 2025-02-20
-- Description:	Store procedure para mostrar las cuentas de la tabla tbl_uentas
-- =============================================
CREATE PROCEDURE usp_cuentas_mostrar 
AS
BEGIN
	SET NOCOUNT ON;

	Select 
		CodigoCuenta as 'CodigoCuenta',
		NumeroCuenta, 
		TipoCuenta,
		Saldo,
		FechaApertura,
		Estado
	from tbl_cuentas;
END
