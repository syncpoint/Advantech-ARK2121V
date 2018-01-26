#!/bin/sh
## /usr/local/bin/create-pca9555-device.sh ##

I2C_7_SYSFS=/sys/bus/i2c/devices/i2c-7
I2C_PCA9555_ADDRESS=0x27

if [ ! -d $I2C_7_SYSFS ]; then
    echo "i2c-7 device does not exist"
    exit 2
fi

echo pca9555 $I2C_PCA9555_ADDRESS > $I2C_7_SYSFS/new_device
chgrp -R i2c  $I2C_7_SYSFS/7-0027/

for pin in `seq 496 503`;
do
    echo $pin > /sys/class/gpio/export
    chgrp -R i2c  /sys/class/gpio/gpio$pin
done

## switch DO pins into "out" mode
for pin in `seq 496 497`;
do
    echo out > /sys/class/gpio/gpio$pin/direction
done 
