# GCC support can be specified at major, minor, or micro version
# (e.g. 8, 8.2 or 8.2.0).
# See https://hub.docker.com/r/library/gcc/ for all supported GCC
# tags from Docker Hub.
# See https://docs.docker.com/samples/library/gcc/ for more on how to use this image
FROM --platform=linux/amd64 gcc:latest

# Install the environment
RUN apt-get -y update && apt-get install -y
RUN apt-get install -y clang gcc g++

COPY ext/fastbuild/fbuild /usr/local/bin/
RUN chmod -R 665 /usr/local/bin/fbuild

# These commands copy your files into the specified directory in the image
# and set that as the working location
COPY . /usr/src/hytales
WORKDIR /usr/src/hytales

CMD ["./build-and-run.sh"]

LABEL Name=fastbuild Version=0.0.1