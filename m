Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794527037;
	b=Px8K/YLdeQsLHLH0Dzox3pIQIEWH26P7m+9l3Hi5qb8b6s5FOGA4rrQi5l6XuImlAWy5
	 bM4bh6Cr6KgBfZbtbkFOwYQs8mcVzYvsIaSeOg4jWyoBuxWiKIFk6NqF0lECZL39qk/q/
	 p89maiIuqLBZiui6I7qL1cWcvkbLhGSpkr3hPu1jMKaGhyGQdmncTDv8FE7qeW/kCG8r/
	 C4c0x7CpDZCtF5fNJny8dQDEWiu9Ee23jLC0dCgbAOJ+QIwGcMyk1zuWqRB1z66Jqm1S9
	 nl5lH/ofA0RTV21I7gEgfkk3gSBjqezjd3Wz9nBRi65MF2D7LWo6HyrL7dktYUybDKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794527037;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=Xo+H9lR23P0A0A4fib3m01tppo5IkRluvh2Z4UoFknA=;
	b=wRQrlm7xdPSkLRZseTE1jsTFfGM601RjwVt67xGAM8k7wxPVV4nE/PqOZLfQ9IWvf/Oi
	 VdemukmonqWtgSyiRWBTV0rIMfRPXfrzyYpalXMh1gcKPLoUrJOlmvTEPEs43IosytEzA
	 jr/w5JOxis55rkFn4x4SlibGFgggXdDLTFC7M0qAHbeWgI6sA6GOIDWEz8HnBVT3TL6AP
	 MW5GM+CtcHDoqZV7I3DBsDJSChsvSk4hu/Nt1FPUgeNM+k0X/a54LsDiTzEkUuBNwt4oZ
	 VzlRpDs7vt16wqV3KmHNFN5knQt0nCIeiMT8BrAN22ceIvLdjPJRamdz8wQYixgg2Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD33606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 23:43:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FD33606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4ea2c058e67so487560b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:43:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794527036; x=1795131836;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xo+H9lR23P0A0A4fib3m01tppo5IkRluvh2Z4UoFknA=;
        b=USYtDKzQu+IlWJgQAzaKr7XkbmrIEyJngJk2Bmb+S7H8Mch2bb5kHPcVENVpe6yu5j
         AAhcG98eIMXzCXpMiA1FMj46rpKu8d6WeRgA6vk0SBF9BJR9PZAUQKGHftjLqnX+HOTx
         biwWCIhZJdQC9Q02ughv319oFWjKJ33CGWRrHRDHhJl0WeaDDSej0yzjCT9mwcDM23kH
         APgJwFf3p/+DWX/mik6N/gYJCjORs1l2DC8203pnkJNeNAIDBs10HMt8pb0kcellUzRW
         gUABCP3cgH8f2Rp43ATiXM4wo+L/XqjuW2TtDhMBzY83tUEDYrzinjFuJXO8JfwxWPEM
         D6ag==
X-Forwarded-Encrypted: i=1; AL+hErFv4aC9/A8BHLgp25tFQJmoMMQdcIScZtDW1NOcLbZYiu0zivaKY8KVpiykqsZZiFJyCQlJ5+AlqnyUcDQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TGGW+P0fCJlNhy0B7b5v9Thnhnsy66/GBzWJJ9jTtfdufEz6T
	vIUT4R6kzaunBs34N8GGcbuX7TYweUWuMG7CQxWPE1rQRI+PePXajrVy+vRkIfPSVUW4xoxq+MY
	0HzjjFCIp93Vsr6UzlhzEEO38CDIa20BPPL8pe6ukoy8dHUeRr8ujxLGn+Wo=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c125:b0:523:dee6:7ae0 with SMTP id
 5614622812f47-56e64df18a8mr745987b6e.58.1794527036137; Thu, 12 Nov 2026
 15:43:56 -0800 (PST)
Date: Thu, 12 Nov 2026 15:43:56 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af64f3c.29bc419b.2c18ce.0002.GAE@google.com>
Subject: [syzbot] [kernel?] INFO: task hung in vhost_task_stop (3)
From: syzbot <syzbot+f59eab881ec20d423ab0@syzkaller.appspotmail.com>
To: john.ogness@linutronix.de, linux-kernel@vger.kernel.org, pmladek@suse.com, 
	printk@lists.linux.dev, rostedt@goodmis.org, senozhatsky@chromium.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    fa4ad798f6f6 Merge tag 'for-7.4-rc1-tag' of git://git.kern..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=101e0b69580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d44b06612b68f56
dashboard link: https://syzkaller.appspot.com/bug?extid=f59eab881ec20d423ab0
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
userspace arch: i386
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1382f8ad580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1782f8ad580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/2bde23f56ff1/disk-fa4ad798.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/48017a7575e9/vmlinux-fa4ad798.xz
kernel image: https://storage.googleapis.com/syzbot-assets/c5dba52ab74d/bzImage-fa4ad798.xz

