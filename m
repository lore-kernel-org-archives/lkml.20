Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721A812F585
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 22:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791066763; cv=none; b=H8Yvdcpf1ONCGQYMJdcrKcoi4yOU3Pwb1Y0D0h4sw4NRSht4j2GBolXG6DmNPGnJdK6jSzeHsXidOuYSpyHILQfaCaAkkqtd3wqdr+B0scqcY8ba/vjjfmE92aaFuOSOL+ksJpZyPogolztJrZ9ERbN0kC58nb0agptVg2BV/H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791066763; c=relaxed/simple;
	bh=kYAS1SAFpKbtRtSdmaWDScbkXShICNqGScgD/G30FYc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=or+mYl4S7fTTgBrIEB0TwWNS7FGQP8pIHxSPUoIj/JLSun6WQPUAA3j9SWR/VfUXsTFcNxDW03hyR202JyDastQXBtU4bB5VY6e+yf/nz2oq+Z+pYbyYbhZ5fGZOavatGg5jFcP+Hf30HNj+2qausOiPkCw1FRX/CLGU87riXtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4ea2c058e67so922021b6e.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 15:32:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791066760; x=1791671560;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YAl53z6N85rOaeoBVC9MHe71PN0SO7CNNCdZhUkGpyI=;
        b=aLye6IvwZL5oek65bCVYztbPmmePXSerRkqu8330jzVNjk/Vb/eqO1otbKYae6RBNb
         RHtkvpt1P3r4v4rnMxQQYNN2mGjgh/dRt/3P8Cll6TjtlraUhFD1eq8KJYFmvI/l5l4p
         6nfW3QXUs8ehGx1/vHLrmVIp/gPEGqxQD3OcV3qqCEmOensOOBxstjC6uMVN+pdXrDpk
         pr2Bs6frJpN5W3tG2jVwH0QGhbucaR4ZiNtOxaB2JFAXOExtKSP3Jko+nZaiIzZCQldp
         2z+1OH2zlNn+ZvCmTpy7Scwb2inhUAK5Eb5cL3Y1tkZhBiRG+IJ2aFyyyq6Sh8ydU03/
         rEZg==
X-Forwarded-Encrypted: i=1; AKwUvBxhoNrmQJ5QOwfzOxQszXBuLrdtgVwxx+3LygyjJV4yXKQ77p45oZt6jS/WBuJgDsXN0CP/85uPraBs+ZI=@vger.kernel.org
X-Gm-Message-State: AFuF++mV7RbrvMeWKn4z2t+mbO+Ng8DVGwi+BXOlGQX3m+rawgTk/SR6
	mVbr4RSxo4NlNajuYOMGzA23ye6pb68RuFxg/7uIdF2SH1TG0dGqLmtR7du6f1ROoaMtddTqzXy
	5LEEYO/vOkmP1NbMwqidApnL3/qUI5yRQMqzbp6KPMjoMsJx6qXzW+0FtjP0=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1919:b0:4ea:18f:64a5 with SMTP id
 5614622812f47-4f6797bf6bdmr4658126b6e.12.1791066760456; Sat, 03 Oct 2026
 15:32:40 -0700 (PDT)
Date: Sat, 03 Oct 2026 15:32:40 -0700
In-Reply-To: <6ab15335.3179f8cd.1e36b2.0023.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac18288.34119e79.2f92f3.0019.GAE@google.com>
Subject: Re: [syzbot] [usb?] INFO: task hung in usbdev_ioctl (8)
From: syzbot <syzbot+109061940215dd4b011e@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, ngocthang2710.1999@gmail.com, 
	syzkaller-bugs@googlegroups.com, thomas@winischhofer.net
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    e767a4ea70a3 Merge tag 'probes-fixes-v7.3-rc5' of git://gi..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=14ec47f5580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=929e4854a828f434
dashboard link: https://syzkaller.appspot.com/bug?extid=109061940215dd4b011e
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13887b15580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=173b6ec9580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/81cfd5e345ad/disk-e767a4ea.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/85805ef56b80/vmlinux-e767a4ea.xz
kernel image: https://storage.googleapis.com/syzbot-assets/acfff43ad99e/bzImage-e767a4ea.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+109061940215dd4b011e@syzkaller.appspotmail.com

