Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6532D8762
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 07:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790492433; cv=none; b=TPwoZ7RZUxQbBgcgFdCSk0ygm/VmrN+beFgfTXWVKMRO10XQ2hftS72Q1GIGti/k966a8idJ2E3ZaBYOpHXZbvveQqi8XDYfKZ/+MjNGSSH9jO5cJuJMNATW4lQXDqwodR6uZVlmWWE96X2k5BL+lsim51VPhSLd4ZSfhWgPOzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790492433; c=relaxed/simple;
	bh=FDbLY9xZ/PprTNFG3kLlO/youPJ9mHtVdlc49nSnBk8=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=i7FZFYQPZLINTBzfFf60rtIk88b+RW/nyVdJmvf55GhLzEZAO3nd8Av8uAK6HKCy6AC5Obc7QA1rG7XZ+IZy2VStBbsMqW6YEX2hOmOkoIQl2sGw8aAKyx2eLHkVEasKxDNmCjHxpDvSAOwX7Dl70ewyI0qTnBFrmwpRHabmsYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4ab8b4887d4so2109406b6e.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 00:00:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790492431; x=1791097231;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yUswOB5ysKHOA7slc8X+DxW5CuxTPJYetOfkipRfRMc=;
        b=EDcUMAxXBdUB6SxebOvOhgu+cbRImwjM/UkngKriAb72thEWvlUQauDauh6rzWYP23
         afxYK2UT5/TvLronWCM1znHPbHrjk7GWQewRi1dKvWdPhrW5X2TOQHHz+2NW/UqF0ii8
         BI07IRUCRymH3q+kCL2zS/A7aACbEqCJqlLR+FICKQGognTKy6RSdxnq3M8onR/pZXL5
         SPRxQWZfKpRifyVfxWtoT1JzaTtOJIddqO48uPj5U5hb14QGtSUY8JPXLWsVr9aYAhlb
         9AksnlXh7/i9z1NHIUaNld/jCfgzeFjSCj9pAFEnDsbVnD1NAApAkU/UadZQKwtbS18/
         t9bg==
X-Forwarded-Encrypted: i=1; AKwUvBwJQO+9Cfv8yZ0peKsp5jZSr69NgxL4ibLkMtgd6I70IoiExc7eOWKx7rjLQi2XCXmh/2kzap7k+TGg8OQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mcNnqn0yFoh2EvJ57fd3SS83lNecyMwrjRMCNstFLQZJ4SrrYy
	zh/DtklL65NDcorzTn6tUiDnJuvVhB2ZJQlDjuBUBjjBK9MHpKkRYUgyf+a2AQJN6NbgbbZ0TUa
	XT/YJ+92Sw0IBVp3Irqh0TqGVpvHgGX4totC2nBXsyL9BnYdr1tP8gpgnZHw=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1599:b0:4cb:d056:b14f with SMTP id
 5614622812f47-4dc57e2b419mr6325207b6e.1.1790492430728; Sun, 27 Sep 2026
 00:00:30 -0700 (PDT)
Date: Sun, 27 Sep 2026 00:00:30 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab8bf0e.80e1c6cc.1e8e5f.0053.GAE@google.com>
Subject: [syzbot] [f2fs?] kernel BUG in f2fs_write_end_bio
From: syzbot <syzbot+eae639926b1c1ac725d5@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    fe2ec83746e5 Merge tag 'hid-for-linus-2026092202' of git:/..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13ba8d25580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2b924f079099ba6e
dashboard link: https://syzkaller.appspot.com/bug?extid=eae639926b1c1ac725d5
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-fe2ec837.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/64158d6729cc/vmlinux-fe2ec837.xz
kernel image: https://storage.googleapis.com/syzbot-assets/4e2043b7fc3f/bzImage-fe2ec837.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+eae639926b1c1ac725d5@syzkaller.appspotmail.com

F2FS-fs (loop0): inconsistent node block, node_type:0, nid:3, node_footer[nid:0,ino:0,ofs:0,cpver:0,blkaddr:0]
------------[ cut here ]------------
kernel BUG at fs/f2fs/data.c:365!
Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
CPU: 0 UID: 0 PID: 1055 Comm: kworker/u4:9 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Workqueue: loop0 loop_workfn
RIP: 0010:f2fs_write_end_bio+0x167d/0x16e0 fs/f2fs/data.c:365
Code: 67 5f 8c e8 75 15 c1 fc 90 0f 0b e8 1d e0 60 fd 48 8b 7c 24 08 48 c7 c6 20 67 5f 8c e8 5c 15 c1 fc 90 0f 0b e8 04 e0 60 fd 90 <0f> 0b e8 fc df 60 fd 48 8b 7c 24 08 48 c7 c6 20 67 5f 8c e8 3b 15
RSP: 0018:ffffc9000527f490 EFLAGS: 00010293
RAX: ffffffff84670d0c RBX: 0000000000000003 RCX: ffff888036980000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000003
RBP: ffffea00010bb900 R08: ffffffff907a767f R09: 1ffffffff20f4ecf
R10: dffffc0000000000 R11: fffffbfff20f4ed0 R12: ffffea00010bb8c0
R13: dffffc0000000000 R14: 0000000000001000 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff88808c2c0000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fcdf33c4d10 CR3: 000000003b2bb000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 blk_update_request+0x57b/0xe50 block/blk-mq.c:1016
 blk_mq_end_request+0x3e/0x70 block/blk-mq.c:1147
 lo_rw_aio_complete drivers/block/loop.c:338 [inline]
 lo_rw_aio+0xcd4/0xf20 drivers/block/loop.c:406
 do_req_filebacked drivers/block/loop.c:430 [inline]
 loop_handle_cmd drivers/block/loop.c:1949 [inline]
 loop_process_work+0x621/0x11c0 drivers/block/loop.c:1984
 process_one_work kernel/workqueue.c:3396 [inline]
 process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3479
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3560
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:f2fs_write_end_bio+0x167d/0x16e0 fs/f2fs/data.c:365
Code: 67 5f 8c e8 75 15 c1 fc 90 0f 0b e8 1d e0 60 fd 48 8b 7c 24 08 48 c7 c6 20 67 5f 8c e8 5c 15 c1 fc 90 0f 0b e8 04 e0 60 fd 90 <0f> 0b e8 fc df 60 fd 48 8b 7c 24 08 48 c7 c6 20 67 5f 8c e8 3b 15
RSP: 0018:ffffc9000527f490 EFLAGS: 00010293
RAX: ffffffff84670d0c RBX: 0000000000000003 RCX: ffff888036980000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000003
RBP: ffffea00010bb900 R08: ffffffff907a767f R09: 1ffffffff20f4ecf
R10: dffffc0000000000 R11: fffffbfff20f4ed0 R12: ffffea00010bb8c0
R13: dffffc0000000000 R14: 0000000000001000 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff88808c2c0000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fcdf33c4d10 CR3: 000000001f6d9000 CR4: 0000000000352ef0


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
