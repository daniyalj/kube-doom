# Firefox over VNC
#
# VERSION               0.1
# DOCKER-VERSION        0.2

FROM    ubuntu:14.04
# make sure the package repository is up to date
RUN     apt-get update

# Install dependencies
RUN     apt-get install -y build-essential libsdl-mixer1.2-dev libsdl-net1.2-dev git gcc x11vnc xvfb wget
RUN     mkdir ~/.vnc

# Setup a password
RUN     x11vnc -storepasswd 1234 ~/.vnc/passwd

# Setup doom
RUN     git clone https://github.com/GideonRed/dockerdoom.git
RUN     wget http://distro.ibiblio.org/pub/linux/distributions/slitaz/sources/packages/d/doom1.wad
RUN     cd /dockerdoom/trunk && ./configure && make && make install

# Autostart psdoom
RUN     bash -c 'echo "/usr/local/games/psdoom -warp E1M1" >> /root/.bashrc'

