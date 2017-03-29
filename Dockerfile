FROM ubuntu:14.04
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y libcanberra-gtk3-module && \
    apt-get install -y git build-essential cmake \
  	libqt4-dev libgl1-mesa-dev libglu1-mesa-dev \
	libprotobuf-dev protobuf-compiler libode-dev libboost-dev

RUN git clone https://github.com/szi/vartypes.git && \
   cd vartypes && mkdir build && cd build && cmake .. && \
   make && make install && cd ../..

RUN git clone https://github.com/mani-monaj/grSim.git && \
    cd grSim && mkdir build && cd build && cmake .. && make 

ENV QT_X11_NO_MITSHM=1
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/developer && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown ${uid}:${gid} -R /home/developer

USER developer
ENV HOME /home/developer
CMD /grSim/bin/grsim

