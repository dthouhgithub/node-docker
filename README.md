# My application is built to learn docker with nodejs

## 1. Build image
   docker build --tag node-docker .
   docker images

## 2. Run container
   docker run -d -p 3333:3000 node-docker

## 3. Volume, network and database
   docker image pull mongo:4.2.8

   #### volume for data

   docker volume create mongodb

   #### volume for config

   docker volume create mongodb_config

   #### create a network that my application and database will use to talk with each other

   docker network create mongodb

   #### run MonggoDB in container and attach to the volume and network

   docker run -it --rm -d -v mongodb:/data/db \
   -v mongodb_config:/data/configdb -p 27017:27017 \
   --network mongodb \
   --name mongodb \
   mongo:4.2.8

   #### start my application

   docker compose -f docker-compose.dev.yml up --build

   #### send a request to server

   curl --request GET --url http://94.237.65.5:3333

## 4. Use mocha for testing
   yarn add mocha

## Link docker image is pushed from github workflows

https://hub.docker.com/repository/docker/azoomminh/node-mysql-learn/general
