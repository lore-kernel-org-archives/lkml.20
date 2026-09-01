Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705463793BA
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 06:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788245706; cv=none; b=QT/WkEz60Ei0yTviza3OAtSySBRP7echpAKgaqo7NYKHf1pXb2ZJiRyul5MZ8qAra9MTxV6E5xP65g0Wck8wlqfvcER4SkBNBCiphz+q8/ASGbRiZTLQD5BuPg4ZkfQOQBKZo3SezeaPmaI8MQEkIclH3dsIQIrcZMSR/SYUEns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788245706; c=relaxed/simple;
	bh=p+yDE9/SvQ1eoLwax7b6B2mw8bZvzZdmeK7J2iX78zQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=noVMVMNPSjQ2pfZ7K0URxrfQZUPyIMkS441SCSH+u/6fhN6QJNuKTB/1v/COetPt+DE+V2+/HY991OP43ydksncq/4tGH5bEs0qdAikaxpgNSWhwEdh+c3gE1MsXXko1g40y1MtiVcOmp+7o56R3mTbqP/neRHDyzJ85fUKXeoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4a41f46d629so795462b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 23:55:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788245703; x=1788850503;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CyOOY9nsMeWo+ckjmJKW6j9xrroLG6GC6jVpeMj2YTw=;
        b=lBD1mEs0OW/GtAgQ0wDR6j5Mxj3fp23RglvjHVtqONT4sNd83uza5sodxWml+ej5Lt
         XJUXsZu4VCPIhJhVjWMzCSqpZ0iKS9E4T1++s/FyAptNOHW2Dzdd0nwAypd/THebYBHm
         dB8hQZf3JQOcw3LnQaJ7hRizcT7lcVmvacnbOP6MmtXwy/o0ilKzchApzoK1AXV2MaVJ
         crSCjQTab56egpieVv0aWIXQEtIroxrAQWgKyOFMAFNGAto1a20PmjIkLcF8SrvyAS0S
         pKE/R2c6i3SrPyhrqGOosC0Zbgrt0uS61HCTVYQO2cPAxp6p/Rrtb6UjlZ+29iEJz2eh
         E7yw==
X-Forwarded-Encrypted: i=1; AHgh+RrJMi+7ANm6q5JduOaG2DnwjuW/aOj3FDIxmIfebviDqmldl3pOnG4CuUALL5dnJkIDrjb43phgx7b5nek=@vger.kernel.org
X-Gm-Message-State: AFuF++loOkPhZfwOjI9Gf0BqqVscf4VmU5Jg6X1mmyB2x1sQa0hhjwXD
	+CX0L+WvW5+1R8lBvzZ7V/aNJ5XX5kLkOY1f9c47RG7wfovaUsWDsFLpMLjbJNW2HPv46D9THCt
	3Pd3NnNVIfqLY+106Oc5rNkux0c7fLlBI2ROBIob/T996b5fTp55nSokpxgw=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1308:b0:4b2:21e2:82d5 with SMTP id
 5614622812f47-4b3981256e5mr31247494b6e.10.1788245703289; Mon, 31 Aug 2026
 23:55:03 -0700 (PDT)
Date: Mon, 31 Aug 2026 23:55:03 -0700
In-Reply-To: <20260901012633.1985-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9676c7.764875ec.b345.0007.GAE@google.com>
Subject: Re: [syzbot] [i2c?] [usb?] INFO: task hung in em28xx_i2c_unregister
From: syzbot <syzbot+f669f02a0fcc5b2148f2@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
BUG: unable to handle kernel paging request in module_put

