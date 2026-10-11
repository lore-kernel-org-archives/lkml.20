Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BD134F497
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 17:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791739239; cv=none; b=fVMIomqqNi3bzp8GrI0C6kKnZmDsvTp8v1aAryrpPKnPnUhKeHg8PhFu+YHA+fThPxxxE8cTCDx04GTleMxKM0XlfPgkgHDeG/9JBOcZMTAH3Upiz1f2dXow7IbvPo8HZGNfoHb1nLtU8ZTkmlwjTNUPnXELzo7FwkPTv6Z+xJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791739239; c=relaxed/simple;
	bh=boqpQmbpagMztRLAih+yqPZejK5JO9ghDV1uPEpZe7Q=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=qmRnM1B8ChSu/rJ1keranS8JSnWyn9oN8I/Oddmm3Kp5uiKJzdcMC+f6zLm78CGTCvmFQP7CbrBoB+nA25QNuDpbWYvHIwsebDBiD18KxNky6F3zt/0GCOLyVssodWsgYhNsFw6b/wskOVIrAR5RwfWxvlnyHzBgxB0sKYSkJaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4f2040e10d8so1264924b6e.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 10:20:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791739237; x=1792344037;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mqF7JB8sSWi8lVFsjjxfSbGUlqO/vs7qPIfJsJyCieo=;
        b=MnbR4BTJ60AK75f0TP979dBoffn7fa7bfr8skwhrUfkiAY/cNWbKZKXfzwsDpHYwWQ
         W83m1T9hHmBjASInbNhw7xBJWqpwgiem4ywTFQp+0MG6PgB6pyT05Xvdw5KLMnS/hAj/
         uv7uJfyBMrdvoFwbjRyEqCyNqaypqKxQPfB3kE0+ccN8ntpK+ZDo3OxvJVfbkQNKeVit
         3fd4TNgIajfSTIzaZobc4dU0QYE03GAX/iiEgrPu1YDAeXTxJqoWPwSLzJxE4WZGZmei
         sO0g8syA4JJeDlPZZizuutREdBFO7AeLEvX/O6yfdf3ELyGj+rAIBqyNGpwi3FmcsrO+
         dk5g==
X-Forwarded-Encrypted: i=1; AKwUvBxQu/c/R1/toic+APsUV/buUmkEIIirAUUBE1AKIZqvN23Q31Z7fihC88S6KEWzzgICo3s3takL4s0PGNU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKTrpZkOk74hQi/bC7yW2zYqSiqXeMYXR3xXVayZIVbM2S9WKrq
	xcroNh9M6vqNKTKLKWy2I28nyO20HVBvZaUWanEBkV4dWjXOf2LM8wFx0dCh5inRoFQlT0ltN6j
	HaOgS9lOn7tuO3Xrch8C2XioJ7fC+t3Gf4ny6Aqy7kJ+Y7Vqqgq6cg+g40og=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:159c:b0:4ef:ef41:358b with SMTP id
 5614622812f47-50c51bbcbe2mr8551947b6e.33.1791739237021; Sun, 11 Oct 2026
 10:20:37 -0700 (PDT)
Date: Sun, 11 Oct 2026 10:20:37 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6acbc565.a150a118.27e199.003b.GAE@google.com>
Subject: [syzbot] [usb?] INFO: task hung in usb_device_read
From: syzbot <syzbot+7317196294d50d6e55c3@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    3857c2fe5449 Merge tag 'pci-v7.3-fixes-4' of git://git.ker..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=1607e1d1580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4118aaa2d227be26
dashboard link: https://syzkaller.appspot.com/bug?extid=7317196294d50d6e55c3
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=159e0999580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=107f7435580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/a6a6d2451aee/disk-3857c2fe.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/21a30bd0b766/vmlinux-3857c2fe.xz
kernel image: https://storage.googleapis.com/syzbot-assets/b688cad91d75/bzImage-3857c2fe.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+7317196294d50d6e55c3@syzkaller.appspotmail.com

INFO: task syz-executor326:5649 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor326 state:D stack:26856 pid:5649  tgid:5649  ppid:5648   task_flags:0x400140 flags:0x00080002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5533 [inline]
 __schedule+0x17db/0x58f0 kernel/sched/core.c:7284
 __schedule_loop kernel/sched/core.c:7361 [inline]
 schedule+0x164/0x2b0 kernel/sched/core.c:7376
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7433
 __mutex_lock_common kernel/locking/mutex.c:726 [inline]
 __mutex_lock+0x7c1/0x1550 kernel/locking/mutex.c:821
 device_lock include/linux/device.h:1104 [inline]
 usb_device_read+0x17c/0x2c0 drivers/usb/core/devices.c:529
 full_proxy_read+0x127/0x1f0 fs/debugfs/file.c:379
 vfs_read+0x213/0xa80 fs/read_write.c:572
 ksys_read+0x150/0x270 fs/read_write.c:716
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fe44ebd6009
RSP: 002b:00007ffd4023ead8 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
RAX: ffffffffffffffda RBX: 0067756265642f2e RCX: 00007fe44ebd6009
RDX: 0000000000002020 RSI: 00002000000010c0 RDI: 0000000000000004
RBP: 0000000000000001 R08: 0000000000000006 R09: 0000000000000006
R10: 0000000000000006 R11: 0000000000000246 R12: 00007ffd4023ec48
R13: 431bde82d7b634db R14: 00007fe44ec69c40 R15: 0000000000000002
 </TASK>

