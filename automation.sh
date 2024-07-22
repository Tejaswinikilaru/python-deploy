#!/bin/bash

git pull origin master

docker build -t python-deploy .

docker stop python-deploy-container || true
docker rm python-deploy-container || true

docker run -d --name python-deploy-container -p 5000:5000 python-deploy

