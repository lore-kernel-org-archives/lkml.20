Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E54D4F68D5
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790632491; cv=none; b=rezYAsQTpnqsF94GXD28leVcw0WOl3YDaeSQuCzvdB9FGwSd79QGJtwZyPViCT35eH3KKPXLWmGprd9FxGkCXaKNYKvzK3ztgbuXzjFUmKJn2nx7N2vLuUooDHFZPD1GcRoZGL2LvXx6w5ka+rCkWQUoEj0okWAuPu3JkZ4OWIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790632491; c=relaxed/simple;
	bh=JL0I9mGCNP1eoe5HY3kKjgnn2k5sgqxkQG0eeUkzPRk=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=ey8uD5Dv0lS0wW/1eViOV/ukWhOKSiF/RtXdRreArbYV+WJWYK/KVYP7I1lNX+5JJpInnDG7HTRUVoU+uvGMbBCRo/+xTOMS19ouzmqoa+k6SZ8seyb4Vr5kc9wjbuftwg7I8CgjvDljPNsKRslhsSfUPxJj4WlpNbFF8HyMQ+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4eb04c0e1feso1017650b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:54:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790632486; x=1791237286;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AGuWMQVNJkqzybSFtScz87JfUnceIBwo6HsR+SfsLkI=;
        b=KK6piLeDoatoX6UrlRhhPoR2XAJyPvtFXwMaVGRKcZ8vlYexdBXiE2HLkiz+jsS3Dx
         HNaP16OkpETOWBJauCZrUb7+g1skTdJN90Es8A7jrsWf/oREa1Hp+fqGRzhwHRWfJCXF
         1LlEEGjUN0gc/TEW02JbZLwscwDzSSKH3rihcw2mk+jC+A8EiMmAFWPXybYoX8MpCbEY
         wvOLcbu//yiOQpEhD+Fr4hUfUyy7IhYU30nXZqjhQQW0jpK76owY1aiQAWwTWQzW/EN8
         isv9aVec8tjzIQNbH0jNZvQIsrtBZTxHdDjYmUeMGOQZRqeYsyTHPW4BlUEgMubgNIUV
         Q9KA==
X-Forwarded-Encrypted: i=1; AKwUvBzuLjC9WCFEjB5Pu01zJLWhThX16VFzsZc6ZH59PMibnMYWljsIrdV7R39bk+XfxDprtSX3xhldOhyEw4w=@vger.kernel.org
X-Gm-Message-State: AFuF++nwNB4dBETHfng+irjGsBBL/egpwgYxBtRWrR1PRqxdPrdl6GuE
	1LFHUpnMKmW5APvOwrZxE9Df9Y/tOUMSVDE/yG49zUYJ9QX279QOTBfpDmYR5x2ux8e6W3dcRUU
	OwajZ03R5C+6l/gdYaqt4FKugUpxOSyai0zhDeXrm/JFQLr8i+94zvt00jFg=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:19a8:b0:4b2:b653:87ff with SMTP id
 5614622812f47-4dc57e2ab22mr11846885b6e.7.1790632486246; Mon, 28 Sep 2026
 14:54:46 -0700 (PDT)
Date: Mon, 28 Sep 2026 14:54:46 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6abae226.69bd487b.a6f8c.000b.GAE@google.com>
Subject: [syzbot] [usb-storage?] INFO: task hung in usb_stor_scan_dwork
From: syzbot <syzbot+30552b4cbe99d6d91306@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, stern@rowland.harvard.edu, 
	syzkaller-bugs@googlegroups.com, usb-storage@lists.one-eyed-alien.net
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    fd179f8a05be Merge tag 'ata-7.3-rc5' of git://git.kernel.o..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1185f2c9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9d4242cb1c54cdf7
dashboard link: https://syzkaller.appspot.com/bug?extid=30552b4cbe99d6d91306
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
userspace arch: i386
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12e2a605580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/5670fe387ce2/disk-fd179f8a.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/42f36294b5d0/vmlinux-fd179f8a.xz
kernel image: https://storage.googleapis.com/syzbot-assets/ad08d8d69714/bzImage-fd179f8a.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+30552b4cbe99d6d91306@syzkaller.appspotmail.com

INFO: task kworker/0:0:9 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/0:0     state:D stack:25984 pid:9     tgid:9     ppid:2      task_flags:0x4208060 flags:0x00080000
Workqueue: events_freezable usb_stor_scan_dwork
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5533 [inline]
 __schedule+0x17db/0x58f0 kernel/sched/core.c:7284
 __schedule_loop kernel/sched/core.c:7361 [inline]
 schedule+0x164/0x2b0 kernel/sched/core.c:7376
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7433
 __mutex_lock_common kernel/locking/mutex.c:726 [inline]
 __mutex_lock+0x7c1/0x1550 kernel/locking/mutex.c:821
 usb_stor_scan_dwork+0xec/0x2c0 drivers/usb/storage/usb.c:987
 process_one_work kernel/workqueue.c:3396 [inline]
 process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3479
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3560
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
INFO: task syz.5.17:5894 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.5.17        state:D stack:25856 pid:5894  tgid:5894  ppid:5754   task_flags:0x400040 flags:0x08080002
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
 usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
 chrdev_open+0x4d9/0x600 fs/char_dev.c:411
 do_dentry_open+0x816/0x1380 fs/open.c:996
 vfs_open+0x3b/0x340 fs/open.c:1101
 do_open fs/namei.c:4837 [inline]
 path_openat+0x1443/0x1d60 fs/namei.c:5000
 do_file_open+0x23e/0x4a0 fs/namei.c:5029
 do_sys_openat2+0x115/0x200 fs/open.c:1417
 do_sys_open fs/open.c:1423 [inline]
 __do_compat_sys_openat fs/open.c:1485 [inline]
 __se_compat_sys_openat fs/open.c:1483 [inline]
 __ia32_compat_sys_openat+0x131/0x160 fs/open.c:1483
 do_syscall_32_irqs_on arch/x86/entry/syscall_32.c:79 [inline]
 do_int80_emulation+0x198/0x500 arch/x86/entry/syscall_32.c:166
 asm_int80_emulation+0x1a/0x20 arch/x86/include/asm/idtentry.h:598
