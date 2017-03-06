FROM persapiens/maven-oraclejdk:3.3.9-8u121
MAINTAINER Marcelo Fernandes <persapiens@gmail.com>

# update and upgrade
RUN apt-get update -qqy && \
    apt-get upgrade -qqy --no-install-recommends 

# install headless gui tools
RUN apt-get install -qqy xvfb libgconf-2-4

# install firefox
RUN apt-get -qqy --no-install-recommends install firefox \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD xvfb-firefox /usr/bin/xvfb-firefox
RUN chmod +x /usr/bin/xvfb-firefox \
    && mv /usr/bin/firefox /usr/bin/firefox-original \
    && ln -s /usr/bin/xvfb-firefox /usr/bin/firefox

RUN mkdir /.cache /.dbus /.gconf /.mozilla /Desktop \
  && chmod -R 777 /.cache /.dbus /.gconf /.mozilla /Desktop
