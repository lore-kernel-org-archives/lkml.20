Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0072C11CA
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 01:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789349164; cv=none; b=qzFuL232QRbQw47FWBBl9/ebHGJIC/BSXbW3LN2GrLIc3sL6WLmH2lVX+bByM7rJ+K0r08NKb3/1kSGsChiGuH9geFE81xHkYOgmWTaFvkmaPqS5G3voSp+bj42eIvRKnrO5LqZ+7TTqTG3msbh7JhZF2anMAR8q9ucOv/zFx6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789349164; c=relaxed/simple;
	bh=hCgG0fi/e4sLdRNJchm3UdewjoqFTGUZ1s1vHu5FSUM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Z9NtyoTXXRNTayF6C+uOMQELTrWechaBZBZ2M+7GBILBSAQZjxB0UdMsQiM9I+NxdbhxCrHMc455B+3SSGoSGccNS4kWMXW6fSf0SZMYmPtahQ1O+7klr03ATKPlEHwDUUZ1/AfsCfvKYC0k+dMt8V84IUtEcl8mZ0Ivz7hARlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-46a12cfc288so4388675fac.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 18:26:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789349161; x=1789953961;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FiD8Y6j5w1ZVjCfobkXwOScqzEX9t0e6nNb99HYnEeI=;
        b=s6YeHdQrvsmCrqb+1lUIcRD4YiEC2/1nPqQ85hJQUVJPTO0mPLnpBW3dwa0hjJFvKp
         JwyY1tsKR870isrgw1zFT+JQGBwmPT6H/8OxGsr27eM5dxk/dQxReEj2iQ+Y12IkHVUo
         31U1hDqsJr+mnhPDAiovT6CEOAEDsC/15H4L1QfzqRMBLi2tC1BBm3EE54croDZyqv2h
         eiQD25/Og5QUdSTHdDWhNtbpdBBJ61Wwp/PkdSqsInCYUH5BWrqJnsetzt3uzk6+EaCs
         jxlBkR+dh2ScFoG7cz0rfrGHiC9el9+SvDFhMljcnfo5fWNLu2yLYJ5X+YDMPcJ+WaJi
         sTiA==
X-Forwarded-Encrypted: i=1; AKwUvBzfqW013lFs9HfFaM+xTRG9V6AqVgXgKMwRM7QdAEUSsXz7ZfQRPrt/4j6qDHbRv53Z5y+shHUJQayD8QU=@vger.kernel.org
X-Gm-Message-State: AFuF++lQ1oR5/jqN7dQHydemyXzXZCJaCaWaqPxbO+JtkIr2uEfpTf73
	7pfmhyUBSQ3TXO2bXaKyg0yzBN0m5T/5Wvtv7v/r7AzEz22G9WoJcRQ+P2+3+T/S5MAjXQtrVxo
	b7fHlntFpQHWnIwYbTtNVh13g4hjvo99e66MvLJjqyO60ftMdDYI93RLKUVc=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:3091:b0:6c1:e01b:3b32 with SMTP id
 006d021491bc7-6c541f45b17mr251065eaf.33.1789349161570; Sun, 13 Sep 2026
 18:26:01 -0700 (PDT)
Date: Sun, 13 Sep 2026 18:26:01 -0700
In-Reply-To: <6aa74a07.7928afff.2ad6cc.917eSMTPIN_ADDED_BROKEN@gmr-mx.google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa74d29.a211d2ce.1a5198.0287.GAE@google.com>
Subject: Re: [syzbot] [kernel?] BUG: unable to handle kernel paging request in cirrus_primary_plane_helper_atomic_update
From: syzbot <syzbot+2442951a6abb004df963@syzkaller.appspotmail.com>
To: jchuang26@m.fudan.edu.cn, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
BUG: unable to handle kernel paging request in cirrus_primary_plane_helper_atomic_update

