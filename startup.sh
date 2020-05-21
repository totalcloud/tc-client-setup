#!/bin/bash

docker run -d --rm \
--network host \
--name redis \ 
redis:latest

sleep 5

docker run --rm -it \
--enfile .env \
--network host \
-v $HOME/.ssh:/usr/src/app/secrets/ssh
--name tc-client \
totalcloud/tc-agent:latest
