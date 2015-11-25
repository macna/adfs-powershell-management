#If the new token-decrypting and token-signing certificates haven't flipped from secondary to primary yet, do it
$certPopup = New-Object -ComObject Wscript.Shell
$certPopup.Popup("Before proceeding, make sure that you have switched the token-decrypting and token-signing certificates on the primary AD FS server.")

# Import the MSOnline PowerShell module
Import-Module MSOnline

# Define credentials and connect to the tenant
$cred = Get-Credential -Message "Enter credentials for a cloud-only (i.e. 'username@tenant.onmicrosoft.com') account that has the 'Global Administrator' role."
Connect-MsolService -Credential $cred

# Get the list of domains that are currently federated with Microsoft Online Services and store them in $domainList
$domainList = Get-MsolDomain

ForEach ($domain In $domainList)
	{
		$domain
		$domainName = $domain.Name
		$domainAuth = $domain.Authentication

		If ($domainAuth -eq "Federated")
			{
				Update-MsolFederatedDomain -DomainName $domainName -SupportMultipleDomain
			}
	}

# Let the user know when completed
$endPopup = New-Object -ComObject Wscript.Shell
$endPopup.Popup("The update process has completed.")