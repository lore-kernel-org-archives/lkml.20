Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792576865;
	b=q6VJiWCXfP2OIiaLKqlO1FWnPj0DZsJuaGG4v6GBzhmA5rDcAWxtnZF15mt742cjCCWf
	 QNp0eBzIQ18+WQnBJVwxd+tks8MDtETe+lOVRQDfooTbdogshofeoK/TGRm+NzFOSpRQ/
	 9J1hFe8QTpcaDM+VwkmQD+msWhnI0r6U0B0fBRFfrlFA4FaC2Ygh9thb39vsHXzmipkgU
	 VvuoiKI4pZWoIhSC0u+3YrH/yfiJ46zXN4XKnmqIh+Srs2JVycrlf1jVncRHBkFHmf6FP
	 itfLVlz9fHW9SwkoZ9bV7fUTjbtxPXbom8rhfztEEn+VvDJbtHVmu2JPqVBzcpR7VEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792576865;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=pLwlr7BD4cf/Gkt4YkMIjed+iioPUQ45wxGYtUoTPDI=;
	b=Bp7kZZqnkNTOMuPLmg5WqsvDc2ImRgr/jLXfTOe6dDC8TkhZ3Zg12SZ5ts4a7huIKinW
	 Fnv6wNUKLPcgSvlH5kOWysIcuB/SAIOjeRyHS9MKEuj1ejdENZ7oA3ztk23B097lBJFZb
	 wTSjIBLaqek5QFDemQhpvQgAa/X0uLCuMIfcXjhCW7CdecnoD8+lIUh7jnKgxzrQSYeuy
	 FjYtzdizRvWVZpO5zxdbKGwga3IdEtblDirbtUnN7yVD9t5N0IXd8GDG/c6GnFEUJ5QNf
	 K8Qnz0PGziQVpqfRkzoLd3PRBWjU6wwGPenzA1eteVg7lB/1ovU0F+sZPZiW579dUYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE11606A320
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:01:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BE11606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b37620eb73so840685b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:01:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792576864; x=1793181664;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pLwlr7BD4cf/Gkt4YkMIjed+iioPUQ45wxGYtUoTPDI=;
        b=KYSpMZsB+ENkh1+35i4BjTc/a7eM+dkGHx00nBWmvMaHwNVwKpZR99MvapdiJwOU33
         ALQqsmo8m4VjZJ6G/WTHldQkndLN04hFAIVedhGP6tT0sbPTmj2r/6vc0zEArF+JsFS2
         1R7KMQzqw4uBtVtjLB8Y/gNaR5hDS5mZEVbQ+V3/fcS6BJ6q4qMro9bNq6qB2pt8Ix9v
         +Uu0tt+0CLjGq8tIkKJSufrVdVpNTuXKxlBSE6ZQHnpGaklAX1Xef7X5KkI5NydFaIhb
         UohAF1fKINOTgEuT1bjILLOhoMu/cuYAoBxco2cfkqVjVCQxUeVi0nPkLjS4c+hIQhIR
         X5+Q==
X-Gm-Message-State: AFq9FYJMqL1sLyKvFi+B1rWeeUI+woeaJpjAibZ7YsFbqzpzGOSuYDZN
	JJwHO5zb0f94cKyzKV+OFozfc2MpcOg1EE12q14wpwqV7chTqQ6nPvvVK+kR8mVpcSYIkV5G07N
	BT9f5AO4dL//20OOid/jiKnF7QUEV0rDFg2P72zSJuQgPsdNOIYSqJNYETXU=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:6808:b0:4f5:77f:5 with SMTP id
 5614622812f47-5535be91552mr876441b6e.41.1792576863876; Wed, 21 Oct 2026
 03:01:03 -0700 (PDT)
Date: Wed, 21 Oct 2026 03:01:03 -0700
In-Reply-To: <877bjbtpi8.fsf@toke.dk>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad88d5f.5c73e770.1a06c9.0142.GAE@google.com>
Subject: Re: [syzbot] [wireless?] KASAN: slab-use-after-free Read in tasklet_action_common
From: syzbot <syzbot+e91dc13b1b37759b3d9f@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	toke@toke.dk
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
KASAN: slab-use-after-free Read in tasklet_action_common

==================================================================
BUG: KASAN: slab-use-after-free in tasklet_action_common+0x103/0x490 kernel/softirq.c:954
Read of size 8 at addr ffff888032f6b158 by task ksoftirqd/1/23

