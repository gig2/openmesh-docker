# Pull base image.
FROM debian:buster
MAINTAINER Thibault Payet "mailoo.org"

# Install.
RUN apt-get update -q -y

RUN apt-get install -qq -y apt-utils
RUN apt-get install -qq -y cmake
RUN apt-get install -q -y git
RUN apt-get install -qq -y ninja-build
RUN apt-get install -qq -y build-essential
RUN apt-get install -qq -y libglew-dev
RUN apt-get install -qq -y libglm-dev
RUN apt-get install -qq -y clang
RUN apt-get install -qq -y meson
RUN apt-get install -qq -y qtbase5-dev
RUN apt-get install -qq -y libqt5opengl5-dev
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

RUN git clone https://github.com/g-truc/glm glm --branch 0.9.9.3 && cd glm && cmake . -GNinja -DGLM_TEST_ENABLE=OFF && ninja && ninja install && cd ..

RUN git clone https://github.com/eigenteam/eigen-git-mirror eigen && mkdir build-eigen && cd build-eigen && cmake ../eigen -GNinja && ninja && ninja install && cd ..

RUN git clone https://github.com/gig2/OpenMesh openmesh --branch add-freebsd-support && \
mkdir build-openmesh && \
cd build-openmesh && \
cmake ../openmesh -DBUILD_APPS=OFF -GNinja && \
ninja && \
ninja install && \
cd .. 
