# Pull base image.
FROM fedora:31
MAINTAINER Thibault Payet "mailoo.org"

# Install.
RUN dnf -y upgrade

RUN dnf -y install cmake
RUN dnf -y install meson
RUN dnf -y install ninja-build
RUN dnf -y install gcc
RUN dnf -y install glew-devel
RUN dnf -y install glm-devel
RUN dnf -y install qt5-devel
RUN dnf -y install pkgconf
RUN dnf -y install pkgconf-pkg-config
RUN dnf -y install doxygen
RUN dnf -y install graphviz
RUN dnf -y install xorg-x11-server-Xvfb
RUN dnf -y install opencv-devel
RUN dnf -y install gcovr
RUN dnf -y install CGAL-devel
RUN dnf -y install eigen3-devel
RUN dnf -y install hwloc-devel
RUN dnf -y install hwloc
RUN dnf -y install hpx-devel
RUN dnf -y install git
RUN dnf -y install qt5
RUN dnf -y install qt5-qtbase-devel
RUN dnf -y install qtchooser
RUN dnf -y install qt5-*

RUN git clone https://github.com/g-truc/glm glm --branch 0.9.9.3 && cd glm && cmake . -GNinja -DGLM_TEST_ENABLE=OFF && ninja && ninja install && cd ..

RUN git clone https://github.com/eigenteam/eigen-git-mirror eigen && mkdir build-eigen && cd build-eigen && cmake ../eigen -GNinja && ninja && ninja install && cd ..

RUN git clone https://github.com/gig2/OpenMesh openmesh && \
mkdir build-openmesh && \
cd build-openmesh && \
cmake ../openmesh -DBUILD_APPS=OFF -GNinja && \
ninja && \
ninja install && \
cd .. 

COPY CGAL.pc /usr/lib64/pkgconfig/

RUN dnf -y install pcl-devel
RUN dnf -y install libepoxy-devel
RUN dnf -y install SDL2-devel
RUN dnf -y install xerces-c-devel

RUN dnf -y install mingw64-libepoxy
RUN dnf -y install mingw64-SDL2
RUN dnf -y install mingw64-boost
RUN dnf -y install mingw64-binutils
RUN dnf -y install mingw64-eigen3
RUN dnf -y install mingw64-gcc
RUN dnf -y install mingw64-gcc-c++
RUN dnf -y install mingw64-xerces-c
