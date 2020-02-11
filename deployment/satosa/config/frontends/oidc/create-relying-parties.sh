#!/bin/sh

cd -P -- "$(dirname -- "$0")" #go to dir of script even if it was called as a symbolic link

echo '{}' > ./registered-relying-parties.json

if find ./registered-relying-parties/ -name '* *' | head -n 1 | grep -q '.'; then
  echo "Some files contained spaces. This is not allowed"
  exit 1
fi

for file in `ls ./registered-relying-parties/*.json`; do
  echo "Converting $file"
  localfile=$(basename "$file")
  id=${localfile%.json}
  jq --arg client_id "$id" '. | .[$client_id]= . | .[$client_id].client_id=$client_id | .[$client_id].application_type="web" | .[$client_id].subject_type="public" | .[$client_id].response_types=["code"] | .[$client_id].client_secret_expires_at=0 | .[$client_id].client_id_issued_at=0 | del(.redirect_uris, .client_secret, .client_name)' $file > ./temp.json

  jq -s '.[0] * .[1]' ./registered-relying-parties.json ./temp.json > ./merged.json
  rm ./temp.json
  mv ./merged.json ./registered-relying-parties.json
done
