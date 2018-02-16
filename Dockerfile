FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install -y python-pip cron

RUN pip install elasticsearch-curator && \
    mkdir ~/.curator && \
    mkdir /curator-config

ADD curator.yml /root/.curator/curator.yml

ENV ELASTICSEARCH_HOST=elasticsearch \
    ELASTICSEARCH_PORT=9200

COPY curator-config /curator-config/

VOLUME /curator-config

ADD curator-cron /etc/cron.d/curator-cron

ADD docker-entrypoint.sh /docker-entrypoint.sh

RUN touch /var/log/cron.log && \
    chmod 0755 /etc/cron.d/curator-cron && \
    chmod 0755 /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["cron", "-f"]
