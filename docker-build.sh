#!/bin/sh

set -o allexport
if [ -f .env ]; then
    source .env
fi
set +o allexport


echo $DOCKER_PASSWORD | docker login --username $DOCKER_USERNAME --password-stdin

docker build --tag=microservice-kubernetes-demo-apache apache
docker tag microservice-kubernetes-demo-apache $DOCKER_ACCOUNT/microservice-kubernetes-demo-apache:apm
docker push $DOCKER_ACCOUNT/microservice-kubernetes-demo-apache:apm

docker build --tag=microservice-kubernetes-demo-catalog microservice-kubernetes-demo-catalog
docker tag microservice-kubernetes-demo-catalog $DOCKER_ACCOUNT/microservice-kubernetes-demo-catalog:apm
docker push $DOCKER_ACCOUNT/microservice-kubernetes-demo-catalog:apm

docker build --tag=microservice-kubernetes-demo-customer microservice-kubernetes-demo-customer
docker tag microservice-kubernetes-demo-customer $DOCKER_ACCOUNT/microservice-kubernetes-demo-customer:apm
docker push $DOCKER_ACCOUNT/microservice-kubernetes-demo-customer:apm

docker build --tag=microservice-kubernetes-demo-order microservice-kubernetes-demo-order
docker tag microservice-kubernetes-demo-order $DOCKER_ACCOUNT/microservice-kubernetes-demo-order:apm
docker push $DOCKER_ACCOUNT/microservice-kubernetes-demo-order:apm