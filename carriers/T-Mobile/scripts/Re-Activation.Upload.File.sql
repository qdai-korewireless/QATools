set nocount on; 
DECLARE @Pending INT = 1

select top $(Count) CAST(simnumber as varchar(19)) 
FROM tbl_sims s
JOIN tbl_locations l on s.locationid = l.locationid
where EnterpriseID = $(CompanyID)
and simnumber like '89012%'
and SIMStatus = 'Stock'
and exists (
	SELECT TOP 1 1
	from tbl_index_requests_devices ird 
	join tbl_req_deactivations ra on ird.requestid = ra.requestid
	WHERE ird.simid = s.simid
)
and not exists (
	SELECT TOP 1 1
	from tbl_index_requests_devices ird 
	join tbl_request ra on ird.requestid = ra.requestid
	WHERE ird.simid = s.simid and ra.requeststatusid = @Pending
)
GO