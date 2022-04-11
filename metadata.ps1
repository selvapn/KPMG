Invoke-RestMethod -Headers @{"Metadata"="true"} -Method GET -Uri "http://169.254.169.254/latest/user-data/" | ConvertTo-Json -Depth 64 | Out-File data.json
$jsondata = get-Content .\data.json | ConvertFrom-Json
if (test-path -Path data.json -ErrorAction Stop) {
    $check = Read-Host "Enter data needs to be fetched in json"
    foreach ($data in $jsondata.psobject.Properties.name) {
        if ($jsondata.$data.psobject.Properties.name -eq $check){
           write-host "Data $check : Value :$($jsondata.$data.$check)"
        }
    }
}
else {write-host "Json file hasnt downloaded"}

