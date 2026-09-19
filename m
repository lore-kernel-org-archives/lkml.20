Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCEB336AB46
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 06:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789800965; cv=none; b=SL6GuXZYdcLeJLiPssi6vW9mMdk25t84Fi0+/qTVxr54GgW4p+xky3JCDH1eN34fT9ktMM3BnAR9Fuw7YmNl5ASdhW8Y8pH/l5g62ZXWUG8WwU49BIyJUhi0yR1LORX6PUiuNMbdSv1sScZtXZ/3ksVyxBjkVttv8nifnqnQzZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789800965; c=relaxed/simple;
	bh=eQQFirZQ/n2yD1wfhJVDB4Yci9MW52xX7u2mMqmZtFk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=W5uxDb7SysvF6XJG56n27RoPDxIFN31yzd4a9lLYmUThcwly2D7/KLTWHbRLJoG0qoYtzNKGyMGWjWmT/3uoYObCams+B4zc3MQVAHx4i3CU+jFYU13FyjtSqvnzt5VTRnsYusf942xamCLx9t0qoRFAhcycj/iQeuJALVPGe+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-45ecb9dd589so1530760fac.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 23:56:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789800962; x=1790405762;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HpiU5O3WyxsClldQZrYgrz43HQRLxeXCvfF7I+HZbtY=;
        b=ozZ8iw+nhke+SM2E+HDz2LOScb3BtcwLIY+3Te92kwlv2qZeQHxK45NnGXZovMXWZf
         48PObNtdBq5y+5Ul5SOsCKakRgNzvW9JGC2nNJuGgDhohx59HRuVcsG8Rb725/Yi5yku
         +d6MrMtVI84zusCXHmpIzrFxAsqDl93hQHbSU983tVeGGfuPmm2FHbMOXbH+EhxU1Ql3
         AexBwl+rfcB+pc5kN7eUs2+e/XtWjnNKdBc07gKFclyPo/LvlNSanbk89b9hWAu6b81+
         d+yHsVYX82NRc9MTe/u9VhSBwEEsP8DPvCIa1qMSI2y5k6V1fY9RZMAN1QqHzWMkh9z2
         AYCw==
X-Forwarded-Encrypted: i=1; AKwUvBxhqbUW/Nvc4bOYVAgqLD3c0F44SNPz8IwNAoKp+bkTfHBZ+4EJLfxAu9XXdJklzzDF8dSHXNlUBJY+ILo=@vger.kernel.org
X-Gm-Message-State: AFuF++nFekZpx/I4lMzD4rTiV7BcjD7s0rZBSlTNySQgpno9qhXKcXpd
	qh7inIxQRNM+LiGRmM53Aq/mL3dJC+0gcdCFOPcffeLtvX22lyV39zBMpsljoSjWoPriOBUbsoS
	51R1a7XLx3MOIx+qiHck2CWXxiXzPHc0/C1zk0Rwj1N/UJvdmk2mouLskEjI=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4c15:b0:6c8:dccc:eb1d with SMTP id
 006d021491bc7-6ca9cb58461mr4552047eaf.55.1789800962705; Fri, 18 Sep 2026
 23:56:02 -0700 (PDT)
Date: Fri, 18 Sep 2026 23:56:02 -0700
In-Reply-To: <20260918225112.173-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aae3202.514bccd6.255447.0001.GAE@google.com>
Subject: Re: [syzbot] [net?] WARNING: locking bug in finish_task_switch (3)
From: syzbot <syzbot+b5ddc2aecb8d1b29c871@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
WARNING: locking bug in finish_task_switch

