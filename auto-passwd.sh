#!/bin/bash

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <username>"
  exit 1
fi

set -e

user_passwd=$(pwgen -y 32 1)

vault write auth/userpass/users/$1 password="$user_passwd"

echo Your new password is: $user_passwd
