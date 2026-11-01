Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793518745;
	b=tdYw470yc3sqJFEL94t5ZmA4EqdnR5PSPXtHL+jP0NBxN/0fCWI9bq1AEPoYMBGICE90
	 h7vCxciFCUnMJQ1dBi1NEkDeGXs9UbgMNCSy88shkGjgNH3+alGCFvmmGrZi6MWiGZ+Wo
	 lF031LdLF/OoKvEJldOxC9wRYMhhVGUVlz7Wb3UcnbgUbYz/0pxG8hTSUvZJI+U0Aogf9
	 odT5erKFerraBHWwVnPp7LPaa4UTemrnrNM0d0X3J0M7MbFQlEPgLFAzOkmS7mibLOw1E
	 GytZl3Rv+UdxVxlMNxABmjA4D2pmrLY4tWo+5fwJJQXUhbzvcCkizqxo/Dags1yGyRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793518745;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=CZKsUPMnRUUhmVcDroDNAam0yj2wuDT3vMtOujZ0Rx8=;
	b=12lF4N2Keei6O/YELJg1KHmRURmOfD12z3dNFDDTRRfzWiadKcPdr0lv6js5yIepgpRI
	 rZrS9kBrLnexpr93CPHFb/3HFTybw9dUMIDYCH4EwFoD80x7A/U6Yy9rx6E1zadc+fwl1
	 s3N2tPy/EUaKT5L/OvuUE2juezQsNKqgPOOkHwZ00eMHfB62HmnZNcdpf1py71f8kx2wR
	 o+mOEMuZn0HzBcK5ztYsnLMZjxhIToBRbt1bqSaeXTfifyljv6iOJub5q9BK5aIVYqyav
	 tPVzxqoMuWMo7aMMxuRKR85E0oA9W61hqoE8/hmZYc2i1SNBeuQTU4O3+NyRJAw8k1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A780D606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 07:39:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A780D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4f4612a1a5cso3867165b6e.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 00:39:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793518743; x=1794123543;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CZKsUPMnRUUhmVcDroDNAam0yj2wuDT3vMtOujZ0Rx8=;
        b=OeBKzxw8BvO4Dbneppb4ENKR9665g9hQ2urW5Yb0XasWeB7mWz5UQT20ael132q2Od
         45xwCXPsVsZha1U951+hmjbeo1CYcFfFFP2i5zCkgxWtopCJSDwOdNlsorV7Cwz1fISJ
         hYtMGa9w5iP/vT8nwGEDZ8dqpkh5RQ6hsv8hx/XeL6bRRIXh/0Dg7tPYLq3YQfrYFWe0
         S5aVJdX42N+OWLXIFYNvQgvQD9n1uRwu+iSoWBQ5zKZsAAiTh9ydDPp0itKLdJ2wHvsQ
         k7BmsSJ04/y+PDtPlU29bmWylPeoFpoqk8Q3uwDs5pRrw+X98eZERkK8s9RucQ/YnWrU
         0dfw==
X-Gm-Message-State: AFq9FYKoqLiUWXOUVs75u3rtYH15grETM6rkwSM/PvzG5pCa7dd/N8vX
	uJEn9RSBcjmMwMkZ9Fas0Esv28AD9DFSYsZYyyTwTBUekuotANCLRPq0yjGv6tL0txM/wEdZpBS
	EyYiTUmUqnQwzliTOU+Z1bEMLpVLxrrEICr1HkQF40KsQ2VfsIehHN0gc9wg=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:bd6:b0:52b:d800:e1cc with SMTP id
 5614622812f47-563efb37b20mr4805549b6e.30.1793518743501; Sun, 01 Nov 2026
 00:39:03 -0700 (PDT)
Date: Sun, 01 Nov 2026 00:39:03 -0700
In-Reply-To: <CAD8CXU=ceJ1wD00HKsdhRE5yzOxGiOQiUBso9UAX0K96G6E8ew@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae6ec97.c8ffc79a.e3697.0011.GAE@google.com>
Subject: Re: [syzbot] [serial?] KASAN: slab-use-after-free Read in check_tty_count
From: syzbot <syzbot+39a2135de1558208d3b3@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	varun.singh10011@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
INFO: task hung in gserial_free_port

INFO
INFO: task syz.2.1663:10888 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.2.1663      state:D stack:28704 pid:10888 tgid:10885 ppid:6198   task_flags:0x400140 flags:0x00080002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5583 [inline]
 __schedule+0x125e/0x6990 kernel/sched/core.c:7382
 __schedule_loop kernel/sched/core.c:7459 [inline]
 schedule+0xdd/0x2c0 kernel/sched/core.c:7474
 gserial_free_port+0x1fd/0x2e0 drivers/usb/gadget/function/u_serial.c:1306
 gserial_free_line+0x107/0x1e0 drivers/usb/gadget/function/u_serial.c:1326
 acm_free_instance+0x3b/0x60 drivers/usb/gadget/function/f_acm.c:875
 usb_put_function_instance+0x97/0xc0 drivers/usb/gadget/functions.c:77
 config_item_cleanup+0x146/0x240 fs/configfs/item.c:128
 config_item_release fs/configfs/item.c:137 [inline]
 kref_put include/linux/kref.h:65 [inline]
 config_item_put fs/configfs/item.c:149 [inline]
 config_item_put+0x93/0xb0 fs/configfs/item.c:146
 configfs_rmdir+0x5e3/0x950 fs/configfs/dir.c:1580
 vfs_rmdir fs/namei.c:5533 [inline]
 vfs_rmdir+0x328/0x8e0 fs/namei.c:5506
 filename_rmdir+0x31a/0x610 fs/namei.c:5590
 __do_sys_rmdir fs/namei.c:5613 [inline]
 __se_sys_rmdir fs/namei.c:5610 [inline]
 __x64_sys_rmdir+0x46/0x70 fs/namei.c:5610
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fd0b959e0d9
RSP: 002b:00007fd0ba4be028 EFLAGS: 00000246 ORIG_RAX: 0000000000000054
RAX: ffffffffffffffda RBX: 00007fd0b9825fa0 RCX: 00007fd0b959e0d9
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000200000000100
RBP: 00007fd0b9635024 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fd0b9826038 R14: 00007fd0b9825fa0 R15: 00007fff1721ba98
 </TASK>
