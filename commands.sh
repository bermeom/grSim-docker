sudo docker build -t grsim .
sudo docker run --name grsim -ti --privileged --rm -e DISPLAY=$DISPLAY -u 1000:1000 -v /tmp/.X11-unix:/tmp/.X11-unix grsim

