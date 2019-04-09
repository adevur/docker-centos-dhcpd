

FROM centos:7

MAINTAINER adevur (madavurro@protonmail.com)

RUN yum clean all -y \
  && yum update -y \
  && yum install -y dhcp \
  && yum autoremove -y

RUN rm -rf /etc/dhcp

CMD ["/usr/sbin/dhcpd", \
  "-f", \
  "-cf", "/etc/dhcp/dhcpd.conf", \
  "-user", "dhcpd", \
  "-group", "dhcpd", \
  "--no-pid"]

