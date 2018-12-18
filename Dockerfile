FROM java
ENV CATALINA_HOME /opt/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
RUN mkdir -p "$CATALINA_HOME" && apt-get update
WORKDIR $CATALINA_HOME
ENV TOMCAT_MAJOR 8
ENV TOMCAT_VERSION 8.5.35
ENV TOMCAT_TGZ_URL http://mirrors.estointernet.in/apache/tomcat/tomcat-8/v8.5.35/bin/apache-tomcat-8.5.35.tar.gz
RUN set -x \
    && curl -fSL "$TOMCAT_TGZ_URL" -o apache-tomcat.tar.gz \
    && curl -fSL "$TOMCAT_TGZ_URL.asc" -o apache-tomcat.tar.gz.asc \
    && tar -xvf apache-tomcat.tar.gz --strip-components=1 \
    && rm bin/*.bat \
    && rm apache-tomcat.tar.gz*
EXPOSE 8080
CMD ["catalina.sh", "run"]
