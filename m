Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E6149739C
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792155426; cv=none; b=EvoNvVBurrCFKruoEiH9V4WecRW00wMKduA47wnIpCCgRCzlN4RxIm1asRqGQXYIKpQjWsF4r2m4XaMOXK7rLlJe8VIul3FwLbuN+1cMB4t8HARGOI3a2l8OfWd/4xEbrR2n6vATjoE6JnzQpEf0AqRKIwOVTs/LaSl9VC//ajE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792155426; c=relaxed/simple;
	bh=Ekjb4RAaTmxoa0IO6rlRf3a8/4fB0wmQGaAUCFBV+Ik=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=LZUfesdg4+fzIkX5KRubJMQLQfu6FK6XXU/tu4uhwQvo2VjkFgl22gj/vSnDduZe0uF1XEmbKjpxsjdZI42EvFEoJk2BZKVKIAacGUNf/8fnsR+KzkSMxmggss8lOCceLfC6i62XDf3ZjtHd/2iIchcr76zHyXhMUvLlPJktMSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4fb73e868aaso9011274b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:57:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792155423; x=1792760223;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4IAbPQgjRyg7z5Dw5BylhZDG8VRv1LKZBcfZP/RHIYs=;
        b=VeroYjOleCa8D2wdwPxqR4xntDlxP6j/+gl46aa408v+C47wHczZR4t337hX8UyTbV
         XK8xBYnuB8HfMM81fyp5AHPR7VRs46Qq2V4tc9DwOTC13n5aX2sJ/bal2M00LT6W1m1e
         rQDVekd4RlzyIPApMJ7/GFJZ6+1pzWXSQgPBHGSIs9kSW06w7LRREkskx5EKEGnVj8Kk
         grQowo6oCDE3Sve5uCovtm+A7rL4nbHQn+nioVh89KZin6FzuLL0NToJW38QfMAuHTO/
         9jsxNFGcJAcBI3y6DY21d6yJZgzIleRPbZPdv72k4dIXBoeqQbxPZuoQAd0FHDt+/03/
         EFmg==
X-Gm-Message-State: AFq9FYJr+AgJHmus4n9rFCocC6c9pthvE/0G57qxtrPc/CN5DyONxrxQ
	V7wBO6f5zcveKrDuLPXcpm/+/zHBys0KqdnX+71Q5YYdwdodXPdpizOdUVk7UgbYu+qvhkWfx9w
	HtyR8eUj7k8ABLemuUPcnVg1LQpX8ida5InlV/dSNgdFoBdm4k1erCOjiDrY=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1b97:b0:4f3:e98f:fa0b with SMTP id
 5614622812f47-50c556bc9d7mr21719980b6e.5.1792155423389; Fri, 16 Oct 2026
 05:57:03 -0700 (PDT)
Date: Fri, 16 Oct 2026 05:57:03 -0700
In-Reply-To: <CABKbRoLOWKRt4bztv6eg93b6B304n3J7J=tDEXLgtkqsL0aXgw@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad21f1f.7952420f.283480.023e.GAE@google.com>
Subject: Re: [syzbot] [net?] KASAN: slab-use-after-free Read in llc_conn_ac_send_sabme_cmd_p_set_x
From: syzbot <syzbot+44efda9647c52be29d9c@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, miguelgarciaroman8@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
KASAN: slab-use-after-free Read in llc_conn_ac_send_sabme_cmd_p_set_x

llc_process_tmr_ev: timer called on closed connection
==================================================================
BUG: KASAN: slab-use-after-free in llc_conn_ac_send_sabme_cmd_p_set_x+0x442/0x470 net/llc/llc_c_ac.c:782
Read of size 1 at addr ffff888036088010 by task syz-executor394/6049

