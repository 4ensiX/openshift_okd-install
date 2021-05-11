# !/bin/sh 
# kvm-delete
machines=(okd-bootstrap okd-control0 okd-control1 okd-control2 okd-compute0 okd-compute1 okd-compute2)

for v in ${machines[@]}; do
  virsh destroy "$v"
  virsh undefine "$v" --remove-all-storage
done