BUG: unable to handle page fault for address: ffffffff8188f427
#PF: supervisor write access in kernel mode
#PF: error_code(0x0003) - permissions violation
PGD eb4b067 P4D eb4b067 PUD eb4c063 PMD 18001a1 
Oops: Oops: 0003 [#1] SMP KASAN PTI
CPU: 0 UID: 0 PID: 6682 Comm: syz.3.60 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
RIP: 0010:arch_atomic_try_cmpxchg arch/x86/include/asm/atomic.h:107 [inline]
RIP: 0010:raw_atomic_try_cmpxchg include/linux/atomic/atomic-arch-fallback.h:2130 [inline]
RIP: 0010:raw_atomic_dec_if_positive include/linux/atomic/atomic-arch-fallback.h:2560 [inline]
RIP: 0010:atomic_dec_if_positive include/linux/atomic/atomic-instrumented.h:1594 [inline]
RIP: 0010:module_put+0x4c/0x1a0 kernel/module/main.c:956
Code: f0 04 00 00 4c 89 f7 be 04 00 00 00 e8 cd da 86 00 4c 89 f0 48 c1 e8 03 42 0f b6 04 20 84 c0 75 76 41 8b 06 89 c1 ff c9 78 53 <f0> 41 0f b1 0e 75 f3 4c 8b 74 24 28 66 90 65 8b 05 a7 b3 e3 11 83
RSP: 0018:ffffc9000420f968 EFLAGS: 00010206
RAX: 000000000004be8e RBX: ffffffff8188ef37 RCX: 000000000004be8d
RDX: 0000000000000001 RSI: 0000000000000004 RDI: ffffffff8188f427
RBP: dffffc0000000000 R08: ffffffff8188f42a R09: 1ffffffff0311e85
R10: dffffc0000000000 R11: fffffbfff0311e86 R12: dffffc0000000000
R13: ffff888073654ac8 R14: ffffffff8188f427 R15: dffffc0000000000
FS:  0000000000000000(0000) GS:ffff888124cda000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffffff8188f427 CR3: 000000002933a000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 i2c_put_adapter+0x3e/0x60 drivers/i2c/i2c-core-base.c:2660
 i2cdev_release+0x5a/0x90 drivers/i2c/i2c-dev.c:632
 __fput+0x418/0xa50 fs/file_table.c:512
 task_work_run+0x1d9/0x270 kernel/task_work.c:233
 exit_task_work include/linux/task_work.h:40 [inline]
 do_exit+0x73a/0x2360 kernel/exit.c:1008
 do_group_exit+0x22d/0x2f0 kernel/exit.c:1151
 get_signal+0x121b/0x12c0 kernel/signal.c:3039
 arch_do_signal_or_restart+0xbb/0x860 arch/x86/kernel/signal.c:337
 __exit_to_user_mode_loop kernel/entry/common.c:66 [inline]
 exit_to_user_mode_loop+0x10e/0x770 kernel/entry/common.c:101
 __exit_to_user_mode_prepare include/linux/irq-entry-common.h:207 [inline]
 syscall_exit_to_user_mode_prepare include/linux/irq-entry-common.h:230 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:336 [inline]
 do_syscall_64+0x328/0x520 arch/x86/entry/syscall_64.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fbf1d95e98e
Code: Unable to access opcode bytes at 0x7fbf1d95e964.
RSP: 002b:00007fbf1e795b28 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
RAX: 0000000000000004 RBX: 00007fbf1e7966c0 RCX: 00007fbf1d95e98e
RDX: 0000000000080100 RSI: 00007fbf1e795c00 RDI: ffffffffffffff9c
RBP: 00007fbf1e795c00 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: cccccccccccccccd
R13: 00007fbf1dc26038 R14: 00007fbf1dc25fa0 R15: 00007fbf1dd4fa48
 </TASK>
Modules linked in:
CR2: ffffffff8188f427
---[ end trace 0000000000000000 ]---
RIP: 0010:arch_atomic_try_cmpxchg arch/x86/include/asm/atomic.h:107 [inline]
RIP: 0010:raw_atomic_try_cmpxchg include/linux/atomic/atomic-arch-fallback.h:2130 [inline]
RIP: 0010:raw_atomic_dec_if_positive include/linux/atomic/atomic-arch-fallback.h:2560 [inline]
RIP: 0010:atomic_dec_if_positive include/linux/atomic/atomic-instrumented.h:1594 [inline]
RIP: 0010:module_put+0x4c/0x1a0 kernel/module/main.c:956
Code: f0 04 00 00 4c 89 f7 be 04 00 00 00 e8 cd da 86 00 4c 89 f0 48 c1 e8 03 42 0f b6 04 20 84 c0 75 76 41 8b 06 89 c1 ff c9 78 53 <f0> 41 0f b1 0e 75 f3 4c 8b 74 24 28 66 90 65 8b 05 a7 b3 e3 11 83
RSP: 0018:ffffc9000420f968 EFLAGS: 00010206
RAX: 000000000004be8e RBX: ffffffff8188ef37 RCX: 000000000004be8d
RDX: 0000000000000001 RSI: 0000000000000004 RDI: ffffffff8188f427
RBP: dffffc0000000000 R08: ffffffff8188f42a R09: 1ffffffff0311e85
R10: dffffc0000000000 R11: fffffbfff0311e86 R12: dffffc0000000000
R13: ffff888073654ac8 R14: ffffffff8188f427 R15: dffffc0000000000
FS:  0000000000000000(0000) GS:ffff888124cda000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffffff8188f427 CR3: 000000002933a000 CR4: 00000000003526f0
----------------
Code disassembly (best guess):
   0:	f0 04 00             	lock add $0x0,%al
   3:	00 4c 89 f7          	add    %cl,-0x9(%rcx,%rcx,4)
   7:	be 04 00 00 00       	mov    $0x4,%esi
   c:	e8 cd da 86 00       	call   0x86dade
  11:	4c 89 f0             	mov    %r14,%rax
  14:	48 c1 e8 03          	shr    $0x3,%rax
  18:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
  1d:	84 c0                	test   %al,%al
  1f:	75 76                	jne    0x97
  21:	41 8b 06             	mov    (%r14),%eax
  24:	89 c1                	mov    %eax,%ecx
  26:	ff c9                	dec    %ecx
  28:	78 53                	js     0x7d
* 2a:	f0 41 0f b1 0e       	lock cmpxchg %ecx,(%r14) <-- trapping instruction
  2f:	75 f3                	jne    0x24
  31:	4c 8b 74 24 28       	mov    0x28(%rsp),%r14
  36:	66 90                	xchg   %ax,%ax
  38:	65 8b 05 a7 b3 e3 11 	mov    %gs:0x11e3b3a7(%rip),%eax        # 0x11e3b3e6
  3f:	83                   	.byte 0x83


Tested on:

commit:         786262be Merge tag 'edac_updates_for_v7.3_rc2' of git:..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16cf9c15580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5e4e3a0e188a497e
dashboard link: https://syzkaller.appspot.com/bug?extid=f669f02a0fcc5b2148f2
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=142e9c15580000

