FROM ubuntu:14.10
MAINTAINER David Sauer <davedamoon@gmail.com>

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y puppetmaster-passenger && apt-get clean
RUN rm -rf /var/lib/puppet

VOLUME /var/lib/puppet /etc/puppet/modules /etc/puppet/manifests
EXPOSE 8140

ADD start.sh /start.sh
CMD /start.sh
