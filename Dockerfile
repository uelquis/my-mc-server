FROM alpine:latest

RUN [ "apk", "update" ]
RUN [ "apk", "upgrade"]
RUN [ "apk", "add", "openjdk17"]
RUN [ "apk", "add", "udev"]

EXPOSE 8000 25565/

COPY server.jar /home/server.jar

WORKDIR /home

RUN ["java", "-Xmx1024M", "-Xms1024M", "-jar", "server.jar", "nogui"]
RUN ["sed", "-i", "s/eula=false/eula=true/g", "eula.txt"]
RUN ["java", "-Xmx1024M", "-Xms1024M", "-jar", "server.jar", "nogui"]