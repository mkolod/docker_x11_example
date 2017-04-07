FROM ubuntu:16.04

RUN apt-get update && apt-get install -y firefox

# Replace 1000 with your user / group id
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/root && \
    echo "root:x:${uid}:${gid}:Developer,,,:/home/root:/bin/bash" >> /etc/passwd && \
    echo "root:x:${uid}:" >> /etc/group && \
    mkdir -p /etc/sudoers.d/ && \ 
    echo "root ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/root && \
    chmod 0440 /etc/sudoers.d/root && \
    chown ${uid}:${gid} -R /home/root

#RUN apt-get install -qqy x11-apps

USER root
ENV HOME /home/root
CMD /usr/bin/firefox
