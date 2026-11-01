Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793546104;
	b=HC6HA80uVpVHbJk7kbLSbbosnPdlqzq2+EHtLqxYXIKwK8MKrY8yu8u9Q2lF6soSj/51
	 n/D7K80xcbZOHHShzSBv3Skpnd1aamkZOffa8vYU7oBc1UoPqS+HLv79e/Ce0VhL4QAMX
	 0WLFP3gVu+KhH2SFpIGE3odniFpkp7kG5pyE1vkmgl7Ml+8lSeOajtFMkIjJevvy5ggTH
	 JxCeGYxTC3b5rrnWBH00VZGroi9uVxDg88GrTSrWRsVOkD2Krm2mASo8sIHHPx9aWSc/P
	 JoBzg+XUTBgPOMYiSCDmUBO9b1rMDYCSco0v/dbZEks+sx2iFUpH0cuoUyFFdPua50A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793546104;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=kYfIsGHzo52iepnRptslwktjB06+3KhUix0NsxyyQaQ=;
	b=NXb+cVTNqb5NMmre8TmiQ7vf7ehTnR0lDPEi7SmNE604gW5Bs8EW1QDOpIXQVeSTPEJj
	 KR/2vXqyu+W4elWWsS1xhZImB6Tgds2skYwWUFiN6OCjSzb3HF/eKbnOq3mSLN6W1sYdE
	 u/9r3huUcz4UsVcuKG4xtbaKhN8N6VEgeakijClcuQ+rNhirtd4pen2iWHX99rDVWALRS
	 qKdwfgCaYOZAw/HcUyn/TEDyHriqzw9thNTAdoGD2lfOTqHW0ZaXJJXxVO1a72caLh/pj
	 J+WcpHVj3pMtoWhCC8aCu2H/UUX2Gd5faaKnQx3qQjA4q9aNzXNEwajFUZ0IXgtOheQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529CB606A326
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 15:15:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 529CB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4dab94dc3e7so3481555b6e.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 07:15:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793546102; x=1794150902;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kYfIsGHzo52iepnRptslwktjB06+3KhUix0NsxyyQaQ=;
        b=g5eJDQHDQ01CwGNJ+k01rROWWr2SaDH1rpZHnrQSEQKKiEh7clveCll8lJLApqfWh4
         YZ1kZAKCw/x4GhymVtcD0E4EsR2zo0YiXz821TdC6OSrAQmkAX6FNdCq4vRRqFtWsWT9
         ZBkY6ZXREzBHDokruSsPbFyD6YubB02cxn1hcPoKJu+HgNY16A5uhjwy3NSN8ujXk8q5
         fauvkr/oGSI2M/HRwoejbGN0+N14vBl029JK47M8GhYpZxdVxTIfYKjmLtB2E3NxY0Qx
         lmlRdAa9c5csiakXL3ynT9wp9HFvoyEZ9prXrVKGZyeracpsHIB6BLcohzS0uEjmKpsr
         dndg==
X-Gm-Message-State: AFq9FYKIH32OD7wNNZfb5K8aapKS1Yb9Sbk3cZVjXesE4Wxj6Oeu1h/u
	MEbcANbHvQgF0viI9i86mDzOaRKysCZim2Ep3ierCUnLQoWJ83emhyGkXClnNP2Kjf+JDbc6lWz
	Xjah3r1JFiL5LfaSRpiC7R2xSJhtDbtxPsVojNSqfqc9/vHfUPcemyzrjz/A=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:6404:b0:4f2:4d2f:7ba with SMTP id
 5614622812f47-5640d953debmr5487588b6e.8.1793546101779; Sun, 01 Nov 2026
 07:15:01 -0800 (PST)
Date: Sun, 01 Nov 2026 07:15:01 -0800
In-Reply-To: <CAD8CXUkW04biA+gmiBbKRCn7FsXqyQUse1orNKytFn09QBG1bg@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae75775.6552420f.2a0efc.0058.GAE@google.com>
Subject: Re: [syzbot] [serial?] KASAN: slab-use-after-free Read in check_tty_count
From: syzbot <syzbot+39a2135de1558208d3b3@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	varun.singh10011@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
INFO: task hung in gserial_free_port