RIP: 0023:0xf71475ab
RSP: 002b:00000000f752f58c EFLAGS: 00000246 ORIG_RAX: 0000000000000127
RAX: ffffffffffffffda RBX: 00000000ffffff9c RCX: 00000000f752f650
RDX: 0000000000080100 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000206 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>
INFO: task syz.1.18:5895 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.1.18        state:D stack:26728 pid:5895  tgid:5895  ppid:5760   task_flags:0x400040 flags:0x08080002
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
 usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
 chrdev_open+0x4d9/0x600 fs/char_dev.c:411
 do_dentry_open+0x816/0x1380 fs/open.c:996
 vfs_open+0x3b/0x340 fs/open.c:1101
 do_open fs/namei.c:4837 [inline]
 path_openat+0x1443/0x1d60 fs/namei.c:5000
 do_file_open+0x23e/0x4a0 fs/namei.c:5029
 do_sys_openat2+0x115/0x200 fs/open.c:1417
 do_sys_open fs/open.c:1423 [inline]
 __do_compat_sys_openat fs/open.c:1485 [inline]
 __se_compat_sys_openat fs/open.c:1483 [inline]
 __ia32_compat_sys_openat+0x131/0x160 fs/open.c:1483
 do_syscall_32_irqs_on arch/x86/entry/syscall_32.c:79 [inline]
 do_int80_emulation+0x198/0x500 arch/x86/entry/syscall_32.c:166
 asm_int80_emulation+0x1a/0x20 arch/x86/include/asm/idtentry.h:598
RIP: 0023:0xf71e75ab
RSP: 002b:00000000f75cf58c EFLAGS: 00000246 ORIG_RAX: 0000000000000127
RAX: ffffffffffffffda RBX: 00000000ffffff9c RCX: 00000000f75cf650
RDX: 0000000000080100 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000206 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>
INFO: task kworker/0:6:5896 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/0:6     state:D stack:25248 pid:5896  tgid:5896  ppid:2      task_flags:0x4208060 flags:0x00080000
Workqueue: events_freezable usb_stor_scan_dwork
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5533 [inline]
 __schedule+0x17db/0x58f0 kernel/sched/core.c:7284
 __schedule_loop kernel/sched/core.c:7361 [inline]
 schedule+0x164/0x2b0 kernel/sched/core.c:7376
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7433
 __mutex_lock_common kernel/locking/mutex.c:726 [inline]
 __mutex_lock+0x7c1/0x1550 kernel/locking/mutex.c:821
 usb_stor_scan_dwork+0xec/0x2c0 drivers/usb/storage/usb.c:987
 process_one_work kernel/workqueue.c:3396 [inline]
 process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3479
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3560
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
INFO: task kworker/0:7:5897 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/0:7     state:D stack:26632 pid:5897  tgid:5897  ppid:2      task_flags:0x4208060 flags:0x00080000
Workqueue: events_freezable usb_stor_scan_dwork
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5533 [inline]
 __schedule+0x17db/0x58f0 kernel/sched/core.c:7284
 __schedule_loop kernel/sched/core.c:7361 [inline]
 schedule+0x164/0x2b0 kernel/sched/core.c:7376
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7433
 __mutex_lock_common kernel/locking/mutex.c:726 [inline]
 __mutex_lock+0x7c1/0x1550 kernel/locking/mutex.c:821
 usb_stor_scan_dwork+0xec/0x2c0 drivers/usb/storage/usb.c:987
 process_one_work kernel/workqueue.c:3396 [inline]
 process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3479
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3560
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
INFO: task syz.3.20:5904 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.3.20        state:D stack:26880 pid:5904  tgid:5904  ppid:5768   task_flags:0x400040 flags:0x08080002
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
 usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
 chrdev_open+0x4d9/0x600 fs/char_dev.c:411
 do_dentry_open+0x816/0x1380 fs/open.c:996
 vfs_open+0x3b/0x340 fs/open.c:1101
 do_open fs/namei.c:4837 [inline]
 path_openat+0x1443/0x1d60 fs/namei.c:5000
 do_file_open+0x23e/0x4a0 fs/namei.c:5029
 do_sys_openat2+0x115/0x200 fs/open.c:1417
 do_sys_open fs/open.c:1423 [inline]
 __do_compat_sys_openat fs/open.c:1485 [inline]
 __se_compat_sys_openat fs/open.c:1483 [inline]
 __ia32_compat_sys_openat+0x131/0x160 fs/open.c:1483
 do_syscall_32_irqs_on arch/x86/entry/syscall_32.c:79 [inline]
 do_int80_emulation+0x198/0x500 arch/x86/entry/syscall_32.c:166
 asm_int80_emulation+0x1a/0x20 arch/x86/include/asm/idtentry.h:598
RIP: 0023:0xf71275ab
RSP: 002b:00000000f750f58c EFLAGS: 00000246 ORIG_RAX: 0000000000000127
RAX: ffffffffffffffda RBX: 00000000ffffff9c RCX: 00000000f750f650
RDX: 0000000000080100 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000206 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>
INFO: task syz.2.19:5908 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.2.19        state:D stack:26520 pid:5908  tgid:5908  ppid:5763   task_flags:0x400040 flags:0x08080002
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
 usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
 chrdev_open+0x4d9/0x600 fs/char_dev.c:411
 do_dentry_open+0x816/0x1380 fs/open.c:996
 vfs_open+0x3b/0x340 fs/open.c:1101
 do_open fs/namei.c:4837 [inline]
 path_openat+0x1443/0x1d60 fs/namei.c:5000
 do_file_open+0x23e/0x4a0 fs/namei.c:5029
 do_sys_openat2+0x115/0x200 fs/open.c:1417
 do_sys_open fs/open.c:1423 [inline]
 __do_compat_sys_openat fs/open.c:1485 [inline]
 __se_compat_sys_openat fs/open.c:1483 [inline]
 __ia32_compat_sys_openat+0x131/0x160 fs/open.c:1483
 do_syscall_32_irqs_on arch/x86/entry/syscall_32.c:79 [inline]
 do_int80_emulation+0x198/0x500 arch/x86/entry/syscall_32.c:166
 asm_int80_emulation+0x1a/0x20 arch/x86/include/asm/idtentry.h:598
