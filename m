Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113043BFAC0
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790653721; cv=none; b=R1yVpfYvKgYWfrIGkkn8ReSjwurPmwUWCdKvWcTnU+yd1rlKmQzskIJXA0DyxgglSrRHSp/FSFAkZ+2/9nWBMuUbWCep01BgswNcdvLc6/65tzCsG8KiobzUxWABL8ujlj2E2D2ci1byU04ksDiiLKZL8D3AWCE2YcyggyMTj8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790653721; c=relaxed/simple;
	bh=Oush5cHpP9xFtEHFwiURrJbQhScA3TYxzJEjTz3Bzg4=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=F8qxhPEbhuBl9Vhr+Nw0OiU6XHom5GeTPVuNT7T55sZhj2tEYPGut09l3KoK2Hponjm3aFvX+hJEiyxoVC9O4Xf8lM2r4YMr+eLcwUhxZewSXdFWJTSMc9wUzLlK6DeAxYITXj+AWBgzoCK14wkaZRBhB1U8vUEc2XDld4cAC/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4b1bc2e44e0so5868171b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 20:48:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790653718; x=1791258518;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vssZFQJgoUgFGRLMDEgt/1rxwFRJiQMxXieW0liGzdE=;
        b=mdFpaMnKEYE4m5ue87Goa0+GVPJ97RNN7ON1f1VDiFf4K62+DMyiwI7in2oRrAJXe4
         HxuluWydPAptT7QiqBFxLP1B+XV2TiY5n8kwS2vx7FWaUEWVZN4OnMMjPWNMc3mx480g
         C0E+GWYrpcnhtEIa1m/8Yjpa26fT7mxOmOcnaT9T84rUx08p8qPIkg6ZMYhcY3hR6Rhg
         fN66uS+K6E20AMTErZYAZ6lmHu+BcOFWrp9m6fCFXJ4Wm8p2X9u7lVoE0GDUiiQAmfej
         y0wgglFU/4qqFtUdV+IQZ8fPla7dpHKbIduJIzQtjZvOwdk/wVwi/Va6a7h4ejWEvyfe
         HTUQ==
X-Forwarded-Encrypted: i=1; AKwUvBxajNNz6wpTsSzphNhbSOSGYCWR2yvcSJJ4uR1tnCGSJqYGCVL1i1Xdl6h/Zi6FfQr7eR+ILnA9MqZXZwo=@vger.kernel.org
X-Gm-Message-State: AFuF++mZPlDX6ix7IVIJFhpbn8KHttM079UHvw7URk6itbnlDO85cbRM
	BKpK8OkFKv14Vse5Gdx4j+gjuYMIoJmTqB6tdabX7cVGj+0d+kOIjOMz4aoJhaMVoGbnRzoiMIl
	0U12tGpzZZ8LRVw3LQUW91g4/zSCxF/6c8LZ0RfaNd4+I/etNR5BdvEMPc/w=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1642:b0:4cb:f21b:6f96 with SMTP id
 5614622812f47-4d73045f896mr13098741b6e.41.1790653717941; Mon, 28 Sep 2026
 20:48:37 -0700 (PDT)
Date: Mon, 28 Sep 2026 20:48:37 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6abb3515.c6a7fab7.e5ea7.0459.GAE@google.com>
Subject: [syzbot] [usb?] KASAN: slab-use-after-free Write in
 usb_giveback_urb_bh (2)
From: syzbot <syzbot+a5b220cacb0618384d5a@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    62f4c998b297 Merge tag 'parisc-for-7.3-rc5' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=157022c9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2a820d8842c77560
dashboard link: https://syzkaller.appspot.com/bug?extid=a5b220cacb0618384d5a
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
userspace arch: i386

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-62f4c998.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/8d5e9781cf8b/vmlinux-62f4c998.xz
kernel image: https://storage.googleapis.com/syzbot-assets/b891c8b5bf72/bzImage-62f4c998.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+a5b220cacb0618384d5a@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in usb_giveback_urb_bh+0x441/0x560 drivers/usb/core/hcd.c:1692
Write of size 8 at addr ffff888022a54300 by task ksoftirqd/1/30

