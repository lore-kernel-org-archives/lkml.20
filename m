Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794346445;
	b=p12Ugzxj7K7odg+OcQlM4vw3YkxDS/YUIhU7zrUF12cdUEr/PNdYIuZdyiF4fuM4rFOi
	 62xwCQo7SqfvfHPGTPlrCD1jH7pdbRKIkcuiPzeaNviey9YGiMUBN7jJntEONNF7Mp/BA
	 L8zmdMIBqCz+CpxnzjYCZIisvtX/7sZlDDFO0rMW3yXWUBJxbY5jPhIfuvrhljimKjkey
	 cFe4ogqetR+YkWdbWLImkW/ToY3cxcDsPyU9X/lmNfnvVqcxR9hUycMiQlm3T/ODe+Cpb
	 KnJk9YJ8lZiR2ZlJumbmrMxxoQaAz1IkKEr6DR1LIJEHBc948xjIAw9a1izxUzUy31A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794346445;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=e0NJJuk/tzgO1znOT9Akzwk6lvWDfgdQGAQjaC8tB3Y=;
	b=ivvDhSiWTDrMt3/s7I2M4tSMDJeX8AD/KxcauPBGYdIJa2nJC27B4Dk0hN4gEDgT7WCI
	 qcaq4uIseBUhw9q9L2lxIRbJR0Uev1Y2K+ouePZ2aDZYNswyf3JwlIKx/1rloBpz7JCbY
	 QLh226dxo4ABM72WYt6fjV5lJLzU5bdZqpYB8cCgh/Fvu+V2SPwejxHf7t5UPdYa4ixXV
	 lzRUBlVJ2Qo7b33y7P2gCygBmX+0HrO6ALzynnqMBg32t2pjIbBqDO+fe/S3P0G7sHoVV
	 Sqen5p2dTpBIV5W3yQ96QqoIM6qeKb+X+K2/3v2JpZiqfuycSyjFffflo+QnRwHoUdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2E0606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 21:34:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A2E0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4a45b3f0bdfso3016258b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:34:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794346444; x=1794951244;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e0NJJuk/tzgO1znOT9Akzwk6lvWDfgdQGAQjaC8tB3Y=;
        b=Q5JJl7YYQlvRIhxSjL11gMLl7C5B5z5Knv2s7TgV7OBd0yqHETkneh/iJ7ZexQibUf
         VYPQT9swomSamhG8Xy2A5FQLe2ts/GL3++jVI4gJ5+sqJjqG6MW9/szE6NqGVrXHbwlh
         VZNplM+IiuXUmaYNGMYnYnCfFqB8wuuD/odvLn80NQokN4+qSHpx+2r4XStDR+rJqot7
         KQNTADM7xyB6uUzwvy+OpchwgMtuSl7f+e6xMwNqXEQkRw+KG1AkkpY9km5CcwCBC3/e
         DWbP0Rlax1plRCMinCPOimapVj3Rl/3nNyMjKdRZmEl34PLDebZ9Qo23S/Rq4UiETGyd
         LoZA==
X-Forwarded-Encrypted: i=1; AL+hErFEP/2pnS+0Ikik1bzpo61PvRClTHq/ZzYG7hDAoXlXctAaHRmJ3LA6b/r4yJjz1FAxbfhKvM4ji15XFC0=@vger.kernel.org
X-Gm-Message-State: APuU4Z98HLzoRQFxEwrOJeBV0Ndg9NpsgwuDVbTkSLRw4B00KOD2fq4q
	+UWRowMqcIkmhklB0P9pJbO5b3JYPUn1Y1lf+7/i+fTNfXj5AMUhoAx/su1B43zYJrqpgzI8VG8
	RsGiyT0M/Rq6YhE4KyYdoc9zorXVeoIbwzpvMQU715shpqXSljUADbGG3fMU=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1691:b0:4e8:e664:f268 with SMTP id
 5614622812f47-56b96ac9cfcmr235239b6e.25.1794346444536; Tue, 10 Nov 2026
 13:34:04 -0800 (PST)
Date: Tue, 10 Nov 2026 13:34:04 -0800
In-Reply-To: <20261110132118.11265-1-diasyzhangqing@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af38dcc.b5c6bce2.3112f.0003.GAE@google.com>
Subject: Re: [syzbot] [block?] [ext4?] INFO: task hung in bdev_freeze
From: syzbot <syzbot+d4ecb9a1e5b3dcf8baec@syzkaller.appspotmail.com>
To: adilger.kernel@dilger.ca, diasyzhang@tencent.com, diasyzhangqing@gmail.com, 
	jack@suse.cz, libaokun@linux.alibaba.com, linux-ext4@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ojaswin@linux.ibm.com, ritesh.list@gmail.com, 
	syzkaller-bugs@googlegroups.com, tytso@mit.edu, yi.zhang@huawei.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