INFO: task syz-executor106:10885 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor106 state:D stack:27992 pid:10885 tgid:10880 ppid:10849  task_flags:0x400040 flags:0x00080802
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5583 [inline]
 __schedule+0x125e/0x6990 kernel/sched/core.c:7382
 __schedule_loop kernel/sched/core.c:7459 [inline]
 schedule+0xdd/0x2c0 kernel/sched/core.c:7474
 gserial_free_port+0x1fd/0x2e0 drivers/usb/gadget/function/u_serial.c:1292
 gserial_free_line+0x107/0x1e0 drivers/usb/gadget/function/u_serial.c:1312
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
RIP: 0033:0x7f5197d3a0b9
RSP: 002b:00007f5197cee1d8 EFLAGS: 00000246 ORIG_RAX: 0000000000000054
RAX: ffffffffffffffda RBX: 00007f5197deab38 RCX: 00007f5197d3a0b9
RDX: 00007f5197d3a0b9 RSI: 0000000000000000 RDI: 0000200000000100
RBP: 00007f5197deab30 R08: 34203a6b63617473 R09: 34203a6b63617473
R10: 34203a6b63617473 R11: 0000000000000246 R12: 00007f5197db7720
R13: 0000200000000100 R14: 0000200000000800 R15: 74742f7665642f2e
 </TASK>
INFO: task syz-executor106:10886 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor106 state:D stack:28664 pid:10886 tgid:10883 ppid:10854  task_flags:0x400040 flags:0x00080002
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
RIP: 0033:0x7f5197d3a0b9
RSP: 002b:00007f5197cee1d8 EFLAGS: 00000246 ORIG_RAX: 0000000000000054
RAX: ffffffffffffffda RBX: 00007f5197deab38 RCX: 00007f5197d3a0b9
RDX: 00007f5197d3a0b9 RSI: 0000000000000000 RDI: 0000200000000100
RBP: 00007f5197deab30 R08: 34203a6b63617473 R09: 34203a6b63617473
R10: 34203a6b63617473 R11: 0000000000000246 R12: 00007f5197db7720
R13: 0000200000000100 R14: 0000200000000800 R15: 74742f7665642f2e
 </TASK>
INFO: task syz.1.1632:10888 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.1.1632      state:D stack:28728 pid:10888 tgid:10887 ppid:6233   task_flags:0x400140 flags:0x00080002
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
RIP: 0033:0x7f100bb9e0d9
RSP: 002b:00007f100c9c1028 EFLAGS: 00000246 ORIG_RAX: 0000000000000102
RAX: ffffffffffffffda RBX: 00007f100be25fa0 RCX: 00007f100bb9e0d9
RDX: 00000000000001ff RSI: 0000200000000200 RDI: ffffffffffffff9c
RBP: 00007f100bc35024 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f100be26038 R14: 00007f100be25fa0 R15: 00007fff66dc0bb8
 </TASK>
INFO: task syz.1.1632:10899 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.1.1632      state:D stack:28728 pid:10899 tgid:10887 ppid:6233   task_flags:0x400040 flags:0x00080002
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
RIP: 0033:0x7f100bb9e0d9
RSP: 002b:00007f100c9a0028 EFLAGS: 00000246 ORIG_RAX: 0000000000000054
RAX: ffffffffffffffda RBX: 00007f100be26090 RCX: 00007f100bb9e0d9
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000200000000100
RBP: 00007f100bc35024 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f100be26128 R14: 00007f100be26090 R15: 00007fff66dc0bb8
 </TASK>
INFO: task syz.2.1633:10891 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.2.1633      state:D stack:28664 pid:10891 tgid:10889 ppid:6240   task_flags:0x400140 flags:0x00080002
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
RIP: 0033:0x7fa118b9e0d9
RSP: 002b:00007fa119b30028 EFLAGS: 00000246 ORIG_RAX: 0000000000000102
RAX: ffffffffffffffda RBX: 00007fa118e25fa0 RCX: 00007fa118b9e0d9
RDX: 00000000000001ff RSI: 0000200000000200 RDI: ffffffffffffff9c
RBP: 00007fa118c35024 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fa118e26038 R14: 00007fa118e25fa0 R15: 00007ffe9a94aa68
 </TASK>
