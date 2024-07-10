#!/bin/sh

# Verificar que las variables de entorno estén definidas
if [ -z "${DOCKER_PASSWORD}" ] || [ -z "${DOCKER_USERNAME}" ] || [ -z "${DOCKER_ACCOUNT}" ]; then
    echo "Error: Variables de entorno no definidas."
    exit 1
fi

echo "LA CONTRASEÑA ES ${DOCKER_PASSWORD}"
echo "EL USUARIO ES ${DOCKER_USERNAME}"
echo "LA CUENTA ES ${DOCKER_ACCOUNT}"