INFO: task hung in user_get_super

INFO: task syz.4.3007:21757 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.4.3007      state:D stack:0     pid:21757 tgid:21733 ppid:5332   task_flags:0x400040 flags:0x00800001
Call trace:
 __switch_to+0x2b4/0x6e4 arch/arm64/kernel/process.c:792 (T)
 context_switch kernel/sched/core.c:5584 [inline]
 __schedule+0x13a0/0x2bd4 kernel/sched/core.c:7389
 __schedule_loop kernel/sched/core.c:7466 [inline]
 schedule+0x13c/0x20c kernel/sched/core.c:7481
 schedule_preempt_disabled+0x18/0x2c kernel/sched/core.c:7538
 rwsem_down_read_slowpath+0x544/0x7f8 kernel/locking/rwsem.c:1114
 __down_read_common kernel/locking/rwsem.c:1291 [inline]
 __down_read kernel/locking/rwsem.c:1304 [inline]
 down_read+0xa0/0x2bc kernel/locking/rwsem.c:1576
 __super_lock fs/super.c:62 [inline]
 super_lock+0x258/0x344 fs/super.c:124
 user_get_super+0xb8/0x1bc fs/super.c:1022
 quotactl_block fs/quota/quota.c:889 [inline]
 __do_sys_quotactl fs/quota/quota.c:955 [inline]
 __se_sys_quotactl fs/quota/quota.c:917 [inline]
 __arm64_sys_quotactl+0x4c8/0x90c fs/quota/quota.c:917
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x244 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0xec/0x23c arch/arm64/kernel/syscall.c:121
 do_el0_svc+0x4c/0x5c arch/arm64/kernel/syscall.c:140
 el0_svc+0x60/0x1d8 arch/arm64/kernel/entry-common.c:797
 el0t_64_sync_handler+0x44/0x104 arch/arm64/kernel/entry-common.c:816
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:606

Showing all locks held in the system:
locks held by khungtaskd/32: 1, on CPU#0:
 #0: ffff800089ab5660 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff800089ab5660 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff800089ab5660 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks+0x4c/0x188 kernel/locking/lockdep.c:6871
locks held by kworker/u9:0/50: 3, last CPU#0:
 #0: ffff0000ca34d948 ((wq_completion)hci9){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3470 [inline]
 #0: ffff0000ca34d948 ((wq_completion)hci9){+.+.}-{0:0}, at: process_scheduled_works+0x8c8/0x1250 kernel/workqueue.c:3578
 #1: ffff800092057c20 ((work_completion)(&hdev->cmd_sync_work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3470 [inline]
 #1: ffff800092057c20 ((work_completion)(&hdev->cmd_sync_work)){+.+.}-{0:0}, at: process_scheduled_works+0x8d0/0x1250 kernel/workqueue.c:3578
 #2: ffff0000f0c1cea0 (&hdev->req_lock){+.+.}-{4:4}, at: hci_cmd_sync_work+0x1b0/0x380 net/bluetooth/hci_sync.c:337
locks held by getty/4498: 2, last CPU#1:
 #0: ffff0000ca5e80a0 (&tty->ldisc_sem){++++}-{0:0}, at: ldsem_down_read+0x3c/0x4c drivers/tty/tty_ldsem.c:340
 #1: ffff8000932de2e8 (&ldata->atomic_read_lock){+.+.}-{4:4}, at: n_tty_read+0x350/0xffc drivers/tty/n_tty.c:2211
locks held by kworker/1:5/5820: 3, on CPU#1:
 #0: ffff0000c002ad48 ((wq_completion)events){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3470 [inline]
 #0: ffff0000c002ad48 ((wq_completion)events){+.+.}-{0:0}, at: process_scheduled_works+0x8c8/0x1250 kernel/workqueue.c:3578
 #1: ffff800093847c20 ((work_completion)(&data->fib_event_work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3470 [inline]
 #1: ffff800093847c20 ((work_completion)(&data->fib_event_work)){+.+.}-{0:0}, at: process_scheduled_works+0x8d0/0x1250 kernel/workqueue.c:3578
 #2: ffff0000ccb4d258 (&data->fib_lock){+.+.}-{4:4}, at: nsim_fib_event_work+0x198/0x320 drivers/net/netdevsim/fib.c:1490
