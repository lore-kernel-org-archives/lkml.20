Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33773A7F6B
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 22:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792018745; cv=none; b=Xnj8qy/6e+LDqE0bieOGBstiOptptS4cS4X7PQJ8C5Ht9mHHuTOS2sCAkkS4ZuiHCb+lpofdfzR1TokRjSfvuBQN3991K1GEpmg+Wpy4qD/h0ZTrMoJdbeqg97wxSTctlhs2gWVdD6UNzIAyIDUBKR5oXRCa4WjlE0jK3Cufn+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792018745; c=relaxed/simple;
	bh=NmYrKtolHOUwoYDxayxetNO65+tVAXw7/PaxXzTNe2M=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=V2h2/UIxKC/ilfTBzfE75c6nvsz4f+peknyrptImyi4B3K6b1jAarXyfELRQLUgs1BvALVpj+vs8TxjpAqlYpSNFwVWmK8mYNTSu+C3Uydyd4Ws6evC5nUUYeSg1l2atO0mgY+p/aohL4BMDguSUxHNIQPOnrfsGEPmgsZpmFAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-809f1af7992so11091290a34.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:59:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792018743; x=1792623543;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rZipK1w0WjODbbSpfTW3jFBUH/Y1PRplm/i+vEVlonY=;
        b=F0KOggJkE4ozIQBYIlttmHoiaGWXCK9z0J4/zAs1fZRGvdVLejMhTXDMfozTfJRdH9
         +ZpBqr90KvIK88mmr3pxPY4Mvo1PjuRZdlwVqrsRffbWFyJNvHsdxVqZZsL0kFFUJ8Cs
         GqNJZpMOKWa0DmXQQm8qt8v/hGCLpbNho0umURIyUQSnOurGQ0FjjnMjLeZee+wyrGyP
         oYoSwLjLJDnzXf/1VD+2+e5KtWv2SbBAj75V1vhHoB5KU+hZQyN47mYX8luLJmV7t5x3
         wkkuZOtdrhgDFER2n1401x6Hry1dVfSwd2F3D+ZPhOiDgGXyVOBG+kg5rSOJWbyzoO5+
         oZug==
X-Gm-Message-State: AFq9FYLNyUacFAAf+Qz82h/U1wR3KJykYU1VFaP2DCAXqh+Z0JBHUjuw
	axGO8NigrHnPojs70PZLhX/FJQW77MpFgZHRjpqTaGxZgbtb4FqcNI1HvhZwQYKcuvKLbvH7muF
	wYFuVDbTiq0bUV4ggH6jR+avoynzZfvLaCZs4wus2onUGeYV4MQ4HBPpb0vM=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3384:b0:4b9:a8ac:489 with SMTP id
 5614622812f47-50c52a4eb8cmr17062452b6e.39.1792018742742; Wed, 14 Oct 2026
 15:59:02 -0700 (PDT)
Date: Wed, 14 Oct 2026 15:59:02 -0700
In-Reply-To: <CAFJkwZxEecAizR2Onef19ss4F8jcig41Robzud4ASpi1J+zxrA@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad00936.a150a118.27e199.0069.GAE@google.com>
Subject: Re: [syzbot] [x25?] inconsistent lock state in x25_kill_by_neigh (2)
From: syzbot <syzbot+300375dfd44665f063a6@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, neganhat@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
inconsistent lock state in x25_kill_by_neigh

================================
WARNING: inconsistent lock state
syzkaller #0 Not tainted
--------------------------------
inconsistent {SOFTIRQ-ON-W} -> {IN-SOFTIRQ-W} usage.
swapper/1/0 [HC0[0]:SC1[1]:HE1:SE0] takes:
ffff8880270b6260 (sk_lock-AF_X25){+.?.}-{0:0}, at: lock_sock include/net/sock.h:1713 [inline]
ffff8880270b6260 (sk_lock-AF_X25){+.?.}-{0:0}, at: x25_kill_by_neigh+0x168/0x280 net/x25/af_x25.c:1778
{SOFTIRQ-ON-W} state was registered at:
  lock_acquire kernel/locking/lockdep.c:5942 [inline]
  lock_acquire+0x1d1/0x380 kernel/locking/lockdep.c:5899
  lock_sock_nested+0x41/0xf0 net/core/sock.c:3837
  lock_sock include/net/sock.h:1713 [inline]
  x25_bind+0x221/0x5c0 net/x25/af_x25.c:694
  __sys_bind_socket net/socket.c:1945 [inline]
  __sys_bind_socket net/socket.c:1937 [inline]
  __sys_bind+0x1a9/0x260 net/socket.c:1976
  __do_sys_bind net/socket.c:1981 [inline]
  __se_sys_bind net/socket.c:1979 [inline]
  __x64_sys_bind+0x72/0xb0 net/socket.c:1979
  do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
  do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
  entry_SYSCALL_64_after_hwframe+0x77/0x7f
