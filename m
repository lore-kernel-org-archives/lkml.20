Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792683603;
	b=z+qnNdyq0v3yjTMRfcWh/UgmhFFP4loUG+VpEishkDV/oq5NCOCwg+iPZ0SJAtn/LuKr
	 z1HRbq/TTUVhbEMsUwsFDyNxXu7E/Iahg+NQggIrZZ9E6qgu41cR3IcXF+wXKoHftngqG
	 /9m0C05Qy0/CM+7s+XyIAhQ7K4QFF2rt7sK6pdIMUXXCBu7MldFgaVnItF9NRz6w6vq8w
	 CX/dzm+JIUiSE6SY8gbtLowrgrXnXrQQaq76zKoKYzJHzEcf9gMzTJxpH7AHTvG8vLJ9N
	 yKZ7RY8KAOWvr5XftmdzCBcEiPUBFWIvDVwtgeJwkdanUkDI9mAnrefm58NtwqgkpJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792683603;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=faoiMVjb4QCUAjhNVMdHMcA6ZmrHhRTdJ4jEqyNOKFg=;
	b=M1R8p3+DRuamKpgy5retPgv4h9EkjjNlxCcf+r+P5vc/cta/a3AVGhn/I8jl0O5Fz3Ak
	 o4ikSnxeIMo+raTnWR/e5oBdPPw8K9VhHtX07Jei78Qy3xEJtQ+6sdfsp78lgFtq1vxPM
	 HmRXLt6tWZANu0RnbSi5MOxsq0VFcfSbxVLh6D+Dtz1RfhkEkanhO1nPoqJDzXqkhdxSa
	 JXxRHkui47znTFNW/A7p2To6MwHEXi7cyX5PQMqViubfWflcTpbqhWiy11daGVhqZULbD
	 x9VnfkkqKVobq9Goe69h9wAozSkoyjXuHVyca3Ld2960rhwoCe6/RtuO5uoC04G0C7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83DF606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:40:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D83DF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4dc57e2a3f2so39219b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:40:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792683602; x=1793288402;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=faoiMVjb4QCUAjhNVMdHMcA6ZmrHhRTdJ4jEqyNOKFg=;
        b=WhxfYpwWWUyymMPjRRiMVK5KRlhX2p886lHUavKfD8dwW9OjhvvgZhpy5EU09N940h
         dyuQF3KSRK9orFcFQFZIjBjPtnEdoNgsUIdGm0mUQV4FKu0qlFeLeFArUmv55XimLZU8
         3YB3CnR3CRJWOGhJ7X4kDA52MAPEhGaKZaOv+CXG456YvkESR0Hdyt9TuBBzdoPRtFph
         iUlpQoe6Tqdw1xUT8tOR6Bk73ihg5OEEiJ+zxRcHTEFMVKoNLj4uvDah1OfulZWBw9Wx
         FfCczo65vnyt1pclJMaPZMGloFjaaIn+lVIK5237r5O+9KKa4wszoJHiseuAivGwSVNE
         7KPg==
X-Gm-Message-State: AFq9FYLPXAJwyje26/EjJqa4Qz6mSW09mmU9rR+LokcmAV6g0sqK3rP2
	dB1G+fD2nTVVU8djv0+44ITJHopBQD9PYt/RoUCZ3gYEtk6aA0Hav8KNsa8kqRvt1JGwqSTacr7
	LY9lqkPsU+6iYzHW5aRQhnv9Vci8sst28auIaw+JqXbjZjeBWelPx5BWt9Lw=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4f47:b0:4fb:90ae:2b02 with SMTP id
 5614622812f47-5535af1c0famr4040716b6e.52.1792683602002; Thu, 22 Oct 2026
 08:40:02 -0700 (PDT)
Date: Thu, 22 Oct 2026 08:40:01 -0700
In-Reply-To: <CAFJkwZzN_bRRY4hqa1upEsCmnXyMeYdUd-4dKhO9_8vvuwVc4g@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ada2e51.4c8f3b9a.1a805.0093.GAE@google.com>
Subject: Re: [syzbot] [media?] [usb?] kernel BUG in v4l2_device_put
From: syzbot <syzbot+809dfc586f33fc44b6ac@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, neganhat@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
KASAN: slab-use-after-free Read in em28xx_write_regs_req

==================================================================
BUG: KASAN: slab-use-after-free in __intf_to_usbdev include/linux/usb.h:752 [inline]
BUG: KASAN: slab-use-after-free in em28xx_write_regs_req+0x79/0x3c0 drivers/media/usb/em28xx/em28xx-core.c:138
Read of size 8 at addr ffff88802229e0b8 by task v4l_id/8728

