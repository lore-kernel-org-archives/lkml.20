Received: from mail-oo2-f10.google.com (mail-oo2-f10.google.com [74.125.231.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E343511E89
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789750656; cv=none; b=MrdoGbXEHiqoXKq8DorPw3FRhMlMTEEOko9c011zjpjvnw59NnMt1ZQh0w5wPiXBd4lB7whLcW81V12pNYF+dMt3C0DT+7p15XETnb/7skSjHBFbJPyui7nYkvfj8C9QJ9cNaUNbYAhGQ1yPmKvs86SWbdM6C7gJusjrLA75mjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789750656; c=relaxed/simple;
	bh=P8vIKyBb0blYs8sE6VGyf1YV1PxooPvGc7gMx+bdbr4=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=hgg9b9GzQat8ZqaCf3EKQbZ7/6wPYzM4p1usJpKSy2Rq/HWOBUSXi9akFdtGKr/DavRquuakTDF2KY1Le+8VQ2RpDylt1ik16n1gJQ7LV40k9klo+o3zEPF2exb492Yf2pgFveKoqIAnjBtGDZG84ma4v3jihNCaG3mWSWk2hb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo2-f10.google.com with SMTP id 006d021491bc7-6c7150a9098so377439eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:57:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789750651; x=1790355451;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sr0wBaNKXWCurFs3juz+OLUfyJau7b0GUHJIh9y66js=;
        b=FjH+w2RW03mX39qCvoSZFJwVhR3ozgcCTkxZTfqBGtlUvRujxEzXGw9xcP6y8B5mGI
         yXMx61+5zeyEbtAUgRPjisRDiJwAC6pONEeZmXZ6zgWq1FOvP1ac+7aZYwYhWbeLgDHb
         quHRNvFkTY1dTkQJ+mfZPPgh0D0cXYnGm70jLCX1CbG8ipRx4II4UJojP+qBUKwjbUb9
         GzgTN49K0ivs5mWBWeTa4Y+XXztgJVIubvQlzMGTc0/8Ce46KEjkTnYsufAfWFwWrBWk
         5XpTfqACmoLnpr6SWHekwaiMVVx6KDeteApEED7JFEzzuV65fwJnEgVftRz4d3ytFV+7
         HwQg==
X-Gm-Message-State: AFuF++nmBwFiTzN0P6YuNAMtmIu6geoRKzJ8ycogJv9mSMGhO87m9nAv
	Xe3IUOMHGfxmlGOlh2rFmEy0LgiQe+nexi5FSyyG3K9LXUaZK9BnI1oL+Z4ErAXlLJq7/L9QSTK
	CSs9Y/Kcv2iQgG7DxfMiEGyy2oD/NsQvfV92QO62UrBrlEjnQoSLwtBKNEdp5uw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:c8e:b0:6b1:a812:9871 with SMTP id
 006d021491bc7-6ca9a5471b7mr2960164eaf.18.1789750650881; Fri, 18 Sep 2026
 09:57:30 -0700 (PDT)
Date: Fri, 18 Sep 2026 09:57:30 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aad6d7a.0c43d342.320d00.0000.GAE@google.com>
Subject: [syzbot] [media?] [usb?] WARNING in ttusb_start_feed/usb_submit_urb
From: syzbot <syzbot+3caf6a60e5f9be12de08@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, mchehab@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    50d05c7c76c9 Merge tag 'landlock-7.3-rc3' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11c1e7f9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5e4e3a0e188a497e
dashboard link: https://syzkaller.appspot.com/bug?extid=3caf6a60e5f9be12de08
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
userspace arch: i386
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13c1e7f9580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17c1e7f9580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/daf497619736/disk-50d05c7c.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/748fbd82f647/vmlinux-50d05c7c.xz
kernel image: https://storage.googleapis.com/syzbot-assets/e61c59099d07/bzImage-50d05c7c.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+3caf6a60e5f9be12de08@syzkaller.appspotmail.com

usb 1-1: BOGUS urb xfer, pipe 0 != type 1
------------[ cut here ]------------
usb 1-1: BOGUS urb flags, 202 --> 200
WARNING: drivers/usb/core/urb.c:533 at usb_submit_urb+0xc9d/0x18b0 drivers/usb/core/urb.c:532, CPU#1: syz.0.17/5856
Modules linked in:
CPU: 1 UID: 0 PID: 5856 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
RIP: 0010:usb_submit_urb+0xd28/0x18b0 drivers/usb/core/urb.c:532
Code: e8 7d 79 c9 fa 4c 89 f7 4d 8b 6d 00 41 0f b6 04 2c 84 c0 48 8b 54 24 18 0f 85 97 07 00 00 8b 0a 48 8b 34 24 4c 89 ea 45 89 f8 <67> 48 0f b9 3a 4c 8b 6c 24 08 4c 89 ef 48 c7 c6 80 2b b0 8f e8 9f
RSP: 0018:ffffc90003447918 EFLAGS: 00010246
RAX: 0000000000000000 RBX: ffff888075636400 RCX: 0000000000000202
RDX: ffff88802b2ed020 RSI: ffffffff8cc51f20 RDI: ffffffff9087dfb0
RBP: dffffc0000000000 R08: 0000000000000200 R09: 0000000000000004
R10: 0000000000000003 R11: 0000000000000000 R12: 1ffff1100eac6c8b
R13: ffff88802b2ed020 R14: ffff888031879100 R15: 0000000000000200
FS:  0000000000000000(0000) GS:ffff888124dd2000(0063) knlGS:00000000571d4480
CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
CR2: 0000557bc126bb18 CR3: 000000007579a000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 ttusb_start_iso_xfer drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c:829 [inline]
 ttusb_start_feed+0xe19/0x1770 drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c:899
 dmx_ts_feed_start_filtering+0x129/0x220 drivers/media/dvb-core/dvb_demux.c:747
 dvb_dmxdev_start_feed drivers/media/dvb-core/dmxdev.c:658 [inline]
 dvb_dmxdev_filter_start+0x434/0x10d0 drivers/media/dvb-core/dmxdev.c:769
 dvb_demux_do_ioctl+0x48b/0x540 drivers/media/dvb-core/dmxdev.c:1099
 dvb_usercopy+0x199/0x2e0 drivers/media/dvb-core/dvbdev.c:996
 dvb_demux_ioctl+0x29/0x40 drivers/media/dvb-core/dmxdev.c:1208
 __do_compat_sys_ioctl fs/ioctl.c:695 [inline]
 __se_compat_sys_ioctl fs/ioctl.c:638 [inline]
 __ia32_compat_sys_ioctl+0x5ea/0x950 fs/ioctl.c:638
 do_syscall_32_irqs_on arch/x86/entry/syscall_32.c:79 [inline]
 __do_fast_syscall_32+0x27a/0x6a0 arch/x86/entry/syscall_32.c:291
 do_fast_syscall_32+0x33/0x70 arch/x86/entry/syscall_32.c:316
 entry_SYSENTER_compat_after_hwframe+0x84/0x8e
RIP: 0023:0xf707f0ec
Code: 90 85 d2 74 0a 89 ce 81 e6 ff 0f 00 00 89 32 85 c0 74 05 c1 e9 0c 89 08 31 c0 5e 5d c3 90 0f 1f 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 58 b8
RSP: 002b:00000000fffcedac EFLAGS: 00000206 ORIG_RAX: 0000000000000036
RAX: ffffffffffffffda RBX: 0000000000000006 RCX: 0000000040146f2c
RDX: 0000000080000300 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000206 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>
----------------
Code disassembly (best guess):
   0:	e8 7d 79 c9 fa       	call   0xfac97982
   5:	4c 89 f7             	mov    %r14,%rdi
   8:	4d 8b 6d 00          	mov    0x0(%r13),%r13
   c:	41 0f b6 04 2c       	movzbl (%r12,%rbp,1),%eax
  11:	84 c0                	test   %al,%al
  13:	48 8b 54 24 18       	mov    0x18(%rsp),%rdx
  18:	0f 85 97 07 00 00    	jne    0x7b5
  1e:	8b 0a                	mov    (%rdx),%ecx
  20:	48 8b 34 24          	mov    (%rsp),%rsi
  24:	4c 89 ea             	mov    %r13,%rdx
  27:	45 89 f8             	mov    %r15d,%r8d
* 2a:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2f:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
  34:	4c 89 ef             	mov    %r13,%rdi
  37:	48 c7 c6 80 2b b0 8f 	mov    $0xffffffff8fb02b80,%rsi
  3e:	e8                   	.byte 0xe8
  3f:	9f                   	lahf


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
