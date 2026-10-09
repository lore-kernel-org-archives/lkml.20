Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C90F3358B9
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 02:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791511660; cv=none; b=QP9SpJPcw0gcLF/QD+pNTxBTYp+eHAoDnjmwt9+DMH5L77lNsnYcvBc/+L924UJIk0lsOToGnS7PaGP3eolWTZjafryuLEEzmNtZ/MRqthnDuX2iGleb+WiQZ2+fcscqn/WlXORQ/hoQ/BkeCoZoPttOxQtd+tFFIKj9mIPXskI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791511660; c=relaxed/simple;
	bh=ZAOqnswg2rkuR0i1i2W4xenzfuTSHt3eTCoR93DscBE=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Yo8WY721w0T6gIhINQRNoMbA0cvaQ7RpmS7MPAhikkQfY6EJtdvudzsfyhdNFp5rQNUYgCePGdvmO50Rk7AMwebu9qfbOd7V65p6WcSkg26nkZdCOKLKLilf1/v8fhpS7ifdMi3cUeomt1dBIl4elTrawSqWAIs3z6BNlDJvG5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b2f2b8d88fso8997870b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 19:07:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791511657; x=1792116457;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1qYt+vG48IlGBzSCcHqzAFgeG84ds5Yd6CbKOVQRobY=;
        b=nuSa31uaS+DRwehRROXTlNWYwiSC+g9q6Z60bSwjki24LAuveyzra18PhnuIb4MsQa
         Sym3JbTbS+2EV+GXdd4a4XGgFXsux3chriRBOnFRHFAJnYtcfAnUgz432AIMU7pHBkBc
         C4JVvdu2zmMLtqlUxHlpAlk/afst4ulJD/TS0+lRS5b0oDzUFLAp7FG/dRMAoFNinzpa
         nTXwNauUMxS2UEd4Y4ZSOu2f9JbliD6n9EtGugugKZH89Y+CH8SSdyMqrqnD/1dplEyL
         IBrtRpdc8pvtLshXvLWcGLiZFq7gQJnIl2iSREE8+jms4DkOQRkKQdMBRoyxXtZbYxTQ
         byOg==
X-Forwarded-Encrypted: i=1; AKwUvBynp/46yCz7c/muMH235w22CKOIXbVHGaBU8xlyMs3WT0UGudA7b50CU4lyEvq/5xY0m9mzr4Iwjf08I8M=@vger.kernel.org
X-Gm-Message-State: AFuF++lJylaUp7eWXigs3Tr7D3eTFpcDEXYIigz1l+9WJ8yMVZt/kbHp
	DvNeujwMG6EUJ3zPC37zeLikqmgJzIFIwvB8uR+oJhZwfIwX7GF8qkf2J1VUNJ7kNylSZWvJPi/
	rlhTJyUAvHeIj0rdtuBATOaYFSmMNhRuIghOSQfnoG/pHPZzY43roy1DvUK4=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:30a8:b0:4f5:d3bf:edf3 with SMTP id
 5614622812f47-50c563489c1mr342565b6e.59.1791511657364; Thu, 08 Oct 2026
 19:07:37 -0700 (PDT)
Date: Thu, 08 Oct 2026 19:07:37 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac84c69.70ed5d86.2ac85.0025.GAE@google.com>
Subject: [syzbot] [usb?] KASAN: slab-use-after-free Read in printer_func_unbind
From: syzbot <syzbot+ffc483dc87891d3c107b@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    f0406245cb98 Add linux-next specific files for 20261002
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=1142b7f5580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=dfd189b706ddeebe
dashboard link: https://syzkaller.appspot.com/bug?extid=ffc483dc87891d3c107b
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/3727ac4f2c2d/disk-f0406245.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/fb9b2c85f6d9/vmlinux-f0406245.xz
kernel image: https://storage.googleapis.com/syzbot-assets/738723ef945a/bzImage-f0406245.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ffc483dc87891d3c107b@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in printer_req_free drivers/usb/gadget/function/f_printer.c:258 [inline]
BUG: KASAN: slab-use-after-free in printer_func_unbind+0x2e6/0x6d0 drivers/usb/gadget/function/f_printer.c:1466
Read of size 8 at addr ffff8880742abb18 by task syz.1.167/6184