irq event stamp: 688540
hardirqs last  enabled at (688540): [<ffffffff81ca5325>] __local_bh_enable_ip+0xa5/0x120 kernel/softirq.c:478
hardirqs last disabled at (688539): [<ffffffff81ca534e>] __local_bh_enable_ip+0xce/0x120 kernel/softirq.c:455
softirqs last  enabled at (687752): [<ffffffff81ca4d8a>] __do_softirq kernel/softirq.c:679 [inline]
softirqs last  enabled at (687752): [<ffffffff81ca4d8a>] invoke_softirq kernel/softirq.c:519 [inline]
softirqs last  enabled at (687752): [<ffffffff81ca4d8a>] __irq_exit_rcu+0x16a/0x210 kernel/softirq.c:758
softirqs last disabled at (688117): [<ffffffff81ca4d8a>] __do_softirq kernel/softirq.c:679 [inline]
softirqs last disabled at (688117): [<ffffffff81ca4d8a>] invoke_softirq kernel/softirq.c:519 [inline]
softirqs last disabled at (688117): [<ffffffff81ca4d8a>] __irq_exit_rcu+0x16a/0x210 kernel/softirq.c:758

other info that might help us debug this:
 Possible unsafe locking scenario:

       CPU0
       ----
  lock(sk_lock-AF_X25);
  <Interrupt>
    lock(sk_lock-AF_X25);

 *** DEADLOCK ***

locks held by swapper/1/0: 1, last CPU#1:
 #0: ffffffff8fdec5e0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffffffff8fdec5e0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffffffff8fdec5e0 (rcu_read_lock){....}-{1:3}, at: netif_receive_skb_core+0x25/0x1a0 net/core/dev.c:6321

stack backtrace:
CPU: 1 UID: 0 PID: 0 Comm: swapper/1 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/05/2026
Call Trace:
 <IRQ>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_usage_bug.part.0+0x258/0x340 kernel/locking/lockdep.c:4086
 print_usage_bug kernel/locking/lockdep.c:4054 [inline]
 valid_state kernel/locking/lockdep.c:4100 [inline]
 mark_lock_irq kernel/locking/lockdep.c:4311 [inline]
 mark_lock+0x956/0x1020 kernel/locking/lockdep.c:4797
 mark_usage kernel/locking/lockdep.c:4686 [inline]
 __lock_acquire+0x7f1/0x1f40 kernel/locking/lockdep.c:5242
 lock_acquire kernel/locking/lockdep.c:5942 [inline]
 lock_acquire+0x1d1/0x380 kernel/locking/lockdep.c:5899
 lock_sock_nested+0x41/0xf0 net/core/sock.c:3837
 lock_sock include/net/sock.h:1713 [inline]
 x25_kill_by_neigh+0x168/0x280 net/x25/af_x25.c:1778
 x25_lapb_receive_frame+0x4b1/0x1000 net/x25/x25_dev.c:138
 __netif_receive_skb_one_core+0x1b2/0x1e0 net/core/dev.c:6297
 netif_receive_skb_core+0x5a/0x1a0 net/core/dev.c:6322
 lapbeth_napi_poll+0x42/0xc0 drivers/net/wan/lapbether.c:100
 __napi_poll.constprop.0+0xaf/0x450 net/core/dev.c:7830
 napi_poll net/core/dev.c:7893 [inline]
 net_rx_action+0xa40/0xf20 net/core/dev.c:8050
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
RIP: 0010:pv_native_safe_halt+0xf/0x20 arch/x86/kernel/paravirt.c:64
Code: a7 96 02 e9 53 50 03 00 0f 1f 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 66 90 0f 00 2d 93 48 17 00 fb f4 <c3> cc cc cc cc 66 2e 0f 1f 84 00 00 00 00 00 66 90 90 90 90 90 90
RSP: 0018:ffffc900001a7e00 EFLAGS: 00000246
RAX: 00000000000a7ff3 RBX: ffff888020684b00 RCX: ffffffff8bd47235
RDX: 0000000000000001 RSI: ffffffff8e3e3486 RDI: ffffffff8c625580
RBP: ffffed10040d0960 R08: 0000000000000001 R09: ffffed10170667bd
R10: ffff8880b8333deb R11: 0000000000000001 R12: 0000000000000000
R13: 0000000000000000 R14: 1ffff92000034fc4 R15: dffffc0000000000
 arch_safe_halt arch/x86/include/asm/paravirt.h:62 [inline]
 default_idle+0x9/0x10 arch/x86/kernel/process.c:768
 default_idle_call+0x6c/0xb0 kernel/sched/idle.c:122
 cpuidle_idle_call kernel/sched/idle.c:199 [inline]
 do_idle+0x3ae/0x5b0 kernel/sched/idle.c:355
 cpu_startup_entry+0x4f/0x60 kernel/sched/idle.c:454
 start_secondary+0x21d/0x2d0 arch/x86/kernel/smpboot.c:312
 common_startup_64+0x13e/0x158
 </TASK>
