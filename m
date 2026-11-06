Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793950541;
	b=vnq20gpwKpg5Yh4qYBqneM1cqZHhNHs54cDfunRbizKuFq0dR7bCZqQHA+n528SZszxv
	 IB4tRiMo1k8WrZVR5lNL77EmD6uM27DwFzUK4MlZE86sj+bcDZpEqxryvmyDJzDO2rHPf
	 UOEWJmEtIlP5jgaQeF5XyhdI60uGc3FADhdTFYN0+QM2xJ7bOzgXRHo0Ox8/CdhdRD3PF
	 6DZ9yIP3oGSZYuMHEVWY/41y15cu1FxgBefJJ/qciRkS8THzsj/n/G6LRc4/PzwLugJBe
	 bzfBHoBmvG1VUM+gl3NzrGy1szIAfWtik78xKjlgm7FviL6qXZT1NduTM9s+76CrcXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793950541;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=jofUOUuZGiOeY+WDnYLz9GGB6wS0Rpuagpa+I9Ypomo=;
	b=0DMfqaqTiCAr4TkA76bW/yPdT+zzVXgmS15h5vCcjLecZRhQwcCg61X/j2Ia8z/nrBUl
	 KYDbLtTUXXruxNbmCXc8aQmQf/mlIyn75U+DPrKBtb2PLs/RYX6tpylIemSUwDjWwniwA
	 Shan7kpgaS1ikIgJEVTjGiujoFRYLe7n6Xivzw7hiGoranGGIBQJs4ny6UWjXOSgvudd7
	 XGcLjZZYxttTvuRtViBpW0k7wJMLrrVKBTnusZ0u5n5l/NsZfWAY9qjjDcXd6riwcbgpa
	 +OQWbGMq/fI2/Cl0pEau+H4XuUSeCky0FEaDN7C1fvtc4WkR0icjRXc+gXZgooLR+rQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3325C606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 07:35:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3325C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4db3db8687fso521933b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 23:35:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793950540; x=1794555340;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jofUOUuZGiOeY+WDnYLz9GGB6wS0Rpuagpa+I9Ypomo=;
        b=UEfcrKKwYlS8EH0vclsOw6q/mgtkC6wNaBnkPm4cSe5v6y4DHZKCM7Tbwc739unyVy
         7MuDrcqRIfhL/2jjvDyjF36dZ+Lbzfv1BAo/srdjpqzDRpI/8I5ciYt1tE5IHNyv2kuI
         eG6X0HQXWtiAx4f6wwx6XKYgaN/ws0pHNAt2/EVU2RF21a91AfXWBXGDq0Bt4U1cmtMk
         FQWgJD3f1BV8dvJ8rXUbSKDnVT8Ms16h3/tS2pv4QlffuV8yWth50WS2BM7uGbRMizp+
         +hAhlT6FrRFcqKK+nH5kCSK/oUT043NRXPaHHIR4GY5YoPEN11ij6BHE4BTieyINbe75
         3alA==
X-Forwarded-Encrypted: i=1; AKwUvBw/83vn7cQSj+Vfp5VGNhzLyCwgPhMIHzbLOjm7Uaope2Z6+ckqZwwTFKVA7CYiun6+sr8g3v+8pbY6RjA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bzkvGoOJFkd2AuelA93jJmMDlMfdetrBXUAEASmOm8xc5MBr0
	sliOaPhm1+8VWcknzYm8rOpNHPEjGh+pfsxTzjV01VO8vtTwuNtNxLJnkmQUNwyQDDGLQzWdlrs
	dplyMKaC6+IcvMf9khzmQ78CPe/v06UwPV9WIetF6mKVRieOlMxhAijzykQM=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:178e:b0:564:3fe1:2fad with SMTP id
 5614622812f47-567e112c9c6mr1124051b6e.42.1793950540032; Thu, 05 Nov 2026
 23:35:40 -0800 (PST)
Date: Thu, 05 Nov 2026 23:35:40 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aed834c.dadc8e63.45095.0003.GAE@google.com>
Subject: [syzbot] [usb?] general protection fault in mct_u232_open
From: syzbot <syzbot+58b2d8b19cd6761a395b@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, johan@kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    ddfe51b0a0f5 Add linux-next specific files for 20261105
git tree:       linux-next
console+strace: https://syzkaller.appspot.com/x/log.txt?x=12627abe580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3dffa811bfeed6b4
dashboard link: https://syzkaller.appspot.com/bug?extid=58b2d8b19cd6761a395b
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14f5f2be580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16627abe580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/181043a4bd52/disk-ddfe51b0.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/a69d8b670c38/vmlinux-ddfe51b0.xz
kernel image: https://storage.googleapis.com/syzbot-assets/906d515c0893/bzImage-ddfe51b0.xz

AI-generated root cause summary:
In mct_u232_open(), if submitting the read URB via
usb_submit_urb(priv->read_urb, GFP_KERNEL) fails, the driver logs an error
message referencing port->read_urb->pipe instead of priv->read_urb->pipe.
Because the MCT U232 adapter uses interrupt-in endpoints instead of bulk-in
endpoints, port->read_urb is never allocated or set up by the usb-serial core
and remains NULL. Dereferencing port->read_urb->pipe in the error path results
in a NULL-pointer dereference at offset 0x50 (the offset of the pipe field in
struct urb), crashing the kernel with an oops.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=58b2d8b19cd6761a395b

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+58b2d8b19cd6761a395b@syzkaller.appspotmail.com