RIP: 0023:0xf71775ab
RSP: 002b:00000000f755f58c EFLAGS: 00000246 ORIG_RAX: 0000000000000127
RAX: ffffffffffffffda RBX: 00000000ffffff9c RCX: 00000000f755f650
RDX: 0000000000080100 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000206 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>
INFO: task syz.4.21:5909 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.4.21        state:D stack:26888 pid:5909  tgid:5909  ppid:5765   task_flags:0x400040 flags:0x08080002
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
 usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
 chrdev_open+0x4d9/0x600 fs/char_dev.c:411
 do_dentry_open+0x816/0x1380 fs/open.c:996
 vfs_open+0x3b/0x340 fs/open.c:1101
 do_open fs/namei.c:4837 [inline]
 path_openat+0x1443/0x1d60 fs/namei.c:5000
 do_file_open+0x23e/0x4a0 fs/namei.c:5029
 do_sys_openat2+0x115/0x200 fs/open.c:1417
 do_sys_open fs/open.c:1423 [inline]
 __do_compat_sys_openat fs/open.c:1485 [inline]
 __se_compat_sys_openat fs/open.c:1483 [inline]
 __ia32_compat_sys_openat+0x131/0x160 fs/open.c:1483
 do_syscall_32_irqs_on arch/x86/entry/syscall_32.c:79 [inline]
 do_int80_emulation+0x198/0x500 arch/x86/entry/syscall_32.c:166
 asm_int80_emulation+0x1a/0x20 arch/x86/include/asm/idtentry.h:598
RIP: 0023:0xf71575ab
RSP: 002b:00000000f753f58c EFLAGS: 00000246 ORIG_RAX: 0000000000000127
RAX: ffffffffffffffda RBX: 00000000ffffff9c RCX: 00000000f753f650
RDX: 0000000000080100 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000206 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>
INFO: task kworker/0:10:5910 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/0:10    state:D stack:26080 pid:5910  tgid:5910  ppid:2      task_flags:0x4208060 flags:0x00080000
Workqueue: events_freezable usb_stor_scan_dwork
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5533 [inline]
 __schedule+0x17db/0x58f0 kernel/sched/core.c:7284
 __schedule_loop kernel/sched/core.c:7361 [inline]
 schedule+0x164/0x2b0 kernel/sched/core.c:7376
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7433
 __mutex_lock_common kernel/locking/mutex.c:726 [inline]
 __mutex_lock+0x7c1/0x1550 kernel/locking/mutex.c:821
 usb_stor_scan_dwork+0xec/0x2c0 drivers/usb/storage/usb.c:987
 process_one_work kernel/workqueue.c:3396 [inline]
 process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3479
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3560
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
INFO: task kworker/0:12:5921 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/0:12    state:D stack:27616 pid:5921  tgid:5921  ppid:2      task_flags:0x4208060 flags:0x00080000
Workqueue: events_freezable usb_stor_scan_dwork
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5533 [inline]
 __schedule+0x17db/0x58f0 kernel/sched/core.c:7284
 __schedule_loop kernel/sched/core.c:7361 [inline]
 schedule+0x164/0x2b0 kernel/sched/core.c:7376
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7433
 __mutex_lock_common kernel/locking/mutex.c:726 [inline]
 __mutex_lock+0x7c1/0x1550 kernel/locking/mutex.c:821
 usb_stor_scan_dwork+0xec/0x2c0 drivers/usb/storage/usb.c:987
 process_one_work kernel/workqueue.c:3396 [inline]
 process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3479
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3560
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Future hung task reports are suppressed, see sysctl kernel.hung_task_warnings

Showing all locks held in the system:
locks held by kworker/0:0/9: 3, on CPU#0:
 #0: ffff88801b06a140 ((wq_completion)events_freezable){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88801b06a140 ((wq_completion)events_freezable){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88801b06a140 ((wq_completion)events_freezable){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff88801b06a140 ((wq_completion)events_freezable){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc900000e7c40 ((work_completion)(&(&us->scan_dwork)->work)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc900000e7c40 ((work_completion)(&(&us->scan_dwork)->work)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc900000e7c40 ((work_completion)(&(&us->scan_dwork)->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc900000e7c40 ((work_completion)(&(&us->scan_dwork)->work)){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffff88807cf70ef0 (&us_interface_key[i]){+.+.}-{4:4}, at: usb_stor_scan_dwork+0xec/0x2c0 drivers/usb/storage/usb.c:987
locks held by kworker/0:1/10: 6, on CPU#0:
 #0: ffff8880222ad540 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff8880222ad540 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff8880222ad540 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff8880222ad540 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc900000f7c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc900000f7c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc900000f7c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc900000f7c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffff888029f641d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff888029f641d8 (&dev->mutex){....}-{4:4}, at: hub_event+0x184/0x4d30 drivers/usb/core/hub.c:5912
 #3: ffff888033c871d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #3: ffff888033c871d8 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x450 drivers/base/dd.c:1073
 #4: ffff88805b8b51a0 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #4: ffff88805b8b51a0 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x450 drivers/base/dd.c:1073
 #5: ffff888077458ef0 (&us_interface_key[i]){+.+.}-{4:4}, at: ene_ub6250_probe+0x34e/0x5f0 drivers/usb/storage/ene_ub6250.c:2360
locks held by pr/ttyS0/16: 2, last CPU#1:
 #0: ffffffff8ec36538 (console_srcu){....}-{0:0}, at: rcu_try_lock_acquire include/linux/rcupdate.h:314 [inline]
 #0: ffffffff8ec36538 (console_srcu){....}-{0:0}, at: srcu_read_lock_nmisafe include/linux/srcu.h:439 [inline]
 #0: ffffffff8ec36538 (console_srcu){....}-{0:0}, at: console_srcu_read_lock+0x30/0x60 kernel/printk/printk.c:291
 #1: ffffffff9ad432d8 (&port_lock_key){-.-.}-{3:3}, at: __uart_port_lock_irqsave include/linux/serial_core.h:613 [inline]
 #1: ffffffff9ad432d8 (&port_lock_key){-.-.}-{3:3}, at: univ8250_console_device_lock+0x67/0xc0 drivers/tty/serial/8250/8250_core.c:413
locks held by kworker/1:1/30: 3, on CPU#1:
 #0: ffff88801b06a140 ((wq_completion)events_freezable){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88801b06a140 ((wq_completion)events_freezable){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88801b06a140 ((wq_completion)events_freezable){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff88801b06a140 ((wq_completion)events_freezable){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc90000a57c40 ((work_completion)(&(&us->scan_dwork)->work)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90000a57c40 ((work_completion)(&(&us->scan_dwork)->work)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90000a57c40 ((work_completion)(&(&us->scan_dwork)->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc90000a57c40 ((work_completion)(&(&us->scan_dwork)->work)){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffff88807baa4ef0 (&us_interface_key[i]){+.+.}-{4:4}, at: usb_stor_scan_dwork+0xec/0x2c0 drivers/usb/storage/usb.c:987
locks held by khungtaskd/32: 1, last CPU#0:
 #0: ffffffff8ed5c920 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffffffff8ed5c920 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffffffff8ed5c920 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks+0x2e/0x180 kernel/locking/lockdep.c:6871
