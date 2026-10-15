Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C0941CB20
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792101241; cv=none; b=kNATdDVuH00Pc2Rt/QS4iFwELyIzTEAihC/wM+Vaw6cc5wK6Qi7cnUzIu/fHPzbcHK7TS4qhoWQWowlTJb5hNYUiflbdsuQMeWFDQ3DgsNMWwKRQuuzm5f24NxKb+oG2RlqFTNVnd45LJFvwunWH0h3QXUirXB7wYQiek95cZpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792101241; c=relaxed/simple;
	bh=6uP/8F/UvGjA1xP+F6cvGpDBha1VkeKAjYE4fDfEia8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UgP4cXkahJ3f6LaZozvhP/mqa96nDZv3iDiQCBuZqpQ/dip6jVmxnKKzm+QydMOzUDOy65LVrgqMlZnbkUPyg/g3BL3vAxtFLK5kQeqxRi7pTjereFzWwD/bhh+284+1OSri/G2pdUXauoVotXj+6Eivv0UMWBp/1KnKQwNBO1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GBmWS13k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GBmWS13k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FAF21F000C5;
	Thu, 15 Oct 2026 21:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792101240;
	bh=fMfhgzDTfMiI9Mt3cOW7FQTockNxKg+KdRx/YOqcN4s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=GBmWS13khizDcZyt2NoEHwBE6PXFDYnRrczvsQimstG5WRJRCZSd+tguOwHuHSfwU
	 q8UI95gpwrZxu8+e/BB4BADK5Ll3IvMOtCatdgRnxgTG6YUAOE5RlTg+ir71s+aL2n
	 TpjwYCiHBIM3KhE+ifG4h58FroM5IunI/GV09c6SIIcLqPMBYpLl5/k64RsELK2igI
	 9vkGsIdR9vNNbvBJ2ABJ0RDKg/TjfEJNf9hfdFpxfkOV9XAA/gRfe7sZN5n8xrjY9e
	 q+fHgBVq408OShmZAbH+330KHNhe9pqnSOV4dunedFJUF5DTdDOokBwFClmccDYYiM
	 FhZ4JWtwgXbjA==
From: Thomas Gleixner <tglx@kernel.org>
To: syzbot <syzbot+843bf2f48f4d12e6682e@syzkaller.appspotmail.com>,
 linux-kernel@vger.kernel.org, radu@rendec.net,
 syzkaller-bugs@googlegroups.com
Cc: abbotti@mev.co.uk, hsweeten@visionengravers.com
Subject: Re: [syzbot] [kernel?] KASAN: slab-use-after-free Read in __setup_irq
In-Reply-To: <6ab45d21.80e1c6cc.1e8e5f.0004.GAE@google.com>
References: <6ab45d21.80e1c6cc.1e8e5f.0004.GAE@google.com>
Date: Thu, 15 Oct 2026 23:53:57 +0200
Message-ID: <87pkxad40a.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Sep 23 2026 at 16:13, syzbot wrote:

CC+: Comedy folks

> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    fe2ec83746e5 Merge tag 'hid-for-linus-2026092202' of git:/..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=10e9cd25580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=7d012d9c67977ee4
> dashboard link: https://syzkaller.appspot.com/bug?extid=843bf2f48f4d12e6682e
> compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
>
> Unfortunately, I don't have any reproducer for this issue yet.
>
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/cd25f1c33d2a/disk-fe2ec837.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/2c35e3694ae6/vmlinux-fe2ec837.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/1ff8b2a62fde/bzImage-fe2ec837.xz
>
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+843bf2f48f4d12e6682e@syzkaller.appspotmail.com
>
> ==================================================================
> BUG: KASAN: slab-use-after-free in string_nocheck lib/vsprintf.c:648 [inline]
> BUG: KASAN: slab-use-after-free in string+0x471/0x4d0 lib/vsprintf.c:730
> Read of size 1 at addr ffff88802643b8a0 by task syz.0.818/8415
>
> CPU: 1 UID: 0 PID: 8415 Comm: syz.0.818 Not tainted syzkaller #0 PREEMPT(full) 
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/26/2026
> Call Trace:
>  <TASK>
>  __dump_stack lib/dump_stack.c:94 [inline]
>  dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
>  print_address_description mm/kasan/report.c:378 [inline]
>  print_report+0x13d/0x4b0 mm/kasan/report.c:482
>  kasan_report+0xdf/0x1c0 mm/kasan/report.c:595
>  string_nocheck lib/vsprintf.c:648 [inline]
>  string+0x471/0x4d0 lib/vsprintf.c:730
>  vsnprintf+0x422/0x1300 lib/vsprintf.c:2949
>  vprintk_store+0x3b3/0xbe0 kernel/printk/printk.c:2307
>  vprintk_emit+0x139/0x6b0 kernel/printk/printk.c:2455
>  _printk+0xcf/0x110 kernel/printk/printk.c:2504
>  __setup_irq.cold+0x3be/0x3f1 kernel/irq/manage.c:1821
>  request_threaded_irq+0x261/0x3e0 kernel/irq/manage.c:2184
>  request_irq include/linux/interrupt.h:176 [inline]
>  pcl812_attach+0x1b62/0x2300 drivers/comedi/drivers/pcl812.c:1174
>  comedi_device_attach+0x40e/0x6b0 drivers/comedi/drivers.c:1101
>  do_devconfig_ioctl+0x1b3/0x6d0 drivers/comedi/comedi_fops.c:930
>  comedi_unlocked_ioctl+0x860/0x3310 drivers/comedi/comedi_fops.c:2302
>  vfs_ioctl fs/ioctl.c:51 [inline]
>  __do_sys_ioctl fs/ioctl.c:597 [inline]
>  __se_sys_ioctl fs/ioctl.c:583 [inline]
>  __x64_sys_ioctl+0x18e/0x210 fs/ioctl.c:583
>  do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
>  do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7fcaa579e159
> Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007fcaa6663028 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> RAX: ffffffffffffffda RBX: 00007fcaa5a25fa0 RCX: 00007fcaa579e159
> RDX: 0000200000000240 RSI: 0000000040946400 RDI: 0000000000000006
> RBP: 00007fcaa583506b R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
> R13: 00007fcaa5a26038 R14: 00007fcaa5a25fa0 R15: 00007fffa588bd58
>  </TASK>
>
> Allocated by task 1:
>  kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
>  kasan_save_track+0x14/0x30 mm/kasan/common.c:78
>  poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
>  __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:415
>  kasan_kmalloc include/linux/kasan.h:263 [inline]
>  __do_kmalloc_node mm/slub.c:5414 [inline]
>  __kmalloc_node_track_caller_noprof+0x33d/0x870 mm/slub.c:5545
>  kvasprintf+0xbc/0x150 lib/kasprintf.c:25
>  kasprintf+0xc7/0x100 lib/kasprintf.c:59
>  serial_core_add_one_port drivers/tty/serial/serial_core.c:3106 [inline]
>  serial_core_register_port+0x46b/0x1660 drivers/tty/serial/serial_core.c:3353
>  serial8250_register_8250_port+0x16c7/0x2440 drivers/tty/serial/8250/8250_core.c:877
>  serial_pnp_probe+0x443/0x950 drivers/tty/serial/8250/8250_pnp.c:480
>  pnp_device_probe+0x2b3/0x4a0 drivers/pnp/driver.c:111
>  call_driver_probe drivers/base/dd.c:628 [inline]
>  really_probe+0x241/0xa60 drivers/base/dd.c:706
>  __driver_probe_device+0x210/0x460 drivers/base/dd.c:868
>  driver_probe_device+0x4a/0x140 drivers/base/dd.c:898
>  __driver_attach+0x21f/0x5b0 drivers/base/dd.c:1292
>  bus_for_each_dev+0x13e/0x1d0 drivers/base/bus.c:383
>  bus_add_driver+0x305/0x5b0 drivers/base/bus.c:763
>  driver_register+0x1e2/0x360 drivers/base/driver.c:174
>  serial8250_init+0xcc/0x1c0 drivers/tty/serial/8250/8250_platform.c:318
>  do_one_initcall+0x11c/0x6f0 init/main.c:1362
>  do_initcall_level init/main.c:1424 [inline]
>  do_initcalls init/main.c:1440 [inline]
>  do_basic_setup init/main.c:1460 [inline]
>  kernel_init_freeable+0x6ea/0x7b0 init/main.c:1675
>  kernel_init+0x21/0x1e0 init/main.c:1565
>  ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
>  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
>
> Freed by task 8240:
>  kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
>  kasan_save_track+0x14/0x30 mm/kasan/common.c:78
>  kasan_save_free_info+0x3b/0x70 mm/kasan/generic.c:584
>  poison_slab_object mm/kasan/common.c:253 [inline]
>  __kasan_slab_free+0x5f/0x80 mm/kasan/common.c:285
>  kasan_slab_free include/linux/kasan.h:235 [inline]
>  slab_free_hook mm/slub.c:2748 [inline]
>  slab_free mm/slub.c:6508 [inline]
>  kfree+0x22b/0x6d0 mm/slub.c:6801
>  serial_core_remove_one_port drivers/tty/serial/serial_core.c:3222 [inline]
>  serial_core_unregister_port+0x4b9/0x960 drivers/tty/serial/serial_core.c:3383
>  serial8250_unregister_port+0x1db/0x890 drivers/tty/serial/8250/8250_core.c:932
>  pnp_device_remove+0x7f/0x250 drivers/pnp/driver.c:133
>  device_remove+0xcb/0x180 drivers/base/dd.c:616
>  __device_release_driver drivers/base/dd.c:1349 [inline]
>  device_release_driver_internal+0x44e/0x620 drivers/base/dd.c:1372
>  unbind_store+0xf8/0x110 drivers/base/bus.c:244
>  drv_attr_store+0x74/0xb0 drivers/base/bus.c:125
>  sysfs_kf_write+0xf2/0x150 fs/sysfs/file.c:145
>  kernfs_fop_write_iter+0x3e0/0x5f0 fs/kernfs/file.c:345
>  new_sync_write fs/read_write.c:595 [inline]
>  vfs_write+0x6af/0x1050 fs/read_write.c:687
>  ksys_write+0x12a/0x250 fs/read_write.c:739
>  do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
>  do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
>
> The buggy address belongs to the object at ffff88802643b8a0
>  which belongs to the cache kmalloc-8 of size 8
> The buggy address is located 0 bytes inside of
>  freed 8-byte region [ffff88802643b8a0, ffff88802643b8a8)
>
> The buggy address belongs to the physical page:
> page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x2643b
> flags: 0xfff00000000000(node=0|zone=1|lastcpupid=0x7ff)
> page_type: f5(slab)
> raw: 00fff00000000000 ffff88801c034500 dead000000000100 dead000000000122
> raw: 0000000000000000 0000000000800080 00000000f5000000 0000000000000000
> page dumped because: kasan: bad access detected
> page_owner tracks the page as allocated
> page last allocated via order 0, migratetype Unmovable, gfp_mask 0xd2cc0(GFP_KERNEL|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 1, tgid 1 (swapper/0), ts 4167969447
>  set_page_owner include/linux/page_owner.h:33 [inline]
>  post_alloc_hook+0xfd/0x120 mm/page_alloc.c:1871
>  prep_new_page mm/page_alloc.c:1879 [inline]
>  get_page_from_freelist+0x110d/0x35d0 mm/page_alloc.c:3943
>  __alloc_frozen_pages_noprof+0x2eb/0x3300 mm/page_alloc.c:5436
>  alloc_slab_page mm/slub.c:3347 [inline]
>  allocate_slab mm/slub.c:3462 [inline]
>  new_slab+0xa9/0x6e0 mm/slub.c:3513
>  refill_objects+0xe3/0x410 mm/slub.c:7417
>  refill_sheaf mm/slub.c:2885 [inline]
>  __pcs_replace_empty_main+0x35e/0x650 mm/slub.c:4774
>  alloc_from_pcs mm/slub.c:4850 [inline]
>  slab_alloc_node mm/slub.c:4984 [inline]
>  __do_kmalloc_node mm/slub.c:5413 [inline]
>  __kmalloc_node_track_caller_noprof+0x6a8/0x870 mm/slub.c:5545
>  __kmemdup_nul mm/util.c:64 [inline]
>  kstrdup+0x51/0xe0 mm/util.c:84
>  kstrdup_const+0x63/0x80 mm/util.c:104
>  kvasprintf_const+0x10f/0x1a0 lib/kasprintf.c:48
>  kobject_set_name_vargs+0x5a/0x140 lib/kobject.c:274
>  dev_set_name+0xc7/0x100 drivers/base/core.c:3564
>  tty_register_device_attr+0x2fb/0x7f0 drivers/tty/tty_io.c:3230
>  tty_register_device drivers/tty/tty_io.c:3171 [inline]
>  tty_register_driver+0x769/0xb50 drivers/tty/tty_io.c:3449
>  legacy_pty_init drivers/tty/pty.c:579 [inline]
>  pty_init+0x65d/0xdc0 drivers/tty/pty.c:919
>  do_one_initcall+0x11c/0x6f0 init/main.c:1362
> page_owner free stack trace missing
>
> Memory state around the buggy address:
>  ffff88802643b780: 05 fc fc fc 05 fc fc fc 05 fc fc fc 05 fc fc fc
>  ffff88802643b800: 05 fc fc fc 05 fc fc fc 05 fc fc fc 05 fc fc fc
>>ffff88802643b880: 05 fc fc fc fa fc fc fc 05 fc fc fc fa fc fc fc
>                                ^
>  ffff88802643b900: fa fc fc fc 05 fc fc fc fa fc fc fc fa fc fc fc
>  ffff88802643b980: fa fc fc fc 04 fc fc fc 00 fc fc fc 00 fc fc fc
> ==================================================================
>
>
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
>
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
>
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
>
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
>
> If you want to undo deduplication, reply with:
> #syz undup
