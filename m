Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793327804;
	b=kGp2VivOzDpmuGlDYLeyGZhsTpB6jZvYV6alTXSKlNAADd7roh/4b4kNcZFbMhRbEXpI
	 J9M7jthvs8FTv1QtEQ3MPjS3M0awai0ligr2irluKesg7/Q9TLzZaqJhhkYXfHFLN8wHf
	 0ALfTCHdXHB3xr9hiTCht9qT4GXLSxCNLLfTq4EOEx4VPxJl9mUMqH2GFJBqUvSmYl+kf
	 l6f9SWzIHxHeqLUkyRhEMp1QKKELu6eHlPXLAA1SvztnkOZ9BrrULujkVPzyiPCsOSPkc
	 qJ6c2RY9tZTKMDWB7F0xuoToBlR5Y5CCj9bf2qgpBeO75MnLk51/q0dcqwlmWEGTHCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793327804;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=V/lnB9MH/HLYg6xkfRQbx6bEKxiHrzo85vIOCGxcRf0=;
	b=XbQdIl/bY+NYl5zR+BH+HSdrAgRPYETjTIKZFaicAxuBMqXSih/lFbIylOvBl609ngfu
	 MR6IncB/HIRE8VFRlwencNM/CigutvwnhO5Zj991zttJIl/T6ShfruzaQMLTb+nZloxwq
	 R6i3avL/bWKf9qEX1SISt0gmQn2PysiiIOBZJfpv9KrMBLZ7Owy4AQMqQQZ+gJq7xWzHy
	 V5oXGr8PaWf8gk5NGQ7R/EP7EMYI44TAopY7xmd6C2+vGEAz0VDIOPdjbGwSH7lWwjNoY
	 GhxDHK7KC7yT7MB4uSdQ8mrv85RYHSInVaWvcpAyE73wLF2LTw7MuCuoDu4SbyHBTPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.160.71
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D85606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 02:36:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2D85606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-47cfa971c9eso1861124fac.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 19:36:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793327803; x=1793932603;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V/lnB9MH/HLYg6xkfRQbx6bEKxiHrzo85vIOCGxcRf0=;
        b=YP/88oIVBR8uQocT5XOHzT4Am5J7BxMkSbFaJjlx3Cxq80/D/NVHVvy/1oIPDuWTmJ
         khT3FqyETX4Ku2ftm9b9UKBaF0zZSsDb8j0gBFJISvYjM5zMi0o0ecZYlUIeDxuk5cKO
         mIFXzN+DgNE9cJmgdaFBeOowGlo1evL4DgRCjVnqO1HSpcX79urJhuCDvp6ab4/zkY6m
         WjM59RqWuXgdwKuwfGwrRg4WiPUnO3URbE1Omfjjy/qvAeIcw8V6Wb8Q78q7Dcm1+Dv9
         2RALEPDnxVeoUG9ALi2IbsMNTz2N8yQA4Wg6A1WM+OVOxsEqPigncnbHZ38cQapHqmjH
         qG1A==
X-Forwarded-Encrypted: i=1; AKwUvBxcDjgMgkQszkliYlyEs4xpBH+JfoR5ZxKNrlmL+HZfc67Lpc9yqm0pfJDzw97gY7G+geEXfByji9WTV20=@vger.kernel.org
X-Gm-Message-State: AFq9FYJqjwq1epvVFdceRYHsdzVw3UF3rEMXLxNhZSoPmMNvKyXmw5zj
	dad4SRWSvD++ZwPaE2R/fJ90oD1dVa9SGtUZwupymjhmGZ9/HxQ/+GObS6ZJVo6ypFNEMy3RUlK
	rLIbiGh3Sg2JLepe5G2Eu0gCbfCtjE/T1IFzDDcdMgxpywMIOoKmkRORbhJM=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1687:b0:4f1:5068:b93b with SMTP id
 5614622812f47-563ef93de1cmr2489055b6e.14.1793327802984; Thu, 29 Oct 2026
 19:36:42 -0700 (PDT)
Date: Thu, 29 Oct 2026 19:36:42 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae402ba.0c1d3ab6.e3d48.006b.GAE@google.com>
Subject: [syzbot] [spi?] [usb?] WARNING in spi_register_controller (2)
From: syzbot <syzbot+41172204e7323356ecdb@syzkaller.appspotmail.com>
To: broonie@kernel.org, linux-kernel@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    c339f4010dea Merge tag 'platform-drivers-x86-v7.4-1' of gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17d07259580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4a49f7c2815c8df7
dashboard link: https://syzkaller.appspot.com/bug?extid=41172204e7323356ecdb
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1420a1a5580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1271cef1580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-c339f401.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/2aba9a3fc60c/vmlinux-c339f401.xz
kernel image: https://storage.googleapis.com/syzbot-assets/a3c085a78213/bzImage-c339f401.xz