CPU: 1 UID: 0 PID: 23 Comm: ksoftirqd/1 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/07/2026
Call Trace:
 <IRQ>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description+0x55/0x1e0 mm/kasan/report.c:378
 print_report+0x58/0x70 mm/kasan/report.c:482
 kasan_report+0x117/0x150 mm/kasan/report.c:595
 tasklet_action_common+0x103/0x490 kernel/softirq.c:954
 handle_softirqs+0x226/0x860 kernel/softirq.c:645
 __do_softirq kernel/softirq.c:679 [inline]
 invoke_softirq kernel/softirq.c:519 [inline]
 __irq_exit_rcu+0xcb/0x220 kernel/softirq.c:758
 irq_exit_rcu+0x9/0x30 kernel/softirq.c:775
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1062 [inline]
 sysvec_apic_timer_interrupt+0xa6/0xc0 arch/x86/kernel/apic/apic.c:1062
 </IRQ>
 <TASK>
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:674
RIP: 0010:finish_task_switch+0x413/0xc60 kernel/sched/core.c:5434
Code: 04 00 00 41 c7 84 24 20 0e 00 00 00 00 00 00 0f 1f 44 00 00 49 83 c4 48 4c 89 e7 e8 d7 61 56 0a e8 52 42 3a 00 fb 4c 8b 65 c8 <49> 8d bc 24 18 17 00 00 48 89 f8 48 c1 e8 03 42 0f b6 04 30 84 c0
RSP: 0018:ffffc900001d7aa0 EFLAGS: 00000206
RAX: 00000000008dcaf3 RBX: ffff8880b873cbe0 RCX: 8000000000000001
RDX: 0000000000000000 RSI: ffffffff8e41c2b1 RDI: ffffffff8c6dca80
RBP: ffffc900001d7af0 R08: ffffffff907a75bf R09: 1ffffffff20f4eb7
R10: dffffc0000000000 R11: fffffbfff20f4eb8 R12: ffff88801e688000
R13: ffff88801e688000 R14: dffffc0000000000 R15: 1ffff110170e797c
 context_switch kernel/sched/core.c:5586 [inline]
 __schedule+0x17e5/0x5820 kernel/sched/core.c:7382
 preempt_schedule_common+0x7f/0xd0 kernel/sched/core.c:7561
 preempt_schedule_thunk+0x16/0x40 arch/x86/entry/thunk.S:12
 smpboot_thread_fn+0x6ac/0xb30 kernel/smpboot.c:161
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Allocated by task 5675:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:409 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:426
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __kmalloc_cache_noprof+0x31c/0x600 mm/slub.c:5563
 _kmalloc_noprof include/linux/slab.h:991 [inline]
 _kzalloc_noprof include/linux/slab.h:1312 [inline]
 ath9k_init_wmi+0x4f/0x2b0 drivers/net/wireless/ath/ath9k/wmi.c:95
 ath9k_htc_probe_device+0x1e5/0x2370 drivers/net/wireless/ath/ath9k/htc_drv_init.c:956
 ath9k_htc_hw_init+0x32/0x70 drivers/net/wireless/ath/ath9k/htc_hst.c:532
 ath9k_hif_usb_firmware_cb+0x214/0x4b0 drivers/net/wireless/ath/ath9k/hif_usb.c:1255
 request_firmware_work_func+0xf7/0x2d0 drivers/base/firmware_loader/main.c:1164
 process_one_work kernel/workqueue.c:3396 [inline]
 process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3479
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3560
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Freed by task 5675:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 kasan_save_free_info+0x40/0x50 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:264 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:296
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2748 [inline]
 slab_free mm/slub.c:6509 [inline]
 kfree+0x1c5/0x650 mm/slub.c:6802
 ath9k_htc_probe_device+0x11a9/0x2370 drivers/net/wireless/ath/ath9k/htc_drv_init.c:978
 ath9k_htc_hw_init+0x32/0x70 drivers/net/wireless/ath/ath9k/htc_hst.c:532
 ath9k_hif_usb_firmware_cb+0x214/0x4b0 drivers/net/wireless/ath/ath9k/hif_usb.c:1255
 request_firmware_work_func+0xf7/0x2d0 drivers/base/firmware_loader/main.c:1164
 process_one_work kernel/workqueue.c:3396 [inline]
 process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3479
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3560
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

The buggy address belongs to the object at ffff888032f6b000
 which belongs to the cache kmalloc-2k of size 2048
