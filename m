Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793567283;
	b=RKe+jSkM5mgRb8ngFvj8WTproSmGGEWktr8ljLEehnoHUUwLaDg+tfJixjtWJoKUJFvo
	 OEXZylMpJkQvRMFPHJ5Fd/Qf8NGdx+XC+oyHU4Wbs2iD8U1OWgPNT6ZC/D9JyqqwMb3EH
	 Y/UB9ZB2VUc8HSuA+QpuhCoYThcMAECZMio83em5qKfVxsAlFQFuSuWolrMOT/Rp+LAto
	 Hbh/pW8aM5YnhBRYVt9/Vl+elfcIrt6546h2GpwF/n8sKu8fnR8q+s7HJC3qE2ghqNeH+
	 N7Y04ZdqhsRDoRTLWhkgTu6KnjlEhROtCCTLjWAMk18owGVzqZfCv4xZOHhBcBiSLAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793567283;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=nvvBS1fVbpOx/7IQcJ2n1P4dKZX22otWrKONYRyx4K8=;
	b=kKr2Z1tXzIZV0vR1L4qW/Gr+q6uWrmIsdvwbsHlk+c+iprCxarhX9GrqG1cCmixArhfk
	 1qnN4XKziLwgmPNPLlUz3ub1S2Oy1vB7Br5a9hmpKX1GiVxnNrTghoiSKVVOS2EVoxsQz
	 szVMl0tRpFkNlZvemPh14tbTaBCWsV+1wlBA4KH+ruPQ4xpTr11EGwNDb4Gs+X1WNZrL1
	 xCGIyQ/bYZVdCg7SC+zwHR5aDJxICwY9e/HNLYPIBluGZ5VO4LgPaUvxki6+5LBKoBMcd
	 EV/iviD1u637S0fGk0K4iZaX/7y3zgCl4uJHNI7e1E+/6mfjgDhajVPKUzhzAkWx5zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A196C606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 21:08:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A196C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4f4612a1a5cso4254918b6e.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 13:08:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793567281; x=1794172081;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nvvBS1fVbpOx/7IQcJ2n1P4dKZX22otWrKONYRyx4K8=;
        b=g7Z5K/EJii+X0irGugCTp9YxfIqnXtcKbCVGcDcBP1YlTef/i/Wy2cTaumI+V7XgYj
         CHIh05iCSVUUPPg0iKohW04+sTtIQw0cdBd8CnscxhlgW0aLxBbM00PitYuzNjKnYwUC
         SkCgAi6EkjRemT7HQreWlJ/csMz0NPYp7z/fMsUcTDwTGBbljZzYmU1sdxnRJ2GrVtvs
         MGf2I2e+hxEZQfjksi7IFpCUW9xfy+C2rshS53ugFK7adsP85UvD0UhrFMoASgL1hXgo
         gakaL+sdujEt4GGu2NGjwlC0mY4VOQEOzASd6hIQ5p92ofaK2RAve7m/BsBKhj5O2kDR
         d0EQ==
X-Forwarded-Encrypted: i=1; AKwUvBy6ozajc2mV9f9vtVGp3NwP33BLK2/qTRNviBdOXmfbTsmHdXyAscrVGKdPAGcqcdXhXIA1e4qBpARp0zs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIKsavd1XkWbcmASXmgMjUiG+ba9MsLODf40qKio1+ng3dwJBFf
	bYhMuV+uqQIGON/sHnqhQQN2lMXEhmg/24UQz/UQgOrb6WXi82hbQkyYnnJ6RA+d4FWUJ1YEQI9
	t3fcrSS7s3Ni5IJZXbR7boW6MKrwNoKuy9Qd/PWTrwEqRT/puX1x1lB+60Ts=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:148e:b0:4b8:4703:db90 with SMTP id
 5614622812f47-563ef9cd64cmr5825224b6e.25.1793567281623; Sun, 01 Nov 2026
 13:08:01 -0800 (PST)
Date: Sun, 01 Nov 2026 13:08:01 -0800
In-Reply-To: <20261101203703.165-1-drifabdelmalekmohamedsaid@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae7aa31.67782f90.13afb0.009d.GAE@google.com>
Subject: Re: [syzbot] [media?] [usb?] KASAN: slab-use-after-free Read in dev_dbg_obj
From: syzbot <syzbot+54648a6c1187a7ef46a6@syzkaller.appspotmail.com>
To: drifabdelmalekmohamedsaid@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
general protection fault in v4l2_open