INFO: task syz.1.1664:10891 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.1.1664      state:D stack:26744 pid:10891 tgid:10890 ppid:6193   task_flags:0x400140 flags:0x00080002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5583 [inline]
 __schedule+0x125e/0x6990 kernel/sched/core.c:7382
 __schedule_loop kernel/sched/core.c:7459 [inline]
 schedule+0xdd/0x2c0 kernel/sched/core.c:7474
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7531
 rwsem_down_write_slowpath+0x4c6/0x12f0 kernel/locking/rwsem.c:1215
 __down_write_common kernel/locking/rwsem.c:1347 [inline]
 __down_write kernel/locking/rwsem.c:1356 [inline]
 down_write_nested+0x1c6/0x1f0 kernel/locking/rwsem.c:1758
 inode_lock_nested include/linux/fs.h:1071 [inline]
 __start_dirop fs/namei.c:2924 [inline]
 start_dirop fs/namei.c:2948 [inline]
 filename_rmdir+0x258/0x610 fs/namei.c:5583
 __do_sys_rmdir fs/namei.c:5613 [inline]
 __se_sys_rmdir fs/namei.c:5610 [inline]
 __x64_sys_rmdir+0x46/0x70 fs/namei.c:5610
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f89dd19e0d9
RSP: 002b:00007f89de0d3028 EFLAGS: 00000246 ORIG_RAX: 0000000000000054
RAX: ffffffffffffffda RBX: 00007f89dd425fa0 RCX: 00007f89dd19e0d9
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000200000000100
RBP: 00007f89dd235024 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f89dd426038 R14: 00007f89dd425fa0 R15: 00007ffc3f5b6758
 </TASK>
INFO: task syz.0.1666:10893 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.0.1666      state:D stack:28728 pid:10893 tgid:10892 ppid:6190   task_flags:0x400140 flags:0x00080002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5583 [inline]
 __schedule+0x125e/0x6990 kernel/sched/core.c:7382
 __schedule_loop kernel/sched/core.c:7459 [inline]
 schedule+0xdd/0x2c0 kernel/sched/core.c:7474
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7531
 rwsem_down_write_slowpath+0x4c6/0x12f0 kernel/locking/rwsem.c:1215
 __down_write_common kernel/locking/rwsem.c:1347 [inline]
 __down_write kernel/locking/rwsem.c:1356 [inline]
 down_write_nested+0x1c6/0x1f0 kernel/locking/rwsem.c:1758
 inode_lock_nested include/linux/fs.h:1071 [inline]
 __start_dirop fs/namei.c:2924 [inline]
 start_dirop fs/namei.c:2948 [inline]
 filename_create+0x1c0/0x400 fs/namei.c:5108
 filename_mkdirat+0xb9/0x630 fs/namei.c:5454
 __do_sys_mkdirat fs/namei.c:5482 [inline]
 __se_sys_mkdirat fs/namei.c:5479 [inline]
 __x64_sys_mkdirat+0x89/0xc0 fs/namei.c:5479
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f13e1d9e0d9
RSP: 002b:00007f13e2c38028 EFLAGS: 00000246 ORIG_RAX: 0000000000000102
RAX: ffffffffffffffda RBX: 00007f13e2025fa0 RCX: 00007f13e1d9e0d9
RDX: 00000000000001ff RSI: 0000200000000200 RDI: ffffffffffffff9c
RBP: 00007f13e1e35024 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f13e2026038 R14: 00007f13e2025fa0 R15: 00007ffd983da538
 </TASK>
INFO: task syz.0.1666:10896 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.0.1666      state:D stack:28728 pid:10896 tgid:10892 ppid:6190   task_flags:0x400040 flags:0x00080002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5583 [inline]
 __schedule+0x125e/0x6990 kernel/sched/core.c:7382
 __schedule_loop kernel/sched/core.c:7459 [inline]
 schedule+0xdd/0x2c0 kernel/sched/core.c:7474
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7531
 rwsem_down_write_slowpath+0x4c6/0x12f0 kernel/locking/rwsem.c:1215
 __down_write_common kernel/locking/rwsem.c:1347 [inline]
 __down_write kernel/locking/rwsem.c:1356 [inline]
 down_write_nested+0x1c6/0x1f0 kernel/locking/rwsem.c:1758
 inode_lock_nested include/linux/fs.h:1071 [inline]
 __start_dirop fs/namei.c:2924 [inline]
 start_dirop fs/namei.c:2948 [inline]
 filename_rmdir+0x258/0x610 fs/namei.c:5583
 __do_sys_rmdir fs/namei.c:5613 [inline]
 __se_sys_rmdir fs/namei.c:5610 [inline]
 __x64_sys_rmdir+0x46/0x70 fs/namei.c:5610
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f13e1d9e0d9
RSP: 002b:00007f13e2c17028 EFLAGS: 00000246 ORIG_RAX: 0000000000000054
RAX: ffffffffffffffda RBX: 00007f13e2026090 RCX: 00007f13e1d9e0d9
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000200000000100
RBP: 00007f13e1e35024 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f13e2026128 R14: 00007f13e2026090 R15: 00007ffd983da538
 </TASK>