INFO: task syz.2.1633:10900 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.2.1633      state:D stack:28728 pid:10900 tgid:10889 ppid:6240   task_flags:0x400040 flags:0x00080002
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
RIP: 0033:0x7fa118b9e0d9
RSP: 002b:00007fa119b0f028 EFLAGS: 00000246 ORIG_RAX: 0000000000000054
RAX: ffffffffffffffda RBX: 00007fa118e26090 RCX: 00007fa118b9e0d9
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000200000000100
RBP: 00007fa118c35024 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fa118e26128 R14: 00007fa118e26090 R15: 00007ffe9a94aa68
 </TASK>
INFO: task syz.0.1635:10894 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.0.1635      state:D stack:26744 pid:10894 tgid:10890 ppid:6231   task_flags:0x400140 flags:0x00080002
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
RIP: 0033:0x7f009799e0d9
RSP: 002b:00007f00988e1028 EFLAGS: 00000246 ORIG_RAX: 0000000000000054
RAX: ffffffffffffffda RBX: 00007f0097c25fa0 RCX: 00007f009799e0d9
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000200000000100
RBP: 00007f0097a35024 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f0097c26038 R14: 00007f0097c25fa0 R15: 00007ffce222f5b8
 </TASK>
INFO: task syz.3.1634:10893 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.3.1634      state:D stack:28728 pid:10893 tgid:10892 ppid:6243   task_flags:0x400140 flags:0x00080002
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
RIP: 0033:0x7f647799e0d9
RSP: 002b:00007f647883f028 EFLAGS: 00000246 ORIG_RAX: 0000000000000102
RAX: ffffffffffffffda RBX: 00007f6477c25fa0 RCX: 00007f647799e0d9
RDX: 00000000000001ff RSI: 0000200000000200 RDI: ffffffffffffff9c
RBP: 00007f6477a35024 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f6477c26038 R14: 00007f6477c25fa0 R15: 00007fff36631a88
 </TASK>
INFO: task syz.3.1634:10901 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.3.1634      state:D stack:28728 pid:10901 tgid:10892 ppid:6243   task_flags:0x400040 flags:0x00080002
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
RIP: 0033:0x7f647799e0d9
RSP: 002b:00007f647881e028 EFLAGS: 00000246 ORIG_RAX: 0000000000000054
RAX: ffffffffffffffda RBX: 00007f6477c26090 RCX: 00007f647799e0d9
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000200000000100
RBP: 00007f6477a35024 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f6477c26128 R14: 00007f6477c26090 R15: 00007fff36631a88
 </TASK>
INFO: task syz-executor106:10897 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor106 state:D stack:28728 pid:10897 tgid:10895 ppid:10852  task_flags:0x400140 flags:0x00080002
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
RIP: 0033:0x7f5197d3a0b9
RSP: 002b:00007f5197d0f1d8 EFLAGS: 00000246 ORIG_RAX: 0000000000000102
RAX: ffffffffffffffda RBX: 00007f5197deab28 RCX: 00007f5197d3a0b9
RDX: 00000000000001ff RSI: 0000200000000200 RDI: 00000000ffffff9c
RBP: 00007f5197deab20 R08: 36203a6b63617473 R09: 36203a6b63617473
R10: 36203a6b63617473 R11: 0000000000000246 R12: 00007f5197db7720
R13: 0000200000000100 R14: 0000200000000800 R15: 74742f7665642f2e
 </TASK>
