# Jakarta EE (Servlet 6) needs Tomcat 10+, not Tomcat 9
FROM tomcat:10.1-jdk21

# WAR name from pom.xml <finalName>WebApp</finalName> → target/WebApp.war
COPY target/WebApp.war /usr/local/tomcat/webapps/

EXPOSE 8080
