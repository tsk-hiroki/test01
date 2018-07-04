#!/bin/sh
set -xeu

readonly POLICY_VERSIONS=$(aws iam list-policy-versions --policy-arn arn:aws:iam::061138534699:policy/bill | jq -r '.Versions[].VersionId')
readonly POLICY_COUNT=(`echo $POLICY_VERSIONS`)

# ポリシードキュメントが5個ある場合は一番古いバージョンのドキュメントを削除
if [ ${#POLICY_COUNT[*]}  -eq 5 ]
then
   DELETE_POLICY_VERSION=$(echo "${POLICY_VERSIONS[*]}" | sort | head -1)
   aws iam delete-policy-version --policy-arn arn:aws:iam::061138534699:policy/bill --version-id ${DELETE_POLICY_VERSION}  
fi

