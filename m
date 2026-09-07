Received: from mail-oo2-f11.google.com (mail-oo2-f11.google.com [74.125.231.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5292ED16D
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 01:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788746136; cv=none; b=Ljb8SSRLUZl5l40vfxDtpb/4ZYlvcFJjbUdodvx3s8pUtIAy/EKKGDJ1kAz1J+k/nHPSN5bjlLIQ705m/KDI4U9Y8zRaRJkZH8J4YlL96PTsi8qzmPmnsdeC8Lr/PeiZxWGPAew2H+D2D7k3UgwoX7LzCmYqwaChS9GTt+Bv84o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788746136; c=relaxed/simple;
	bh=5ghn7nxvgfAiAWaBixedr2h12wQs1M4XKcGJABNW0/o=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=AKdxzEC460MciLYcBKV32fCqcLSCmeQeohAZtEUTfGKv3cnZzxluqC8G+Ej+82fqsYl09bjyctWhFLjdD5hPDM4zEsqs0bcptWXhuwKW2b200xO5AnKexahr3Mt7rz6f6pJMNCGGbMP+jLuGO2k526fYKoDLFfilgJSWGyVMUn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo2-f11.google.com with SMTP id 006d021491bc7-6b1b7b6ac7fso901597eaf.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 18:55:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788746133; x=1789350933;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kbZ2OnDIqN2FzfMGx2pAG1gARfawZnOqcaUIj2YUYrA=;
        b=ApUoABTsU/KxALdU8NpXVLHqNI5aSvgrBwcn9BuE7QUDLmm1RgzwTzocKRa+erogJe
         HePVWWOr0AvBU48w+9lHaMskdm1sz6jynZSkLj/9Qwcw6b5t4nBlg0g1eMDtpnBjffPa
         +FnDwBEqYRha9QWuef2Oe5ml893bqR9uyj9xa2E90r567IM/1HPo+B9Tnw4KZUplmOW8
         iNzcppU1cr2epDgPI12FbjjpgRA052XzphnuZ3zVxqhlhGyaDLvvB4Vm9CoTg+dV1DZh
         nAvIgqC1QNAe9/Ckf9yDElqLUeVap0IpAk6PnJ3SYoaY1aoKoTmP38ePU4OWoQVMak2E
         Ba1g==
X-Forwarded-Encrypted: i=1; AKwUvByVNpQotmS99zqqLjtu8O6/VolbKnYxpyfQIbcf4P99nGjTacY7am0FRa84TrkDNVBHAv46LT51MNrnJ+0=@vger.kernel.org
X-Gm-Message-State: AFuF++laQz4f3CQojQL54DSwJlaDmb3dYAxT2X75ZDKDqU963ysM2JSY
	nAqHFxL8IVReGlxwVHHuM2bAXsoPjEZK6rqcureQtxeQ4Ypf67eWLyagH0mwqd1Q9RW0PwxjZVF
	uOt7KhoyXfyxCGXgS/fkLqCRBOIiPaGcZHGdhCRXEpeh0+lOMTaC46GpoEeU=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1501:b0:6b7:83c5:fdea with SMTP id
 006d021491bc7-6b783c60367mr11036533eaf.43.1788746133211; Sun, 06 Sep 2026
 18:55:33 -0700 (PDT)
Date: Sun, 06 Sep 2026 18:55:33 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9e1995.a5e650b3.26d8a.0024.GAE@google.com>
Subject: [syzbot] [jffs2?] possible deadlock in jffs2_xattr_delete_inode
From: syzbot <syzbot+fdfd8fdf716c90baef0f@syzkaller.appspotmail.com>
To: dwmw2@infradead.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, richard@nod.at, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    940de590b839 Merge tag 'hardening-v7.3-rc2' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11d190f9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=85bc5cc2fc7394d9
dashboard link: https://syzkaller.appspot.com/bug?extid=fdfd8fdf716c90baef0f
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
userspace arch: i386

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-940de590.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/f3f674f98efb/vmlinux-940de590.xz
kernel image: https://storage.googleapis.com/syzbot-assets/132222426e71/bzImage-940de590.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+fdfd8fdf716c90baef0f@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
syzkaller #0 Not tainted
------------------------------------------------------
kswapd0/111 is trying to acquire lock:
ffff8880266529d8 (&c->xattr_sem){++++}-{4:4}, at: jffs2_xattr_delete_inode+0x83/0x130 fs/jffs2/xattr.c:605

but task is already holding lock:
ffffffff8efc8ce0 (fs_reclaim){+.+.}-{0:0}, at: balance_pgdat+0xbce/0x1f00 mm/vmscan.c:7292

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #1 (fs_reclaim){+.+.}-{0:0}:
       lock_acquire kernel/locking/lockdep.c:5908 [inline]
       lock_acquire+0x1d1/0x380 kernel/locking/lockdep.c:5865
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
       ovl_do_setxattr fs/overlayfs/overlayfs.h:324 [inline]
       ovl_setxattr fs/overlayfs/overlayfs.h:336 [inline]
       ovl_make_workdir fs/overlayfs/super.c:724 [inline]
       ovl_get_workdir fs/overlayfs/super.c:836 [inline]
       ovl_fill_super_creds fs/overlayfs/super.c:1449 [inline]
       ovl_fill_super+0x1320/0x5ea0 fs/overlayfs/super.c:1561
       vfs_get_super fs/super.c:1405 [inline]
       get_tree_nodev+0xdd/0x190 fs/super.c:1424
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

-> #0 (&c->xattr_sem){++++}-{4:4}:
       check_prev_add+0xeb/0xe60 kernel/locking/lockdep.c:3181
       check_prevs_add kernel/locking/lockdep.c:3300 [inline]
       validate_chain kernel/locking/lockdep.c:3924 [inline]
       __lock_acquire+0x1492/0x1ec0 kernel/locking/lockdep.c:5254
       lock_acquire kernel/locking/lockdep.c:5908 [inline]
       lock_acquire+0x1d1/0x380 kernel/locking/lockdep.c:5865
       down_write+0x8b/0x1f0 kernel/locking/rwsem.c:1631
       jffs2_xattr_delete_inode+0x83/0x130 fs/jffs2/xattr.c:605
       jffs2_do_clear_inode+0x50/0x470 fs/jffs2/readinode.c:1418
       evict+0x3c2/0xad0 fs/inode.c:822
       iput_final fs/inode.c:2015 [inline]
       iput.part.0+0x989/0x1050 fs/inode.c:2064
       iput+0x35/0x40 fs/inode.c:2030
       dentry_unlink_inode+0x284/0x470 fs/dcache.c:479
       dentry_kill+0x25d/0xc20 fs/dcache.c:826
       finish_dput fs/dcache.c:1001 [inline]
       dput.part.0+0xd7/0x240 fs/dcache.c:1042
       dput+0x1f/0x30 fs/dcache.c:1037
       ovl_destroy_inode+0x3e/0x190 fs/overlayfs/super.c:217
       destroy_inode+0xcb/0x1c0 fs/inode.c:387
       evict+0x599/0xad0 fs/inode.c:846
       iput_final fs/inode.c:2015 [inline]
       iput.part.0+0x989/0x1050 fs/inode.c:2064
       iput+0x35/0x40 fs/inode.c:2030
       dentry_unlink_inode+0x284/0x470 fs/dcache.c:479
       dentry_kill+0x25d/0xc20 fs/dcache.c:826
       shrink_kill fs/dcache.c:1275 [inline]
       shrink_dentry_list+0x1e8/0x310 fs/dcache.c:1292
       prune_dcache_sb+0xea/0x150 fs/dcache.c:1374
       super_cache_scan+0x361/0x5c0 fs/super.c:238
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
                               lock(&c->xattr_sem);
                               lock(fs_reclaim);
  lock(&c->xattr_sem);

 *** DEADLOCK ***

locks held by kswapd0/111: 2, last CPU#2:
 #0: ffffffff8efc8ce0 (fs_reclaim){+.+.}-{0:0}, at: balance_pgdat+0xbce/0x1f00 mm/vmscan.c:7292
 #1: ffff888025eec0e8 (&type->s_umount_key#56){++++}-{4:4}, at: super_trylock_shared fs/super.c:688 [inline]
 #1: ffff888025eec0e8 (&type->s_umount_key#56){++++}-{4:4}, at: super_cache_scan+0x9b/0x5c0 fs/super.c:213

stack backtrace:
CPU: 2 UID: 0 PID: 111 Comm: kswapd0 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_circular_bug.cold+0x178/0x1be kernel/locking/lockdep.c:2059
 check_noncircular+0x146/0x160 kernel/locking/lockdep.c:2191
 check_prev_add+0xeb/0xe60 kernel/locking/lockdep.c:3181
 check_prevs_add kernel/locking/lockdep.c:3300 [inline]
 validate_chain kernel/locking/lockdep.c:3924 [inline]
 __lock_acquire+0x1492/0x1ec0 kernel/locking/lockdep.c:5254
 lock_acquire kernel/locking/lockdep.c:5908 [inline]
 lock_acquire+0x1d1/0x380 kernel/locking/lockdep.c:5865
 down_write+0x8b/0x1f0 kernel/locking/rwsem.c:1631
 jffs2_xattr_delete_inode+0x83/0x130 fs/jffs2/xattr.c:605
 jffs2_do_clear_inode+0x50/0x470 fs/jffs2/readinode.c:1418
 evict+0x3c2/0xad0 fs/inode.c:822
 iput_final fs/inode.c:2015 [inline]
 iput.part.0+0x989/0x1050 fs/inode.c:2064
 iput+0x35/0x40 fs/inode.c:2030
 dentry_unlink_inode+0x284/0x470 fs/dcache.c:479
 dentry_kill+0x25d/0xc20 fs/dcache.c:826
 finish_dput fs/dcache.c:1001 [inline]
 dput.part.0+0xd7/0x240 fs/dcache.c:1042
 dput+0x1f/0x30 fs/dcache.c:1037
 ovl_destroy_inode+0x3e/0x190 fs/overlayfs/super.c:217
 destroy_inode+0xcb/0x1c0 fs/inode.c:387
 evict+0x599/0xad0 fs/inode.c:846
 iput_final fs/inode.c:2015 [inline]
 iput.part.0+0x989/0x1050 fs/inode.c:2064
 iput+0x35/0x40 fs/inode.c:2030
 dentry_unlink_inode+0x284/0x470 fs/dcache.c:479
 dentry_kill+0x25d/0xc20 fs/dcache.c:826
 shrink_kill fs/dcache.c:1275 [inline]
 shrink_dentry_list+0x1e8/0x310 fs/dcache.c:1292
 prune_dcache_sb+0xea/0x150 fs/dcache.c:1374
 super_cache_scan+0x361/0x5c0 fs/super.c:238
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
