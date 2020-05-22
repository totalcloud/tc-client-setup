#!/bin/bash

docker run -d --rm \
--network host \
--name redis \
redis:latest

sleep 5

docker run --rm -it \
--env-file $HOME/env.list \
--network host \
-v $HOME/.ssh:/usr/src/app/secrets/ssh \
-v $HOME/aws:/usr/src/app/secrets/aws \
--name tc-client \
totalcloud/tc-agent:latest