INFO: task syz-executor106:10902 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor106 state:D stack:28728 pid:10902 tgid:10895 ppid:10852  task_flags:0x400040 flags:0x00080002
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
RIP: 0033:0x7f5197d3a0b9
RSP: 002b:00007f5197cee1d8 EFLAGS: 00000246 ORIG_RAX: 0000000000000054
RAX: ffffffffffffffda RBX: 00007f5197deab38 RCX: 00007f5197d3a0b9
RDX: 00007f5197d3a0b9 RSI: 0000000000000000 RDI: 0000200000000100
RBP: 00007f5197deab30 R08: 37203a6b63617473 R09: 37203a6b63617473
R10: 37203a6b63617473 R11: 0000000000000246 R12: 00007f5197db7720
R13: 0000200000000100 R14: 0000200000000800 R15: 74742f7665642f2e
 </TASK>
INFO: task syz-executor106:10898 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor106 state:D stack:28728 pid:10898 tgid:10896 ppid:10853  task_flags:0x400140 flags:0x00080002
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
RIP: 0033:0x7f5197d3a0b9
RSP: 002b:00007f5197d0f1d8 EFLAGS: 00000246 ORIG_RAX: 0000000000000102
RAX: ffffffffffffffda RBX: 00007f5197deab28 RCX: 00007f5197d3a0b9
RDX: 00000000000001ff RSI: 0000200000000200 RDI: 00000000ffffff9c
RBP: 00007f5197deab20 R08: 36203a6b63617473 R09: 36203a6b63617473
R10: 36203a6b63617473 R11: 0000000000000246 R12: 00007f5197db7720
R13: 0000200000000100 R14: 0000200000000800 R15: 74742f7665642f2e
 </TASK>
INFO: task syz-executor106:10903 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor106 state:D stack:28728 pid:10903 tgid:10896 ppid:10853  task_flags:0x400040 flags:0x00080002
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
RIP: 0033:0x7f5197d3a0b9
RSP: 002b:00007f5197cee1d8 EFLAGS: 00000246 ORIG_RAX: 0000000000000054
RAX: ffffffffffffffda RBX: 00007f5197deab38 RCX: 00007f5197d3a0b9
RDX: 00007f5197d3a0b9 RSI: 0000000000000000 RDI: 0000200000000100
RBP: 00007f5197deab30 R08: 37203a6b63617473 R09: 37203a6b63617473
R10: 37203a6b63617473 R11: 0000000000000246 R12: 00007f5197db7720
R13: 0000200000000100 R14: 0000200000000800 R15: 74742f7665642f2e
 </TASK>

Showing all locks held in the system:
locks held by pr/ttyS0/44: 2, last CPU#2:
 #0: ffffffff8efd74d8 (console_srcu){....}-{0:0}, at: rcu_try_lock_acquire include/linux/rcupdate.h:314 [inline]
 #0: ffffffff8efd74d8 (console_srcu){....}-{0:0}, at: srcu_read_lock_nmisafe include/linux/srcu.h:493 [inline]
 #0: ffffffff8efd74d8 (console_srcu){....}-{0:0}, at: console_srcu_read_lock+0x49/0x60 kernel/printk/printk.c:291
 #1: ffffffff9becc958 (&port_lock_key){-.-.}-{3:3}, at: __uart_port_lock_irqsave include/linux/serial_core.h:613 [inline]
 #1: ffffffff9becc958 (&port_lock_key){-.-.}-{3:3}, at: univ8250_console_device_lock+0x64/0xc0 drivers/tty/serial/8250/8250_core.c:413
locks held by khungtaskd/45: 1, last CPU#1:
 #0: ffffffff8efeb2a0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffffffff8efeb2a0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffffffff8efeb2a0 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks+0x3d/0x184 kernel/locking/lockdep.c:6871
locks held by syslogd/5114: 2, last CPU#3:
 #0: ffff888026059f78 (&u->iolock){+.+.}-{4:4}, at: __unix_dgram_recvmsg+0x298/0xd40 net/unix/af_unix.c:2591
 #1: ffff888026059a98 (rlock-AF_UNIX){+.+.}-{3:3}, at: psi_sched_switch kernel/sched/stats.h:218 [inline]
 #1: ffff888026059a98 (rlock-AF_UNIX){+.+.}-{3:3}, at: __schedule+0x2b79/0x6990 kernel/sched/core.c:7376
