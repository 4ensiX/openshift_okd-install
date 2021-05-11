# openshift_okd-install
record the installation of openshift(okd).<br>

environment: kvm(libvirt-qemu) on Debian<br>

dependancy:<br>
dnsutils(dig),dnsmasq,qemu-system,libvirt-daemon-system,libvirt-clients,virtinst,haproxy,nfs

# preparation
Reference https://github.com/openshift/installer/blob/master/docs/dev/libvirt/README.md
```
echo "net.ipv4.ip_forward = 1" | sudo tee /etc/sysctl.d/99-ipforward.conf
sudo sysctl -p /etc/sysctl.d/99-ipforward.conf
```
<br>
``/etc/default/libvirtd``
```
libvirtd_opts="--listen"
```

<br>
``/etc/libvirt/libvirtd.conf``
```
listen_tls = 0
listen_tcp = 1
auth_tcp = "none"
tcp_port = "16509"
```
## advance preparation
In order for libvirt to access and create files.<br>
example↓
```
$ mkdir /var/lib/libvirt/ignition
$ mkdir /var/lib/libvirt/base-image
```

`/etc/apparmor.d/abstractions/libvirt-qemu`
```
  # ignitons and base-images access
  /var/lib/libvirt/ignition/* r,
  /var/lib/libvirt/base-image/* r,

```


## example files
- system configuration files -> conf-files
- virsh shellscripts for creating cluster nodes-> virsh
- install-config.yaml<br>
okd install config 
- okd-net.xml<br>
libvirt network config
