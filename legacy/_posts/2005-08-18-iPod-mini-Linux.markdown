---
layout: post
title: "iPod mini - ..."
---
<h1>iPod mini - Linux</h1>
(This post was autoconverted from the old news system,
it might look a little ... ugly until I find the time
to clean it up.
Sorry!)

    Looks like ipodlinux now supports the mini.
    
    I'm giving this a try now.
    
    
    [DRAFT]
    
    First:
    <strong>Backup</strong> the whole thing!
    Step 1:
    Plug iPod into my G5
    
    Step 2:
    Find the Volume
    <em>mount|grep -i ipod</em>
    /dev/disk1s3 on /Volumes/Antis iPod (local, nodev, nosuid, journaled)
    
    So my iPod is disk1 which is the first SCSI device.
    
    Step 3:
    Backup the original OS
    <em>dd if=/dev/disk1s2 of=s2_os</em>
    
    Step 4:
    Backup the Data
    
    Hmmm ... can't backup /dev/disk1s3,
    so we'll backup the whole thing.
    <em>dd if=/dev/disk1 of=all</em>
    (This will take a while, so you might want to skip ahead and download all the needed stuff ;) )
    
    Second:
    Install
    Step 1:
    Get all the needed files:
    (techzone has nightlies in the <a href="http://www.techzone.5gigs.com/downloads.html">download area</a>,
    but these are for Windos only)
    Get the files from <a href="http://ipodlinux.org/builds/">ipodlinux.org</a>
    Get the latest kernel.bin.gz and podzilla.gz
    
    Get uclinux-2.4.24-ipod2.tar.gz (or later) from <a href="http://sourceforge.net/project/showfiles.php?group_id=73079&package_id=73283">SourceForge</a>
    Unpack it
     tar xzf uclinux-2.4.24-ipod2.tar.gz 
    
    Get the linux filesystem from <a href="http://sourceforge.net/project/showfiles.php?group_id=73079&package_id=73279">SourceForge</a>.
    <strong>Do not unpack this!</strong>
    
    Step 2:
    Get the ipodloader from <a href="http://sourceforge.net/project/showfiles.php?group_id=73079&package_id=101451">SourceForge</a>.
    With the mini you need the <strong>CVS version</strong>.
    
    cvs -d:pserver:anonymous@cvs.sourceforge.net:/cvsroot/ipodlinux login
    cvs -z3 -d:pserver:anonymous@cvs.sourceforge.net:/cvsroot/ipodlinux co -P tools/ipodloader
    cd tools/ipodloader
    
    make (this assumes you have the <a href="http://ipodlinux.org/Toolchain">arm-toolchain</a> installed!)
    
    Step 3:
    Extract the Apple firmware
    bin/make_fw -o apple.bin -v -e 0 Backup/s2_os
    
    Step 4:
    Create new all-in-one firmware:
     bin/make_fw -3 -o apple_linux.bin -i apple.bin -l 2005-08-17-kernel.bin ipodloader-src-0.3.2/loader.bin
    
    The resulting apple_linux.bin should be around 5MB
    
    Step 5:
    Copy the new firmware/kernel to y our iPod.
    (If you skipped ahead earlier -> make sure your backup is finished!)
    dd if=apple_linux.bin of=/dev/disk1s2
    
    Step 6:
    Copy the kernel libraries
    cp -r lib /Volumes/Antis\\ iPod
    
    Step 7:
    Extract the linux filesystem tro the iPod
    tar xzf ipod_fs_040403.tar.gz -C /Volumes/Antis\\ iPod/
    
    Step 8:
    Copy podzilla onto iPod and make it executable
    cp 2005-08-17-podzilla /Volumes/Antis\\ iPod/sbin/podzilla
    chmod +x /Volumes/Antis\\ iPod/sbin/podzilla
    