locks held by getty/5531: 2, on CPU#2:
 #0: ffff88802922d0a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x24/0x80 drivers/tty/tty_ldisc.c:243
 #1: ffffc9000337b2e8 (&ldata->atomic_read_lock){+.+.}-{4:4}, at: n_tty_read+0x419/0x1540 drivers/tty/n_tty.c:2211
locks held by syz-executor106/10885: 3, on CPU#0:
 #0: ffff8880241a2478 (sb_writers#13){.+.+}-{0:0}, at: filename_rmdir+0x1ff/0x610 fs/namei.c:5579
 #1: ffff88803ff0bf00 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:1071 [inline]
 #1: ffff88803ff0bf00 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: __start_dirop fs/namei.c:2924 [inline]
 #1: ffff88803ff0bf00 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: start_dirop fs/namei.c:2948 [inline]
 #1: ffff88803ff0bf00 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: filename_rmdir+0x258/0x610 fs/namei.c:5583
 #2: ffff88802941f800 (&sb->s_type->i_mutex_key#23){+.+.}-{4:4}, at: inode_lock include/linux/fs.h:1026 [inline]
 #2: ffff88802941f800 (&sb->s_type->i_mutex_key#23){+.+.}-{4:4}, at: vfs_rmdir fs/namei.c:5518 [inline]
 #2: ffff88802941f800 (&sb->s_type->i_mutex_key#23){+.+.}-{4:4}, at: vfs_rmdir+0xed/0x8e0 fs/namei.c:5506
locks held by syz-executor106/10886: 2, on CPU#1:
 #0: ffff8880241a2478 (sb_writers#13){.+.+}-{0:0}, at: filename_rmdir+0x1ff/0x610 fs/namei.c:5579
 #1: ffff88803ff0bf00 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:1071 [inline]
 #1: ffff88803ff0bf00 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: __start_dirop fs/namei.c:2924 [inline]
 #1: ffff88803ff0bf00 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: start_dirop fs/namei.c:2948 [inline]
 #1: ffff88803ff0bf00 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: filename_rmdir+0x258/0x610 fs/namei.c:5583
locks held by syz.1.1632/10888: 2, on CPU#0:
 #0: ffff8880241a2478 (sb_writers#13){.+.+}-{0:0}, at: filename_create+0x10d/0x400 fs/namei.c:5101
 #1: ffff88803ff0bf00 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:1071 [inline]
 #1: ffff88803ff0bf00 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: __start_dirop fs/namei.c:2924 [inline]
 #1: ffff88803ff0bf00 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: start_dirop fs/namei.c:2948 [inline]
 #1: ffff88803ff0bf00 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: filename_create+0x1c0/0x400 fs/namei.c:5108
locks held by syz.1.1632/10899: 2, on CPU#3:
 #0: ffff8880241a2478 (sb_writers#13){.+.+}-{0:0}, at: filename_rmdir+0x1ff/0x610 fs/namei.c:5579
 #1: ffff88803ff0bf00 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:1071 [inline]
 #1: ffff88803ff0bf00 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: __start_dirop fs/namei.c:2924 [inline]
 #1: ffff88803ff0bf00 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: start_dirop fs/namei.c:2948 [inline]
 #1: ffff88803ff0bf00 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: filename_rmdir+0x258/0x610 fs/namei.c:5583
locks held by syz.2.1633/10891: 2, on CPU#0:
 #0: ffff8880241a2478 (sb_writers#13){.+.+}-{0:0}, at: filename_create+0x10d/0x400 fs/namei.c:5101
 #1: ffff88803ff0bf00 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:1071 [inline]
 #1: ffff88803ff0bf00 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: __start_dirop fs/namei.c:2924 [inline]
 #1: ffff88803ff0bf00 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: start_dirop fs/namei.c:2948 [inline]
 #1: ffff88803ff0bf00 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: filename_create+0x1c0/0x400 fs/namei.c:5108
