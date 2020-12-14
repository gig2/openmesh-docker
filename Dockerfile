# Pull base image.
FROM ubuntu:focal
MAINTAINER Thibault Payet "mailoo.org"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update -q -y
RUN apt install -q -y apt-utils

RUN apt install -q -y  cmake \
  meson \
  ninja-build \
  build-essential \
  libglew-dev \
  libepoxy-dev \
  libglm-dev \
  pkg-config \
  doxygen \
  graphviz \
  libopencv-dev \
  gcovr \
  libcgal-dev \
  libeigen3-dev \
  libhwloc-dev \
  hwloc \
  git \
  libpcl-dev \
  libsdl2-dev \
  libxerces-c-dev \
  libboost-all-dev \
  python3-pip

RUN git clone https://github.com/g-truc/glm glm --branch 0.9.9.3 && cd glm && cmake . -GNinja -DGLM_TEST_ENABLE=OFF && ninja && ninja install && cd ..

RUN git clone https://github.com/eigenteam/eigen-git-mirror eigen && mkdir build-eigen && cd build-eigen && cmake ../eigen -GNinja && ninja && ninja install && cd ..

RUN git clone https://github.com/gig2/OpenMesh openmesh && \
mkdir build-openmesh && \
cd build-openmesh && \
cmake ../openmesh -DBUILD_APPS=OFF -GNinja && \
ninja && \
ninja install && \
cd .. 

RUN pip3 install tensorflow

RUN apt install -q -y glpk-utils libglpk-dev
COPY glpk.pc /usr/lib/x86_64-linux-gnu/pkgconfig/

RUN apt install -q -y coinor-cbc coinor-libcbc-dev

RUN git clone https://github.com/STEllAR-GROUP/hpx && \
cd hpx && git checkout 1.4.1 && cd .. && \
mkdir build-hpx && cd build-hpx && \
cmake ../hpx -GNinja -DHPX_WITH_MALLOC=system && \
ninja && \
ninja install && \
cd .. && \
rm -rf build-hpx
