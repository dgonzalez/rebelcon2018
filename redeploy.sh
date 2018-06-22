#!/usr/bin/env bash

APIDEPLOYMENT="infrastructure/deployment.yaml"
CURVERSION=$(cat ${APIDEPLOYMENT}| grep image | awk {'print $2'} | cut -d':' -f 2)
NEWVERSION=$(($CURVERSION + 1))
echo "new version: $NEWVERSION"
sed -i '.original' "s/my-server:[0-9][0-9]*/my-server:${NEWVERSION}/g;" ${APIDEPLOYMENT}
cat ${APIDEPLOYMENT}| grep image
docker build --no-cache -t elexy/my-server:${NEWVERSION} .
docker push elexy/my-server:${NEWVERSION}
kubectl apply -f infrastructure/deployment.yaml