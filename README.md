# centos-dhcpd
This image lets you quickly setup a DHCPv4 server based on CentOS 7 and its `dhcp` package.

### Building
Just place the Dockerfile in a folder and run:
```sh
docker build --tag=centos-dhcpd:latest .
```

### Running
You need to have a directory in your system that contains the configuration files for the DHCP server. This folder will be mounted as `/etc/dhcp` inside the container. For example `/home/john/dhcp-config`, in which you can place a file, `/home/john/dhcp-config/dhcpd.conf`, that contains your DHCP server configuration.

To run the container:
```sh
docker run --rm -d --network host -v /home/john/dhcp-config:/etc/dhcp --name dhcpd adevur/centos-dhcpd
```
If you want to start the DHCP server automatically on boot:
```sh
docker run --rm --restart always -d --network host -v /home/john/dhcp-config:/etc/dhcp --name dhcpd adevur/centos-dhcpd
```

### Additional info
In order to start the DHCP server, this image uses the very same command described in the official systemd service unit of `dhcp` package. This unit can be found at: `/lib/systemd/system/dhcpd.service`

The command is: `/usr/sbin/dhcpd -f -cf /etc/dhcp/dhcpd.conf -user dhcpd -group dhcpd --no-pid`
