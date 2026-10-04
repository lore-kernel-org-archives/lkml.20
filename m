Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D34726CE32
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 09:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791105817; cv=none; b=TV8KVgWog8wvXOxIICwJarDMSi6rwZwO1OVB4yHgrmhE5Oz0PSSdWeaj85tmyk5zj6KCtXlUD7v4cApgKQvAmS2pBVNEabzrdqJYRYGZEgAjVslpP4dHR4y0rkIFUDUOjuD7i3q1EyNVPWG5EzKyi5LVHWJeCD+9nzeXIypsIuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791105817; c=relaxed/simple;
	bh=JOruKF6ICpf7ccIBl8w4fj+JrR2TOYImwntqoMYGJw0=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=XUSk8ylVW2R/BjLMH2xBgxzu1RjFjItuJ1862Xo5iLBZWVpZxOmdZvMXdAJ0LiZYqznvWneKy0ygL9KgN3NJYKyMz+YBdrsSqT5uZbUhSEbj7Kk+NUnmSpPrxJlpmzTFBM/nSzIZlLC8avn6YOZWvyeP2robPFrDNMQ7c9IWZAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-8254ce65bfeso992573a34.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 02:23:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791105814; x=1791710614;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ERFBgNbM0Mp7lY8nCI48D8Qg1LrSC5jE7VDefTf5/E=;
        b=PYJI6GO2ZU/6GROr6jKWC242c+DygqVnqCpu8rydaUb6eIFWXNKBRcAqaBLSdpZ8Ey
         vHOCYneOevoJ4f7JJ2+mVR1w1A+gmaOTy7pueK3c8vXGdOdctWz0YoEKvc3LK6q8Ve6c
         g9Yi+zFaBhFUIQquskHzrNLFyUq7xNzZel8bkjNfLut28KdbKdNxHyHBabtoqU4Mh/Ml
         dwJcJyTFpDVSVOXDhlzMpVwV9+EaEfRYaJgt07EJme7xoYrZ306dqnpkmIgGVSfNruOO
         nupKdLdrSu6W7ySGt907nvt92TlH/0zh7i3qLexWCcXfLkt1mZs/sKFRTly8D2CZ2X7v
         T7cQ==
X-Gm-Message-State: AFuF++lDUC+vMJ0qDlJPKCitU6J2QX+mxR55ZEc4sWbELl92FEkMYc96
	VNvgTfEdL1gAwQRNOB5K+5v4dh9S4Yii8GIWonL659ujosMJzeTbsWHIE0Pg6KjsRj7iwMSbZ9C
	jL/8ylKRPbbIExg8qtgnFQngBVaIZ3kJYtpUp8S9tA/AF2CH+0HS3WiwGkIo=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:190a:b0:4d6:9153:295c with SMTP id
 5614622812f47-4f67b027a3bmr5953029b6e.45.1791105814543; Sun, 04 Oct 2026
 02:23:34 -0700 (PDT)
Date: Sun, 04 Oct 2026 02:23:34 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac21b16.34119e79.2f92f3.0020.GAE@google.com>
Subject: [syzbot] [media?] general protection fault in friio_streaming_ctrl
From: syzbot <syzbot+ac020fbb657e00356ca2@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    ce1e0223d8ad Merge tag 'devicetree-fixes-for-7.3-2' of git..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=175307f5580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9d4242cb1c54cdf7
dashboard link: https://syzkaller.appspot.com/bug?extid=ac020fbb657e00356ca2
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10020ec9580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ac020fbb657e00356ca2@syzkaller.appspotmail.com

