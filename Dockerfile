FROM tomcat:8.5.53

ADD dist/*.* /usr/local/tomcat/webapps/webapp1/
#ADD **/*.war /usr/docker/SampleProject2/tomcat/
#hola
#hola2

EXPOSE 8080

#CMD ["catalina.sh", "run"]