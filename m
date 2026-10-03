Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14B81A3A80
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 01:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790991366; cv=none; b=PMzBkwSHdEmbN1Ku1YXphLigc3Yz6pduel+naANC4gkAuuj6Ce96s7O1tyhzXzITW91lPP4tKS2MBjAU85k/6pudaznN2njw0kzlQBMHMLgRCb2g+mwuzr5M9kW4fEwyEMxFjzNxosuoKogPOyMC6nwek2QQAaM6XkRJv8cIRBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790991366; c=relaxed/simple;
	bh=kS+IMdw/zJVLAbeVBvaSXrpRl8fAJb1pSq2iXRg8Mp4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=SN/Ntbt2sOLjLeKJjYoRSSkDGhERx0eopWQiBQpcxmBFCop/qGp1PY1Y54L/pTrjYQ1fEmE1PePESTx0HdD3DQOmZcfRnurPCGah9jYshoqewRQdfy6bETRS90vTVCXIRgviN4vtTMWyxSRUj5X13s8l+kDxwmhiTwuiscsFq60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4b38ea4c6acso34949b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 18:36:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790991363; x=1791596163;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9YZq8p0clnNKu9eLZZykt9E/56jKgTEN0eN3DxrL4oI=;
        b=P88a/TNT/m6PkmXlV7zDOb7pp+eEFOnpnWRWZqCvPO84KQb6IuttMZGwoqepIAqw0a
         I7EdpIHD3yziTLa5QRDizN8SnNEL21+CzA3KtDPVjBRweThBArqpWhw+LgVoOeNWNiuI
         mEP7tIE+u1aXIgDPHatRLW/2YPtWhJP0L1ciaE5u7rA1cMWV8wG2v7+DLYpWJcr1CK49
         RM3nELqM6cQCJRgOb6QyZXnMV4WSq43/pLU0dU66StOmeq7EMUQBBtClYAmD5D1o5X4V
         gOQs49zgenJfus3wlFR/cuAzf6oRDmuHsAdThnJksApe057DN99oUdJW3EUaTAkDBBnj
         cVXQ==
X-Forwarded-Encrypted: i=1; AKwUvBygJdVK2YdrxRPH6o862JMwTXvKIs1I38w07Bf8MUIb4Zsvi6JIl8o6eNW7z2mTwMH65F96Nln+7a0nY6U=@vger.kernel.org
X-Gm-Message-State: AFuF++mlj4F1G3r+rcwUM5IJFA9TPBa7gczgHfmwvwhC25hdtbrbumlQ
	Xje2GHWxKgoUusTcMn9emmhi1SpqPHfjx/VPcKq30sA5SCbjC3TRpQIdjAtOyUAuOp9RRlutzuY
	decdTp2J/ub4MmyJMV15ul304+W9GHQhktVY/INEGl++0dHcCzw/P+scYLko=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1315:b0:4e6:76eb:b997 with SMTP id
 5614622812f47-4f52a5776f4mr3361491b6e.62.1790991363655; Fri, 02 Oct 2026
 18:36:03 -0700 (PDT)
Date: Fri, 02 Oct 2026 18:36:03 -0700
In-Reply-To: <20261002230311.102330-1-kartikey406@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac05c03.34119e79.2f92f3.000c.GAE@google.com>
Subject: Re: [syzbot] [wireless?] KASAN: slab-use-after-free Read in tasklet_action_common
From: syzbot <syzbot+e91dc13b1b37759b3d9f@syzkaller.appspotmail.com>
To: kartikey406@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
INFO: task hung in ath9k_hif_usb_disconnect

INFO: task kworker/1:4:5768 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/1:4     state:D stack:24512 pid:5768  tgid:5768  ppid:2      task_flags:0x4288060 flags:0x00080000
Workqueue: usb_hub_wq hub_event
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5533 [inline]
 __schedule+0x17db/0x58f0 kernel/sched/core.c:7284
 __schedule_loop kernel/sched/core.c:7361 [inline]
 schedule+0x164/0x2b0 kernel/sched/core.c:7376
 schedule_timeout+0xc0/0x2c0 kernel/time/sleep_timeout.c:75
 do_wait_for_common kernel/sched/completion.c:100 [inline]
 __wait_for_common kernel/sched/completion.c:121 [inline]
 wait_for_common kernel/sched/completion.c:132 [inline]
 wait_for_completion+0x2ca/0x5e0 kernel/sched/completion.c:153
 ath9k_hif_usb_disconnect+0xb8/0x250 drivers/net/wireless/ath/ath9k/hif_usb.c:1419
 usb_unbind_interface+0x295/0x9f0 drivers/usb/core/driver.c:461
 device_remove drivers/base/dd.c:618 [inline]
 __device_release_driver drivers/base/dd.c:1349 [inline]
 device_release_driver_internal+0x4f5/0x880 drivers/base/dd.c:1372
 bus_remove_device+0x444/0x560 drivers/base/bus.c:664
 device_del+0x524/0x8f0 drivers/base/core.c:3965
 usb_disable_device+0x3d4/0x8d0 drivers/usb/core/message.c:1478
 usb_disconnect+0x346/0x9a0 drivers/usb/core/hub.c:2350
 hub_port_connect drivers/usb/core/hub.c:5420 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5720 [inline]
 port_event drivers/usb/core/hub.c:5884 [inline]
 hub_event+0x1bbb/0x4d30 drivers/usb/core/hub.c:5966
 process_one_work kernel/workqueue.c:3396 [inline]
 process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3479
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3560
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Showing all locks held in the system:
locks held by kworker/0:1/10: 4, on CPU#0:
 #0: ffff88801b06b140 ((wq_completion)events){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88801b06b140 ((wq_completion)events){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88801b06b140 ((wq_completion)events){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff88801b06b140 ((wq_completion)events){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc900000f7c40 ((work_completion)(&fw_work->work)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc900000f7c40 ((work_completion)(&fw_work->work)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc900000f7c40 ((work_completion)(&fw_work->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc900000f7c40 ((work_completion)(&fw_work->work)){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffff8880b863bb20 (&rq->__lock){-.-.}-{2:2}, at: sched_submit_work kernel/sched/core.c:7319 [inline]
 #2: ffff8880b863bb20 (&rq->__lock){-.-.}-{2:2}, at: schedule+0x90/0x2b0 kernel/sched/core.c:7375
 #3: ffff8880b8624408 (psi_seq){-.-.}-{0:0}, at: psi_task_switch+0x57/0x7d0 kernel/sched/psi.c:933
