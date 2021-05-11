machines=(okd-control0 okd-control1 okd-control2 okd-compute0 okd-compute1 okd-compute2)

virsh net-destroy okd-net
virsh net-start okd-net

for v in ${machines[@]}; do
  virsh destroy "$v"
  virsh start "$v"
done

