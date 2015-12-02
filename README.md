# PowerShell Scripts for managing Active Directory Federation Services

These scripts are intended for managing the automatic renewal of the token-signing and token-decrypting certificates in AD FS, and should be run directly from the primary AD FS server.

On a yearly basis, the token-signing and token-decrypting certificates (which are self-signed) automatically renew. New certificates are generated 20 days before the current certificates expire, and the certificates are switched 5 days after the new ones are generated.

The relying party trusts that are configured to monitor our federation metadata should see the adiitional x509 certificate appear in the metatdata and handle the change gracefully. Trusts that do not monitor the metadata and have certificate thumbprints manually set in their configuration will have to be manually reconfigured.

Microsoft publish a blog post [here](http://blogs.msdn.com/b/vilath/archive/2015/09/02/how-to-update-certificates-for-ad-fs-3-0.aspx) that explains in more detail how the process is designed to work.

The solution requires at least Visual Studio 2010, and the following additional item(s) installed:

- [Microsoft Azure PowerShell](http://aka.ms/webpi-azps)