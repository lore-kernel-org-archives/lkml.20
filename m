Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199DC2D8364
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 03:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788406809; cv=none; b=LNqE/4QDJSr8F6UtYrV4Dag0EjARQHc6393hrBb/4Fzs0GjGzJeT7Ya/4lMdRg3My2GLtzDwinxmLRn3yu11RMcrjog2ZDvb+/+8LECzTIlAb4CATSl62qIXIhMR1yD7SjddyXvqq87QtXZFUKnjxXqFVUFZULQgVK3YGnzMMAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788406809; c=relaxed/simple;
	bh=e/TqiIlja8tVZ2Uy96oFR/k8SEbKacxr2UOP3CgB4i4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=R8djHIYGpQ2rSHBoVbJsgyK/r4qczXudYoDVR7lDCKEFmUomwVoIyC1a3ZsBOZe815k6COmc9GUSbY/Rv/Gps9EMDI60LZFFCXNOaQyVBO68E+451ajFsIFfEpyCnFjLQaemMDq+o6+rFO8XuhvIJiBqcZep37UTbwlMYfhKSyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6b34ad165e3so922617eaf.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 20:40:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788406806; x=1789011606;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UjtJlZVb9/J29Rk/trqC2Bpoz4Zm1wvTlieeaYzn+q0=;
        b=iN5E3Or4BJbq+KR3VMF4CobV5U0/El+5R6Wm2kq4agz9i3yjhBk4eBqYSupJ2Gfvee
         roFBc5MVNqhWmuVQyGCF8RSlnydfOFrHN5Aj3J3OBDZ8V/e96igbJsvJCCCbhV700sXG
         NcUu8sDoXR+kMUEJDrdN48GmhdfPfSm9G5V9oRauKzIUuRnKUn31F6Ht/QLHxywfBD38
         CsDxCZl/mU8vbrQMOjnE6sbxpu1n0rrCV/6W9LZROoif9We8R27BJgg1oPefqKIwaa8m
         explahMOzJyanNsq0i+C8p1kOB8zTxGNkgOG5//rHpC2c0BDn11/B3+XCjv9Xh9TB3va
         7CKA==
X-Forwarded-Encrypted: i=1; AKwUvBxUBSL4rXmlJnMcUqgvD976eiNL1kOZb0ConstU43vmDadvH8xfP6kdps0EaQ3ZjQm7y3EXgO0rNUgQ2bQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lFPLCRfWhm6TLzb3SWWG0zEJPelG2e64dkJ9B9/VtoFig2N1Ob
	w6wazC5PQPac60jcf7YD6rTyVFyf/WrwMAG0yqwsN2zx9eVoFs8AmNaohoPnmgsCQbo6g+vowJU
	CyPZAJawRck90OMuLw0UnO2A3SXd8I1l65M5lLX4d+QiaGdtKI1W33BNPo8U=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:619:b0:6ae:9815:7c8e with SMTP id
 006d021491bc7-6b48102eaa1mr7037186eaf.21.1788406806046; Wed, 02 Sep 2026
 20:40:06 -0700 (PDT)
Date: Wed, 02 Sep 2026 20:40:06 -0700
In-Reply-To: <20260903032431.120530-1-adrianox@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a98ec16.27a413cd.1e878c.0013.GAE@google.com>
Subject: Re: [syzbot] [usb?] general protection fault in keyspan_break_ctl
From: syzbot <syzbot+473d7477c523b41d4046@syzkaller.appspotmail.com>
To: adrianox@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
general protection fault in keyspan_break_ctl

