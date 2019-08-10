#!/bin/bash
set -xe
podman pull nvcr.io/nvidia/l4t-base:r32.2
IMAGE=docker.io/zcw607/jetson
VERSION=0.1.0
BUILD_ONLY=0
DOCKER_FILE=./Dockerfile
while test $# -gt 0; do
        case "$1" in
                -h|--help)
                        echo "$package - Build docker image"
                        echo " "
                        echo "$package [options]"
                        echo " "
                        echo "options:"
                        echo "-h, --help              Show brief help"
                        echo "-l, --local             Build only, no push."
                        exit 0
                        ;;
                -l|--local*)
                        echo "Local build only."
                        BUILD_ONLY=1
                        shift
                        ;;
                *)
                        break
                        ;;
        esac
done
podman build -v /usr/bin/qemu-aarch64-static:/usr/bin/qemu-aarch64-static -t ${IMAGE}:${VERSION} . -f ${DOCKER_FILE}
if [ ! "$BUILD_ONLY" -gt 0 ]
then
    echo "pushing"
    podman push ${IMAGE}:${VERSION}
fi
