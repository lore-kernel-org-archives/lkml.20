Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793250750;
	b=lOFnFtFLgyzFuWQN60caRqypBjQQsEpptrUW215YxjXtGw8hY4K3l6w/t8dHLt85Okwv
	 GSRbBHQC/mONrH5nDq+S21DrF2uCQVuoUdCDv1gsn7h1F76dlChHu/dUw5AEpVuoGCK1t
	 anvVVK84S9yX2lTOjIIaiZ7kKm+Z3R/w7A70Ck+wlXIHuRknYXAjv7ceSITzBOkHzT0lG
	 iPL5CoiKN62nJrR8ejwRfoW1sNV0Rjgx1S3tPYsFFuENzGJ7Bzppzs/1NqoNuXs6ZSSQa
	 NGuHTBSVVDcvLVE85Gx2ctlZRlu0Ri8vHsR6DLaBBhKvHMRo/Y9/KJ2Or1tHmshRPfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793250750;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=tJ9LIiDZgiKxLOj84Ud11lzQkNpj0FXQvc670E6Q+Ho=;
	b=fHGhpDrmtV51D9NLK0SJ6iAlkt5WsK8w1Y7o8hgdA7bTSdXHx5K1d42LEkQ7J5ul2+DQ
	 ZXlJC8r+ttim1IeJ/Yr4Hly674C+r4/jOvy2AAfgyKAljVc5UDquWhW7t9jBWuJiUR/X9
	 +0pOzRi3w6eCZyy9xBnkw30XAuPXVejvASADDndYfNOc4ymUwVna0BV2QfU60ZRrtPMBl
	 LpKdl734PI/g2dqVApNVNvCZp1XHh7Iuvz7WJEvl/8cKRv0diFMI0nbgfVckt4eCPvu4T
	 pI0HynEEWpRQLBcbrCtsydGK4s7q0ih4d7NYxCuJ8IjaZWr2aarrt9P/WchwAfyVF+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB06606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 05:12:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EB06606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4d2f0f77124so2055249b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 22:12:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793250749; x=1793855549;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tJ9LIiDZgiKxLOj84Ud11lzQkNpj0FXQvc670E6Q+Ho=;
        b=mMCf0n93/2y8rUz2JmMXlw8WZLhvIaOOJjeSPI4HLElpM26gGVlnYI3tboYaC01wFP
         rmokSVPhSaTKYjskgxFr2CxnsJ0omvE09oLC3trhNjV+TvFIgmAQNf0eEe8mhTowBdQF
         YnEygUkjKoEe1l4pIF+21Lib1jRcSXAaZEhaTrN05xrp6W5dH4wtW1rVZlGpHp04qjwI
         V9zwQ0TMzZBv1LXWf8ZWkMBS6C+4nfJDE5W49U83SkCki14su938gQdGvK/w8h6WivPq
         FuUJjE8n7YCJIlsex/zwVFAOEXWHIKcdUuuATZahTleqWiTMJPrjbWAip1JVyp4ZCJHo
         MIJg==
X-Forwarded-Encrypted: i=1; AKwUvBx9DjOKGQtvmJvyaACQNv7BDwRhpUz8fIOoGXaeUjcvZ6xSPuWLSOULsyksfGx7lHbWbMHu1s8+YA8KmMw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJshRtm89Aur/nPEKDG34hcupTEdp/zBPAn5XAhAv7ya9+54FWr
	rqq52XphxBCTK91DYZCf4mwL3x/nnVDCN6fCjRxB10B9JyYLulJDHcv5ZxT99xWa8+P3zc3NUEm
	x3XNeEODDDWiK5q5A575sL4dSTEOKGIl8eZy/rytE5f99DWR3BwADpLNtdVI=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1b26:b0:533:be44:82e with SMTP id
 5614622812f47-56384499512mr2928883b6e.40.1793250749323; Wed, 28 Oct 2026
 22:12:29 -0700 (PDT)