INFO: task syz-executor345:5644 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor345 state:D stack:26368 pid:5644  tgid:5644  ppid:5643   task_flags:0x400040 flags:0x00080802
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5533 [inline]
 __schedule+0x1259/0x6920 kernel/sched/core.c:7284
 __schedule_loop kernel/sched/core.c:7361 [inline]
 schedule+0xdd/0x2c0 kernel/sched/core.c:7376
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7433
 __mutex_lock_common kernel/locking/mutex.c:726 [inline]
 __mutex_lock+0xccb/0x1bd0 kernel/locking/mutex.c:821
 device_lock include/linux/device.h:1104 [inline]
 usbdev_do_ioctl drivers/usb/core/devio.c:2613 [inline]
 usbdev_ioctl+0x1a7/0x3a90 drivers/usb/core/devio.c:2829
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl fs/ioctl.c:583 [inline]
 __x64_sys_ioctl+0x18e/0x210 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fc92deb6c49
RSP: 002b:00007ffe79a51768 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007fc92deb6c49
RDX: 9999999999999999 RSI: 000000004004550c RDI: 0000000000000003
RBP: 0000000000000001 R08: 0000000000000000 R09: 0000000000000006
R10: 0000000000000000 R11: 0000000000000246 R12: 00007ffe79a518d8
R13: 431bde82d7b634db R14: 00007fc92df49c40 R15: 0000000000000002
 </TASK>

Showing all locks held in the system:
locks held by kworker/u8:1/13: 2, on CPU#0:
 #0: ffff88801c094140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_one_work+0x1466/0x1b10 kernel/workqueue.c:3371
 #1: ffffc90000127d08 ((work_completion)(&(&kfence_timer)->work)){+.+.}-{0:0}, at: process_one_work+0xa2c/0x1b10 kernel/workqueue.c:3372
locks held by kworker/1:0/25: 5, on CPU#1:
 #0: ffff888023ec4540 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work+0x1466/0x1b10 kernel/workqueue.c:3371
 #1: ffffc900001f7d08 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work+0xa2c/0x1b10 kernel/workqueue.c:3372
 #2: ffff88802c2911d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff88802c2911d8 (&dev->mutex){....}-{4:4}, at: hub_event+0x1bb/0x4420 drivers/usb/core/hub.c:5912
 #3: ffff888023eda1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #3: ffff888023eda1d8 (&dev->mutex){....}-{4:4}, at: __device_attach+0x7e/0x4d0 drivers/base/dd.c:1073
 #4: ffff888023e911a0 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #4: ffff888023e911a0 (&dev->mutex){....}-{4:4}, at: __device_attach+0x7e/0x4d0 drivers/base/dd.c:1073
locks held by khungtaskd/32: 1, last CPU#1:
 #0: ffffffff8edec5a0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffffffff8edec5a0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffffffff8edec5a0 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks+0x3d/0x184 kernel/locking/lockdep.c:6871
locks held by getty/5366: 2, on CPU#1:
 #0: ffff88802e0360a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x24/0x80 drivers/tty/tty_ldisc.c:243
 #1: ffffc900032262e8 (&ldata->atomic_read_lock){+.+.}-{4:4}, at: n_tty_read+0x419/0x14e0 drivers/tty/n_tty.c:2211
locks held by syz-executor345/5644: 1, on CPU#0:
 #0: ffff88802c2911d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff88802c2911d8 (&dev->mutex){....}-{4:4}, at: usbdev_do_ioctl drivers/usb/core/devio.c:2613 [inline]
 #0: ffff88802c2911d8 (&dev->mutex){....}-{4:4}, at: usbdev_ioctl+0x1a7/0x3a90 drivers/usb/core/devio.c:2829