CPU: 1 UID: 0 PID: 6184 Comm: syz.1.167 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description+0x55/0x1e0 mm/kasan/report.c:378
 print_report+0x58/0x70 mm/kasan/report.c:482
 kasan_report+0x117/0x150 mm/kasan/report.c:595
 printer_req_free drivers/usb/gadget/function/f_printer.c:258 [inline]
 printer_func_unbind+0x2e6/0x6d0 drivers/usb/gadget/function/f_printer.c:1466
 purge_configs_funcs+0x248/0x3d0 drivers/usb/gadget/configfs.c:1600
 configfs_composite_unbind+0xa4/0x1c0 drivers/usb/gadget/configfs.c:1846
 gadget_unbind_driver+0x1cb/0x410 drivers/usb/gadget/udc/core.c:1725
 device_remove drivers/base/dd.c:616 [inline]
 __device_release_driver drivers/base/dd.c:1349 [inline]
 device_release_driver_internal+0x48b/0x880 drivers/base/dd.c:1372
 driver_detach+0x1f3/0x2d0 drivers/base/dd.c:1435
 bus_remove_driver+0x226/0x320 drivers/base/bus.c:840
 usb_gadget_unregister_driver+0x4e/0x70 drivers/usb/gadget/udc/core.c:1785
 unregister_gadget drivers/usb/gadget/configfs.c:263 [inline]
 config_usb_cfg_unlink+0x84/0x260 drivers/usb/gadget/configfs.c:502
 configfs_unlink+0x44f/0x6b0 fs/configfs/symlink.c:258
 vfs_unlink+0x27b/0x6d0 fs/namei.c:5662
 filename_unlinkat+0x3cd/0x610 fs/namei.c:5732
 __do_sys_unlinkat fs/namei.c:5761 [inline]
 __se_sys_unlinkat+0x83/0x1a0 fs/namei.c:5753
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f796539e159
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f79635b4028 EFLAGS: 00000246 ORIG_RAX: 0000000000000107
RAX: ffffffffffffffda RBX: 00007f7965626180 RCX: 00007f796539e159
RDX: 0000000000000000 RSI: 0000200000000440 RDI: ffffffffffffff9c
RBP: 00007f796543506b R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f7965626218 R14: 00007f7965626180 R15: 00007ffc6fa5e9f8
 </TASK>

Allocated by task 5932:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:409 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:426
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __kmalloc_cache_noprof+0x31c/0x600 mm/slub.c:5680
 _kmalloc_noprof include/linux/slab.h:991 [inline]
 _kzalloc_noprof include/linux/slab.h:1312 [inline]
 dummy_alloc_request+0x7f/0x130 drivers/usb/gadget/udc/dummy_hcd.c:695
 usb_ep_alloc_request+0x67/0x280 drivers/usb/gadget/udc/core.c:198
 printer_req_alloc drivers/usb/gadget/function/f_printer.c:240 [inline]
 printer_func_bind+0x55c/0xbc0 drivers/usb/gadget/function/f_printer.c:1150
 usb_add_function+0x2e1/0x9f0 drivers/usb/gadget/composite.c:333
 configfs_composite_bind+0xde0/0x1410 drivers/usb/gadget/configfs.c:1802
 gadget_bind_driver+0x2ca/0x9e0 drivers/usb/gadget/udc/core.c:1663
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x254/0xae0 drivers/base/dd.c:706
 __driver_probe_device+0x1e8/0x360 drivers/base/dd.c:868
 driver_probe_device+0x4f/0x240 drivers/base/dd.c:898
 __driver_attach+0x339/0x600 drivers/base/dd.c:1292
 bus_for_each_dev+0x23b/0x2c0 drivers/base/bus.c:386
 bus_add_driver+0x38f/0x6e0 drivers/base/bus.c:771
 driver_register+0x23a/0x320 drivers/base/driver.c:174
 usb_gadget_register_driver_owner+0xf9/0x270 drivers/usb/gadget/udc/core.c:1753
 gadget_dev_desc_UDC_store+0x1c9/0x2f0 drivers/usb/gadget/configfs.c:300
 flush_write_buffer fs/configfs/file.c:207 [inline]
 configfs_write_iter+0x337/0x430 fs/configfs/file.c:229
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x612/0xba0 fs/read_write.c:687
 ksys_write+0x150/0x270 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 6168:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 kasan_save_free_info+0x40/0x50 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:264 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:296
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2780 [inline]
 slab_free mm/slub.c:6630 [inline]
 kfree+0x1c5/0x650 mm/slub.c:6923
 printer_req_free drivers/usb/gadget/function/f_printer.c:259 [inline]
 printer_func_unbind+0x2fa/0x6d0 drivers/usb/gadget/function/f_printer.c:1466
 purge_configs_funcs+0x248/0x3d0 drivers/usb/gadget/configfs.c:1600
 configfs_composite_unbind+0xa4/0x1c0 drivers/usb/gadget/configfs.c:1846
 gadget_unbind_driver+0x1cb/0x410 drivers/usb/gadget/udc/core.c:1725
 device_remove drivers/base/dd.c:616 [inline]
 __device_release_driver drivers/base/dd.c:1349 [inline]
 device_release_driver_internal+0x48b/0x880 drivers/base/dd.c:1372
 driver_detach+0x1f3/0x2d0 drivers/base/dd.c:1435
 bus_remove_driver+0x226/0x320 drivers/base/bus.c:840
 usb_gadget_unregister_driver+0x4e/0x70 drivers/usb/gadget/udc/core.c:1785
 unregister_gadget drivers/usb/gadget/configfs.c:263 [inline]
 gadget_dev_desc_UDC_store+0x17a/0x2f0 drivers/usb/gadget/configfs.c:290
 flush_write_buffer fs/configfs/file.c:207 [inline]
 configfs_write_iter+0x337/0x430 fs/configfs/file.c:229
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x612/0xba0 fs/read_write.c:687
 ksys_write+0x150/0x270 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff8880742abb00
 which belongs to the cache kmalloc-128 of size 128
