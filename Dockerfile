FROM centos:7
MAINTAINER ddrinka@gmail.com

COPY squid.repo /etc/yum.repos.d/
RUN yum -y update && yum clean all
RUN yum -y install epel-release		#This provides perl with X509 support
RUN yum -y install perl			#Not sure why dependencies can't work if this is not installed before squid-helpers
RUN yum -y install \
    squid \
    squid-helpers \
  && yum clean all

RUN /usr/lib64/squid/ssl_crtd -c -s /var/lib/ssl_db
RUN chown squid:squid -R /var/lib/ssl_db

EXPOSE 3128/tcp
CMD [ "squid -NYCd 1" ]
