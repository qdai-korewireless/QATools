set nocount on;
---------------------------------------------------------------------------
--Required fields to fill out.
DECLARE @noOfRecords INT = $(Count)
DECLARE @simTypeId INT = 11
DECLARE @prefix nvarchar(2) = '04'

---------------------------------------------------------------------------


DECLARE @lastMsisdn BIGINT = 0
SELECT TOP 1 @lastMsisdn = CONVERT(BIGINT,RIGHT(MSISDN,8)) 
FROM tbl_sims 
WHERE simTypeId = @simTypeId
and Msisdn is not null
and SUBSTRING(MSISDN,1,2) = @prefix
ORDER BY MSISDN DESC

DECLARE @tableToMigrate TABLE(
	record NVARCHAR(MAX)
)

DECLARE @i int = 0
WHILE @i < @noOfRecords 
BEGIN
    SET @i = @i + 1
    SET @lastMsisdn = @lastMsisdn + 1
    DECLARE @ki UNIQUEIDENTIFIER = NEWID()
    
    INSERT INTO  @tableToMigrate
		SELECT	
				@prefix+CONVERT(NVARCHAR,@lastMsisdn) 	--Msisdn
				
END

SELECT CAST(record AS nvarchar(10)) FROM @tableToMigrate