CPU: 0 UID: 0 PID: 8728 Comm: v4l_id Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/07/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description+0x55/0x1e0 mm/kasan/report.c:378
 print_report+0x58/0x70 mm/kasan/report.c:482
 kasan_report+0x117/0x150 mm/kasan/report.c:595
 __intf_to_usbdev include/linux/usb.h:752 [inline]
 em28xx_write_regs_req+0x79/0x3c0 drivers/media/usb/em28xx/em28xx-core.c:138
 em28xx_write_regs drivers/media/usb/em28xx/em28xx-core.c:179 [inline]
 em28xx_write_reg+0x89/0xd0 drivers/media/usb/em28xx/em28xx-core.c:186
 em28xx_set_outfmt+0xb1/0x420 drivers/media/usb/em28xx/em28xx-video.c:233
 em28xx_resolution_set+0x261/0x7f0 drivers/media/usb/em28xx/em28xx-video.c:339
 em28xx_v4l2_open+0x21a/0x840 drivers/media/usb/em28xx/em28xx-video.c:2390
 v4l2_open+0x1bc/0x3a0 drivers/media/v4l2-core/v4l2-dev.c:433
 chrdev_open+0x4d9/0x600 fs/char_dev.c:413
 do_dentry_open+0x80e/0x1360 fs/open.c:1000
 vfs_open_consume+0x4a/0x350 fs/open.c:1131
 do_open fs/namei.c:4845 [inline]
 path_openat+0x16fc/0x20f0 fs/namei.c:5010
 do_file_open+0x23e/0x4a0 fs/namei.c:5039
 do_sys_openat2+0x115/0x200 fs/open.c:1442
 do_sys_open fs/open.c:1448 [inline]
 __do_sys_openat fs/open.c:1788 [inline]
 __se_sys_openat fs/open.c:1783 [inline]
 __x64_sys_openat+0x138/0x170 fs/open.c:1783
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fc4a0ea7407
Code: 48 89 fa 4c 89 df e8 38 aa 00 00 8b 93 08 03 00 00 59 5e 48 83 f8 fc 74 1a 5b c3 0f 1f 84 00 00 00 00 00 48 8b 44 24 10 0f 05 <5b> c3 0f 1f 80 00 00 00 00 83 e2 39 83 fa 08 75 de e8 23 ff ff ff
RSP: 002b:00007ffee11a62b0 EFLAGS: 00000202 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 00007fc4a1572880 RCX: 00007fc4a0ea7407
RDX: 0000000000000000 RSI: 00007ffee11a7f1d RDI: ffffffffffffff9c
RBP: 0000000000000002 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000202 R12: 0000000000000000
R13: 00007ffee11a6500 R14: 00007fc4a1677000 R15: 000055b0a97fd4d8
 </TASK>

Allocated by task 3215:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:409 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:426
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __kmalloc_cache_noprof+0x31c/0x600 mm/slub.c:5680
 _kmalloc_noprof include/linux/slab.h:991 [inline]
 _kzalloc_noprof include/linux/slab.h:1312 [inline]
 usb_set_configuration+0x3c5/0x2260 drivers/usb/core/message.c:2103
 usb_generic_driver_probe+0x8d/0x150 drivers/usb/core/generic.c:250
 usb_probe_device+0x1c3/0x3b0 drivers/usb/core/driver.c:293
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x254/0xae0 drivers/base/dd.c:707
 __driver_probe_device+0x1e8/0x360 drivers/base/dd.c:869
 driver_probe_device+0x4f/0x240 drivers/base/dd.c:899
 __device_attach_driver+0x270/0x410 drivers/base/dd.c:1027
 bus_for_each_drv+0x258/0x2f0 drivers/base/bus.c:503
 __device_attach+0x2bd/0x430 drivers/base/dd.c:1131
 device_initial_probe+0x9c/0x100 drivers/base/dd.c:1190
 __bus_probe_device+0x126/0x220 drivers/base/bus.c:617
 device_add+0x7d7/0xb80 drivers/base/core.c:3776
 usb_new_device+0x9aa/0x1690 drivers/usb/core/hub.c:2713
 hub_port_connect drivers/usb/core/hub.c:5585 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5725 [inline]
 port_event drivers/usb/core/hub.c:5889 [inline]
 hub_event+0x28e8/0x4d30 drivers/usb/core/hub.c:5971
 process_one_work kernel/workqueue.c:3495 [inline]
 process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3578
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3659
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Freed by task 3215:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 kasan_save_free_info+0x40/0x50 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:264 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:296
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2780 [inline]
 slab_free mm/slub.c:6630 [inline]
 kfree+0x1c5/0x650 mm/slub.c:6923
 device_release+0xc4/0x1f0 drivers/base/core.c:-1
 kobject_cleanup lib/kobject.c:689 [inline]
 kobject_release lib/kobject.c:720 [inline]
 kref_put include/linux/kref.h:65 [inline]
 kobject_put+0x222/0x550 lib/kobject.c:737
 usb_disable_device+0x611/0x8d0 drivers/usb/core/message.c:1491
 usb_disconnect+0x346/0x9a0 drivers/usb/core/hub.c:2355
 hub_port_connect drivers/usb/core/hub.c:5425 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5725 [inline]
 port_event drivers/usb/core/hub.c:5889 [inline]
 hub_event+0x1bbb/0x4d30 drivers/usb/core/hub.c:5971
 process_one_work kernel/workqueue.c:3495 [inline]
 process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3578
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3659
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

