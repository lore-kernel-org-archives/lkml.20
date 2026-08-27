Received: from mail-oa2-f11.google.com (mail-oa2-f11.google.com [74.125.231.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633272F6586
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 01:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787793157; cv=none; b=gT/vTa1lO3NXaSWWjhWrCpfAW2BGPpfeloCVJkpoPJVtjeJa7lD51I/8BrtzO36rMBmeQ0nZUmbzrXpkdIafVutM+/eMTN5gUITvbUgjvTnhaG33V4ArbYVtJpZ+hBKRXThmKNv3+5M08jUwpCNZBarzCJb+sb+03GaQTpuF6uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787793157; c=relaxed/simple;
	bh=qBwQAlq1JYM0Efa8XEoy182yV8AHpDtzlPm+wjIOIek=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=k3DM3UR3ZinHtBxYsmwETMhKsWQYNeMuV4lj9L0+c93NGqP7cWYm32bvV3z7MAPO58IQSXI8jojpjY3P6qcmOF1VJ8vcFqdRsWcVQ7j2kR7Pv+mvGf2jNl+id9abt3VmXuDt8U1W1Jkxr7IantQFYbBiAVtD2sA3Ykc7fk5/21o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa2-f11.google.com with SMTP id 586e51a60fabf-462dec1c4c5so639982fac.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 18:12:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787793154; x=1788397954;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N27LVVgdB+KTCAqTsFlr4x+zNeyaLtk5QGvT7XzZEtE=;
        b=DdN8xl5hRq6dg+yt974IACW1qmZq8VV2rkLAeV0iFHbl2qSSPNCKb0OhQ7LHpRJwsM
         cVkeus6R263ixV+mUXooriIsihY1I4j2vbtT7KNLJnsuoP/MQtpovn6KSSRXlCvAwfSr
         1mEst8M8KYfI0DyWWPEspV8ttzEtDN2pQ8iUx4VXVVzATAGE2rjSDxVkx+gEJpLPEB7u
         rnRKDB0LK7GgXi0ASxbjYlTOrM0OE6fgx/l1Cv3DzDJfC7cStwetxXJ+VWE1f2WEcoiV
         LHDY31cqq4ZFFkvfkR2DVrkN4xYk+Z0ybrlvRN4M5+oxOjVAw8maxLvxlY+UESlvx4I8
         ljaA==
X-Gm-Message-State: AFuF++kpSs5xhGLjbjeMCP0+INtJ1tljMI6GhO7R3q2VuotzegcrDt0e
	oJeQmmAeChK9fTIiYV9e2OeomyGaru+2nbslAdnM1pLsJNKonEnVRpUnbqA2JusSCQt5XYjOwjr
	/3/p75JbbVD6kzZI5e55xTzM1CszpZXr9NxiCS6o44+CGCfFehBW8u39ssHlibw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:c449:10b0:6b1:9ffc:3925 with SMTP id
 006d021491bc7-6b1a04eee0fmr8204099eaf.30.1787793154365; Wed, 26 Aug 2026
 18:12:34 -0700 (PDT)
Date: Wed, 26 Aug 2026 18:12:34 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a8f8f02.1d9ded08.62e62.00c0.GAE@google.com>
Subject: [syzbot] [sound?] INFO: task hung in odev_open (5)
From: syzbot <syzbot+825b7e3a03dd072c187f@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, perex@perex.cz, 
	syzkaller-bugs@googlegroups.com, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    66fb95a52111 Merge tag 'caps-pr-20260820' of git://git.ker..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=110a5549580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a70bec3546180b6
dashboard link: https://syzkaller.appspot.com/bug?extid=825b7e3a03dd072c187f
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11d82415580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/6da0d1c4d90d/disk-66fb95a5.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/34b5360f76fd/vmlinux-66fb95a5.xz
kernel image: https://storage.googleapis.com/syzbot-assets/bea190471e9f/bzImage-66fb95a5.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+825b7e3a03dd072c187f@syzkaller.appspotmail.com

INFO: task syz.4.21:6176 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.4.21        state:D stack:27768 pid:6176  tgid:6175  ppid:5845   task_flags:0x400040 flags:0x00080002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5520 [inline]
 __schedule+0x17d4/0x5820 kernel/sched/core.c:7270
 __schedule_loop kernel/sched/core.c:7347 [inline]
 schedule+0x164/0x2b0 kernel/sched/core.c:7362
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7419
 __mutex_lock_common kernel/locking/mutex.c:726 [inline]
 __mutex_lock+0x7c1/0x1550 kernel/locking/mutex.c:821
 class_mutex_constructor include/linux/mutex.h:253 [inline]
 odev_open+0x5c/0xa0 sound/core/seq/oss/seq_oss.c:127
 chrdev_open+0x4d9/0x600 fs/char_dev.c:411
 do_dentry_open+0x816/0x1380 fs/open.c:996
 vfs_open+0x3b/0x340 fs/open.c:1101
 do_open fs/namei.c:4837 [inline]
 path_openat+0x1443/0x1d60 fs/namei.c:5000
 do_file_open+0x23e/0x4a0 fs/namei.c:5029
 do_sys_openat2+0x115/0x200 fs/open.c:1417
 do_sys_open fs/open.c:1423 [inline]
 __do_sys_openat fs/open.c:1439 [inline]
 __se_sys_openat fs/open.c:1434 [inline]
 __x64_sys_openat+0x138/0x170 fs/open.c:1434
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7efce379e0d9
RSP: 002b:00007efce46df028 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 00007efce3a25fa0 RCX: 00007efce379e0d9
RDX: 0000000000000001 RSI: 0000200000000000 RDI: 00000000ffffff9c
RBP: 00007efce3835024 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007efce3a26038 R14: 00007efce3a25fa0 R15: 00007ffec56062b8
 </TASK>
INFO: task syz.1.18:6179 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.1.18        state:D stack:27768 pid:6179  tgid:6178  ppid:5795   task_flags:0x400040 flags:0x00080002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5520 [inline]
 __schedule+0x17d4/0x5820 kernel/sched/core.c:7270
 __schedule_loop kernel/sched/core.c:7347 [inline]
 schedule+0x164/0x2b0 kernel/sched/core.c:7362
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7419
 __mutex_lock_common kernel/locking/mutex.c:726 [inline]
 __mutex_lock+0x7c1/0x1550 kernel/locking/mutex.c:821
 class_mutex_constructor include/linux/mutex.h:253 [inline]
 odev_open+0x5c/0xa0 sound/core/seq/oss/seq_oss.c:127
 chrdev_open+0x4d9/0x600 fs/char_dev.c:411
 do_dentry_open+0x816/0x1380 fs/open.c:996
 vfs_open+0x3b/0x340 fs/open.c:1101
 do_open fs/namei.c:4837 [inline]
 path_openat+0x1443/0x1d60 fs/namei.c:5000
 do_file_open+0x23e/0x4a0 fs/namei.c:5029
 do_sys_openat2+0x115/0x200 fs/open.c:1417
 do_sys_open fs/open.c:1423 [inline]
 __do_sys_openat fs/open.c:1439 [inline]
 __se_sys_openat fs/open.c:1434 [inline]
 __x64_sys_openat+0x138/0x170 fs/open.c:1434
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f0fa7b9e0d9
RSP: 002b:00007f0fa8b4c028 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 00007f0fa7e25fa0 RCX: 00007f0fa7b9e0d9
RDX: 0000000000000001 RSI: 0000200000000000 RDI: 00000000ffffff9c
RBP: 00007f0fa7c35024 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f0fa7e26038 R14: 00007f0fa7e25fa0 R15: 00007ffdda268298
 </TASK>

Showing all locks held in the system:
locks held by ksoftirqd/1/23: 2, last CPU#1:
 #0: ffff8880b873b520 (&rq->__lock){-.-.}-{2:2}, at: raw_spin_rq_lock_nested+0x2d/0x160 kernel/sched/core.c:677
 #1: ffff8880b8724408 (psi_seq){-.-.}-{0:0}, at: psi_task_switch+0x57/0x7d0 kernel/sched/psi.c:933
locks held by khungtaskd/31: 1, last CPU#0:
 #0: ffffffff8ed5a360 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:300 [inline]
 #0: ffffffff8ed5a360 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:840 [inline]
 #0: ffffffff8ed5a360 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks+0x2e/0x180 kernel/locking/lockdep.c:6793
locks held by kworker/1:2/987: 8, on CPU#1:
 #0: ffff888023292140 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:300 [inline]
 #0: ffff888023292140 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:840 [inline]
 #0: ffff888023292140 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3352 [inline]
 #0: ffff888023292140 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3470
 #1: ffffc9000489fc40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:300 [inline]
 #1: ffffc9000489fc40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:840 [inline]
 #1: ffffc9000489fc40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3352 [inline]
 #1: ffffc9000489fc40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3470
 #2: ffff88802a0d21d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff88802a0d21d8 (&dev->mutex){....}-{4:4}, at: hub_event+0x184/0x4d30 drivers/usb/core/hub.c:5907
 #3: ffff88802a4e21d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #3: ffff88802a4e21d8 (&dev->mutex){....}-{4:4}, at: usb_disconnect+0xfc/0x9a0 drivers/usb/core/hub.c:2336
 #4: ffff888032c641a0 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #4: ffff888032c641a0 (&dev->mutex){....}-{4:4}, at: __device_driver_lock drivers/base/dd.c:1171 [inline]
 #4: ffff888032c641a0 (&dev->mutex){....}-{4:4}, at: device_release_driver_internal+0xb9/0x880 drivers/base/dd.c:1369
 #5: ffffffff901a98a0 (register_mutex#6){+.+.}-{4:4}, at: class_mutex_constructor include/linux/mutex.h:253 [inline]
 #5: ffffffff901a98a0 (register_mutex#6){+.+.}-{4:4}, at: __usb_audio_disconnect sound/usb/card.c:1130 [inline]
 #5: ffffffff901a98a0 (register_mutex#6){+.+.}-{4:4}, at: usb_audio_disconnect+0x71/0x2c0 sound/usb/card.c:1164
 #6: ffff888025b6a1b0 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #6: ffff888025b6a1b0 (&dev->mutex){....}-{4:4}, at: __device_driver_lock drivers/base/dd.c:1171 [inline]
 #6: ffff888025b6a1b0 (&dev->mutex){....}-{4:4}, at: device_release_driver_internal+0xb9/0x880 drivers/base/dd.c:1369
 #7: ffffffff901a4ce0 (register_mutex#7){+.+.}-{4:4}, at: class_mutex_constructor include/linux/mutex.h:253 [inline]
 #7: ffffffff901a4ce0 (register_mutex#7){+.+.}-{4:4}, at: snd_seq_midisynth_remove+0x66/0x550 sound/core/seq/seq_midi.c:473
locks held by getty/5365: 2, on CPU#0:
 #0: ffff888036e4b0a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x25/0x70 drivers/tty/tty_ldisc.c:243
 #1: ffffc9000322b2e8 (&ldata->atomic_read_lock){+.+.}-{4:4}, at: n_tty_read+0x45a/0x1360 drivers/tty/n_tty.c:2211
locks held by kworker/0:3/5786: 3, on CPU#0:
 #0: ffff88801b06b140 ((wq_completion)events){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:300 [inline]
 #0: ffff88801b06b140 ((wq_completion)events){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:840 [inline]
 #0: ffff88801b06b140 ((wq_completion)events){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3352 [inline]
 #0: ffff88801b06b140 ((wq_completion)events){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3470
 #1: ffff8880b8624408 (psi_seq){-.-.}-{0:0}, at: psi_task_switch+0x57/0x7d0 kernel/sched/psi.c:933
 #2: ffff88807a53b250 (&data->fib_lock){+.+.}-{4:4}, at: nsim_fib_event_work+0x1fd/0x3b0 drivers/net/netdevsim/fib.c:1490
locks held by kworker/u8:4/5834: 2, last CPU#1:
 #0: ffff88803280d940 ((wq_completion)bat_events){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:300 [inline]
 #0: ffff88803280d940 ((wq_completion)bat_events){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:840 [inline]
 #0: ffff88803280d940 ((wq_completion)bat_events){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3352 [inline]
 #0: ffff88803280d940 ((wq_completion)bat_events){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3470
 #1: ffff8880b8724408 (psi_seq){-.-.}-{0:0}, at: psi_task_switch+0x57/0x7d0 kernel/sched/psi.c:933
locks held by syz.0.22/6171: 3, on CPU#1:
 #0: ffffffff901a2820 (register_mutex#4){+.+.}-{4:4}, at: class_mutex_constructor include/linux/mutex.h:253 [inline]
 #0: ffffffff901a2820 (register_mutex#4){+.+.}-{4:4}, at: odev_release+0x4b/0x70 sound/core/seq/oss/seq_oss.c:140
 #1: ffff88807e73a8b0 (&mdev->open_mutex){+.+.}-{4:4}, at: class_mutex_constructor include/linux/mutex.h:253 [inline]
 #1: ffff88807e73a8b0 (&mdev->open_mutex){+.+.}-{4:4}, at: snd_seq_oss_midi_close+0x17e/0x650 sound/core/seq/oss/seq_oss_midi.c:373
 #2: ffff88807f6e5190 (&grp->list_mutex){+.+.}-{4:4}, at: class_rwsem_write_constructor include/linux/rwsem.h:270 [inline]
 #2: ffff88807f6e5190 (&grp->list_mutex){+.+.}-{4:4}, at: snd_seq_port_disconnect+0x54/0x950 sound/core/seq/seq_ports.c:625
locks held by syz.2.19/6173: 1, on CPU#1:
 #0: ffffffff901a2820 (register_mutex#4){+.+.}-{4:4}, at: class_mutex_constructor include/linux/mutex.h:253 [inline]
 #0: ffffffff901a2820 (register_mutex#4){+.+.}-{4:4}, at: odev_release+0x4b/0x70 sound/core/seq/oss/seq_oss.c:140
locks held by syz.4.21/6176: 1, on CPU#0:
 #0: ffffffff901a2820 (register_mutex#4){+.+.}-{4:4}, at: class_mutex_constructor include/linux/mutex.h:253 [inline]
 #0: ffffffff901a2820 (register_mutex#4){+.+.}-{4:4}, at: odev_open+0x5c/0xa0 sound/core/seq/oss/seq_oss.c:127
locks held by syz.1.18/6179: 1, on CPU#0:
 #0: ffffffff901a2820 (register_mutex#4){+.+.}-{4:4}, at: class_mutex_constructor include/linux/mutex.h:253 [inline]
 #0: ffffffff901a2820 (register_mutex#4){+.+.}-{4:4}, at: odev_open+0x5c/0xa0 sound/core/seq/oss/seq_oss.c:127
locks held by syz.5.23/6545: 1, on CPU#1:
 #0: ffffffff901a2820 (register_mutex#4){+.+.}-{4:4}, at: class_mutex_constructor include/linux/mutex.h:253 [inline]
 #0: ffffffff901a2820 (register_mutex#4){+.+.}-{4:4}, at: odev_open+0x5c/0xa0 sound/core/seq/oss/seq_oss.c:127
locks held by syz.8.26/6549: 1, on CPU#1:
 #0: ffffffff901a2820 (register_mutex#4){+.+.}-{4:4}, at: class_mutex_constructor include/linux/mutex.h:253 [inline]
 #0: ffffffff901a2820 (register_mutex#4){+.+.}-{4:4}, at: odev_open+0x5c/0xa0 sound/core/seq/oss/seq_oss.c:127
locks held by syz.9.27/6550: 1, on CPU#1:
 #0: ffffffff901a2820 (register_mutex#4){+.+.}-{4:4}, at: class_mutex_constructor include/linux/mutex.h:253 [inline]
 #0: ffffffff901a2820 (register_mutex#4){+.+.}-{4:4}, at: odev_open+0x5c/0xa0 sound/core/seq/oss/seq_oss.c:127
locks held by syz.6.24/6553: 1, on CPU#1:
 #0: ffffffff901a2820 (register_mutex#4){+.+.}-{4:4}, at: class_mutex_constructor include/linux/mutex.h:253 [inline]
 #0: ffffffff901a2820 (register_mutex#4){+.+.}-{4:4}, at: odev_open+0x5c/0xa0 sound/core/seq/oss/seq_oss.c:127
locks held by syz.7.25/6561: 1, on CPU#0:
 #0: ffffffff901a2820 (register_mutex#4){+.+.}-{4:4}, at: class_mutex_constructor include/linux/mutex.h:253 [inline]
 #0: ffffffff901a2820 (register_mutex#4){+.+.}-{4:4}, at: odev_open+0x5c/0xa0 sound/core/seq/oss/seq_oss.c:127
locks held by syz.0.28/7100: 1, on CPU#0:
 #0: ffffffff901a2820 (register_mutex#4){+.+.}-{4:4}, at: class_mutex_constructor include/linux/mutex.h:253 [inline]
 #0: ffffffff901a2820 (register_mutex#4){+.+.}-{4:4}, at: odev_open+0x5c/0xa0 sound/core/seq/oss/seq_oss.c:127
locks held by syz.3.29/7115: 1, on CPU#0:
 #0: ffffffff901a2820 (register_mutex#4){+.+.}-{4:4}, at: class_mutex_constructor include/linux/mutex.h:253 [inline]
 #0: ffffffff901a2820 (register_mutex#4){+.+.}-{4:4}, at: odev_open+0x5c/0xa0 sound/core/seq/oss/seq_oss.c:127
locks held by syz.2.31/7138: 1, on CPU#1:
 #0: ffffffff901a2820 (register_mutex#4){+.+.}-{4:4}, at: class_mutex_constructor include/linux/mutex.h:253 [inline]
 #0: ffffffff901a2820 (register_mutex#4){+.+.}-{4:4}, at: odev_open+0x5c/0xa0 sound/core/seq/oss/seq_oss.c:127
locks held by syz.1.30/7141: 1, on CPU#0:
 #0: ffffffff901a2820 (register_mutex#4){+.+.}-{4:4}, at: class_mutex_constructor include/linux/mutex.h:253 [inline]
 #0: ffffffff901a2820 (register_mutex#4){+.+.}-{4:4}, at: odev_open+0x5c/0xa0 sound/core/seq/oss/seq_oss.c:127
locks held by syz.4.32/7163: 1, on CPU#1:
 #0: ffffffff901a2820 (register_mutex#4){+.+.}-{4:4}, at: class_mutex_constructor include/linux/mutex.h:253 [inline]
 #0: ffffffff901a2820 (register_mutex#4){+.+.}-{4:4}, at: odev_open+0x5c/0xa0 sound/core/seq/oss/seq_oss.c:127
locks held by syz.5.33/7346: 1, on CPU#0:
 #0: ffffffff901a2820 (register_mutex#4){+.+.}-{4:4}, at: class_mutex_constructor include/linux/mutex.h:253 [inline]
 #0: ffffffff901a2820 (register_mutex#4){+.+.}-{4:4}, at: odev_open+0x5c/0xa0 sound/core/seq/oss/seq_oss.c:127
locks held by syz.7.34/7392: 1, on CPU#0:
 #0: ffffffff901a2820 (register_mutex#4){+.+.}-{4:4}, at: class_mutex_constructor include/linux/mutex.h:253 [inline]
 #0: ffffffff901a2820 (register_mutex#4){+.+.}-{4:4}, at: odev_open+0x5c/0xa0 sound/core/seq/oss/seq_oss.c:127
locks held by syz.6.36/7396: 1, on CPU#1:
 #0: ffffffff901a2820 (register_mutex#4){+.+.}-{4:4}, at: class_mutex_constructor include/linux/mutex.h:253 [inline]
 #0: ffffffff901a2820 (register_mutex#4){+.+.}-{4:4}, at: odev_open+0x5c/0xa0 sound/core/seq/oss/seq_oss.c:127
locks held by syz.8.35/7397: 1, on CPU#0:
 #0: ffffffff901a2820 (register_mutex#4){+.+.}-{4:4}, at: class_mutex_constructor include/linux/mutex.h:253 [inline]
 #0: ffffffff901a2820 (register_mutex#4){+.+.}-{4:4}, at: odev_open+0x5c/0xa0 sound/core/seq/oss/seq_oss.c:127
locks held by syz.9.37/7401: 1, on CPU#0:
 #0: ffffffff901a2820 (register_mutex#4){+.+.}-{4:4}, at: class_mutex_constructor include/linux/mutex.h:253 [inline]
 #0: ffffffff901a2820 (register_mutex#4){+.+.}-{4:4}, at: odev_open+0x5c/0xa0 sound/core/seq/oss/seq_oss.c:127
locks held by syz.0.38/7535: 1, on CPU#1:
 #0: ffffffff901a2820 (register_mutex#4){+.+.}-{4:4}, at: class_mutex_constructor include/linux/mutex.h:253 [inline]
 #0: ffffffff901a2820 (register_mutex#4){+.+.}-{4:4}, at: odev_open+0x5c/0xa0 sound/core/seq/oss/seq_oss.c:127
locks held by syz.1.40/7594: 1, on CPU#1:
 #0: ffffffff901a2820 (register_mutex#4){+.+.}-{4:4}, at: class_mutex_constructor include/linux/mutex.h:253 [inline]
 #0: ffffffff901a2820 (register_mutex#4){+.+.}-{4:4}, at: odev_open+0x5c/0xa0 sound/core/seq/oss/seq_oss.c:127
locks held by syz.2.41/7597: 1, on CPU#1:
 #0: ffffffff901a2820 (register_mutex#4){+.+.}-{4:4}, at: class_mutex_constructor include/linux/mutex.h:253 [inline]
 #0: ffffffff901a2820 (register_mutex#4){+.+.}-{4:4}, at: odev_open+0x5c/0xa0 sound/core/seq/oss/seq_oss.c:127
locks held by syz.4.42/7600: 1, on CPU#1:
 #0: ffffffff901a2820 (register_mutex#4){+.+.}-{4:4}, at: class_mutex_constructor include/linux/mutex.h:253 [inline]
 #0: ffffffff901a2820 (register_mutex#4){+.+.}-{4:4}, at: odev_open+0x5c/0xa0 sound/core/seq/oss/seq_oss.c:127
locks held by syz.5.45/7659: 1, on CPU#1:
 #0: ffffffff901a2820 (register_mutex#4){+.+.}-{4:4}, at: class_mutex_constructor include/linux/mutex.h:253 [inline]
 #0: ffffffff901a2820 (register_mutex#4){+.+.}-{4:4}, at: odev_open+0x5c/0xa0 sound/core/seq/oss/seq_oss.c:127
locks held by syz-executor/7662: 6, on CPU#1:
 #0: ffff88801eb48460 (sb_writers#10){.+.+}-{0:0}, at: file_start_write include/linux/fs.h:2754 [inline]
 #0: ffff88801eb48460 (sb_writers#10){.+.+}-{0:0}, at: vfs_write+0x22b/0xba0 fs/read_write.c:683
 #1: ffff8880686fdc80 (&of->mutex){+.+.}-{4:4}, at: kernfs_fop_write_iter+0x1d8/0x540 fs/kernfs/file.c:336
 #2: ffffffff8ed99d60 (cgroup_mutex){+.+.}-{4:4}, at: cgroup_lock include/linux/cgroup.h:482 [inline]
 #2: ffffffff8ed99d60 (cgroup_mutex){+.+.}-{4:4}, at: cgroup_kn_lock_live+0x13c/0x230 kernel/cgroup/cgroup.c:1719
 #3: ffffffff8ebe76b0 (cpu_hotplug_lock){++++}-{0:0}, at: cgroup_attach_lock kernel/cgroup/cgroup.c:2537 [inline]
 #3: ffffffff8ebe76b0 (cpu_hotplug_lock){++++}-{0:0}, at: cgroup_procs_write_start+0x568/0x900 kernel/cgroup/cgroup.c:3175
 #4: ffffffff8ed9a0d0 (cgroup_threadgroup_rwsem){++++}-{0:0}, at: cgroup_attach_lock kernel/cgroup/cgroup.c:2543 [inline]
 #4: ffffffff8ed9a0d0 (cgroup_threadgroup_rwsem){++++}-{0:0}, at: cgroup_procs_write_start+0x574/0x900 kernel/cgroup/cgroup.c:3175
 #5: ffffffff8ed60668 (rcu_state.exp_mutex){+.+.}-{4:4}, at: exp_funnel_lock kernel/rcu/tree_exp.h:311 [inline]
 #5: ffffffff8ed60668 (rcu_state.exp_mutex){+.+.}-{4:4}, at: synchronize_rcu_expedited+0x2d0/0x770 kernel/rcu/tree_exp.h:964
locks held by syz-executor/7674: 3, on CPU#1:
 #0: ffff88801b134460 (sb_writers#9){.+.+}-{0:0}, at: file_start_write include/linux/fs.h:2754 [inline]
 #0: ffff88801b134460 (sb_writers#9){.+.+}-{0:0}, at: vfs_write+0x22b/0xba0 fs/read_write.c:683
 #1: ffff88807b3f2080 (&of->mutex){+.+.}-{4:4}, at: kernfs_fop_write_iter+0x1d8/0x540 fs/kernfs/file.c:336
 #2: ffffffff8ed99d60 (cgroup_mutex){+.+.}-{4:4}, at: cgroup_lock include/linux/cgroup.h:482 [inline]
 #2: ffffffff8ed99d60 (cgroup_mutex){+.+.}-{4:4}, at: cgroup_kn_lock_live+0x13c/0x230 kernel/cgroup/cgroup.c:1719
locks held by syz-executor/7700: 3, on CPU#1:
 #0: ffffffff902444c0 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_lock net/core/rtnetlink.c:80 [inline]
 #0: ffffffff902444c0 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_nets_lock net/core/rtnetlink.c:366 [inline]
 #0: ffffffff902444c0 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_newlink+0xc10/0x1c30 net/core/rtnetlink.c:4214
 #1: ffff88804d499610 (&wg->device_update_lock){+.+.}-{4:4}, at: wg_open+0x227/0x420 drivers/net/wireguard/device.c:50
 #2: ffffffff8ed60668 (rcu_state.exp_mutex){+.+.}-{4:4}, at: exp_funnel_lock kernel/rcu/tree_exp.h:343 [inline]
 #2: ffffffff8ed60668 (rcu_state.exp_mutex){+.+.}-{4:4}, at: synchronize_rcu_expedited+0x38d/0x770 kernel/rcu/tree_exp.h:964

=============================================

NMI backtrace for cpu 0
CPU: 0 UID: 0 PID: 31 Comm: khungtaskd Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
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
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
RIP: 0010:pv_native_safe_halt+0xf/0x20 arch/x86/kernel/paravirt.c:64
Code: 0c 95 02 c3 cc cc cc cc cc cc cc 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 66 90 0f 00 2d 93 f0 2a 00 fb f4 <e9> 4c 0b 03 00 cc cc cc cc cc cc cc cc cc cc cc cc 90 90 90 90 90
RSP: 0018:ffffc90000197e40 EFLAGS: 00000246
RAX: 00000000006f6199 RBX: ffffffff819b2b70 RCX: 8000000000000001
RDX: 0000000000000001 RSI: ffffffff8e467f31 RDI: ffffffff8c6d1880
RBP: ffffc90000197f10 R08: ffff8880b873389b R09: 1ffff110170e6713
R10: dffffc0000000000 R11: ffffed10170e6714 R12: 0000000000000000
R13: 1ffff11003c5b000 R14: 1ffff92000032fd0 R15: dffffc0000000000
FS:  0000000000000000(0000) GS:ffff888124dfd000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f33759ee000 CR3: 000000007f77a000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 arch_safe_halt arch/x86/kernel/process.c:767 [inline]
 default_idle+0x9/0x20 arch/x86/kernel/process.c:768
 default_idle_call+0x72/0xb0 kernel/sched/idle.c:122
 cpuidle_idle_call kernel/sched/idle.c:199 [inline]
 do_idle+0x2e0/0x540 kernel/sched/idle.c:355
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
