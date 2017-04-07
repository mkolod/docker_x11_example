FROM ubuntu:16.04

RUN apt-get update && apt-get install -y firefox graphviz eog

USER root
ENV HOME /home/root
CMD /usr/bin/firefox
