# TODO: Try from an alpine ubuntu to reduce size (current is 451mb)
FROM ubuntu:20.04

# Required to avoid interaction while doing apt udpate
ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /usr/app

RUN apt update && apt install -y autogen autoconf build-essential libtool libtool-bin

COPY . /usr/app

RUN ./autogen.sh && ./configure && make && make install

CMD ["./examples/rnnoise_demo", "./examples/noisy.wav", "./examples/output.raw"]