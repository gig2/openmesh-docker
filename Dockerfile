# Pull base image.
FROM ubuntu:disco
MAINTAINER Thibault Payet "mailoo.org"

# Install.
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -q -y
RUN apt-get install -q -y apt-utils
RUN apt-get install -q -y gnupg

RUN apt-get install -q -y python3-software-properties
RUN apt-get install -q -y software-properties-common

RUN apt-get update -q -y

RUN apt dist-upgrade -q -y

RUN apt-get install -q -y cmake
RUN apt-get install -q -y meson
RUN apt-get install -q -y ninja-build
RUN apt-get install -q -y git
RUN apt-get install -q -y build-essential
RUN apt-get install -q -y clang
RUN apt-get install -q -y libglew-dev
RUN apt-get install -q -y libglm-dev
RUN apt-get install -q -y qtbase5-dev
RUN apt-get install -q -y qtchooser
RUN apt-get install -q -y libqt5opengl5-dev
RUN apt-get install -q -y qtbase5-dev-tools
RUN apt-get install -q -y pkg-config
RUN apt-get install -q -y doxygen
RUN apt-get install -q -y graphviz
RUN apt-get install -q -y libsdl2-dev
RUN apt-get install -q -y xvfb
RUN apt-get install -q -y libgl1-mesa-dev
RUN apt-get install -q -y libgl1-mesa-glx
RUN apt-get install -q -y libgl1-mesa-dri
RUN apt-get install -q -y libegl1-mesa-dev
RUN apt-get install -q -y libgles2-mesa-dev
RUN apt-get install -q -y libopencv-dev
RUN apt-get install -q -y libopencv-*
RUN apt-get install -q -y gcovr
RUN apt-get install -q -y libcgal-dev
RUN apt-get install -q -y libeigen3-dev

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

RUN ln -s /usr/lib/x86_64-linux-gnu/qt5/bin/uic /usr/bin/uic-qt5

RUN git clone https://github.com/STEllAR-GROUP/hpx && \
cd hpx && git checkout 1.3.0 && cd .. && \
mkdir build-hpx && cd build-hpx && \
cmake ../hpx -GNinja -DHPX_WITH_MALLOC=system && \
ninja && \
ninja install && \
cd ..
