FROM ubuntu:16.04

ENV DEBIAN_FRONTEND=noninteractive

# Configure timezone and locale to spanish and America/Bogota timezone. Change locale and timezone to whatever you want
ENV LANG="es_ES.UTF-8"
ENV LANGUAGE=es_ES
RUN locale-gen es_ES.UTF-8 && locale-gen es_ES
RUN echo "America/Bogota" > /etc/timezone && \
    apt-get install -y locales && \
    sed -i -e "s/# $LANG.*/$LANG.UTF-8 UTF-8/" /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=$LANG

RUN apt-get update -y && apt-get install -y software-properties-common python-software-properties python3-software-properties sudo
RUN add-apt-repository universe
RUN apt-get update -y && apt-get install -y vim xterm pulseaudio cups curl libgconf2-4 iputils-ping libnss3-1d libxss1 wget xdg-utils libpango1.0-0 fonts-liberation

# Goto https://www.nomachine.com/download/download&id=10 and change for the latest NOMACHINE_PACKAGE_NAME and MD5 shown in that link to get the latest version.
ENV NOMACHINE_PACKAGE_NAME nomachine_5.2.11_1_amd64.deb
ENV NOMACHINE_MD5 d697e5a565507d522380c94d2f295d07

# Install the mate-desktop-enviroment version you would like to have
RUN apt-get update -y && \
    apt-get install -y mate-desktop-environment-extras

# download tor, firefox, libreoffice and git
RUN add-apt-repository ppa:webupd8team/tor-browser
RUN apt-get update -y && apt-get install -y tor firefox libreoffice htop nano git vim tor-browser

# Install nomachine, change password and username to whatever you want here
RUN curl -fSL "http://download.nomachine.com/download/5.2/Linux/${NOMACHINE_PACKAGE_NAME}" -o nomachine.deb \
&& echo "${NOMACHINE_MD5} *nomachine.deb" | md5sum -c - \
&& dpkg -i nomachine.deb

ADD nxserver.sh /

ENTRYPOINT ["/nxserver.sh"]