CPU: 2 UID: 0 PID: 6049 Comm: syz-executor394 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <IRQ>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x13d/0x4b0 mm/kasan/report.c:482
 kasan_report+0xdf/0x1c0 mm/kasan/report.c:595
 llc_conn_ac_send_sabme_cmd_p_set_x+0x442/0x470 net/llc/llc_c_ac.c:782
 llc_exec_conn_trans_actions net/llc/llc_conn.c:437 [inline]
 llc_conn_service net/llc/llc_conn.c:362 [inline]
 llc_conn_state_process+0x3ec/0x1480 net/llc/llc_conn.c:66
 llc_process_tmr_ev net/llc/llc_c_ac.c:1442 [inline]
 llc_conn_tmr_common_cb+0x2d4/0x880 net/llc/llc_c_ac.c:1325
 call_timer_fn+0x198/0x5f0 kernel/time/timer.c:1748
 expire_timers kernel/time/timer.c:1799 [inline]
 __run_timers+0x757/0xb00 kernel/time/timer.c:2374
 __run_timer_base kernel/time/timer.c:2386 [inline]
 __run_timer_base kernel/time/timer.c:2378 [inline]
 run_timer_base+0x114/0x190 kernel/time/timer.c:2395
 run_timer_softirq+0x1a/0x50 kernel/time/timer.c:2405
 handle_softirqs+0x1e6/0x9d0 kernel/softirq.c:645
 __do_softirq kernel/softirq.c:679 [inline]
 invoke_softirq kernel/softirq.c:519 [inline]
 __irq_exit_rcu+0x16a/0x210 kernel/softirq.c:758
 irq_exit_rcu+0x9/0x30 kernel/softirq.c:775
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1062 [inline]
 sysvec_apic_timer_interrupt+0xa3/0xc0 arch/x86/kernel/apic/apic.c:1062
 </IRQ>
 <TASK>
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:674
RIP: 0010:lock_acquire+0x5e/0x380 kernel/locking/lockdep.c:5947
Code: 05 8f ce a5 12 83 f8 07 0f 87 da 00 00 00 48 0f a3 05 9e e2 5d 0f 0f 82 c9 02 00 00 8b 35 3e 14 5e 0f 85 f6 0f 85 c7 00 00 00 <48> 8b 44 24 30 65 48 2b 05 2d ce a5 12 0f 85 09 03 00 00 48 83 c4
RSP: 0018:ffffc90005217830 EFLAGS: 00000206
RAX: 0000000000000046 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff8e36a0a0 RDI: ffffffff8c624080
RBP: ffffffff8edec5e0 R08: 00000000ef9d33e4 R09: 0000000000000007
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
 poison_kmalloc_redzone mm/kasan/common.c:409 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:426
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __do_kmalloc_node mm/slub.c:5414 [inline]
 __kmalloc_noprof+0x32f/0x840 mm/slub.c:5439
 _kmalloc_noprof include/linux/slab.h:995 [inline]
 sk_prot_alloc+0x10b/0x2a0 net/core/sock.c:2252
 sk_alloc+0x36/0xe80 net/core/sock.c:2308
 llc_sk_alloc+0x32/0x4c0 net/llc/llc_conn.c:925
 llc_ui_create+0xeb/0x440 net/llc/af_llc.c:180
 __sock_create+0x339/0x860 net/socket.c:1676
 sock_create net/socket.c:1734 [inline]
 __sys_socket_create net/socket.c:1771 [inline]
 __sys_socket+0x14d/0x260 net/socket.c:1818
 __do_sys_socket net/socket.c:1832 [inline]
 __se_sys_socket net/socket.c:1830 [inline]
 __x64_sys_socket+0x72/0xb0 net/socket.c:1830
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fcea0c8bcc7
Code: f0 ff ff 77 06 c3 0f 1f 44 00 00 48 c7 c2 d0 ff ff ff f7 d8 64 89 02 b8 ff ff ff ff c3 66 0f 1f 44 00 00 b8 29 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 d0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fce9dc4f1a8 EFLAGS: 00000246 ORIG_RAX: 0000000000000029
RAX: ffffffffffffffda RBX: 0000000000000008 RCX: 00007fcea0c8bcc7
RDX: 0000000000000000 RSI: 0000000000000001 RDI: 000000000000001a
RBP: 00000000000011db R08: 0000000000000000 R09: 000000000000005f
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000007
R13: 0000000000000022 R14: 0000000088888889 R15: 00000000000000be
 </TASK>

