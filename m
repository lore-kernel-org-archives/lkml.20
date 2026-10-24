Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792806292;
	b=4VvujoKtDPV5PCKwRvnWPfHjz6NOxVHra/xz4pl/dojKdgYHaHl3/feQ3OaiDeEG9Kut
	 E8gq6GHtnWLZzwNivOmEWhp7UX2xXDYCn020kj5kKd/Tgb61gRQtoUQD5CnTE0idt4FaV
	 HESp7aZHryWzfJmURG/RMp+fgr2MPwD6nSRIKxJpGwJgQoltpCniTHiheFEo2NyQA3Nh9
	 uwgZf/hXGtKalZ0HNxPhMcDTkbEHBcIpGqG1o0zEu5Ze/YYeJ9E4cemPOs9EisZpPVStl
	 JcLaUDdSHggLBZdEmWPWxyEfZj49fP0iniHDz4pk/GZRVWvIbPYL+YtOXSSp/EbOQIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792806292;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=mxVb7oQQyhCzXTf8Q6KVBf93tVdrbTHX5eRVTct8tjE=;
	b=3pA7Adw1uVl61FqDJCxHun+zbXhI0mllbzCVJYtInfLzi4PGlYSYZiuoU5qFgtUBiiXp
	 K7fcSjWb0yWighcPqg6MaJcO9AL9QbPa4Vwt6Gc2HOwNj6I3cDJXbh3ov3sbDDSi4GKeU
	 a4w5vNY2nYErVBA+PttygL99SOndihj8Hsn8sF+9tFLY0F/qUthDdoDAULp8W7a5Wukdy
	 G7C/llc53SWzICmyEnVvoDwKe7nZ4vfwjGOIqOp4cmxCn0iY1Kpo9esyxTiBwPuMvepA4
	 YeV0XA3N9FGinjKJf9u+Hv5xsflbtxZZevyNXuyHcvlTHESCubwIQy2Ku7MFCAn9+Pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.72
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F143606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 01:44:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F143606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-81447a16061so3073445a34.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 18:44:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792806291; x=1793411091;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mxVb7oQQyhCzXTf8Q6KVBf93tVdrbTHX5eRVTct8tjE=;
        b=H1jjH9wsN0ZrjISwduQeHdkZ6HvdEYoNlBYHeeqkSXJskBxuwWdxCZbyr3RkajgiqS
         I9oE9X+KGL2u8/cukcywAWD5x86t3koq2XpOnuAycPBCvez4go5bUjQkl3q8nw2cFbaF
         cp0YY05K+QBjvupUu95L8M5sv84gdZ0zlRHyj/7ZNBJFspI9ki9GYIut9rRxy6EHyMdt
         aIotM6cYix+JTKsWMm0qydfYCH1q18IDtd2+x+nq+HdQsAmLrFkoBB3vblD0IeIcQUF0
         JvVz5k1xqk10G4Eu4NxB53GKVg53gutOd+CZZ2RhqecODCqzJfJEf/8w+TD/657uCqOV
         lN7Q==
X-Forwarded-Encrypted: i=1; AKwUvBz7534bITMQPT6TQk8dRMLKnJPTVsewNj9pqiB1Ds3acMLNl9sucXqd5lZMbsCxDwKDqQGC+/GDueizzO8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPLhJAi77MQxpmpKaijFaQmcOsc6xEeq9De3bwxhBF5ySpIIc3
	9NuYMKxFXyglRaMRZVj+T2RoItZqsT7Gzyga9tGWL4VUdEA00W0xef1kHYjxoNvsa7+Fsu1xobG
	rITK1W8VSA8C+ZyJu0PL+2b+h92nQM/zEsJawnvDKaSDd7Z+cJYL+MvBfpYU=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:50a6:b0:4c3:ebb:63d6 with SMTP id
 5614622812f47-55c002e9610mr640257b6e.39.1792806291581; Fri, 23 Oct 2026
 18:44:51 -0700 (PDT)
Date: Fri, 23 Oct 2026 18:44:51 -0700
In-Reply-To: <6a9e1995.a5e650b3.26d8a.0024.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6adc0d93.4ce6c07b.2dfc0c.0000.GAE@google.com>
Subject: Re: [syzbot] [jffs2?] possible deadlock in jffs2_xattr_delete_inode
From: syzbot <syzbot+fdfd8fdf716c90baef0f@syzkaller.appspotmail.com>
To: dwmw2@infradead.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, richard@nod.at, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    734bef548a96 Merge tag 'net-next-7.4' of git://git.kernel...
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=147da38e580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2ced4746a89083f5
dashboard link: https://syzkaller.appspot.com/bug?extid=fdfd8fdf716c90baef0f
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
userspace arch: i386
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=167da38e580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+fdfd8fdf716c90baef0f@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
syzkaller #0 Not tainted
------------------------------------------------------
kswapd0/116 is trying to acquire lock:
ffff8880143729d8 (&c->xattr_sem){++++}-{4:4}, at: jffs2_xattr_delete_inode+0x83/0x130 fs/jffs2/xattr.c:605

