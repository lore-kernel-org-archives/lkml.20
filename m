Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792558543;
	b=Urm18Cyi1K5oi6C0Wgqg3J8SLDqLAeUMCdhpRnnYFQgaxXXnW5cgzxNks7ma0imG2x4f
	 RcBEOLjL3Ksr3GYLg9Pb1qzc226MZrzeBrbo7b6GGZ+ULPQHCVXZ+OZHvhaqOVfu0FRdc
	 d2ysy9aXQo3iE1jdsOkBBv52zB8J5A+S90b8yWKFIHUEW+Qn5eOpb0wwOZGUN/0VNA4Qy
	 wa2VLh9NTUWjBrQ65gS9Ynn91Cr8uEc4U7OsNOFHQQ+2iNbYNVWmmpIhourMFNqvV7XQb
	 hWmh6KoMyWdX5/OKka25VPBdYWbejpDkW9CNMQNOLxp6j4h9FHZ/Mvbqhwdc1ytq57A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792558543;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=7p64dRl7W+dYi3/WAy1SQ+N74t55JrjfdozgFsHtATY=;
	b=sxvHBCRTrgjfmw1v271dArsrtv8tCmXWgEb/Ekua+B6S1rtee7jqL7PmRPNqlIs40vCR
	 tfpavcxtwveNBPw8l7DAiNogzwbCFKLWihhLVJiytiLd3yANy0pzIaCbB8mCUJve1+TqH
	 kpCVNs3s0adH3iPbICO5EY4FeKwR/lPCR128+gh5T6u5OmnyfIUiBIeeQY+fCzd/YQv/+
	 uAgw4mR7GBcb9Q7DR9/c+f5hfAz4SFjIzBrsPwFZHwfL8hIJvUnWZEowjQQic1PaKtb84
	 kQlnbdHmv50nkWUrChv9C5U0xhdD8BMGOhNTM4wzCq0i1WDrMx5LtWoyUHr6xXTqn0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52593606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:55:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52593606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4ab4f652f9bso271249b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 21:55:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792558542; x=1793163342;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7p64dRl7W+dYi3/WAy1SQ+N74t55JrjfdozgFsHtATY=;
        b=pAsO2VA+S9IO6Nxi1THhNrMfIi0EU6/1gKgpGketA0tdfeVtOiFw1jZ/IwB9Sq3/GU
         RC4y6XE5ks7weYrJXonZgGuk/yX4DOz6Rm/7ABC5Qfcw3Fk25av/ikMAwgQXSNcrIqqF
         V+7bSUAzGfu6Io1tW+EBcQ4laxy1XQ34qsPJBdhFjLCfLtFyirzR7YnvonoA0yKdNZUi
         uhf78gttq1IDP4aGlemgZzFt6pJwpkKwynzkPhFutsm2/upjRuwPe1CjDeh0z91gER3b
         9A/3mLUxkk5nFBhulq4uksKGTBfbi0WfUXHNZf/754l/4X5Vnglv65kExL/QFFRrmS1M
         +0pQ==
X-Gm-Message-State: AFq9FYJ8mtVaPSGuxw0ieYbdSZSJy+vkHz56h9zxBsq6S1XO1keAgFTM
	P0zOYSQozMi2dfwWwBhfWN2g7w3dFrbKpLyEm/goOpUfE4rzTp1D6iYTv/7zaRIOsjR4FIdvyEz
	svxaABUaBK2pQpfRdrbbuVvsgOgJqZDFqSs8j8yPS7OogICrupdCwz5tLJt0=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1990:b0:539:596f:6623 with SMTP id
 5614622812f47-553601848ccmr842652b6e.64.1792558542278; Tue, 20 Oct 2026
 21:55:42 -0700 (PDT)
Date: Tue, 20 Oct 2026 21:55:42 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad845ce.46bc089a.3217e3.003a.GAE@google.com>
Subject: [syzbot] [media?] general protection fault in mxl111sf_get_stream_config_atsc_mh
From: syzbot <syzbot+ffac2da5e6f8ad2671b2@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    c03c1a14507d Linux 7.3
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=1168a305580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c4b098695335c89f
dashboard link: https://syzkaller.appspot.com/bug?extid=ffac2da5e6f8ad2671b2
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=127cc081580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ffac2da5e6f8ad2671b2@syzkaller.appspotmail.com

