FROM boot2docker/boot2docker:latest
MAINTAINER Frank Zhao <frank@frankzhao.net>

RUN apt-get update

RUN apt-get install apt-utils -qq
RUN apt-get install bird -qq
RUN apt-get install iputils-ping -qq
RUN apt-get install docker -qq

RUN mkdir -p /etc/bird.d
RUN mkdir -p /{log,run}
RUN mkdir -p /run/bird

COPY ./bird.conf /etc/bird.conf

ENTRYPOINT ["/usr/sbin/bird"]
CMD ["-c", "/etc/bird.conf", "-s", "/run/bird/bird.ctl", "-f"]
