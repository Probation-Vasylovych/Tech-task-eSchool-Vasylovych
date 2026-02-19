#!/bin/bash 

set -euo pipefail

USER_NAME="Vasylovych_Sasha"
POLICY="arn:aws:iam::aws:policy/AdministratorAccess"

aws iam create-user \
    --user-name "$USER_NAME"

aws iam attach-user-policy \
   --user-name "$USER_NAME" \
    --policy-arn "$POLICY"

aws iam create-access-key \
  --user-name "$USER_NAME" \
  > credentials.json