Allocated by task 6047:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:409 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:426
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __kmalloc_cache_noprof+0x2f8/0x6d0 mm/slub.c:5563
 _kmalloc_noprof include/linux/slab.h:991 [inline]
 _kzalloc_noprof include/linux/slab.h:1312 [inline]
 llc_sap_alloc net/llc/llc_core.c:29 [inline]
 llc_sap_open+0x120/0x3b0 net/llc/llc_core.c:96
 llc_ui_bind+0xb67/0xe40 net/llc/af_llc.c:386
 __sys_bind_socket net/socket.c:1945 [inline]
 __sys_bind_socket net/socket.c:1937 [inline]
 __sys_bind+0x1a9/0x260 net/socket.c:1976
 __do_sys_bind net/socket.c:1981 [inline]
 __se_sys_bind net/socket.c:1979 [inline]
 __x64_sys_bind+0x72/0xb0 net/socket.c:1979
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 6049:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 kasan_save_free_info+0x3b/0x70 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:264 [inline]
 __kasan_slab_free+0x5f/0x80 mm/kasan/common.c:296
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2748 [inline]
 __rcu_free_sheaf_prepare+0x5d/0x300 mm/slub.c:3009
 rcu_free_sheaf+0x1a/0xe0 mm/slub.c:6061
 rcu_do_batch kernel/rcu/tree.c:2650 [inline]
 rcu_core+0x5f0/0x1260 kernel/rcu/tree.c:2919
 handle_softirqs+0x1e6/0x9d0 kernel/softirq.c:645
 do_softirq kernel/softirq.c:546 [inline]
 do_softirq+0xaf/0xf0 kernel/softirq.c:533
 __local_bh_enable_ip+0xff/0x120 kernel/softirq.c:473
 spin_unlock_bh include/linux/spinlock.h:407 [inline]
 llc_sap_open+0xcb/0x3b0 net/llc/llc_core.c:103
 llc_ui_bind+0xb67/0xe40 net/llc/af_llc.c:386
 __sys_bind_socket net/socket.c:1945 [inline]
 __sys_bind_socket net/socket.c:1937 [inline]
 __sys_bind+0x1a9/0x260 net/socket.c:1976
 __do_sys_bind net/socket.c:1981 [inline]
 __se_sys_bind net/socket.c:1979 [inline]
 __x64_sys_bind+0x72/0xb0 net/socket.c:1979
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff888036088000
 which belongs to the cache kmalloc-2k of size 2048
