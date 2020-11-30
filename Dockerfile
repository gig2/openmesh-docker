# Pull base image.
FROM fedora:33
MAINTAINER Thibault Payet "mailoo.org"

# Install.
RUN dnf -y upgrade

RUN dnf -y install cmake
RUN dnf -y install meson
RUN dnf -y install ninja-build
RUN dnf -y install gcc
RUN dnf -y install glew-devel
RUN dnf -y install glm-devel
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
RUN dnf -y install qt5-qtbase-devel
RUN dnf -y install qtchooser
RUN dnf -y install qt5-*

RUN dnf -y install glm-devel
RUN dnf -y install eigen3-devel
RUN dnf -y install OpenMesh-devel
RUN dnf -y install OpenMesh

RUN dnf -y install pcl-devel
RUN dnf -y install libepoxy-devel
RUN dnf -y install SDL2-devel
RUN dnf -y install xerces-c-devel

RUN dnf -y install boost-python3
RUN dnf -y install boost-python3-devel

RUN pip install tensorflow
