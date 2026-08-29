Received: from mail-oi2-f2.google.com (mail-oi2-f2.google.com [74.125.231.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F917175A5
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 04:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787979031; cv=none; b=cQW69mzL/pIIDq9+MpLt/CpgV7a/xKRezJmRUQqEWsh3IBGLgDDfesycacD9NpUNJHk77YVh6lE5yOyRLcqGhzLqlxegc/PhwepQkGrnldnAnVDNBjvcPB7HRmtyRtET3lMHnukb0VvVZdI1fnOML/G0ma3QDATDhd2mGviVFjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787979031; c=relaxed/simple;
	bh=ZCc+xdzZiMr8+/Axu+VwXk+sazFMEnRIToniy/tO91Y=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=FRNraXB280OKxl2oycgoII6aHJG2ImmvNABjfL3eV64GDtTZ+wwiiXxoMWZtsCSaA6xmySBtr7RzWbaoIZHeR4c8zmLDPIIoIVAh/fqAJ6eOGCXOebjoFNOzOo1AFwk2ZnRd93zj0J1jrTXinNY0vdJNHb7niiwCK77Mt1hW/VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi2-f2.google.com with SMTP id 46e09a7af769-7f4e9ec63a7so439627a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 21:50:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787979028; x=1788583828;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oYyk2E1qXfQ9RoAqCv9NRHgg3/709sOaV1pS87Hr9B0=;
        b=Txvv4eWsjZZ4Kpw1JH4mwJhDfBN5mmuGu+ZiciRkuMUirGY12ehelD2e1MOt4BkmFI
         zl7rT77MmlGN/PIEYHbtTeDCW8AhgUPe+cbyv6d4XhThF8cMZYUmhFqwn+cMXzWb4VT7
         LuOCzknjgIzTYFGb+1Qyrkoxg4JR6lYzy98B8OPCmEGvyDrrYGfV588MpsEfaVNLDz2v
         ZsFeuj4lQDd4VTEJqVVnISEpa72EmOzqgI9IlLef98zncp48sWacEwTAE+DuHv+BFI0g
         BdkVjUDIwXYiyY9xA3TRJM3h+lfDlWjpizcgHHCKeQzMSQjMis20N3XmVCGwB+YoAx13
         5sMw==
X-Forwarded-Encrypted: i=1; AHgh+RqfP0etSySsd4WpwTqFLs+62jpd8+m0TOhtRHXlBrEr0MgQ5DQHo+kpZBb9YESAwGuGepOc3cwTT9RTtMU=@vger.kernel.org
X-Gm-Message-State: AFuF++mWhTS5YmVjK2i7VAEFz9XbDlUpE20CnKbE26Ucjalo2s1+34Tl
	GIgTRjeJdHH8T3o2UPVLCc8KlFK8+I9NkkFKTL/1H09QeohEX8CT1Y/Z5WGhys50FWH06Mc8lRB
	FomaucLZEJdt1CsYveNJbWpt4FL8A9ZZMz2+kpgEp13UebIaot7T4wWB1RVs=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:3005:b0:6ac:a0db:1a78 with SMTP id
 006d021491bc7-6b1c6479ccfmr8945812eaf.5.1787979028228; Fri, 28 Aug 2026
 21:50:28 -0700 (PDT)
Date: Fri, 28 Aug 2026 21:50:28 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a926514.1d9ded08.62e62.00ff.GAE@google.com>
Subject: [syzbot] [kernel?] possible deadlock in __balance_push_cpu_stop
From: syzbot <syzbot+acf142088e0182172e58@syzkaller.appspotmail.com>
To: bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, 
	syzkaller-bugs@googlegroups.com, tglx@kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    18fbf5151d2c Merge tag 'mm-stable-2026-08-26-15-22' of git..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14737415580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=315b9470ea1919b5
dashboard link: https://syzkaller.appspot.com/bug?extid=acf142088e0182172e58
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/048de1af0091/disk-18fbf515.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/40ec4a36602a/vmlinux-18fbf515.xz
kernel image: https://storage.googleapis.com/syzbot-assets/d49e157a8ad0/bzImage-18fbf515.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+acf142088e0182172e58@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
syzkaller #0 Not tainted
------------------------------------------------------
migration/1/27 is trying to acquire lock:
ffff8880b8740998 (_T->lock){....}-{2:2}, at: rt_mutex_slowtrylock kernel/locking/rtmutex.c:1404 [inline]
ffff8880b8740998 (_T->lock){....}-{2:2}, at: __rt_spin_trylock kernel/locking/spinlock_rt.c:123 [inline]
ffff8880b8740998 (_T->lock){....}-{2:2}, at: rt_spin_trylock+0x56/0x2b0 kernel/locking/spinlock_rt.c:135

but task is already holding lock:
ffff88802718e8c0 (&p->pi_lock){-...}-{2:2}, at: class_raw_spinlock_irq_constructor include/linux/spinlock.h:575 [inline]
ffff88802718e8c0 (&p->pi_lock){-...}-{2:2}, at: __balance_push_cpu_stop+0x78/0x410 kernel/sched/core.c:8446

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #1 (&p->pi_lock){-...}-{2:2}:
       __raw_spin_lock include/linux/spinlock_api_smp.h:190 [inline]
       _raw_spin_lock+0x2e/0x40 kernel/locking/spinlock.c:173
       rtlock_slowlock_locked+0x1ec/0x3c20 kernel/locking/rtmutex.c:1874
       rtlock_slowlock kernel/locking/rtmutex.c:1922 [inline]
       rtlock_lock kernel/locking/spinlock_rt.c:43 [inline]
       __rt_spin_lock kernel/locking/spinlock_rt.c:49 [inline]
       rt_spin_lock+0x165/0x400 kernel/locking/spinlock_rt.c:57
       spin_lock include/linux/spinlock_rt.h:45 [inline]
       finish_wait+0xbe/0x1e0 kernel/sched/wait.c:395
       synchronize_rcu_expedited+0x63e/0x770 kernel/rcu/tree_exp.h:981
       srcu_readers_active_idx_check kernel/rcu/srcutree.c:540 [inline]
       try_check_zero+0x2c1/0x4c0 kernel/rcu/srcutree.c:1135
       srcu_advance_state kernel/rcu/srcutree.c:1845 [inline]
       process_srcu+0x328/0x16f0 kernel/rcu/srcutree.c:1954
       process_one_work kernel/workqueue.c:3387 [inline]
       process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3470
       worker_thread+0xa47/0xfb0 kernel/workqueue.c:3551
       kthread+0x38b/0x470 kernel/kthread.c:436
       ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

-> #0 (_T->lock){....}-{2:2}:
       check_prev_add kernel/locking/lockdep.c:3181 [inline]
       check_prevs_add kernel/locking/lockdep.c:3300 [inline]
       validate_chain kernel/locking/lockdep.c:3924 [inline]
       __lock_acquire+0x15ff/0x2e40 kernel/locking/lockdep.c:5254
       lock_acquire+0x115/0x350 kernel/locking/lockdep.c:5908
       __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:155 [inline]
       _raw_spin_lock_irqsave+0x40/0x60 kernel/locking/spinlock.c:181
       rt_mutex_slowtrylock kernel/locking/rtmutex.c:1404 [inline]
       __rt_spin_trylock kernel/locking/spinlock_rt.c:123 [inline]
       rt_spin_trylock+0x56/0x2b0 kernel/locking/spinlock_rt.c:135
       __kfree_rcu_sheaf+0xd3/0x620 mm/slub.c:6113
       kfree_rcu_sheaf mm/slab_common.c:1688 [inline]
       kvfree_call_rcu+0xa4/0x430 mm/slab_common.c:2037
       set_cpus_allowed_force+0x1bd/0x2a0 kernel/sched/core.c:2833
       cpuset_cpus_allowed_fallback+0x24a/0x370 kernel/cgroup/cpuset.c:4258
       select_fallback_rq+0x11e/0x200 kernel/sched/core.c:3589
       __balance_push_cpu_stop+0xa1/0x410 kernel/sched/core.c:8453
       cpu_stopper_thread+0x25e/0x3f0 kernel/stop_machine.c:510
       smpboot_thread_fn+0x565/0xa70 kernel/smpboot.c:160
       kthread+0x38b/0x470 kernel/kthread.c:436
       ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

other info that might help us debug this:

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&p->pi_lock);
                               lock(_T->lock);
                               lock(&p->pi_lock);
  lock(_T->lock);

 *** DEADLOCK ***

locks held by migration/1/27: 2, last CPU#1:
 #0: ffff88802718e8c0 (&p->pi_lock){-...}-{2:2}, at: class_raw_spinlock_irq_constructor include/linux/spinlock.h:575 [inline]
 #0: ffff88802718e8c0 (&p->pi_lock){-...}-{2:2}, at: __balance_push_cpu_stop+0x78/0x410 kernel/sched/core.c:8446
 #1: ffffffff8e1c3ac0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffffff8e1c3ac0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffffff8e1c3ac0 (rcu_read_lock){....}-{1:3}, at: cpuset_cpus_allowed_fallback+0x22/0x370 kernel/cgroup/cpuset.c:4255

stack backtrace:
CPU: 1 UID: 0 PID: 27 Comm: migration/1 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
Stopper: __balance_push_cpu_stop+0x0/0x410 kernel/sched/sched.h:3965 <- balance_push+0x28d/0x4f0
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_circular_bug+0x2e2/0x300 kernel/locking/lockdep.c:2059
 check_noncircular+0x12f/0x150 kernel/locking/lockdep.c:2191
 check_prev_add kernel/locking/lockdep.c:3181 [inline]
 check_prevs_add kernel/locking/lockdep.c:3300 [inline]
 validate_chain kernel/locking/lockdep.c:3924 [inline]
 __lock_acquire+0x15ff/0x2e40 kernel/locking/lockdep.c:5254
 lock_acquire+0x115/0x350 kernel/locking/lockdep.c:5908
 __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:155 [inline]
 _raw_spin_lock_irqsave+0x40/0x60 kernel/locking/spinlock.c:181
 rt_mutex_slowtrylock kernel/locking/rtmutex.c:1404 [inline]
 __rt_spin_trylock kernel/locking/spinlock_rt.c:123 [inline]
 rt_spin_trylock+0x56/0x2b0 kernel/locking/spinlock_rt.c:135
 __kfree_rcu_sheaf+0xd3/0x620 mm/slub.c:6113
 kfree_rcu_sheaf mm/slab_common.c:1688 [inline]
 kvfree_call_rcu+0xa4/0x430 mm/slab_common.c:2037
 set_cpus_allowed_force+0x1bd/0x2a0 kernel/sched/core.c:2833
 cpuset_cpus_allowed_fallback+0x24a/0x370 kernel/cgroup/cpuset.c:4258
 select_fallback_rq+0x11e/0x200 kernel/sched/core.c:3589
 __balance_push_cpu_stop+0xa1/0x410 kernel/sched/core.c:8453
 cpu_stopper_thread+0x25e/0x3f0 kernel/stop_machine.c:510
 smpboot_thread_fn+0x565/0xa70 kernel/smpboot.c:160
 kthread+0x38b/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
process 5837 (syz.3.12) no longer affine to cpu1


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