locks held by syz.2.1633/10900: 2, on CPU#0:
 #0: ffff8880241a2478 (sb_writers#13){.+.+}-{0:0}, at: filename_rmdir+0x1ff/0x610 fs/namei.c:5579
 #1: ffff88803ff0bf00 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:1071 [inline]
 #1: ffff88803ff0bf00 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: __start_dirop fs/namei.c:2924 [inline]
 #1: ffff88803ff0bf00 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: start_dirop fs/namei.c:2948 [inline]
 #1: ffff88803ff0bf00 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: filename_rmdir+0x258/0x610 fs/namei.c:5583
locks held by syz.0.1635/10894: 2, on CPU#1:
 #0: ffff8880241a2478 (sb_writers#13){.+.+}-{0:0}, at: filename_rmdir+0x1ff/0x610 fs/namei.c:5579
 #1: ffff88803ff0bf00 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:1071 [inline]
 #1: ffff88803ff0bf00 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: __start_dirop fs/namei.c:2924 [inline]
 #1: ffff88803ff0bf00 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: start_dirop fs/namei.c:2948 [inline]
 #1: ffff88803ff0bf00 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: filename_rmdir+0x258/0x610 fs/namei.c:5583
locks held by syz.3.1634/10893: 2, on CPU#3:
 #0: ffff8880241a2478 (sb_writers#13){.+.+}-{0:0}, at: filename_create+0x10d/0x400 fs/namei.c:5101
 #1: ffff88803ff0bf00 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:1071 [inline]
 #1: ffff88803ff0bf00 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: __start_dirop fs/namei.c:2924 [inline]
 #1: ffff88803ff0bf00 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: start_dirop fs/namei.c:2948 [inline]
 #1: ffff88803ff0bf00 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: filename_create+0x1c0/0x400 fs/namei.c:5108
locks held by syz.3.1634/10901: 2, on CPU#3:
 #0: ffff8880241a2478 (sb_writers#13){.+.+}-{0:0}, at: filename_rmdir+0x1ff/0x610 fs/namei.c:5579
 #1: ffff88803ff0bf00 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:1071 [inline]
 #1: ffff88803ff0bf00 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: __start_dirop fs/namei.c:2924 [inline]
 #1: ffff88803ff0bf00 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: start_dirop fs/namei.c:2948 [inline]
 #1: ffff88803ff0bf00 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: filename_rmdir+0x258/0x610 fs/namei.c:5583
locks held by syz-executor106/10897: 2, on CPU#2:
 #0: ffff8880241a2478 (sb_writers#13){.+.+}-{0:0}, at: filename_create+0x10d/0x400 fs/namei.c:5101
 #1: ffff88803ff0bf00 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:1071 [inline]
 #1: ffff88803ff0bf00 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: __start_dirop fs/namei.c:2924 [inline]
 #1: ffff88803ff0bf00 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: start_dirop fs/namei.c:2948 [inline]
 #1: ffff88803ff0bf00 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: filename_create+0x1c0/0x400 fs/namei.c:5108
locks held by syz-executor106/10902: 2, on CPU#0:
 #0: ffff8880241a2478 (sb_writers#13){.+.+}-{0:0}, at: filename_rmdir+0x1ff/0x610 fs/namei.c:5579
 #1: ffff88803ff0bf00 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:1071 [inline]
 #1: ffff88803ff0bf00 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: __start_dirop fs/namei.c:2924 [inline]
 #1: ffff88803ff0bf00 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: start_dirop fs/namei.c:2948 [inline]
 #1: ffff88803ff0bf00 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: filename_rmdir+0x258/0x610 fs/namei.c:5583
locks held by syz-executor106/10898: 2, on CPU#1:
 #0: ffff8880241a2478 (sb_writers#13){.+.+}-{0:0}, at: filename_create+0x10d/0x400 fs/namei.c:5101
 #1: ffff88803ff0bf00 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:1071 [inline]
 #1: ffff88803ff0bf00 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: __start_dirop fs/namei.c:2924 [inline]
 #1: ffff88803ff0bf00 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: start_dirop fs/namei.c:2948 [inline]
 #1: ffff88803ff0bf00 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: filename_create+0x1c0/0x400 fs/namei.c:5108
