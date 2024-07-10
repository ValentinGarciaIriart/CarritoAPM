#!/bin/sh

# Iniciar sesión en Docker Hub de manera no interactiva
echo "$(DOCKER_PASSWORD)" | docker login --username "$(DOCKER_USERNAME)" --password-stdin

# Construir y empujar las imágenes Docker con las etiquetas correctas
docker build --tag $(DOCKER_ACCOUNT)/microservice-kubernetes-demo-apache:apm apache
docker push $(DOCKER_ACCOUNT)/microservice-kubernetes-demo-apache:apm

docker build --tag $(DOCKER_ACCOUNT)/microservice-kubernetes-demo-catalog:apm microservice-kubernetes-demo-catalog
docker push $(DOCKER_ACCOUNT)/microservice-kubernetes-demo-catalog:apm

docker build --tag $(DOCKER_ACCOUNT)/microservice-kubernetes-demo-customer:apm microservice-kubernetes-demo-customer
docker push $(DOCKER_ACCOUNT)/microservice-kubernetes-demo-customer:apm

docker build --tag $(DOCKER_ACCOUNT)/microservice-kubernetes-demo-order:apm microservice-kubernetes-demo-order
docker push $(DOCKER_ACCOUNT)/microservice-kubernetes-demo-order:apm