INFO: task syz.3.1667:10895 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.3.1667      state:D stack:28728 pid:10895 tgid:10894 ppid:6199   task_flags:0x400140 flags:0x00080002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5583 [inline]
 __schedule+0x125e/0x6990 kernel/sched/core.c:7382
 __schedule_loop kernel/sched/core.c:7459 [inline]
 schedule+0xdd/0x2c0 kernel/sched/core.c:7474
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7531
 rwsem_down_write_slowpath+0x4c6/0x12f0 kernel/locking/rwsem.c:1215
 __down_write_common kernel/locking/rwsem.c:1347 [inline]
 __down_write kernel/locking/rwsem.c:1356 [inline]
 down_write_nested+0x1c6/0x1f0 kernel/locking/rwsem.c:1758
 inode_lock_nested include/linux/fs.h:1071 [inline]
 __start_dirop fs/namei.c:2924 [inline]
 start_dirop fs/namei.c:2948 [inline]
 filename_create+0x1c0/0x400 fs/namei.c:5108
 filename_mkdirat+0xb9/0x630 fs/namei.c:5454
 __do_sys_mkdirat fs/namei.c:5482 [inline]
 __se_sys_mkdirat fs/namei.c:5479 [inline]
 __x64_sys_mkdirat+0x89/0xc0 fs/namei.c:5479
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f53afd9e0d9
RSP: 002b:00007f53af3fe028 EFLAGS: 00000246 ORIG_RAX: 0000000000000102
RAX: ffffffffffffffda RBX: 00007f53b0025fa0 RCX: 00007f53afd9e0d9
RDX: 00000000000001ff RSI: 0000200000000200 RDI: ffffffffffffff9c
RBP: 00007f53afe35024 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f53b0026038 R14: 00007f53b0025fa0 R15: 00007ffd6da8b958
 </TASK>
INFO: task syz.3.1667:10897 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.3.1667      state:D stack:28728 pid:10897 tgid:10894 ppid:6199   task_flags:0x400040 flags:0x00080002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5583 [inline]
 __schedule+0x125e/0x6990 kernel/sched/core.c:7382
 __schedule_loop kernel/sched/core.c:7459 [inline]
 schedule+0xdd/0x2c0 kernel/sched/core.c:7474
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7531
 rwsem_down_write_slowpath+0x4c6/0x12f0 kernel/locking/rwsem.c:1215
 __down_write_common kernel/locking/rwsem.c:1347 [inline]
 __down_write kernel/locking/rwsem.c:1356 [inline]
 down_write_nested+0x1c6/0x1f0 kernel/locking/rwsem.c:1758
 inode_lock_nested include/linux/fs.h:1071 [inline]
 __start_dirop fs/namei.c:2924 [inline]
 start_dirop fs/namei.c:2948 [inline]
 filename_rmdir+0x258/0x610 fs/namei.c:5583
 __do_sys_rmdir fs/namei.c:5613 [inline]
 __se_sys_rmdir fs/namei.c:5610 [inline]
 __x64_sys_rmdir+0x46/0x70 fs/namei.c:5610
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f53afd9e0d9
RSP: 002b:00007f53af3dd028 EFLAGS: 00000246 ORIG_RAX: 0000000000000054
RAX: ffffffffffffffda RBX: 00007f53b0026090 RCX: 00007f53afd9e0d9
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000200000000100
RBP: 00007f53afe35024 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f53b0026128 R14: 00007f53b0026090 R15: 00007ffd6da8b958
 </TASK>
INFO: task syz-executor240:10918 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor240 state:D stack:28728 pid:10918 tgid:10917 ppid:10908  task_flags:0x400140 flags:0x00080002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5583 [inline]
 __schedule+0x125e/0x6990 kernel/sched/core.c:7382
 __schedule_loop kernel/sched/core.c:7459 [inline]
 schedule+0xdd/0x2c0 kernel/sched/core.c:7474
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7531
 rwsem_down_write_slowpath+0x4c6/0x12f0 kernel/locking/rwsem.c:1215
 __down_write_common kernel/locking/rwsem.c:1347 [inline]
 __down_write kernel/locking/rwsem.c:1356 [inline]
 down_write_nested+0x1c6/0x1f0 kernel/locking/rwsem.c:1758
 inode_lock_nested include/linux/fs.h:1071 [inline]
 __start_dirop fs/namei.c:2924 [inline]
 start_dirop fs/namei.c:2948 [inline]
 filename_create+0x1c0/0x400 fs/namei.c:5108
 filename_mkdirat+0xb9/0x630 fs/namei.c:5454
 __do_sys_mkdirat fs/namei.c:5482 [inline]
 __se_sys_mkdirat fs/namei.c:5479 [inline]
 __x64_sys_mkdirat+0x89/0xc0 fs/namei.c:5479
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f7a340040b9
RSP: 002b:00007f7a33fd91d8 EFLAGS: 00000246 ORIG_RAX: 0000000000000102
RAX: ffffffffffffffda RBX: 00007f7a340b4b28 RCX: 00007f7a340040b9
RDX: 00000000000001ff RSI: 0000200000000200 RDI: 00000000ffffff9c
RBP: 00007f7a340b4b20 R08: 33203a6b63617473 R09: 33203a6b63617473
R10: 33203a6b63617473 R11: 0000000000000246 R12: 00007f7a34081720
R13: 0000200000000100 R14: 0000200000000800 R15: 74742f7665642f2e
 </TASK>
INFO: task syz-executor240:10925 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor240 state:D stack:28728 pid:10925 tgid:10917 ppid:10908  task_flags:0x400040 flags:0x00080002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5583 [inline]
 __schedule+0x125e/0x6990 kernel/sched/core.c:7382
 __schedule_loop kernel/sched/core.c:7459 [inline]
 schedule+0xdd/0x2c0 kernel/sched/core.c:7474
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7531
 rwsem_down_write_slowpath+0x4c6/0x12f0 kernel/locking/rwsem.c:1215
 __down_write_common kernel/locking/rwsem.c:1347 [inline]
 __down_write kernel/locking/rwsem.c:1356 [inline]
 down_write_nested+0x1c6/0x1f0 kernel/locking/rwsem.c:1758
 inode_lock_nested include/linux/fs.h:1071 [inline]
 __start_dirop fs/namei.c:2924 [inline]
 start_dirop fs/namei.c:2948 [inline]
 filename_rmdir+0x258/0x610 fs/namei.c:5583
 __do_sys_rmdir fs/namei.c:5613 [inline]
 __se_sys_rmdir fs/namei.c:5610 [inline]
 __x64_sys_rmdir+0x46/0x70 fs/namei.c:5610
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f7a340040b9
RSP: 002b:00007f7a33fb81d8 EFLAGS: 00000246 ORIG_RAX: 0000000000000054
RAX: ffffffffffffffda RBX: 00007f7a340b4b38 RCX: 00007f7a340040b9
RDX: 00007f7a340040b9 RSI: 0000000000000000 RDI: 0000200000000100
RBP: 00007f7a340b4b30 R08: 34203a6b63617473 R09: 34203a6b63617473
R10: 34203a6b63617473 R11: 0000000000000246 R12: 00007f7a34081720
R13: 0000200000000100 R14: 0000200000000800 R15: 74742f7665642f2e
 </TASK>
