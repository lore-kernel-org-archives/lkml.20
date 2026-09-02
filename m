Received: from mail-oo2-f8.google.com (mail-oo2-f8.google.com [74.125.231.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A8A25A645
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 05:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788325776; cv=none; b=Vu2I2NmsjyNnLM+A7FnoSM8cCfwR07XjZqsHVgcs1qCKgRC4jD6xFI6M/dFSpDkNRo4eDR4vj5+NpHWS9wNV2q3LZSjLx9u9+z1E/48ZnP66rGvylcVo3Kq8gy7iXfGBAXLaYWALhTSPqQ0aDykBYCG0nhFoneLKFZVdbnHEcsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788325776; c=relaxed/simple;
	bh=Hj9Tc9/onsxGiFzYhWUimsw/t6G+l591Gj4+9ApXMgQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=UgaTpJ3N+nqNjeAIxS9vFNq7Fa/F1vcbxBEf6TcWL1DMK4FE6Gt7FhMWfcqmay+LC5FwZD59TvmuIibuyJ2GYz6mwmNhrS6DlUN9PZA5198bTH4o3xSKYfNSM44xWIvtzeMkztg3angE6KARxaZ5tQV7eBTHrYLzY844bX/OKB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo2-f8.google.com with SMTP id 006d021491bc7-6b1bf394d3bso96709eaf.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 22:09:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788325774; x=1788930574;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OBO86cELFlUkCdajTAJ5v6MHrxAQRGc8jUMpK3Cl52Q=;
        b=GxCt4m8Pk35P9FEPzfbIDql0uLVRrbFdWMMoio1z6vzcz21xCzTZvTFCyaIRpcOFmS
         QiGI3qzrU1tXV3yWWDHVEWVyFDikZyyYKgzK3p+KAaSm0j2kkVq6OhZ+mwffgDIfaOmO
         8axLqE26EFQjZE0PBfBcrpQgVz/c6XvV+kCKylIrfwAULIaamAMARRjueDRZukCncFUI
         2+kyp8LQdfvMmG7Su5+ZOLWdJCaGtXUo2tQbzx+4i5Nt8jvaSnHQAN9y4pvYCffLl/Y6
         ANvbn/9jN+aArPAWFFqU2hLrok16JBwgKRZ4UajLXUvdo0R8byciEorbZyMrF/YP6Wgd
         hduQ==
X-Forwarded-Encrypted: i=1; AHgh+RpiQyFLcPrxOEedvrRoGTlacmOTOW6TD+QSJZaG4BnoG3yvj8De0D357OQhgIcN/zpzOKwAw58iN8erKQE=@vger.kernel.org
X-Gm-Message-State: AFuF++kTIIUsvZbETeP1nyoQr69hNFxNQwG06+XUNtm640VlIDzHdZ+N
	KJel/CxZZGgKCRjDDF+Snto0d2WfIScFeROiF+Jwr6qYJXXQhbOrfu73+SUwJjakha+ZS8Odzfj
	+TzLdm+WpwrmZ4ef+W27dw3CVyapikDhT3NLRZJX+YFjDQ1NP0nZKTyla4Fs=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:983:b0:6b1:ba66:6998 with SMTP id
 006d021491bc7-6b47f825c5amr1826417eaf.14.1788325773816; Tue, 01 Sep 2026
 22:09:33 -0700 (PDT)
Date: Tue, 01 Sep 2026 22:09:33 -0700
In-Reply-To: <6a6e9502.f794c993.27aeb.0018.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a97af8d.27a413cd.1e878c.0004.GAE@google.com>
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Write in usb_free_urb
From: syzbot <syzbot+832ce9fa3face1b7d44d@syzkaller.appspotmail.com>
To: bolewara@gmail.com, devnull@kernel.org, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, mchehab@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    786262be6048 Merge tag 'edac_updates_for_v7.3_rc2' of git:..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=12a28125580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b454dc6b1b7acd30
dashboard link: https://syzkaller.appspot.com/bug?extid=832ce9fa3face1b7d44d
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1735af79580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=135b7f79580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/c3e528ebf709/disk-786262be.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/46f3418d2828/vmlinux-786262be.xz
kernel image: https://storage.googleapis.com/syzbot-assets/60ab8a27c4f7/bzImage-786262be.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+832ce9fa3face1b7d44d@syzkaller.appspotmail.com

usb 1-1: received EP1 urb->status = -2
==================================================================
BUG: KASAN: slab-use-after-free in instrument_atomic_read_write include/linux/instrumented.h:112 [inline]
BUG: KASAN: slab-use-after-free in atomic_fetch_sub_release include/linux/atomic/atomic-instrumented.h:400 [inline]
BUG: KASAN: slab-use-after-free in __refcount_sub_and_test include/linux/refcount.h:389 [inline]
BUG: KASAN: slab-use-after-free in __refcount_dec_and_test include/linux/refcount.h:432 [inline]
BUG: KASAN: slab-use-after-free in refcount_dec_and_test include/linux/refcount.h:450 [inline]
BUG: KASAN: slab-use-after-free in kref_put include/linux/kref.h:64 [inline]
BUG: KASAN: slab-use-after-free in usb_free_urb+0x24/0x120 drivers/usb/core/urb.c:96
Write of size 4 at addr ffff88803cee1050 by task ktimers/1/29

CPU: 1 UID: 0 PID: 29 Comm: ktimers/1 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description+0x55/0x1e0 mm/kasan/report.c:378
 print_report+0x58/0x70 mm/kasan/report.c:482
 kasan_report+0x117/0x150 mm/kasan/report.c:595
 check_region_inline mm/kasan/generic.c:-1 [inline]
 kasan_check_range+0x264/0x2c0 mm/kasan/generic.c:200
 instrument_atomic_read_write include/linux/instrumented.h:112 [inline]
 atomic_fetch_sub_release include/linux/atomic/atomic-instrumented.h:400 [inline]
 __refcount_sub_and_test include/linux/refcount.h:389 [inline]
 __refcount_dec_and_test include/linux/refcount.h:432 [inline]
 refcount_dec_and_test include/linux/refcount.h:450 [inline]
 kref_put include/linux/kref.h:64 [inline]
 usb_free_urb+0x24/0x120 drivers/usb/core/urb.c:96
 dummy_timer+0xaac/0x4d50 drivers/usb/gadget/udc/dummy_hcd.c:2019
 __run_hrtimer kernel/time/hrtimer.c:2067 [inline]
 __hrtimer_run_queues+0x3eb/0xaf0 kernel/time/hrtimer.c:2124
 hrtimer_run_softirq+0x1e1/0x2e0 kernel/time/hrtimer.c:2141
 handle_softirqs+0x1da/0x6d0 kernel/softirq.c:645
 __do_softirq kernel/softirq.c:679 [inline]
 run_ktimerd+0x6a/0x100 kernel/softirq.c:1183
 smpboot_thread_fn+0x565/0xa70 kernel/smpboot.c:160
 kthread+0x38b/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Allocated by task 36:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __do_kmalloc_node mm/slub.c:5414 [inline]
 __kmalloc_noprof+0x41d/0x790 mm/slub.c:5439
 _kmalloc_noprof include/linux/slab.h:995 [inline]
 _kzalloc_noprof include/linux/slab.h:1312 [inline]
 snd_card_new+0x7b/0x110 sound/core/init.c:184
 create_card sound/usb/caiaq/device.c:429 [inline]
 snd_probe+0x236/0x1af0 sound/usb/caiaq/device.c:544
 usb_probe_interface+0x788/0xe50 drivers/usb/core/driver.c:399
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x254/0xae0 drivers/base/dd.c:706
 __driver_probe_device+0x1e8/0x360 drivers/base/dd.c:868
 driver_probe_device+0x4f/0x240 drivers/base/dd.c:898
 __device_attach_driver+0x270/0x410 drivers/base/dd.c:1026
 bus_for_each_drv+0x25b/0x2f0 drivers/base/bus.c:500
 __device_attach+0x2c7/0x450 drivers/base/dd.c:1098
 device_initial_probe+0xa1/0xd0 drivers/base/dd.c:1153
 bus_probe_device+0x12d/0x220 drivers/base/bus.c:620
 device_add+0x7d7/0xb80 drivers/base/core.c:3776
 usb_set_configuration+0x1ad8/0x2180 drivers/usb/core/message.c:2268
 usb_generic_driver_probe+0x8d/0x150 drivers/usb/core/generic.c:250
 usb_probe_device+0x1c3/0x3b0 drivers/usb/core/driver.c:293
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x254/0xae0 drivers/base/dd.c:706
 __driver_probe_device+0x1e8/0x360 drivers/base/dd.c:868
 driver_probe_device+0x4f/0x240 drivers/base/dd.c:898
 __device_attach_driver+0x270/0x410 drivers/base/dd.c:1026
 bus_for_each_drv+0x25b/0x2f0 drivers/base/bus.c:500
 __device_attach+0x2c7/0x450 drivers/base/dd.c:1098
 device_initial_probe+0xa1/0xd0 drivers/base/dd.c:1153
 bus_probe_device+0x12d/0x220 drivers/base/bus.c:620
 device_add+0x7d7/0xb80 drivers/base/core.c:3776
 usb_new_device+0x99a/0x1680 drivers/usb/core/hub.c:2708
 hub_port_connect drivers/usb/core/hub.c:5580 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5720 [inline]
 port_event drivers/usb/core/hub.c:5884 [inline]
 hub_event+0x28cf/0x4cf0 drivers/usb/core/hub.c:5966
 process_one_work kernel/workqueue.c:3396 [inline]
 process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3479
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3560
 kthread+0x38b/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Freed by task 36:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 kasan_save_free_info+0x40/0x50 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2748 [inline]
 slab_free mm/slub.c:6499 [inline]
 kfree+0x1c5/0x6d0 mm/slub.c:6792
 device_release+0xc4/0x1f0 drivers/base/core.c:-1
 kobject_cleanup lib/kobject.c:689 [inline]
 kobject_release lib/kobject.c:720 [inline]
 kref_put include/linux/kref.h:65 [inline]
 kobject_put+0x222/0x550 lib/kobject.c:737
 snd_card_free_when_closed sound/core/init.c:630 [inline]
 snd_card_free+0x138/0x1d0 sound/core/init.c:662
 snd_probe+0x162b/0x1af0 sound/usb/caiaq/device.c:553
 usb_probe_interface+0x788/0xe50 drivers/usb/core/driver.c:399
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x254/0xae0 drivers/base/dd.c:706
 __driver_probe_device+0x1e8/0x360 drivers/base/dd.c:868
 driver_probe_device+0x4f/0x240 drivers/base/dd.c:898
 __device_attach_driver+0x270/0x410 drivers/base/dd.c:1026
 bus_for_each_drv+0x25b/0x2f0 drivers/base/bus.c:500
 __device_attach+0x2c7/0x450 drivers/base/dd.c:1098
 device_initial_probe+0xa1/0xd0 drivers/base/dd.c:1153
 bus_probe_device+0x12d/0x220 drivers/base/bus.c:620
 device_add+0x7d7/0xb80 drivers/base/core.c:3776
 usb_set_configuration+0x1ad8/0x2180 drivers/usb/core/message.c:2268
 usb_generic_driver_probe+0x8d/0x150 drivers/usb/core/generic.c:250
 usb_probe_device+0x1c3/0x3b0 drivers/usb/core/driver.c:293
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x254/0xae0 drivers/base/dd.c:706
 __driver_probe_device+0x1e8/0x360 drivers/base/dd.c:868
 driver_probe_device+0x4f/0x240 drivers/base/dd.c:898
 __device_attach_driver+0x270/0x410 drivers/base/dd.c:1026
 bus_for_each_drv+0x25b/0x2f0 drivers/base/bus.c:500
 __device_attach+0x2c7/0x450 drivers/base/dd.c:1098
 device_initial_probe+0xa1/0xd0 drivers/base/dd.c:1153
 bus_probe_device+0x12d/0x220 drivers/base/bus.c:620
 device_add+0x7d7/0xb80 drivers/base/core.c:3776
 usb_new_device+0x99a/0x1680 drivers/usb/core/hub.c:2708
 hub_port_connect drivers/usb/core/hub.c:5580 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5720 [inline]
 port_event drivers/usb/core/hub.c:5884 [inline]
 hub_event+0x28cf/0x4cf0 drivers/usb/core/hub.c:5966
 process_one_work kernel/workqueue.c:3396 [inline]
 process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3479
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3560
 kthread+0x38b/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

The buggy address belongs to the object at ffff88803cee0000
 which belongs to the cache kmalloc-8k of size 8192
The buggy address is located 4176 bytes inside of
 freed 8192-byte region [ffff88803cee0000, ffff88803cee2000)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x3cee0
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0x80000000000040(head|node=0|zone=1)
page_type: f5(slab)
raw: 0080000000000040 ffff88813ff00280 dead000000000122 0000000000000000
raw: 0000000000000000 0000000000020002 00000000f5000000 0000000000000000
head: 0080000000000040 ffff88813ff00280 dead000000000122 0000000000000000
head: 0000000000000000 0000000000020002 00000000f5000000 0000000000000000
head: 0080000000000003 fffffffffffffe01 00000000ffffffff 00000000ffffffff
head: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd2000(__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5616, tgid 5616 (syz-executor411), ts 97458631629
 set_page_owner include/linux/page_owner.h:33 [inline]
 post_alloc_hook+0x1f9/0x250 mm/page_alloc.c:1871
 prep_new_page mm/page_alloc.c:1879 [inline]
 get_page_from_freelist+0x2591/0x2600 mm/page_alloc.c:3943
 __alloc_frozen_pages_noprof+0x230/0x5c0 mm/page_alloc.c:5436
 alloc_slab_page mm/slub.c:3347 [inline]
 allocate_slab+0x7d/0x620 mm/slub.c:3462
 new_slab mm/slub.c:3513 [inline]
 refill_objects+0x2d8/0x350 mm/slub.c:7410
 refill_sheaf mm/slub.c:2885 [inline]
 __pcs_replace_empty_main+0x339/0x690 mm/slub.c:4774
 alloc_from_pcs mm/slub.c:4850 [inline]
 slab_alloc_node mm/slub.c:4984 [inline]
 __kmalloc_cache_noprof+0x46f/0x680 mm/slub.c:5559
 _kmalloc_noprof include/linux/slab.h:991 [inline]
 usb_device_dump+0xd0/0x2200 drivers/usb/core/devices.c:412
 usb_device_read+0x1b4/0x2c0 drivers/usb/core/devices.c:530
 full_proxy_read+0x127/0x1f0 fs/debugfs/file.c:379
 vfs_read+0x219/0xa90 fs/read_write.c:572
 ksys_read+0x156/0x270 fs/read_write.c:716
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
page last free pid 5598 tgid 5598 ts 96447293579 stack trace:
 reset_page_owner include/linux/page_owner.h:26 [inline]
 __free_pages_prepare mm/page_alloc.c:1418 [inline]
 __free_frozen_pages+0xf8e/0x1070 mm/page_alloc.c:2962
 __slab_free+0x250/0x2a0 mm/slub.c:5815
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x99/0x100 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x148/0x160 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x22/0x80 mm/kasan/common.c:350
 kasan_slab_alloc include/linux/kasan.h:253 [inline]
 slab_post_alloc_hook mm/slub.c:4683 [inline]
 slab_alloc_node mm/slub.c:4996 [inline]
 __kmalloc_cache_noprof+0x353/0x680 mm/slub.c:5559
 _kmalloc_noprof include/linux/slab.h:991 [inline]
 _kzalloc_noprof include/linux/slab.h:1312 [inline]
 kernfs_fop_open+0x3a7/0xcf0 fs/kernfs/file.c:634
 do_dentry_open+0x849/0x1420 fs/open.c:996
 vfs_open+0x3b/0x350 fs/open.c:1101
 do_open fs/namei.c:4837 [inline]
 path_openat+0x1448/0x1d60 fs/namei.c:5000
 do_file_open+0x23e/0x4a0 fs/namei.c:5029
 do_sys_openat2+0x115/0x200 fs/open.c:1417
 do_sys_open fs/open.c:1423 [inline]
 __do_sys_openat fs/open.c:1439 [inline]
 __se_sys_openat fs/open.c:1434 [inline]
 __x64_sys_openat+0x138/0x170 fs/open.c:1434
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffff88803cee0f00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88803cee0f80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff88803cee1000: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                                 ^
 ffff88803cee1080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88803cee1100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
