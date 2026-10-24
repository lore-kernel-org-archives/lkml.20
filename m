Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792874547;
	b=on3NxNzkUF0KFf9VNLkbtlBMVwf1HqT4x21VccfAE4TglSjg0Y3WJGsHT4lBegUEIEWR
	 rBNMot5lmuyazx/BWQKMvcfY5T5wCeprakNC7MYM2YcgVrSmB1HvKhWfgaN8CF3FcsTD7
	 rANnRdGzLmGM+m+RcI2qcGnawmDxlzjmVMpOg/J+w5GyOfwSegl9cfxckCnUjTHf5FUDu
	 EP0IgKjZtLL1Le2pPR0oz2imgClJVkrgbe7x3FLCBxQdLR4RD2p4NjhlKH3xGhWIoqbaj
	 qXOIPia72EnjREp55Mmqtx7Fl8nubo/q5p/E0DzqS4kqBsxgwW7XaC8MnegfloiZ+OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792874547;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=FqBdXGEsMuUTS0y0QM4UIXMu2Yp29adRdaRXwX7vNjE=;
	b=c3e12/mLzbFAZyAbu0iVqrMSKiIuMDRHw4TzQjJ+MldvDEMZM5FL4POAt79pQII7wxi1
	 gAViz7pjLJka6B3jUdD7hkiC3hDJojAHyE9YydyTmODJwjYwGoJ2rYNbx3uef0EaLO6sO
	 aaADbYByzsbq3B1LERDVgOlmZnOwTwOE8Xw54BlIJl1S02T42Ct70t2bAhLbwgB/4EhyV
	 xV9NpLI0514f6qkSdSqDK2shfPg9pP1Wf5EDJxzFwILPPIFoRFygjhDYTLD8QlC4g76fN
	 XqVBfh3To8rPUjGLr9UjOXPMbkfKntGhOHVP0n4Aw7WP9lK5Mmj52pBIvEx/I+c3/mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.161.70
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838D1606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:42:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 838D1606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6e0063e7a02so2226650eaf.2
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 13:42:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792874546; x=1793479346;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FqBdXGEsMuUTS0y0QM4UIXMu2Yp29adRdaRXwX7vNjE=;
        b=qX/PqYQWwUpqY66utqKhL2tBf7wjlUPN4JUhnCNYbah1DahN/O6FF7V0zX20HkcWwY
         dUKGth1gxIb6BpXqvN0sjJLYXa4cp4yFaw4aZ31rZjDcmtMaDu91/fzDeoWvlLcGirMf
         w/5zal5HZpoI+CHmj76gJgEFfPM48r3EbrfKqWkYVNXidewGzmTnjm3AyKGpNUxs9PR1
         mYREPbQCtrLJcKngJOscdHn06j75jjnMjM3qMxyX+IXwXwtBDjX19mzsWIX6o7JwF2Cq
         lasZ22pfQGCuy9UIFwOTxjgjBHAAEkgFUTjizXZX4fHzmEL+me1vQoz4J5pyYP+RNW8t
         x0aQ==
X-Gm-Message-State: AFq9FYJ1a+C4wEpDWDJWhcsRh8ovBBZiRjyxATQz2ep3bquDXwvgMbsX
	v5nM+jhUNvL0Vqti0049LIz4TVJLFgMO/Y32zfnrcQN3RtXQJAQnGDlIsj2kPcDD9ERrw3MUF/N
	jXJaIP4Xltx/nhgBUW3okF9HIxphoiL+RvfR4oKM8Q3tOu8TO5aKoZhkhhZA=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6820:c0db:10b0:70a:849b:6ec6 with SMTP id
 006d021491bc7-70ba0b62d74mr1000207eaf.6.1792874546529; Sat, 24 Oct 2026
 13:42:26 -0700 (PDT)
Date: Sat, 24 Oct 2026 13:42:26 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6add1832.a26421ad.3bb4f4.0013.GAE@google.com>
Subject: [syzbot] [mmc?] BUG: sleeping function called from invalid context in vub300_inactivity_timer_expired
From: syzbot <syzbot+13d431d857e347804708@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	ulf.hansson@linaro.org, ulfh@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    bdf12cde3083 usb: gadget: dummy_hcd: prevent unbind via sy..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=10f7c231580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7f0127eb11110629
dashboard link: https://syzkaller.appspot.com/bug?extid=13d431d857e347804708
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/85e12902fee8/disk-bdf12cde.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/4a1ee2a067fd/vmlinux-bdf12cde.xz
kernel image: https://storage.googleapis.com/syzbot-assets/2acb753f5754/bzImage-bdf12cde.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+13d431d857e347804708@syzkaller.appspotmail.com