INFO: task syz-executor240:10921 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor240 state:D stack:28728 pid:10921 tgid:10920 ppid:10907  task_flags:0x400140 flags:0x00080002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5583 [inline]
 __schedule+0x125e/0x6990 kernel/sched/core.c:7382
 __schedule_loop kernel/sched/core.c:7459 [inline]
 schedule+0xdd/0x2c0 kernel/sched/core.c:7474
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7531
 rwsem_down_write_slowpath+0x4c6/0x12f0 kernel/locking/rwsem.c:1215
 __down_write_common kernel/locking/rwsem.c:1347 [inline]
 __down_write kernel/locking/rwsem.c:1356 [inline]
 down_write_nested+0x1c6/0x1f0 kernel/locking/rwsem.c:1758
 inode_lock_nested include/linux/fs.h:1071 [inline]
 __start_dirop fs/namei.c:2924 [inline]
 start_dirop fs/namei.c:2948 [inline]
 filename_create+0x1c0/0x400 fs/namei.c:5108
 filename_mkdirat+0xb9/0x630 fs/namei.c:5454
 __do_sys_mkdirat fs/namei.c:5482 [inline]
 __se_sys_mkdirat fs/namei.c:5479 [inline]
 __x64_sys_mkdirat+0x89/0xc0 fs/namei.c:5479
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f7a340040b9
RSP: 002b:00007f7a33fd91d8 EFLAGS: 00000246 ORIG_RAX: 0000000000000102
RAX: ffffffffffffffda RBX: 00007f7a340b4b28 RCX: 00007f7a340040b9
RDX: 00000000000001ff RSI: 0000200000000200 RDI: 00000000ffffff9c
RBP: 00007f7a340b4b20 R08: 33203a6b63617473 R09: 33203a6b63617473
R10: 33203a6b63617473 R11: 0000000000000246 R12: 00007f7a34081720
R13: 0000200000000100 R14: 0000200000000800 R15: 74742f7665642f2e
 </TASK>
INFO: task syz-executor240:10928 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor240 state:D stack:28728 pid:10928 tgid:10920 ppid:10907  task_flags:0x400040 flags:0x00080002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5583 [inline]
 __schedule+0x125e/0x6990 kernel/sched/core.c:7382
 __schedule_loop kernel/sched/core.c:7459 [inline]
 schedule+0xdd/0x2c0 kernel/sched/core.c:7474
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7531
 rwsem_down_write_slowpath+0x4c6/0x12f0 kernel/locking/rwsem.c:1215
 __down_write_common kernel/locking/rwsem.c:1347 [inline]
 __down_write kernel/locking/rwsem.c:1356 [inline]
 down_write_nested+0x1c6/0x1f0 kernel/locking/rwsem.c:1758
 inode_lock_nested include/linux/fs.h:1071 [inline]
 __start_dirop fs/namei.c:2924 [inline]
 start_dirop fs/namei.c:2948 [inline]
 filename_rmdir+0x258/0x610 fs/namei.c:5583
 __do_sys_rmdir fs/namei.c:5613 [inline]
 __se_sys_rmdir fs/namei.c:5610 [inline]
 __x64_sys_rmdir+0x46/0x70 fs/namei.c:5610
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f7a340040b9
RSP: 002b:00007f7a33fb81d8 EFLAGS: 00000246 ORIG_RAX: 0000000000000054
RAX: ffffffffffffffda RBX: 00007f7a340b4b38 RCX: 00007f7a340040b9
RDX: 00007f7a340040b9 RSI: 0000000000000000 RDI: 0000200000000100
RBP: 00007f7a340b4b30 R08: 34203a6b63617473 R09: 34203a6b63617473
R10: 34203a6b63617473 R11: 0000000000000246 R12: 00007f7a34081720
R13: 0000200000000100 R14: 0000200000000800 R15: 74742f7665642f2e
 </TASK>
INFO: task syz-executor240:10924 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor240 state:D stack:28728 pid:10924 tgid:10923 ppid:10906  task_flags:0x400140 flags:0x00080002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5583 [inline]
 __schedule+0x125e/0x6990 kernel/sched/core.c:7382
 __schedule_loop kernel/sched/core.c:7459 [inline]
 schedule+0xdd/0x2c0 kernel/sched/core.c:7474
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7531
 rwsem_down_write_slowpath+0x4c6/0x12f0 kernel/locking/rwsem.c:1215
 __down_write_common kernel/locking/rwsem.c:1347 [inline]
 __down_write kernel/locking/rwsem.c:1356 [inline]
 down_write_nested+0x1c6/0x1f0 kernel/locking/rwsem.c:1758
 inode_lock_nested include/linux/fs.h:1071 [inline]
 __start_dirop fs/namei.c:2924 [inline]
 start_dirop fs/namei.c:2948 [inline]
 filename_create+0x1c0/0x400 fs/namei.c:5108
 filename_mkdirat+0xb9/0x630 fs/namei.c:5454
 __do_sys_mkdirat fs/namei.c:5482 [inline]
 __se_sys_mkdirat fs/namei.c:5479 [inline]
 __x64_sys_mkdirat+0x89/0xc0 fs/namei.c:5479
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f7a340040b9
RSP: 002b:00007f7a33fd91d8 EFLAGS: 00000246 ORIG_RAX: 0000000000000102
RAX: ffffffffffffffda RBX: 00007f7a340b4b28 RCX: 00007f7a340040b9
RDX: 00000000000001ff RSI: 0000200000000200 RDI: 00000000ffffff9c
RBP: 00007f7a340b4b20 R08: 33203a6b63617473 R09: 33203a6b63617473
R10: 33203a6b63617473 R11: 0000000000000246 R12: 00007f7a34081720
R13: 0000200000000100 R14: 0000200000000800 R15: 74742f7665642f2e
 </TASK>
