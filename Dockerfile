#From docker.elastic.co/apm/apm-server:7.3.1
From docker.elastic.co/apm/apm-server-oss:7.3.1

ENV APM_HOME /usr/share/apm-server

#VOLUME ["${APM_HOME}"]
#VOLUME ["/usr/share/"]
#WORKDIR $APM_HOME

COPY apm-server-2.yml ${APM_HOME}/apm-server.yml

USER root

RUN \
    chgrp -R 0 ${APM_HOME}/ /var/log && \
    chmod -R g=u ${APM_HOME}/ /var/log

USER apm-server

CMD ["--strict.perms=false","-e"]
