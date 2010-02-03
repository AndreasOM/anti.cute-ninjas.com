---
layout: post
title: "xorg under  ..."
---
<h1>xorg under gentoo on a G5 mac</h1>
(This post was autoconverted from the old news system,
it might look a little ... ugly until I find the time
to clean it up.
Sorry!)

    OK,
    
    it's running.
    
    Look:
    
    <a href="/images/gentoo-ppc64/xorg.png"><img src="/images/gentoo-ppc64/th_xorg.png" alt="xorg on G5 Mac under gentoo" /></a>
    
    
    I fiddled a lot, so I'm not entirely sure what did here, but there are folks verifying it right now.
    
    1. emerge x11-base/xorg-x11
    This will run smooth, but the Xserver won't work.
    (Problem: elfloader can't handle ppc64 relocation)
    
    2. Convert .a and .o under /usr/X11R6/lib/modules/ to .so
    ld --whole-archive -shared -o ${file%.o}.so $file
    or
    ld --whole-archive -shared -o ${file%.a}.so $file
    Be sure to move the .o and .a away.
    
    This will ensure dlopen is used instead of elfloader.
    
    [snip]
    #!/bin/sh
    
    for file in *.o
    do
            ld --whole-archive -shared -o ${file%.o}.so $file
            mv $file ${file}_BAK
    done
    
    for file in *.a
    do
            ld --whole-archive -shared -o ${file%.a}.so $file
            mv $file ${file}_BAK
    done
    
    exit 0
    [snip]
    
    3. Link together the ATI driver with all prereqs.
    We have shared objects, so there are some missing external references.
    ld --whole-archive -shared -o ati_drv.so ati_drv.o radeon_drv.o atimisc_drv.o fbdev_drv.o r128_drv.o vga_drv.o ../libshadow.o ../libshadowfb.o 
    (Not so sure about this, since my bash-history got overwritten, keep adding until there are no unresolved externals.)
    
    4. Grab an xorg.conf.
    <a href="/gentoo-ppc64/xorg.conf">xorg.conf</a>
    5. Try the server.
    X ... still fails ... trying to load vgahw_drv, which wasn't build.
    
    6. Tweak the ebuild:
    /usr/portage/x11-base/xorg-x11/xorg-x11-6.7.0-r1.ebuild
    Look for 
                    echo "#define HaveLib64 NO" >> config/cf/host.def"
    (The exact position doesn't really matter that much...)
    Add
                    echo "#define MakeDllModules YES" >> config/cf/host.def
                    echo "#define XF86VgaHw YES" >> config/cf/host.def
                    echo "#define XF86FBDevHw YES" >> config/cf/host.def
    
    7. emerge x11-base/xorg-x11
    This fails :(
    
    8. Finish the Xserver build manually
    cd /var/tmp/portage/xorg-x11-6.7.0-r1/work/xc/programs/Xserver/
    make
    
    9. Copy the vgahw driver
    cp /var/tmp/portage/xorg-x11-6.7.0-r1/work/xc/programs/Xserver/hw/xfree86/vgahw/libvgahw.so /usr/X11R6/lib/modules/linux/
    
    10. run X
    
    11. be happy
    
    12. tell the right gentoo folks, who might be able to <strong>really</strong> fix the ebuild.
    
    13. donate $5 to unicef stating that "gentoo-ppc64 really rocks" ;)
    
    
    

