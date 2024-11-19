# Unattached-volumes-Script
export the list of AWS unattached EBS volumes to an Excel file. Please update "profile" section of script
Run this in Powershell ISE for more granularity 


1) Events rule triggers the Lambda function.
2) Lambda function assumes the IAM role
3)Lambda function then interacts with the EC2 service to identify unattached EBS volumes
4) then Creates snapshots of these volumes
5) Then Tag the snapshots (zotec:component = UnattachedVolume90daydelete)
 6) Deletes the unattached volumes
 7) Then Another Eventbridge triggers a saparate Lambda function daily.
 8) Lambda function assumes the IAM role
 9) Lambda function then interacts with the EC2 service to:
 10) Describe snapshots with the specified tag (zotec:component = UnattachedVolume90daydelete)
 11) Delete snapshots that are older than 90 days
