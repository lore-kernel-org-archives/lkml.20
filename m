Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA162411FA7
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789114745; cv=none; b=aKqVw8SQV+7XNVNNOCbRYlcrrR8HynBtOgFPLhjc2sDoNlFGk+Jnx73yCAeDY2hXnz0UGI8NFJ+agGBmjP5TmSy8u0oWRpkuQY8F1l2ATJuRatiSLy2Isrf403qvaeSyB8CI20h3utHJ9+3XPUTAXOQZ4Y1NOSL+8pwf5AxEOSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789114745; c=relaxed/simple;
	bh=A2zVX8VvI3N334ybPtUJw5lWw8I70BIXgPKVFNyIL60=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=r9OkSZlkNYXO5c1oR3/VBCfZ+eoBUJ8PcM+IybcZLH1PjhXaZOuLTYRyEzXNPxH9JDF8tzpRpPYuzJ4P7eIQwHGDb3lXxeiC4K1F0/brsjm1WBOeST6wgz27MKg4NM0R9h93QJs7+OfW5K61qPHR1AKo7IjqOG+DZbBAOx/laPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4c307941971so914428b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 01:19:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789114743; x=1789719543;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xNQFdeIQdxUvSZ80TevHR2q/n/cHRmrNydJ5vvU3C5o=;
        b=fodJshRRC8ynCvfZ65oYneAi4fYmzHGQCmHN0cNPIZqOL3jYXrPraUS1pskpmLEhJR
         1ttdwj9Tozfk0B8HqoVpXhNT8ZGk5zdrQOjIUyGTot8lm3f47LjySdE1kYcdstAsVIFf
         gR5XiPy4BWqFdLfHWqjiE3eq2mOQRX2RxKDT3U0tRKI/JBcpd5qdFi5/WxKHRE1dGC5L
         MFp/DesuYDGoT4pqX1cApmHaR3PQ3StF6VAIjWny8oV3KTPQjRlnazC85MkTgssa6ZRq
         bIyJ6c6AvRcWSj8BTMKYCGWNVpRWt1PfMer9p2avqfzsgHtykvwiLVl0F46vWSjHfgjt
         lCZg==
X-Forwarded-Encrypted: i=1; AKwUvBxvi2cJIx3zBa1iqq4PQBNGMXnzyT+CDDYRBOTiDI6590XvN7yMc1xutr3nXD1HxFxhhb6qTk56oMZh7zM=@vger.kernel.org
X-Gm-Message-State: AFuF++lWd1GyLc/B4+J1lOJzSFBfd3mbn5sV8Bdhq9hPw2X8wd5WYq+4
	ncpoDhhViu1LdsdY4p1FRQCuxs8fs6Btu1B84K+qp4gpXHPhIXNFSHsJFozPoUaKYlI0DmFux14
	Q0fNGbvLX4KFRH2Ci6LwB8RemIlFVCMAYaqiPI1fT0zzyXtRj7462Ot/L3wU=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:6411:b0:4b9:a829:f00e with SMTP id
 5614622812f47-4c31b9d47a4mr2462732b6e.26.1789114742755; Fri, 11 Sep 2026
 01:19:02 -0700 (PDT)
Date: Fri, 11 Sep 2026 01:19:02 -0700
In-Reply-To: <20260911075558.849153-1-eadavis@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa3b976.f2639fcc.29487d.0025.GAE@google.com>
Subject: Re: [syzbot] [jffs2?] possible deadlock in jffs2_do_clear_inode (2)
From: syzbot <syzbot+743079a09058321247d8@syzkaller.appspotmail.com>
To: eadavis@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
possible deadlock in jffs2_do_clear_inode

======================================================
WARNING: possible circular locking dependency detected
syzkaller #0 Not tainted
------------------------------------------------------
kswapd0/111 is trying to acquire lock:
ffff888013343ce0 (&f->sem){+.+.}-{4:4}, at: jffs2_do_clear_inode+0x5a/0x470 fs/jffs2/readinode.c:1419

but task is already holding lock:
ffffffff8efc9a20 (fs_reclaim){+.+.}-{0:0}, at: balance_pgdat+0xbce/0x1f00 mm/vmscan.c:7292

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
       __do_kmalloc_node mm/slub.c:5413 [inline]
       __kmalloc_noprof+0xce/0x840 mm/slub.c:5439
       _kmalloc_noprof include/linux/slab.h:995 [inline]
       jffs2_get_inode_nodes fs/jffs2/readinode.c:997 [inline]
       jffs2_do_read_inode_internal+0x13d/0x4ac0 fs/jffs2/readinode.c:1160
       jffs2_do_read_inode+0x1b3/0x520 fs/jffs2/readinode.c:1389
       jffs2_iget+0x32b/0xe30 fs/jffs2/fs.c:277
       jffs2_do_fill_super+0x44b/0xa50 fs/jffs2/fs.c:578
       jffs2_fill_super+0x283/0x370 fs/jffs2/super.c:290
       mtd_get_sb+0x2f0/0x4c0 drivers/mtd/mtdsuper.c:57
       mtd_get_sb_by_nr drivers/mtd/mtdsuper.c:88 [inline]
       get_tree_mtd+0x6f9/0x8a0 drivers/mtd/mtdsuper.c:141
       vfs_get_tree+0x92/0x320 fs/super.c:1947
       fc_mount fs/namespace.c:1198 [inline]
       do_new_mount_fc fs/namespace.c:3772 [inline]
       do_new_mount fs/namespace.c:3848 [inline]
       path_mount+0x7d0/0x24c0 fs/namespace.c:4168
       do_mount fs/namespace.c:4181 [inline]
       __do_sys_mount fs/namespace.c:4397 [inline]
       __se_sys_mount fs/namespace.c:4374 [inline]
       __ia32_sys_mount+0x292/0x310 fs/namespace.c:4374
       do_syscall_32_irqs_on arch/x86/entry/syscall_32.c:79 [inline]
       __do_fast_syscall_32+0x13a/0x8b0 arch/x86/entry/syscall_32.c:291
       do_fast_syscall_32+0x32/0x70 arch/x86/entry/syscall_32.c:316
       entry_SYSENTER_compat_after_hwframe+0x84/0x8e

