#!/usr/bin/env bash

# for Click library to work in satosa-saml-metadata
export LC_ALL=C.UTF-8
export LANG=C.UTF-8

# exit immediately on failure
set -e

if [ -z "${DATA_DIR}" ]; then
   DATA_DIR=/opt/satosa/etc
fi

if [ ! -d "${DATA_DIR}" ]; then
   mkdir -p "${DATA_DIR}"
fi

if [ -z "${PROXY_PORT}" ]; then
   PROXY_PORT="8000"
fi

if [ -z "${METADATA_DIR}" ]; then
   METADATA_DIR="${DATA_DIR}"
fi

cd ${DATA_DIR}

mkdir -p ${METADATA_DIR}

if [ ! -d ${DATA_DIR}/attributemaps ]; then
   cp -pr /opt/satosa/attributemaps ${DATA_DIR}/attributemaps
fi

./frontends/oidc/create-relying-parties.sh

# Activate virtualenv
. /opt/satosa/bin/activate

# generate metadata for front- (IdP) and back-end (SP) and write it to mounted volume
sleep 20
/opt/satosa/bin/satosa-saml-metadata ${DATA_DIR}/proxy_conf.yaml ${DATA_DIR}/cert/metadata.key ${DATA_DIR}/cert/metadata.crt --dir ${METADATA_DIR}

# start the proxy
while true; do
  exec gunicorn -b0.0.0.0:${PROXY_PORT} satosa.wsgi:app
done