CPU: 1 UID: 0 PID: 30 Comm: ksoftirqd/1 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x13d/0x4b0 mm/kasan/report.c:482
 kasan_report+0xdf/0x1c0 mm/kasan/report.c:595
 usb_giveback_urb_bh+0x441/0x560 drivers/usb/core/hcd.c:1692
 process_one_work+0xac7/0x1b10 kernel/workqueue.c:3396
 process_scheduled_works kernel/workqueue.c:3479 [inline]
 bh_worker+0x6a5/0x8f0 kernel/workqueue.c:3782
 workqueue_softirq_action+0x14a/0x1b0 kernel/workqueue.c:3810
 tasklet_hi_action+0x17/0x70 kernel/softirq.c:994
 handle_softirqs+0x1e6/0x9d0 kernel/softirq.c:645
 run_ksoftirqd kernel/softirq.c:1099 [inline]
 run_ksoftirqd+0x38/0x60 kernel/softirq.c:1091
 smpboot_thread_fn+0x3d3/0xab0 kernel/smpboot.c:160
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Allocated by task 1:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __do_kmalloc_node mm/slub.c:5414 [inline]
 __kmalloc_noprof+0x32f/0x840 mm/slub.c:5439
 _kmalloc_noprof include/linux/slab.h:995 [inline]
 _kzalloc_noprof include/linux/slab.h:1312 [inline]
 __usb_create_hcd+0x5e/0xac0 drivers/usb/core/hcd.c:2566
 vhci_hcd_probe+0xf3/0x4e0 drivers/usb/usbip/vhci_hcd.c:1378
 platform_probe+0x106/0x1d0 drivers/base/platform.c:1507
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
 platform_device_add+0x35a/0x800 drivers/base/platform.c:833
 platform_device_register_full+0x507/0x720 drivers/base/platform.c:970
 vhci_hcd_init+0x1a1/0x2f0 drivers/usb/usbip/vhci_hcd.c:1557
 do_one_initcall+0x11c/0x6f0 init/main.c:1362
 do_initcall_level init/main.c:1424 [inline]
 do_initcalls init/main.c:1440 [inline]
 do_basic_setup init/main.c:1460 [inline]
 kernel_init_freeable+0x6ea/0x7b0 init/main.c:1675
 kernel_init+0x21/0x1e0 init/main.c:1565
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Freed by task 1:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 kasan_save_free_info+0x3b/0x70 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5f/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2748 [inline]
 slab_free mm/slub.c:6508 [inline]
 kfree+0x22b/0x6d0 mm/slub.c:6801
 hcd_release drivers/usb/core/hcd.c:2690 [inline]
 kref_put include/linux/kref.h:65 [inline]
 usb_put_hcd drivers/usb/core/hcd.c:2704 [inline]
 usb_put_hcd+0x149/0x1f0 drivers/usb/core/hcd.c:2701
 vhci_hcd_probe+0x342/0x4e0 drivers/usb/usbip/vhci_hcd.c:1415
 platform_probe+0x106/0x1d0 drivers/base/platform.c:1507
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
 platform_device_add+0x35a/0x800 drivers/base/platform.c:833
 platform_device_register_full+0x507/0x720 drivers/base/platform.c:970
 vhci_hcd_init+0x1a1/0x2f0 drivers/usb/usbip/vhci_hcd.c:1557
 do_one_initcall+0x11c/0x6f0 init/main.c:1362
 do_initcall_level init/main.c:1424 [inline]
 do_initcalls init/main.c:1440 [inline]
 do_basic_setup init/main.c:1460 [inline]
 kernel_init_freeable+0x6ea/0x7b0 init/main.c:1675
 kernel_init+0x21/0x1e0 init/main.c:1565
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Last potentially related work creation:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_record_aux_stack+0xa7/0xc0 mm/kasan/generic.c:556
 insert_work+0x36/0x230 kernel/workqueue.c:2272
 __queue_work+0xa60/0x1370 kernel/workqueue.c:2448
 queue_work_on+0x1a9/0x1e0 kernel/workqueue.c:2501
 queue_work include/linux/workqueue.h:700 [inline]
 usb_hcd_giveback_urb+0x330/0x4a0 drivers/usb/core/hcd.c:1758
 usb_rh_urb_dequeue drivers/usb/core/hcd.c:845 [inline]
 unlink1+0x418/0x510 drivers/usb/core/hcd.c:1580
 usb_hcd_unlink_urb+0x131/0x210 drivers/usb/core/hcd.c:1617
 usb_kill_urb drivers/usb/core/urb.c:716 [inline]
 usb_kill_urb+0x121/0x320 drivers/usb/core/urb.c:703
 hub_quiesce+0x1e9/0x320 drivers/usb/core/hub.c:1417
 hub_suspend+0x4ab/0x9e0 drivers/usb/core/hub.c:4021
 usb_suspend_interface drivers/usb/core/driver.c:1327 [inline]
 usb_suspend_both+0x288/0x950 drivers/usb/core/driver.c:1450
 usb_runtime_suspend+0x49/0x120 drivers/usb/core/driver.c:2004
 __rpm_callback+0xc8/0x620 drivers/base/power/runtime.c:406
 rpm_callback+0x11f/0x150 drivers/base/power/runtime.c:460
 rpm_suspend+0x2f4/0x1220 drivers/base/power/runtime.c:695
 __pm_runtime_suspend+0xba/0x1a0 drivers/base/power/runtime.c:1167
 pm_runtime_put_sync_autosuspend include/linux/pm_runtime.h:740 [inline]
 usb_new_device.part.0+0x1653/0x1686 drivers/usb/core/hub.c:2740
 register_root_hub+0x4e6/0x639 drivers/usb/core/hcd.c:990
 usb_add_hcd.cold+0xccd/0x1158 drivers/usb/core/hcd.c:2987
 vhci_hcd_probe+0x14b/0x4e0 drivers/usb/usbip/vhci_hcd.c:1388
 platform_probe+0x106/0x1d0 drivers/base/platform.c:1507
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
 platform_device_add+0x35a/0x800 drivers/base/platform.c:833
 platform_device_register_full+0x507/0x720 drivers/base/platform.c:970
 vhci_hcd_init+0x1a1/0x2f0 drivers/usb/usbip/vhci_hcd.c:1557
 do_one_initcall+0x11c/0x6f0 init/main.c:1362
 do_initcall_level init/main.c:1424 [inline]
 do_initcalls init/main.c:1440 [inline]
 do_basic_setup init/main.c:1460 [inline]
 kernel_init_freeable+0x6ea/0x7b0 init/main.c:1675
 kernel_init+0x21/0x1e0 init/main.c:1565
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Second to last potentially related work creation:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_record_aux_stack+0xa7/0xc0 mm/kasan/generic.c:556
 insert_work+0x36/0x230 kernel/workqueue.c:2272
 __queue_work+0xa60/0x1370 kernel/workqueue.c:2448
 queue_work_on+0x1a9/0x1e0 kernel/workqueue.c:2501
 queue_work include/linux/workqueue.h:700 [inline]
 usb_hcd_giveback_urb+0x3b8/0x4a0 drivers/usb/core/hcd.c:1760
 rh_call_control drivers/usb/core/hcd.c:706 [inline]
 rh_urb_enqueue drivers/usb/core/hcd.c:817 [inline]
 usb_hcd_submit_urb+0xab7/0x2150 drivers/usb/core/hcd.c:1538
 usb_submit_urb+0x827/0x19b0 drivers/usb/core/urb.c:586
 usb_start_wait_urb+0x10e/0x580 drivers/usb/core/message.c:62
 usb_internal_control_msg drivers/usb/core/message.c:117 [inline]
 usb_control_msg+0x328/0x4b0 drivers/usb/core/message.c:167
 get_port_status drivers/usb/core/hub.c:607 [inline]
 hub_ext_port_status+0x14e/0x690 drivers/usb/core/hub.c:624
 usb_hub_port_status drivers/usb/core/hub.c:674 [inline]
 hub_activate+0x6e5/0x1c40 drivers/usb/core/hub.c:1190
 process_one_work+0xac7/0x1b10 kernel/workqueue.c:3396
 process_scheduled_works kernel/workqueue.c:3479 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3560
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

