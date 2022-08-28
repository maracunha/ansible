FROM ubuntu:focal AS base
WORKDIR /usr/local/bin
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y software-properties-common curl git build-essential && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y curl git ansible build-essential && \
    apt-get clean autoclean && \
    apt-get autoremove --yes

FROM base AS re235
ARG TAGS
RUN addgroup --gid 1000 re235
RUN adduser --gecos re235 --uid 1000 --gid 1000 --disabled-password re235
USER re235
WORKDIR /home/re235

FROM re235
COPY . .
CMD ["sh", "-c", "ansible-playbook $TAGS local.yml"]

