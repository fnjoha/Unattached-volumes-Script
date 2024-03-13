aws ec2 describe-volumes --filters Name=status,Values=available --profile fnjoh | ConvertFrom-Json | Select-Object -ExpandProperty Volumes | ForEach-Object {
    $volumeId = $_.VolumeId
    $tags = ($_.Tags | ForEach-Object { "$($_.Key): $($_.Value)" }) -join ', '
    $_ | Select-Object VolumeId, AvailabilityZone, Size, VolumeType, State, @{Name='Tags'; Expression={$tags}}
} | Export-Csv -Path unattached_volumes.csv -NoTypeInformation
