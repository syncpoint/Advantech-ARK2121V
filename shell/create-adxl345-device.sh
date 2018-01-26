#!/bin/sh

I2C_7_SYSFS=/sys/bus/i2c/devices/i2c-7
I2C_ADXL345_ADDRESS=0x1d

if [ ! -d $I2C_7_SYSFS ]; then
	/usr/bin/systemd-cat -t "adxl345_init" /usr/bin/echo "i2c-7 device does not exist" 
	exit 2
fi

echo adxl34x $I2C_ADXL345_ADDRESS > $I2C_7_SYSFS/new_device
chgrp -R i2c  $I2C_7_SYSFS/7-001d/
