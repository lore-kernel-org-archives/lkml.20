Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510330;
	b=3W1lbDnnyn8GgqYDyVQlBLA4uEN1yVncoRjcOT020JqOlHd9EXveAdVjMoh5gNezMLxs
	 CDPN77VjHkyNn2p0K1NM68xFip6fdpjL2nXYjE3ueQgmCF7o0jrmgVRm1glQB8BPyQVMP
	 eoSyV2zqtM0j2+J8YtFwt2Q6+h2QInB7mZOnKsDjoseGm09tRokK/LJV6fe6U9YuIb2It
	 QASeJXLQUQB8lN3nppaYCPzTqK+UEgTcdMfznm1+uTqSEUQuN5PRqtn7N4hqBKeq6wXTs
	 WdMMEnkFW2N3UjTwUZ9Gbddow+qV6WsUCxuI+UBqM0IxxwQj01X3UZLLRIEJUe+VupA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510330;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=RpUsNHBHUXRzS2zghI2ldKlR03lTMuoNlBhWk95vYTI=;
	b=VMdI573edwEUm5oe65QoTFWEWdKc+Km4bci5yzHkWJRPtAHgkbpCeNVtbR/hliaS2ZiV
	 LtMQoWUkQiLqmhC8OI6W4Rjze18feszP+KhdjvXSZ7wYaKItpCn/ep5Fw3S0JSsVuSPei
	 qpZ1HEQfhoppR3LQuSb8I7B8CwzkvNc92eD4jsE3rbFyb4rI5/MVR5XtYA/mmsl5PkiZQ
	 1JVEHFbkTGgDxMr8w44IfeIrsodLRgvWQ7cBTOxL8o4iaP0LiK0340y8UivnWFlrs9WG5
	 GWBuVSf/ZWH8lBtVNozXuv4nfmPNwrEO/BBxEsuzhFs+rJLaN6ObayNs5Nmx4Fjttnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.160.69
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E652F606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:32:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E652F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-48296f34f1dso3660166fac.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:32:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792510329; x=1793115129;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RpUsNHBHUXRzS2zghI2ldKlR03lTMuoNlBhWk95vYTI=;
        b=F6KCuX9VIoIEmoJ3frrn4UHuOob5vwXVnZgCRQg0iEpAZ0Xl7yS+Jl1LfizxgYrJAm
         zeStmQGBmhAG60Jax5jSRmurrsgLaLudl/b0thHMa1kbMBOe0/Mx+QM15c9cs97Hn0cp
         +f8CTmMZYjTXxuRCS6kZEeSdwy85oM7U2HjJ+Wn/0ApTYb83jMBd3ZZ2hQcWtRmzNLxH
         VVkz23e3TLHzdE7cCbvPfQ8OJ7WUGGlBa2+nHNeIoTqtSJZdVenXNLm9IktJcg2BHJa6
         +wfgBUvvNick4kHCIF4bTlxYyZBJ6IEQNrzl8yDdApDE/PSAgjDxzb3qLwagcVA/bv+Y
         U4lA==
X-Forwarded-Encrypted: i=1; AKwUvBxKJTtWGD9Sd/EbvvMM4ka52rCEVeNQNXjUn2GEjqY3BwjFm1uaOQYcghUNZhKRl3KVKgBO6XIXFmQbrWU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwg29OEP9iM9k4q3OLi0FdF4pTf9gOf6XxxL8PJrookrStCdqo
	tTzcNj6kHvdsQsP9mO4WAvqtk8r+07JF5xCs956STkMGQtXI3jHxOBrlR6jtu95p0lNCuNZwzaz
	Oa6XaOI20fs0RpBoUEOWY5K520vGMUwyycsNDjIvcn0MddjdT7yURCDfFgTU=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:13c6:b0:4f4:d7:b15b with SMTP id
 5614622812f47-53cc6b003a6mr9914911b6e.4.1792510329007; Tue, 20 Oct 2026
 08:32:09 -0700 (PDT)