locks held by syz-executor106/10903: 2, on CPU#3:
 #0: ffff8880241a2478 (sb_writers#13){.+.+}-{0:0}, at: filename_rmdir+0x1ff/0x610 fs/namei.c:5579
 #1: ffff88803ff0bf00 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:1071 [inline]
 #1: ffff88803ff0bf00 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: __start_dirop fs/namei.c:2924 [inline]
 #1: ffff88803ff0bf00 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: start_dirop fs/namei.c:2948 [inline]
 #1: ffff88803ff0bf00 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: filename_rmdir+0x258/0x610 fs/namei.c:5583

=============================================

NMI backtrace for cpu 1
CPU: 1 UID: 0 PID: 45 Comm: khungtaskd Not tainted syzkaller #0 PREEMPT(full) 
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
Sending NMI from CPU 1 to CPUs 0,2-3:
NMI backtrace for cpu 2
CPU: 2 UID: 0 PID: 44 Comm: pr/ttyS0 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:io_serial_out+0x8f/0xb0 drivers/tty/serial/8250/8250_port.c:432
Code: 48 8d 7d 40 44 89 e1 48 b8 00 00 00 00 00 fc ff df 48 89 fa d3 e3 48 c1 ea 03 80 3c 02 00 75 1c 66 03 5d 40 44 89 e8 89 da ee <5b> 5d 41 5c 41 5d e9 96 f6 23 06 e8 e1 2d c6 fc eb a0 e8 6a 2e c6
RSP: 0018:ffffc900007cf9d8 EFLAGS: 00000002
RAX: 0000000000000039 RBX: 00000000000003f8 RCX: 0000000000000000
RDX: 00000000000003f8 RSI: ffffffff85c04215 RDI: ffffffff9becc980
RBP: ffffffff9becc940 R08: 000000000000001f R09: 0000000000000000
R10: 0000000000000003 R11: 6f4e202020202020 R12: 0000000000000000
R13: 0000000000000039 R14: 0000000000000009 R15: ffffc900007cfda8
FS:  0000000000000000(0000) GS:ffff8880d58fc000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055ba56071168 CR3: 000000000ed96000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 serial_port_out include/linux/serial_core.h:817 [inline]
 serial8250_console_putchar drivers/tty/serial/8250/8250_port.c:3311 [inline]
 __serial8250_console_fifo_write+0xd6/0x290 drivers/tty/serial/8250/8250_port.c:3383
 serial8250_console_fifo_write drivers/tty/serial/8250/8250_port.c:3402 [inline]
 __serial8250_console_write drivers/tty/serial/8250/8250_port.c:3456 [inline]
 serial8250_console_write+0x1108/0x14f0 drivers/tty/serial/8250/8250_port.c:3520
 nbcon_emit_next_record+0x8f7/0xa70 kernel/printk/nbcon.c:1070
 nbcon_emit_one+0x1a8/0x2b0 kernel/printk/nbcon.c:1157
 nbcon_kthread_func+0x5ef/0x7f0 kernel/printk/nbcon.c:1271
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
NMI backtrace for cpu 0
CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:pv_native_safe_halt+0xf/0x20 arch/x86/kernel/paravirt.c:64
Code: 77 a5 02 e9 43 61 03 00 0f 1f 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa eb 07 0f 00 2d c3 cd 2a 00 fb f4 <c3> cc cc cc cc 66 2e 0f 1f 84 00 00 00 00 00 66 90 90 90 90 90 90
RSP: 0018:ffffffff8ec07cf0 EFLAGS: 00000202
RAX: 0000000000542de9 RBX: ffffffff8ec91540 RCX: ffffffff8be0f325
RDX: 0000000000000001 RSI: ffffffff8e599301 RDI: ffffffff8c832080
RBP: fffffbfff1d922a8 R08: 0000000000000001 R09: ffffed100d446825
R10: ffff88806a23412b R11: 0000000000000001 R12: 0000000000000000
R13: 0000000000000000 R14: 1ffffffff1d80fa2 R15: dffffc0000000000
FS:  0000000000000000(0000) GS:ffff8880d56fc000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055ba40e20660 CR3: 000000000ed96000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 arch_safe_halt arch/x86/include/asm/paravirt.h:62 [inline]
 default_idle+0x9/0x10 arch/x86/kernel/process.c:768
 default_idle_call+0x6c/0xb0 kernel/sched/idle.c:122
 cpuidle_idle_call kernel/sched/idle.c:199 [inline]
 do_idle+0x3ae/0x5b0 kernel/sched/idle.c:355
 cpu_startup_entry+0x4f/0x60 kernel/sched/idle.c:454
 rest_init+0x2d3/0x2e0 init/main.c:789
 start_kernel+0x48e/0x490 init/main.c:1247
 x86_64_start_reservations+0x24/0x30 arch/x86/kernel/head64.c:310
 x86_64_start_kernel+0x12b/0x130 arch/x86/kernel/head64.c:291
 common_startup_64+0x13e/0x158
 </TASK>
