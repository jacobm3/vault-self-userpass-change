# vault-self-userpass-change

Example showing how Vault users can be given permission to set their own userpass passwords. 

Note: The userpass auth method is intended for demo purposes and it does not enforce password complexity rules. Recommended production auth methods for users include LDAP, OIDC, Okta, and GitHub. 

Usage:

  $ ./auto-passwd.sh jacob
  Success! Data written to: auth/userpass/users/jacob
  Your new password is: aPo.k*ai;zaediuceil0cahheegheh#u
