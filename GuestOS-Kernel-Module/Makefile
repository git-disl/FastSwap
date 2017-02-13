# obj-m is a list of what kernel modules to build.  The .o and other
# objects will be automatically built from the corresponding .c file -
# no need to list the source files explicitly.

#uio_ivshmem_kvmloop-objs := kvmloop.o netutil.o shmem.o maptable.o uio_ivshmem.o mem_swap.o
memflex-objs := uio_ivshmem.o mem_swap.o mapper.o bitmap.o file_io.o
obj-m := memflex.o 

# KDIR is the location of the kernel source.  The current standard is
# to link to the associated source tree from the directory containing
# the compiled modules.
KDIR  := /lib/modules/$(shell uname -r)/build

# PWD is the current working directory and the location of our module
# source files.
PWD   := $(shell pwd)

#KBUILD_EXTRA_SYMBOLS = /home/kvmloop/Module.symvers
# default is the default make target.  The rule here says to run make
# with a working directory of the directory containing the kernel
# source and compile only the modules in the PWD (local) directory.
default:
	$(MAKE) -C $(KDIR) M=$(PWD) modules

install:
	cp uio_ivshmem.ko /lib/modules/$(shell uname -r)/kernel/drivers/uio/

clean:
	rm -f *.ko *.o .*.cmd *.mod.c uio_ivshmem.mod.c uio_ivshmem_kvmloop.mod.c Module.symvers modules.order
