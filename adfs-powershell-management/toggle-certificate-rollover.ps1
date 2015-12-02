# Import the AD FS PowerShell Module
Import-Module ADFS

# Disable automatic certificate renewal
Set-ADFSProperties -AutoCertificateRollover $false

# Re-enable automatic certificate renewal
Set-ADFSProperties -AutoCertificateRollover $true