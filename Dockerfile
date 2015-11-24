FROM centos:7
MAINTAINER ddrinka@gmail.com

COPY squid.repo /etc/yum.repos.d/
RUN yum -y update && yum clean all
RUN yum -y install epel-release		#This provides perl with X509 support
RUN yum -y install perl			#Not sure why dependencies cant work if this is not installed before squid-helpers
RUN yum -y install \
    squid \
    squid-helpers \
  && yum clean all

RUN /usr/lib64/squid/ssl_crtd -c -s /var/lib/ssl_db
RUN chown squid:squid -R /var/lib/ssl_db

COPY start_squid_docker.sh /
RUN chmod u+x /start_squid_docker.sh

EXPOSE 3128/tcp
CMD [ "/start_squid_docker.sh" ]
