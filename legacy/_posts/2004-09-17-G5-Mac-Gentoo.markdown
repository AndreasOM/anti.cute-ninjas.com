---
layout: post
title: "G5 Mac - Ge ..."
---
<h1>G5 Mac - Gentoo</h1>
(This post was autoconverted from the old news system,
it might look a little ... ugly until I find the time
to clean it up.
Sorry!)

    Just booted the 2004.2 (minimal ppc64) LiveCD.
    modprobe sungem; dhcpcd eth0
    gave me ethernet.
    
    About to partition the disk.
    (I want/need triple boot.)
    parted /dev/sda
    mkpart primary 0.031 0.810
    mkpart primary 0.810 2000
    mkpart primary 2000 52000
    mkpart primary 52000 102000
    mkpart primary 102000 152627.835
    
    This has to be wrong, but you have to start somewhere ;)
    
    mkswap /dev/sda2
    mk2efs -j /dev/sda5
    mount /dev/sda5 /mnt/gentoo
    cd /mnt/gentoo
    wget http://dev.gentoo.org/~tgall/stage2-ppc64-20040802.tar.bz2
    tar -xvjpf stage2-ppc64-20040802.tar.bz2
    
    add -j2 to MAKEOPTS (/mnt/gentoo/etc/make.conf)
    cp /etc/resolve.conf /mnt/gentoo/etc
    mount -t proc none /mnt/gentoo/proc
    
    chroot /mnt/gentoo /bin/bash
    env-update
    source /etc/profile
    
    So far so good.
    
    emerge sync
    (That might take a while ;) )
    
    

