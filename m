Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980CF3B6379
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 09:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791279012; cv=none; b=ojj5bfnSSL0VjtBt2WjX+MfBgC9tdZ86UPvQLa1XrXBiVQb0BJJcH8BIiWXkcSVFMa276QLe/Usq+BSp+/l6wIL45QyzJC2NoxKH/T0KzDwpJfQG7kIc1EF4YUWzSCX9oijUaMX68tAP1G5ufyBuO3eqeLFFKRb3ZbHhfp4Y/5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791279012; c=relaxed/simple;
	bh=4vz0yg+tm3P0F+O6a0pf4fzqKXJIa8kCEtNgyfQGRIk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=CMKCzVaKkP4+nbN49ptzB1YgC+7wD2UVcuIRCxzmW7GFUvUxrXppKQblSFtpq17OOWf/LBYi3tIYIl+p2YTVWC3uVUH99Nu38E0UPpZnEaM9ncg9lxlQv9je5Yf3Y3vjHAiAdT1kLrIQ2/DCWFrRp5U+CC2RNekRrTwJVkfKAp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b597558c4cso4310703b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 02:30:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791279009; x=1791883809;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=O42IFvvxEdF9t6SbbLrXy6fFcYfgQqt+vXQ6iLzd7r0=;
        b=fxW8rpZutLBWaz3RMyWF64UtdkubiBl2adD53zbV2N+itINy6KfelfJRiAkTAYZ3wi
         mx/2YtDL1iI8qaFs/N8y2gsyjtVbOPZYPU9kW72YxQL+baBltGRVcCS5AqcKavyrY35f
         v1uvHQRpihcWn1ZtuHuR9S1VfbZ2hIfT95UpLbTnkNWHvICCO4W8839PgQBPD7akjfPS
         5Ej8bGfb6hT8xWqOWrD46EzpNU0oWK1rC5egDbtSHuUYDWNKcKKlxrGCcV3+o1eE0Lhm
         GD6upqmutZaVReM4I7NAb24EJO7pJjnjphtp441+eDyWzOfbmBYZWdp6TXcEuNFlVaGt
         hPtg==
X-Gm-Message-State: AFuF++mxegkwN7n951ID3s7F25vJFwWTjOIm2jlnVqcW6f60FUUMOaSA
	37/DSMC2vMDHmXFhDW1+E+KJPKwRIkauCrr8WoJqx5BbpuU1+dbktf2W6hgtDp6D9FzmMpbsRNC
	lyTVlKNs5XscWHUI3fXgnDHgj6SmOzOQbnXL93wFsUsiBg9jUnfV/PFwZHG0=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:50aa:b0:4f8:716d:793e with SMTP id
 5614622812f47-4fb40da0aaemr853642b6e.46.1791279009400; Tue, 06 Oct 2026
 02:30:09 -0700 (PDT)
Date: Tue, 06 Oct 2026 02:30:09 -0700
In-Reply-To: <00000000000068ed3b060a0f1517@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac4bfa1.fe639fcc.32b100.0001.GAE@google.com>
Subject: Forwarded: Re: [syzbot] [mm?] BUG: spinlock recursion in try_to_wake_up
From: syzbot <syzbot+6f49826383204e367d67@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: Re: [syzbot] [mm?] BUG: spinlock recursion in try_to_wake_up
Author: ebiggers@kernel.org

