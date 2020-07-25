FROM debian:stable-slim

MAINTAINER bushchannelstepper

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    usbutils \
    usbip \
    lsb-base \
#    libopus-dev \
#    libopusfile-dev \
    libflac-dev \
    libfaad-dev \
    libmad0-dev \
    libasound2-dev \
    libasound2-data \
    libvorbis-dev \
    libvo-aacenc-dev \
    libmpg123-dev \
    libsoxr-lsr0 \
    libsox-dev \
    sox \
    libsoxr-dev


#RUN git clone https://github.com/ralph-irving/squeezelite.git && cd squeezelite && make all OPTS="-DDSD -DRESAMPLE -DOPUS" && cp squeezelite /usr/local/bin
RUN git clone https://github.com/ralph-irving/squeezelite.git && cd squeezelite && make all OPTS="-DDSD -DRESAMPLE" && cp squeezelite /usr/local/bin

CMD squeezelite -o $SOUNDDEVICE -s $SERVER -n $CLIENTNAME $SQUEEZELITE_EXTRA_ARGS