Date: Wed, 28 Oct 2026 22:12:29 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae2d5bd.84012103.26b497.074c.GAE@google.com>
Subject: [syzbot] [block?] possible deadlock in blkdev_write_iter
From: syzbot <syzbot+39e465d3f7a1555b0f96@syzkaller.appspotmail.com>
To: axboe@kernel.dk, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    330517c63aa9 Merge tag 'char-misc-7.4-rc1' of git://git.ke..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11962aa5580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b03c85f3988bfcd5
dashboard link: https://syzkaller.appspot.com/bug?extid=39e465d3f7a1555b0f96
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16949aa5580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=105c53cd580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-330517c6.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/ecb230491807/vmlinux-330517c6.xz
kernel image: https://storage.googleapis.com/syzbot-assets/ace3132a7acc/bzImage-330517c6.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+39e465d3f7a1555b0f96@syzkaller.appspotmail.com

============================================
WARNING: possible recursive locking detected
syzkaller #0 Not tainted
--------------------------------------------
syz.2.64/6167 is trying to acquire lock:
ffff88802a5f1ee8 (&sb->s_type->i_mutex_key#9){++++}-{4:4}, at: inode_lock_shared include/linux/fs.h:1039 [inline]
ffff88802a5f1ee8 (&sb->s_type->i_mutex_key#9){++++}-{4:4}, at: blkdev_buffered_write block/fops.c:734 [inline]
ffff88802a5f1ee8 (&sb->s_type->i_mutex_key#9){++++}-{4:4}, at: blkdev_write_iter+0xd12/0x11d0 block/fops.c:812

but task is already holding lock:
ffff88802a5f1ee8 (&sb->s_type->i_mutex_key#9){++++}-{4:4}, at: inode_lock_shared include/linux/fs.h:1039 [inline]
ffff88802a5f1ee8 (&sb->s_type->i_mutex_key#9){++++}-{4:4}, at: blkdev_write_iter+0xc5e/0x11d0 block/fops.c:811

other info that might help us debug this:
 Possible unsafe locking scenario:

       CPU0
       ----
  lock(&sb->s_type->i_mutex_key#9);
  lock(&sb->s_type->i_mutex_key#9);

 *** DEADLOCK ***

 May be due to missing lock nesting notation

locks held by syz.2.64/6167: 1, last CPU#2:
 #0: ffff88802a5f1ee8 (&sb->s_type->i_mutex_key#9){++++}-{4:4}, at: inode_lock_shared include/linux/fs.h:1039 [inline]
 #0: ffff88802a5f1ee8 (&sb->s_type->i_mutex_key#9){++++}-{4:4}, at: blkdev_write_iter+0xc5e/0x11d0 block/fops.c:811

stack backtrace:
CPU: 2 UID: 0 PID: 6167 Comm: syz.2.64 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_deadlock_bug.cold+0xbd/0xca kernel/locking/lockdep.c:3085
 check_deadlock kernel/locking/lockdep.c:3137 [inline]
 validate_chain kernel/locking/lockdep.c:3939 [inline]
 __lock_acquire+0x13f4/0x1f40 kernel/locking/lockdep.c:5288
 lock_acquire kernel/locking/lockdep.c:5942 [inline]
 lock_acquire+0x1d1/0x380 kernel/locking/lockdep.c:5899
 down_read+0x94/0x4c0 kernel/locking/rwsem.c:1574
 inode_lock_shared include/linux/fs.h:1039 [inline]
 blkdev_buffered_write block/fops.c:734 [inline]
 blkdev_write_iter+0xd12/0x11d0 block/fops.c:812
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6af/0x1050 fs/read_write.c:687
 ksys_write+0x12a/0x250 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f835bf9f559
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffd15ca3258 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007f835c225fa0 RCX: 00007f835bf9f559
RDX: 00000000fffffe38 RSI: 0000200000001140 RDI: 0000000000000004
RBP: 00007f835c036b20 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f835c225fac R14: 00007f835c225fa0 R15: 00007f835c225fa0
 </TASK>


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
