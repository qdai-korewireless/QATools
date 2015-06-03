set nocount on; 

DECLARE @Pending INT = 1

select top $(Count) CAST(simnumber as varchar(19)) 
FROM tbl_sims s 
JOIN tbl_locations l on s.locationid = l.LocationID
where l.EnterpriseID = $(CompanyID)
and simnumber like '89012%'
and SIMStatus = 'Active'
and (ActivationsID is not null)
and not exists (
	SELECT TOP 1 1
	from tbl_index_requests_devices ird 
	join tbl_request r on ird.RequestID = r.RequestID and r.RequestStatusID = @Pending
	WHERE ird.simid = s.simid
)
GO