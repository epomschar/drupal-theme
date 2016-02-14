#!/usr/bin/env bash

docker build -t clempat/drupal:latest --rm=true ./docker

# If no data container
if ! docker ps -a -f name=my-drupal-data | awk '{print $NF}' | grep -Fxq "my-drupal-data"; then
  docker create --name my-drupal-data -v $(pwd)/build:/var/www/html/themes/custom/my_theme clempat/drupal /bin/true
fi

# IF no container created
if ! docker ps -a -f name=my-drupal | awk '{print $NF}' | grep -Fxq "my-drupal"; then
  docker create --name my-drupal -p "8080:80" --volumes-from my-drupal-data clempat/drupal
fi

# IF no running container
if ! docker ps -f name=my-drupal | awk '{print $NF}' | grep -Fxq "my-drupal"; then
  docker start my-drupal
fi

IP=$(docker-machine ip ${DOCKER_MACHINE_NAME})
echo "======================================"
echo "Drupal available at http://${IP}:8080"
echo "======================================"

gulp
