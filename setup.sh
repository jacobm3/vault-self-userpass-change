vault auth enable userpass
vault write auth/userpass/users/jacob \
  password=foo \
  policies=db1,userpasschange

# Get this userpass instance accessor string
userpass_accessor="$(vault auth list | awk '/^userpass/ {print $3}')"

# Create the userpass policy using this instance accessor string
cat > userpasschange.hcl << EOF
path "auth/userpass/users/{{identity.entity.aliases.${userpass_accessor}.name}}" {
  capabilities = [ "read","list","update","delete" ]
  allowed_parameters = {
    "password" = []
  }
}
EOF

vault policy write userpasschange userpasschange.hcl
