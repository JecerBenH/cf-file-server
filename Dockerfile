FROM openjdk:8-jre-alpine
EXPOSE 5683/udp
MAINTAINER jecer
COPY target/cf-simplefile-server-1.0-SNAPSHOT-jar-with-dependencies.jar.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
