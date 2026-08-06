FROM ubuntu:24.04

ENV TZ=Etc/UTC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get -y update && \
    apt-get -y install sudo \
                       python3 \
                       tar \
                       wget \
                       curl

ADD . /build_tools
RUN cd /build_tools && python3 ./automate.py server

CMD ["sh"]
