FROM java:8

MAINTAINER lian.wei fjyqlw@foxmail.com

VOLUME /ROOT

ADD service-api-1.0.jar service-api.jar

RUN bash -c 'touch /service-api.jar'

ENTRYPOINT ["java", "-jar", "service-api.jar"]