BUG: sleeping function called from invalid context at kernel/workqueue.c:4561
in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 14894, name: dhcpcd-run-hook
preempt_count: 100, expected: 0
RCU nest depth: 1, expected: 0
locks held by dhcpcd-run-hook/14894: 3, last CPU#0:
 #0: ffff888119da0340 (&mm->mmap_lock){++++}-{4:4}, at: mmap_read_lock include/linux/mmap_lock.h:600 [inline]
 #0: ffff888119da0340 (&mm->mmap_lock){++++}-{4:4}, at: mmap_read_lock_maybe_expand+0x1e2/0x3d0 mm/mmap.c:1691
 #1: ffffffff898e6f20 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffffff898e6f20 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffffff898e6f20 (rcu_read_lock){....}-{1:3}, at: mt_find+0x136/0x9b0 lib/maple_tree.c:6431
Preemption disabled at:
[<ffffffff8177b113>] softirq_handle_begin kernel/softirq.c:486 [inline]
[<ffffffff8177b113>] handle_softirqs+0xf3/0x9b0 kernel/softirq.c:621
CPU: 0 UID: 0 PID: 14894 Comm: dhcpcd-run-hook Not tainted syzkaller #0 PREEMPT(lazy) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/07/2026
Call Trace:
 <IRQ>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 __might_resched.cold+0x1dc/0x222 kernel/sched/core.c:9264
 vub300_delete drivers/mmc/host/vub300.c:379 [inline]
 kref_put include/linux/kref.h:65 [inline]
 vub300_inactivity_timer_expired drivers/mmc/host/vub300.c:747 [inline]
 vub300_inactivity_timer_expired+0x42f/0x550 drivers/mmc/host/vub300.c:742
 call_timer_fn+0x198/0x5f0 kernel/time/timer.c:1748
 expire_timers kernel/time/timer.c:1799 [inline]
 __run_timers+0x757/0xb00 kernel/time/timer.c:2374
 __run_timer_base kernel/time/timer.c:2386 [inline]
 __run_timer_base kernel/time/timer.c:2378 [inline]
 run_timer_base+0x114/0x190 kernel/time/timer.c:2395
 run_timer_softirq+0x1a/0x50 kernel/time/timer.c:2405
 handle_softirqs+0x1d9/0x9b0 kernel/softirq.c:645
 __do_softirq kernel/softirq.c:679 [inline]
 invoke_softirq kernel/softirq.c:519 [inline]
 __irq_exit_rcu+0x168/0x210 kernel/softirq.c:758
 irq_exit_rcu+0x9/0x30 kernel/softirq.c:775
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1062 [inline]
 sysvec_apic_timer_interrupt+0x8f/0xb0 arch/x86/kernel/apic/apic.c:1062
 </IRQ>
 <TASK>
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:674
RIP: 0010:lock_acquire+0x5e/0x380 kernel/locking/lockdep.c:5947
RSP: 0018:ffffc90014baf920 EFLAGS: 00000206
RAX: 0000000000000046 RBX: 0000000000000000 RCX: 0000000000000200
RDX: 0000000000000000 RSI: ffffffff892be127 RDI: ffffffff87d2bd80
RBP: ffffffff898e6f20 R08: 0000000032a4bc37 R09: 0000000000000007
R10: 0000000000000200 R11: 0000000000000001 R12: 0000000000000002
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 rcu_read_lock include/linux/rcupdate.h:849 [inline]
 mt_find+0x14a/0x9b0 lib/maple_tree.c:6431
 gup_vma_lookup+0x20/0x170 mm/gup.c:1275
 __get_user_pages+0x241/0x2970 mm/gup.c:1396
 __get_user_pages_locked mm/gup.c:1692 [inline]
 get_user_pages_remote+0x3d2/0xb10 mm/gup.c:2609
 copy_strings.isra.0+0x475/0x790 fs/exec.c:511
 do_execveat_common.isra.0+0x38f/0x580 fs/exec.c:1941
 __do_sys_execve fs/exec.c:2038 [inline]
 __se_sys_execve fs/exec.c:2032 [inline]
 __x64_sys_execve+0x93/0xd0 fs/exec.c:2032
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x119/0x710 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f65da68e107
Code: 0f 00 64 c7 00 07 00 00 00 b8 ff ff ff ff c9 c3 0f 1f 00 48 8b 05 a9 ee 0f 00 48 8b 10 e9 01 00 00 00 90 b8 3b 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d c1 ec 0f 00 f7 d8 64 89 01 48
RSP: 002b:00007ffdc0ec44e8 EFLAGS: 00000246 ORIG_RAX: 000000000000003b
RBP: 000055bee7e24ef8 R08: 00007ffdc0ec7f12 R09: 0000000000000000
R10: 0000000000000008 R11: 0000000000000246 R12: 000055bee7e24e68
R13: 00007f65da853e8b R14: 000055bee7e24e68 R15: 0000000000000000
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
