#!/bin/sh

set -o allexport
if [ -f .env ]; then
    source .env
fi
set +o allexport

# Realizar el inicio de sesión en Docker Hub de manera no interactiva
echo "$DOCKER_PASSWORD" | docker login --username "$DOCKER_USERNAME" --password-stdin

# Verificar si el inicio de sesión fue exitoso
if [ $? -ne 0 ]; then
    echo "Error: Docker login failed."
    exit 1
fi

# Construir y etiquetar las imágenes Docker
docker build --tag "$DOCKER_ACCOUNT/microservice-kubernetes-demo-apache:apm" apache
docker push "$DOCKER_ACCOUNT/microservice-kubernetes-demo-apache:apm"

docker build --tag "$DOCKER_ACCOUNT/microservice-kubernetes-demo-catalog:apm" microservice-kubernetes-demo-catalog
docker push "$DOCKER_ACCOUNT/microservice-kubernetes-demo-catalog:apm"

docker build --tag "$DOCKER_ACCOUNT/microservice-kubernetes-demo-customer:apm" microservice-kubernetes-demo-customer
docker push "$DOCKER_ACCOUNT/microservice-kubernetes-demo-customer:apm"

docker build --tag "$DOCKER_ACCOUNT/microservice-kubernetes-demo-order:apm" microservice-kubernetes-demo-order
docker push "$DOCKER_ACCOUNT/microservice-kubernetes-demo-order:apm"