but task is already holding lock:
ffffffff901caa00 (fs_reclaim){+.+.}-{0:0}, at: balance_pgdat+0x243/0x1f00 mm/vmscan.c:7177

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #1 (fs_reclaim){+.+.}-{0:0}:
       lock_acquire kernel/locking/lockdep.c:5942 [inline]
       lock_acquire+0x1d1/0x380 kernel/locking/lockdep.c:5899
       __fs_reclaim_acquire mm/page_alloc.c:4375 [inline]
       fs_reclaim_acquire+0xc4/0x100 mm/page_alloc.c:4389
       might_alloc include/linux/sched/mm.h:316 [inline]
       slab_pre_alloc_hook mm/slub.c:4636 [inline]
       slab_alloc_node mm/slub.c:4974 [inline]
       kmem_cache_alloc_noprof+0x63/0x6a0 mm/slub.c:5010
       jffs2_alloc_xattr_datum+0x1c/0xe0 fs/jffs2/malloc.c:264
       create_xattr_datum fs/jffs2/xattr.c:363 [inline]
       do_jffs2_setxattr+0x6f0/0x1610 fs/jffs2/xattr.c:1175
       __vfs_setxattr+0x175/0x1e0 fs/xattr.c:223
       __vfs_setxattr_noperm+0x127/0x660 fs/xattr.c:257
       __vfs_setxattr_locked+0x127/0x2b0 fs/xattr.c:318
       vfs_setxattr+0x14a/0x390 fs/xattr.c:344
       do_setxattr+0x145/0x180 fs/xattr.c:662
       file_setxattr fs/xattr.c:672 [inline]
       file_setxattr+0x139/0x1b0 fs/xattr.c:666
       path_setxattrat+0x335/0x3b0 fs/xattr.c:732
       __do_sys_fsetxattr fs/xattr.c:782 [inline]
       __se_sys_fsetxattr fs/xattr.c:779 [inline]
       __ia32_sys_fsetxattr+0xc4/0x140 fs/xattr.c:779
       do_syscall_32_irqs_on arch/x86/entry/syscall_32.c:79 [inline]
       __do_fast_syscall_32+0x14b/0x8c0 arch/x86/entry/syscall_32.c:282
       do_fast_syscall_32+0x32/0x70 arch/x86/entry/syscall_32.c:307
       entry_SYSENTER_compat_after_hwframe+0x84/0x8e

-> #0 (&c->xattr_sem){++++}-{4:4}:
       check_prev_add+0xeb/0xe60 kernel/locking/lockdep.c:3209
       check_prevs_add kernel/locking/lockdep.c:3328 [inline]
       validate_chain kernel/locking/lockdep.c:3952 [inline]
       __lock_acquire+0x1528/0x1f40 kernel/locking/lockdep.c:5288
       lock_acquire kernel/locking/lockdep.c:5942 [inline]
       lock_acquire+0x1d1/0x380 kernel/locking/lockdep.c:5899
       down_write+0x86/0x1f0 kernel/locking/rwsem.c:1631
       jffs2_xattr_delete_inode+0x83/0x130 fs/jffs2/xattr.c:605
       jffs2_do_clear_inode+0x50/0x470 fs/jffs2/readinode.c:1418
       evict+0x3c2/0xad0 fs/inode.c:822
       iput_final fs/inode.c:2014 [inline]
       iput.part.0+0x989/0x1050 fs/inode.c:2063
       iput+0x30/0x40 fs/inode.c:2029
       dentry_unlink_inode+0x403/0x4d0 fs/dcache.c:493
       dentry_kill+0x25d/0xca0 fs/dcache.c:840
       finish_dput fs/dcache.c:1015 [inline]
       dput.part.0+0xd2/0x240 fs/dcache.c:1056
       dput+0x1f/0x30 fs/dcache.c:1051
       ovl_destroy_inode+0x3e/0x190 fs/overlayfs/super.c:236
       destroy_inode+0xcb/0x1c0 fs/inode.c:387
       evict+0x599/0xad0 fs/inode.c:846
       iput_final fs/inode.c:2014 [inline]
       iput.part.0+0x989/0x1050 fs/inode.c:2063
       iput+0x30/0x40 fs/inode.c:2029
       dentry_unlink_inode+0x403/0x4d0 fs/dcache.c:493
       dentry_kill+0x25d/0xca0 fs/dcache.c:840
       shrink_kill fs/dcache.c:1289 [inline]
       shrink_dentry_list+0x1e8/0x310 fs/dcache.c:1306
       prune_dcache_sb+0xea/0x150 fs/dcache.c:1388
       super_cache_scan+0x32b/0x550 fs/super.c:225
       do_shrink_slab+0x411/0x1200 mm/shrinker.c:445
       shrink_slab+0x171/0x12e0 mm/shrinker.c:676
       shrink_one+0x398/0x850 mm/vmscan.c:5119
       shrink_many mm/vmscan.c:5180 [inline]
       lru_gen_shrink_node mm/vmscan.c:5258 [inline]
       shrink_node+0x2b1b/0x4310 mm/vmscan.c:6247
       kswapd_shrink_node mm/vmscan.c:7101 [inline]
       balance_pgdat+0xb20/0x1f00 mm/vmscan.c:7279
       kswapd+0x556/0xb50 mm/vmscan.c:7555
       kthread+0x373/0x450 kernel/kthread.c:436
       ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