The buggy address is located 16 bytes inside of
 freed 2048-byte region [ffff888036088000, ffff888036088800)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffff88803608c000 pfn:0x36088
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000240(workingset|head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000240 ffff88801c042f00 ffffea000098b810 ffffea0000aaf410
raw: ffff88803608c000 0000000000080007 00000000f5000000 0000000000000000
head: 00fff00000000240 ffff88801c042f00 ffffea000098b810 ffffea0000aaf410
head: ffff88803608c000 0000000000080007 00000000f5000000 0000000000000000
head: 00fff00000000003 fffffffffffffe01 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd2820(GFP_ATOMIC|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 6045, tgid 6041 (syz-executor394), ts 73343557269
 set_page_owner include/linux/page_owner.h:33 [inline]
 post_alloc_hook+0xfd/0x120 mm/page_alloc.c:1871
 prep_new_page mm/page_alloc.c:1879 [inline]
 get_page_from_freelist+0x110d/0x35d0 mm/page_alloc.c:3943
 __alloc_frozen_pages_noprof+0x2eb/0x3300 mm/page_alloc.c:5436
 alloc_slab_page mm/slub.c:3347 [inline]
 allocate_slab mm/slub.c:3462 [inline]
 new_slab+0xa9/0x6e0 mm/slub.c:3513
 refill_objects+0xe3/0x410 mm/slub.c:7418
 refill_sheaf mm/slub.c:2885 [inline]
 __pcs_replace_empty_main+0x35e/0x650 mm/slub.c:4774
 alloc_from_pcs mm/slub.c:4850 [inline]
 slab_alloc_node mm/slub.c:4984 [inline]
 __kmalloc_cache_noprof+0x4f4/0x6d0 mm/slub.c:5559
 _kmalloc_noprof include/linux/slab.h:991 [inline]
 _kzalloc_noprof include/linux/slab.h:1312 [inline]
 llc_sap_alloc net/llc/llc_core.c:29 [inline]
 llc_sap_open+0x120/0x3b0 net/llc/llc_core.c:96
 llc_ui_bind+0xb67/0xe40 net/llc/af_llc.c:386
 __sys_bind_socket net/socket.c:1945 [inline]
 __sys_bind_socket net/socket.c:1937 [inline]
 __sys_bind+0x1a9/0x260 net/socket.c:1976
 __do_sys_bind net/socket.c:1981 [inline]
 __se_sys_bind net/socket.c:1979 [inline]
 __x64_sys_bind+0x72/0xb0 net/socket.c:1979
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
page last free pid 6051 tgid 6041 ts 73290619137 stack trace:
 reset_page_owner include/linux/page_owner.h:26 [inline]
 __free_pages_prepare mm/page_alloc.c:1418 [inline]
 __free_frozen_pages+0x79f/0x10f0 mm/page_alloc.c:2962
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x47/0xf0 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x1a0/0x1f0 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x69/0x90 mm/kasan/common.c:361
 kasan_slab_alloc include/linux/kasan.h:253 [inline]
 slab_post_alloc_hook mm/slub.c:4683 [inline]
 slab_alloc_node mm/slub.c:4996 [inline]
 kmem_cache_alloc_lru_noprof+0x265/0x6a0 mm/slub.c:5029
 sock_alloc_inode+0x26/0x2c0 net/socket.c:330
 alloc_inode+0x68/0x250 fs/inode.c:338
 new_inode_pseudo include/linux/fs.h:3047 [inline]
 sock_alloc+0x44/0x280 net/socket.c:710
 __sock_create+0xc2/0x860 net/socket.c:1640
 sock_create net/socket.c:1734 [inline]
 __sys_socket_create net/socket.c:1771 [inline]
 __sys_socket+0x14d/0x260 net/socket.c:1818
 __do_sys_socket net/socket.c:1832 [inline]
 __se_sys_socket net/socket.c:1830 [inline]
 __x64_sys_socket+0x72/0xb0 net/socket.c:1830
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffff888036087f00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff888036087f80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff888036088000: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                         ^
 ffff888036088080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888036088100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================
----------------
Code disassembly (best guess):
   0:	05 8f ce a5 12       	add    $0x12a5ce8f,%eax
   5:	83 f8 07             	cmp    $0x7,%eax
   8:	0f 87 da 00 00 00    	ja     0xe8
   e:	48 0f a3 05 9e e2 5d 	bt     %rax,0xf5de29e(%rip)        # 0xf5de2b4
  15:	0f
  16:	0f 82 c9 02 00 00    	jb     0x2e5
  1c:	8b 35 3e 14 5e 0f    	mov    0xf5e143e(%rip),%esi        # 0xf5e1460
  22:	85 f6                	test   %esi,%esi
  24:	0f 85 c7 00 00 00    	jne    0xf1
* 2a:	48 8b 44 24 30       	mov    0x30(%rsp),%rax <-- trapping instruction
  2f:	65 48 2b 05 2d ce a5 	sub    %gs:0x12a5ce2d(%rip),%rax        # 0x12a5ce64
  36:	12
  37:	0f 85 09 03 00 00    	jne    0x346
  3d:	48                   	rex.W
  3e:	83                   	.byte 0x83
  3f:	c4                   	.byte 0xc4


Tested on:

commit:         2f2f7eee Merge tag 'soc-fixes-7.3-3' of git://git.kern..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=10661621580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=929e4854a828f434
dashboard link: https://syzkaller.appspot.com/bug?extid=44efda9647c52be29d9c
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Note: no patches were applied.