INFO: task syz-executor240:10929 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor240 state:D stack:28728 pid:10929 tgid:10923 ppid:10906  task_flags:0x400040 flags:0x00080002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5583 [inline]
 __schedule+0x125e/0x6990 kernel/sched/core.c:7382
 __schedule_loop kernel/sched/core.c:7459 [inline]
 schedule+0xdd/0x2c0 kernel/sched/core.c:7474
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7531
 rwsem_down_write_slowpath+0x4c6/0x12f0 kernel/locking/rwsem.c:1215
 __down_write_common kernel/locking/rwsem.c:1347 [inline]
 __down_write kernel/locking/rwsem.c:1356 [inline]
 down_write_nested+0x1c6/0x1f0 kernel/locking/rwsem.c:1758
 inode_lock_nested include/linux/fs.h:1071 [inline]
 __start_dirop fs/namei.c:2924 [inline]
 start_dirop fs/namei.c:2948 [inline]
 filename_rmdir+0x258/0x610 fs/namei.c:5583
 __do_sys_rmdir fs/namei.c:5613 [inline]
 __se_sys_rmdir fs/namei.c:5610 [inline]
 __x64_sys_rmdir+0x46/0x70 fs/namei.c:5610
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f7a340040b9
RSP: 002b:00007f7a33fb81d8 EFLAGS: 00000246 ORIG_RAX: 0000000000000054
RAX: ffffffffffffffda RBX: 00007f7a340b4b38 RCX: 00007f7a340040b9
RDX: 00007f7a340040b9 RSI: 0000000000000000 RDI: 0000200000000100
RBP: 00007f7a340b4b30 R08: 34203a6b63617473 R09: 34203a6b63617473
R10: 34203a6b63617473 R11: 0000000000000246 R12: 00007f7a34081720
R13: 0000200000000100 R14: 0000200000000800 R15: 74742f7665642f2e
 </TASK>
INFO: task syz-executor240:10927 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor240 state:D stack:28728 pid:10927 tgid:10926 ppid:10909  task_flags:0x400140 flags:0x00080002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5583 [inline]
 __schedule+0x125e/0x6990 kernel/sched/core.c:7382
 __schedule_loop kernel/sched/core.c:7459 [inline]
 schedule+0xdd/0x2c0 kernel/sched/core.c:7474
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7531
 rwsem_down_write_slowpath+0x4c6/0x12f0 kernel/locking/rwsem.c:1215
 __down_write_common kernel/locking/rwsem.c:1347 [inline]
 __down_write kernel/locking/rwsem.c:1356 [inline]
 down_write_nested+0x1c6/0x1f0 kernel/locking/rwsem.c:1758
 inode_lock_nested include/linux/fs.h:1071 [inline]
 __start_dirop fs/namei.c:2924 [inline]
 start_dirop fs/namei.c:2948 [inline]
 filename_create+0x1c0/0x400 fs/namei.c:5108
 filename_mkdirat+0xb9/0x630 fs/namei.c:5454
 __do_sys_mkdirat fs/namei.c:5482 [inline]
 __se_sys_mkdirat fs/namei.c:5479 [inline]
 __x64_sys_mkdirat+0x89/0xc0 fs/namei.c:5479
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f7a340040b9
RSP: 002b:00007f7a33fd91d8 EFLAGS: 00000246 ORIG_RAX: 0000000000000102
RAX: ffffffffffffffda RBX: 00007f7a340b4b28 RCX: 00007f7a340040b9
RDX: 00000000000001ff RSI: 0000200000000200 RDI: 00000000ffffff9c
RBP: 00007f7a340b4b20 R08: 33203a6b63617473 R09: 33203a6b63617473
R10: 33203a6b63617473 R11: 0000000000000246 R12: 00007f7a34081720
R13: 0000200000000100 R14: 0000200000000800 R15: 74742f7665642f2e
 </TASK>
INFO: task syz-executor240:10930 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor240 state:D stack:28728 pid:10930 tgid:10926 ppid:10909  task_flags:0x400040 flags:0x00080002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5583 [inline]
 __schedule+0x125e/0x6990 kernel/sched/core.c:7382
 __schedule_loop kernel/sched/core.c:7459 [inline]
 schedule+0xdd/0x2c0 kernel/sched/core.c:7474
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7531
 rwsem_down_write_slowpath+0x4c6/0x12f0 kernel/locking/rwsem.c:1215
 __down_write_common kernel/locking/rwsem.c:1347 [inline]
 __down_write kernel/locking/rwsem.c:1356 [inline]
 down_write_nested+0x1c6/0x1f0 kernel/locking/rwsem.c:1758
 inode_lock_nested include/linux/fs.h:1071 [inline]
 __start_dirop fs/namei.c:2924 [inline]
 start_dirop fs/namei.c:2948 [inline]
 filename_rmdir+0x258/0x610 fs/namei.c:5583
 __do_sys_rmdir fs/namei.c:5613 [inline]
 __se_sys_rmdir fs/namei.c:5610 [inline]
 __x64_sys_rmdir+0x46/0x70 fs/namei.c:5610
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f7a340040b9
RSP: 002b:00007f7a33fb81d8 EFLAGS: 00000246 ORIG_RAX: 0000000000000054
RAX: ffffffffffffffda RBX: 00007f7a340b4b38 RCX: 00007f7a340040b9
RDX: 00007f7a340040b9 RSI: 0000000000000000 RDI: 0000200000000100
RBP: 00007f7a340b4b30 R08: 34203a6b63617473 R09: 34203a6b63617473
R10: 34203a6b63617473 R11: 0000000000000246 R12: 00007f7a34081720
R13: 0000200000000100 R14: 0000200000000800 R15: 74742f7665642f2e
 </TASK>

