FROM ubuntu:latest

MAINTAINER Serhii Melnyk <barskrsp@gmail.com>

RUN apt-get update -y 
RUN apt-get install unzip wget -y 


#--------------------------------------
# Install Terraform
#---------------------------------------

# Download terraform for linux
RUN wget https://releases.hashicorp.com/terraform/0.14.6/terraform_0.14.6_linux_amd64.zip 
RUN unzip terraform_0.14.6_linux_amd64.zip 
RUN mv terraform /usr/local/bin/

RUN terraform --version