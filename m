Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4836F231842
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 22:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790461413; cv=none; b=n2e8p3V5pljF9Cz61X6QaoUH6k8KNpnh1l9Xa9YW7V5d10ng8css2VqORZ/UermcJsnMqK/D5d1flAwa/9fc/HwzRm24nC6QazeAe6q+uPk/pn1XWLuTPOTu0kNOakakq6JmJ7PtsfjIr+d9ChHvyHHijWwGQ+hJQA+jRgfUYFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790461413; c=relaxed/simple;
	bh=/R+QVqr3aAgIHoKL9XnLG4r1x5KOKm9X430DAmdgfVo=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=YU5xyY4hGFoC430MLD2d6u79ZtxWU080Awk5E6Zt32OhpAmOjsrX0h7arGDfB84jky8nPxrz3p6DfxazwUZi+HavjSxU+2EygmmYiMrMrWWXiVIB0+psSuA+jmHVFP74+ipmNlkog6OJEfYDv4h0Z1h4bJo+sVuZSzLU63DkAsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b28dbf4197so4009942b6e.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 15:23:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790461410; x=1791066210;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ddSBLIw73d/Y9INkuZNrFEgdyDpyN4p2NvVyq+7XVwo=;
        b=DUI/AqNI0oGfBwu3N8US8EWE3lvc3EGgTToSmy1L5/mj9QfiDTkseRajiKq1NzEWwl
         8itD/5EaT8ER4PhPAWs97T0CZhF+yYoBK4uUjJjJoeb8g6fTSIbtJfJpNcy2ZU9f5JJH
         b6cC1x2IKDNwF8fKJ26tmVmcqk6+Z0rUpcrajiXUI39gEwnpxs7JFXF0Fa6gPBy0C5YW
         A1SDKEM5f9GayBTPXa/RlHi+K2GawM0ELSyYNHPhufxwSZVfYYpvcxAb9qbFG/ztn6Qy
         duA2zL8DPDl0Yp/QA3Iv2h7BGTjS0ly5G2s0xymnPVcIdJ6EqpkNGP19+HR4obRxDeIZ
         th4A==
X-Gm-Message-State: AFuF++k+hXaM/up/rZGvGeV5wEvJD6MrcfNlJKfvnzl6E1OSfYcBuVOF
	UVtiuPGgD8TvWCDtwd3aMIwA4culbLhhXqSFu3reUL4CB2RUw996uThCybHK95nEJj97d45L2R4
	cX1z/4WT5RU/tCqrMXCSzDvmESC97+Rbi22j7qrfXso39FhAa45D7O6kS0Uc=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:6712:b0:4b9:e6ab:d07c with SMTP id
 5614622812f47-4d72cb41489mr9816168b6e.28.1790461410322; Sat, 26 Sep 2026
 15:23:30 -0700 (PDT)
Date: Sat, 26 Sep 2026 15:23:30 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab845e2.e548f532.1ca396.0033.GAE@google.com>
Subject: [syzbot] [media?] [usb?] general protection fault in mxl111sf_ep6_streaming_ctrl
From: syzbot <syzbot+c35815bad054e6ad396e@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, mchehab@kernel.org, mkrufky@linuxtv.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    6812ce4e4379 Merge tag 'drm-fixes-2026-09-26' of https://g..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=133dc605580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9d4242cb1c54cdf7
dashboard link: https://syzkaller.appspot.com/bug?extid=c35815bad054e6ad396e
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12c77a05580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14d05a05580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/75990baa24e4/disk-6812ce4e.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/bc9afcf309d7/vmlinux-6812ce4e.xz
kernel image: https://storage.googleapis.com/syzbot-assets/35a3beb2ec93/bzImage-6812ce4e.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+c35815bad054e6ad396e@syzkaller.appspotmail.com

