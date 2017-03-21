sudo docker build -t firefox .
sudo docker run -ti --privileged --rm        -e DISPLAY=$DISPLAY        -v /tmp/.X11-unix:/tmp/.X11-unix        firefox