Showing all locks held in the system:
locks held by khungtaskd/44: 1, last CPU#2:
 #0: ffffffff8efeb2a0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffffffff8efeb2a0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffffffff8efeb2a0 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks+0x3d/0x184 kernel/locking/lockdep.c:6871
locks held by getty/5527: 2, on CPU#2:
 #0: ffff88802b5c80a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x24/0x80 drivers/tty/tty_ldisc.c:243
 #1: ffffc900000dd2e8 (&ldata->atomic_read_lock){+.+.}-{4:4}, at: n_tty_read+0x419/0x1540 drivers/tty/n_tty.c:2211
locks held by syz.2.1663/10888: 3, on CPU#0:
 #0: ffff88802434c478 (sb_writers#13){.+.+}-{0:0}, at: filename_rmdir+0x1ff/0x610 fs/namei.c:5579
 #1: ffff88803f4c0600 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:1071 [inline]
 #1: ffff88803f4c0600 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: __start_dirop fs/namei.c:2924 [inline]
 #1: ffff88803f4c0600 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: start_dirop fs/namei.c:2948 [inline]
 #1: ffff88803f4c0600 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: filename_rmdir+0x258/0x610 fs/namei.c:5583
 #2: ffff888052874d40 (&sb->s_type->i_mutex_key#23){+.+.}-{4:4}, at: inode_lock include/linux/fs.h:1026 [inline]
 #2: ffff888052874d40 (&sb->s_type->i_mutex_key#23){+.+.}-{4:4}, at: vfs_rmdir fs/namei.c:5518 [inline]
 #2: ffff888052874d40 (&sb->s_type->i_mutex_key#23){+.+.}-{4:4}, at: vfs_rmdir+0xed/0x8e0 fs/namei.c:5506
locks held by syz.1.1664/10891: 2, on CPU#3:
 #0: ffff88802434c478 (sb_writers#13){.+.+}-{0:0}, at: filename_rmdir+0x1ff/0x610 fs/namei.c:5579
 #1: ffff88803f4c0600 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:1071 [inline]
 #1: ffff88803f4c0600 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: __start_dirop fs/namei.c:2924 [inline]
 #1: ffff88803f4c0600 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: start_dirop fs/namei.c:2948 [inline]
 #1: ffff88803f4c0600 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: filename_rmdir+0x258/0x610 fs/namei.c:5583
locks held by syz.0.1666/10893: 2, on CPU#3:
 #0: ffff88802434c478 (sb_writers#13){.+.+}-{0:0}, at: filename_create+0x10d/0x400 fs/namei.c:5101
 #1: ffff88803f4c0600 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:1071 [inline]
 #1: ffff88803f4c0600 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: __start_dirop fs/namei.c:2924 [inline]
 #1: ffff88803f4c0600 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: start_dirop fs/namei.c:2948 [inline]
 #1: ffff88803f4c0600 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: filename_create+0x1c0/0x400 fs/namei.c:5108
locks held by syz.0.1666/10896: 2, on CPU#1:
 #0: ffff88802434c478 (sb_writers#13){.+.+}-{0:0}, at: filename_rmdir+0x1ff/0x610 fs/namei.c:5579
 #1: ffff88803f4c0600 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:1071 [inline]
 #1: ffff88803f4c0600 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: __start_dirop fs/namei.c:2924 [inline]
 #1: ffff88803f4c0600 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: start_dirop fs/namei.c:2948 [inline]
 #1: ffff88803f4c0600 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: filename_rmdir+0x258/0x610 fs/namei.c:5583
locks held by syz.3.1667/10895: 2, on CPU#2:
 #0: ffff88802434c478 (sb_writers#13){.+.+}-{0:0}, at: filename_create+0x10d/0x400 fs/namei.c:5101
 #1: ffff88803f4c0600 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:1071 [inline]
 #1: ffff88803f4c0600 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: __start_dirop fs/namei.c:2924 [inline]
 #1: ffff88803f4c0600 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: start_dirop fs/namei.c:2948 [inline]
 #1: ffff88803f4c0600 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: filename_create+0x1c0/0x400 fs/namei.c:5108
locks held by syz.3.1667/10897: 2, on CPU#1:
 #0: ffff88802434c478 (sb_writers#13){.+.+}-{0:0}, at: filename_rmdir+0x1ff/0x610 fs/namei.c:5579
 #1: ffff88803f4c0600 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:1071 [inline]
 #1: ffff88803f4c0600 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: __start_dirop fs/namei.c:2924 [inline]
 #1: ffff88803f4c0600 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: start_dirop fs/namei.c:2948 [inline]
 #1: ffff88803f4c0600 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: filename_rmdir+0x258/0x610 fs/namei.c:5583
locks held by syz-executor240/10918: 2, on CPU#2:
 #0: ffff88802434c478 (sb_writers#13){.+.+}-{0:0}, at: filename_create+0x10d/0x400 fs/namei.c:5101
 #1: ffff88803f4c0600 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:1071 [inline]
 #1: ffff88803f4c0600 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: __start_dirop fs/namei.c:2924 [inline]
 #1: ffff88803f4c0600 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: start_dirop fs/namei.c:2948 [inline]
 #1: ffff88803f4c0600 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: filename_create+0x1c0/0x400 fs/namei.c:5108
locks held by syz-executor240/10925: 2, on CPU#2:
 #0: ffff88802434c478 (sb_writers#13){.+.+}-{0:0}, at: filename_rmdir+0x1ff/0x610 fs/namei.c:5579
 #1: ffff88803f4c0600 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:1071 [inline]
 #1: ffff88803f4c0600 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: __start_dirop fs/namei.c:2924 [inline]
 #1: ffff88803f4c0600 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: start_dirop fs/namei.c:2948 [inline]
 #1: ffff88803f4c0600 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: filename_rmdir+0x258/0x610 fs/namei.c:5583
