set nocount on;
---------------------------------------------------------------------------
--Required fields to fill out.
DECLARE @noOfRecords INT = $(Count)
DECLARE @delimiter NVARCHAR = '|'
DECLARE @simTypeId INT = 6
DECLARE @prefix nvarchar(10) = '89014'

---------------------------------------------------------------------------

DECLARE @lastSIMNumber BIGINT = 0
DECLARE @lastIMSI BIGINT = 0
SELECT TOP 1 @lastSIMNumber = CONVERT(BIGINT,RIGHT(SIMNumber,15)), @lastIMSI = CONVERT(BIGINT,IMSI) 
FROM tbl_sims_inventory 
WHERE simTypeId = @simTypeId
and IMSI is not null
and SUBSTRING(SIMNumber,1,5) = @prefix
ORDER BY SIMNumber DESC

DECLARE @tableToMigrate TABLE(
	record NVARCHAR(MAX)
)

DECLARE @i int = 0
WHILE @i < @noOfRecords 
BEGIN
    SET @i = @i + 1
    SET @lastSIMNumber = @lastSIMNumber + 1
    SET @lastIMSI = @lastIMSI + 1
    DECLARE @ki UNIQUEIDENTIFIER = NEWID()
    
    INSERT INTO  @tableToMigrate
		SELECT	
				@prefix+CONVERT(NVARCHAR,@lastSIMNumber)+ @delimiter +	--SIM Number
				CONVERT(NVARCHAR,@lastIMSI)+ @delimiter +		--IMSI
				'1111' + @delimiter +							--PIN1
				'51292586' + @delimiter +							--PUK1
				'2222' + @delimiter +						--PIN2
				'2222'										--PUK2
END


SELECT CAST(record AS nvarchar(60)) FROM @tableToMigrate


