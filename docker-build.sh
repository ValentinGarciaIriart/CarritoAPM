#!/bin/sh

echo $DOCKER_PASSWORD | docker login --username $DOCKER_USERNAME --password-stdin

docker build --tag=$DOCKER_ACCOUNT/microservice-kubernetes-demo-apache:apm apache
docker push $DOCKER_ACCOUNT/microservice-kubernetes-demo-apache:apm

docker build --tag=$DOCKER_ACCOUNT/microservice-kubernetes-demo-catalog:apm microservice-kubernetes-demo-catalog
docker push $DOCKER_ACCOUNT/microservice-kubernetes-demo-catalog:apm

docker build --tag=$DOCKER_ACCOUNT/microservice-kubernetes-demo-customer:apm microservice-kubernetes-demo-customer
docker push $DOCKER_ACCOUNT/microservice-kubernetes-demo-customer:apm

docker build --tag=$DOCKER_ACCOUNT/microservice-kubernetes-demo-order:apm microservice-kubernetes-demo-order
docker push $DOCKER_ACCOUNT/microservice-kubernetes-demo-order:apm
