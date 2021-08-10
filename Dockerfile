FROM gradle:jdk10 as builder

COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src
RUN gradle build

FROM openjdk:8-jdk-alpine
LABEL maintainer="elouaeramine266@hotmail.com"
VOLUME /main-app
ADD build/libs/spring-boot-postgresql-base-project-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java" , "-jar", "/app.jar"]