locks held by syz-executor240/10921: 2, on CPU#0:
 #0: ffff88802434c478 (sb_writers#13){.+.+}-{0:0}, at: filename_create+0x10d/0x400 fs/namei.c:5101
 #1: ffff88803f4c0600 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:1071 [inline]
 #1: ffff88803f4c0600 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: __start_dirop fs/namei.c:2924 [inline]
 #1: ffff88803f4c0600 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: start_dirop fs/namei.c:2948 [inline]
 #1: ffff88803f4c0600 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: filename_create+0x1c0/0x400 fs/namei.c:5108
locks held by syz-executor240/10928: 2, on CPU#3:
 #0: ffff88802434c478 (sb_writers#13){.+.+}-{0:0}, at: filename_rmdir+0x1ff/0x610 fs/namei.c:5579
 #1: ffff88803f4c0600 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:1071 [inline]
 #1: ffff88803f4c0600 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: __start_dirop fs/namei.c:2924 [inline]
 #1: ffff88803f4c0600 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: start_dirop fs/namei.c:2948 [inline]
 #1: ffff88803f4c0600 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: filename_rmdir+0x258/0x610 fs/namei.c:5583
locks held by syz-executor240/10924: 2, on CPU#3:
 #0: ffff88802434c478 (sb_writers#13){.+.+}-{0:0}, at: filename_create+0x10d/0x400 fs/namei.c:5101
 #1: ffff88803f4c0600 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:1071 [inline]
 #1: ffff88803f4c0600 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: __start_dirop fs/namei.c:2924 [inline]
 #1: ffff88803f4c0600 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: start_dirop fs/namei.c:2948 [inline]
 #1: ffff88803f4c0600 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: filename_create+0x1c0/0x400 fs/namei.c:5108
locks held by syz-executor240/10929: 2, on CPU#0:
 #0: ffff88802434c478 (sb_writers#13){.+.+}-{0:0}, at: filename_rmdir+0x1ff/0x610 fs/namei.c:5579
 #1: ffff88803f4c0600 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:1071 [inline]
 #1: ffff88803f4c0600 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: __start_dirop fs/namei.c:2924 [inline]
 #1: ffff88803f4c0600 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: start_dirop fs/namei.c:2948 [inline]
 #1: ffff88803f4c0600 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: filename_rmdir+0x258/0x610 fs/namei.c:5583
locks held by syz-executor240/10927: 2, on CPU#2:
 #0: ffff88802434c478 (sb_writers#13){.+.+}-{0:0}, at: filename_create+0x10d/0x400 fs/namei.c:5101
 #1: ffff88803f4c0600 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:1071 [inline]
 #1: ffff88803f4c0600 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: __start_dirop fs/namei.c:2924 [inline]
 #1: ffff88803f4c0600 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: start_dirop fs/namei.c:2948 [inline]
 #1: ffff88803f4c0600 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: filename_create+0x1c0/0x400 fs/namei.c:5108
locks held by syz-executor240/10930: 2, on CPU#0:
 #0: ffff88802434c478 (sb_writers#13){.+.+}-{0:0}, at: filename_rmdir+0x1ff/0x610 fs/namei.c:5579
 #1: ffff88803f4c0600 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:1071 [inline]
 #1: ffff88803f4c0600 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: __start_dirop fs/namei.c:2924 [inline]
 #1: ffff88803f4c0600 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: start_dirop fs/namei.c:2948 [inline]
 #1: ffff88803f4c0600 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: filename_rmdir+0x258/0x610 fs/namei.c:5583

=============================================

NMI backtrace for cpu 2
CPU: 2 UID: 0 PID: 44 Comm: khungtaskd Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 nmi_cpu_backtrace.cold+0x12d/0x151 lib/nmi_backtrace.c:123
 nmi_trigger_cpumask_backtrace+0x21f/0x2a0 lib/nmi_backtrace.c:66
 trigger_all_cpu_backtrace include/linux/nmi.h:164 [inline]
 __sys_info lib/sys_info.c:157 [inline]
 sys_info+0x141/0x190 lib/sys_info.c:165
 check_hung_uninterruptible_tasks kernel/hung_task.c:377 [inline]
 watchdog+0xd0f/0x10c0 kernel/hung_task.c:598
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Sending NMI from CPU 2 to CPUs 0-1,3:
NMI backtrace for cpu 0
CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:clockevents_program_event+0x1e8/0x820 kernel/time/clockevents.c:350
Code: ff 31 ff 41 89 c5 89 c6 e8 e5 84 10 00 45 84 ed 74 5f e8 cb 8a 10 00 48 8b 44 24 70 b9 e0 06 00 00 48 89 c2 48 c1 ea 20 0f 30 <31> db e8 b1 8a 10 00 48 b8 00 00 00 00 00 fc ff df 49 c7 04 04 00
RSP: 0018:ffffffff8ec07af8 EFLAGS: 00000002
RAX: 000001617e6ee9ae RBX: ffff88806a224040 RCX: 00000000000006e0
RDX: 0000000000000161 RSI: ffffffff81fcfb35 RDI: 0000000000000001
RBP: 0000008761b77d00 R08: 0000000000000000 R09: 0000000000000001
R10: 0000000000000000 R11: 0000000000000001 R12: 1ffffffff1d80f69
R13: 0000000000000001 R14: 0000000000000001 R15: ffff88806a224080
FS:  0000000000000000(0000) GS:ffff8880d56fc000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000558079d28660 CR3: 000000000ed96000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 tick_program_event+0xa9/0x140 kernel/time/tick-oneshot.c:48
 hrtimer_rearm_event kernel/time/hrtimer.c:710 [inline]
 __hrtimer_reprogram kernel/time/hrtimer.c:738 [inline]
 __hrtimer_reprogram kernel/time/hrtimer.c:713 [inline]
 hrtimer_reprogram+0x460/0x6c0 kernel/time/hrtimer.c:903
 hrtimer_start_range_ns+0x2bf/0x460 kernel/time/hrtimer.c:1540
 hrtimer_start include/linux/hrtimer.h:222 [inline]
 tick_nohz_restart kernel/time/tick-sched.c:777 [inline]
 tick_nohz_restart_sched_tick+0x152/0x2a0 kernel/time/tick-sched.c:1035
 tick_nohz_idle_update_tick kernel/time/tick-sched.c:1364 [inline]
 tick_nohz_idle_exit+0x393/0x4d0 kernel/time/tick-sched.c:1399
 do_idle+0x357/0x5b0 kernel/sched/idle.c:369
 cpu_startup_entry+0x4f/0x60 kernel/sched/idle.c:454
 rest_init+0x2d3/0x2e0 init/main.c:789
 start_kernel+0x48e/0x490 init/main.c:1247
 x86_64_start_reservations+0x24/0x30 arch/x86/kernel/head64.c:310
 x86_64_start_kernel+0x12b/0x130 arch/x86/kernel/head64.c:291
 common_startup_64+0x13e/0x158
 </TASK>
