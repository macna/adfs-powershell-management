# Import the MSOnline PowerShell module
Import-Module MSOnline

# Define credentials and connect to the tenant
$cred = Get-Credential -Message "Enter credentials for a cloud-only (i.e. 'username@tenant.onmicrosoft.com') account that has the 'Global Administrator' role."
Connect-MsolService -Credential $cred

# Get the list of domains that are currently federated with Microsoft Online Services and store them in $fedDomains
$fedDomains = Get-MsolDomain | Select-Object Name

