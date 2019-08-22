FROM java:8-alpine

MAINTAINER lian.wei fjyqlw@foxmail.com

VOLUME /data/service-auth

ADD service-auth-1.0.jar service-auth.jar

ENTRYPOINT ["java", "-jar", "service-auth.jar"]

#设置时区
RUN /bin/cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo 'Asia/Shanghai' >/etc/timezone