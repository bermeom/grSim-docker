sudo docker build -t grsim .
#sudo docker run -ti --privileged --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v /usr/lib/i386-linux-gnu/dri/:/usr/lib/i386-linux-gnu/dri/  grsim
sudo docker run -ti --privileged --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v /usr/lib/i386-linux-gnu/dri/:/usr/lib/i386-linux-gnu/dri/  grsim
