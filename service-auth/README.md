# 授权服务器
## docker-redis
```bash
docker run -d -p 6379:6379 --restart=always -v $PWD/data:/data -d --name redis-server redis:3.2 --appendonly yes --requirepass "lian.wei"
```
## docker-mysql
```bash
docker pull mysql:8.0
docker run --name mysql8.0 -p 3306:3306 --restart=always -v ./conf:/etc/mysql/conf.d -v ./logs:/logs -v ./data:/var/lib/mysql -e MYSQL\_ROOT\_PASSWORD=lian.wei -d mysql/mysql-server:8.0
```

参数解释
> - --name 容器名字
> - -p 3306:3306 物理机端口:容器内服务端口
> - -e 运行参数 初始化root用户密码
> - -d 后台运行
> -  --restart=always 重启

## docker-eureka

```bash
docker run -d -p 9000:9000  --restart=always server-eureka:1.0.0 --name server-eureka
docker ps
docker stop [id]
```

## docker-gateway

```bash
docker run -d -p 9001:9001  --restart=always --name server-gateway server-gateway
docker ps
docker stop [id]
```

## docker-auth

```bash
docker run -d -p 9002:9002 service-auth:latest  --restart=always -v /data/logfile/:/data/logfile/ --name=service-auth
docker ps
docker stop [id]
```

## docker-api

```bash
docker run -d -p 9003:9003 service-api:latest  --restart=always -v /data/logfile/:/data/logfile/ --name service-api
docker ps
docker stop [id]
```

## docker-mysql
```bash
docker search mysql
docker pull mysql

docker run -it --rm --name mysql8.0 -e MYSQL_ROOT_PASSWORD=lian.wei -p 3306:3306 -d mysql --restart=always 

进入mysql容器
docker exec -it mysql8.0 bash

mysql -uroot -p

查看用户信息
select host,user,plugin,authentication_string from mysql.user;

ALTER user 'root'@'%' IDENTIFIED WITH mysql_native_password BY 'lian.wei';

FLUSH PRIVILEGES;  
```

```bash
create user 'lian.wei' identified by 'lian.wei';
grant all privileges on *.* to 'lian.wei'@'%';
grant all privileges on auth_cloud.* to 'lian.wei'@'%';  
flush privileges;

show grants for 'lian.wei';
ALTER user 'lian.wei'@'%' IDENTIFIED WITH mysql_native_password BY 'lian.wei';
```

## docker-jenkins
```bash
docker pull jenkins

mkdir /home/jenkins # 创建文件夹

ls -nd jenkins/  #查看文件权限

chown -R 1000:1000 jenkins/ #给uid为1000的权限

docker run -itd -p 9100:8080 --restart=always -p 50000:50000 --name jenkins --privileged=true  -v /home/jenkins:/var/jenkins_home jenkins:latest
http://host:9100
cat /home/jenkins/secrets/initialAdminPassword        查看密码

```

## docker-nexus
```bash
docker pull sonatype/nexus3

docker run --rm -d --privileged=true -p 9101:8081 --restart=always --name nexus -v /root/nexus-data:/var/nexus-data sonatype/nexus3

```

## docker-export
```bash
docker save -o /root/service-auth.latest.tar service-auth:latest

```

## docker-dns

```bash
docker pull sameersbn/bind

docker network create -d macvlan --subnet=10.0.10.0/24 --gateway=10.0.10.1 -o parent=ens33 appnet

```

> - -d 驱动， 这里使用macvlan 
> - --subnet，指定子网 
> - --gateway，指定网关 
> - parent，这里指定宿主机网卡名称 
> - appnet，这是新创建的docker网络名称 

查看网络
```bash
docker network ls

docker network inspect appnet

```

首先在宿主机上创建一个Bind的数据目录：
```bash
mkdir /data/bind
```

然后运行bind镜像：
```bash
docker run -dit --hostname bind -p 10000:10000 --net=appnet --ip=10.0.10.2 --name bind --restart=always --volume /data/bind:/data sameersbn/bind:latest
```

# 命令
run只要执行一次就好了，后续使用start、restart、stop