Oops: general protection fault, probably for non-canonical address 0xdffffc0000000061: 0000 [#1] SMP KASAN PTI
KASAN: null-ptr-deref in range [0x0000000000000308-0x000000000000030f]
CPU: 0 UID: 0 PID: 5921 Comm: syz-executor133 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/16/2026
RIP: 0010:friio_streaming_ctrl+0x43/0xd0 drivers/media/usb/dvb-usb-v2/gl861.c:521
Code: 93 d9 93 f9 31 ff 89 de e8 8a de 93 f9 85 db b8 ff 00 ff 96 bb 64 ff 00 64 0f 44 d8 49 81 c6 08 03 00 00 4c 89 f0 48 c1 e8 03 <42> 80 3c 38 00 74 08 4c 89 f7 e8 9e dc 03 fa 4d 8b 36 49 83 c6 38
RSP: 0018:ffffc900026e7b20 EFLAGS: 00010202
RAX: 0000000000000061 RBX: 000000006400ff64 RCX: ffff88807f1f3e80
RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000000
RBP: ffffc900026e7c18 R08: ffffffff907a627f R09: 1ffffffff20f4c4f
R10: dffffc0000000000 R11: ffffffff883434e0 R12: dffffc0000000000
R13: ffff8880558f13b8 R14: 0000000000000308 R15: dffffc0000000000
FS:  00007fc833ad86c0(0000) GS:ffff888124cc7000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000562c5103b520 CR3: 00000000730d4000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 dvb_usb_start_feed+0x57a/0xc70 drivers/media/usb/dvb-usb-v2/dvb_usb_core.c:308
 dmx_section_feed_start_filtering+0x519/0x6b0 drivers/media/dvb-core/dvb_demux.c:977
 dvb_dmxdev_filter_start+0xcdb/0x10d0 drivers/media/dvb-core/dmxdev.c:760
 dvb_demux_do_ioctl+0x470/0x540 drivers/media/dvb-core/dmxdev.c:1090
 dvb_usercopy+0x199/0x2e0 drivers/media/dvb-core/dvbdev.c:996
 dvb_demux_ioctl+0x29/0x40 drivers/media/dvb-core/dmxdev.c:1208
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fc835311cbb
Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
RSP: 002b:00007fc833ad8100 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000008 RCX: 00007fc835311cbb
RDX: 00007fc833ad8160 RSI: 00000000403c6f2b RDI: 0000000000000008
RBP: 00007fc833ad81a0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007fc83537d028
R13: 00007fc8353b0120 R14: 00007fc833ad8160 R15: 00007fc8353b0114
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:friio_streaming_ctrl+0x43/0xd0 drivers/media/usb/dvb-usb-v2/gl861.c:521
Code: 93 d9 93 f9 31 ff 89 de e8 8a de 93 f9 85 db b8 ff 00 ff 96 bb 64 ff 00 64 0f 44 d8 49 81 c6 08 03 00 00 4c 89 f0 48 c1 e8 03 <42> 80 3c 38 00 74 08 4c 89 f7 e8 9e dc 03 fa 4d 8b 36 49 83 c6 38
RSP: 0018:ffffc900026e7b20 EFLAGS: 00010202
RAX: 0000000000000061 RBX: 000000006400ff64 RCX: ffff88807f1f3e80
RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000000
RBP: ffffc900026e7c18 R08: ffffffff907a627f R09: 1ffffffff20f4c4f
R10: dffffc0000000000 R11: ffffffff883434e0 R12: dffffc0000000000
R13: ffff8880558f13b8 R14: 0000000000000308 R15: dffffc0000000000
FS:  00007fc833ad86c0(0000) GS:ffff888124dc7000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f4798882fb3 CR3: 00000000730d4000 CR4: 00000000003526f0
----------------
Code disassembly (best guess):
   0:	93                   	xchg   %eax,%ebx
   1:	d9 93 f9 31 ff 89    	fsts   -0x7600ce07(%rbx)
   7:	de e8                	fsubrp %st,%st(0)
   9:	8a de                	mov    %dh,%bl
   b:	93                   	xchg   %eax,%ebx
   c:	f9                   	stc
   d:	85 db                	test   %ebx,%ebx
   f:	b8 ff 00 ff 96       	mov    $0x96ff00ff,%eax
  14:	bb 64 ff 00 64       	mov    $0x6400ff64,%ebx
  19:	0f 44 d8             	cmove  %eax,%ebx
  1c:	49 81 c6 08 03 00 00 	add    $0x308,%r14
  23:	4c 89 f0             	mov    %r14,%rax
  26:	48 c1 e8 03          	shr    $0x3,%rax
* 2a:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1) <-- trapping instruction
  2f:	74 08                	je     0x39
  31:	4c 89 f7             	mov    %r14,%rdi
  34:	e8 9e dc 03 fa       	call   0xfa03dcd7
  39:	4d 8b 36             	mov    (%r14),%r14
  3c:	49 83 c6 38          	add    $0x38,%r14


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
