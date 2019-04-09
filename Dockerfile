

FROM centos:7

MAINTAINER adevur (madavurro@protonmail.com)

RUN yum clean all -y \
  && yum update -y \
  && yum install -y dhcp \
  && yum autoremove -y \
  && yum clean all -y

COPY ./dumb-init_1.2.2_amd64 /usr/local/bin/dumb-init

RUN chmod +x /usr/local/bin/dumb-init

ENTRYPOINT ["/usr/local/bin/dumb-init", "--"]

CMD ["/usr/sbin/dhcpd", \
  "-f", \
  "-cf", "/etc/dhcp/dhcpd.conf", \
  "-user", "dhcpd", \
  "-group", "dhcpd", \
  "--no-pid"]

