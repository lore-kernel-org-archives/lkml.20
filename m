Received: from mail-oo2-f2.google.com (mail-oo2-f2.google.com [74.125.231.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76878242D97
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 22:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789079677; cv=none; b=seTNcUJrqTDn+5z/E5vPoDARw5SvLkdr7ejboT4vfJaYZUB0z006PfrnvckwPf8hksVHGJvgiTCiBViGNAVJfs7iTMtcMY0gR9dMCfj70043au+t7vehIASwwpuEx6/pe7EYwa+GZWHU9igVb+VN2ACq2RkKHITwYG8yja7GMYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789079677; c=relaxed/simple;
	bh=6jk1HAam1tfwL9YR/123AGEX6XKmBuV9EnkeSKU3ZGs=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=HrPxAoeWEgSpGCKzLn16UvNWqAIUe7OBKjPNwTf1zq9grpcPaZ9g8dsIP4fvB+eDW/hhwOxGLYwvSR6p9bx+VVdn2nhK86DdcwVUc0q3p690fyklAzljQUsogy3BZ9SXKR+ABWWABcKrcR84WXXRgg3+I1Pm6Ccy2PaUy4T+spA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo2-f2.google.com with SMTP id 46e09a7af769-801706d7e6dso97299a34.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:34:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789079674; x=1789684474;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IvsJaM4AM1J/BSbs4WDnUXlHpIg7NqoQiI+twfEHk0w=;
        b=GOe1SYHJEl0vDF5XUzKj9PsQfMzs3PpGCh/igSpr3XTse6PPT9WyemFLe220XjRW2M
         CKMmO79+azLo9pamGhcNeQg9dsiebZRtrdR3J4Tc8xn8B95cV+6CX7zWIJke94hnws3B
         OZxCbk4JHdhwLKyMK8odNV3y1dHsFVNjj9BTCqY3rCtDF9ZtiBB9WP1AWEo8A513Zq5G
         ayulL5L6WPR6zqwDcOaNPf/gKLCjcrZo2/hRiUmUwN9SoaDcyj/5LMA2FmwawUtyAHPA
         Tm2kLPqx5oeZYQFGnNH9hO3MHvQ0KtUZZl/Vrg9vq+sf8Xs6jN5jCXs/YHmxl5e9XvzO
         xEug==
X-Gm-Message-State: AFuF++nceSh7w8ChLtzbvgf3qEiNXsXq7XR/0HirMalSIOeLMyjBRba/
	KNqp1Y8Xq6xKI9o7H/ounvrmLMTwk9MoVAZXKLLZ8HpKrgHGH5utX7kuHLqy35A5PoFZmYCbasM
	MzlP5dLqQZEUSe5VicV1CIRwMTB4P4VG6QjWEjJ3vLxQ+2RTZWaY8cxlHN/h3Pg==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:c2cd:20b0:6be:31b7:e684 with SMTP id
 006d021491bc7-6c0bc7c476emr621867eaf.34.1789079674304; Thu, 10 Sep 2026
 15:34:34 -0700 (PDT)
Date: Thu, 10 Sep 2026 15:34:34 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa3307a.6e6c5f9e.28f11f.003a.GAE@google.com>
Subject: [syzbot] [kernel?] WARNING: locking bug in finish_task_switch (3)
From: syzbot <syzbot+b5ddc2aecb8d1b29c871@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, luto@kernel.org, peterz@infradead.org, 
	syzkaller-bugs@googlegroups.com, tglx@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    1fc5a74b108f Merge tag 'kmalloc_obj-v7.3-rc2' of git://git..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14f2ccf9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5e4e3a0e188a497e
dashboard link: https://syzkaller.appspot.com/bug?extid=b5ddc2aecb8d1b29c871
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/8955e485c188/disk-1fc5a74b.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/a91efe973539/vmlinux-1fc5a74b.xz
kernel image: https://storage.googleapis.com/syzbot-assets/92b415d78cae/bzImage-1fc5a74b.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+b5ddc2aecb8d1b29c871@syzkaller.appspotmail.com

usb 9-1: Quirk or no altset; falling back to MIDI 1.0
usb 9-1: USB disconnect, device number 97
------------[ cut here ]------------
DEBUG_LOCKS_WARN_ON(1)
WARNING: kernel/locking/lockdep.c:238 at hlock_class kernel/locking/lockdep.c:238 [inline], CPU#0: kworker/0:10/9284
WARNING: kernel/locking/lockdep.c:238 at check_wait_context kernel/locking/lockdep.c:4895 [inline], CPU#0: kworker/0:10/9284
WARNING: kernel/locking/lockdep.c:238 at __lock_acquire+0x584/0x2e50 kernel/locking/lockdep.c:5204, CPU#0: kworker/0:10/9284
Modules linked in:
CPU: 0 UID: 0 PID: 9284 Comm: kworker/0:10 Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
Workqueue: sock_diag_events sock_diag_broadcast_destroy_work
RIP: 0010:hlock_class kernel/locking/lockdep.c:238 [inline]
RIP: 0010:check_wait_context kernel/locking/lockdep.c:4895 [inline]
RIP: 0010:__lock_acquire+0x58b/0x2e50 kernel/locking/lockdep.c:5204
Code: fa 18 00 74 04 31 c9 eb 2d 90 e8 00 91 37 03 85 c0 74 1c 83 3d 89 26 d7 0e 00 75 13 48 8d 3d 3c 2f da 0e 48 c7 c6 5e d9 59 8e <67> 48 0f b9 3a 90 31 c9 48 8b 3c 24 0f b6 81 c4 00 00 00 84 c0 0f
RSP: 0018:ffffc900034373b8 EFLAGS: 00010046
RAX: 0000000000000001 RBX: ffff88802cb369e0 RCX: ffff88802cb35dc0
RDX: 0000000040000000 RSI: ffffffff8e59d95e RDI: ffffffff907d5240
RBP: 0000000000000002 R08: ffffffff907a4983 R09: 1ffffffff20f4930
R10: dffffc0000000000 R11: fffffbfff20f4931 R12: 00000000ffffff05
R13: 0000000000000000 R14: ffff88802cb369e8 R15: 0000000000000002
FS:  0000000000000000(0000) GS:ffff888124cd8000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000020000024c030 CR3: 000000007442c000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000400
DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 lock_acquire+0x115/0x350 kernel/locking/lockdep.c:5908
 finish_lock_switch kernel/sched/core.c:5248 [inline]
 finish_task_switch+0x16e/0xc60 kernel/sched/core.c:5369
 context_switch kernel/sched/core.c:5523 [inline]
 __schedule+0x17e3/0x58f0 kernel/sched/core.c:7270
 preempt_schedule_irq+0x4b/0x90 kernel/sched/core.c:7592
 irqentry_exit_to_kernel_mode include/linux/irq-entry-common.h:539 [inline]
 irqentry_exit+0x14f/0x910 kernel/entry/common.c:167
 asm_sysvec_reschedule_ipi+0x1a/0x20 arch/x86/include/asm/idtentry.h:679
RIP: 0010:lock_acquire+0x232/0x350 kernel/locking/lockdep.c:5913
Code: ff ff ff e8 20 39 41 0a f7 44 24 10 00 02 00 00 0f 84 38 ff ff ff 65 48 8b 05 72 64 f1 11 48 3b 44 24 50 75 33 fb 48 83 c4 58 <5b> 41 5c 41 5d 41 5e 41 5f 5d e9 cf 3c 44 0a cc 48 8d 3d f7 35 da
RSP: 0018:ffffc90003437920 EFLAGS: 00000292
RAX: 4cc9e7c7ad94c500 RBX: 0000000000000001 RCX: 0000000000000046
RDX: ffffffff94482fa8 RSI: ffffffff8e6fd430 RDI: ffffffff8c6d9480
RBP: ffff88802cb35dc0 R08: 0000000000000008 R09: ffffffff96e17510
R10: 00000000ab51b954 R11: 000000009f2f398b R12: ffff888044880f60
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000246
 lock_sock_fast include/net/sock.h:1744 [inline]
 tcp_get_info+0x261/0x2b70 net/ipv4/tcp.c:4250
 inet_diag_handler_get_info+0x481/0x700 net/ipv4/inet_diag.c:1030
 sock_diag_broadcast_destroy_work+0x1f4/0x3d0 net/core/sock_diag.c:162
 process_one_work kernel/workqueue.c:3396 [inline]
 process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3479
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3560
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
----------------
Code disassembly (best guess):
   0:	fa                   	cli
   1:	18 00                	sbb    %al,(%rax)
   3:	74 04                	je     0x9
   5:	31 c9                	xor    %ecx,%ecx
   7:	eb 2d                	jmp    0x36
   9:	90                   	nop
   a:	e8 00 91 37 03       	call   0x337910f
   f:	85 c0                	test   %eax,%eax
  11:	74 1c                	je     0x2f
  13:	83 3d 89 26 d7 0e 00 	cmpl   $0x0,0xed72689(%rip)        # 0xed726a3
  1a:	75 13                	jne    0x2f
  1c:	48 8d 3d 3c 2f da 0e 	lea    0xeda2f3c(%rip),%rdi        # 0xeda2f5f
  23:	48 c7 c6 5e d9 59 8e 	mov    $0xffffffff8e59d95e,%rsi
* 2a:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2f:	90                   	nop
  30:	31 c9                	xor    %ecx,%ecx
  32:	48 8b 3c 24          	mov    (%rsp),%rdi
  36:	0f b6 81 c4 00 00 00 	movzbl 0xc4(%rcx),%eax
  3d:	84 c0                	test   %al,%al
  3f:	0f                   	.byte 0xf


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
