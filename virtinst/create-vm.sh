# !/bin/bash
machine_name=""
MAC="XX:XX:XX:XX:XX:XX"
# In order for libvirt to access and create files
# you needs change permission in /etc/apparmor.d/abstractions/libvirt-qemu
# and chmod file 
import_qcow2_path=""
save_image_path=""
ignition_path=""

virt-install \
--name "$machine_name" \
--vcpus 4 \ # CPU
--memory 8192 \ # RAM
--os-variant=fedora29 \ # import OS version latest fcos29?
--import \ # import option
--disk path="$import_qcow2_path",size=60,backing_store="$save_image_path"  \
--nographics \ # no desktop
--noautoconsole \ # no console
--network network=okd-net,mac="$MAC" \ # configure mac-addr for static ip-addr
--qemu-commandline="-fw_cfg name=opt/com.coreos/config,file="$ignition_path"" # load ignition file
