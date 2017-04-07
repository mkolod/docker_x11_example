FROM ubuntu:16.04

RUN apt-get update && apt-get install -y firefox

RUN echo "root:x:${uid}:${gid}:Developer,,,:/home/root:/bin/bash" >> /etc/passwd && \
    echo "root:x:${uid}:" >> /etc/group && \
    mkdir -p /etc/sudoers.d/ && \ 
    echo "root ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/root && \
    chmod 0440 /etc/sudoers.d/root

USER root
ENV HOME /home/root
CMD /usr/bin/firefox
