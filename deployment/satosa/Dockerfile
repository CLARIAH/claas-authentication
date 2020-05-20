FROM satosa/satosa:v6.1.0

RUN apt-get update && apt-get install -y jq wget && apt-get clean

COPY config /opt/satosa/etc
COPY start.sh /start.sh

# removed subject_id from consent_py, not persistent
COPY consent.py /opt/satosa/lib/python3.5/site-packages/satosa/micro_services/consent.py
# added mapping from eppn's to old subject_ids for some HuC users
COPY hasher.py /opt/satosa/lib/python3.5/site-packages/satosa/micro_services/hasher.py
# add fake email if no email delivered by IdP
COPY attribute_generation.py /opt/satosa/lib/python3.5/site-packages/satosa/micro_services/attribute_generation.py

CMD ["/start.sh"]