mct_u232 ttyUSB0: Set MODEM CTRL 0xb failed (error = -71)
mct_u232 ttyUSB0: Set LINE CTRL 0x3 failed (error = -71)
mct_u232 ttyUSB0: Get MODEM STATus failed (error = -19)
Oops: general protection fault, probably for non-canonical address 0xdffffc000000000a: 0000 [#1] SMP KASAN PTI
KASAN: null-ptr-deref in range [0x0000000000000050-0x0000000000000057]
CPU: 0 UID: 0 PID: 5718 Comm: syz-executor711 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/07/2026
RIP: 0010:mct_u232_open+0x39c/0x680 drivers/usb/serial/mct_u232.c:460
Code: 8d 9e 20 04 00 00 48 89 d8 48 c1 e8 03 42 80 3c 38 00 74 08 48 89 df e8 62 c3 6e fa 48 8b 1b 48 83 c3 50 48 89 d8 48 c1 e8 03 <42> 0f b6 04 38 84 c0 0f 85 a7 01 00 00 8b 13 49 81 c6 40 05 00 00
RSP: 0018:ffffc90003b7f760 EFLAGS: 00010206
RAX: 000000000000000a RBX: 0000000000000050 RCX: ffff88802e889f40
RDX: 0000000000000000 RSI: 00000000ffffffed RDI: 0000000000000000
RBP: 00000000ffffffed R08: ffffffff91e120bf R09: 1ffffffff23c2417
R10: dffffc0000000000 R11: fffffbfff23c2418 R12: 1ffff11005c8bf50
R13: dffffc0000000000 R14: ffff888034df4000 R15: dffffc0000000000
FS:  0000555579e9e400(0000) GS:ffff888123159000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f2cf0c571bc CR3: 0000000037ff2000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 serial_port_activate+0x151/0x250 drivers/usb/serial/usb-serial.c:268
 tty_port_open+0x1df/0x2d0 drivers/tty/tty_port.c:798
 tty_open+0x48a/0xd80 drivers/tty/tty_io.c:2112
 chrdev_open+0x4d9/0x600 fs/char_dev.c:413
 do_dentry_open+0x80e/0x1360 fs/open.c:1000
 vfs_open_consume+0x4a/0x350 fs/open.c:1131
 do_open fs/namei.c:4851 [inline]
 path_openat+0x16fc/0x20f0 fs/namei.c:5016
 do_file_open+0x23e/0x4a0 fs/namei.c:5045
 do_sys_openat2+0x115/0x200 fs/open.c:1443
 do_sys_open fs/open.c:1449 [inline]
 __do_sys_openat fs/open.c:1789 [inline]
 __se_sys_openat fs/open.c:1784 [inline]
 __x64_sys_openat+0x138/0x170 fs/open.c:1784
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x16a/0x530 arch/x86/entry/syscall_64.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x00007f2cf0bf0079
Code: c0 79 93 eb d5 48 8d 7c 1d 00 eb 99 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 d8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffe3866ad58 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f2cf0bf0079
RDX: 0000000000000000 RSI: 0000200000000200 RDI: 00000000ffffff9c
RBP: 00000000000f4240 R08: 0000000000000009 R09: 0000000000000009
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000014f37
R13: 00007ffe3866ad6c R14: 00007ffe3866ad80 R15: 00007ffe3866ad70
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:mct_u232_open+0x39c/0x680 drivers/usb/serial/mct_u232.c:460
Code: 8d 9e 20 04 00 00 48 89 d8 48 c1 e8 03 42 80 3c 38 00 74 08 48 89 df e8 62 c3 6e fa 48 8b 1b 48 83 c3 50 48 89 d8 48 c1 e8 03 <42> 0f b6 04 38 84 c0 0f 85 a7 01 00 00 8b 13 49 81 c6 40 05 00 00
RSP: 0018:ffffc90003b7f760 EFLAGS: 00010206
RAX: 000000000000000a RBX: 0000000000000050 RCX: ffff88802e889f40
RDX: 0000000000000000 RSI: 00000000ffffffed RDI: 0000000000000000
RBP: 00000000ffffffed R08: ffffffff91e120bf R09: 1ffffffff23c2417
R10: dffffc0000000000 R11: fffffbfff23c2418 R12: 1ffff11005c8bf50
R13: dffffc0000000000 R14: ffff888034df4000 R15: dffffc0000000000
FS:  0000555579e9e400(0000) GS:ffff888123159000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f2cf0c92680 CR3: 0000000037ff2000 CR4: 00000000003526f0
----------------
Code disassembly (best guess):
   0:	8d 9e 20 04 00 00    	lea    0x420(%rsi),%ebx
   6:	48 89 d8             	mov    %rbx,%rax
   9:	48 c1 e8 03          	shr    $0x3,%rax
   d:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)
  12:	74 08                	je     0x1c
  14:	48 89 df             	mov    %rbx,%rdi
  17:	e8 62 c3 6e fa       	call   0xfa6ec37e
  1c:	48 8b 1b             	mov    (%rbx),%rbx
  1f:	48 83 c3 50          	add    $0x50,%rbx
  23:	48 89 d8             	mov    %rbx,%rax
  26:	48 c1 e8 03          	shr    $0x3,%rax
* 2a:	42 0f b6 04 38       	movzbl (%rax,%r15,1),%eax <-- trapping instruction
  2f:	84 c0                	test   %al,%al
  31:	0f 85 a7 01 00 00    	jne    0x1de
  37:	8b 13                	mov    (%rbx),%edx
  39:	49 81 c6 40 05 00 00 	add    $0x540,%r14


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