NMI backtrace for cpu 1
CPU: 1 UID: 0 PID: 43 Comm: pr/ttyS0 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:io_serial_out+0x8f/0xb0 drivers/tty/serial/8250/8250_port.c:432
Code: 48 8d 7d 40 44 89 e1 48 b8 00 00 00 00 00 fc ff df 48 89 fa d3 e3 48 c1 ea 03 80 3c 02 00 75 1c 66 03 5d 40 44 89 e8 89 da ee <5b> 5d 41 5c 41 5d e9 96 f6 23 06 e8 e1 2d c6 fc eb a0 e8 6a 2e c6
RSP: 0018:ffffc900007bfa18 EFLAGS: 00000006
RAX: 0000000000000000 RBX: 00000000000003f9 RCX: 0000000000000000
RDX: 00000000000003f9 RSI: ffffffff85c04215 RDI: ffffffff9becc980
RBP: ffffffff9becc940 R08: 000000000000001f R09: 0000000000000000
R10: 0000000000000003 R11: 6174203a4f464e49 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000056 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff8880d57fc000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00005580b301d168 CR3: 000000000ed96000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 serial_out drivers/tty/serial/8250/8250.h:139 [inline]
 __serial8250_clear_IER+0xa7/0xd0 drivers/tty/serial/8250/8250_port.c:739
 serial8250_console_write+0x106/0x14f0 drivers/tty/serial/8250/8250_port.c:3484
 nbcon_emit_next_record+0x8f7/0xa70 kernel/printk/nbcon.c:1070
 nbcon_emit_one+0x1a8/0x2b0 kernel/printk/nbcon.c:1157
 nbcon_kthread_func+0x5ef/0x7f0 kernel/printk/nbcon.c:1271
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
NMI backtrace for cpu 3
CPU: 3 UID: 0 PID: 5125 Comm: klogd Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:number+0x689/0xc90 lib/vsprintf.c:531
Code: 83 c3 01 89 ee e8 87 b2 30 f6 83 fd ff 75 b6 8b 44 24 14 48 8b 4c 24 18 c7 44 24 14 ff ff ff ff 48 8d 44 01 01 48 89 44 24 18 <e8> f2 b7 30 f6 0f b6 5c 24 47 31 ff 89 de e8 f4 b1 30 f6 84 db 74
RSP: 0018:ffffc90027cf7748 EFLAGS: 00000282
RAX: 0000000000000000 RBX: 00000000fffffffd RCX: ffff888028570000
RDX: 00000000fffffffd RSI: ffffffff8bdccd89 RDI: 0000000000000005
RBP: 00000000fffffffd R08: 0000000000000000 R09: 00000000fffffffd
R10: ffffc90027cf7b70 R11: 0000000000000000 R12: 0000000000000003
R13: ffffc900a7cf7b6f R14: 0000000000000001 R15: 0000000000000000
FS:  00007f5c4e138c80(0000) GS:ffff8880d59fc000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f91bc31e708 CR3: 0000000035a07000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 vsnprintf+0x30e/0x1300 lib/vsprintf.c:2912
 sprintf+0xcc/0x100 lib/vsprintf.c:3115
 print_syslog kernel/printk/printk.c:1352 [inline]
 info_print_prefix+0x2e4/0x350 kernel/printk/printk.c:1382
 record_print_text+0x143/0x3c0 kernel/printk/printk.c:1434
 syslog_print+0x467/0x610 kernel/printk/printk.c:1645
 do_syslog+0x5bd/0x6d0 kernel/printk/printk.c:1763
 __do_sys_syslog kernel/printk/printk.c:1855 [inline]
 __se_sys_syslog kernel/printk/printk.c:1853 [inline]
 __x64_sys_syslog+0x74/0xb0 kernel/printk/printk.c:1853
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f5c4e302a37
Code: 73 01 c3 48 8b 0d c1 f3 0c 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 b8 67 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 91 f3 0c 00 f7 d8 64 89 01 48
RSP: 002b:00007fff47c1b498 EFLAGS: 00000206 ORIG_RAX: 0000000000000067
RAX: ffffffffffffffda RBX: 00007f5c4e4a2490 RCX: 00007f5c4e302a37
RDX: 00000000000003ff RSI: 00007f5c4e4a2490 RDI: 0000000000000002
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000004000 R11: 0000000000000206 R12: 00007f5c4e4a2490
R13: 00007f5c4e47fdfe R14: 00007f5c4e4a2520 R15: 00007f5c4e4a2520
 </TASK>


Tested on:

commit:         cbbddb6b Merge tag 'power-utilities-2026.10.31' of git..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14e0b5e1580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=245a52f53bb4b06b
dashboard link: https://syzkaller.appspot.com/bug?extid=39a2135de1558208d3b3
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15cb4959580000

