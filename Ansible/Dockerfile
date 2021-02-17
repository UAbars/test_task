FROM ubuntu:18.04

MAINTAINER Serhii Melnyk <barskrsp@gmail.com>

RUN apt-get update
RUN apt install software-properties-common -y 

RUN apt-add-repository --yes --update ppa:ansible/ansible
RUN apt install ansible unzip curl -y 

#-----------------------------------------------
# Install aws-cli
#-------------------------------------------------

RUN cd /tmp
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install 
RUN rm awscliv2.zip
RUN aws --version


#----------------------------
# ADD user Ansible
#----------------------------

ARG USER=ansible
ARG PASS=ansible
ARG UID=1000
ARG GID=1000
RUN useradd -m ${USER} --uid=${UID} && echo "${USER}:${PASS}" | \
      chpasswd
USER ${UID}:${GID}
WORKDIR /home/${USER}
RUN ansible --version

