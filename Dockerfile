FROM ubuntu
# updating the repo
RUN apt-get update -y
# Installing the java
RUN apt-get install openjdk-8-jdk -y
#RUN apt-get install java-1.8.0-openjdk
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/jre
# Installing the git
#RUN apt-get install git -y
# Installing python
#ENV DEBIAN_FRONTEND=noninteractive
#RUN apt-get install -y software-properties-common && \
 #   add-apt-repository -y ppa:deadsnakes/ppa && \
  #  apt-get update && \
   # apt install -y python3.8
#RUN ln -s /usr/bin/python3.8 /usr/bin/python
# installing maven
RUN apt-get install -y curl
ARG MAVEN_VERSION=3.8.8
ARG USER_HOME_DIR="/root"
#ARG SHA=f790857f3b1f90ae8d16281f902c689e4f136ebe584aba45e4b1fa66c80cba826d3e0e52fdd04ed44b4c66f6d3fe3584a057c26dfcac544a60b301e6d0f91c26
ARG BASE_URL=https://downloads.apache.org/maven/maven-3/${MAVEN_VERSION}/binaries

RUN mkdir -p /usr/share/maven /usr/share/maven/ref \
  && curl -fsSL -o /tmp/apache-maven.tar.gz ${BASE_URL}/apache-maven-${MAVEN_VERSION}-bin.tar.gz \
  && tar -xzf /tmp/apache-maven.tar.gz -C /usr/share/maven --strip-components=1 \
  && rm -f /tmp/apache-maven.tar.gz \
  && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

ENV MAVEN_HOME /opt/apache-maven-{MAVEN_VERSION}
#ENV MAVEN_CONFIG "$USER_HOME_DIR/.m2"
#RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
#RUN apt-get install -y nodejs

# Get all softwares
RUN dpkg -l | grep 'java\|maven' | awk '/^ii/ {printf "%s %s\n", $2, $3}'

#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