locks held by syz.2.3009/21731: 3, on CPU#1:
 #0: ffff0000c6600470 (&sbi->s_shutdown_lock){+.+.}-{4:4}, at: ext4_force_shutdown+0x17c/0x658 fs/ext4/ioctl.c:822
 #1: ffff0000c148f4a0 (&bdev->bd_fsfreeze_mutex){+.+.}-{4:4}, at: bdev_freeze+0x38/0x2e8 block/bdev.c:304
 #2: ffff0000d39a0478 (sb_writers#3){++++}-{0:0}, at: sb_wait_write fs/super.c:1977 [inline]
 #2: ffff0000d39a0478 (sb_writers#3){++++}-{0:0}, at: freeze_super+0x498/0xf6c fs/super.c:2241
locks held by syz.2.3009/21762: 1, on CPU#1:
 #0: ffff0000c6600470 (&sbi->s_shutdown_lock){+.+.}-{4:4}, at: ext4_force_shutdown+0x17c/0x658 fs/ext4/ioctl.c:822
locks held by syz.2.3009/21763: 1, on CPU#1:
 #0: ffff0000d39a0100 (&type->s_umount_key#32){++++}-{4:4}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff0000d39a0100 (&type->s_umount_key#32){++++}-{4:4}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff0000d39a0100 (&type->s_umount_key#32){++++}-{4:4}, at: rcuwait_wake_up+0x38/0x25c kernel/exit.c:322
locks held by syz.4.3007/21734: 5, on CPU#1:
 #0: ffff0000d6314470 (&sbi->s_shutdown_lock){+.+.}-{4:4}, at: ext4_force_shutdown+0x17c/0x658 fs/ext4/ioctl.c:822
 #1: ffff0000c148dda0 (&bdev->bd_fsfreeze_mutex){+.+.}-{4:4}, at: bdev_freeze+0x38/0x2e8 block/bdev.c:304
 #2: ffff0000d1490478 (sb_writers#3){++++}-{0:0}, at: sb_wait_write fs/super.c:1977 [inline]
 #2: ffff0000d1490478 (sb_writers#3){++++}-{0:0}, at: freeze_super+0x498/0xf6c fs/super.c:2241
 #3: ffff0000d1490100 (&type->s_umount_key#32){++++}-{4:4}, at: __super_lock fs/super.c:60 [inline]
 #3: ffff0000d1490100 (&type->s_umount_key#32){++++}-{4:4}, at: __super_lock_excl fs/super.c:75 [inline]
 #3: ffff0000d1490100 (&type->s_umount_key#32){++++}-{4:4}, at: freeze_super+0x4a0/0xf6c fs/super.c:2242
 #4: ffff0000d1490570 (sb_pagefaults){++++}-{0:0}, at: sb_wait_write fs/super.c:1977 [inline]
 #4: ffff0000d1490570 (sb_pagefaults){++++}-{0:0}, at: freeze_super+0x4b8/0xf6c fs/super.c:2246
locks held by syz.4.3007/21756: 1, on CPU#1:
 #0: ffff0000d6314470 (&sbi->s_shutdown_lock){+.+.}-{4:4}, at: ext4_force_shutdown+0x17c/0x658 fs/ext4/ioctl.c:822
locks held by syz.4.3007/21757: 1, last CPU#1:
 #0: ffff0000d1490100 (&type->s_umount_key#32){++++}-{4:4}, at: __super_lock fs/super.c:62 [inline]
 #0: ffff0000d1490100 (&type->s_umount_key#32){++++}-{4:4}, at: super_lock+0x258/0x344 fs/super.c:124
locks held by syz.1.3010/21737: 3, on CPU#1:
 #0: ffff0000ef804470 (&sbi->s_shutdown_lock){+.+.}-{4:4}, at: ext4_force_shutdown+0x17c/0x658 fs/ext4/ioctl.c:822
 #1: ffff0000c154dda0 (&bdev->bd_fsfreeze_mutex){+.+.}-{4:4}, at: bdev_freeze+0x38/0x2e8 block/bdev.c:304
 #2: ffff0000eee66478 (sb_writers#3){++++}-{0:0}, at: sb_wait_write fs/super.c:1977 [inline]
 #2: ffff0000eee66478 (sb_writers#3){++++}-{0:0}, at: freeze_super+0x498/0xf6c fs/super.c:2241
locks held by syz.1.3010/21767: 1, on CPU#0:
 #0: ffff0000ef804470 (&sbi->s_shutdown_lock){+.+.}-{4:4}, at: ext4_force_shutdown+0x17c/0x658 fs/ext4/ioctl.c:822
locks held by syz.1.3010/21768: 1, on CPU#0:
 #0: ffff0000eee66478 (sb_writers#3){++++}-{0:0}, at: __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 #0: ffff0000eee66478 (sb_writers#3){++++}-{0:0}, at: invoke_syscall+0x98/0x244 arch/arm64/kernel/syscall.c:49
