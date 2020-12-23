$subscriptionId = Get-AzureAutomationVariable -Name subscription_id
$storageConnectionString = Get-AzureAutomationVariable -Name backup_storage_connection_string
$keyVaultName = Get-AzureAutomationVariable -Name key_vault_name
$fileShareName = Get-AzureAutomationVariable -Name file_share_name
$timestamp = Get-Date
$directoryname = "$($timestamp.Year)$($timestamp.Month)$($timestamp.Day)-$($timestamp.Hour)$($timestamp.Minute)$($timestamp.Second)"
az account set --subscription $subscriptionId
az storage directory create --name $directoryname --share-name $fileShareName --connection-string $storageConnectionString
$keyVaultEntries = (az keyvault secret list --vault-name $keyVaultName | ConvertFrom-Json) | Select-Object id, name
foreach($entry in $keyVaultEntries)
{
    az keyvault secret backup --file $entry.name --name $entry.name --vault-name $keyVaultName --subscription $subscriptionId
    az storage file upload --share-name $fileShareName --path $directoryname --source $entry.name --connection-string $storageConnectionString
    Remove-Item $entry.name
}