locks held by kworker/0:2/987: 6, on CPU#0:
 #0: ffff8880222ad540 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff8880222ad540 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff8880222ad540 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff8880222ad540 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc900049f7c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc900049f7c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc900049f7c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc900049f7c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffff88802a0ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff88802a0ac1d8 (&dev->mutex){....}-{4:4}, at: hub_event+0x184/0x4d30 drivers/usb/core/hub.c:5912
 #3: ffff88807ef1e1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #3: ffff88807ef1e1d8 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x450 drivers/base/dd.c:1073
 #4: ffff88807fbf81a0 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #4: ffff88807fbf81a0 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x450 drivers/base/dd.c:1073
 #5: ffff88807a670ef0 (&us_interface_key[i]){+.+.}-{4:4}, at: ene_ub6250_probe+0x34e/0x5f0 drivers/usb/storage/ene_ub6250.c:2360
locks held by kworker/1:2/1209: 6, on CPU#1:
 #0: ffff8880222ad540 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff8880222ad540 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff8880222ad540 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff8880222ad540 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc900052cfc40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc900052cfc40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc900052cfc40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc900052cfc40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffff888029ecf1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff888029ecf1d8 (&dev->mutex){....}-{4:4}, at: hub_event+0x184/0x4d30 drivers/usb/core/hub.c:5912
 #3: ffff8880358f71d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #3: ffff8880358f71d8 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x450 drivers/base/dd.c:1073
 #4: ffff888029a281a0 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #4: ffff888029a281a0 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x450 drivers/base/dd.c:1073
 #5: ffff88807baa4ef0 (&us_interface_key[i]){+.+.}-{4:4}, at: ene_ub6250_probe+0x34e/0x5f0 drivers/usb/storage/ene_ub6250.c:2360
locks held by klogd/4973: 1, last CPU#0:
 #0: ffffffff8ed5c920 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffffffff8ed5c920 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffffffff8ed5c920 (rcu_read_lock){....}-{1:3}, at: sock_def_readable+0xae/0x550 net/core/sock.c:3665
locks held by kworker/0:3/5350: 6, on CPU#0:
 #0: ffff8880222ad540 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff8880222ad540 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff8880222ad540 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff8880222ad540 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc900036b7c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc900036b7c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc900036b7c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc900036b7c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffff88802a0371d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff88802a0371d8 (&dev->mutex){....}-{4:4}, at: hub_event+0x184/0x4d30 drivers/usb/core/hub.c:5912
 #3: ffff8880226b21d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #3: ffff8880226b21d8 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x450 drivers/base/dd.c:1073
 #4: ffff88807a9631a0 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #4: ffff88807a9631a0 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x450 drivers/base/dd.c:1073
 #5: ffff88807c5c0ef0 (&us_interface_key[i]){+.+.}-{4:4}, at: ene_ub6250_probe+0x34e/0x5f0 drivers/usb/storage/ene_ub6250.c:2360
locks held by getty/5376: 2, on CPU#0:
 #0: ffff888036c240a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x25/0x70 drivers/tty/tty_ldisc.c:243
 #1: ffffc9000322b2e8 (&ldata->atomic_read_lock){+.+.}-{4:4}, at: n_tty_read+0x45a/0x1360 drivers/tty/n_tty.c:2211
locks held by udevd/5694: 4, on CPU#1:
 #0: ffff888022350bd8 (&p->lock){+.+.}-{4:4}, at: seq_read_iter+0xa4/0xca0 fs/seq_file.c:183
 #1: ffff888032938080 (&of->mutex#2){+.+.}-{4:4}, at: kernfs_seq_start+0x5d/0x420 fs/kernfs/file.c:165
 #2: ffff888034b781e8 (kn->active#30){.+.+}-{0:0}, at: kernfs_get_active_of fs/kernfs/file.c:73 [inline]
 #2: ffff888034b781e8 (kn->active#30){.+.+}-{0:0}, at: kernfs_seq_start+0xb2/0x420 fs/kernfs/file.c:166
 #3: ffff8880226b21d8 (&dev->mutex){....}-{4:4}, at: device_lock_interruptible include/linux/device.h:1109 [inline]
 #3: ffff8880226b21d8 (&dev->mutex){....}-{4:4}, at: manufacturer_show+0x26/0xa0 drivers/usb/core/sysfs.c:142
locks held by kworker/1:3/5741: 6, on CPU#1:
 #0: ffff8880222ad540 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff8880222ad540 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff8880222ad540 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff8880222ad540 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc90003977c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90003977c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90003977c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc90003977c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffff88802a1921d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff88802a1921d8 (&dev->mutex){....}-{4:4}, at: hub_event+0x184/0x4d30 drivers/usb/core/hub.c:5912
 #3: ffff88805c8d61d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #3: ffff88805c8d61d8 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x450 drivers/base/dd.c:1073
 #4: ffff888034d4e1a0 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #4: ffff888034d4e1a0 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x450 drivers/base/dd.c:1073
 #5: ffff88805cbc0ef0 (&us_interface_key[i]){+.+.}-{4:4}, at: ene_ub6250_probe+0x34e/0x5f0 drivers/usb/storage/ene_ub6250.c:2360
locks held by kworker/0:4/5748: 6, on CPU#0:
 #0: ffff8880222ad540 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff8880222ad540 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff8880222ad540 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff8880222ad540 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc90003947c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90003947c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90003947c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc90003947c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffff888029ffa1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff888029ffa1d8 (&dev->mutex){....}-{4:4}, at: hub_event+0x184/0x4d30 drivers/usb/core/hub.c:5912
 #3: ffff8880226b01d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #3: ffff8880226b01d8 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x450 drivers/base/dd.c:1073
 #4: ffff88807ab941a0 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #4: ffff88807ab941a0 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x450 drivers/base/dd.c:1073
 #5: ffff88807a6d4ef0 (&us_interface_key[i]){+.+.}-{4:4}, at: ene_ub6250_probe+0x34e/0x5f0 drivers/usb/storage/ene_ub6250.c:2360
