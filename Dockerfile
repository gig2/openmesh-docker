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

COPY CGAL.pc /usr/local/libdata/pkgconfig/

RUN git clone https://github.com/STEllAR-GROUP/hpx && \
cd hpx && git checkout 1.3.0 && cd .. && \
mkdir build-hpx && cd build-hpx && \
cmake ../hpx -GNinja -DHPX_WITH_MALLOC=system && \
ninja && \
ninja install && \
cd ..


# fixup hpx pc files
COPY hpx_application.pc         /usr/local/libdata/pkgconfig
COPY hpx_application_debug.pc   /usr/local/libdata/pkgconfig
COPY hpx_component.pc     /usr/local/libdata/pkgconfig
COPY hpx_component_debug.pc     /usr/local/libdata/pkgconfig

RUN pip3 install tensorflow