On Mon, Nov 13, 2023 at 01:09:20PM -0800, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    6bc986ab839c Merge tag 'nfs-for-6.7-1' of git://git.linux-..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=163b5f90e80000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=cd456c5e6582895e
> dashboard link: https://syzkaller.appspot.com/bug?extid=6f49826383204e367d67
> compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15b34e04e80000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1308dc0f680000
> 
> Downloadable assets:
> disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7bc7510fe41f/non_bootable_disk-6bc986ab.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/3ff7887a8f39/vmlinux-6bc986ab.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/60418843207c/bzImage-6bc986ab.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+6f49826383204e367d67@syzkaller.appspotmail.com
> 
> BUG: spinlock recursion on CPU#0, syz-executor110/7601
>  lock: 0xffff88806b63c740, .magic: dead4ead, .owner: syz-executor110/7601, .owner_cpu: 1
> CPU: 0 PID: 7601 Comm: syz-executor110 Tainted: G      D            6.6.0-syzkaller-15494-g6bc986ab839c #0
> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
> Call Trace:
>  <IRQ>
>  __dump_stack lib/dump_stack.c:88 [inline]
>  dump_stack_lvl+0xd9/0x1b0 lib/dump_stack.c:106
>  debug_spin_lock_before kernel/locking/spinlock_debug.c:86 [inline]
>  do_raw_spin_lock+0x237/0x2b0 kernel/locking/spinlock_debug.c:114
>  raw_spin_rq_lock_nested kernel/sched/core.c:566 [inline]
>  raw_spin_rq_lock_nested+0x7e/0x130 kernel/sched/core.c:551
>  raw_spin_rq_lock kernel/sched/sched.h:1349 [inline]
>  rq_lock kernel/sched/sched.h:1663 [inline]
>  ttwu_queue kernel/sched/core.c:4019 [inline]
>  try_to_wake_up+0x654/0x15d0 kernel/sched/core.c:4342
>  kick_pool+0x253/0x460 kernel/workqueue.c:1142
>  __queue_work+0x5d9/0x1050 kernel/workqueue.c:1800
>  call_timer_fn+0x193/0x580 kernel/time/timer.c:1700
>  expire_timers kernel/time/timer.c:1746 [inline]
>  __run_timers+0x585/0xb10 kernel/time/timer.c:2022
>  run_timer_softirq+0x58/0xd0 kernel/time/timer.c:2035
>  __do_softirq+0x21a/0x968 kernel/softirq.c:553
>  invoke_softirq kernel/softirq.c:427 [inline]
>  __irq_exit_rcu kernel/softirq.c:632 [inline]
>  irq_exit_rcu+0xb7/0x120 kernel/softirq.c:644
>  sysvec_apic_timer_interrupt+0x93/0xc0 arch/x86/kernel/apic/apic.c:1076
>  </IRQ>
>  <TASK>
>  asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:645
> RIP: 0010:lock_acquire+0x1ef/0x510 kernel/locking/lockdep.c:5721
> Code: c1 05 8d 88 9a 7e 83 f8 01 0f 85 b0 02 00 00 9c 58 f6 c4 02 0f 85 9b 02 00 00 48 85 ed 74 01 fb 48 b8 00 00 00 00 00 fc ff df <48> 01 c3 48 c7 03 00 00 00 00 48 c7 43 08 00 00 00 00 48 8b 84 24
> RSP: 0018:ffffc9000b427420 EFLAGS: 00000206
> RAX: dffffc0000000000 RBX: 1ffff92001684e86 RCX: 0000000000000001
> RDX: 1ffff1100526d3a7 RSI: ffffffff8accaca0 RDI: ffffffff8b2ec600
> RBP: 0000000000000200 R08: 0000000000000000 R09: fffffbfff23e25d8
> R10: ffffffff91f12ec7 R11: dffffc0000000000 R12: 0000000000000001
> R13: 0000000000000000 R14: ffff88806b636e80 R15: 0000000000000000
>  local_lock_acquire include/linux/local_lock_internal.h:29 [inline]
>  folio_add_lru+0x2b2/0x7d0 mm/swap.c:515
>  folio_add_lru_vma+0xb0/0x100 mm/swap.c:537
>  wp_page_copy mm/memory.c:3189 [inline]
>  do_wp_page+0x19fa/0x3a70 mm/memory.c:3510
>  handle_pte_fault mm/memory.c:5054 [inline]
>  __handle_mm_fault+0x1d7c/0x3d60 mm/memory.c:5179
>  handle_mm_fault+0x478/0xa00 mm/memory.c:5344
>  do_user_addr_fault+0x3d1/0x1000 arch/x86/mm/fault.c:1413
>  handle_page_fault arch/x86/mm/fault.c:1505 [inline]
>  exc_page_fault+0x5c/0xd0 arch/x86/mm/fault.c:1561
>  asm_exc_page_fault+0x26/0x30 arch/x86/include/asm/idtentry.h:570
> RIP: 0010:copy_user_generic arch/x86/include/asm/uaccess_64.h:112 [inline]
> RIP: 0010:raw_copy_to_user arch/x86/include/asm/uaccess_64.h:133 [inline]
> RIP: 0010:copy_to_user_iter lib/iov_iter.c:25 [inline]
> RIP: 0010:iterate_iovec include/linux/iov_iter.h:51 [inline]
> RIP: 0010:iterate_and_advance2 include/linux/iov_iter.h:247 [inline]
> RIP: 0010:iterate_and_advance include/linux/iov_iter.h:271 [inline]
> RIP: 0010:_copy_to_iter+0x4c7/0x11d0 lib/iov_iter.c:186
> Code: 45 e8 8d 37 27 fd 48 8b 4c 24 18 89 ee 48 8b 44 24 28 4c 8d 34 01 4c 89 f7 e8 e5 6e 7d fd 0f 01 cb 48 89 e9 4c 89 ff 4c 89 f6 <f3> a4 0f 1f 00 0f 01 ca 48 89 e8 48 29 eb 48 29 c8 48 01 cb 48 01
> RSP: 0018:ffffc9000b427970 EFLAGS: 00050246
> RAX: 0000000000000001 RBX: 0000000000001000 RCX: 0000000000000e80
> RDX: 0000000000000000 RSI: ffff888010b19180 RDI: 0000000020755000
> RBP: 0000000000001000 R08: 0000000000000000 R09: ffffed10021633ff
> R10: ffff888010b19fff R11: 0000000000000000 R12: 0000000000754b80
> R13: ffffc9000b427d60 R14: ffff888010b19000 R15: 0000000020754e80
>  copy_page_to_iter lib/iov_iter.c:381 [inline]
>  copy_page_to_iter+0xf1/0x180 lib/iov_iter.c:368
>  process_vm_rw_pages mm/process_vm_access.c:45 [inline]
>  process_vm_rw_single_vec mm/process_vm_access.c:117 [inline]
>  process_vm_rw_core.constprop.0+0x5cd/0xa10 mm/process_vm_access.c:215
>  process_vm_rw+0x2ff/0x360 mm/process_vm_access.c:283
>  __do_sys_process_vm_readv mm/process_vm_access.c:295 [inline]
>  __se_sys_process_vm_readv mm/process_vm_access.c:291 [inline]
>  __x64_sys_process_vm_readv+0xe2/0x1b0 mm/process_vm_access.c:291
>  do_syscall_x64 arch/x86/entry/common.c:51 [inline]
>  do_syscall_64+0x3f/0x110 arch/x86/entry/common.c:82
>  entry_SYSCALL_64_after_hwframe+0x63/0x6b
> RIP: 0033:0x7fd00a215259
> Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 51 18 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007fd00a1d3228 EFLAGS: 00000246 ORIG_RAX: 0000000000000136
> RAX: ffffffffffffffda RBX: 00007fd00a29c308 RCX: 00007fd00a215259
> RDX: 0000000000000002 RSI: 0000000020008400 RDI: 0000000000001db0
> RBP: 00007fd00a29c300 R08: 0000000000000286 R09: 0000000000000000
> R10: 0000000020008640 R11: 0000000000000246 R12: 00007fd00a269074
> R13: 0000000000000000 R14: 00007ffec3c6eb10 R15: 00007ffec3c6ebf8
>  </TASK>
> ----------------
> Code disassembly (best guess):
>    0:	c1 05 8d 88 9a 7e 83 	roll   $0x83,0x7e9a888d(%rip)        # 0x7e9a8894
>    7:	f8                   	clc
>    8:	01 0f                	add    %ecx,(%rdi)
>    a:	85 b0 02 00 00 9c    	test   %esi,-0x63fffffe(%rax)
>   10:	58                   	pop    %rax
>   11:	f6 c4 02             	test   $0x2,%ah
>   14:	0f 85 9b 02 00 00    	jne    0x2b5
>   1a:	48 85 ed             	test   %rbp,%rbp
>   1d:	74 01                	je     0x20
>   1f:	fb                   	sti
>   20:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
>   27:	fc ff df
> * 2a:	48 01 c3             	add    %rax,%rbx <-- trapping instruction
>   2d:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
>   34:	48 c7 43 08 00 00 00 	movq   $0x0,0x8(%rbx)
>   3b:	00
>   3c:	48                   	rex.W
>   3d:	8b                   	.byte 0x8b
>   3e:	84                   	.byte 0x84
>   3f:	24                   	.byte 0x24
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
> If you want syzbot to run the reproducer, reply with:
> #syz test: git://repo/address.git branch-or-commit-hash
> If you attach or paste a git patch, syzbot will apply it before testing.
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

This bug is assigned to the crypto and mm subsystems, but it doesn't
seem to have anything to do with crypto.  It also seems to be obsolete,
as it was last seen 775 days ago.

#syz invalid
