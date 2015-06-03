set nocount on; 

select top $(Count) CAST(simnumber as varchar(20)) 
FROM tbl_sims s
JOIN tbl_locations l on s.locationid = l.locationid
where EnterpriseID = $(CompanyID)
and simnumber like '89014%'
and SIMStatus = 'Stock'
and not exists (
	SELECT TOP 1 1
	from tbl_index_requests_devices ird 
	join tbl_request ra on ird.requestid = ra.requestid
	WHERE ird.simid = s.simid and ra.requeststatusid = 1
)
GO