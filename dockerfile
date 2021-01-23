FROM ubuntu:18.04

RUN apt update

RUN apt install unzip -y
RUN apt install wget -y
RUN apt install openjdk-8-jre -y

WORKDIR /root

RUN wget https://media.forgecdn.net/files/3052/932/EL-Serverpack-2.03.zip -O server.zip

RUN unzip server.zip
RUN unlink server.zip
RUN mv EL-Serverpack-2.03 server

WORKDIR /root/server

RUN echo "eula=true" > eula.txt
#RUN sed "s/eula=.*/eula=true/g" eula.txt > eula.txt
RUN chmod +x LaunchServer.sh

ENTRYPOINT ["./LaunchServer.sh"]