BUG: unable to handle page fault for address: ffffc9000378a000
#PF: supervisor write access in kernel mode
#PF: error_code(0x0002) - not-present page
PGD 1c000067 P4D 1c000067 PUD 1d6a8067 PMD 26d56067 PTE 0
Oops: Oops: 0002 [#1] SMP KASAN NOPTI
CPU: 3 UID: 0 PID: 6041 Comm: syz-executor611 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:rep_movs arch/x86/lib/iomem.c:13 [inline]
RIP: 0010:string_memcpy_toio arch/x86/lib/iomem.c:64 [inline]
RIP: 0010:memcpy_toio+0x87/0xe0 arch/x86/lib/iomem.c:110
Code: b6 fc 49 89 dd 31 ff 41 83 e5 02 4c 89 ee e8 f0 3f b6 fc 4d 85 ed 75 33 e8 46 45 b6 fc 48 89 e9 48 89 df 4c 89 e6 48 c1 e9 02 <f3> a5 40 f6 c5 02 74 02 66 a5 40 f6 c5 01 74 01 a4 e8 23 45 b6 fc
RSP: 0018:ffffc900031974f0 EFLAGS: 00010206
RAX: 0000000000000000 RBX: ffffc90003789d20 RCX: 00000000000000d8
RDX: ffff888035d22540 RSI: ffffc90003d89f60 RDI: ffffc9000378a000
RBP: 0000000000000640 R08: 0000000000000007 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: ffffc90003d89c80
R13: 0000000000000000 R14: ffffc90003789d20 R15: 0000000000000640
FS:  0000000000000000(0000) GS:ffff8880d5edf000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffc9000378a000 CR3: 000000000eb94000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 iosys_map_memcpy_to include/linux/iosys-map.h:285 [inline]
 drm_fb_memcpy+0x459/0x620 drivers/gpu/drm/drm_format_helper.c:442
 cirrus_primary_plane_helper_atomic_update+0xb1d/0xfe0 drivers/gpu/drm/tiny/cirrus-qemu.c:358
 drm_atomic_helper_commit_planes+0x497/0xf10 drivers/gpu/drm/drm_atomic_helper.c:3038
 drm_atomic_helper_commit_tail+0x7f/0x130 drivers/gpu/drm/drm_atomic_helper.c:1989
 commit_tail+0x338/0x430 drivers/gpu/drm/drm_atomic_helper.c:2074
 drm_atomic_helper_commit+0x303/0x380 drivers/gpu/drm/drm_atomic_helper.c:2312
 drm_atomic_commit+0x230/0x300 drivers/gpu/drm/drm_atomic.c:1789
 drm_client_modeset_commit_atomic+0x6a6/0x7e0 drivers/gpu/drm/drm_client_modeset.c:1104
 drm_client_modeset_commit_locked+0x14d/0x580 drivers/gpu/drm/drm_client_modeset.c:1207
 drm_client_modeset_commit+0x4f/0x80 drivers/gpu/drm/drm_client_modeset.c:1233
 __drm_fb_helper_restore_fbdev_mode_unlocked.part.0+0x137/0x160 drivers/gpu/drm/drm_fb_helper.c:138
 __drm_fb_helper_restore_fbdev_mode_unlocked drivers/gpu/drm/drm_fb_helper.c:126 [inline]
 drm_fb_helper_restore_fbdev_mode_unlocked+0x93/0xc0 drivers/gpu/drm/drm_fb_helper.c:169
 drm_fbdev_client_restore+0x1b/0x30 drivers/gpu/drm/clients/drm_fbdev_client.c:45
 drm_client_dev_restore+0x205/0x2a0 drivers/gpu/drm/drm_client_event.c:118
 drm_lastclose drivers/gpu/drm/drm_file.c:408 [inline]
 drm_release+0x2c6/0x360 drivers/gpu/drm/drm_file.c:441
 __fput+0x3ff/0xb50 fs/file_table.c:512
 task_work_run+0x150/0x240 kernel/task_work.c:233
 exit_task_work include/linux/task_work.h:40 [inline]
 do_exit+0x951/0x2ae0 kernel/exit.c:1009
 do_group_exit+0xd5/0x2a0 kernel/exit.c:1152
 __do_sys_exit_group kernel/exit.c:1163 [inline]
 __se_sys_exit_group kernel/exit.c:1161 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1161
 x64_sys_call+0x102c/0x1530 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f3a58405905
Code: Unable to access opcode bytes at 0x7f3a584058db.
RSP: 002b:00007fffd7b005a8 EFLAGS: 00000202 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 0000000000000001 RCX: 00007f3a58405905
RDX: 00000000000000e7 RSI: ffffffffffffffd8 RDI: 0000000000000001
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000202 R12: 0000000000000001
R13: 00007f3a5849a100 R14: 00007f3a5849c388 R15: 00007f3a5849c3a0
 </TASK>
Modules linked in:
CR2: ffffc9000378a000
---[ end trace 0000000000000000 ]---
RIP: 0010:rep_movs arch/x86/lib/iomem.c:13 [inline]
RIP: 0010:string_memcpy_toio arch/x86/lib/iomem.c:64 [inline]
RIP: 0010:memcpy_toio+0x87/0xe0 arch/x86/lib/iomem.c:110
Code: b6 fc 49 89 dd 31 ff 41 83 e5 02 4c 89 ee e8 f0 3f b6 fc 4d 85 ed 75 33 e8 46 45 b6 fc 48 89 e9 48 89 df 4c 89 e6 48 c1 e9 02 <f3> a5 40 f6 c5 02 74 02 66 a5 40 f6 c5 01 74 01 a4 e8 23 45 b6 fc
RSP: 0018:ffffc900031974f0 EFLAGS: 00010206
RAX: 0000000000000000 RBX: ffffc90003789d20 RCX: 00000000000000d8
RDX: ffff888035d22540 RSI: ffffc90003d89f60 RDI: ffffc9000378a000
RBP: 0000000000000640 R08: 0000000000000007 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: ffffc90003d89c80
R13: 0000000000000000 R14: ffffc90003789d20 R15: 0000000000000640
FS:  0000000000000000(0000) GS:ffff8880d5edf000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffc9000378a000 CR3: 000000000eb94000 CR4: 0000000000352ef0
----------------
Code disassembly (best guess):
   0:	b6 fc                	mov    $0xfc,%dh
   2:	49 89 dd             	mov    %rbx,%r13
   5:	31 ff                	xor    %edi,%edi
   7:	41 83 e5 02          	and    $0x2,%r13d
   b:	4c 89 ee             	mov    %r13,%rsi
   e:	e8 f0 3f b6 fc       	call   0xfcb64003
  13:	4d 85 ed             	test   %r13,%r13
  16:	75 33                	jne    0x4b
  18:	e8 46 45 b6 fc       	call   0xfcb64563
  1d:	48 89 e9             	mov    %rbp,%rcx
  20:	48 89 df             	mov    %rbx,%rdi
  23:	4c 89 e6             	mov    %r12,%rsi
  26:	48 c1 e9 02          	shr    $0x2,%rcx
* 2a:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi) <-- trapping instruction
  2c:	40 f6 c5 02          	test   $0x2,%bpl
  30:	74 02                	je     0x34
  32:	66 a5                	movsw  %ds:(%rsi),%es:(%rdi)
  34:	40 f6 c5 01          	test   $0x1,%bpl
  38:	74 01                	je     0x3b
  3a:	a4                   	movsb  %ds:(%rsi),%es:(%rdi)
  3b:	e8 23 45 b6 fc       	call   0xfcb64563


Tested on:

commit:         958f35cb drm/sysfb: ofdrm: Fix is_avivo() constant com..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=16efcdf9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1d67342c314f228d
dashboard link: https://syzkaller.appspot.com/bug?extid=2442951a6abb004df963
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Note: no patches were applied.