NMI backtrace for cpu 3
CPU: 3 UID: 0 PID: 5121 Comm: klogd Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:__sanitizer_cov_trace_pc+0x6b/0x70 kernel/kcov.c:241
Code: 82 18 17 00 00 83 f8 02 75 20 48 8b 8a 20 17 00 00 8b 92 1c 17 00 00 48 8b 01 48 83 c0 01 48 39 d0 73 07 48 89 01 48 89 34 c1 <c3> cc cc cc cc 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3
RSP: 0018:ffffc900035ffad0 EFLAGS: 00000293
RAX: 0000000000000000 RBX: 1ffff920006bff5d RCX: 0000000000000000
RDX: ffff8880284b8000 RSI: ffffffff84ea2310 RDI: 0000000000000005
RBP: 0000000000000019 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000003 R11: 0000000000000000 R12: 0000000000000004
R13: 0000000000000000 R14: 0000000000000000 R15: 000000000000004e
FS:  00007fb3ca47cc80(0000) GS:ffff8880d59fc000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f2b7092b708 CR3: 00000000378d6000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 avc_audit_required security/selinux/include/avc.h:94 [inline]
 avc_audit security/selinux/include/avc.h:129 [inline]
 avc_has_perm+0x100/0x1e0 security/selinux/avc.c:1205
 sock_has_perm+0x24d/0x320 security/selinux/hooks.c:5061
 selinux_socket_sendmsg+0x8f/0x2f0 security/selinux/hooks.c:5409
 security_socket_sendmsg+0xfb/0x230 security/security.c:4391
 __sock_sendmsg net/socket.c:815 [inline]
 __sys_sendto+0x278/0x4e0 net/socket.c:2283
 __do_sys_sendto net/socket.c:2290 [inline]
 __se_sys_sendto net/socket.c:2286 [inline]
 __x64_sys_sendto+0xe0/0x1c0 net/socket.c:2286
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fb3ca5cc407
Code: 48 89 fa 4c 89 df e8 38 aa 00 00 8b 93 08 03 00 00 59 5e 48 83 f8 fc 74 1a 5b c3 0f 1f 84 00 00 00 00 00 48 8b 44 24 10 0f 05 <5b> c3 0f 1f 80 00 00 00 00 83 e2 39 83 fa 08 75 de e8 23 ff ff ff
RSP: 002b:00007ffcd43b78c0 EFLAGS: 00000202 ORIG_RAX: 000000000000002c
RAX: ffffffffffffffda RBX: 00007fb3ca47cc80 RCX: 00007fb3ca5cc407
RDX: 00000000000000a0 RSI: 00007ffcd43b7a00 RDI: 0000000000000003
RBP: 00007ffcd43b7e30 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000004000 R11: 0000000000000202 R12: 00007ffcd43b7e48
R13: 00007ffcd43b7a00 R14: 0000000000000085 R15: 00007ffcd43b7a00
 </TASK>


Tested on:

commit:         cbbddb6b Merge tag 'power-utilities-2026.10.31' of git..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14d3b935580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=245a52f53bb4b06b
dashboard link: https://syzkaller.appspot.com/bug?extid=39a2135de1558208d3b3
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1256b5e1580000

