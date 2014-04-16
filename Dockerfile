# MongoDB
#
# VERSION 1.0


# parent image
FROM ubuntu:latest

# maintainer
MAINTAINER fran.loehmann@gmail.com

# Add 10gen official apt source to the sources list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/10gen.list

# Hack for initctl not being available in Ubuntu
RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -s /bin/true /sbin/initctl

# Install MongoDB
RUN apt-get update
RUN apt-get install mongodb-10gen

# Create the MongoDB data directory
RUN mkdir -p /data/db


# Expose mongo port
EXPOSE 27017

# set container command to run on start
ENTRYPOINT ["usr/bin/mongod"]

