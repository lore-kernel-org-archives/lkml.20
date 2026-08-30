Received: from mail-oa2-f9.google.com (mail-oa2-f9.google.com [74.125.231.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D773A785D
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 15:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788102212; cv=none; b=W5x0Wb95DBFUT3+5Ak0n3uKRkrdYmHeCPiCrT74xMldhfjS8AhnRaGaHPZfT+X9hYxjxzDoqc5AZvfU3fqfBX8XXicAefdIr7DTAMd+yFRh0r6PpPUnERPNB1MCfmps23udNM3jmHyd0UcasZNsmA5Wj7QMPUDGHaarZrF1oI8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788102212; c=relaxed/simple;
	bh=Oi9ly5T0nYe3i6j4QYqYn6W/fQ1gr/fYsi6YFAKp+aE=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=ncAb5YVheQWR6lOW75RHfUVFcqN+VqAInsgxwqeEgneJ+EA5mQT71esN6EAqThMj8aHI2aCuf1C3MB+QUtiBPkcwjowDbiOxO8X5aUtOLlFfPDeapjK7qt7Tfv2QLFsPUIQYY6Y3//fg9w9Lw66WkXTbZGbCRFUajWEHh8NGNak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa2-f9.google.com with SMTP id 586e51a60fabf-4667f43a4ccso691074fac.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 08:03:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788102209; x=1788707009;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VakpWEzpeCHKuwJXIbAd2DJkU4Wo5yZE1E13FrEieQo=;
        b=pD3+hjo5XlikuQJ50RS72vdcdBfmraf4ASewHKfmRCz2/Ve8qbVd/91lRoqlsx9AYd
         VqM6/KOVRWccQIrFM3IJGGLYSEHfQJNL3lHOuQmFBuusj0Adm3x2z0eHayIzWi49m/Zi
         l0TQ63npvYf61skipaxuNDCSVhGu3JL48VRXl3X3fvsp+ti2c9ICtLnfcEIOqaQnGIo4
         8SNEjgO3ZAzeHtsM3hOIGUkE29DkRkM0OpU/01VdRZF0NcJfZuPy3GXlQKEmgIq/gznJ
         xEsLN6H7qPMZFkK+vEfdu4sB2HewDQ0RWt39fNruGFQ5gW7bmL3Twj/WO4rv+1lfUvI1
         aKvA==
X-Forwarded-Encrypted: i=1; AHgh+RqDM2VE7E1p9Spspmi8Z953hmWTq4D9/AEqyWo64iL8516mNDQ/pdJDQ78Km6Y1j+KRcj0vxiCnu/lTgEU=@vger.kernel.org
X-Gm-Message-State: AFuF++kkU9N+08sM1O9vT/UfAO5ZQjV0yetc4XznbuZSn8D/qeQPjZm9
	reben3fDeckcFJg0TxtWjwQxrNexNQfHPkOkLYxcIfRHOqSujsW70tq4CnxtW3Lo7QkxDLB7Sem
	9gSIHEhCDrDtv+EP0eJDqX+wo2ZtpqpWc4kax4YLTU9Na0smtFTxnyP1x+qg=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4fcb:b0:4a4:ed9a:e7ac with SMTP id
 5614622812f47-4b397f66748mr24832542b6e.1.1788102209740; Sun, 30 Aug 2026
 08:03:29 -0700 (PDT)
Date: Sun, 30 Aug 2026 08:03:29 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a944641.4d659fcc.734b4.003c.GAE@google.com>
Subject: [syzbot] [usb?] KASAN: slab-use-after-free Write in keyspan_close
From: syzbot <syzbot+5fabc1ae99ff40690d84@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, johan@kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    08dbfad3f504 Merge tag 'for-linus' of git://git.kernel.org..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1731ac15580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c5c3949d762a91f
dashboard link: https://syzkaller.appspot.com/bug?extid=5fabc1ae99ff40690d84
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15677d79580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=108ffd49580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-08dbfad3.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/1b5cf3bd2698/vmlinux-08dbfad3.xz
kernel image: https://storage.googleapis.com/syzbot-assets/05ad56c0b8bc/bzImage-08dbfad3.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+5fabc1ae99ff40690d84@syzkaller.appspotmail.com

==================================================================
BU
BUG: KASAN: slab-use-after-free in keyspan_close+0x23e/0x260 drivers/usb/serial/keyspan.c:1594
Write of size 4 at addr ffff888028051104 by task syz.2.29/6038

CPU: 1 UID: 0 PID: 6038 Comm: syz.2.29 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x13d/0x4b0 mm/kasan/report.c:482
 kasan_report+0xdf/0x1c0 mm/kasan/report.c:595
 keyspan_close+0x23e/0x260 drivers/usb/serial/keyspan.c:1594
 serial_port_shutdown+0x92/0x110 drivers/usb/serial/usb-serial.c:306
 tty_port_shutdown+0x1fa/0x250 drivers/tty/tty_port.c:372
 tty_port_hangup+0xfb/0x160 drivers/tty/tty_port.c:397
 __tty_hangup.part.0+0x696/0x7c0 drivers/tty/tty_io.c:644
 __tty_hangup drivers/tty/tty_io.c:688 [inline]
 tty_vhangup drivers/tty/tty_io.c:691 [inline]
 tty_vhangup drivers/tty/tty_io.c:688 [inline]
 tty_ioctl+0x112e/0x1640 drivers/tty/tty_io.c:2705
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl fs/ioctl.c:583 [inline]
 __x64_sys_ioctl+0x18e/0x210 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f32c159e159
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffd7a0b3f98 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f32c1825fa0 RCX: 00007f32c159e159
RDX: 0000000000000000 RSI: 0000000000005437 RDI: 0000000000000004
RBP: 00007f32c1635024 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f32c1825fac R14: 00007f32c1825fa0 R15: 00007f32c1825fa0
 </TASK>

Allocated by task 991:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __kmalloc_cache_noprof+0x2f8/0x6d0 mm/slub.c:5563
 _kmalloc_noprof include/linux/slab.h:991 [inline]
 _kzalloc_noprof include/linux/slab.h:1312 [inline]
 keyspan_port_probe+0xbc/0xdd0 drivers/usb/serial/keyspan.c:2891
 usb_serial_device_probe+0x106/0x3e0 drivers/usb/serial/bus.c:47
 call_driver_probe drivers/base/dd.c:628 [inline]
 really_probe+0x241/0xa60 drivers/base/dd.c:706
 __driver_probe_device+0x210/0x460 drivers/base/dd.c:868
 driver_probe_device+0x4a/0x140 drivers/base/dd.c:898
 __device_attach_driver+0x1df/0x320 drivers/base/dd.c:1026
 bus_for_each_drv+0x159/0x1e0 drivers/base/bus.c:500
 __device_attach+0x1e4/0x4d0 drivers/base/dd.c:1098
 device_initial_probe+0xaf/0xd0 drivers/base/dd.c:1153
 bus_probe_device+0x64/0x160 drivers/base/bus.c:620
 device_add+0x121d/0x1970 drivers/base/core.c:3776
 usb_serial_probe.cold+0x257e/0x29f8 drivers/usb/serial/usb-serial.c:1147
 usb_probe_interface+0x386/0x9b0 drivers/usb/core/driver.c:399
 call_driver_probe drivers/base/dd.c:628 [inline]
 really_probe+0x241/0xa60 drivers/base/dd.c:706
 __driver_probe_device+0x210/0x460 drivers/base/dd.c:868
 driver_probe_device+0x4a/0x140 drivers/base/dd.c:898
 __device_attach_driver+0x1df/0x320 drivers/base/dd.c:1026
 bus_for_each_drv+0x159/0x1e0 drivers/base/bus.c:500
 __device_attach+0x1e4/0x4d0 drivers/base/dd.c:1098
 device_initial_probe+0xaf/0xd0 drivers/base/dd.c:1153
 bus_probe_device+0x64/0x160 drivers/base/bus.c:620
 device_add+0x121d/0x1970 drivers/base/core.c:3776
 usb_set_configuration+0xd97/0x1c60 drivers/usb/core/message.c:2268
 usb_generic_driver_probe+0xa1/0xe0 drivers/usb/core/generic.c:250
 usb_probe_device+0xef/0x400 drivers/usb/core/driver.c:293
 call_driver_probe drivers/base/dd.c:628 [inline]
 really_probe+0x241/0xa60 drivers/base/dd.c:706
 __driver_probe_device+0x210/0x460 drivers/base/dd.c:868
 driver_probe_device+0x4a/0x140 drivers/base/dd.c:898
 __device_attach_driver+0x1df/0x320 drivers/base/dd.c:1026
 bus_for_each_drv+0x159/0x1e0 drivers/base/bus.c:500
 __device_attach+0x1e4/0x4d0 drivers/base/dd.c:1098
 device_initial_probe+0xaf/0xd0 drivers/base/dd.c:1153
 bus_probe_device+0x64/0x160 drivers/base/bus.c:620
 device_add+0x121d/0x1970 drivers/base/core.c:3776
 usb_new_device.part.0+0xcc2/0x1686 drivers/usb/core/hub.c:2708
 usb_new_device include/linux/workqueue.h:715 [inline]
 hub_port_connect drivers/usb/core/hub.c:5580 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5720 [inline]
 port_event drivers/usb/core/hub.c:5884 [inline]
 hub_event.cold+0x1e3/0xe90 drivers/usb/core/hub.c:5966
 process_one_work+0xac7/0x1b10 kernel/workqueue.c:3387
 process_scheduled_works kernel/workqueue.c:3470 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3551
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Freed by task 58:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 kasan_save_free_info+0x3b/0x70 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5f/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2748 [inline]
 slab_free mm/slub.c:6499 [inline]
 kfree+0x22b/0x6d0 mm/slub.c:6792
 usb_serial_device_remove+0x146/0x1a0 drivers/usb/serial/bus.c:97
 device_remove+0xcb/0x180 drivers/base/dd.c:616
 __device_release_driver drivers/base/dd.c:1349 [inline]
 device_release_driver_internal+0x44e/0x620 drivers/base/dd.c:1372
 bus_remove_device+0x2bc/0x560 drivers/base/bus.c:664
 device_del+0x376/0x9b0 drivers/base/core.c:3965
 usb_serial_disconnect+0x21e/0x490 drivers/usb/serial/usb-serial.c:1195
 usb_unbind_interface+0x1dd/0x9e0 drivers/usb/core/driver.c:461
 device_remove drivers/base/dd.c:618 [inline]
 device_remove+0x12a/0x180 drivers/base/dd.c:610
 __device_release_driver drivers/base/dd.c:1349 [inline]
 device_release_driver_internal+0x44e/0x620 drivers/base/dd.c:1372
 bus_remove_device+0x2bc/0x560 drivers/base/bus.c:664
 device_del+0x376/0x9b0 drivers/base/core.c:3965
 usb_disable_device+0x367/0x810 drivers/usb/core/message.c:1478
 usb_disconnect+0x2e2/0x9a0 drivers/usb/core/hub.c:2350
 hub_port_connect drivers/usb/core/hub.c:5420 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5720 [inline]
 port_event drivers/usb/core/hub.c:5884 [inline]
 hub_event+0x1bb1/0x4420 drivers/usb/core/hub.c:5966
 process_one_work+0xac7/0x1b10 kernel/workqueue.c:3387
 process_scheduled_works kernel/workqueue.c:3470 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3551
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

The buggy address belongs to the object at ffff888028051100
 which belongs to the cache kmalloc-192 of size 192
The buggy address is located 4 bytes inside of
 freed 192-byte region [ffff888028051100, ffff8880280511c0)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x28051
flags: 0xfff00000000000(node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000000 ffff88801c0423c0 dead000000000100 dead000000000122
raw: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0xd2cc0(GFP_KERNEL|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 1, tgid 1 (swapper/0), ts 5549223145
 set_page_owner include/linux/page_owner.h:33 [inline]
 post_alloc_hook+0xfd/0x120 mm/page_alloc.c:1871
 prep_new_page mm/page_alloc.c:1879 [inline]
 get_page_from_freelist+0x110d/0x35b0 mm/page_alloc.c:3943
 __alloc_frozen_pages_noprof+0x2eb/0x3300 mm/page_alloc.c:5436
 alloc_slab_page mm/slub.c:3347 [inline]
 allocate_slab mm/slub.c:3462 [inline]
 new_slab+0xa9/0x6e0 mm/slub.c:3513
 refill_objects+0xe3/0x410 mm/slub.c:7410
 refill_sheaf mm/slub.c:2885 [inline]
 __pcs_replace_empty_main+0x35e/0x650 mm/slub.c:4774
 alloc_from_pcs mm/slub.c:4850 [inline]
 slab_alloc_node mm/slub.c:4984 [inline]
 __kmalloc_cache_noprof+0x4f4/0x6d0 mm/slub.c:5559
 _kmalloc_noprof include/linux/slab.h:991 [inline]
 _kzalloc_noprof include/linux/slab.h:1312 [inline]
 call_usermodehelper_setup+0xaf/0x360 kernel/umh.c:360
 kobject_uevent_env+0x17c1/0x18b0 lib/kobject_uevent.c:631
 __kobject_del+0x168/0x220 lib/kobject.c:601
 kobject_cleanup lib/kobject.c:680 [inline]
 kobject_release lib/kobject.c:720 [inline]
 kref_put include/linux/kref.h:65 [inline]
 kobject_put+0x348/0x640 lib/kobject.c:737
 bus_remove_driver+0x16e/0x2e0 drivers/base/bus.c:834
 driver_unregister+0x76/0xb0 drivers/base/driver.c:202
 pci_unregister_driver+0x2a/0x220 drivers/pci/pci-driver.c:1519
 agp_amd64_init+0x174/0x2c0 drivers/char/agp/amd64-agp.c:761
 do_one_initcall+0x11c/0x6f0 init/main.c:1357
page_owner free stack trace missing

Memory state around the buggy address:
 ffff888028051000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffff888028051080: 00 00 fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff888028051100: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                   ^
 ffff888028051180: fb fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
 ffff888028051200: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
