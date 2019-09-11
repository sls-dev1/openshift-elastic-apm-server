From docker.elastic.co/apm/apm-server:7.3.1

#COPY apm-server.yml /usr/share/apm-server/apm-server.yml

USER root

RUN \
    chgrp -R 0 /usr/share/apm-server/ /var/log && \
    chmod -R g=u /usr/share/apm-server/ /var/log

USER apm-server

CMD ["--strict.perms=false","--e"]
