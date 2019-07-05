FROM debian/stable-slim:arm64v8

MAINTAINER brainstormi

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    usbutils \
    libflac-dev \
    libfaad2  \
    libfaad-dev \
    libmad0 \
    libmad0-dev \
    libasound2-dev \
    libasound2 \
    libasound2-data \
    libvorbis-dev \
    libvo-aacenc-dev \
    libmpg123-dev \
    wget

RUN git clone https://github.com/ralph-irving/squeezelite.git

RUN cd squeezelite & make

CMD /squeezelite -o $SOUNDDEVICE -s $SERVER -n $CLIENTNAME -m $CLIENTMAC