The buggy address is located 24 bytes inside of
 freed 128-byte region [ffff8880742abb00, ffff8880742abb80)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x742ab
flags: 0xfff00000000000(node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000000 ffff88813ff24a00 dead000000000122 0000000000000000
raw: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0xd2cc0(GFP_KERNEL|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5932, tgid 5931 (syz.0.63), ts 80748630940
 set_page_owner include/linux/page_owner.h:33 [inline]
 post_alloc_hook+0x1f9/0x250 mm/page_alloc.c:1854
 prep_new_page mm/page_alloc.c:1862 [inline]
 get_page_from_freelist+0x220f/0x2280 mm/page_alloc.c:3933
 __alloc_frozen_pages_noprof+0x1fc/0x400 mm/page_alloc.c:5471
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
 dummy_alloc_request+0x7f/0x130 drivers/usb/gadget/udc/dummy_hcd.c:695
 usb_ep_alloc_request+0x67/0x280 drivers/usb/gadget/udc/core.c:198
 printer_req_alloc drivers/usb/gadget/function/f_printer.c:240 [inline]
 printer_func_bind+0x265/0xbc0 drivers/usb/gadget/function/f_printer.c:1143
 usb_add_function+0x2e1/0x9f0 drivers/usb/gadget/composite.c:333
 configfs_composite_bind+0xde0/0x1410 drivers/usb/gadget/configfs.c:1802
 gadget_bind_driver+0x2ca/0x9e0 drivers/usb/gadget/udc/core.c:1663
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x254/0xae0 drivers/base/dd.c:706
 __driver_probe_device+0x1e8/0x360 drivers/base/dd.c:868
 driver_probe_device+0x4f/0x240 drivers/base/dd.c:898
page last free pid 16 tgid 16 ts 80343580851 stack trace:
 reset_page_owner include/linux/page_owner.h:26 [inline]
 __free_pages_prepare mm/page_alloc.c:1401 [inline]
 __free_frozen_pages+0xc97/0xd90 mm/page_alloc.c:2952
 rcu_do_batch kernel/rcu/tree.c:2650 [inline]
 rcu_core+0x926/0x1260 kernel/rcu/tree.c:2919
 handle_softirqs+0x223/0x840 kernel/softirq.c:645
 __do_softirq kernel/softirq.c:679 [inline]
 invoke_softirq kernel/softirq.c:519 [inline]
 __irq_exit_rcu+0xcb/0x220 kernel/softirq.c:758
 irq_exit_rcu+0x9/0x30 kernel/softirq.c:775
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1062 [inline]
 sysvec_apic_timer_interrupt+0xa6/0xc0 arch/x86/kernel/apic/apic.c:1062
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:674

Memory state around the buggy address:
 ffff8880742aba00: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff8880742aba80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff8880742abb00: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                            ^
 ffff8880742abb80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff8880742abc00: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
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
