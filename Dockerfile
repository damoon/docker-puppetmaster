# davedamoon/puppetmaster
#
# VERSION               0.0.1

FROM ubuntu:14.04
MAINTAINER David Sauer <davedamoon@gmail.com>

# update image, install repo, install puppetmaster
RUN 	apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y upgrade && \
	DEBIAN_FRONTEND=noninteractive apt-get -y install wget && \
	wget https://apt.puppetlabs.com/puppetlabs-release-trusty.deb -O /tmp/puppet-repo.deb && dpkg -i /tmp/puppet-repo.deb && rm /tmp/puppet-repo.deb && \
	apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y puppetmaster-passenger && \
	apt-get clean && rm -rf /var/lib/apt/lists/*

# Clean up certificates
RUN rm -rf /var/lib/puppet

VOLUME /var/lib/puppet /etc/puppet/modules /etc/puppet/manifests

EXPOSE 8140

ADD start.sh /start.sh

CMD /start.sh