locks held by udevd/5759: 4, on CPU#1:
 #0: ffff888078590ab8 (&p->lock){+.+.}-{4:4}, at: seq_read_iter+0xa4/0xca0 fs/seq_file.c:183
 #1: ffff88805a616080 (&of->mutex#2){+.+.}-{4:4}, at: kernfs_seq_start+0x5d/0x420 fs/kernfs/file.c:165
 #2: ffff88807ba07698 (kn->active#30){.+.+}-{0:0}, at: kernfs_get_active_of fs/kernfs/file.c:73 [inline]
 #2: ffff88807ba07698 (kn->active#30){.+.+}-{0:0}, at: kernfs_seq_start+0xb2/0x420 fs/kernfs/file.c:166
 #3: ffff88801dbda1d8 (&dev->mutex){....}-{4:4}, at: device_lock_interruptible include/linux/device.h:1109 [inline]
 #3: ffff88801dbda1d8 (&dev->mutex){....}-{4:4}, at: manufacturer_show+0x26/0xa0 drivers/usb/core/sysfs.c:142
locks held by udevd/5764: 4, on CPU#0:
 #0: ffff88807889b3f8 (&p->lock){+.+.}-{4:4}, at: seq_read_iter+0xa4/0xca0 fs/seq_file.c:183
 #1: ffff888071e3bc80 (&of->mutex#2){+.+.}-{4:4}, at: kernfs_seq_start+0x5d/0x420 fs/kernfs/file.c:165
 #2: ffff8880346ff1e8 (kn->active#30){.+.+}-{0:0}, at: kernfs_get_active_of fs/kernfs/file.c:73 [inline]
 #2: ffff8880346ff1e8 (kn->active#30){.+.+}-{0:0}, at: kernfs_seq_start+0xb2/0x420 fs/kernfs/file.c:166
 #3: ffff888033c871d8 (&dev->mutex){....}-{4:4}, at: device_lock_interruptible include/linux/device.h:1109 [inline]
 #3: ffff888033c871d8 (&dev->mutex){....}-{4:4}, at: manufacturer_show+0x26/0xa0 drivers/usb/core/sysfs.c:142
locks held by udevd/5767: 4, on CPU#1:
 #0: ffff88807889b1b8 (&p->lock){+.+.}-{4:4}, at: seq_read_iter+0xa4/0xca0 fs/seq_file.c:183
 #1: ffff888071ced480 (&of->mutex#2){+.+.}-{4:4}, at: kernfs_seq_start+0x5d/0x420 fs/kernfs/file.c:165
 #2: ffff888035707968 (kn->active#30){.+.+}-{0:0}, at: kernfs_get_active_of fs/kernfs/file.c:73 [inline]
 #2: ffff888035707968 (kn->active#30){.+.+}-{0:0}, at: kernfs_seq_start+0xb2/0x420 fs/kernfs/file.c:166
 #3: ffff88807ef1e1d8 (&dev->mutex){....}-{4:4}, at: device_lock_interruptible include/linux/device.h:1109 [inline]
 #3: ffff88807ef1e1d8 (&dev->mutex){....}-{4:4}, at: manufacturer_show+0x26/0xa0 drivers/usb/core/sysfs.c:142
locks held by kworker/1:4/5833: 6, on CPU#1:
 #0: ffff8880222ad540 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff8880222ad540 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff8880222ad540 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff8880222ad540 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc900032a7c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc900032a7c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc900032a7c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc900032a7c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffff88802a28d1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff88802a28d1d8 (&dev->mutex){....}-{4:4}, at: hub_event+0x184/0x4d30 drivers/usb/core/hub.c:5912
 #3: ffff88805b3181d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #3: ffff88805b3181d8 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x450 drivers/base/dd.c:1073
 #4: ffff88805c8dc1a0 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #4: ffff88805c8dc1a0 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x450 drivers/base/dd.c:1073
 #5: ffff888035e30ef0 (&us_interface_key[i]){+.+.}-{4:4}, at: ene_ub6250_probe+0x34e/0x5f0 drivers/usb/storage/ene_ub6250.c:2360
locks held by kworker/1:5/5851: 6, on CPU#1:
 #0: ffff8880222ad540 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff8880222ad540 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff8880222ad540 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff8880222ad540 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc90003237c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90003237c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90003237c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc90003237c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffff88802a1d01d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff88802a1d01d8 (&dev->mutex){....}-{4:4}, at: hub_event+0x184/0x4d30 drivers/usb/core/hub.c:5912
 #3: ffff88807e53b1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #3: ffff88807e53b1d8 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x450 drivers/base/dd.c:1073
 #4: ffff88807b7eb1a0 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #4: ffff88807b7eb1a0 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x450 drivers/base/dd.c:1073
 #5: ffff88805cbc4ef0 (&us_interface_key[i]){+.+.}-{4:4}, at: ene_ub6250_probe+0x34e/0x5f0 drivers/usb/storage/ene_ub6250.c:2360
locks held by kworker/1:7/5880: 3, on CPU#1:
 #0: ffff88801b06a140 ((wq_completion)events_freezable){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88801b06a140 ((wq_completion)events_freezable){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88801b06a140 ((wq_completion)events_freezable){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff88801b06a140 ((wq_completion)events_freezable){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc90003177c40 ((work_completion)(&(&us->scan_dwork)->work)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90003177c40 ((work_completion)(&(&us->scan_dwork)->work)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90003177c40 ((work_completion)(&(&us->scan_dwork)->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc90003177c40 ((work_completion)(&(&us->scan_dwork)->work)){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffff888035e30ef0 (&us_interface_key[i]){+.+.}-{4:4}, at: usb_stor_scan_dwork+0xec/0x2c0 drivers/usb/storage/usb.c:987
locks held by syz.5.17/5894: 1, on CPU#1:
 #0: ffff88802a0ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff88802a0ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
locks held by syz.1.18/5895: 1, on CPU#1:
 #0: ffff88802a0ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff88802a0ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
locks held by kworker/0:6/5896: 3, on CPU#0:
 #0: ffff88801b06a140 ((wq_completion)events_freezable){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88801b06a140 ((wq_completion)events_freezable){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88801b06a140 ((wq_completion)events_freezable){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff88801b06a140 ((wq_completion)events_freezable){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc90003167c40 ((work_completion)(&(&us->scan_dwork)->work)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90003167c40 ((work_completion)(&(&us->scan_dwork)->work)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90003167c40 ((work_completion)(&(&us->scan_dwork)->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc90003167c40 ((work_completion)(&(&us->scan_dwork)->work)){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffff88807c5c0ef0 (&us_interface_key[i]){+.+.}-{4:4}, at: usb_stor_scan_dwork+0xec/0x2c0 drivers/usb/storage/usb.c:987