usb 1-1: dvb_usb_v2: could not submit urb no. 0 - get them all back
Oops: general protection fault, probably for non-canonical address 0xdffffc0000000061: 0000 [#1] SMP KASAN NOPTI
KASAN: null-ptr-deref in range [0x0000000000000308-0x000000000000030f]
CPU: 0 UID: 0 PID: 5651 Comm: syz-executor908 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/05/2026
RIP: 0010:mxl111sf_ep6_streaming_ctrl+0x2e/0x2e0 drivers/media/usb/dvb-usb-v2/mxl111sf.c:348
Code: 55 41 57 41 56 41 54 53 89 f5 49 89 fe 49 bc 00 00 00 00 00 fc ff df e8 10 62 93 f9 49 8d 9e 08 03 00 00 48 89 d8 48 c1 e8 03 <42> 80 3c 20 00 74 08 48 89 df e8 53 66 03 fa 48 8b 1b 48 83 c3 38
RSP: 0018:ffffc900036b7b30 EFLAGS: 00010212
RAX: 0000000000000061 RBX: 0000000000000308 RCX: ffff88807faf0000
RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000000
RBP: 0000000000000001 R08: ffffc900036b7647 R09: 1ffff920006d6ec8
R10: dffffc0000000000 R11: ffffffff883479d0 R12: dffffc0000000000
R13: ffff8880798113b8 R14: 0000000000000000 R15: ffff8880798108d8
FS:  000055558749c400(0000) GS:ffff888124cca000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fbf685aaa20 CR3: 0000000020716000 CR4: 0000000000350ef0
Call Trace:
 <TASK>
 dvb_usb_start_feed+0x57a/0xc70 drivers/media/usb/dvb-usb-v2/dvb_usb_core.c:308
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
RIP: 0033:0x7fbf6855bcf9
Code: c0 79 93 eb d5 48 8d 7c 1d 00 eb 99 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 d8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fff0240de98 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007fbf6855bcf9
RDX: 0000200000000100 RSI: 0000000040146f2c RDI: 0000000000000004
RBP: 00000000000f4240 R08: 0000000000000000 R09: 0000000000000009
R10: 0000000000000000 R11: 0000000000000246 R12: 00000000000140fe
R13: 00007fff0240deac R14: 00007fff0240dec0 R15: 00007fff0240deb0
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:mxl111sf_ep6_streaming_ctrl+0x2e/0x2e0 drivers/media/usb/dvb-usb-v2/mxl111sf.c:348
Code: 55 41 57 41 56 41 54 53 89 f5 49 89 fe 49 bc 00 00 00 00 00 fc ff df e8 10 62 93 f9 49 8d 9e 08 03 00 00 48 89 d8 48 c1 e8 03 <42> 80 3c 20 00 74 08 48 89 df e8 53 66 03 fa 48 8b 1b 48 83 c3 38
RSP: 0018:ffffc900036b7b30 EFLAGS: 00010212
RAX: 0000000000000061 RBX: 0000000000000308 RCX: ffff88807faf0000
RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000000
RBP: 0000000000000001 R08: ffffc900036b7647 R09: 1ffff920006d6ec8
R10: dffffc0000000000 R11: ffffffff883479d0 R12: dffffc0000000000
R13: ffff8880798113b8 R14: 0000000000000000 R15: ffff8880798108d8
FS:  000055558749c400(0000) GS:ffff888124dca000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fff0240ce50 CR3: 0000000020716000 CR4: 0000000000350ef0
----------------
Code disassembly (best guess):
   0:	55                   	push   %rbp
   1:	41 57                	push   %r15
   3:	41 56                	push   %r14
   5:	41 54                	push   %r12
   7:	53                   	push   %rbx
   8:	89 f5                	mov    %esi,%ebp
   a:	49 89 fe             	mov    %rdi,%r14
   d:	49 bc 00 00 00 00 00 	movabs $0xdffffc0000000000,%r12
  14:	fc ff df
  17:	e8 10 62 93 f9       	call   0xf993622c
  1c:	49 8d 9e 08 03 00 00 	lea    0x308(%r14),%rbx
  23:	48 89 d8             	mov    %rbx,%rax
  26:	48 c1 e8 03          	shr    $0x3,%rax
* 2a:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1) <-- trapping instruction
  2f:	74 08                	je     0x39
  31:	48 89 df             	mov    %rbx,%rdi
  34:	e8 53 66 03 fa       	call   0xfa03668c
  39:	48 8b 1b             	mov    (%rbx),%rbx
  3c:	48 83 c3 38          	add    $0x38,%rbx


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
