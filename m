Received: from mail-oi2-f5.google.com (mail-oi2-f5.google.com [74.125.231.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13453380FC4
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 14:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788101571; cv=none; b=jOXEx8VnqGK3P/gVOvPYFbG9T6XFtWvsMEUjtgnIyf5WB2P5+dnc93P8TWAPTu3HgqpMRUycJi4CGus2VN4hCSLMJYHk3stA1Q8A7Kn0WdcYf1diaojWySx+mgrWEk1NpiT4vbhcDLlS6sYgKH3BIFvn0uy42w/FWOXrYI78MhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788101571; c=relaxed/simple;
	bh=V+7UYSqMZ0MoWGl3Y/YoATdUyw+HT+Y8OyfWVkqMsek=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=bVuuKIX06kZ5H+3/AZ/pS6NTwrTYaYIQZtQEc3OZLiOknYjhMoJm6gQXpsM7Gq1XjlqTaO/SjSFT8f3pMG9TdhFD7QVIs5hy6XxQ+VwOVCZIDug1A0e0N136pMxkOycbNcNgfb6G730owz/4CF6UVRgBL9fRSP05bu1OSiIZNJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi2-f5.google.com with SMTP id 46e09a7af769-7f4e10aa28cso492256a34.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 07:52:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788101569; x=1788706369;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9gVr9eXpivd73Efr2cH672aQg7FqbazttKcNxjCVHB8=;
        b=bemFrxoK1O/xAeNQZlgI0V90DT49WcQ2K5JeTFmWe0gIGdpHpNGoAoRXMSoUynDSnq
         uEWLTDPVlHUPyAJU7ESyCRlt7zADA59+p3PigF1RCOWZNGy2jndH+4628spBNRzGXBQw
         /9j6/KZ1RRnxAvcfg8WFB3TYbB3JDft5XEOhGQAcM4WXjjAhmJPWASmtK1VPc6BrWHbV
         Kx+lTB6F6JkVnRLP4I4NdZCVG4vnUvulz6gZdJUwFT5t5Iwop6Sk9vt4ErSAR5f9mVg3
         oXU0S+LW/firvY8cxVKXPlZ7ClSaKpiIpbYQiTm1Xw5GAJWLUPHrwl7PWn7dntHLEv5r
         iGlQ==
X-Forwarded-Encrypted: i=1; AHgh+RpZFYFtBi1dUKJdyWEnI/wEuVc4qNY8ocf5lCi422nfLltDQYP6yPXriMr4kW9Sum9WO6jXnqp0G5N8spA=@vger.kernel.org
X-Gm-Message-State: AFuF++mPppkM1WFqQxFQYBQLYh2jpbhyr50PdccUyQPNRquVv2nnaLoN
	OSud/bU/uuEO5711yODzBTBvXLWPfY1byTJK6M1eGJmiqGVOzK4jZD6b3kKrsQT6YXPkR8E0EPw
	FHyKTAZ2+/BjZ7lucEip0lRLopcS9stfB6jGciLm5O2cNvfiOybpMzC0inSU=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:13c3:b0:4b2:e95f:37cf with SMTP id
 5614622812f47-4b39806c429mr21484376b6e.8.1788101569076; Sun, 30 Aug 2026
 07:52:49 -0700 (PDT)
Date: Sun, 30 Aug 2026 07:52:49 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9443c1.a8e469d2.cbf3.5609.GAE@google.com>
Subject: [syzbot] [usb?] WARNING in cx231xx_send_vendor_cmd/usb_submit_urb
From: syzbot <syzbot+ddccc0c0dbc0a38ffccb@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    cf72cbb39da8 Merge tag 'io_uring-7.3-20260828' of git://gi..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=11c2ae25580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5e4e3a0e188a497e
dashboard link: https://syzkaller.appspot.com/bug?extid=ddccc0c0dbc0a38ffccb
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14c1cc15580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15c2ae25580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/76d43caf1866/disk-cf72cbb3.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/1821781c5c85/vmlinux-cf72cbb3.xz
kernel image: https://storage.googleapis.com/syzbot-assets/31abf6144cf2/bzImage-cf72cbb3.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ddccc0c0dbc0a38ffccb@syzkaller.appspotmail.com

------------[ cut here ]------------
usb 5-1: BOGUS control dir, pipe 80000380 doesn't match bRequestType c0
WARNING: drivers/usb/core/urb.c:413 at usb_submit_urb+0x1057/0x18b0 drivers/usb/core/urb.c:411, CPU#0: syz-executor398/5632
Modules linked in:
CPU: 0 UID: 0 PID: 5632 Comm: syz-executor398 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
RIP: 0010:usb_submit_urb+0x1100/0x18b0 drivers/usb/core/urb.c:411
Code: b8 00 00 00 00 00 fc ff df 41 0f b6 04 04 84 c0 0f 85 b2 05 00 00 45 0f b6 45 00 48 8b 3c 24 48 8b 74 24 18 4c 89 f2 44 89 f9 <67> 48 0f b9 3a 48 bd 00 00 00 00 00 fc ff df e9 ba f2 ff ff 44 89
RSP: 0018:ffffc900039c74f8 EFLAGS: 00010246
RAX: 0000000000000000 RBX: ffff888026846b00 RCX: 0000000080000380
RDX: ffff8880222bc7a0 RSI: ffffffff8cc51500 RDI: ffffffff9087c3c0
RBP: dffffc0000000000 R08: 00000000000000c0 R09: 0000000000000000
R10: ffffc900039c75e0 R11: fffff52000738ec8 R12: 1ffff110045d11c8
R13: ffff888022e88e40 R14: ffff8880222bc7a0 R15: 0000000080000380
FS:  0000555560163400(0000) GS:ffff888124cdc000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f8c364f50f5 CR3: 000000007124e000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 usb_start_wait_urb+0x13f/0x5b0 drivers/usb/core/message.c:62
 usb_internal_control_msg drivers/usb/core/message.c:117 [inline]
 usb_control_msg+0x234/0x3e0 drivers/usb/core/message.c:167
 __usb_control_msg+0xf9/0x3f0 drivers/media/usb/cx231xx/cx231xx-core.c:249
 cx231xx_send_vendor_cmd+0x553/0x760 drivers/media/usb/cx231xx/cx231xx-core.c:-1
 cx231xx_send_usb_command+0x2e2/0x500 drivers/media/usb/cx231xx/cx231xx-core.c:205
 cx231xx_i2c_recv_bytes drivers/media/usb/cx231xx/cx231xx-i2c.c:-1 [inline]
 cx231xx_i2c_xfer+0xd60/0x2a90 drivers/media/usb/cx231xx/cx231xx-i2c.c:386
 __i2c_transfer+0x7bf/0x1fe0 drivers/i2c/i2c-core-base.c:-1
 i2c_transfer+0x1cb/0x2d0 drivers/i2c/i2c-core-base.c:2344
 i2c_transfer_buffer_flags+0x10d/0x1a0 drivers/i2c/i2c-core-base.c:2372
 i2c_master_recv include/linux/i2c.h:79 [inline]
 i2cdev_read+0x10d/0x250 drivers/i2c/i2c-dev.c:155
 vfs_read+0x213/0xa80 fs/read_write.c:572
 ksys_read+0x150/0x270 fs/read_write.c:716
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f08f411d339
Code: c0 79 93 eb d5 48 8d 7c 1d 00 eb 99 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 d8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffd7bfb4838 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f08f411d339
RDX: 0000000000000700 RSI: 0000000000000000 RDI: 0000000000000004
RBP: 00000000000f4240 R08: 0000000000000000 R09: 0000000000000009
R10: 0000000000000000 R11: 0000000000000246 R12: 00007ffd7bfb49b8
R13: 0000000000000002 R14: 00007ffd7bfb4860 R15: 00007ffd7bfb4850
 </TASK>
----------------
Code disassembly (best guess):
   0:	b8 00 00 00 00       	mov    $0x0,%eax
   5:	00 fc                	add    %bh,%ah
   7:	ff                   	lcall  (bad)
   8:	df 41 0f             	filds  0xf(%rcx)
   b:	b6 04                	mov    $0x4,%dh
   d:	04 84                	add    $0x84,%al
   f:	c0 0f 85             	rorb   $0x85,(%rdi)
  12:	b2 05                	mov    $0x5,%dl
  14:	00 00                	add    %al,(%rax)
  16:	45 0f b6 45 00       	movzbl 0x0(%r13),%r8d
  1b:	48 8b 3c 24          	mov    (%rsp),%rdi
  1f:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
  24:	4c 89 f2             	mov    %r14,%rdx
  27:	44 89 f9             	mov    %r15d,%ecx
* 2a:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2f:	48 bd 00 00 00 00 00 	movabs $0xdffffc0000000000,%rbp
  36:	fc ff df
  39:	e9 ba f2 ff ff       	jmp    0xfffff2f8
  3e:	44                   	rex.R
  3f:	89                   	.byte 0x89


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
