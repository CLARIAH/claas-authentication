#!/bin/sh

cd -P -- "$(dirname -- "$0")" #go to dir of script even if it was called as a symbolic link

kubectl create secret generic satosa-sps --dry-run -o yaml --from-file=service-providers/ | kubectl apply -f- -n <YOUR-NAMESPACE>
kubectl create secret generic satosa-rps --dry-run -o yaml --from-file=relying-parties/ | kubectl apply -f-  -n <YOUR-NAMESPACE>