-> #0 (&f->sem){+.+.}-{4:4}:
       check_prev_add+0xeb/0xe60 kernel/locking/lockdep.c:3209
       check_prevs_add kernel/locking/lockdep.c:3328 [inline]
       validate_chain kernel/locking/lockdep.c:3952 [inline]
       __lock_acquire+0x1528/0x1f40 kernel/locking/lockdep.c:5288
       lock_acquire kernel/locking/lockdep.c:5942 [inline]
       lock_acquire+0x1d1/0x380 kernel/locking/lockdep.c:5899
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x1a4/0x1bd0 kernel/locking/mutex.c:821
       jffs2_do_clear_inode+0x5a/0x470 fs/jffs2/readinode.c:1419
       evict+0x3c2/0xad0 fs/inode.c:822
       dispose_list+0x117/0x1e0 fs/inode.c:864
       prune_icache_sb+0xea/0x150 fs/inode.c:1011
       super_cache_scan+0x3ac/0x5c0 fs/super.c:240
       do_shrink_slab+0x416/0x1200 mm/shrinker.c:443
       shrink_slab_memcg mm/shrinker.c:560 [inline]
       shrink_slab+0xa82/0x12e0 mm/shrinker.c:638
       shrink_one+0x398/0x850 mm/vmscan.c:5119
       shrink_many mm/vmscan.c:5180 [inline]
       lru_gen_shrink_node mm/vmscan.c:5258 [inline]
       shrink_node+0x2b20/0x4320 mm/vmscan.c:6247
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
                               lock(&f->sem);
                               lock(fs_reclaim);
  lock(&f->sem);

 *** DEADLOCK ***

locks held by kswapd0/111: 2, last CPU#1:
 #0: ffffffff8efc9a20 (fs_reclaim){+.+.}-{0:0}, at: balance_pgdat+0xbce/0x1f00 mm/vmscan.c:7292
 #1: ffff88804ba6e0e8 (&type->s_umount_key#57){++++}-{4:4}, at: super_trylock_shared fs/super.c:688 [inline]
 #1: ffff88804ba6e0e8 (&type->s_umount_key#57){++++}-{4:4}, at: super_cache_scan+0x9b/0x5c0 fs/super.c:213

stack backtrace:
CPU: 1 UID: 0 PID: 111 Comm: kswapd0 Not tainted syzkaller #0 PREEMPT(full) 
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
 __mutex_lock_common kernel/locking/mutex.c:646 [inline]
 __mutex_lock+0x1a4/0x1bd0 kernel/locking/mutex.c:821
 jffs2_do_clear_inode+0x5a/0x470 fs/jffs2/readinode.c:1419
 evict+0x3c2/0xad0 fs/inode.c:822
 dispose_list+0x117/0x1e0 fs/inode.c:864
 prune_icache_sb+0xea/0x150 fs/inode.c:1011
 super_cache_scan+0x3ac/0x5c0 fs/super.c:240
 do_shrink_slab+0x416/0x1200 mm/shrinker.c:443
 shrink_slab_memcg mm/shrinker.c:560 [inline]
 shrink_slab+0xa82/0x12e0 mm/shrinker.c:638
 shrink_one+0x398/0x850 mm/vmscan.c:5119
 shrink_many mm/vmscan.c:5180 [inline]
 lru_gen_shrink_node mm/vmscan.c:5258 [inline]
 shrink_node+0x2b20/0x4320 mm/vmscan.c:6247
 kswapd_shrink_node mm/vmscan.c:7101 [inline]
 balance_pgdat+0xb20/0x1f00 mm/vmscan.c:7279
 kswapd+0x556/0xb50 mm/vmscan.c:7555
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>


Tested on:

commit:         50d05c7c Merge tag 'landlock-7.3-rc3' of git://git.ker..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=10391871580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=85bc5cc2fc7394d9
dashboard link: https://syzkaller.appspot.com/bug?extid=743079a09058321247d8
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
userspace arch: i386
patch:          https://syzkaller.appspot.com/x/patch.diff?x=154d7749580000

