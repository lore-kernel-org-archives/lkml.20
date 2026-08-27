Received: from mail-oa2-f0.google.com (mail-oa2-f0.google.com [74.125.231.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A334D2EE9
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787856694; cv=none; b=utoS92Ga0HSUt14nc1T9Z/DevRfYLB3Z6eA+oqWozKfR3YZXJ8dI84aqI5NOz8rxLtl0ILiVrVKN4mkqj1WmaaiEb92wO6ReuaB0nZEs+XsJfdwjLOQiQQMmauduoEg6DX6mQrC0DmFZYiFCX3O3cPgQzLXVdl+iYHSrjLyx7Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787856694; c=relaxed/simple;
	bh=gxdlnPH3RuTfUj8t5QyWPKwM7uBOKfTDVM9t610Nm5s=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=WzYqDInkJf4C0pGMhNi2pBYqq2GliOBrpeDULfJUoCd8a12MASxXFF4+LqtRUKBLEzWyviTH2g74/wTP6xFhMj0/TWV3h9BosKtuKADeY9i0OpoV3B/Ac42eOD9lsZb7HYsuz7Unl1uY8961Vkp5oTbT/giGReJh/9gsC19qI9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa2-f0.google.com with SMTP id 586e51a60fabf-451e8472960so209666fac.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:51:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787856691; x=1788461491;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mCkwPdV5GG5TxBlUKjdprtvkjiIChmQMMFvc1y51XvQ=;
        b=AOKH2TLZgiEUX9Oyl9YBKLkETWm3kVtVgHmhdU47qJPG+yU86/sLLTty4cBdlCKKS9
         pBpyIo7Hlpbp9fpO2Ft1fdywHhK132glaFWodGNp4hMXLgOZX2UWzT5mW1lt67U+4d4s
         HYu6/e6Gg7L12nZhq4D0RcdRE0b7hm3sr/35Zpd2k14ray7NCSHAD7koAVC51AZJIKds
         vGriDdOFnFTL7vYGZf3eYdzc5MFmm1E7pbGQiP/Olw209x77e8o+J7uYIfea+DGTR21u
         hwf8I/Qx5rOAkvzmRnx3116CVvQabW0pbD9ucR7kCAmmQsB2J3yE9SodQHbuzrY3XfFf
         wd6Q==
X-Forwarded-Encrypted: i=1; AHgh+RpfxlSgfCXOsp9viF3zVzRzFqB4+PtEApSP7xKMSyrmqDcCe7whb5JgS8SbnOwxIRvWd/3j+AeG/YeWshg=@vger.kernel.org
X-Gm-Message-State: AFuF++ml+/EioxzoYK2E1fqtVsfeJ/3TAAF+fEchRuqgnF87COo+uaQ0
	0kMjefx1LJgNff3hAOvpsET0XNXvrrtDeYrZgU0uAtG3DjyEhXrTlKU+hbJo23rjYHQgtCHCaaz
	yD+GiIGKbO/OyqxMzX4d04a3755yvVx+g/+TMoYeXUVTs+QwdFSXOeNKsraM=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:16ab:b0:6b1:c376:d35f with SMTP id
 006d021491bc7-6b1c629cb32mr747370eaf.0.1787856691146; Thu, 27 Aug 2026
 11:51:31 -0700 (PDT)
Date: Thu, 27 Aug 2026 11:51:31 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a908733.1d9ded08.62e62.00d8.GAE@google.com>
Subject: [syzbot] [greybus?] [usb?] KASAN: slab-out-of-bounds Write in gb_operation_message_alloc
From: syzbot <syzbot+2fd6aefc361af86911d5@syzkaller.appspotmail.com>
To: elder@kernel.org, gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org, 
	johan@kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    45c13f3f9e3b Merge tag 'hwlock-v7.3' of git://git.kernel.o..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=17ab5299580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9b0fc292fc5639c
dashboard link: https://syzkaller.appspot.com/bug?extid=2fd6aefc361af86911d5
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=137a3579580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=173ed625580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/ac6556827073/disk-45c13f3f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/01ff014f18d2/vmlinux-45c13f3f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/77e9c6302a14/bzImage-45c13f3f.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2fd6aefc361af86911d5@syzkaller.appspotmail.com

usb 4-1: invalid cport id 160 received
==================================================================
BUG: KASAN: slab-out-of-bounds in gb_operation_message_init drivers/greybus/operation.c:341 [inline]
BUG: KASAN: slab-out-of-bounds in gb_operation_message_alloc+0x26e/0x2c0 drivers/greybus/operation.c:385
Write of size 2 at addr ffff888100b7e582 by task syz.3.17/3979

CPU: 1 UID: 0 PID: 3979 Comm: syz.3.17 Not tainted syzkaller #0 PREEMPT(lazy) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
Call Trace:
 <IRQ>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x13d/0x4b0 mm/kasan/report.c:482
 kasan_report+0xdf/0x1c0 mm/kasan/report.c:595
 gb_operation_message_init drivers/greybus/operation.c:341 [inline]
 gb_operation_message_alloc+0x26e/0x2c0 drivers/greybus/operation.c:385
 gb_operation_create_common+0x9f/0x710 drivers/greybus/operation.c:532
 gb_operation_create_incoming drivers/greybus/operation.c:644 [inline]
 gb_connection_recv_request drivers/greybus/operation.c:926 [inline]
 gb_connection_recv+0x1dc/0x1050 drivers/greybus/operation.c:1063
 greybus_data_rcvd+0x244/0x600 drivers/greybus/connection.c:89
 cport_in_callback+0x1fb/0x280 drivers/greybus/es2.c:840
 __usb_hcd_giveback_urb+0x38e/0x610 drivers/usb/core/hcd.c:1657
 usb_hcd_giveback_urb+0x3ca/0x4a0 drivers/usb/core/hcd.c:1741
 dummy_timer+0xdb2/0x3700 drivers/usb/gadget/udc/dummy_hcd.c:2019
 __run_hrtimer kernel/time/hrtimer.c:2067 [inline]
 __hrtimer_run_queues+0x462/0x9c0 kernel/time/hrtimer.c:2124
 hrtimer_run_softirq+0x1ca/0x360 kernel/time/hrtimer.c:2141
 handle_softirqs+0x1d9/0x9b0 kernel/softirq.c:645
 __do_softirq kernel/softirq.c:679 [inline]
 invoke_softirq kernel/softirq.c:519 [inline]
 __irq_exit_rcu+0x192/0x210 kernel/softirq.c:767
 irq_exit_rcu+0x9/0x30 kernel/softirq.c:784
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1062 [inline]
 sysvec_apic_timer_interrupt+0x8f/0xb0 arch/x86/kernel/apic/apic.c:1062
 </IRQ>
 <TASK>
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:674
RIP: 0010:lock_acquire+0x5e/0x370 kernel/locking/lockdep.c:5890
Code: 05 4f b0 92 0b 83 f8 07 0f 87 da 00 00 00 48 0f a3 05 de da 84 09 0f 82 b1 02 00 00 8b 35 7e e8 84 09 85 f6 0f 85 c7 00 00 00 <48> 8b 44 24 30 65 48 2b 05 ed af 92 0b 0f 85 f1 02 00 00 48 83 c4
RSP: 0018:ffffc90001567328 EFLAGS: 00000206
RAX: 0000000000000046 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff89304d6c RDI: ffffffff87d29880
RBP: ffffffff898e49a0 R08: 00000000ef9d33e4 R09: 0000000000000007
R10: 0000000000000200 R11: 0000000000000000 R12: 0000000000000002
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 rcu_read_lock include/linux/rcupdate.h:849 [inline]
 class_rcu_constructor include/linux/rcupdate.h:1216 [inline]
 unwind_next_frame+0xd1/0x2090 arch/x86/kernel/unwind_orc.c:495
 arch_stack_walk+0x94/0xf0 arch/x86/kernel/stacktrace.c:25
 stack_trace_save+0x8e/0xc0 kernel/stacktrace.c:122
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 unpoison_slab_object mm/kasan/common.c:340 [inline]
 __kasan_slab_alloc+0x6e/0x70 mm/kasan/common.c:366
 kasan_slab_alloc include/linux/kasan.h:253 [inline]
 slab_post_alloc_hook mm/slub.c:4683 [inline]
 slab_alloc_node mm/slub.c:4996 [inline]
 kmem_cache_alloc_noprof+0x264/0x650 mm/slub.c:5010
 alloc_pid+0x1bd/0x1930 kernel/pid.c:188
 copy_process+0x52a8/0x8100 kernel/fork.c:2323
 kernel_clone+0x176/0x9d0 kernel/fork.c:2766
 __do_sys_clone3+0x214/0x290 kernel/fork.c:3069
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x119/0x710 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fc24a59eec9
Code: 90 b8 01 00 00 00 b9 01 00 00 00 eb ec 0f 1f 40 00 b8 ea ff ff ff 48 85 ff 74 28 48 85 d2 74 23 49 89 c8 b8 b3 01 00 00 0f 05 <48> 85 c0 7c 14 74 01 c3 31 ed 4c 89 c7 ff d2 48 89 c7 b8 3c 00 00
RSP: 002b:00007fff626e2d18 EFLAGS: 00000206 ORIG_RAX: 00000000000001b3
RAX: ffffffffffffffda RBX: 00007fc24a55a460 RCX: 00007fc24a59eec9
RDX: 00007fc24a55a460 RSI: 0000000000000058 RDI: 00007fff626e2d70
RBP: 00007fc24a3bd6c0 R08: 00007fc24a3bd6c0 R09: 00007fff626e2e57
R10: 0000000000000008 R11: 0000000000000206 R12: ffffffffffffffe8
R13: 0000000000000006 R14: 00007fff626e2d70 R15: 00007fff626e2e58
 </TASK>

Allocated by task 3979:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0x8f/0xa0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __do_kmalloc_node mm/slub.c:5414 [inline]
 __kmalloc_noprof+0x315/0x7e0 mm/slub.c:5439
 _kmalloc_noprof include/linux/slab.h:995 [inline]
 _kzalloc_noprof include/linux/slab.h:1312 [inline]
 gb_operation_message_alloc+0x9b/0x2c0 drivers/greybus/operation.c:380
 gb_operation_create_common+0x9f/0x710 drivers/greybus/operation.c:532
 gb_operation_create_incoming drivers/greybus/operation.c:644 [inline]
 gb_connection_recv_request drivers/greybus/operation.c:926 [inline]
 gb_connection_recv+0x1dc/0x1050 drivers/greybus/operation.c:1063
 greybus_data_rcvd+0x244/0x600 drivers/greybus/connection.c:89
 cport_in_callback+0x1fb/0x280 drivers/greybus/es2.c:840
 __usb_hcd_giveback_urb+0x38e/0x610 drivers/usb/core/hcd.c:1657
 usb_hcd_giveback_urb+0x3ca/0x4a0 drivers/usb/core/hcd.c:1741
 dummy_timer+0xdb2/0x3700 drivers/usb/gadget/udc/dummy_hcd.c:2019
 __run_hrtimer kernel/time/hrtimer.c:2067 [inline]
 __hrtimer_run_queues+0x462/0x9c0 kernel/time/hrtimer.c:2124
 hrtimer_run_softirq+0x1ca/0x360 kernel/time/hrtimer.c:2141
 handle_softirqs+0x1d9/0x9b0 kernel/softirq.c:645
 __do_softirq kernel/softirq.c:679 [inline]
 invoke_softirq kernel/softirq.c:519 [inline]
 __irq_exit_rcu+0x192/0x210 kernel/softirq.c:767
 irq_exit_rcu+0x9/0x30 kernel/softirq.c:784
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1062 [inline]
 sysvec_apic_timer_interrupt+0x8f/0xb0 arch/x86/kernel/apic/apic.c:1062
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:674

The buggy address belongs to the object at ffff888100b7e580
 which belongs to the cache kmalloc-8 of size 8
The buggy address is located 2 bytes inside of
 allocated 3-byte region [ffff888100b7e580, ffff888100b7e583)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x100b7e
flags: 0x200000000000000(node=0|zone=2)
page_type: f5(slab)
raw: 0200000000000000 ffff888100041500 dead000000000100 dead000000000122
raw: 0000000000000000 0000000000800080 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0xd2c00(GFP_NOIO|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 1, tgid 1 (swapper/0), ts 4953479885
 set_page_owner include/linux/page_owner.h:33 [inline]
 post_alloc_hook+0xfd/0x120 mm/page_alloc.c:1871
 prep_new_page mm/page_alloc.c:1879 [inline]
 get_page_from_freelist+0xf4b/0x3430 mm/page_alloc.c:3943
 __alloc_frozen_pages_noprof+0x2d7/0x2f70 mm/page_alloc.c:5436
 alloc_slab_page mm/slub.c:3347 [inline]
 allocate_slab mm/slub.c:3462 [inline]
 new_slab+0xa9/0x6e0 mm/slub.c:3513
 refill_objects+0xe3/0x410 mm/slub.c:7410
 refill_sheaf mm/slub.c:2885 [inline]
 __pcs_replace_empty_main+0x35e/0x650 mm/slub.c:4774
 alloc_from_pcs mm/slub.c:4850 [inline]
 slab_alloc_node mm/slub.c:4984 [inline]
 __do_kmalloc_node mm/slub.c:5413 [inline]
 __kmalloc_node_track_caller_noprof+0x634/0x820 mm/slub.c:5545
 __kmemdup_nul mm/util.c:64 [inline]
 kstrdup+0x51/0xe0 mm/util.c:84
 kstrdup_const+0x63/0x80 mm/util.c:104
 __kernfs_new_node+0x9b/0xa10 fs/kernfs/dir.c:661
 kernfs_new_node+0x117/0x150 fs/kernfs/dir.c:751
 kernfs_create_link+0xcc/0x240 fs/kernfs/symlink.c:39
 sysfs_do_create_link_sd+0x90/0x140 fs/sysfs/symlink.c:44
 sysfs_do_create_link fs/sysfs/symlink.c:80 [inline]
 sysfs_create_link+0x61/0xc0 fs/sysfs/symlink.c:92
 __add_disk+0x619/0xe40 block/genhd.c:500
 add_disk_fwnode+0x118/0x480 block/genhd.c:593
page last free pid 47 tgid 47 ts 4951179657 stack trace:
 reset_page_owner include/linux/page_owner.h:26 [inline]
 __free_pages_prepare mm/page_alloc.c:1418 [inline]
 __free_frozen_pages+0x714/0xfc0 mm/page_alloc.c:2962
 __kasan_populate_vmalloc_do mm/kasan/shadow.c:393 [inline]
 __kasan_populate_vmalloc+0x1ea/0x210 mm/kasan/shadow.c:424
 kasan_populate_vmalloc include/linux/kasan.h:580 [inline]
 alloc_vmap_area+0x95d/0x2bb0 mm/vmalloc.c:2146
 __get_vm_area_node+0x1ed/0x350 mm/vmalloc.c:3249
 __vmalloc_node_range_noprof+0x262/0x1460 mm/vmalloc.c:4065
 __vmalloc_node_noprof+0xad/0xf0 mm/vmalloc.c:4166
 alloc_thread_stack_node kernel/fork.c:359 [inline]
 dup_task_struct kernel/fork.c:930 [inline]
 copy_process+0x803/0x8100 kernel/fork.c:2133
 kernel_clone+0x176/0x9d0 kernel/fork.c:2766
 user_mode_thread+0xd1/0x120 kernel/fork.c:2843
 call_usermodehelper_exec_work kernel/umh.c:169 [inline]
 call_usermodehelper_exec_work+0xcb/0x180 kernel/umh.c:155
 process_one_work+0xac7/0x1b10 kernel/workqueue.c:3387
 process_scheduled_works kernel/workqueue.c:3470 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3551
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x69f/0xc90 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Memory state around the buggy address:
 ffff888100b7e480: 02 fc fc fc 07 fc fc fc 05 fc fc fc 07 fc fc fc
 ffff888100b7e500: 07 fc fc fc 07 fc fc fc 00 fc fc fc fa fc fc fc
>ffff888100b7e580: 03 fc fc fc 00 fc fc fc 00 fc fc fc 05 fc fc fc
                   ^
 ffff888100b7e600: 05 fc fc fc 05 fc fc fc 05 fc fc fc 05 fc fc fc
 ffff888100b7e680: 05 fc fc fc 05 fc fc fc 02 fc fc fc 02 fc fc fc
==================================================================
----------------
Code disassembly (best guess):
   0:	05 4f b0 92 0b       	add    $0xb92b04f,%eax
   5:	83 f8 07             	cmp    $0x7,%eax
   8:	0f 87 da 00 00 00    	ja     0xe8
   e:	48 0f a3 05 de da 84 	bt     %rax,0x984dade(%rip)        # 0x984daf4
  15:	09
  16:	0f 82 b1 02 00 00    	jb     0x2cd
  1c:	8b 35 7e e8 84 09    	mov    0x984e87e(%rip),%esi        # 0x984e8a0
  22:	85 f6                	test   %esi,%esi
  24:	0f 85 c7 00 00 00    	jne    0xf1
* 2a:	48 8b 44 24 30       	mov    0x30(%rsp),%rax <-- trapping instruction
  2f:	65 48 2b 05 ed af 92 	sub    %gs:0xb92afed(%rip),%rax        # 0xb92b024
  36:	0b
  37:	0f 85 f1 02 00 00    	jne    0x32e
  3d:	48                   	rex.W
  3e:	83                   	.byte 0x83
  3f:	c4                   	.byte 0xc4


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