locks held by kworker/0:7/5897: 3, on CPU#0:
 #0: ffff88801b06a140 ((wq_completion)events_freezable){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88801b06a140 ((wq_completion)events_freezable){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88801b06a140 ((wq_completion)events_freezable){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff88801b06a140 ((wq_completion)events_freezable){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc90003157c40 ((work_completion)(&(&us->scan_dwork)->work)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90003157c40 ((work_completion)(&(&us->scan_dwork)->work)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90003157c40 ((work_completion)(&(&us->scan_dwork)->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc90003157c40 ((work_completion)(&(&us->scan_dwork)->work)){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffff88807a670ef0 (&us_interface_key[i]){+.+.}-{4:4}, at: usb_stor_scan_dwork+0xec/0x2c0 drivers/usb/storage/usb.c:987
locks held by syz.3.20/5904: 1, on CPU#1:
 #0: ffff88802a0ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff88802a0ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
locks held by kworker/0:8/5905: 6, on CPU#0:
 #0: ffff8880222ad540 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff8880222ad540 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff8880222ad540 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff8880222ad540 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc90003647c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90003647c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90003647c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc90003647c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffff88802a06e1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff88802a06e1d8 (&dev->mutex){....}-{4:4}, at: hub_event+0x184/0x4d30 drivers/usb/core/hub.c:5912
 #3: ffff88807e03b1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #3: ffff88807e03b1d8 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x450 drivers/base/dd.c:1073
 #4: ffff88807ab921a0 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #4: ffff88807ab921a0 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x450 drivers/base/dd.c:1073
 #5: ffff88807cf70ef0 (&us_interface_key[i]){+.+.}-{4:4}, at: ene_ub6250_probe+0x34e/0x5f0 drivers/usb/storage/ene_ub6250.c:2360
locks held by udevd/5907: 4, on CPU#0:
 #0: ffff888078590518 (&p->lock){+.+.}-{4:4}, at: seq_read_iter+0xa4/0xca0 fs/seq_file.c:183
 #1: ffff8880339f4480 (&of->mutex#2){+.+.}-{4:4}, at: kernfs_seq_start+0x5d/0x420 fs/kernfs/file.c:165
 #2: ffff888034b42d28 (kn->active#30){.+.+}-{0:0}, at: kernfs_get_active_of fs/kernfs/file.c:73 [inline]
 #2: ffff888034b42d28 (kn->active#30){.+.+}-{0:0}, at: kernfs_seq_start+0xb2/0x420 fs/kernfs/file.c:166
 #3: ffff88807e03b1d8 (&dev->mutex){....}-{4:4}, at: device_lock_interruptible include/linux/device.h:1109 [inline]
 #3: ffff88807e03b1d8 (&dev->mutex){....}-{4:4}, at: manufacturer_show+0x26/0xa0 drivers/usb/core/sysfs.c:142
locks held by syz.2.19/5908: 1, on CPU#1:
 #0: ffff88802a0ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff88802a0ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
locks held by syz.4.21/5909: 1, on CPU#0:
 #0: ffff88802a0ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff88802a0ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
locks held by kworker/0:10/5910: 3, on CPU#0:
 #0: ffff88801b06a140 ((wq_completion)events_freezable){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88801b06a140 ((wq_completion)events_freezable){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88801b06a140 ((wq_completion)events_freezable){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff88801b06a140 ((wq_completion)events_freezable){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc90003607c40 ((work_completion)(&(&us->scan_dwork)->work)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90003607c40 ((work_completion)(&(&us->scan_dwork)->work)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90003607c40 ((work_completion)(&(&us->scan_dwork)->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc90003607c40 ((work_completion)(&(&us->scan_dwork)->work)){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffff888077458ef0 (&us_interface_key[i]){+.+.}-{4:4}, at: usb_stor_scan_dwork+0xec/0x2c0 drivers/usb/storage/usb.c:987
locks held by kworker/0:12/5921: 3, on CPU#0:
 #0: ffff88801b06a140 ((wq_completion)events_freezable){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88801b06a140 ((wq_completion)events_freezable){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88801b06a140 ((wq_completion)events_freezable){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff88801b06a140 ((wq_completion)events_freezable){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc90003117c40 ((work_completion)(&(&us->scan_dwork)->work)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90003117c40 ((work_completion)(&(&us->scan_dwork)->work)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90003117c40 ((work_completion)(&(&us->scan_dwork)->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc90003117c40 ((work_completion)(&(&us->scan_dwork)->work)){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffff88807a6d4ef0 (&us_interface_key[i]){+.+.}-{4:4}, at: usb_stor_scan_dwork+0xec/0x2c0 drivers/usb/storage/usb.c:987
locks held by kworker/0:13/5922: 6, on CPU#0:
 #0: ffff8880222ad540 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff8880222ad540 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff8880222ad540 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff8880222ad540 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc900020dfc40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc900020dfc40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc900020dfc40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc900020dfc40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffff88802a2071d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff88802a2071d8 (&dev->mutex){....}-{4:4}, at: hub_event+0x184/0x4d30 drivers/usb/core/hub.c:5912
 #3: ffff88801dbda1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #3: ffff88801dbda1d8 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x450 drivers/base/dd.c:1073
 #4: ffff88807e5901a0 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #4: ffff88807e5901a0 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x450 drivers/base/dd.c:1073
 #5: ffff88807d604ef0 (&us_interface_key[i]){+.+.}-{4:4}, at: ene_ub6250_probe+0x34e/0x5f0 drivers/usb/storage/ene_ub6250.c:2360
locks held by udevd/5937: 4, on CPU#0:
 #0: ffff88807d3e6098 (&p->lock){+.+.}-{4:4}, at: seq_read_iter+0xa4/0xca0 fs/seq_file.c:183
 #1: ffff888057349880 (&of->mutex#2){+.+.}-{4:4}, at: kernfs_seq_start+0x5d/0x420 fs/kernfs/file.c:165
 #2: ffff8880580d8878 (kn->active#30){.+.+}-{0:0}, at: kernfs_get_active_of fs/kernfs/file.c:73 [inline]
 #2: ffff8880580d8878 (kn->active#30){.+.+}-{0:0}, at: kernfs_seq_start+0xb2/0x420 fs/kernfs/file.c:166
 #3: ffff8880358f71d8 (&dev->mutex){....}-{4:4}, at: device_lock_interruptible include/linux/device.h:1109 [inline]
 #3: ffff8880358f71d8 (&dev->mutex){....}-{4:4}, at: manufacturer_show+0x26/0xa0 drivers/usb/core/sysfs.c:142
