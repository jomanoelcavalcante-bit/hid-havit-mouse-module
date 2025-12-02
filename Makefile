obj-m += hid-superframe-flickpro.o
all:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules
	zstd -f hid-superframe-flickpro.ko
clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
install:
	cp $(shell pwd)/hid-superframe-flickpro.ko.zst /lib/modules/$(shell uname -r)/kernel/drivers/hid/
	depmod -a
uninstall:
	rm -f /lib/modules/$(shell uname -r)/kernel/drivers/hid/hid-superframe-flickpro.ko.zst
	depmod -a
dkms:
	make -C $(INCLUDEDIR) M=$(PWD) modules
	