FROM tomcat:8
MAINTAINER PMV
COPY /target/mvc_1.war /var/lib/tomcat8/webapps/
EXPOSE 8090
CMD ["java", "-jar", "/app/mvc_1.war"]