locks held by udevd/5941: 4, on CPU#1:
 #0: ffff88807b687758 (&p->lock){+.+.}-{4:4}, at: seq_read_iter+0xa4/0xca0 fs/seq_file.c:183
 #1: ffff88805b777c80 (&of->mutex#2){+.+.}-{4:4}, at: kernfs_seq_start+0x5d/0x420 fs/kernfs/file.c:165
 #2: ffff8880299a4e18 (kn->active#30){.+.+}-{0:0}, at: kernfs_get_active_of fs/kernfs/file.c:73 [inline]
 #2: ffff8880299a4e18 (kn->active#30){.+.+}-{0:0}, at: kernfs_seq_start+0xb2/0x420 fs/kernfs/file.c:166
 #3: ffff88807e53b1d8 (&dev->mutex){....}-{4:4}, at: device_lock_interruptible include/linux/device.h:1109 [inline]
 #3: ffff88807e53b1d8 (&dev->mutex){....}-{4:4}, at: manufacturer_show+0x26/0xa0 drivers/usb/core/sysfs.c:142
locks held by kworker/0:16/6014: 3, on CPU#0:
 #0: ffff88801b06a140 ((wq_completion)events_freezable){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88801b06a140 ((wq_completion)events_freezable){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88801b06a140 ((wq_completion)events_freezable){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff88801b06a140 ((wq_completion)events_freezable){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc900033d7c40 ((work_completion)(&(&us->scan_dwork)->work)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc900033d7c40 ((work_completion)(&(&us->scan_dwork)->work)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc900033d7c40 ((work_completion)(&(&us->scan_dwork)->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc900033d7c40 ((work_completion)(&(&us->scan_dwork)->work)){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffff88807d604ef0 (&us_interface_key[i]){+.+.}-{4:4}, at: usb_stor_scan_dwork+0xec/0x2c0 drivers/usb/storage/usb.c:987
locks held by syz.8.24/6016: 1, on CPU#1:
 #0: ffff88802a0ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff88802a0ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
locks held by syz.0.26/6017: 1, on CPU#1:
 #0: ffff88802a0ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff88802a0ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
locks held by syz.9.25/6024: 1, on CPU#1:
 #0: ffff88802a0ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff88802a0ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
locks held by udevd/6025: 4, on CPU#1:
 #0: ffff88802a0e2098 (&p->lock){+.+.}-{4:4}, at: seq_read_iter+0xa4/0xca0 fs/seq_file.c:183
 #1: ffff888073d95080 (&of->mutex#2){+.+.}-{4:4}, at: kernfs_seq_start+0x5d/0x420 fs/kernfs/file.c:165
 #2: ffff888029cb2b48 (kn->active#30){.+.+}-{0:0}, at: kernfs_get_active_of fs/kernfs/file.c:73 [inline]
 #2: ffff888029cb2b48 (kn->active#30){.+.+}-{0:0}, at: kernfs_seq_start+0xb2/0x420 fs/kernfs/file.c:166
 #3: ffff88805b3181d8 (&dev->mutex){....}-{4:4}, at: device_lock_interruptible include/linux/device.h:1109 [inline]
 #3: ffff88805b3181d8 (&dev->mutex){....}-{4:4}, at: manufacturer_show+0x26/0xa0 drivers/usb/core/sysfs.c:142
locks held by syz.7.23/6026: 1, on CPU#0:
 #0: ffff88802a0ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff88802a0ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
locks held by udevd/6027: 4, on CPU#1:
 #0: ffff888032a21f38 (&p->lock){+.+.}-{4:4}, at: seq_read_iter+0xa4/0xca0 fs/seq_file.c:183
 #1: ffff888032ad9080 (&of->mutex#2){+.+.}-{4:4}, at: kernfs_seq_start+0x5d/0x420 fs/kernfs/file.c:165
 #2: ffff8880747fd878 (kn->active#30){.+.+}-{0:0}, at: kernfs_get_active_of fs/kernfs/file.c:73 [inline]
 #2: ffff8880747fd878 (kn->active#30){.+.+}-{0:0}, at: kernfs_seq_start+0xb2/0x420 fs/kernfs/file.c:166
 #3: ffff88805c8d61d8 (&dev->mutex){....}-{4:4}, at: device_lock_interruptible include/linux/device.h:1109 [inline]
 #3: ffff88805c8d61d8 (&dev->mutex){....}-{4:4}, at: manufacturer_show+0x26/0xa0 drivers/usb/core/sysfs.c:142
locks held by syz.6.22/6029: 1, on CPU#1:
 #0: ffff88802a0ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff88802a0ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
locks held by kworker/1:11/6041: 3, on CPU#1:
 #0: ffff88801b06a140 ((wq_completion)events_freezable){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88801b06a140 ((wq_completion)events_freezable){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88801b06a140 ((wq_completion)events_freezable){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff88801b06a140 ((wq_completion)events_freezable){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc90003ec7c40 ((work_completion)(&(&us->scan_dwork)->work)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90003ec7c40 ((work_completion)(&(&us->scan_dwork)->work)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90003ec7c40 ((work_completion)(&(&us->scan_dwork)->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc90003ec7c40 ((work_completion)(&(&us->scan_dwork)->work)){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffff88805cbc0ef0 (&us_interface_key[i]){+.+.}-{4:4}, at: usb_stor_scan_dwork+0xec/0x2c0 drivers/usb/storage/usb.c:987
locks held by kworker/1:12/6042: 3, on CPU#1:
 #0: ffff88801b06a140 ((wq_completion)events_freezable){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88801b06a140 ((wq_completion)events_freezable){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88801b06a140 ((wq_completion)events_freezable){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff88801b06a140 ((wq_completion)events_freezable){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc90003ed7c40 ((work_completion)(&(&us->scan_dwork)->work)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90003ed7c40 ((work_completion)(&(&us->scan_dwork)->work)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90003ed7c40 ((work_completion)(&(&us->scan_dwork)->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc90003ed7c40 ((work_completion)(&(&us->scan_dwork)->work)){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffff88805cbc4ef0 (&us_interface_key[i]){+.+.}-{4:4}, at: usb_stor_scan_dwork+0xec/0x2c0 drivers/usb/storage/usb.c:987
locks held by syz.5.27/6115: 1, on CPU#1:
 #0: ffff88802a0ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff88802a0ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
locks held by syz.2.29/6129: 1, on CPU#1:
 #0: ffff88802a0ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff88802a0ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
locks held by syz.1.28/6130: 1, on CPU#0:
 #0: ffff88802a0ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff88802a0ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
locks held by syz.3.30/6131: 1, on CPU#0:
 #0: ffff88802a0ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff88802a0ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
