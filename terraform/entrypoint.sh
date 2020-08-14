#!/bin/sh -l

sh -c "echo;echo my environment variables are;echo;env;echo;echo good bye"
sh -c "echo;echo my disk space is;echo;df -h;echo;"
sh -c "echo;my current working directory;echo;pwd;echo;ls -la;echo"
sh -c "echo Hello my terraform version is $INPUT_TF_Version"
#sh -c "update;apt-get update"
#sh -c "echo install curl, git, sudo and zip;apt-get install -y curl git sudo unzip;curl --version;unzip --version"
#sh -c "echo installing terraform;curl -o /tmp/terraform.zip https://releases.hashicorp.com/terraform/0.13.0/terraform_0.13.0_linux_amd64.zip; cd /tmp/;ls -la;unzip /tmp/terraform.zip; mv /tmp/terraform /usr/bin/terraform;chmod u+x /usr/bin/terraform; ls -l /usr/bin/terraform;file /usr/bin/terraform;which terraform;terraform --version"
sh -c "echo checking terraform;which terraform;terraform --version"
sh -c "echo checking terragrunt;which terragrunt;terragrunt --version"
