set nocount on;
---------------------------------------------------------------------------
--Required fields to fill out.
DECLARE @noOfRecords INT = $(Count)
DECLARE @simTypeId INT = 6 --ATT
DECLARE @prefix nvarchar(10) = '89014'

---------------------------------------------------------------------------

DECLARE @lastSIMNumber BIGINT = 0
SELECT TOP 1 @lastSIMNumber = CONVERT(BIGINT,RIGHT(SIMNumber,15))
FROM tbl_sims_inventory 
WHERE simTypeId = @simTypeId
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
    DECLARE @ki UNIQUEIDENTIFIER = NEWID()
    
    INSERT INTO  @tableToMigrate
		SELECT	
				@prefix+CONVERT(NVARCHAR,@lastSIMNumber)	--SIM Number
END


SELECT CAST(record AS nvarchar(60)) FROM @tableToMigrate