AI-generated root cause summary:
When a KVM VM is initialized, kvm_mmu_start_lpage_recovery() creates the
"kvm-nx-lpage-recovery" worker thread via vhost_task_create(). Because
vhost_task_create() clones the calling process with CLONE_THREAD and
.user_worker = 1 (PF_USER_WORKER) without PF_NOFREEZE, the worker inherits the
caller's thread group and cgroup freezer state. If the cgroup is subsequently
frozen (e.g. via cgroup1 freezer.state), the worker thread is trapped in
__refrigerator() in the TASK_FROZEN state. When the VM file descriptor is
closed, kvm_mmu_pre_destroy_vm() calls vhost_task_stop(), which sets
VHOST_TASK_FLAGS_STOP, attempts to wake the worker using wake_up_process()
(which only targets TASK_NORMAL), and blocks in
wait_for_completion(&vtsk->exited). Because wake_up_process() cannot wake a task
in TASK_FROZEN and freezing(current) remains true, the worker never exits,
causing vhost_task_stop() to hang indefinitely in uninterruptible sleep.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=f59eab881ec20d423ab0

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+f59eab881ec20d423ab0@syzkaller.appspotmail.com

INFO: task syz.0.17:5888 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.0.17        state:D stack:26216 pid:5888  tgid:5888  ppid:5825   task_flags:0x400040 flags:0x08080002
Call Trace:
 <TASK>
 __schedu
 context_switch kernel/sched/core.c:5583 [inline]
 __schedule+0x17dd/0x5830 kernel/sched/core.c:7382
 __schedule_loop kernel/sched/core.c:7459 [inline]
 schedule+0x164/0x2b0 kernel/sched/core.c:7474
 schedule_timeout+0xc0/0x2c0 kernel/time/sleep_timeout.c:75
 do_wait_for_common kernel/sched/completion.c:100 [inline]
 __wait_for_common kernel/sched/completion.c:121 [inline]
 wait_for_common kernel/sched/completion.c:132 [inline]
 wait_for_completion+0x2c5/0x5d0 kernel/sched/completion.c:153
 vhost_task_stop+0xc0/0x170 kernel/vhost_task.c:102
 kvm_arch_pre_destroy_vm+0x68/0x80 arch/x86/kvm/x86.c:10107
 kvm_destroy_vm virt/kvm/kvm_main.c:1284 [inline]
 kvm_put_kvm+0x377/0xb40 virt/kvm/kvm_main.c:1350
 kvm_vm_release+0x6b/0x80 virt/kvm/kvm_main.c:1375
 __fput+0x408/0xa40 fs/file_table.c:512
 fput_close_sync+0x11f/0x240 fs/file_table.c:618
 filp_close_sync+0x6e/0xa0 fs/open.c:1574
 __range_close fs/file.c:919 [inline]
 __do_sys_close_range fs/file.c:1003 [inline]
 __se_sys_close_range+0xa77/0xef0 fs/file.c:954
 do_syscall_32_irqs_on arch/x86/entry/syscall_32.c:79 [inline]
 __do_fast_syscall_32+0x28b/0x6c0 arch/x86/entry/syscall_32.c:282
 do_fast_syscall_32+0x33/0x70 arch/x86/entry/syscall_32.c:307
 entry_SYSENTER_compat_after_hwframe+0x84/0x8e
RIP: 0023:0xf7fb3f1c
RSP: 002b:00000000ffe837dc EFLAGS: 00000206 ORIG_RAX: 00000000000001b4
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 000000000000001e
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000206 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>

Showing all locks held in the system:
locks held by khungtaskd/33: 1, last CPU#0:
 #0: ffffffff9015a260 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffffffff9015a260 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffffffff9015a260 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks+0x2e/0x180 kernel/locking/lockdep.c:6871
locks held by kworker/u8:9/1115: 4, last CPU#0:
 #0: ffff88813fe4c148 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88813fe4c148 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88813fe4c148 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3460 [inline]
 #0: ffff88813fe4c148 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3578
 #1: ffff8880b8224708 (psi_seq){-.-.}-{0:0}, at: psi_task_switch+0x57/0x7d0 kernel/sched/psi.c:928
 #2: ffff8880b8226498 (&base->lock){-.-.}-{2:2}, at: lock_timer_base kernel/time/timer.c:1005 [inline]
 #2: ffff8880b8226498 (&base->lock){-.-.}-{2:2}, at: __mod_timer+0x1a9/0xed0 kernel/time/timer.c:1086
 #3: ffffffff9c12ba00 (&obj_hash[i].lock){-.-.}-{2:2}, at: debug_object_activate+0xb7/0x420 lib/debugobjects.c:873
