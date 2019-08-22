FROM java:8-alpine

MAINTAINER lian.wei fjyqlw@foxmail.com

VOLUME /ROOT

ADD server-eureka-1.0.jar server-eureka.jar

# RUN bash -c 'touch /server-eureka.jar'

ENTRYPOINT ["java", "-jar", "server-eureka.jar"]
