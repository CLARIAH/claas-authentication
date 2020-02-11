# https://hub.docker.com/_/python
FROM python:3.7-slim-buster
COPY CMservice/ /opt/cmservice
RUN mkdir /opt/cmservice/keys && mkdir /opt/cmservice/data
COPY setup.py /opt/cmservice/setup.py
COPY settings.cfg /opt/cmservice/settings.cfg
COPY start.sh /start.sh
RUN chmod +x /start.sh && cd /opt/cmservice && python setup.py install
ENV CMSERVICE_CONFIG /opt/cmservice/settings.cfg

CMD ["/start.sh"]