The buggy address is located 344 bytes inside of
 freed 2048-byte region [ffff888032f6b000, ffff888032f6b800)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x32f68
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88801b042000 dead000000000100 dead000000000122
raw: 0000000000000000 0000000000080008 00000000f5000000 0000000000000000
head: 00fff00000000040 ffff88801b042000 dead000000000100 dead000000000122
head: 0000000000000000 0000000000080008 00000000f5000000 0000000000000000
head: 00fff00000000003 fffffffffffffe01 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 203, tgid 203 (kworker/u8:6), ts 127967665812
 set_page_owner include/linux/page_owner.h:33 [inline]
 post_alloc_hook+0x1f9/0x250 mm/page_alloc.c:1871
 prep_new_page mm/page_alloc.c:1879 [inline]
 get_page_from_freelist+0x2209/0x2280 mm/page_alloc.c:3943
 __alloc_frozen_pages_noprof+0x217/0x5a0 mm/page_alloc.c:5436
 alloc_slab_page mm/slub.c:3347 [inline]
 allocate_slab+0x7d/0x620 mm/slub.c:3462
 new_slab mm/slub.c:3513 [inline]
 refill_objects+0x2d5/0x350 mm/slub.c:7418
 refill_sheaf mm/slub.c:2885 [inline]
 __pcs_replace_empty_main+0x2c8/0x6c0 mm/slub.c:4774
 alloc_from_pcs mm/slub.c:4850 [inline]
 slab_alloc_node mm/slub.c:4984 [inline]
 __do_kmalloc_node mm/slub.c:5413 [inline]
 __kmalloc_node_track_caller_noprof+0x543/0x720 mm/slub.c:5545
 kmalloc_reserve net/core/skbuff.c:637 [inline]
 __alloc_skb+0x2c1/0x7a0 net/core/skbuff.c:715
 alloc_skb include/linux/skbuff.h:1384 [inline]
 mld_newpack+0x165/0xcb0 net/ipv6/mcast.c:1810
 add_grhead net/ipv6/mcast.c:1921 [inline]
 add_grec+0x119f/0x19d0 net/ipv6/mcast.c:2060
 mld_send_initial_cr+0x288/0x550 net/ipv6/mcast.c:2305
 ipv6_mc_dad_complete+0x87/0x410 net/ipv6/mcast.c:2316
 addrconf_dad_completed+0x8af/0xe60 net/ipv6/addrconf.c:4376
 addrconf_dad_work+0xcf8/0x15c0 net/ipv6/addrconf.c:-1
 process_one_work kernel/workqueue.c:3396 [inline]
 process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3479
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3560
page last free pid 6268 tgid 6268 ts 124939507899 stack trace:
 reset_page_owner include/linux/page_owner.h:26 [inline]
 __free_pages_prepare mm/page_alloc.c:1418 [inline]
 __free_frozen_pages+0xc93/0xd90 mm/page_alloc.c:2962
 __slab_free+0x274/0x2c0 mm/slub.c:5823
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x99/0x100 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x148/0x160 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x22/0x80 mm/kasan/common.c:361
 kasan_slab_alloc include/linux/kasan.h:253 [inline]
 slab_post_alloc_hook mm/slub.c:4683 [inline]
 slab_alloc_node mm/slub.c:4996 [inline]
 kmem_cache_alloc_noprof+0x2b4/0x600 mm/slub.c:5010
 anon_vma_chain_alloc mm/rmap.c:142 [inline]
 __anon_vma_prepare+0xbe/0x4d0 mm/rmap.c:194
 __vmf_anon_prepare mm/memory.c:3961 [inline]
 vmf_anon_prepare mm/internal.h:569 [inline]
 do_anonymous_page mm/memory.c:5478 [inline]
 do_pte_missing+0x2f18/0x34b0 mm/memory.c:4698
 handle_pte_fault mm/memory.c:6558 [inline]
 __handle_mm_fault mm/memory.c:6707 [inline]
 handle_mm_fault+0x1a53/0x3750 mm/memory.c:6876
 do_user_addr_fault+0xb35/0x1480 arch/x86/mm/fault.c:1343
 handle_page_fault arch/x86/mm/fault.c:1483 [inline]
 exc_page_fault+0x6a/0xc0 arch/x86/mm/fault.c:1536
 asm_exc_page_fault+0x26/0x30 arch/x86/include/asm/idtentry.h:595

Memory state around the buggy address:
 ffff888032f6b000: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888032f6b080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff888032f6b100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                                    ^
 ffff888032f6b180: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888032f6b200: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================
----------------
Code disassembly (best guess), 1 bytes skipped:
   0:	00 00                	add    %al,(%rax)
   2:	41 c7 84 24 20 0e 00 	movl   $0x0,0xe20(%r12)
   9:	00 00 00 00 00
   e:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  13:	49 83 c4 48          	add    $0x48,%r12
  17:	4c 89 e7             	mov    %r12,%rdi
  1a:	e8 d7 61 56 0a       	call   0xa5661f6
  1f:	e8 52 42 3a 00       	call   0x3a4276
  24:	fb                   	sti
  25:	4c 8b 65 c8          	mov    -0x38(%rbp),%r12
* 29:	49 8d bc 24 18 17 00 	lea    0x1718(%r12),%rdi <-- trapping instruction
  30:	00
  31:	48 89 f8             	mov    %rdi,%rax
  34:	48 c1 e8 03          	shr    $0x3,%rax
  38:	42 0f b6 04 30       	movzbl (%rax,%r14,1),%eax
  3d:	84 c0                	test   %al,%al


Tested on:

commit:         a804c574 Merge tag 'lsm-pr-20261016' of git://git.kern..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=104e4f01580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5a37d7227c6a6352
dashboard link: https://syzkaller.appspot.com/bug?extid=e91dc13b1b37759b3d9f
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8

Note: no patches were applied.