Oops: general protection fault, probably for non-canonical address 0xdffffc0000000013: 0000 [#1] SMP KASAN NOPTI
KASAN: null-ptr-deref in range [0x0000000000000098-0x000000000000009f]
CPU: 0 UID: 0 PID: 6461 Comm: syz.1.18 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:keyspan_break_ctl+0x8e/0xe0 drivers/usb/serial/keyspan.c:608
Code: ff ff ff e8 64 67 42 fa 83 fb ff 48 b8 00 00 00 00 00 fc ff df 49 8d bc 24 9c 00 00 00 0f 94 c3 48 89 fa 0f b6 db 48 c1 ea 03 <0f> b6 14 02 48 89 f8 83 e0 07 83 c0 03 38 d0 7c 04 84 d2 75 1d 41
RSP: 0018:ffffc9000464fcb0 EFLAGS: 00010203
RAX: dffffc0000000000 RBX: 0000000000000000 RCX: ffffffff87c9831c
RDX: 0000000000000013 RSI: 00000000ffffffff RDI: 000000000000009c
RBP: ffff88805864c000 R08: 0000000000000005 R09: 00000000ffffffff
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
R13: ffff8880541a6020 R14: ffff8880541a60c8 R15: 0000000000000000
FS:  00007fc5840d16c0(0000) GS:ffff8880d5b61000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f713ec70000 CR3: 000000002265b000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 serial_break+0xcb/0x160 drivers/usb/serial/usb-serial.c:538
 send_break drivers/tty/tty_io.c:2458 [inline]
 send_break+0x2ec/0x370 drivers/tty/tty_io.c:2441
 tty_ioctl+0xa2c/0x1640 drivers/tty/tty_io.c:2733
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl fs/ioctl.c:583 [inline]
 __x64_sys_ioctl+0x18e/0x210 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fc58319e0d9
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fc5840d1028 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007fc583425fa0 RCX: 00007fc58319e0d9
RDX: 0000000000000000 RSI: 0000000000005425 RDI: 0000000000000004
RBP: 00007fc583235024 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fc583426038 R14: 00007fc583425fa0 R15: 00007ffe7adceff8
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:keyspan_break_ctl+0x8e/0xe0 drivers/usb/serial/keyspan.c:608
Code: ff ff ff e8 64 67 42 fa 83 fb ff 48 b8 00 00 00 00 00 fc ff df 49 8d bc 24 9c 00 00 00 0f 94 c3 48 89 fa 0f b6 db 48 c1 ea 03 <0f> b6 14 02 48 89 f8 83 e0 07 83 c0 03 38 d0 7c 04 84 d2 75 1d 41
RSP: 0018:ffffc9000464fcb0 EFLAGS: 00010203
RAX: dffffc0000000000 RBX: 0000000000000000 RCX: ffffffff87c9831c
RDX: 0000000000000013 RSI: 00000000ffffffff RDI: 000000000000009c
RBP: ffff88805864c000 R08: 0000000000000005 R09: 00000000ffffffff
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
R13: ffff8880541a6020 R14: ffff8880541a60c8 R15: 0000000000000000
FS:  00007fc5840d16c0(0000) GS:ffff8880d5b61000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f713ec70000 CR3: 000000002265b000 CR4: 0000000000352ef0
----------------
Code disassembly (best guess), 2 bytes skipped:
   0:	ff                   	ljmp   (bad)
   1:	e8 64 67 42 fa       	call   0xfa42676a
   6:	83 fb ff             	cmp    $0xffffffff,%ebx
   9:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
  10:	fc ff df
  13:	49 8d bc 24 9c 00 00 	lea    0x9c(%r12),%rdi
  1a:	00
  1b:	0f 94 c3             	sete   %bl
  1e:	48 89 fa             	mov    %rdi,%rdx
  21:	0f b6 db             	movzbl %bl,%ebx
  24:	48 c1 ea 03          	shr    $0x3,%rdx
* 28:	0f b6 14 02          	movzbl (%rdx,%rax,1),%edx <-- trapping instruction
  2c:	48 89 f8             	mov    %rdi,%rax
  2f:	83 e0 07             	and    $0x7,%eax
  32:	83 c0 03             	add    $0x3,%eax
  35:	38 d0                	cmp    %dl,%al
  37:	7c 04                	jl     0x3d
  39:	84 d2                	test   %dl,%dl
  3b:	75 1d                	jne    0x5a
  3d:	41                   	rex.B


Tested on:

commit:         940de590 Merge tag 'hardening-v7.3-rc2' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11a21f79580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c5c3949d762a91f
dashboard link: https://syzkaller.appspot.com/bug?extid=473d7477c523b41d4046
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Note: no patches were applied.
