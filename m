Received: from mail-oi2-f10.google.com (mail-oi2-f10.google.com [74.125.231.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C5138E13F
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 03:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789614217; cv=none; b=i9ooiB+zi/ZL5SWdker/m/cKqdPSzU0H7uyqyneJNdIEn8KOmUWGL8vCUYiNNtlmt4cwMWkC3bW7L9s5XYGqwNOjeRsk612nNc2KGvv/iKx3w+B8pqEQ5X0u4V14pFCfHwdQGvSoAILZSr0W1rPD41KsYCkhJ3Gj4cJSVEzLRwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789614217; c=relaxed/simple;
	bh=RvYBJaZzziWaNiTRd+lnbHiGsZT8d26L2M/kwAscbs8=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=X9iEScaSWg1eBp5HkiM5WpBmO9nOSkbot9oaD26/vZ0ipqgWPt5FkKZgFNtgHxz7cONmYNSx2rdpSzg+kzJlbWBxXT1A4FayLctwYrLOdtsznULM+Q+GpNOjknc7KeE9iPWM1oO8UM6UNzFt1ga8hWdwDIuUEa7NW1Bw8ijCpTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi2-f10.google.com with SMTP id 5614622812f47-4c9a4910efeso73564b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 20:03:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789614212; x=1790219012;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ACUJjrHunDuc3q3szpqhQU9gKhxMwz86Nd21nkOtGSg=;
        b=jYFlLlMJw7Enr6/6YE3qWIycBSawnxTQX+ieAAJ2c0jCFzDCBdm5r4ZF6JldOJrF9C
         moWA04q3CpO7kDjzv6FJ+MyjJXR7DBCLqyFtwWr2ZISQPz35muTE+UvfXh42ROVIHoAy
         PmpJJhybiM32fqYItJY6Fm+fblK1vZeBzCCxetdR8fYwk3ADAApCh6AhlteM9ByFPRGg
         OPw4D7SGPV+8Ffwv588V0z1xcdEpBalmH0FfczpAG3QCmGZ8yJ0fak+/A1t9q0teJZLZ
         B+lBxiqWjo1thfIk3sVhU1ENyTv7+R6+2NE51GSqt9QS5Rc5gzeYUHlDXWcW6DytYpFK
         +LSw==
X-Gm-Message-State: AFuF++lbr6X6rGKiNl0nm/RRwbEwiyKQsBcqmhLScznA84kMXTNbVkkV
	ZZy/XhEvm8GQufa++axFAxjs1rn6X4blHTpgEimIMBoo4Rnb0gmrgVkhhifWkkXuvXs7xNU7j8s
	GasDRMEIln5xWROLQEh2DSAwEdSSGJ45LCdHg4fvbmlWp8aQJ2GBWYGQk2dxV1A==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1794:b0:4b9:e5fa:8a18 with SMTP id
 5614622812f47-4ca4c08823fmr5213975b6e.29.1789614212068; Wed, 16 Sep 2026
 20:03:32 -0700 (PDT)
Date: Wed, 16 Sep 2026 20:03:32 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aab5884.b398a7c9.1f86be.000e.GAE@google.com>
Subject: [syzbot] [sound?] KASAN: slab-use-after-free Read in snd_card_free
From: syzbot <syzbot+40b06a86af225236fdb4@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, perex@perex.cz, 
	syzkaller-bugs@googlegroups.com, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    73e3f0710014 Merge tag 'nfs-for-7.3-1' of git://git.linux-..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=119b4579580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=179353f386d8a88a
dashboard link: https://syzkaller.appspot.com/bug?extid=40b06a86af225236fdb4
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
userspace arch: i386

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-73e3f071.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/5b76df294a9c/vmlinux-73e3f071.xz
kernel image: https://storage.googleapis.com/syzbot-assets/ada2f995e603/bzImage-73e3f071.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+40b06a86af225236fdb4@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in snd_card_free+0x16f/0x190 sound/core/init.c:658
Read of size 1 at addr ffff888000f8a862 by task syz.4.2775/17559

CPU: 3 UID: 0 PID: 17559 Comm: syz.4.2775 Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x13d/0x4b0 mm/kasan/report.c:482
 kasan_report+0xdf/0x1c0 mm/kasan/report.c:595
 snd_card_free+0x16f/0x190 sound/core/init.c:658
 azx_remove+0
 azx_remove+0xfd/0x140 sound/hda/controllers/intel.c:2477
 pci_device_remove+0xb2/0x1d0 drivers/pci/pci-driver.c:535
 device_remove+0xcb/0x180 drivers/base/dd.c:616
 __device_release_driver drivers/base/dd.c:1349 [inline]
 device_release_driver_internal+0x44e/0x620 drivers/base/dd.c:1372
 pci_stop_dev drivers/pci/remove.c:27 [inline]
 pci_stop_bus_device+0x120/0x160 drivers/pci/remove.c:94
 pci_stop_and_remove_bus_device+0x58/0xa0 drivers/pci/remove.c:129
 pci_stop_and_remove_bus_device_locked+0x1a/0x20 drivers/pci/remove.c:137
 remove_store+0x123/0x140 drivers/pci/pci-sysfs.c:524
 dev_attr_store+0x58/0x80 drivers/base/core.c:2509
 sysfs_kf_write+0xf2/0x150 fs/sysfs/file.c:145
 kernfs_fop_write_iter+0x3e0/0x5f0 fs/kernfs/file.c:345
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6af/0x1050 fs/read_write.c:687
 ksys_write+0x12a/0x250 fs/read_write.c:739
 do_syscall_32_irqs_on arch/x86/entry/syscall_32.c:79 [inline]
 __do_fast_syscall_32+0x13a/0x8b0 arch/x86/entry/syscall_32.c:291
 do_fast_syscall_32+0x32/0x70 arch/x86/entry/syscall_32.c:316
 entry_SYSENTER_compat_after_hwframe+0x84/0x8e
RIP: 0023:0xf7f13fec
Code: Unable to access opcode bytes at 0xf7f13fc2.
RSP: 002b:00000000f4f7150c EFLAGS: 00000292 ORIG_RAX: 0000000000000004
RAX: ffffffffffffffda RBX: 0000000000000009 RCX: 00000000800000c0
RDX: 0000000000000001 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000292 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>

Allocated by task 17541:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __do_kmalloc_node mm/slub.c:5414 [inline]
 __kmalloc_noprof+0x32f/0x840 mm/slub.c:5439
 _kmalloc_noprof include/linux/slab.h:995 [inline]
 _kzalloc_noprof include/linux/slab.h:1312 [inline]
 snd_card_new+0x74/0x120 sound/core/init.c:184
 azx_probe+0x321/0x2790 sound/hda/controllers/intel.c:2209
 local_pci_probe+0xdd/0x1b0 drivers/pci/pci-driver.c:354
 pci_call_probe+0x176/0x800 drivers/pci/pci-driver.c:416
 __pci_device_probe drivers/pci/pci-driver.c:478 [inline]
 pci_device_probe+0x25b/0x400 drivers/pci/pci-driver.c:512
 call_driver_probe drivers/base/dd.c:628 [inline]
 really_probe+0x241/0xa60 drivers/base/dd.c:706
 __driver_probe_device+0x210/0x460 drivers/base/dd.c:868
 driver_probe_device+0x4a/0x140 drivers/base/dd.c:898
 __device_attach_driver+0x1df/0x320 drivers/base/dd.c:1026
 bus_for_each_drv+0x159/0x1e0 drivers/base/bus.c:500
 __device_attach+0x1e4/0x4d0 drivers/base/dd.c:1098
 device_initial_probe+0xaf/0xd0 drivers/base/dd.c:1153
 pci_bus_add_device+0xc5/0x100 drivers/pci/bus.c:373
 pci_bus_add_devices+0x9a/0x1f0 drivers/pci/bus.c:394
 pci_rescan_bus+0x2a/0x40 drivers/pci/probe.c:3502
 rescan_store+0xfb/0x130 drivers/pci/pci-sysfs.c:474
 bus_attr_store+0x74/0xb0 drivers/base/bus.c:172
 sysfs_kf_write+0xf2/0x150 fs/sysfs/file.c:145
 kernfs_fop_write_iter+0x3e0/0x5f0 fs/kernfs/file.c:345
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6af/0x1050 fs/read_write.c:687
 ksys_write+0x12a/0x250 fs/read_write.c:739
 do_syscall_32_irqs_on arch/x86/entry/syscall_32.c:79 [inline]
 __do_fast_syscall_32+0x13a/0x8b0 arch/x86/entry/syscall_32.c:291
 do_fast_syscall_32+0x32/0x70 arch/x86/entry/syscall_32.c:316
 entry_SYSENTER_compat_after_hwframe+0x84/0x8e

Freed by task 5881:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 kasan_save_free_info+0x3b/0x70 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5f/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2748 [inline]
 slab_free mm/slub.c:6499 [inline]
 kfree+0x22b/0x6d0 mm/slub.c:6792
 snd_card_do_free sound/core/init.c:609 [inline]
 release_card_device+0x1f7/0x250 sound/core/init.c:153
 device_release+0xd2/0x270 drivers/base/core.c:2640
 kobject_cleanup lib/kobject.c:689 [inline]
 kobject_release lib/kobject.c:720 [inline]
 kref_put include/linux/kref.h:65 [inline]
 kobject_put+0x1f7/0x640 lib/kobject.c:737
 put_device+0x1f/0x30 drivers/base/core.c:3884
 snd_card_free_when_closed sound/core/init.c:630 [inline]
 snd_card_free_when_closed sound/core/init.c:624 [inline]
 snd_card_free+0x11a/0x190 sound/core/init.c:662
 azx_probe_continue sound/hda/controllers/intel.c:2451 [inline]
 azx_probe_work+0x65b/0x2700 sound/hda/controllers/intel.c:1741
 process_one_work+0xac7/0x1b10 kernel/workqueue.c:3387
 process_scheduled_works kernel/workqueue.c:3470 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3551
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

The buggy address belongs to the object at ffff888000f8a000
 which belongs to the cache kmalloc-4k of size 4096
The buggy address is located 2146 bytes inside of
 freed 4096-byte region [ffff888000f8a000, ffff888000f8b000)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0xf88
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0x7ff00000000040(head|node=0|zone=0|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 007ff00000000040 ffff88801c043040 dead000000000100 dead000000000122
raw: 0000000000000000 0000000000040004 00000000f5000000 0000000000000000
head: 007ff00000000040 ffff88801c043040 dead000000000100 dead000000000122
head: 0000000000000000 0000000000040004 00000000f5000000 0000000000000000
head: 007ff00000000003 fffffffffffffe01 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 1, tgid 1 (swapper/0), ts 9234438850
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
 kobject_uevent_env+0x263/0x18b0 lib/kobject_uevent.c:543
 device_add+0x1173/0x1970 drivers/base/core.c:3742
 __video_register_device+0x1da5/0x5960 drivers/media/v4l2-core/v4l2-dev.c:1076
 __v4l2_device_register_subdev_nodes+0x330/0x670 drivers/media/v4l2-core/v4l2-device.c:224
 v4l2_device_register_subdev_nodes include/media/v4l2-device.h:204 [inline]
 vimc_register_devices drivers/media/test-drivers/vimc/vimc-core.c:315 [inline]
 vimc_probe+0xb28/0xfb0 drivers/media/test-drivers/vimc/vimc-core.c:371
 platform_probe+0x106/0x1d0 drivers/base/platform.c:1507
 call_driver_probe drivers/base/dd.c:628 [inline]
 really_probe+0x241/0xa60 drivers/base/dd.c:706
 __driver_probe_device+0x210/0x460 drivers/base/dd.c:868
 driver_probe_device+0x4a/0x140 drivers/base/dd.c:898
page_owner free stack trace missing

Memory state around the buggy address:
 ffff888000f8a700: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888000f8a780: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff888000f8a800: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                                       ^
 ffff888000f8a880: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888000f8a900: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