Oops: general protection fault, probably for non-canonical address 0xdffffc00000000a1: 0000 [#1] SMP KASAN PTI
KASAN: null-ptr-deref in range [0x0000000000000508-0x000000000000050f]
CPU: 1 UID: 0 PID: 5937 Comm: syz-executor260 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/07/2026
RIP: 0010:mxl111sf_get_stream_config_atsc_mh+0x3e/0x9d0 drivers/media/usb/dvb-usb-v2/mxl111sf.c:1193
Code: 49 89 ff 49 bd 00 00 00 00 00 fc ff df e8 0a 54 92 f9 0f 1f 44 00 00 e8 00 54 92 f9 49 81 c7 08 05 00 00 4c 89 f8 48 c1 e8 03 <42> 0f b6 04 28 84 c0 0f 85 e7 03 00 00 45 8b 3f 4c 89 ff 48 c7 c6
RSP: 0018:ffffc9000345fb28 EFLAGS: 00010202
RAX: 00000000000000a1 RBX: ffffc9000345fbc0 RCX: ffff888077398000
RDX: 0000000000000000 RSI: ffff888058feca19 RDI: 0000000000000000
RBP: ffffc9000345fc38 R08: 0000001800060502 R09: 0000000100000c00
R10: 0000001800060502 R11: ffffffff8835bdd0 R12: dffffc0000000000
R13: dffffc0000000000 R14: ffff888058feca19 R15: 0000000000000508
FS:  00007f554a6f06c0(0000) GS:ffff888123bbf000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fc031d500f5 CR3: 0000000034892000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 dvb_usb_start_feed+0x361/0xc70 drivers/media/usb/dvb-usb-v2/dvb_usb_core.c:271
 dmx_ts_feed_start_filtering+0x129/0x220 drivers/media/dvb-core/dvb_demux.c:747
 dvb_dmxdev_start_feed drivers/media/dvb-core/dmxdev.c:658 [inline]
 dvb_dmxdev_filter_start+0x434/0x10d0 drivers/media/dvb-core/dmxdev.c:769
 dvb_demux_do_ioctl+0x48b/0x540 drivers/media/dvb-core/dmxdev.c:1099
 dvb_usercopy+0x199/0x2e0 drivers/media/dvb-core/dvbdev.c:996
 dvb_demux_ioctl+0x29/0x40 drivers/media/dvb-core/dmxdev.c:1208
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f554a728c1b
Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
RSP: 002b:00007f554a6efe30 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000008 RCX: 00007f554a728c1b
RDX: 00007f554a6efe90 RSI: 0000000040146f2c RDI: 0000000000000008
RBP: 00007f554a796625 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f554a79644d
R13: 00007f554a7c1598 R14: 00007f5540000b70 R15: 00007f554a7c15b0
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:mxl111sf_get_stream_config_atsc_mh+0x3e/0x9d0 drivers/media/usb/dvb-usb-v2/mxl111sf.c:1193
Code: 49 89 ff 49 bd 00 00 00 00 00 fc ff df e8 0a 54 92 f9 0f 1f 44 00 00 e8 00 54 92 f9 49 81 c7 08 05 00 00 4c 89 f8 48 c1 e8 03 <42> 0f b6 04 28 84 c0 0f 85 e7 03 00 00 45 8b 3f 4c 89 ff 48 c7 c6
RSP: 0018:ffffc9000345fb28 EFLAGS: 00010202
RAX: 00000000000000a1 RBX: ffffc9000345fbc0 RCX: ffff888077398000
RDX: 0000000000000000 RSI: ffff888058feca19 RDI: 0000000000000000
RBP: ffffc9000345fc38 R08: 0000001800060502 R09: 0000000100000c00
R10: 0000001800060502 R11: ffffffff8835bdd0 R12: dffffc0000000000
R13: dffffc0000000000 R14: ffff888058feca19 R15: 0000000000000508
FS:  00007f554a6f06c0(0000) GS:ffff888123bbf000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fc031d500f5 CR3: 0000000034892000 CR4: 00000000003526f0
----------------
Code disassembly (best guess):
   0:	49 89 ff             	mov    %rdi,%r15
   3:	49 bd 00 00 00 00 00 	movabs $0xdffffc0000000000,%r13
   a:	fc ff df
   d:	e8 0a 54 92 f9       	call   0xf992541c
  12:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  17:	e8 00 54 92 f9       	call   0xf992541c
  1c:	49 81 c7 08 05 00 00 	add    $0x508,%r15
  23:	4c 89 f8             	mov    %r15,%rax
  26:	48 c1 e8 03          	shr    $0x3,%rax
* 2a:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax <-- trapping instruction
  2f:	84 c0                	test   %al,%al
  31:	0f 85 e7 03 00 00    	jne    0x41e
  37:	45 8b 3f             	mov    (%r15),%r15d
  3a:	4c 89 ff             	mov    %r15,%rdi
  3d:	48                   	rex.W
  3e:	c7                   	.byte 0xc7
  3f:	c6                   	.byte 0xc6


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
