FROM fedora:34

RUN dnf -y update

RUN dnf -y install python3-pip

RUN pip3 install youtube-dl

