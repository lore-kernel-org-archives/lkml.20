Received: from mail-oo2-f7.google.com (mail-oo2-f7.google.com [74.125.231.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F302B4DA548
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790006075; cv=none; b=eiNeKA+lHuybeo1JCTwc8sFzuGqbCiI1Bgyt4yu2QiwI8DwZZY/0CIbdSmduvKXoxvtAKPrDUyzOMRbwmwSocpI8kJCPS+aRBbL8s8atYG2etoBOC1roTiMFERdPFKZ6dEEdWuOm/VMhzOJCOCmjhwSQ6Ucly35HqnTq0z4mLsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790006075; c=relaxed/simple;
	bh=tkaxqno8twNXVn+a7vIo9cjkeE5uENggvGzrC2ttkNg=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=YM4zP9Zhx6jD5UVOEzoHzNYXTBDY46dM16Ni54GN9jK3pNEpLX3QlF/boC02JuromQ2p7ZyhFLJRAFKJAGHODhbL6RDt2dzqJ8mmy8K7MQMG6LmJMOX8u3bMVby7sC/ZW+xsr4+HzSAuMPsuhptafb30aprTLPBy0uG/B4f1Jo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo2-f7.google.com with SMTP id 006d021491bc7-6b1bebb3ae8so1501241eaf.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:54:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790006070; x=1790610870;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q5w30G66LPQBeGeD/nFQ7+e/PqPW+bs8keB+mSClIlU=;
        b=oNLu3+DfLnuOkFWcinZJrxQhCmNn7jslB67Q4SqsFjhHsloXKF1ZfBJSVxiS+Uqq40
         hJ4lYIUiXlkERWFbIncenMwjqgoCqiIv/wSRtoOW7jJqcCLDkpBLIDDQ4HMjtfDVOA+2
         Yq0DTkAii4JvpRgFAAT+istGytbN2drj/WBuAGHwVt2gRzjSbXIExToox+EU2SaFGg5q
         QF+irFVKFlgFEucqOXyYpay+4D50rqB7GT1KBTa6r50Qb253cy9USE8H6683hTgfAOuH
         6rZ1HxfuSO5QmFQyC/vpc2CaAFlQ2ZistdHDoor2MCM/XYiAOqlPGZKnRaLI8/bAsnmG
         XeaA==
X-Forwarded-Encrypted: i=1; AKwUvByiwZhMjkgCq4qegsXbNcpxgQ0Tk4qIAs+s7cjNOsNHkOeGmYMiB2kgDjA6sGqHOJjs8zSSO28rnKE0Zk4=@vger.kernel.org
X-Gm-Message-State: AFuF++k66f4TGDJx4nL6Q2ly30UEuYMhVCKNxtZVhS0tY34iXZdUMFqf
	piipcJyy8lCwZOdJPVuXIqLEZ4qzh1Qtur2F990XLa9w4vZM7k0rz7EvVwU7/cxbMZeX7IHsYn9
	AcmHgEtZufM2krYg4M9tSX8Skvei0j62L2c7HAaF+L6CYwntU2VbZwmPlRk4=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:81d3:b0:6c9:83aa:6fb8 with SMTP id
 006d021491bc7-6ca9d0482c5mr9425386eaf.61.1790006069962; Mon, 21 Sep 2026
 08:54:29 -0700 (PDT)
Date: Mon, 21 Sep 2026 08:54:29 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab15335.3179f8cd.1e36b2.0023.GAE@google.com>
Subject: [syzbot] [usb?] INFO: task hung in usbdev_ioctl (8)
From: syzbot <syzbot+109061940215dd4b011e@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    50d05c7c76c9 Merge tag 'landlock-7.3-rc3' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1136b005580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5e4e3a0e188a497e
dashboard link: https://syzkaller.appspot.com/bug?extid=109061940215dd4b011e
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
userspace arch: i386
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1469f915580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/daf497619736/disk-50d05c7c.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/748fbd82f647/vmlinux-50d05c7c.xz
kernel image: https://storage.googleapis.com/syzbot-assets/e61c59099d07/bzImage-50d05c7c.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+109061940215dd4b011e@syzkaller.appspotmail.com

INFO: task syz.5.21:5898 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.5.21        state:D stack:26856 pid:5898  tgid:5898  ppid:5765   task_flags:0x400040 flags:0x08080002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5526 [inline]
 __schedule+0x17db/0x58f0 kernel/sched/core.c:7276
 __schedule_loop kernel/sched/core.c:7353 [inline]
 schedule+0x164/0x2b0 kernel/sched/core.c:7368
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7425
 __mutex_lock_common kernel/locking/mutex.c:726 [inline]
 __mutex_lock+0x7c1/0x1550 kernel/locking/mutex.c:821
 device_lock include/linux/device.h:1104 [inline]
 usbdev_do_ioctl drivers/usb/core/devio.c:2613 [inline]
 usbdev_ioctl+0x13f/0x2120 drivers/usb/core/devio.c:2829
 __do_compat_sys_ioctl fs/ioctl.c:695 [inline]
 __se_compat_sys_ioctl fs/ioctl.c:638 [inline]
 __ia32_compat_sys_ioctl+0x5ea/0x950 fs/ioctl.c:638
 do_syscall_32_irqs_on arch/x86/entry/syscall_32.c:79 [inline]
 __do_fast_syscall_32+0x27a/0x6a0 arch/x86/entry/syscall_32.c:291
 do_fast_syscall_32+0x33/0x70 arch/x86/entry/syscall_32.c:316
 entry_SYSENTER_compat_after_hwframe+0x84/0x8e
RIP: 0023:0xf7f080ec
RSP: 002b:00000000f74efa5c EFLAGS: 00000206 ORIG_RAX: 0000000000000036
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 0000000080045519
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000206 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>
INFO: task syz.3.20:5899 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.3.20        state:D stack:27560 pid:5899  tgid:5899  ppid:5760   task_flags:0x400040 flags:0x08080002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5526 [inline]
 __schedule+0x17db/0x58f0 kernel/sched/core.c:7276
 __schedule_loop kernel/sched/core.c:7353 [inline]
 schedule+0x164/0x2b0 kernel/sched/core.c:7368
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7425
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
RIP: 0023:0xf71d75ab
RSP: 002b:00000000f75bf58c EFLAGS: 00000246 ORIG_RAX: 0000000000000127
RAX: ffffffffffffffda RBX: 00000000ffffff9c RCX: 00000000f75bf650
RDX: 0000000000000082 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000206 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>
INFO: task syz.0.22:5900 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.0.22        state:D stack:28200 pid:5900  tgid:5900  ppid:5751   task_flags:0x400040 flags:0x08080002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5526 [inline]
 __schedule+0x17db/0x58f0 kernel/sched/core.c:7276
 __schedule_loop kernel/sched/core.c:7353 [inline]
 schedule+0x164/0x2b0 kernel/sched/core.c:7368
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7425
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
RDX: 0000000000000082 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000206 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>
INFO: task syz.2.23:5901 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.2.23        state:D stack:27288 pid:5901  tgid:5901  ppid:5762   task_flags:0x400040 flags:0x08080002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5526 [inline]
 __schedule+0x17db/0x58f0 kernel/sched/core.c:7276
 __schedule_loop kernel/sched/core.c:7353 [inline]
 schedule+0x164/0x2b0 kernel/sched/core.c:7368
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7425
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
RIP: 0023:0xf71675ab
RSP: 002b:00000000f754f58c EFLAGS: 00000246 ORIG_RAX: 0000000000000127
RAX: ffffffffffffffda RBX: 00000000ffffff9c RCX: 00000000f754f650
RDX: 0000000000000082 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000206 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>
INFO: task syz.1.24:5902 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.1.24        state:D stack:27608 pid:5902  tgid:5902  ppid:5761   task_flags:0x400040 flags:0x08080002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5526 [inline]
 __schedule+0x17db/0x58f0 kernel/sched/core.c:7276
 __schedule_loop kernel/sched/core.c:7353 [inline]
 schedule+0x164/0x2b0 kernel/sched/core.c:7368
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7425
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
RIP: 0023:0xf71875ab
RSP: 002b:00000000f756f58c EFLAGS: 00000246 ORIG_RAX: 0000000000000127
RAX: ffffffffffffffda RBX: 00000000ffffff9c RCX: 00000000f756f650
RDX: 0000000000000082 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000206 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>

Showing all locks held in the system:
locks held by kworker/u8:0/12: 3, on CPU#0:
 #0: ffff888032177940 ((wq_completion)ipv6_addrconf){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff888032177940 ((wq_completion)ipv6_addrconf){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff888032177940 ((wq_completion)ipv6_addrconf){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff888032177940 ((wq_completion)ipv6_addrconf){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc90000117c40 ((work_completion)(&(&ifa->dad_work)->work)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90000117c40 ((work_completion)(&(&ifa->dad_work)->work)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90000117c40 ((work_completion)(&(&ifa->dad_work)->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc90000117c40 ((work_completion)(&(&ifa->dad_work)->work)){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffffffff90252180 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_net_lock include/linux/rtnetlink.h:134 [inline]
 #2: ffffffff90252180 (rtnl_mutex){+.+.}-{4:4}, at: addrconf_dad_work+0x116/0x15c0 net/ipv6/addrconf.c:4230
locks held by kworker/1:0/25: 3, last CPU#1:
 #0: ffff88801b06b140 ((wq_completion)events){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88801b06b140 ((wq_completion)events){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88801b06b140 ((wq_completion)events){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff88801b06b140 ((wq_completion)events){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc900001f7c40 ((work_completion)(&data->fib_event_work)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc900001f7c40 ((work_completion)(&data->fib_event_work)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc900001f7c40 ((work_completion)(&data->fib_event_work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc900001f7c40 ((work_completion)(&data->fib_event_work)){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffff8880334cc250 (&data->fib_lock){+.+.}-{4:4}, at: nsim_fib_event_work+0x1fd/0x3b0 drivers/net/netdevsim/fib.c:1490
locks held by kworker/1:1/31: 3, last CPU#1:
 #0: ffff88801b06b140 ((wq_completion)events){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88801b06b140 ((wq_completion)events){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88801b06b140 ((wq_completion)events){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff88801b06b140 ((wq_completion)events){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc90000a77c40 ((work_completion)(&data->fib_event_work)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90000a77c40 ((work_completion)(&data->fib_event_work)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90000a77c40 ((work_completion)(&data->fib_event_work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc90000a77c40 ((work_completion)(&data->fib_event_work)){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffff888042c7c250 (&data->fib_lock){+.+.}-{4:4}, at: nsim_fib_event_work+0x1fd/0x3b0 drivers/net/netdevsim/fib.c:1490
locks held by khungtaskd/32: 1, last CPU#1:
 #0: ffffffff8ed5c8a0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffffffff8ed5c8a0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffffffff8ed5c8a0 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks+0x2e/0x180 kernel/locking/lockdep.c:6871
locks held by klogd/4971: 1, last CPU#0:
 #0: ffffffff8ed5c8a0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffffffff8ed5c8a0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffffffff8ed5c8a0 (rcu_read_lock){....}-{1:3}, at: sock_def_readable+0xae/0x550 net/core/sock.c:3658
locks held by getty/5375: 2, on CPU#0:
 #0: ffff8880360de0a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x25/0x70 drivers/tty/tty_ldisc.c:243
 #1: ffffc9000322b2e8 (&ldata->atomic_read_lock){+.+.}-{4:4}, at: n_tty_read+0x45a/0x1360 drivers/tty/n_tty.c:2211
locks held by kworker/0:3/5737: 3, on CPU#0:
 #0: ffff88801b06b140 ((wq_completion)events){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88801b06b140 ((wq_completion)events){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88801b06b140 ((wq_completion)events){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff88801b06b140 ((wq_completion)events){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc90003557c40 (netdev_work){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90003557c40 (netdev_work){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90003557c40 (netdev_work){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc90003557c40 (netdev_work){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffffffff90252180 (rtnl_mutex){+.+.}-{4:4}, at: netdev_work_proc+0x6f/0x770 net/core/netdev_work.c:132
locks held by kworker/0:7/5887: 5, on CPU#0:
 #0: ffff888022ee2140 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff888022ee2140 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff888022ee2140 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff888022ee2140 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc90002de7c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90002de7c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90002de7c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc90002de7c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: hub_event+0x184/0x4d30 drivers/usb/core/hub.c:5912
 #3: ffff8880764aa1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #3: ffff8880764aa1d8 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x450 drivers/base/dd.c:1073
 #4: ffff8880365d41a0 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #4: ffff8880365d41a0 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x450 drivers/base/dd.c:1073
locks held by syz.5.21/5898: 1, on CPU#0:
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_do_ioctl drivers/usb/core/devio.c:2613 [inline]
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_ioctl+0x13f/0x2120 drivers/usb/core/devio.c:2829
locks held by syz.3.20/5899: 1, on CPU#0:
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
locks held by syz.0.22/5900: 1, on CPU#0:
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
locks held by syz.2.23/5901: 1, on CPU#0:
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
locks held by syz.1.24/5902: 1, on CPU#0:
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
locks held by syz.6.25/5993: 1, on CPU#1:
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
locks held by syz.9.28/5994: 1, on CPU#1:
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
locks held by syz.4.29/5995: 1, on CPU#1:
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
locks held by syz.7.26/5996: 1, on CPU#0:
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
locks held by syz.8.27/5997: 1, on CPU#1:
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
locks held by syz.2.32/6076: 1, on CPU#1:
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
locks held by syz.5.34/6083: 1, on CPU#1:
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
locks held by syz.0.30/6084: 1, on CPU#1:
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
locks held by syz.1.31/6085: 1, on CPU#1:
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
locks held by syz.3.33/6086: 1, on CPU#1:
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
locks held by syz.6.35/6104: 1, on CPU#0:
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
locks held by syz.8.37/6171: 1, on CPU#1:
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
locks held by syz.7.36/6172: 1, on CPU#1:
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
locks held by syz.9.38/6173: 1, on CPU#1:
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
locks held by syz.4.39/6174: 1, on CPU#0:
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
locks held by syz.2.40/6198: 1, on CPU#0:
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
locks held by syz.5.41/6261: 1, on CPU#0:
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
locks held by syz.0.42/6268: 1, on CPU#0:
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
locks held by syz.1.43/6269: 1, on CPU#1:
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
locks held by syz.3.44/6270: 1, on CPU#1:
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
locks held by syz.6.45/6289: 1, on CPU#1:
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
locks held by syz.8.46/6344: 1, on CPU#0:
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
locks held by syz.9.47/6357: 1, on CPU#1:
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
locks held by syz.7.48/6358: 1, on CPU#1:
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
locks held by syz.4.49/6359: 1, on CPU#1:
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
locks held by syz.2.50/6377: 1, on CPU#1:
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
locks held by syz.5.51/6439: 1, on CPU#0:
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
locks held by syz.0.52/6441: 1, on CPU#0:
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
locks held by syz.3.54/6458: 1, on CPU#0:
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
locks held by syz.1.53/6459: 1, on CPU#1:
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
locks held by syz.6.55/6472: 1, on CPU#0:
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
locks held by syz-executor/6501: 1, on CPU#0:
 #0: ffffffff90252180 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_net_lock include/linux/rtnetlink.h:134 [inline]
 #0: ffffffff90252180 (rtnl_mutex){+.+.}-{4:4}, at: inet_rtm_newaddr+0x470/0x19f0 net/ipv4/devinet.c:978
locks held by syz.8.56/6502: 1, on CPU#1:
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #0: ffff8880296ac1d8 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x151/0x770 drivers/usb/core/devio.c:1054
locks held by syz-executor/6513: 1, on CPU#1:
 #0: ffffffff90252180 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_lock net/core/rtnetlink.c:80 [inline]
 #0: ffffffff90252180 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_nets_lock net/core/rtnetlink.c:366 [inline]
 #0: ffffffff90252180 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_newlink+0xc10/0x1c30 net/core/rtnetlink.c:4214
locks held by syz-executor/6515: 3, last CPU#0:
 #0: ffffffff907bc598 (&ops->srcu#2){.+.+}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffffffff907bc598 (&ops->srcu#2){.+.+}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffffffff907bc598 (&ops->srcu#2){.+.+}-{0:0}, at: rtnl_link_ops_get+0x23/0x250 net/core/rtnetlink.c:595
 #1: ffffffff90252180 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_lock net/core/rtnetlink.c:80 [inline]
 #1: ffffffff90252180 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_nets_lock net/core/rtnetlink.c:366 [inline]
 #1: ffffffff90252180 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_newlink+0xc10/0x1c30 net/core/rtnetlink.c:4214
 #2: ffffffff8ed5c8a0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #2: ffffffff8ed5c8a0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #2: ffffffff8ed5c8a0 (rcu_read_lock){....}-{1:3}, at: class_rcu_constructor include/linux/rcupdate.h:1216 [inline]
 #2: ffffffff8ed5c8a0 (rcu_read_lock){....}-{1:3}, at: unwind_next_frame+0x8f/0x2550 arch/x86/kernel/unwind_orc.c:495

=============================================

NMI backtrace for cpu 1
CPU: 1 UID: 0 PID: 32 Comm: khungtaskd Not tainted syzkaller #0 PREEMPT(full) 
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
Sending NMI from CPU 1 to CPUs 0:
NMI backtrace for cpu 0
CPU: 0 UID: 0 PID: 4971 Comm: klogd Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
RIP: 0010:mark_lock+0x3/0x190 kernel/locking/lockdep.c:4758
Code: 3a 90 41 89 e9 48 89 df 48 8b 2c 24 e9 b6 fd ff ff 66 0f 1f 44 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 55 41 57 <41> 56 41 55 41 54 53 48 8b 46 20 89 c1 81 e1 00 00 03 00 48 83 f9
RSP: 0018:ffffc900032878b0 EFLAGS: 00000002
RAX: 0000000000000001 RBX: ffff88807fba1f40 RCX: ffffffff94400330
RDX: 0000000000000006 RSI: ffff88807fba2af0 RDI: ffff88807fba1f40
RBP: ffff88807fba2af0 R08: ffffffff8a8757c9 R09: 0000000000000000
R10: dffffc0000000000 R11: ffffed100ff743e9 R12: ffffffffffffff05
R13: 0000000000000000 R14: 0000000000000000 R15: ffff88807fba1f40
FS:  00007fe1c9631c80(0000) GS:ffff888124cd2000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f8faab92e9c CR3: 000000007fa34000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 mark_usage kernel/locking/lockdep.c:-1 [inline]
 __lock_acquire+0xaab/0x2de0 kernel/locking/lockdep.c:5242
 lock_acquire+0x115/0x350 kernel/locking/lockdep.c:5942
 __raw_spin_lock include/linux/spinlock_api_smp.h:190 [inline]
 _raw_spin_lock+0x2e/0x40 kernel/locking/spinlock.c:173
 spin_lock include/linux/spinlock.h:347 [inline]
 unix_dgram_sendmsg+0x899/0x17b0 net/unix/af_unix.c:2191
 sock_sendmsg_nosec+0x13a/0x180 net/socket.c:800
 __sock_sendmsg net/socket.c:815 [inline]
 __sys_sendto+0x408/0x5a0 net/socket.c:2281
 __do_sys_sendto net/socket.c:2288 [inline]
 __se_sys_sendto net/socket.c:2284 [inline]
 __x64_sys_sendto+0xde/0x100 net/socket.c:2284
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fe1c9781407
Code: 48 89 fa 4c 89 df e8 38 aa 00 00 8b 93 08 03 00 00 59 5e 48 83 f8 fc 74 1a 5b c3 0f 1f 84 00 00 00 00 00 48 8b 44 24 10 0f 05 <5b> c3 0f 1f 80 00 00 00 00 83 e2 39 83 fa 08 75 de e8 23 ff ff ff
RSP: 002b:00007fff51737170 EFLAGS: 00000202 ORIG_RAX: 000000000000002c
RAX: ffffffffffffffda RBX: 00007fe1c9631c80 RCX: 00007fe1c9781407
RDX: 0000000000000073 RSI: 00007fff517372b0 RDI: 0000000000000003
RBP: 00007fff517376e0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000004000 R11: 0000000000000202 R12: 00007fff517376f8
R13: 00007fff517372b0 R14: 0000000000000058 R15: 00007fff517372b0
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
