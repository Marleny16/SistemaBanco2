-- =============================================
-- Author:		Astrid Chacon
-- Create date: 16-02-2025
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE usp_cuentas_eliminar

	-- Parametros de entrada
	(
	@Codigo int
	)

AS
BEGIN

	SET NOCOUNT ON;
	
	Delete tbl_cuentas
	where CodigoCuenta = @Codigo
END