AI-generated root cause summary:
In spi_controller_id_alloc() (drivers/spi/spi.c), idr_alloc() can return -ENOMEM
when radix tree memory allocation fails under memory pressure or fault
injection. The function inappropriately invokes WARN(id < 0, "couldn't get idr")
on any failure rather than handling expected runtime allocation errors silently.
In production builds without panic_on_warn, execution continues, locks are
properly released, and the error is cleanly propagated and handled by callers
without causing denial of service or memory corruption.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=41172204e7323356ecdb

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+41172204e7323356ecdb@syzkaller.appspotmail.com

R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000002
R13: 00007fe4d0225fac R14: 00007fe4d0225fa0 R15: 00007fe4d0225fa0
 </TASK>
------------[ cut here ]------------
couldn't get idr
WARNING: drivers/spi/spi.c:3634 at spi_controller_id_alloc drivers/spi/spi.c:3634 [inline], CPU#0: syz.0.17/5588
WARNING: drivers/spi/spi.c:3634 at spi_register_controller+0x1261/0x1670 drivers/spi/spi.c:3697, CPU#0: syz.0.17/5588
Modules linked in:
CPU: 0 UID: 0 PID: 5588 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:spi_controller_id_alloc drivers/spi/spi.c:3634 [inline]
RIP: 0010:spi_register_controller+0x1261/0x1670 drivers/spi/spi.c:3697
Code: 8c e8 33 d5 79 fa e9 1e ff ff ff e8 a9 a6 16 fb 48 8d 3d 72 3f 18 0b 67 48 0f b9 3a eb 11 e8 96 a6 16 fb 48 8d 3d 6f 3f 18 0b <67> 48 0f b9 3a bf e4 ff ff ff 44 89 f6 e8 8d ab 16 fb 41 83 fe e4
RSP: 0018:ffffc90004de7878 EFLAGS: 00010293
RAX: ffffffff86b27e5a RBX: ffff888050e4a000 RCX: ffff888034fc4b00
RDX: 0000000000000000 RSI: 00000000fffffff4 RDI: ffffffff91cabdd0
RBP: 0000000000000000 R08: ffffc90004de7807 R09: 1ffff920009bcf00
R10: dffffc0000000000 R11: fffff520009bcf01 R12: 1ffff1100a1c9408
R13: dffffc0000000000 R14: 00000000fffffff4 R15: ffff888050e4a4d8
FS:  000055558743d500(0000) GS:ffff88808aa10000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fbfc3e0ca90 CR3: 0000000040ab8000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 msi2500_probe+0x4c6/0x9e0 drivers/media/usb/msi2500/msi2500.c:1249
 usb_probe_interface+0x751/0xe00 drivers/usb/core/driver.c:399
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x254/0xae0 drivers/base/dd.c:707
 __driver_probe_device+0x1e8/0x360 drivers/base/dd.c:869
 driver_probe_device+0x4f/0x240 drivers/base/dd.c:899
 __device_attach_driver+0x270/0x410 drivers/base/dd.c:1027
 bus_for_each_drv+0x258/0x2f0 drivers/base/bus.c:503
 __device_attach+0x2bd/0x430 drivers/base/dd.c:1131
 proc_ioctl+0x409/0x660 drivers/usb/core/devio.c:2370
 proc_ioctl_default+0xc4/0x110 drivers/usb/core/devio.c:2405
 usbdev_do_ioctl drivers/usb/core/devio.c:2769 [inline]
 usbdev_ioctl+0x139d/0x21a0 drivers/usb/core/devio.c:2829
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fe4cff9f559
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffc6b706298 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007fe4d0225fa0 RCX: 00007fe4cff9f559
RDX: 0000200000000900 RSI: 00000000c0105512 RDI: 0000000000000004
RBP: 00007ffc6b706300 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000002
R13: 00007fe4d0225fac R14: 00007fe4d0225fa0 R15: 00007fe4d0225fa0
 </TASK>
----------------
Code disassembly (best guess):
   0:	8c e8                	mov    %gs,%eax
   2:	33 d5                	xor    %ebp,%edx
   4:	79 fa                	jns    0x0
   6:	e9 1e ff ff ff       	jmp    0xffffff29
   b:	e8 a9 a6 16 fb       	call   0xfb16a6b9
  10:	48 8d 3d 72 3f 18 0b 	lea    0xb183f72(%rip),%rdi        # 0xb183f89
  17:	67 48 0f b9 3a       	ud1    (%edx),%rdi
  1c:	eb 11                	jmp    0x2f
  1e:	e8 96 a6 16 fb       	call   0xfb16a6b9
  23:	48 8d 3d 6f 3f 18 0b 	lea    0xb183f6f(%rip),%rdi        # 0xb183f99
* 2a:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2f:	bf e4 ff ff ff       	mov    $0xffffffe4,%edi
  34:	44 89 f6             	mov    %r14d,%esi
  37:	e8 8d ab 16 fb       	call   0xfb16abc9
  3c:	41 83 fe e4          	cmp    $0xffffffe4,%r14d


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