Oops: general protection fault, probably for non-canonical address 0xdffffc0000000019: 0000 [#1] SMP KASAN NOPTI
KASAN: null-ptr-deref in range [0x00000000000000c8-0x00000000000000cf]
CPU: 3 UID: 0 PID: 8236 Comm: v4l_id Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:kasan_byte_accessible+0x15/0x30 mm/kasan/generic.c:210
Code: 00 00 0f 1f 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 0f 1f 40 d6 48 b8 00 00 00 00 00 fc ff df 48 c1 ef 03 48 01 c7 <0f> b6 07 3c 07 0f 96 c0 e9 8e 5f 68 09 66 66 2e 0f 1f 84 00 00 00
RSP: 0018:ffffc900079d76a0 EFLAGS: 00010082
RAX: dffffc0000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff8bee97ca RDI: dffffc0000000019
RBP: 00000000000000c8 R08: 0000000000000001 R09: 0000000000000000
R10: ffffffff926ad55f R11: 0000000000000000 R12: ffffffff8bee97ca
R13: 0000000000000001 R14: 0000000000000000 R15: 0000000000000000
FS:  00007f73db395880(0000) GS:ffff888095581000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000056143b44d64d CR3: 000000006c150000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 __kasan_check_byte+0x13/0x50 mm/kasan/common.c:584
 kasan_check_byte include/linux/kasan.h:402 [inline]
 lock_acquire kernel/locking/lockdep.c:5916 [inline]
 lock_acquire+0x132/0x380 kernel/locking/lockdep.c:5899
 __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:155 [inline]
 _raw_spin_lock_irqsave+0x3a/0x60 kernel/locking/spinlock.c:181
 ida_free+0xd3/0x2f0 lib/idr.c:566
 __media_device_unregister_entity+0x70/0x2f0 drivers/media/mc/mc-device.c:582
 media_device_unregister_entity+0x4b/0x70 drivers/media/mc/mc-device.c:677
 v4l2_device_release+0x363/0x480 drivers/media/v4l2-core/v4l2-dev.c:208
 device_release+0xd2/0x270 drivers/base/core.c:2640
 kobject_cleanup lib/kobject.c:689 [inline]
 kobject_release lib/kobject.c:720 [inline]
 kref_put include/linux/kref.h:65 [inline]
 kobject_put+0x1f7/0x640 lib/kobject.c:737
 put_device+0x1f/0x30 drivers/base/core.c:3886
 video_put drivers/media/v4l2-core/v4l2-dev.c:173 [inline]
 v4l2_open+0x2e5/0x490 drivers/media/v4l2-core/v4l2-dev.c:450
 chrdev_open+0x234/0x6a0 fs/char_dev.c:413
 do_dentry_open+0x674/0x1470 fs/open.c:1000
 vfs_open_consume+0xcc/0x460 fs/open.c:1131
 do_open fs/namei.c:4851 [inline]
 path_openat+0x1547/0x23f0 fs/namei.c:5016
 do_file_open+0x20e/0x430 fs/namei.c:5045
 do_sys_openat2+0x163/0x1d0 fs/open.c:1442
 do_sys_open fs/open.c:1448 [inline]
 __do_sys_openat fs/open.c:1464 [inline]
 __se_sys_openat fs/open.c:1459 [inline]
 __x64_sys_openat+0x12d/0x210 fs/open.c:1459
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x121/0x770 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f73daca7407
Code: 48 89 fa 4c 89 df e8 38 aa 00 00 8b 93 08 03 00 00 59 5e 48 83 f8 fc 74 1a 5b c3 0f 1f 84 00 00 00 00 00 48 8b 44 24 10 0f 05 <5b> c3 0f 1f 80 00 00 00 00 83 e2 39 83 fa 08 75 de e8 23 ff ff ff
RSP: 002b:00007fff8d33df10 EFLAGS: 00000202 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 00007f73db395880 RCX: 00007f73daca7407
RDX: 0000000000000000 RSI: 00007fff8d33ef1d RDI: ffffffffffffff9c
RBP: 0000000000000002 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000202 R12: 0000000000000000
R13: 00007fff8d33e160 R14: 00007f73db4fc000 R15: 000056143b4514d8
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:kasan_byte_accessible+0x15/0x30 mm/kasan/generic.c:210
Code: 00 00 0f 1f 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 0f 1f 40 d6 48 b8 00 00 00 00 00 fc ff df 48 c1 ef 03 48 01 c7 <0f> b6 07 3c 07 0f 96 c0 e9 8e 5f 68 09 66 66 2e 0f 1f 84 00 00 00
RSP: 0018:ffffc900079d76a0 EFLAGS: 00010082
RAX: dffffc0000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff8bee97ca RDI: dffffc0000000019
RBP: 00000000000000c8 R08: 0000000000000001 R09: 0000000000000000
R10: ffffffff926ad55f R11: 0000000000000000 R12: ffffffff8bee97ca
R13: 0000000000000001 R14: 0000000000000000 R15: 0000000000000000
FS:  00007f73db395880(0000) GS:ffff888095581000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000056143b44d64d CR3: 000000006c150000 CR4: 0000000000352ef0
----------------
Code disassembly (best guess):
   0:	00 00                	add    %al,(%rax)
   2:	0f 1f 00             	nopl   (%rax)
   5:	90                   	nop
   6:	90                   	nop
   7:	90                   	nop
   8:	90                   	nop
   9:	90                   	nop
   a:	90                   	nop
   b:	90                   	nop
   c:	90                   	nop
   d:	90                   	nop
   e:	90                   	nop
   f:	90                   	nop
  10:	90                   	nop
  11:	90                   	nop
  12:	90                   	nop
  13:	90                   	nop
  14:	90                   	nop
  15:	0f 1f 40 d6          	nopl   -0x2a(%rax)
  19:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
  20:	fc ff df
  23:	48 c1 ef 03          	shr    $0x3,%rdi
  27:	48 01 c7             	add    %rax,%rdi
* 2a:	0f b6 07             	movzbl (%rdi),%eax <-- trapping instruction
  2d:	3c 07                	cmp    $0x7,%al
  2f:	0f 96 c0             	setbe  %al
  32:	e9 8e 5f 68 09       	jmp    0x9685fc5
  37:	66                   	data16
  38:	66                   	data16
  39:	2e                   	cs
  3a:	0f                   	.byte 0xf
  3b:	1f                   	(bad)
  3c:	84 00                	test   %al,(%rax)


Tested on:

commit:         46fec1c3 Merge tag 'sched-urgent-2026-11-01' of git://..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=152fb935580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f4b0888d27d9a541
dashboard link: https://syzkaller.appspot.com/bug?extid=54648a6c1187a7ef46a6
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
userspace arch: i386
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1222acb1580000

