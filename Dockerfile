# Pull base image.
FROM debian:unstable
MAINTAINER Thibault Payet "mailoo.org"

# Install.
RUN apt install -y -q meson
