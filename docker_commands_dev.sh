#!/bin/bash
# Usage: ./docker_commands_dev.sh <host_port>

if [ -z "$1" ]; then
  echo "Error: No host port provided."
  echo "Usage: $0 <host_port>"
  exit 1
fi

HOST_PORT=$1
IMAGE_NAME="my-react-app-image"  # TODO: Replace with your actual image name

# Run the Docker container, mapping the host port to container port 3000
# --rm removes the container when it exits, --name gives it a unique name
CONTAINER_NAME="react_app_${HOST_PORT}"

# Build the Docker image before running
docker build -t my-react-app-image:latest .

docker run -d --rm --name $CONTAINER_NAME -p ${HOST_PORT}:3000 $IMAGE_NAME 
