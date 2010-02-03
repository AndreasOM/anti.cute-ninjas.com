---
layout: post
title: "G5 Mac - Re ..."
---
<h1>G5 Mac - Repartitioning</h1>
(This post was autoconverted from the old news system,
it might look a little ... ugly until I find the time
to clean it up.
Sorry!)

    Got a spare 250GB harddisk.
    
    Trying to repartition the old disk to add OSX.
    
    Step 1:
    Boot Gentoo LiveCD
    
    Step 2:
    Partition and format new (backup) disk.
    
    Step 3:
    Mount old root (->/old) and backup (-> backup).
    
    Step 4:
    Copy everything over:
    cd /old; cp -ax * /backup
    
    Step 5:
    Repartition old disk.
    
    Step 6:
    Reboot (from LiveCD).
    
    Step 7:
    Format old disk.
    
    Step 8:
    Mount new root (->/new) and backup (-> backup).
    
    Step 9:
    Copy everything over:
    cd /backup; cp -ax * /new
    
    Step 12:
    Bind devfs to new system.
    mount -o bind /dev /new/dev
    
    Step 11:
    Chroot into the system
    chroot /new
    
    Step 12:
    Mount procfs
    mount -t proc none /proc
    
    Step 13:
    Do a quick check.
    
    Step 12:
    Rerun yaboot.
    (Still chrooted)
    ybin -v
    
    Step 13:
    Reboot (from disk) and hope for the best.
    
    
    Looks like it worked :)
    
    

