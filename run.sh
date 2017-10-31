#!/bin/bash

# Add these options to display graphical apps in the vagrant VM :
#	-e DISPLAY=$DISPLAY \
#   -v /tmp/.X11-unix:/tmp/.X11-unix \
#   -v $HOME/.Xauthority:/root/.Xauthority \
#   -e  QT_X11_NO_MITSHM=1 \

docker run --privileged \
	-v /dev/vboxdrv:/dev/vboxdrv \
	-v /dev/vboxnetctl:/dev/vboxnetctl \
	-p 8081:8081 \
	-e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v $HOME/.Xauthority:/root/.Xauthority \
    -e  QT_X11_NO_MITSHM=1 \
	-it vagrant-inside-docker:latest \
	/bin/bash -c "vagrant up && vagrant ssh"
