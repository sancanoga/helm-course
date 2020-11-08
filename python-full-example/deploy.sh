VERSION=$1
ENVIRONMENT=$2
CUSTOM_VAR=$3

export CI_REGISTRY=docker.io
export CI_REGISTRY_IMAGE=index.docker.io/sancanoga/python-example

echo "Desplegando version $VERSION en el entorno $ENVIRONMENT"
helm repo update
helm upgrade $ENVIRONMENT-python-example myRepo/python-example --install \
--namespace $ENVIRONMENT \
--version $VERSION \
--set image=$CI_REGISTRY_IMAGE:${VERSION} \
--set customVar=$CUSTOM_VAR
