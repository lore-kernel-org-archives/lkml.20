Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6F946EF70
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789116308; cv=none; b=pVl/rNF0MLtSjdwsAno0DtQjrGRPBJOf2LVWruSai7hpjcMTJ/sqBEOF3r490VjOvnS1ymG6ROmwfTrlyZzUi22sN3iCgQUoyIHISu/fi8Lvi6A5q7bBwU7WqDYUajL4kgo9Cgty7Ib6s3Pb//eYLFsi4csdSu0+Nu0pP04mtQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789116308; c=relaxed/simple;
	bh=lyLGPIeBLaSJhVQs+7mhuHWsNiQr8T3LUidlmX16haI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=uWN06ksDOWtAA9pGkHcyiq0tTgU1KZd4emwKTzLq0wneD2+qQkk9JOoekjEzqFoSnPEL7hkYVKhkLsAz0YF1liXNoT66kvuK3xtsAgipWooZ6iOk0NcbfaW4zSYVtNbRCbTUTIcq7aruxvCfyK0amhRpeguLWNZsxkWpDfv8n34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7f653940ba4so970374a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 01:45:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789116302; x=1789721102;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pNZDJs4WrvpU/0VeM+HaPedq/Arxn/eGOa9ZM/mqOUg=;
        b=gke+TVrXcWG78FVS0EWrLaQ7B1ZTYHImeA00HqaBJXAZyMnhFCt+xmhRXjOHQ10ks5
         O9E/u9dRZAM2+GCcm4K6CSt7vwCfH43TkUtMEd2Y7xz3XKThlLy7HdEiYImNRkcFUG+H
         oi2qNadVBbeYoZBKRfyc+teT4WShBs6QdZ7suPEhZCQxHwyNMvrnPqIjlx8uDoWZyog1
         KCqfKQUBTTDVT/eKww4BaheF4Yeue8I9DnhLwbBFu5RFL3HhtBLd71SvU3LfDy9XGket
         ysoKvHvFywzCzqdNuPAJfojYufWD9K3NqmtKe49x09sBtcbHv+El5zrTGUl+cB6JXkyF
         3e4g==
X-Forwarded-Encrypted: i=1; AKwUvByDnHzPpiJncMkWOG4oQG3X7a0FPx5vcfPdLWO+pO4zcQV07CdatoagxVUFncUSiPaU8pym2BmKoQwtauc=@vger.kernel.org
X-Gm-Message-State: AFuF++mcbRTIyVg+Gbyxcg5UaISsWUuXx+8BMijxujcMikQpdHRhZC3e
	kHMMOhTtyKddaJuTNfP4M6ugXybtWI/DUHDu5jogR0pfKFlqyYc9yNqqZ+MWiMNS64Krt+lV0Eg
	/AuhY6DbevYS6KBGDuEh+6vecd4a7ke+LrkLBxbCuka+ELD+Q6pSknrU36d8=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:813:b0:6ba:3635:800b with SMTP id
 006d021491bc7-6c0bd19ad9amr2034348eaf.68.1789116302063; Fri, 11 Sep 2026
 01:45:02 -0700 (PDT)
Date: Fri, 11 Sep 2026 01:45:02 -0700
In-Reply-To: <20260911082838.850442-1-eadavis@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa3bf8e.f2639fcc.29487d.0026.GAE@google.com>
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
kswapd0/113 is trying to acquire lock:
ffff8880142105e0 (&f->sem){+.+.}-{4:4}, at: jffs2_do_clear_inode+0x5a/0x470 fs/jffs2/readinode.c:1419

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
       kmem_cache_alloc_noprof+0x63/0x6a0 mm/slub.c:5010
       jffs2_do_new_inode+0x24/0x520 fs/jffs2/write.c:28
       jffs2_new_inode+0x581/0xcf0 fs/jffs2/fs.c:469
       jffs2_create+0x94/0x390 fs/jffs2/dir.c:182
       vfs_create+0x2fb/0x6c0 fs/namei.c:4197
       filename_mknodat+0x2de/0x7f0 fs/namei.c:5319
       __do_sys_mknodat fs/namei.c:5350 [inline]
       __se_sys_mknodat fs/namei.c:5346 [inline]
       __ia32_sys_mknodat+0xb4/0xf0 fs/namei.c:5346
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

locks held by kswapd0/113: 2, last CPU#1:
 #0: ffffffff8efc9a20 (fs_reclaim){+.+.}-{0:0}, at: balance_pgdat+0xbce/0x1f00 mm/vmscan.c:7292
 #1: ffff88805c6760e8 (&type->s_umount_key#57){++++}-{4:4}, at: super_trylock_shared fs/super.c:688 [inline]
 #1: ffff88805c6760e8 (&type->s_umount_key#57){++++}-{4:4}, at: super_cache_scan+0x9b/0x5c0 fs/super.c:213

stack backtrace:
CPU: 1 UID: 0 PID: 113 Comm: kswapd0 Not tainted syzkaller #0 PREEMPT(full) 
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
console output: https://syzkaller.appspot.com/x/log.txt?x=16842601580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=85bc5cc2fc7394d9
dashboard link: https://syzkaller.appspot.com/bug?extid=743079a09058321247d8
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
userspace arch: i386
patch:          https://syzkaller.appspot.com/x/patch.diff?x=13a68905580000

