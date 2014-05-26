FROM tifayuki/java:java7
MAINTAINER Feng Honglin <hfeng@tutum.co>

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y wget pwgen

ENV TOMCAT_VERSION 8.0.8
ENV CATALINA_HOME /tomcat

# INSTALL TOMCAT
RUN wget http://archive.apache.org/dist/tomcat/tomcat-8/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz -O tomcat.tar.gz
RUN tar zxf tomcat.tar.gz && rm tomcat.tar.gz && mv apache-tomcat* tomcat

ADD create_tomcat_admin_user.sh /create_tomcat_admin_user.sh
ADD run.sh /run.sh
RUN chmod +x /*.sh

EXPOSE 8080
CMD ["/run.sh"]
