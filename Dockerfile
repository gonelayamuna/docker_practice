FROM ubuntu:20.04
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
RUN apt-get install -y curl unzip jq wget zip
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

#python installation
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get install -y software-properties-common && \
  add-apt-repository -y universe && \
  apt-get update && \
  apt-get install -y python3.9
RUN unlink /usr/bin/python3
RUN ln -s /usr/bin/python3.9 /usr/bin/python
RUN ln -s /usr/bin/python3.9 /usr/bin/python3

RUN apt-get install -y python3.9-distutils

RUN apt-get install -y python3-pip


#aws cli installation
RUN curl https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o awscliv2.zip \
  && unzip awscliv2.zip \
  && ./aws/install \
  && rm -rf aws awscliv2.zip

#Git insatllation
RUN apt-get install git -y

# Node installation
ARG NODE_VERSION=14.18.3
ARG NODE_PACKAGE=node-v${NODE_VERSION}-linux-x64
ARG NODE_HOME=/opt/${NODE_PACKAGE}
ENV NODE_PATH ${NODE_HOME}/lib/node_modules
ENV PATH ${NODE_HOME}/bin:$PATH
# https://nodejs.org/dist/v18.16.1/node-v18.16.1.pkg
# https://nodejs.org/dist/v18.16.1/node-v18.16.1-darwin-arm64.tar.gz
# https://nodejs.org/dist/v18.16.1/node-v18.16.1-darwin-x64.tar.gz
RUN curl https://nodejs.org/dist/v${NODE_VERSION}/${NODE_PACKAGE}.tar.gz | tar -xzC /opt/
RUN npm install -g npm -y
RUN node --version
RUN npm --version

ARG SERVERLESS_VERSION=3.26.0
RUN npm install -g serverless@${SERVERLESS_VERSION}
RUN serverless -v
#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
