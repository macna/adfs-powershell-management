# Get the server name
$hostName = hostname

# Define the email address to send notifications to
$toAddress = "someone@contoso.com"

# Send the notification
Send-MailMessage -To $toAddress -From "$hostName@contoso.com" -SmtpServer smtp.contoso.com -Subject "AD FS Certificate Action Notification" -Priority High -Body "A certificate action has taken place on the AD FS farm. Please log in to $hostName and run the AD FS Management Console for details."