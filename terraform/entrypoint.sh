#!/bin/bash 
set -xe

echo;echo my environment variables are;echo;env;echo;echo good bye
echo;echo my disk space is;echo;df -h;echo;
echo;echo my current working directory;echo;pwd;echo;ls -la;echo
echo Hello my terraform version is $INPUT_TF_Version
for i in ansible aws git terraform terragrunt; do echo checking $i; which $i;$i --version;done
