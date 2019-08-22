FROM java:8

MAINTAINER lian.wei fjyqlw@foxmail.com

VOLUME /ROOT

ADD server-gateway-1.0.jar server-gateway.jar

RUN bash -c 'touch /server-gateway.jar'

ENTRYPOINT ["java", "-jar", "server-gateway.jar"]