locks held by udevd/5646: 4, on CPU#1:
 #0: ffff888036dccab8 (&p->lock){+.+.}-{4:4}, at: seq_read_iter+0xe1/0x1270 fs/seq_file.c:183
 #1: ffff88807aa3ec80 (&of->mutex#2){+.+.}-{4:4}, at: kernfs_seq_start+0x4f/0x2a0 fs/kernfs/file.c:165
 #2: ffff888036458788 (kn->active#27){.+.+}-{0:0}, at: kernfs_get_active_of fs/kernfs/file.c:73 [inline]
 #2: ffff888036458788 (kn->active#27){.+.+}-{0:0}, at: kernfs_seq_start+0xbc/0x2a0 fs/kernfs/file.c:166
 #3: ffff888023eda1d8 (&dev->mutex){....}-{4:4}, at: device_lock_interruptible include/linux/device.h:1109 [inline]
 #3: ffff888023eda1d8 (&dev->mutex){....}-{4:4}, at: manufacturer_show+0x26/0xa0 drivers/usb/core/sysfs.c:142

=============================================

NMI backtrace for cpu 1
CPU: 1 UID: 0 PID: 32 Comm: khungtaskd Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/16/2026
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 nmi_cpu_backtrace.cold+0x12d/0x151 lib/nmi_backtrace.c:123
 nmi_trigger_cpumask_backtrace+0x21f/0x2a0 lib/nmi_backtrace.c:66
 trigger_all_cpu_backtrace include/linux/nmi.h:164 [inline]
 __sys_info lib/sys_info.c:157 [inline]
 sys_info+0x141/0x190 lib/sys_info.c:165
 check_hung_uninterruptible_tasks kernel/hung_task.c:353 [inline]
 watchdog+0xcb1/0x1030 kernel/hung_task.c:561
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Sending NMI from CPU 1 to CPUs 0:
NMI backtrace for cpu 0
CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/16/2026
RIP: 0010:pv_native_safe_halt+0xf/0x20 arch/x86/kernel/paravirt.c:64
Code: 17 93 02 c3 cc cc cc cc 0f 1f 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 66 90 0f 00 2d 73 f8 18 00 fb f4 <e9> 0c 50 03 00 66 2e 0f 1f 84 00 00 00 00 00 66 90 90 90 90 90 90
RSP: 0018:ffffffff8ea07cf0 EFLAGS: 00000246
RAX: 00000000000c970f RBX: ffffffff8ea91580 RCX: ffffffff8bd2c215
RDX: 0000000000000001 RSI: ffffffff8e38edcf RDI: ffffffff8c623a80
RBP: fffffbfff1d522b0 R08: 0000000000000001 R09: ffffed10170867bd
R10: ffff8880b8433deb R11: 0000000000000001 R12: 0000000000000000
R13: 0000000000000000 R14: 1ffffffff1d40fa2 R15: dffffc0000000000
FS:  0000000000000000(0000) GS:ffff888123b4e000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055cf112b4168 CR3: 000000000eb96000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 arch_safe_halt arch/x86/include/asm/paravirt.h:62 [inline]
 default_idle+0x9/0x10 arch/x86/kernel/process.c:768
 default_idle_call+0x6c/0xb0 kernel/sched/idle.c:122
 cpuidle_idle_call kernel/sched/idle.c:199 [inline]
 do_idle+0x3ae/0x5b0 kernel/sched/idle.c:355
 cpu_startup_entry+0x4f/0x60 kernel/sched/idle.c:454
 rest_init+0x2d3/0x2e0 init/main.c:732
 start_kernel+0x48e/0x490 init/main.c:1190
 x86_64_start_reservations+0x24/0x30 arch/x86/kernel/head64.c:310
 x86_64_start_kernel+0x12b/0x130 arch/x86/kernel/head64.c:291
 common_startup_64+0x13e/0x158
 </TASK>


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
