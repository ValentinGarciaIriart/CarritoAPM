#!/bin/sh

# Verificar que se han pasado los argumentos esperados
if [ $# -ne 3 ]; then
    echo "Uso: $0 <DOCKER_PASSWORD> <DOCKER_USERNAME> <DOCKER_ACCOUNT>"
    exit 1
fi

DOCKER_PASSWORD=$1
DOCKER_USERNAME=$2
DOCKER_ACCOUNT=$3

echo "LA CONTRASEÑA ES ${DOCKER_PASSWORD}"
echo "EL USUARIO ES ${DOCKER_USERNAME}"
echo "LA CUENTA ES ${DOCKER_ACCOUNT}"

# Iniciar sesión en Docker Hub de manera no interactiva
echo "${DOCKER_PASSWORD}" | docker login --username "${DOCKER_USERNAME}" --password-stdin

# Verificar si el inicio de sesión fue exitoso
if [ $? -ne 0 ]; then
    echo "Error: Docker login falló."
    exit 1
fi

# Construir y empujar las imágenes Docker con las etiquetas correctas
docker build --tag "${DOCKER_ACCOUNT}/microservice-kubernetes-demo-apache:apm" apache
docker push "${DOCKER_ACCOUNT}/microservice-kubernetes-demo-apache:apm"

docker build --tag "${DOCKER_ACCOUNT}/microservice-kubernetes-demo-catalog:apm" microservice-kubernetes-demo-catalog
docker push "${DOCKER_ACCOUNT}/microservice-kubernetes-demo-catalog:apm"

docker build --tag "${DOCKER_ACCOUNT}/microservice-kubernetes-demo-customer:apm" microservice-kubernetes-demo-customer
docker push "${DOCKER_ACCOUNT}/microservice-kubernetes-demo-customer:apm"

docker build --tag "${DOCKER_ACCOUNT}/microservice-kubernetes-demo-order:apm" microservice-kubernetes-demo-order
docker push "${DOCKER_ACCOUNT}/microservice-kubernetes-demo-order:apm"
