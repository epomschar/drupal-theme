#!/usr/bin/env bash
while [[ $# > 0 ]]
do
key="$1"
case $key in
    -r|--rebuild)
    REBUILD=true
    shift # past argument
    ;;
    *)
            # unknown option
    ;;
esac
shift # past argument or value
done

if docker ps -a -f name=my-drupal-data | awk '{print $NF}' | grep -Fxq "my-drupal-data"; then
  HAS_DATA_CONTAINER=true
fi
if docker ps -a -f name=my-drupal | awk '{print $NF}' | grep -Fxq "my-drupal"; then
  HAS_CONTAINER=true
fi
if docker ps -f name=my-drupal | awk '{print $NF}' | grep -Fxq "my-drupal";then
  HAS_CONTAINER_RUNNING=true
fi

if [[ "${REBUILD}" = true ]]; then
  docker build -t clempat/drupal:latest --rm=true ./docker
  if [ $? -ne 0 ]; then exit 1; fi

  if [[ "${HAS_CONTAINER_RUNNING}" = true ]]; then
    docker kill $(docker ps -q -f name=drupal)
    HAS_CONTAINER_RUNNING=false
  fi

  if [[ "${HAS_DATA_CONTAINER}" = true || "${HAS_CONTAINER}" = true ]]; then
    docker rm -v $(docker ps -aq -f name=drupal)
    HAS_DATA_CONTAINER=false
    HAS_CONTAINER=false
  fi
fi

# If no data container
if [[ "${HAS_DATA_CONTAINER}" != true ]]; then
  docker create --name my-drupal-data -v $(pwd)/build:/var/www/html/themes/custom/my_theme clempat/drupal /bin/true
  if [ $? -ne 0 ]; then exit 1; fi
fi

# IF no container created
if [[ "${HAS_CONTAINER}" != true ]]; then
  docker create --name my-drupal -p "8080:80" --volumes-from my-drupal-data clempat/drupal
  if [ $? -ne 0 ]; then exit 1; fi
fi

# IF no running container
if [[ "${HAS_DATA_CONTAINER_RUNNING}" != true ]];then
  docker start my-drupal
  if [ $? -ne 0 ]; then exit 1; fi
fi

IP=$(docker-machine ip ${DOCKER_MACHINE_NAME})
echo "======================================"
echo "Drupal available at http://${IP}:8080"
echo "======================================"

gulp
