FROM gradle:jdk8 as builder

COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src
RUN gradle build --info

FROM openjdk:8-jdk-alpine
LABEL maintainer="elouaeramine266@hotmail.com"
EXPOSE 8080
COPY --from=builder /home/gradle/src/spring-boot-postgresql-base-project/build/distributions/spring-boot-postgresql-base-project.tar /app/
WORKDIR /app
RUN tar -xvf spring-boot-postgresql-base-project.tar
WORKDIR /app/spring-boot-postgresql-base-project
CMD bin/spring-boot-postgresql-base-project
