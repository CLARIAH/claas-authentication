#!/usr/bin/env bash

if [[ -z "${CMSERVICE_PORT}" ]]; then
    CMSERVICE_PORT="8000"
fi

if [[ -z "${CMSERVICE_DEBUG}" ]]; then
    CMSERVICE_DEBUG=false
fi

if [[ "${CMSERVICE_DEBUG}" = "1" ]] ; then
    cd /opt/cmservice/src/cmservice/service
    /usr/local/bin/python run.py
else
    cd /opt/cmservice
    exec gunicorn -b0.0.0.0:${CMSERVICE_PORT} cmservice.service.run:app
fi