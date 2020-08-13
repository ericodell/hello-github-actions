#!/bin/sh -l

sh -c "echo;echo my environment variables are;echo;env;echo;echo good bye"
sh -c "echo;echo my disk space is;echo;df -h;echo;echo last logins;last;echo"
sh -c "echo;my current working directory;echo;pwd;echo;ls -la;echo"
sh -c "echo Hello world my name is $INPUT_MY_NAME"