locks held by kworker/u8:12/1168: 3, last CPU#0:
 #0: ffff88813fe4c148 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88813fe4c148 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88813fe4c148 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3460 [inline]
 #0: ffff88813fe4c148 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3578
 #1: ffffc900050f7c40 ((work_completion)(&(&nsim_dev->trap_data->trap_report_dw)->work)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc900050f7c40 ((work_completion)(&(&nsim_dev->trap_data->trap_report_dw)->work)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc900050f7c40 ((work_completion)(&(&nsim_dev->trap_data->trap_report_dw)->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3460 [inline]
 #1: ffffc900050f7c40 ((work_completion)(&(&nsim_dev->trap_data->trap_report_dw)->work)){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3578
 #2: ffff888037387258 (&devlink->lock_key#9){+.+.}-{4:4}, at: nsim_dev_trap_report_work+0x57/0xb30 drivers/net/netdevsim/dev.c:834
locks held by kworker/0:2/1216: 3, last CPU#0:
 #0: ffff88813fe0dd48 ((wq_completion)events_power_efficient){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88813fe0dd48 ((wq_completion)events_power_efficient){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88813fe0dd48 ((wq_completion)events_power_efficient){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3460 [inline]
 #0: ffff88813fe0dd48 ((wq_completion)events_power_efficient){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3578
 #1: ffffc90005487c40 ((work_completion)(&(&gc_work->dwork)->work)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90005487c40 ((work_completion)(&(&gc_work->dwork)->work)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90005487c40 ((work_completion)(&(&gc_work->dwork)->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3460 [inline]
 #1: ffffc90005487c40 ((work_completion)(&(&gc_work->dwork)->work)){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3578
 #2: ffffffff9015a260 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #2: ffffffff9015a260 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #2: ffffffff9015a260 (rcu_read_lock){....}-{1:3}, at: gc_worker+0x274/0x1890 net/netfilter/nf_conntrack_core.c:1530
locks held by getty/5391: 2, on CPU#1:
 #0: ffff8880385230a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x25/0x70 drivers/tty/tty_ldisc.c:243
 #1: ffffc900032362e8 (&ldata->atomic_read_lock){+.+.}-{4:4}, at: n_tty_read+0x45a/0x1360 drivers/tty/n_tty.c:2211

=============================================

NMI backtrace for cpu 1
CPU: 1 UID: 0 PID: 33 Comm: khungtaskd Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/15/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 nmi_cpu_backtrace+0x274/0x2d0 lib/nmi_backtrace.c:123
 nmi_trigger_cpumask_backtrace+0x17d/0x390 lib/nmi_backtrace.c:66
 trigger_all_cpu_backtrace include/linux/nmi.h:164 [inline]
 __sys_info lib/sys_info.c:157 [inline]
 sys_info+0x135/0x170 lib/sys_info.c:165
 check_hung_uninterruptible_tasks kernel/hung_task.c:377 [inline]
 watchdog+0x1073/0x10f0 kernel/hung_task.c:598
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Sending NMI from CPU 1 to CPUs 0:
NMI backtrace for cpu 0
CPU: 0 UID: 0 PID: 32 Comm: pr/ttyS0 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/15/2026
RIP: 0010:io_serial_in+0x77/0xc0 drivers/tty/serial/8250/8250_port.c:425
Code: e8 2e 6a 43 fc 44 89 f9 d3 e3 49 83 c6 40 4c 89 f0 48 c1 e8 03 42 80 3c 20 00 74 08 4c 89 f7 e8 2f f3 ba fc 41 03 1e 89 da ec <0f> b6 c0 5b 41 5c 41 5e 41 5f e9 9a 14 83 06 cc 44 89 f9 80 e1 07
RSP: 0018:ffffc90000a878b8 EFLAGS: 00000002
RAX: 1ffffffff3840b00 RBX: 00000000000003fd RCX: 0000000000000000
RDX: 00000000000003fd RSI: 0000000000000000 RDI: 0000000000000020
RBP: dffffc0000000000 R08: 0000000000000003 R09: 0000000000000004
R10: dffffc0000000000 R11: ffffffff8585a440 R12: dffffc0000000000
R13: 0000000000000000 R14: ffffffff9c205ec0 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff888123409000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000563e7aa97d08 CR3: 000000000ff48000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 serial_in drivers/tty/serial/8250/8250.h:134 [inline]
 serial_lsr_in drivers/tty/serial/8250/8250.h:156 [inline]
 wait_for_lsr+0x184/0x2f0 drivers/tty/serial/8250/8250_port.c:2036
 serial8250_fifo_wait_for_lsr_thre drivers/tty/serial/8250/8250_port.c:3294 [inline]
 __serial8250_console_fifo_write+0xcd/0x3e0 drivers/tty/serial/8250/8250_port.c:3369
 serial8250_console_fifo_write drivers/tty/serial/8250/8250_port.c:3402 [inline]
 __serial8250_console_write drivers/tty/serial/8250/8250_port.c:3456 [inline]
 serial8250_console_write+0xa7e/0x1200 drivers/tty/serial/8250/8250_port.c:3520
 nbcon_emit_next_record+0xef5/0x1a90 kernel/printk/nbcon.c:-1
 nbcon_emit_one kernel/printk/nbcon.c:1157 [inline]
 nbcon_kthread_func+0x6d9/0x8d0 kernel/printk/nbcon.c:1271
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>


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
