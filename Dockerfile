FROM gradle:jdk10 as builder

COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src
RUN gradle build --no-daemon --info

FROM openjdk:8-jdk-alpine
LABEL maintainer="elouaeramine266@hotmail.com"
EXPOSE 8080
COPY --from=builder /home/gradle/src/baseimage/build/distributions/baseimage.tar /app/
WORKDIR /app
RUN tar -xvf baseimage.tar
WORKDIR /app/baseimage
CMD bin/baseimage