Showing all locks held in the system:
locks held by khungtaskd/32: 1, last CPU#0:
 #0: ffffffff8fd5c8a0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffffffff8fd5c8a0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffffffff8fd5c8a0 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks+0x2e/0x180 kernel/locking/lockdep.c:6871
locks held by kworker/u8:5/80: 2, on CPU#0:
 #0: ffff88801c0a4140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88801c0a4140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88801c0a4140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff88801c0a4140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc900024bfc40 ((work_completion)(&(&kfence_timer)->work)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc900024bfc40 ((work_completion)(&(&kfence_timer)->work)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc900024bfc40 ((work_completion)(&(&kfence_timer)->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc900024bfc40 ((work_completion)(&(&kfence_timer)->work)){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
locks held by kworker/1:2/1225: 5, on CPU#1:
 #0: ffff8880246e9140 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff8880246e9140 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff8880246e9140 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff8880246e9140 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc9000586fc40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc9000586fc40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc9000586fc40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc9000586fc40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffff88802a6911d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff88802a6911d8 (&dev->mutex){....}-{4:4}, at: hub_event+0x184/0x4d30 drivers/usb/core/hub.c:5917
 #3: ffff888036d7b1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #3: ffff888036d7b1d8 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x450 drivers/base/dd.c:1073
 #4: ffff88807f63f1a0 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #4: ffff88807f63f1a0 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x450 drivers/base/dd.c:1073
locks held by getty/5367: 2, on CPU#0:
 #0: ffff888036e290a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x25/0x70 drivers/tty/tty_ldisc.c:243
 #1: ffffc9000323b2e8 (&ldata->atomic_read_lock){+.+.}-{4:4}, at: n_tty_read+0x45a/0x1360 drivers/tty/n_tty.c:2211
locks held by syz-executor326/5649: 2, on CPU#0:
 #0: ffffffff90b04160 (usb_bus_idr_lock){+.+.}-{4:4}, at: usb_device_read+0xe7/0x2c0 drivers/usb/core/devices.c:523
 #1: ffff88802a6911d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #1: ffff88802a6911d8 (&dev->mutex){....}-{4:4}, at: usb_device_read+0x17c/0x2c0 drivers/usb/core/devices.c:529

=============================================

NMI backtrace for cpu 0
CPU: 0 UID: 0 PID: 32 Comm: khungtaskd Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/05/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 nmi_cpu_backtrace+0x274/0x2d0 lib/nmi_backtrace.c:123
 nmi_trigger_cpumask_backtrace+0x17d/0x390 lib/nmi_backtrace.c:66
 trigger_all_cpu_backtrace include/linux/nmi.h:164 [inline]
 __sys_info lib/sys_info.c:157 [inline]
 sys_info+0x135/0x170 lib/sys_info.c:165
 check_hung_uninterruptible_tasks kernel/hung_task.c:353 [inline]
 watchdog+0xfd7/0x1030 kernel/hung_task.c:561
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Sending NMI from CPU 0 to CPUs 1:
NMI backtrace for cpu 1
CPU: 1 UID: 0 PID: 0 Comm: swapper/1 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/05/2026
RIP: 0010:pv_native_safe_halt+0xf/0x20 arch/x86/kernel/paravirt.c:64
Code: 1b 8b 02 e9 6e 8f 27 f5 cc cc cc 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 66 90 0f 00 2d e3 d5 20 00 fb f4 <e9> 47 8f 27 f5 cc cc cc cc cc cc cc cc cc cc cc cc 90 90 90 90 90
RSP: 0018:ffffc900001a7e40 EFLAGS: 00000242
RAX: 0000000000d319a7 RBX: ffffffff819beb9c RCX: 8000000000000001
RDX: 0000000000000001 RSI: ffffffff8e469729 RDI: ffffffff8c6dde80
RBP: ffffc900001a7f10 R08: ffff8880b8533a1b R09: 1ffff110170a6743
R10: dffffc0000000000 R11: ffffed10170a6744 R12: 0000000000000000
R13: 1ffff11003e5ebb8 R14: 1ffff92000034fd0 R15: dffffc0000000000
FS:  0000000000000000(0000) GS:ffff888123bbf000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055d3450f0168 CR3: 000000007f10a000 CR4: 0000000000350ef0
Call Trace:
 <TASK>
 arch_safe_halt arch/x86/kernel/process.c:767 [inline]
 default_idle+0x9/0x20 arch/x86/kernel/process.c:768
 default_idle_call+0x72/0xb0 kernel/sched/idle.c:122
 cpuidle_idle_call kernel/sched/idle.c:199 [inline]
 do_idle+0x1cc/0x540 kernel/sched/idle.c:355
 cpu_startup_entry+0x43/0x60 kernel/sched/idle.c:454
 start_secondary+0x101/0x110 arch/x86/kernel/smpboot.c:312
 common_startup_64+0x13e/0x157
 </TASK>


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