Date: Tue, 20 Oct 2026 08:32:08 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad78978.b5bd089a.6b57.008d.GAE@google.com>
Subject: [syzbot] [block?] possible deadlock in blkdev_buffered_write
From: syzbot <syzbot+bd975ef54294bec73f0e@syzkaller.appspotmail.com>
To: axboe@kernel.dk, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    2efb7a11f1aa Add linux-next specific files for 20261016
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=15344895580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=129fca4e65ab9877
dashboard link: https://syzkaller.appspot.com/bug?extid=bd975ef54294bec73f0e
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=110b0f01580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17b99031580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/cd996cff1b76/disk-2efb7a11.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/59577d58bd5a/vmlinux-2efb7a11.xz
kernel image: https://storage.googleapis.com/syzbot-assets/a3dfa3b04143/bzImage-2efb7a11.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/2b9971624b86/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+bd975ef54294bec73f0e@syzkaller.appspotmail.com

============================================
WARNING: possible recursive locking detected
syzkaller #0 Not tainted
--------------------------------------------
syz.0.40/6005 is trying to acquire lock:
ffff888024956f68 (&sb->s_type->i_mutex_key#10){++++}-{4:4}, at: inode_lock_shared include/linux/fs.h:1039 [inline]
ffff888024956f68 (&sb->s_type->i_mutex_key#10){++++}-{4:4}, at: blkdev_buffered_write+0xd7/0x160 block/fops.c:738

but task is already holding lock:
ffff888024956f68 (&sb->s_type->i_mutex_key#10){++++}-{4:4}, at: inode_lock_shared include/linux/fs.h:1039 [inline]
ffff888024956f68 (&sb->s_type->i_mutex_key#10){++++}-{4:4}, at: blkdev_write_iter+0x6c5/0x810 block/fops.c:815

other info that might help us debug this:
 Possible unsafe locking scenario:

       CPU0
       ----
  lock(&sb->s_type->i_mutex_key#10);
  lock(&sb->s_type->i_mutex_key#10);

 *** DEADLOCK ***

 May be due to missing lock nesting notation

locks held by syz.0.40/6005: 1, last CPU#1:
 #0: ffff888024956f68 (&sb->s_type->i_mutex_key#10){++++}-{4:4}, at: inode_lock_shared include/linux/fs.h:1039 [inline]
 #0: ffff888024956f68 (&sb->s_type->i_mutex_key#10){++++}-{4:4}, at: blkdev_write_iter+0x6c5/0x810 block/fops.c:815

stack backtrace:
CPU: 1 UID: 0 PID: 6005 Comm: syz.0.40 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/16/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_deadlock_bug+0x27a/0x290 kernel/locking/lockdep.c:3085
 check_deadlock kernel/locking/lockdep.c:3137 [inline]
 validate_chain kernel/locking/lockdep.c:3939 [inline]
 __lock_acquire+0x25db/0x2de0 kernel/locking/lockdep.c:5288
 lock_acquire+0x115/0x350 kernel/locking/lockdep.c:5942
 down_read+0x45/0x320 kernel/locking/rwsem.c:1574
 inode_lock_shared include/linux/fs.h:1039 [inline]
 blkdev_buffered_write+0xd7/0x160 block/fops.c:738
 blkdev_write_iter+0x6d5/0x810 block/fops.c:816
 do_iter_readv_writev+0x612/0x8c0 fs/read_write.c:-1
 vfs_writev+0x343/0x990 fs/read_write.c:1768
 do_pwritev fs/read_write.c:1864 [inline]
 __do_sys_pwritev2 fs/read_write.c:1922 [inline]
 __se_sys_pwritev2+0x177/0x2a0 fs/read_write.c:1913
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7ff2f2b9e559
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fff19d23ca8 EFLAGS: 00000246 ORIG_RAX: 0000000000000148
RAX: ffffffffffffffda RBX: 00007ff2f2e25fa0 RCX: 00007ff2f2b9e559
RDX: 0000000000000001 RSI: 0000200000000240 RDI: 0000000000000004
RBP: 00007ff2f2c35ab8 R08: 0000000000000000 R09: 0000000000000003
R10: 0000000000007a00 R11: 0000000000000246 R12: 0000000000000000
R13: 00007ff2f2e25fac R14: 00007ff2f2e25fa0 R15: 00007ff2f2e25fa0
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
