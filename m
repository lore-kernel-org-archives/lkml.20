Received: from mail-oa2-f0.google.com (mail-oa2-f0.google.com [74.125.231.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8914F330317
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 02:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787885131; cv=none; b=iyrFzYiIu1Jktc8Z5opFVMTYq4U72a98G777Y1HHHiMqxTSG43uJNqynquJQ5pM12m24Lo1ROLYOmmu5PR4phPcxlogOSiCsjKIqUT6QOtBjpRC20O+Q590p4CIyRwwxIc8eH9fvAwMXVE1uZ7vEq2PWsd2t/wtHHal0iuer+Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787885131; c=relaxed/simple;
	bh=4pxKODezywX3sQBm6coDrkpjCGyFvbajTXCFUAlYGmo=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Y5xsHDZno0k6K5lE0zeDyL/UO8fP5DMy7WKufiZQQJhcgAgBBAyomL5/jJqV9A9BiWe6RwJPFu6ODFkfOkLlB7OnTErMSyGBJRx1NmI9T+xQN4ibDpMyqi0K5BNH+vjxtQv8gxsK3QOOS/SZTxteEF4ndZ8T/WAZT6qR49LG3kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa2-f0.google.com with SMTP id 586e51a60fabf-451e8472960so548806fac.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 19:45:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787885128; x=1788489928;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6xfBoN4ZemMCJI5JUsEpTJtQBBECTZ1Z2MZ0e09zNqU=;
        b=irX7YDUorxqWiVD50obSumjrrjDCFMH8s00u63YjFcoLD46dTB200Y+YQY9zS3htYU
         Lgfw8RqTLdJhaVlhR5SRdYWexULRQ/cMm3kTQg1BCBxQfl7FiOB89QiZCkrMZdZO7g/t
         ZETfU50VsufO7HwCiqGeiSDmTKDboF/q921/Sp+tU8GHk/4Wv3BIDTgAIlQhrBwyNYFt
         wNda/LEKB/+DpiFApHa82Ja9AbHuelNQOecLXh3rIAMSMe/5sHoFksXPEi+4OOekOYgy
         Z52Y1NYGxsJWu4EhVZcg1VzGzTTsUWqkb8FqUEY6ja3JC+4XqSC3BXqKUJ6m75jj0f9M
         rxRg==
X-Forwarded-Encrypted: i=1; AHgh+RpdPn3/XI1jVGLezWV/pLmwfxHOcM0qNf5Ld1r3Xsvoo71PN1WKcBBIkVJIYjvrzjzHAJc3KFz8MVt/9BA=@vger.kernel.org
X-Gm-Message-State: AFuF++nHtIbuXKonl0XlP9b9S3CnAL91WJSbS23qW5bvqwyhUoi23U1m
	HIRXJkLoExmGV8WwYS9wkEHlrvZ/spy46vGQyqIa3U68uqVEooFxcMqO1OUxSr6PTnJQIP7eQRR
	2KGA/j8dwx4BfbcMjTPqp45tQlYlqFEypJTuaBuZQLLXJKrRPtgE5MTq0r/k=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c3ee:b0:4a3:3108:866a with SMTP id
 5614622812f47-4b3982eaaefmr4182602b6e.17.1787885128564; Thu, 27 Aug 2026
 19:45:28 -0700 (PDT)
Date: Thu, 27 Aug 2026 19:45:28 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a90f648.1d9ded08.62e62.00e2.GAE@google.com>
Subject: [syzbot] [media?] WARNING in vidtv_stop_feed
From: syzbot <syzbot+3157015c6bd85395cddc@syzkaller.appspotmail.com>
To: dwlsalmeida@gmail.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, mchehab@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    388b607d107c Merge tag 'efi-next-for-v7.3' of git://git.ke..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10a42625580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b57978e7637d0f4a
dashboard link: https://syzkaller.appspot.com/bug?extid=3157015c6bd85395cddc
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
userspace arch: i386

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-388b607d.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/a21f6d431a2a/vmlinux-388b607d.xz
kernel image: https://storage.googleapis.com/syzbot-assets/5f0615983131/bzImage-388b607d.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+3157015c6bd85395cddc@syzkaller.appspotmail.com

------------[ cut here ]------------
DEBUG_LOCKS_WARN_ON(lock->magic != lock)
WARNING: kernel/locking/mutex.c:625 at __mutex_lock_common kernel/locking/mutex.c:625 [inline], CPU#3: syz.3.334/7114
WARNING: kernel/locking/mutex.c:625 at __mutex_lock+0x944/0x1bc0 kernel/locking/mutex.c:821, CPU#3: syz.3.334/7114
Modules linked in:
CPU: 3 UID: 0 PID: 7114 Comm: syz.3.334 Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:__mutex_lock_common kernel/locking/mutex.c:625 [inline]
RIP: 0010:__mutex_lock+0x94b/0x1bc0 kernel/locking/mutex.c:821
Code: 0f b6 14 11 38 d0 7c 08 84 d2 0f 85 b4 10 00 00 44 8b 05 b8 11 7a 05 45 85 c0 75 13 48 8d 3d 9c 16 7d 05 48 c7 c6 80 d3 ef 8b <67> 48 0f b9 3a 90 e9 1b f8 ff ff 4d 8d a7 f0 0a 00 00 4c 89 e7 e8
RSP: 0000:ffffc90025f2fae0 EFLAGS: 00010246
RAX: 0000000000000003 RBX: ffff888029f2d128 RCX: 1ffffffff22898cc
RDX: 0000000000000000 RSI: ffffffff8befd380 RDI: ffffffff9147cb50
RBP: ffffc90025f2fc50 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
R13: 0000000000000000 R14: dffffc0000000000 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff888096c84000(0063) knlGS:0000000057892480
CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
CR2: 00000000f544aff4 CR3: 00000000577a8000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 vidtv_stop_feed+0x75/0x2a0 drivers/media/test-drivers/vidtv/vidtv_bridge.c:256
 dmx_ts_feed_stop_filtering+0xe9/0x1d0 drivers/media/dvb-core/dvb_demux.c:780
 dvb_dmxdev_feed_stop.isra.0+0x162/0x270 drivers/media/dvb-core/dmxdev.c:494
 dvb_dmxdev_filter_stop+0x1d0/0x390 drivers/media/dvb-core/dmxdev.c:572
 dvb_dmxdev_filter_free drivers/media/dvb-core/dmxdev.c:856 [inline]
 dvb_demux_release+0x92/0x560 drivers/media/dvb-core/dmxdev.c:1256
 __fput+0x3ff/0xb50 fs/file_table.c:512
 task_work_run+0x150/0x240 kernel/task_work.c:233
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 __exit_to_user_mode_loop kernel/entry/common.c:70 [inline]
 exit_to_user_mode_loop+0x1d8/0x700 kernel/entry/common.c:101
 __exit_to_user_mode_prepare include/linux/irq-entry-common.h:207 [inline]
 syscall_exit_to_user_mode_prepare include/linux/irq-entry-common.h:230 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:336 [inline]
 __do_fast_syscall_32+0x59f/0x8b0 arch/x86/entry/syscall_32.c:294
 do_fast_syscall_32+0x32/0x70 arch/x86/entry/syscall_32.c:316
 entry_SYSENTER_compat_after_hwframe+0x84/0x8e
RIP: 0023:0xf6ffefec
Code: Unable to access opcode bytes at 0xf6ffefc2.
RSP: 002b:00000000ffb45dfc EFLAGS: 00000202 ORIG_RAX: 00000000000001b4
RAX: 0000000000000000 RBX: 0000000000000003 RCX: 000000000000001e
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000202 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>
----------------
Code disassembly (best guess):
   0:	0f b6 14 11          	movzbl (%rcx,%rdx,1),%edx
   4:	38 d0                	cmp    %dl,%al
   6:	7c 08                	jl     0x10
   8:	84 d2                	test   %dl,%dl
   a:	0f 85 b4 10 00 00    	jne    0x10c4
  10:	44 8b 05 b8 11 7a 05 	mov    0x57a11b8(%rip),%r8d        # 0x57a11cf
  17:	45 85 c0             	test   %r8d,%r8d
  1a:	75 13                	jne    0x2f
  1c:	48 8d 3d 9c 16 7d 05 	lea    0x57d169c(%rip),%rdi        # 0x57d16bf
  23:	48 c7 c6 80 d3 ef 8b 	mov    $0xffffffff8befd380,%rsi
* 2a:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2f:	90                   	nop
  30:	e9 1b f8 ff ff       	jmp    0xfffff850
  35:	4d 8d a7 f0 0a 00 00 	lea    0xaf0(%r15),%r12
  3c:	4c 89 e7             	mov    %r12,%rdi
  3f:	e8                   	.byte 0xe8


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
