swapoff -a
rmmod memflex.ko
modprobe uio
insmod memflex.ko
swapon /dev/vda5