BUG: sleeping function called from invalid context at net/core/sock.c:3839
in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 0, name: swapper/1
preempt_count: 101, expected: 0
RCU nest depth: 1, expected: 0
INFO: lockdep is turned off.
Preemption disabled at:
[<0000000000000000>] 0x0
CPU: 1 UID: 0 PID: 0 Comm: swapper/1 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/05/2026
Call Trace:
 <IRQ>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 __might_resched.cold+0x1dc/0x222 kernel/sched/core.c:9264
 lock_sock_nested+0x52/0xf0 net/core/sock.c:3839
 lock_sock include/net/sock.h:1713 [inline]
 x25_kill_by_neigh+0x168/0x280 net/x25/af_x25.c:1778
 x25_lapb_receive_frame+0x4b1/0x1000 net/x25/x25_dev.c:138
 __netif_receive_skb_one_core+0x1b2/0x1e0 net/core/dev.c:6297
 netif_receive_skb_core+0x5a/0x1a0 net/core/dev.c:6322
 lapbeth_napi_poll+0x42/0xc0 drivers/net/wan/lapbether.c:100
 __napi_poll.constprop.0+0xaf/0x450 net/core/dev.c:7830
 napi_poll net/core/dev.c:7893 [inline]
 net_rx_action+0xa40/0xf20 net/core/dev.c:8050
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
RIP: 0010:pv_native_safe_halt+0xf/0x20 arch/x86/kernel/paravirt.c:64
Code: a7 96 02 e9 53 50 03 00 0f 1f 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 66 90 0f 00 2d 93 48 17 00 fb f4 <c3> cc cc cc cc 66 2e 0f 1f 84 00 00 00 00 00 66 90 90 90 90 90 90
RSP: 0018:ffffc900001a7e00 EFLAGS: 00000246
RAX: 00000000000a7ff3 RBX: ffff888020684b00 RCX: ffffffff8bd47235
RDX: 0000000000000001 RSI: ffffffff8e3e3486 RDI: ffffffff8c625580
RBP: ffffed10040d0960 R08: 0000000000000001 R09: ffffed10170667bd
R10: ffff8880b8333deb R11: 0000000000000001 R12: 0000000000000000
R13: 0000000000000000 R14: 1ffff92000034fc4 R15: dffffc0000000000
 arch_safe_halt arch/x86/include/asm/paravirt.h:62 [inline]
 default_idle+0x9/0x10 arch/x86/kernel/process.c:768
 default_idle_call+0x6c/0xb0 kernel/sched/idle.c:122
 cpuidle_idle_call kernel/sched/idle.c:199 [inline]
 do_idle+0x3ae/0x5b0 kernel/sched/idle.c:355
 cpu_startup_entry+0x4f/0x60 kernel/sched/idle.c:454
 start_secondary+0x21d/0x2d0 arch/x86/kernel/smpboot.c:312
 common_startup_64+0x13e/0x158
 </TASK>
----------------
Code disassembly (best guess):
   0:	a7                   	cmpsl  %es:(%rdi),%ds:(%rsi)
   1:	96                   	xchg   %eax,%esi
   2:	02 e9                	add    %cl,%ch
   4:	53                   	push   %rbx
   5:	50                   	push   %rax
   6:	03 00                	add    (%rax),%eax
   8:	0f 1f 00             	nopl   (%rax)
   b:	90                   	nop
   c:	90                   	nop
   d:	90                   	nop
   e:	90                   	nop
   f:	90                   	nop
  10:	90                   	nop
  11:	90                   	nop
  12:	90                   	nop
  13:	90                   	nop
  14:	90                   	nop
  15:	90                   	nop
  16:	90                   	nop
  17:	90                   	nop
  18:	90                   	nop
  19:	90                   	nop
  1a:	90                   	nop
  1b:	f3 0f 1e fa          	endbr64
  1f:	66 90                	xchg   %ax,%ax
  21:	0f 00 2d 93 48 17 00 	verw   0x174893(%rip)        # 0x1748bb
  28:	fb                   	sti
  29:	f4                   	hlt
* 2a:	c3                   	ret <-- trapping instruction
  2b:	cc                   	int3
  2c:	cc                   	int3
  2d:	cc                   	int3
  2e:	cc                   	int3
  2f:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  36:	00 00 00
  39:	66 90                	xchg   %ax,%ax
  3b:	90                   	nop
  3c:	90                   	nop
  3d:	90                   	nop
  3e:	90                   	nop
  3f:	90                   	nop


Tested on:

commit:         24a19b95 Linux 7.3-rc7
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=124d0235580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=129d675874dbf896
dashboard link: https://syzkaller.appspot.com/bug?extid=300375dfd44665f063a6
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Note: no patches were applied.
