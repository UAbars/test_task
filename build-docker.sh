#!/bin/bash
echo "Please choose a system for building:"
options=("Ansible" "Terraform" "task2")
select opt in "${options[@]}"
do
    case $opt in 
#--------------------------------------------------------------------------------------------------
# Build images and run with ansible and awscli
#-------------------------------------------------------------------------------------------------
        "Ansible")
        echo "You have selected Ansible, we start building the image"
        cd $PWD/Ansible
        docker-compose up -d
        ;;
#--------------------------------------------------------------------------------------------------
#Build images and run with Terraform
#--------------------------------------------------------------------------------------------------
        "Terraform")
        echo "You have selected Terraform, we start building the image"
        mkdir /tmp/Terraform
        echo "Created a volume directory for Terraform in /tmp"
        cd $PWD/Terraform
        docker build -t terraform:melnyk .
        docker run -it terraform:melnyk
        ;;
#--------------------------------------------------------------------------------------------------
#Build and run containers with NginX+PHP-FPM+Redis 
#--------------------------------------------------------------------------------------------------
        "task2")
        echo "Start runing webaplication"
        cd Web
        docker-compose up -d
        ;;
    esac
     break
done