The buggy address belongs to the object at ffff88802229e000
 which belongs to the cache kmalloc-2k of size 2048
The buggy address is located 184 bytes inside of
 freed 2048-byte region [ffff88802229e000, ffff88802229e800)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x22298
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88813ff30000 dead000000000100 dead000000000122
raw: 0000000000000000 0000000000080008 00000000f5000000 0000000000000000
head: 00fff00000000040 ffff88813ff30000 dead000000000100 dead000000000122
head: 0000000000000000 0000000000080008 00000000f5000000 0000000000000000
head: 00fff00000000003 fffffffffffffe01 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 1, tgid 1 (swapper/0), ts 5001221219
 set_page_owner include/linux/page_owner.h:33 [inline]
 post_alloc_hook+0x1f9/0x250 mm/page_alloc.c:1856
 prep_new_page mm/page_alloc.c:1864 [inline]
 get_page_from_freelist+0x220f/0x2280 mm/page_alloc.c:3935
 __alloc_frozen_pages_noprof+0x1fe/0x410 mm/page_alloc.c:5459
 alloc_slab_page mm/slub.c:3384 [inline]
 allocate_slab+0x7d/0x5e0 mm/slub.c:3499
 new_slab mm/slub.c:3550 [inline]
 refill_objects+0x2d5/0x350 mm/slub.c:7539
 refill_sheaf mm/slub.c:2917 [inline]
 __pcs_replace_empty_main+0x2c8/0x6c0 mm/slub.c:4811
 alloc_from_pcs mm/slub.c:4887 [inline]
 slab_alloc_node mm/slub.c:5021 [inline]
 __kmalloc_cache_noprof+0x396/0x600 mm/slub.c:5676
 _kmalloc_noprof include/linux/slab.h:991 [inline]
 _kzalloc_noprof include/linux/slab.h:1312 [inline]
 acpi_add_single_object+0xdb/0x1b30 drivers/acpi/scan.c:1870
 acpi_bus_check_add+0x2b5/0x840 drivers/acpi/scan.c:2175
 acpi_ns_walk_namespace+0x273/0x700 drivers/acpi/acpica/nswalk.c:-1
 acpi_walk_namespace+0x125/0x190 drivers/acpi/acpica/nsxfeval.c:606
 acpi_bus_scan+0xe9/0x4b0 drivers/acpi/scan.c:2732
 acpi_scan_init+0x1bd/0x4e0 drivers/acpi/scan.c:2873
 acpi_init+0x130/0x1f0 drivers/acpi/bus.c:1483
 do_one_initcall+0x250/0x870 init/main.c:1419
 do_initcall_level+0x10a/0x1a0 init/main.c:1481
page last free pid 1 tgid 1 ts 3782412345 stack trace:
 reset_page_owner include/linux/page_owner.h:26 [inline]
 __free_pages_prepare mm/page_alloc.c:1403 [inline]
 __free_pages_ok+0xb6d/0xc60 mm/page_alloc.c:1581
 btf_add_type kernel/bpf/btf.c:1782 [inline]
 btf_check_all_metas+0x5e7/0xa30 kernel/bpf/btf.c:5888
 btf_parse_base kernel/bpf/btf.c:6883 [inline]
 btf_parse_vmlinux+0x51d/0x8c0 kernel/bpf/btf.c:6917
 bpf_get_btf_vmlinux+0x48/0x70 kernel/bpf/verifier.c:23010
 btf_get_module_btf kernel/bpf/btf.c:9601 [inline]
 __register_btf_kfunc_id_set+0x62/0x14c0 kernel/bpf/btf.c:10122
 wakeup_sources_bpf_init+0x11/0x60 drivers/base/power/wakeup.c:1229
 wakeup_sources_init+0x28/0x30 drivers/base/power/wakeup.c:1240
 do_one_initcall+0x250/0x870 init/main.c:1419
 do_initcall_level+0x10a/0x1a0 init/main.c:1481
 do_initcalls+0x59/0xa0 init/main.c:1497
 kernel_init_freeable+0x29d/0x3e0 init/main.c:1732
 kernel_init+0x22/0x1d0 init/main.c:1622
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Memory state around the buggy address:
 ffff88802229df80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff88802229e000: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff88802229e080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                        ^
 ffff88802229e100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88802229e180: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


Tested on:

commit:         8f7df005 Add linux-next specific files for 20261020
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
console output: https://syzkaller.appspot.com/x/log.txt?x=16626e7f980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9c1b9b13e3e4ce1a
dashboard link: https://syzkaller.appspot.com/bug?extid=809dfc586f33fc44b6ac
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1232a3cd580000

