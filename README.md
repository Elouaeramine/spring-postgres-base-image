# Spring Boot PostgreSQL Base Project

This application was developed to demonstrate Spring Boot with PostgreSQL with simple API.

Technologies Used

- Spring Boot 2.4.1
- Spring Data JPA
- Lombok
- PostgreSQL

How to Run this application

First change the **src/main/resources/application.properties** with your postgreSQL instance properties.

Then,

```shell
$ ./gradlew bootRun
```

or create a build using following command,

```shell
$ ./gradlew clean build
```

Then start the JAR file using java

```shell
$ java -jar build/libs/spring-boot-postgresql-base-project-0.0.1-SNAPSHOT.jar
```

### Related Articles

- [Docker Compose For Spring Boot with PostgreSQL](https://javatodev.com/docker-compose-spring-boot-postgresql/)
