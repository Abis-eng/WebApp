# Build WAR inside Docker, then deploy to Tomcat 10 (Jakarta / Servlet 6)
FROM maven:3.9-eclipse-temurin-21 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

FROM tomcat:10.1-jdk21
COPY --from=build /app/target/WebApp.war /usr/local/tomcat/webapps/
EXPOSE 8080