The buggy address belongs to the object at ffff888022a54000
 which belongs to the cache kmalloc-8k of size 8192
The buggy address is located 768 bytes inside of
 freed 8192-byte region [ffff888022a54000, ffff888022a56000)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x22a50
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88801c043180 dead000000000100 dead000000000122
raw: 0000000000000000 0000000000020002 00000000f5000000 0000000000000000
head: 00fff00000000040 ffff88801c043180 dead000000000100 dead000000000122
head: 0000000000000000 0000000000020002 00000000f5000000 0000000000000000
head: 00fff00000000003 fffffffffffffe01 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 1, tgid 1 (swapper/0), ts 7221018769
 set_page_owner include/linux/page_owner.h:33 [inline]
 post_alloc_hook+0xfd/0x120 mm/page_alloc.c:1871
 prep_new_page mm/page_alloc.c:1879 [inline]
 get_page_from_freelist+0x110d/0x35d0 mm/page_alloc.c:3943
 __alloc_frozen_pages_noprof+0x2eb/0x3300 mm/page_alloc.c:5436
 alloc_slab_page mm/slub.c:3347 [inline]
 allocate_slab mm/slub.c:3462 [inline]
 new_slab+0xa9/0x6e0 mm/slub.c:3513
 refill_objects+0xe3/0x410 mm/slub.c:7417
 refill_sheaf mm/slub.c:2885 [inline]
 __pcs_replace_empty_main+0x35e/0x650 mm/slub.c:4774
 alloc_from_pcs mm/slub.c:4850 [inline]
 slab_alloc_node mm/slub.c:4984 [inline]
 __do_kmalloc_node mm/slub.c:5413 [inline]
 __kmalloc_noprof+0x67c/0x840 mm/slub.c:5439
 _kmalloc_noprof include/linux/slab.h:995 [inline]
 acpi_ut_initialize_buffer+0x144/0x220 drivers/acpi/acpica/utalloc.c:327
 acpi_rs_create_pci_routing_table+0x135/0xe00 drivers/acpi/acpica/rscreate.c:212
 acpi_rs_get_prt_method_data+0xc1/0x150 drivers/acpi/acpica/rsutils.c:456
 acpi_get_irq_routing_table+0xb8/0x140 drivers/acpi/acpica/rsxface.c:137
 acpi_pci_irq_find_prt_entry+0x179/0xdd0 drivers/acpi/pci_irq.c:215
 acpi_pci_irq_lookup+0x8e/0x6b0 drivers/acpi/pci_irq.c:299
 acpi_pci_irq_disable+0x1a8/0x360 drivers/acpi/pci_irq.c:499
 pcibios_disable_device arch/x86/pci/common.c:706 [inline]
 pcibios_disable_device+0x89/0xb0 arch/x86/pci/common.c:703
 do_pci_disable_device+0x9f/0x100 drivers/pci/pci.c:2203
page_owner free stack trace missing

Memory state around the buggy address:
 ffff888022a54200: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888022a54280: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff888022a54300: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                   ^
 ffff888022a54380: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888022a54400: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
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
