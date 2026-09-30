Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526264E8E14
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790778358; cv=none; b=lWTXpMkTG8uV1sPmZ6OUcmU2KJJyvf42fwfOoOtCzXBoNHpbLcGkofiIrv9N3wyk0YJqCFA7C8BJnElLsNTCpVWTalBuwZozR4+AuInVDxL/lPpovZ8m6mpqWfM7jkW/4SE5Q7U3JfOTFViFpo8gxHQaHRmFlbpCrJAkABLdiCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790778358; c=relaxed/simple;
	bh=apO13nm+V4glrEDhKHt2A20vrAEHwAVipOBOTCOTXCU=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=DTOcwVVHESHZd+3joxA83rdj+R+tWQX3qpT+U/y6YKWbDFuMV0pNccAG+Fv+VDCvFStJCLZLmr6eCB5oKXlOpOC+nAxQCRYSbfvB8iEK0dyNb/dC6GGL7yuDgiGJkh1gezI1S8zIGtzL0RgPLjI+6pwhWyllf+xwcT41cNxM7vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4959c49e054so5726680b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:25:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790778344; x=1791383144;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rK1Is7P5EYGLLAJjb2Cuc+Kd0rrtOHS2i7gUMnob7Ro=;
        b=uz/Yx0xGj17Ul+DJs4BwMK0IGyB3c6DtT8dJGnFusH3nfnAPOSTNUW1HSbBJBEH30w
         VTI+P4gqTvnlysohQj9MPwh0t6y1jUciUOE1c7J7t/B7HcufeuMSAZWkD/OFWXefA203
         6oPCKyGVARzdhm1e4uPhudS6zjuw8qsj70/aTDQC2knQfzoH3FBqyz0KSXyZRqKwruw4
         G8QQRPu7zZyNY7OnlbueDreg3VSGaK+fiWvE4Rg2/ksMKSXcZZP8drQY+qZWlczPgPJJ
         0Vo7miyiIUZF9S7O+kF7Tg8ndTgDjcjYWlromN4i+wcUrFiu2wtj0gdeR6DL46cBsYc4
         p2SA==
X-Forwarded-Encrypted: i=1; AKwUvBwzriiUSoeKMtue8hBIGgxSmf0unLW3RqCB5g8jIaHnSziZwbvqMAO4eImE+ruPRY9KLQLuEgzwQn+n3eU=@vger.kernel.org
X-Gm-Message-State: AFuF++mDmqmK3bY1nUTD2kU9HzOInuuHPhRD80Is5dpmHFuQUFvYbvuR
	1TzjkRzfWwTzAjkmJa+bxrH8VHVyqAJnKLyVGNQiSqTcEHek+HTTyQ0BCk6uT3Z6j4LLtVMYUxP
	lMefP8cF4af3+k+BffenBMecgQwgHo2p3pnQHaLm7/iBj1o41BFKw7VscmAY=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4497:b0:4b9:a88b:8891 with SMTP id
 5614622812f47-4f1b6b72f31mr1415333b6e.39.1790778343909; Wed, 30 Sep 2026
 07:25:43 -0700 (PDT)
Date: Wed, 30 Sep 2026 07:25:43 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6abd1be7.fac9d4e5.17396.0005.GAE@google.com>
Subject: [syzbot] [dm?] KASAN: wild-memory-access Write in __journal_read_write
From: syzbot <syzbot+675c91651049ad042c5f@syzkaller.appspotmail.com>
To: agk@redhat.com, bmarzins@redhat.com, dm-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, mpatocka@redhat.com, snitzer@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    551c722f4080 Merge tag 'rtc-7.3-fixes' of git://git.kernel..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=1111c6c9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7d012d9c67977ee4
dashboard link: https://syzkaller.appspot.com/bug?extid=675c91651049ad042c5f
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=171b0035580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+675c91651049ad042c5f@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: wild-memory-access in __journal_read_write+0xc29/0x1f10 drivers/md/dm-integrity.c:2288
Write of size 512 at addr 0005088000000000 by task syz-executor338/6039

CPU: 0 UID: 0 PID: 6039 Comm: syz-executor338 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 kasan_report+0xdf/0x1c0 mm/kasan/report.c:595
 check_region_inline mm/kasan/generic.c:186 [inline]
 kasan_check_range+0x10f/0x1e0 mm/kasan/generic.c:200
 __asan_memcpy+0x3c/0x60 mm/kasan/shadow.c:106
 __journal_read_write+0xc29/0x1f10 drivers/md/dm-integrity.c:2288
 dm_integrity_map_continue+0x243f/0x33b0 drivers/md/dm-integrity.c:2574
 dm_integrity_map+0x6cc/0xc90 drivers/md/dm-integrity.c:2204
 __map_bio+0x597/0x660 drivers/md/dm.c:1435
 __split_and_process_bio drivers/md/dm.c:1769 [inline]
 dm_split_and_process_bio drivers/md/dm.c:2043 [inline]
 dm_submit_bio+0x5b6/0x2950 drivers/md/dm.c:2099
 __submit_bio block/blk-core.c:681 [inline]
 __submit_bio+0x20e/0x3d0 block/blk-core.c:670
 __submit_bio_noacct block/blk-core.c:724 [inline]
 submit_bio_noacct_nocheck+0x736/0xc00 block/blk-core.c:792
 submit_bio_noacct+0xc93/0x2130 block/blk-core.c:925
 bio_await+0x1fa/0x240 block/bio.c:1581
 submit_bio_wait+0x19/0x60 block/bio.c:1599
 __blkdev_direct_IO_simple+0x4cb/0x8c0 block/fops.c:98
 blkdev_direct_IO+0xbee/0x2030 block/fops.c:429
 blkdev_direct_write block/fops.c:699 [inline]
 blkdev_write_iter+0x703/0xd30 block/fops.c:767
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6af/0x1050 fs/read_write.c:687
 ksys_pwrite64 fs/read_write.c:794 [inline]
 __do_sys_pwrite64 fs/read_write.c:802 [inline]
 __se_sys_pwrite64 fs/read_write.c:799 [inline]
 __x64_sys_pwrite64+0x1eb/0x250 fs/read_write.c:799
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f5408351ab7
Code: 48 89 fa 4c 89 df e8 98 1d 00 00 8b 93 08 03 00 00 59 5e 48 83 f8 fc 74 1a 5b c3 0f 1f 84 00 00 00 00 00 48 8b 44 24 10 0f 05 <5b> c3 0f 1f 80 00 00 00 00 83 e2 39 83 fa 08 75 de e8 23 ff ff ff
RSP: 002b:00007ffc07ac8820 EFLAGS: 00000202 ORIG_RAX: 0000000000000012
RAX: ffffffffffffffda RBX: 0000555592860400 RCX: 00007f5408351ab7
RDX: 0000000000000400 RSI: 0000555592863000 RDI: 0000000000000007
RBP: 0000000000000003 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000202 R12: 00005555928627a0
R13: 0000000000000007 R14: 0000555592863000 R15: 00000000c138fd06
 </TASK>
==================================================================


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