locks held by kmmpd-loop4/21743: 1, last CPU#1:
 #0: ffff0000d1490478 (sb_writers#3){++++}-{0:0}, at: kmmpd+0x2fc/0x938 fs/ext4/mmp.c:173
locks held by kmmpd-loop3/21772: 1, last CPU#1:
 #0: ffff0000eedc6478 (sb_writers#3){++++}-{0:0}, at: kmmpd+0x2fc/0x938 fs/ext4/mmp.c:173
locks held by kmmpd-loop0/21796: 1, last CPU#1:
 #0: ffff0000eb87c478 (sb_writers#3){++++}-{0:0}, at: kmmpd+0x2fc/0x938 fs/ext4/mmp.c:173
locks held by kworker/u9:4/21931: 3, last CPU#0:
 #0: ffff0000c98bf148 ((wq_completion)hci8){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3470 [inline]
 #0: ffff0000c98bf148 ((wq_completion)hci8){+.+.}-{0:0}, at: process_scheduled_works+0x8c8/0x1250 kernel/workqueue.c:3578
 #1: ffff800098197c20 ((work_completion)(&hdev->cmd_sync_work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3470 [inline]
 #1: ffff800098197c20 ((work_completion)(&hdev->cmd_sync_work)){+.+.}-{0:0}, at: process_scheduled_works+0x8d0/0x1250 kernel/workqueue.c:3578
 #2: ffff0000ec4b0ea0 (&hdev->req_lock){+.+.}-{4:4}, at: hci_cmd_sync_work+0x1b0/0x380 net/bluetooth/hci_sync.c:337
locks held by kmmpd-loop9/22058: 1, last CPU#1:
 #0: ffff0000c3d98478 (sb_writers#3){++++}-{0:0}, at: kmmpd+0x2fc/0x938 fs/ext4/mmp.c:173
locks held by syz-executor/22236: 6, last CPU#1:
 #0: ffff0000d0912478 (sb_writers#6){.+.+}-{0:0}, at: file_start_write include/linux/fs.h:2765 [inline]
 #0: ffff0000d0912478 (sb_writers#6){.+.+}-{0:0}, at: vfs_write+0x248/0xa0c fs/read_write.c:663
 #1: ffff0000f6abf480 (&of->mutex){+.+.}-{4:4}, at: kernfs_fop_write_iter+0x1b0/0x3b8 fs/kernfs/file.c:336
 #2: ffff0000ca778e18 (kn->active#55){.+.+}-{0:0}, at: kernfs_get_active_of fs/kernfs/file.c:73 [inline]
 #2: ffff0000ca778e18 (kn->active#55){.+.+}-{0:0}, at: kernfs_fop_write_iter+0x1f0/0x3b8 fs/kernfs/file.c:337
 #3: ffff80008a3bd8a0 (nsim_bus_dev_list_lock){+.+.}-{4:4}, at: del_device_store+0xd8/0x2d4 drivers/net/netdevsim/bus.c:233
 #4: ffff0000cfcc6128 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1109 [inline]
 #4: ffff0000cfcc6128 (&dev->mutex){....}-{4:4}, at: __device_driver_lock+0x94/0xcc drivers/base/dd.c:1046
 #5: ffff0000cfcc5258 (&devlink->lock_key#13){+.+.}-{4:4}, at: devl_lock+0x24/0x34 net/devlink/core.c:314
locks held by syz-executor/22244: 4, last CPU#1:
 #0: ffff0000d0912478 (sb_writers#6){.+.+}-{0:0}, at: file_start_write include/linux/fs.h:2765 [inline]
 #0: ffff0000d0912478 (sb_writers#6){.+.+}-{0:0}, at: vfs_write+0x248/0xa0c fs/read_write.c:663
 #1: ffff0000ec554080 (&of->mutex){+.+.}-{4:4}, at: kernfs_fop_write_iter+0x1b0/0x3b8 fs/kernfs/file.c:336
 #2: ffff0000ca778e18 (kn->active#55){.+.+}-{0:0}, at: kernfs_get_active_of fs/kernfs/file.c:73 [inline]
 #2: ffff0000ca778e18 (kn->active#55){.+.+}-{0:0}, at: kernfs_fop_write_iter+0x1f0/0x3b8 fs/kernfs/file.c:337
 #3: ffff80008a3bd8a0 (nsim_bus_dev_list_lock){+.+.}-{4:4}, at: del_device_store+0xd8/0x2d4 drivers/net/netdevsim/bus.c:233

=============================================



Tested on:

commit:         067c5c24 Merge tag 'page_alloc-for-7.4-rc2' of git://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=110505a1580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c06331d9bb9c8204
dashboard link: https://syzkaller.appspot.com/bug?extid=d4ecb9a1e5b3dcf8baec
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
userspace arch: arm64
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1314b1a1580000

