# !/bin/bash

nodes=(bootstrap master0 master1 master2 worker0 worker1 worker2)

for v in ${nodes[@]}; do
  bash "$v".sh
done

virsh list