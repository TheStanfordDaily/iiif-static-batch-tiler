FROM ubuntu:18.04

COPY files.txt /tmp/files.txt
COPY process-image.sh /tmp/process-image.sh
COPY setup.sh /tmp/setup.sh

RUN ["chmod", "+x", "/tmp/process-image.sh"]
RUN ["chmod", "+x", "/tmp/setup.sh"]

ENV DEBIAN_FRONTEND noninteractive

RUN /tmp/setup.sh

ENTRYPOINT /tmp/process-image.sh