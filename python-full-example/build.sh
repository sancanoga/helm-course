VERSION=$1 #recibe en parametro
echo "Construyendo version ${VERSION}"

export CI_REGISTRY=docker.io
export CI_REGISTRY_IMAGE=index.docker.io/sancanoga/python-example

docker login -u $CI_REGISTRY_USER -p $CI_REGISTRY_PASSWORD $CI_REGISTRY
docker build -t $CI_REGISTRY_IMAGE:${VERSION} .
docker push $CI_REGISTRY_IMAGE:${VERSION}

helm push charts --version="$VERSION" myRepo 