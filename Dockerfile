#FROM souzaonofre/ubuntu-32bits:trusty-upd
FROM 32bit/ubuntu:16.04
ENV DEBIAN_FRONTEND noninteractive
#COPY source.list /etc/apt/sources.list
RUN apt-get update && apt-get install -y --no-install-recommends libcanberra-gtk3-module git build-essential cmake libqt4-dev libgl1-mesa-dev libglu1-mesa-dev libprotobuf-dev protobuf-compiler libode-dev libboost-dev

RUN apt-get install -y ca-certificates libqt4-opengl-dev libgl1-mesa-glx

RUN git clone https://github.com/szi/vartypes.git && cd vartypes && mkdir build && cd build && cmake .. && make && make install && cd ../..

RUN git clone https://github.com/mani-monaj/grSim.git && cd grSim && mkdir build && cd build && cmake .. && make 

RUN ldconfig -v #&& apt-get install -y xauth xorg openbox lightdm plymouth

ENV QT_X11_NO_MITSHM=1
# Replace 1000 with your user / group id
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

