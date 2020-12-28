# backup azure key vault
$backupStorageName = Get-AzureAutomationVariable -Name 'backup-storage-name'
$backupStorageSAS = Get-AzureAutomationVariable -Name 'backup-storage-sas'
$backupStorageSAS = ConvertTo-SecureString -String $backupStorageSAS -AsPlainText -Force
$keyVaultName = Get-AzureAutomationVariable -Name 'keyvault-name'
$backupKeyVaultContainerName = Get-AzureAutomationVariable -Name 'backup-keyvault-container-name'

Backup-AzKeyVault
  -HsmName $keyVaultName
  -StorageAccountName $backupStorageName
  -StorageContainerName $backupKeyVaultContainerName
  -SasToken $backupStorageSAS