locks held by ksoftirqd/0/15: 2, last CPU#0:
 #0: ffff8880b863bb20 (&rq->__lock){-.-.}-{2:2}, at: finish_lock_switch kernel/sched/core.c:5261 [inline]
 #0: ffff8880b863bb20 (&rq->__lock){-.-.}-{2:2}, at: finish_task_switch+0x159/0xc60 kernel/sched/core.c:5382
 #1: ffff8880b8624408 (psi_seq){-.-.}-{0:0}, at: psi_task_switch+0x57/0x7d0 kernel/sched/psi.c:933
locks held by khungtaskd/33: 1, last CPU#1:
 #0: ffffffff8ed5c8a0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffffffff8ed5c8a0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffffffff8ed5c8a0 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks+0x2e/0x180 kernel/locking/lockdep.c:6871
locks held by getty/5372: 2, on CPU#1:
 #0: ffff8880328b10a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x25/0x70 drivers/tty/tty_ldisc.c:243
 #1: ffffc900032332e8 (&ldata->atomic_read_lock){+.+.}-{4:4}, at: n_tty_read+0x45a/0x1360 drivers/tty/n_tty.c:2211
locks held by kworker/1:4/5768: 5, on CPU#1:
 #0: ffff888022aaf540 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff888022aaf540 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff888022aaf540 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff888022aaf540 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc90003b9fc40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90003b9fc40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90003b9fc40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc90003b9fc40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffff88802a1b51d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff88802a1b51d8 (&dev->mutex){....}-{4:4}, at: hub_event+0x184/0x4d30 drivers/usb/core/hub.c:5912
 #3: ffff88807bbca1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #3: ffff88807bbca1d8 (&dev->mutex){....}-{4:4}, at: usb_disconnect+0xfc/0x9a0 drivers/usb/core/hub.c:2341
 #4: ffff88807f7b41a0 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #4: ffff88807f7b41a0 (&dev->mutex){....}-{4:4}, at: __device_driver_lock drivers/base/dd.c:1171 [inline]
 #4: ffff88807f7b41a0 (&dev->mutex){....}-{4:4}, at: device_release_driver_internal+0xb9/0x880 drivers/base/dd.c:1369

=============================================

NMI backtrace for cpu 1
CPU: 1 UID: 0 PID: 33 Comm: khungtaskd Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/16/2026
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
Sending NMI from CPU 1 to CPUs 0:
NMI backtrace for cpu 0
CPU: 0 UID: 0 PID: 15 Comm: ksoftirqd/0 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/16/2026
RIP: 0010:check_preemption_disabled+0x19/0xd0 lib/smp_processor_id.c:53
Code: 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 55 41 57 41 56 53 65 8b 05 1b 4d ae 07 65 48 8b 0d eb 4c ae 07 85 c9 74 0c <5b> 41 5e 41 5f 5d c3 cc cc cc cc cc 9c 59 f7 c1 00 02 00 00 74 ea
RSP: 0018:ffffc90000147bf8 EFLAGS: 00000006
RAX: 0000000000000000 RBX: ffff88801e299f40 RCX: 8000000000000100
RDX: 0000000000000000 RSI: ffffffff8e69f5c6 RDI: ffffffff8c6dad80
RBP: dffffc0000000000 R08: ffffffff907a627f R09: 1ffffffff20f4c4f
R10: dffffc0000000000 R11: fffffbfff20f4c50 R12: ffff8880b8624080
R13: 0000000000000286 R14: ffff8880b8624088 R15: ffff88807c9cd158
FS:  0000000000000000(0000) GS:ffff888124cc7000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f74059872c0 CR3: 000000000eb48000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 lockdep_recursion_finish kernel/locking/lockdep.c:470 [inline]
 lockdep_hardirqs_on_prepare+0x19f/0x270 kernel/locking/lockdep.c:4455
 trace_hardirqs_on+0x28/0x40 kernel/trace/trace_preemptirq.c:78
 __tasklet_schedule_common+0xc9/0x110 kernel/softirq.c:858
 tasklet_action_common+0x2d7/0x490 kernel/softirq.c:961
 handle_softirqs+0x226/0x860 kernel/softirq.c:645
 run_ksoftirqd+0x36/0x60 kernel/softirq.c:1099
 smpboot_thread_fn+0x565/0xa70 kernel/smpboot.c:160
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>


Tested on:

commit:         ff47652a Merge tag 'cifs-fixes-7.3-rc6' of https://git..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=172edbf5580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=23e5acac5c98285f
dashboard link: https://syzkaller.appspot.com/bug?extid=e91dc13b1b37759b3d9f
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=137c1725580000