------------[ cut here ]------------
DEBUG_LOCKS_WARN_ON(1)
WARNING: kernel/locking/lockdep.c:238 at hlock_class kernel/locking/lockdep.c:238 [inline], CPU#0: syz.1.35/6518
WARNING: kernel/locking/lockdep.c:238 at check_wait_context kernel/locking/lockdep.c:4895 [inline], CPU#0: syz.1.35/6518
WARNING: kernel/locking/lockdep.c:238 at __lock_acquire+0x584/0x2e50 kernel/locking/lockdep.c:5204, CPU#0: syz.1.35/6518
Modules linked in:
CPU: 0 UID: 0 PID: 6518 Comm: syz.1.35 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
RIP: 0010:hlock_class kernel/locking/lockdep.c:238 [inline]
RIP: 0010:check_wait_context kernel/locking/lockdep.c:4895 [inline]
RIP: 0010:__lock_acquire+0x58b/0x2e50 kernel/locking/lockdep.c:5204
Code: fa 18 00 74 04 31 c9 eb 2d 90 e8 c0 a1 36 03 85 c0 74 1c 83 3d a9 4a d7 0e 00 75 13 48 8d 3d 0c 53 da 0e 48 c7 c6 d9 e2 59 8e <67> 48 0f b9 3a 90 31 c9 48 8b 3c 24 0f b6 81 c4 00 00 00 84 c0 0f
RSP: 0000:ffffc90004146538 EFLAGS: 00010046
RAX: 0000000000000001 RBX: ffff8880315a4a78 RCX: ffff8880315a3e80
RDX: 0000000040000000 RSI: ffffffff8e59e2d9 RDI: ffffffff907d72f0
RBP: 0000000000000002 R08: ffffffff907a6a83 R09: 1ffffffff20f4d50
R10: dffffc0000000000 R11: fffffbfff20f4d51 R12: 0000000000000004
R13: 0000000000000000 R14: ffff8880315a4a80 R15: 0000000000000001
FS:  0000000000000000(0000) GS:ffff888124cde000(0063) knlGS:00000000f67b3b40
CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
CR2: 00000000f6834da4 CR3: 000000001c2ca000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 lock_acquire+0x115/0x350 kernel/locking/lockdep.c:5908
 finish_lock_switch kernel/sched/core.c:5248 [inline]
 finish_task_switch+0x16e/0xc60 kernel/sched/core.c:5369
 context_switch kernel/sched/core.c:5523 [inline]
 __schedule+0x17dc/0x5820 kernel/sched/core.c:7270
 __schedule_loop kernel/sched/core.c:7347 [inline]
 schedule+0x164/0x2b0 kernel/sched/core.c:7362
 __lock_sock+0x162/0x2c0 net/core/sock.c:3235
 __lock_sock_fast+0x94/0xe0 net/core/sock.c:3897
 lock_sock_fast include/net/sock.h:1746 [inline]
 tcp_get_info+0x26d/0x2b70 net/ipv4/tcp.c:4250
 inet_sk_diag_fill+0xdb6/0x18c0 net/ipv4/inet_diag.c:330
 sk_diag_fill+0x2e6/0xd50 net/ipv4/tcp_diag.c:284
 tcp_diag_dump+0x1ba6/0x2020 net/ipv4/tcp_diag.c:538
 __inet_diag_dump net/ipv4/inet_diag.c:823 [inline]
 inet_diag_dump_compat+0x274/0x490 net/ipv4/inet_diag.c:927
 netlink_dump+0x711/0xee0 net/netlink/af_netlink.c:2331
 __netlink_dump_start+0x589/0x7b0 net/netlink/af_netlink.c:2446
 netlink_dump_start include/linux/netlink.h:341 [inline]
 inet_diag_rcv_msg_compat+0x214/0x420 net/ipv4/inet_diag.c:962
 sock_diag_rcv_msg+0x4b0/0x5f0 net/core/sock_diag.c:-1
 netlink_rcv_skb+0x226/0x4a0 net/netlink/af_netlink.c:2556
 netlink_unicast_kernel net/netlink/af_netlink.c:1319 [inline]
 netlink_unicast+0x7bd/0x940 net/netlink/af_netlink.c:1345
 netlink_sendmsg+0x813/0xb40 net/netlink/af_netlink.c:1900
 sock_sendmsg_nosec+0x13a/0x180 net/socket.c:800
 __sock_sendmsg net/socket.c:815 [inline]
 ____sys_sendmsg+0x54e/0x850 net/socket.c:2713
 ___sys_sendmsg+0x2a5/0x360 net/socket.c:2767
 __sys_sendmsg+0x177/0x240 net/socket.c:2799
 do_syscall_32_irqs_on arch/x86/entry/syscall_32.c:79 [inline]
 __do_fast_syscall_32+0x27a/0x6a0 arch/x86/entry/syscall_32.c:291
 do_fast_syscall_32+0x33/0x70 arch/x86/entry/syscall_32.c:316
 entry_SYSENTER_compat_after_hwframe+0x84/0x8e
RIP: 0023:0xf6fff0ec
Code: 90 85 d2 74 0a 89 ce 81 e6 ff 0f 00 00 89 32 85 c0 74 05 c1 e9 0c 89 08 31 c0 5e 5d c3 90 0f 1f 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 58 b8
RSP: 002b:00000000f67b350c EFLAGS: 00000206 ORIG_RAX: 0000000000000172
RAX: ffffffffffffffda RBX: 0000000000000008 RCX: 0000000080000240
RDX: 0000000004004010 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000206 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>
----------------
Code disassembly (best guess):
   0:	fa                   	cli
   1:	18 00                	sbb    %al,(%rax)
   3:	74 04                	je     0x9
   5:	31 c9                	xor    %ecx,%ecx
   7:	eb 2d                	jmp    0x36
   9:	90                   	nop
   a:	e8 c0 a1 36 03       	call   0x336a1cf
   f:	85 c0                	test   %eax,%eax
  11:	74 1c                	je     0x2f
  13:	83 3d a9 4a d7 0e 00 	cmpl   $0x0,0xed74aa9(%rip)        # 0xed74ac3
  1a:	75 13                	jne    0x2f
  1c:	48 8d 3d 0c 53 da 0e 	lea    0xeda530c(%rip),%rdi        # 0xeda532f
  23:	48 c7 c6 d9 e2 59 8e 	mov    $0xffffffff8e59e2d9,%rsi
* 2a:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2f:	90                   	nop
  30:	31 c9                	xor    %ecx,%ecx
  32:	48 8b 3c 24          	mov    (%rsp),%rdi
  36:	0f b6 81 c4 00 00 00 	movzbl 0xc4(%rcx),%eax
  3d:	84 c0                	test   %al,%al
  3f:	0f                   	.byte 0xf


Tested on:

commit:         18fbf515 Merge tag 'mm-stable-2026-08-26-15-22' of git..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=1115f7f9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a14b7fde441ba049
dashboard link: https://syzkaller.appspot.com/bug?extid=b5ddc2aecb8d1b29c871
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
userspace arch: i386

Note: no patches were applied.
