# GCC support can be specified at major, minor, or micro version
# (e.g. 8, 8.2 or 8.2.0).
# See https://hub.docker.com/r/library/gcc/ for all supported GCC
# tags from Docker Hub.
# See https://docs.docker.com/samples/library/gcc/ for more on how to use this image
FROM --platform=linux/amd64 gcc:latest

# Install the environment
RUN apt-get -y update && apt-get install -y
RUN apt-get upgrade -y
RUN apt-get install -y clang g++ build-essential g++-i686-linux-gnu

# Check the build environment to match 
# arm64: g++-aarch64-linux-gnu
# i686: g++-i686-linux-gnu

COPY ext/fastbuild/fbuild /usr/local/bin/
COPY ext/fastbuild/fbuildworker /usr/local/bin/
RUN chmod -R 665 /usr/local/bin/fbuild
RUN chmod -R 665 /usr/local/bin/fbuildworker

# These commands copy your files into the specified directory in the image
# and set that as the working location
RUN mkdir -p /usr/src/fbuild
WORKDIR /usr/src/fbuild

ENV FASTBUILD_BROKERAGE_PATH=/usr/share/fbuild-brokerage
CMD ["fbuildworker"]

LABEL Name=fbuildworker Version=0.0.1
