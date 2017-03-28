sudo docker build -t grsim .
#sudo docker run -ti --privileged --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v /usr/lib/i386-linux-gnu/dri/:/usr/lib/i386-linux-gnu/dri/  grsim -p 224.5.23.2:10020:10020 
sudo docker run --name grsim -ti --privileged --rm -e DISPLAY=$DISPLAY -u 1000:1000 -v /tmp/.X11-unix:/tmp/.X11-unix grsim