locks held by syz.4.31/6132: 1, on CPU#1:
 #0: ffff88802a0ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff88802a0ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
locks held by syz.8.32/6191: 1, on CPU#0:
 #0: ffff88802a0ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff88802a0ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
locks held by syz.6.33/6202: 1, on CPU#0:
 #0: ffff88802a0ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff88802a0ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
locks held by syz.7.34/6221: 1, on CPU#0:
 #0: ffff88802a0ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff88802a0ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
locks held by syz.0.36/6222: 1, on CPU#0:
 #0: ffff88802a0ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff88802a0ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
locks held by syz.9.35/6223: 1, on CPU#0:
 #0: ffff88802a0ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff88802a0ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
locks held by syz.5.37/6240: 1, on CPU#1:
 #0: ffff88802a0ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff88802a0ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
locks held by syz.2.38/6261: 1, on CPU#1:
 #0: ffff88802a0ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff88802a0ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
locks held by syz.3.40/6307: 1, on CPU#1:
 #0: ffff88802a0ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff88802a0ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
locks held by syz.1.39/6308: 1, on CPU#0:
 #0: ffff88802a0ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff88802a0ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
locks held by syz.4.41/6309: 1, on CPU#1:
 #0: ffff88802a0ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff88802a0ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
locks held by syz.8.42/6327: 1, on CPU#1:
 #0: ffff88802a0ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff88802a0ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
locks held by syz.6.43/6344: 1, on CPU#0:
 #0: ffff88802a0ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff88802a0ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
locks held by syz.9.46/6418: 1, on CPU#1:
 #0: ffff88802a0ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff88802a0ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
locks held by kworker/u8:8/6424: 4, last CPU#0:
 #0: ffff8880297a5140 ((wq_completion)bat_events){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff8880297a5140 ((wq_completion)bat_events){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff8880297a5140 ((wq_completion)bat_events){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff8880297a5140 ((wq_completion)bat_events){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc900057afc40 ((work_completion)(&(&forw_packet_aggr->delayed_work)->work)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc900057afc40 ((work_completion)(&(&forw_packet_aggr->delayed_work)->work)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc900057afc40 ((work_completion)(&(&forw_packet_aggr->delayed_work)->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc900057afc40 ((work_completion)(&(&forw_packet_aggr->delayed_work)->work)){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffff88805ab4e9c8 (&hard_iface->bat_iv.ogm_buff_mutex){+.+.}-{4:4}, at: batadv_iv_ogm_schedule+0xd4/0xfc0 net/batman-adv/bat_iv_ogm.c:1010
 #3: ffffffff8ed5c920 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #3: ffffffff8ed5c920 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #3: ffffffff8ed5c920 (rcu_read_lock){....}-{1:3}, at: batadv_iv_ogm_slide_own_bcast_window net/batman-adv/bat_iv_ogm.c:870 [inline]
 #3: ffffffff8ed5c920 (rcu_read_lock){....}-{1:3}, at: batadv_iv_ogm_schedule_buff net/batman-adv/bat_iv_ogm.c:949 [inline]
 #3: ffffffff8ed5c920 (rcu_read_lock){....}-{1:3}, at: batadv_iv_ogm_schedule+0x41f/0xfc0 net/batman-adv/bat_iv_ogm.c:1011
locks held by syz.0.45/6425: 1, on CPU#0:
 #0: ffff88802a0ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff88802a0ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
locks held by syz.7.44/6426: 1, on CPU#1:
 #0: ffff88802a0ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff88802a0ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
locks held by syz.5.47/6433: 1, on CPU#1:
 #0: ffff88802a0ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff88802a0ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
locks held by syz.2.48/6434: 1, on CPU#1:
 #0: ffff88802a0ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff88802a0ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
locks held by syz-executor/6460: 1, last CPU#0:
 #0: ffffffff8eeac770 (remove_cache_srcu){.+.+}-{0:0}, at: srcu_lock_acquire include/linux/srcu.h:198 [inline]
 #0: ffffffff8eeac770 (remove_cache_srcu){.+.+}-{0:0}, at: srcu_read_lock+0x27/0x60 include/linux/srcu.h:305
locks held by syz-executor/6462: 2, on CPU#0:
 #0: ffffffff907aa7b0 (&ops->srcu#2){.+.+}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffffffff907aa7b0 (&ops->srcu#2){.+.+}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffffffff907aa7b0 (&ops->srcu#2){.+.+}-{0:0}, at: rtnl_link_ops_get+0x23/0x250 net/core/rtnetlink.c:595
 #1: ffffffff90254e00 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_lock net/core/rtnetlink.c:80 [inline]
 #1: ffffffff90254e00 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_nets_lock net/core/rtnetlink.c:366 [inline]
 #1: ffffffff90254e00 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_newlink+0xc10/0x1c30 net/core/rtnetlink.c:4219
locks held by syz.1.49/6464: 1, on CPU#0:
 #0: ffff88802a0ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff88802a0ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
locks held by syz-executor/6468: 2, on CPU#1:
 #0: ffffffff8f9bbbe8 (&ops->srcu#2){.+.+}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffffffff8f9bbbe8 (&ops->srcu#2){.+.+}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffffffff8f9bbbe8 (&ops->srcu#2){.+.+}-{0:0}, at: rtnl_link_ops_get+0x23/0x250 net/core/rtnetlink.c:595
 #1: ffffffff90254e00 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_lock net/core/rtnetlink.c:80 [inline]
 #1: ffffffff90254e00 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_nets_lock net/core/rtnetlink.c:366 [inline]
 #1: ffffffff90254e00 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_newlink+0xc10/0x1c30 net/core/rtnetlink.c:4219
locks held by syz-executor/6487: 2, last CPU#0:
 #0: ffffffff907aae78 (&ops->srcu#2){.+.+}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffffffff907aae78 (&ops->srcu#2){.+.+}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffffffff907aae78 (&ops->srcu#2){.+.+}-{0:0}, at: rtnl_link_ops_get+0x23/0x250 net/core/rtnetlink.c:595
 #1: ffffffff90254e00 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_lock net/core/rtnetlink.c:80 [inline]
 #1: ffffffff90254e00 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_nets_lock net/core/rtnetlink.c:366 [inline]
 #1: ffffffff90254e00 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_newlink+0xc10/0x1c30 net/core/rtnetlink.c:4219

=============================================

NMI backtrace for cpu 0
CPU: 0 UID: 0 PID: 32 Comm: khungtaskd Not tainted syzkaller #0 PREEMPT(full) 
Hardware name:

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
