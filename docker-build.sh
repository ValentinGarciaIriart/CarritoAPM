#!/bin/sh

# Iniciar sesión en Docker Hub de manera no interactiva
echo "${DOCKER_PASSWORD}" | docker login --username "${DOCKER_USERNAME}" --password-stdin

# Verificar si el inicio de sesión fue exitoso
if [ $? -ne 0 ]; then
    echo "Error: Docker login failed."
    exit 1
fi

