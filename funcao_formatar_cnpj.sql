CREATE FUNCTION dbo.formatar_cnpj (@number bigint)
RETURNS varchar(30)
AS
BEGIN
    DECLARE @formattedNumber varchar(30)
    SET @formattedNumber = FORMAT(@number, '##.###.###/####-##')
    RETURN @formattedNumber
END


