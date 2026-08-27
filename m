Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7165743F4C3
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787824056; cv=none; b=UsWQLk0kOuJC2wDik+dHJ3LN3Fw8slsnIYPtlPn5TvQoik41UHWxc6uKBMbgtEd25yWY29DVexDteuDYMAn48S45T2YvwXnhzoJebjMvz78rKMw6sCFdN/oGF0JVZiBR96RNCbh+1xhvqFJMmuHXUw1UTUWlp6RVAfmwSLegZbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787824056; c=relaxed/simple;
	bh=tk3Ai/Jo2XGI9xcsIXzPCRSuWSXRRpdmIHLsH363YZg=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Ff0gko9M+2ty1KVQnbkorOob9iEdIfpxO1+8vWia4RXkgBY7Y7UfGi9kXGOBSLUWrpu6ALTraphGwfbb8k1nNltRlhM2zY8ABEC/dqEtyKd/OGimvxzy7OT2/woEZQtJj6WyR1AzwJBk86NDaKfMzgqDl2uEab5ElCB79ttSVMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7ebe970a21fso2683139a34.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 02:47:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787824051; x=1788428851;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YflxLRauQaVc21/roAiOh/raFm7Kh6g8H2z5rAAAdkQ=;
        b=HV6vxwcp69DGxMB/zPNyzdEj79yI94MRYgGWY8siQmATd9F92XTsfdeBnmokIToGIL
         bjDNPnPnj/0WmCWPteEScjA4kMiS9aoY1MkEtK3Zyklg2/YSLuYnR+ymHOewH/shWhS9
         d7OhZIM3kR78Sl/yGbZvga0yEoCX0v8ybKkwnwNH0K7OT+48d65cIvX9VT+P5DHIaVSE
         OYCS/vv3broN5zHpqpyoUh3q5WPL7W9KE6OHQ3gmfYjEd7fqYBSK2U2uWqpxplxhZV+v
         5n2LNIAzdL0MxbGm8DOtvz72QIWv6wf566RY18gUGmzA1yWH4fC/hAt5t79LsrLRYKof
         eS4w==
X-Gm-Message-State: AFuF++nYN6RFKKlG2dhXJtkoa5t7ISK5LReA34S+Rxdh0hd99Y0GBApm
	Eqkzfd65ETNiMVugtwssYNy4jnFrwPK4mLg29XPVzEAdkPbIQbm33PFb4waQsC4LC++sfU4X8S8
	PsRpqCYwrhtwXAoFWoFoic4FvzCiNtwACewTPcTjiu6Xdzq3dWrkfqMVuzc8=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a4a:ded8:0:b0:6ac:b178:97f9 with SMTP id
 006d021491bc7-6b1a0529045mr10823866eaf.31.1787824051711; Thu, 27 Aug 2026
 02:47:31 -0700 (PDT)
Date: Thu, 27 Aug 2026 02:47:31 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9007b3.1d9ded08.62e62.00cd.GAE@google.com>
Subject: [syzbot] [sound?] BUG: unable to handle kernel NULL pointer
 dereference in snd_ctl_led_get
From: syzbot <syzbot+b7fe2760ea6f1ee44b4d@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    818bebeb63dd drm/xe: Don't hand out the flat CCS storage a..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=12a3d579580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ccca94d2c01b9e78
dashboard link: https://syzkaller.appspot.com/bug?extid=b7fe2760ea6f1ee44b4d
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=178bb415580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+b7fe2760ea6f1ee44b4d@syzkaller.appspotmail.com

BUG: kernel NULL pointer dereference, address: 0000000000000000
#PF: supervisor instruction fetch in kernel mode
#PF: error_code(0x0010) - not-present page
PGD 0 P4D 0 
Oops: Oops: 0010 [#1] SMP KASAN NOPTI
CPU: 2 UID: 0 PID: 6042 Comm: syz-executor129 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:0x0
Code: Unable to access opcode bytes at 0xffffffffffffffd6.
RSP: 0018:ffffc900034b7948 EFLAGS: 00010246
RAX: 0000000000000000 RBX: ffff88802e2ff400 RCX: 0000000000000000
RDX: 1ffff11005c5fe8c RSI: ffffffff9bda4620 RDI: ffff88802e2ff400
RBP: 0000000000000000 R08: 0000000000000001 R09: 0000000000000000
R10: ffffffff9bda4620 R11: 0000000000000000 R12: 0000000000000000
R13: ffffffff90b73bc8 R14: ffff88802e2ff400 R15: ffffffff90b73bc8
FS:  000055555669f400(0000) GS:ffff8880d5da2000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffffffffffffd6 CR3: 0000000027234000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 snd_ctl_led_get+0x231/0x430 sound/core/control_led.c:122
 snd_ctl_led_set_state+0x5c1/0x7f0 sound/core/control_led.c:168
 snd_ctl_led_notify+0x15b/0x1e0 sound/core/control_led.c:239
 snd_ctl_led_set_id sound/core/control_led.c:268 [inline]
 set_led_id+0xb0f/0xe80 sound/core/control_led.c:557
 dev_attr_store+0x58/0x80 drivers/base/core.c:2509
 sysfs_kf_write+0xf2/0x150 fs/sysfs/file.c:145
 kernfs_fop_write_iter+0x3e0/0x5f0 fs/kernfs/file.c:345
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6af/0x1050 fs/read_write.c:687
 ksys_write+0x12a/0x250 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fa7e64de2b7
Code: 48 89 fa 4c 89 df e8 98 1d 00 00 8b 93 08 03 00 00 59 5e 48 83 f8 fc 74 1a 5b c3 0f 1f 84 00 00 00 00 00 48 8b 44 24 10 0f 05 <5b> c3 0f 1f 80 00 00 00 00 83 e2 39 83 fa 08 75 de e8 23 ff ff ff
RSP: 002b:00007ffe15525110 EFLAGS: 00000202 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 000055555669f400 RCX: 00007fa7e64de2b7
RDX: 0000000000000002 RSI: 00007ffe155251a0 RDI: 0000000000000004
RBP: 0000000000000004 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000202 R12: 00007ffe155251a0
R13: 00007fa7e6517024 R14: 00007fa7e6541cc0 R15: 0000000000000002
 </TASK>
Modules linked in:
CR2: 0000000000000000
---[ end trace 0000000000000000 ]---
RIP: 0010:0x0
Code: Unable to access opcode bytes at 0xffffffffffffffd6.
RSP: 0018:ffffc900034b7948 EFLAGS: 00010246
RAX: 0000000000000000 RBX: ffff88802e2ff400 RCX: 0000000000000000
RDX: 1ffff11005c5fe8c RSI: ffffffff9bda4620 RDI: ffff88802e2ff400
RBP: 0000000000000000 R08: 0000000000000001 R09: 0000000000000000
R10: ffffffff9bda4620 R11: 0000000000000000 R12: 0000000000000000
R13: ffffffff90b73bc8 R14: ffff88802e2ff400 R15: ffffffff90b73bc8
FS:  000055555669f400(0000) GS:ffff8880d5da2000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffffffffffffd6 CR3: 0000000027234000 CR4: 0000000000352ef0


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