other info that might help us debug this:

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(fs_reclaim);
                               lock(&c->xattr_sem);
                               lock(fs_reclaim);
  lock(&c->xattr_sem);

 *** DEADLOCK ***

locks held by kswapd0/116: 2, last CPU#0:
 #0: ffffffff901caa00 (fs_reclaim){+.+.}-{0:0}, at: balance_pgdat+0x243/0x1f00 mm/vmscan.c:7177
 #1: ffff88804f2ec0e8 (&type->s_umount_key#57){.+.+}-{4:4}, at: super_trylock_shared fs/super.c:670 [inline]
 #1: ffff88804f2ec0e8 (&type->s_umount_key#57){.+.+}-{4:4}, at: super_cache_scan+0x9b/0x550 fs/super.c:200

stack backtrace:
CPU: 0 UID: 0 PID: 116 Comm: kswapd0 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_circular_bug.cold+0x178/0x1be kernel/locking/lockdep.c:2087
 check_noncircular+0x146/0x160 kernel/locking/lockdep.c:2219
 check_prev_add+0xeb/0xe60 kernel/locking/lockdep.c:3209
 check_prevs_add kernel/locking/lockdep.c:3328 [inline]
 validate_chain kernel/locking/lockdep.c:3952 [inline]
 __lock_acquire+0x1528/0x1f40 kernel/locking/lockdep.c:5288
 lock_acquire kernel/locking/lockdep.c:5942 [inline]
 lock_acquire+0x1d1/0x380 kernel/locking/lockdep.c:5899
 down_write+0x86/0x1f0 kernel/locking/rwsem.c:1631
 jffs2_xattr_delete_inode+0x83/0x130 fs/jffs2/xattr.c:605
 jffs2_do_clear_inode+0x50/0x470 fs/jffs2/readinode.c:1418
 evict+0x3c2/0xad0 fs/inode.c:822
 iput_final fs/inode.c:2014 [inline]
 iput.part.0+0x989/0x1050 fs/inode.c:2063
 iput+0x30/0x40 fs/inode.c:2029
 dentry_unlink_inode+0x403/0x4d0 fs/dcache.c:493
 dentry_kill+0x25d/0xca0 fs/dcache.c:840
 finish_dput fs/dcache.c:1015 [inline]
 dput.part.0+0xd2/0x240 fs/dcache.c:1056
 dput+0x1f/0x30 fs/dcache.c:1051
 ovl_destroy_inode+0x3e/0x190 fs/overlayfs/super.c:236
 destroy_inode+0xcb/0x1c0 fs/inode.c:387
 evict+0x599/0xad0 fs/inode.c:846
 iput_final fs/inode.c:2014 [inline]
 iput.part.0+0x989/0x1050 fs/inode.c:2063
 iput+0x30/0x40 fs/inode.c:2029
 dentry_unlink_inode+0x403/0x4d0 fs/dcache.c:493
 dentry_kill+0x25d/0xca0 fs/dcache.c:840
 shrink_kill fs/dcache.c:1289 [inline]
 shrink_dentry_list+0x1e8/0x310 fs/dcache.c:1306
 prune_dcache_sb+0xea/0x150 fs/dcache.c:1388
 super_cache_scan+0x32b/0x550 fs/super.c:225
 do_shrink_slab+0x411/0x1200 mm/shrinker.c:445
 shrink_slab+0x171/0x12e0 mm/shrinker.c:676
 shrink_one+0x398/0x850 mm/vmscan.c:5119
 shrink_many mm/vmscan.c:5180 [inline]
 lru_gen_shrink_node mm/vmscan.c:5258 [inline]
 shrink_node+0x2b1b/0x4310 mm/vmscan.c:6247
 kswapd_shrink_node mm/vmscan.c:7101 [inline]
 balance_pgdat+0xb20/0x1f00 mm/vmscan.c:7279
 kswapd+0x556/0xb50 mm/vmscan.c:7555
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
