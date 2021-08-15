#Stage - #1
FROM openjdk:8 AS GENERATE_FAT_FILE

# create folder inside docker env
ENV APP_HOME=/root/dev/app/

# make src folder to put source code
RUN mkdir -p $APP_HOME/src

#change your working directory
WORKDIR $APP_HOME

#copy required files to build final executable Jar
COPY build.gradle settings.gradle gradle.properties gradlew gradlew.bat $APP_HOME

#copy gradle wrapper
COPY gradle $APP_HOME/gradle

#copy main source code folder ( test folder not required inside the docker)
COPY src/main $APP_HOME/src/main

#  skip test stage , bootJar will create executable Jar in gradle which is FAT Jar
# (-x for skip stage, -i for INFO mode to see all stages)
RUN ./gradlew build -x test -i


#Stage - #2
#We need JRE now to run the app , NO JDK not required
FROM openjdk:8-jre

# create folder inside docker env
ENV HOTBOX=/root

WORKDIR $HOTBOX

#Copy FAT JAR from previous stage to create final docker image
COPY --from=GENERATE_FAT_FILE /root/dev/app/build/libs/* .

#copy wiremock contracts (this is specific to my app)
COPY contracts $HOTBOX/app

EXPOSE 8080

#since root folder have one FAT JAR , make sure the final jar name
# java -jar *.jar working inside image but not outside need to debug
CMD ["java","-jar","spring-boot-application.jar"]
