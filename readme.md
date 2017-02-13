# FastSwap

## Overview

Memory resource continues to be the biggest demand for running big data analytics jobs. Guest swapping is an OS virtual memory facility to keep big data jobs running in the presence of high memory pressure on guest virtual machines (VM). Thus, the performance of guest swapping may affect the latency of big data applications in virtualized Clouds. Here, we present FastSwap, a high performance shared-memory swapper. The design of FastSwap makes a number of original contributions.    

- First, FastSwap improves guest swapping performance by leveraging idle host memory and redirecting the guess swapping traffic to the host-guest compressed shared memory swap area. 
- Second, FastSwap develops a compressed swap page table as an efficient index structure to provide high utilization of shared memory swap area through supporting multi-granularity of compression factors. 
- Third, FastSwap provides hybrid swap-out and two-level proactive swap-in to further improve the performance of shared memory swapping.


## Getting Started

###On Host
1. Build QEMU on the host
	- apply the patch file under folder `FastSwap-QEMU-Patch` to `qemu-2.0.0`
	- compile `qemu-2.0.0`
	- install `qemu-2.0.0`
2. Create shared memory on the host
	- go to folder `Ivshmem-Server`
	- run `./ivshmem.sh` (this will create a 16GB shared memory on host)
	- run `chmod 777 /tmp/ivshmem_socket`
3. Create a VM
	- `virsh create fastswap.xml` (the xml file is included in package, you may need to change some fields in this file)
	- set swapfile as 16GB when installing operating system

###On VM
1. Build Linux kernel
	- start VM by executing command `virsh create fastswap.xml`
	- download Linux kernel 3.14.4 from `https://www.kernel.org/pub/linux/kernel/v3.x/linux-3.14.4.tar.gz`
	- apply Linux kernel patch under folder `FastSwap-Kernel-Patch`
	- recompile and install kernel 3.14.4
	- restart VM and boot with kernel 3.14.4
2. Start FastSwap
	- copy folder `GuestOS-Kernel-Module` to GuestOS
	- execute `./run`
	- execute `./run` (execute this twice to fix some memory initialization issue)

Now, you're all set. 