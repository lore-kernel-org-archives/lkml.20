Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D404DAF8C
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790953477; cv=none; b=JFEXG04aUTA+OggO82Ebnc1E2LBvBJ3aKPgafOdjmwEVcudVcFZ5eGM1pUeLeP/EL9u8OEAFqrXA1DtoziPe464B69qN4eZATe95DmpAhQpXIYEUs8DUA9JpKhsLIfG4ts31xnYfKi7fnySZwqJEskOQaKqChcgjLm1g41hIsOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790953477; c=relaxed/simple;
	bh=0YbZDESUsWfgnbRayj1aAgjirgqrXJqvfKwQ08lnKaQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Gcn1YtmMvK+APD5aqN3TbaffXrXNtN5Y6ZHIjfPy4U3UV75zBEhW3nLd4e+NzNenMM1mY2pFoearm/nZWNkVuBCXVaT4MXKfKyQtk4lrRzw1xahOqoWSW1fp6FW1IDrrq6o2W/PI21/PDF6zMEI17dNNsvfdxorZoUiMuUz0Dkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4a45b3f0bdfso12325630b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 08:04:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790953474; x=1791558274;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=U+CF/iWFUmI+2f6XnWx36o3ZGO2oTXKXYroPY6WHn34=;
        b=y73RorXKk8g4ABwWnJyMO+yD62NZB2WkOUbaWDBw2uRtwqGImA1d8igAuLuzesAWF1
         zLFl+JckkhxKz8mb4NPSZD1bxY/C/Q1T0kikPDVMKeo/1LtNBfZQBzVudgROmwI0TN/U
         eSuZwt9X+b1c0CKPUrB2HSsI4IZ460gFv3FcfwAGiYLdwyv3RIXtuH6BECT4CYNbzcRr
         yHaWcvzScHakG/AodKuLLfsyAk+hFaPiOFsJchHU8B43BYW53NAa+mVCuTQsv7q1o9OZ
         bqmysuKBXYtS+evuxNQRoJ+t4cTiMk5pY+aTiZcsQqwQ3Dc3a5fn5dT2CvTm88JzPCJ8
         IJ2w==
X-Forwarded-Encrypted: i=1; AKwUvBwop7RgMaGS5vPyK5UHBXcuVwo3nUp6XFn/zg42NBbJ5RsQThHF+uspiiaVjv4bf/8kkwLQ8PXTn1iOl20=@vger.kernel.org
X-Gm-Message-State: AFuF++nKIOWPxoJhR+V7mYK1frBZm5rEihF5s4AHbRP+xA3ZkKokwnw2
	x2tCl/tTO88nSIwh6knJVpbJCo5OqyV4YW1wa5LeolNBZGqztWSLIe+oiI0bEJsBqH8R4MkPQIS
	3GNyR3nWUL5eXlXWO6pXGSwXKG9Me5fj3wvpHqwtF/SfkbYj1N74zP7PGH+8=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:6f8f:b0:4c3:7695:d30 with SMTP id
 5614622812f47-4f528de2df0mr1934942b6e.14.1790953474490; Fri, 02 Oct 2026
 08:04:34 -0700 (PDT)
Date: Fri, 02 Oct 2026 08:04:34 -0700
In-Reply-To: <6a7bfdf7.ed659fcc.23056a.007f.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6abfc802.f32479dd.202a09.000a.GAE@google.com>
Subject: Re: [syzbot] [jffs2?] KASAN: slab-use-after-free Read in jffs2_xattr_delete_inode
From: syzbot <syzbot+3a8099322b09d8d073d1@syzkaller.appspotmail.com>
To: dwmw2@infradead.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, luquijeffrey@gmail.com, richard@nod.at, 
	sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    6474fa070f2b Add linux-next specific files for 20260929
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=11ef6035580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3477d5a04d788556
dashboard link: https://syzkaller.appspot.com/bug?extid=3a8099322b09d8d073d1
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=144b6725580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/0b184b600605/disk-6474fa07.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/71aa06781faf/vmlinux-6474fa07.xz
kernel image: https://storage.googleapis.com/syzbot-assets/250dcdc25f2b/bzImage-6474fa07.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+3a8099322b09d8d073d1@syzkaller.appspotmail.com

RDX: 00000000000001ff RSI: 0000200000000000 RDI: ffffffffffffff9c
RBP: 00007f74b6c3506b R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f74b6e26038 R14: 00007f74b6e25fa0 R15: 00007fff61b089a8
 </TASK>
==================================================================
BUG: KASAN: slab-use-after-free in jffs2_xattr_delete_inode+0x2c8/0x2d0 fs/jffs2/xattr.c:602
Read of size 4 at addr ffff8880325b21a8 by task syz.0.310/6721

CPU: 1 UID: 0 PID: 6721 Comm: syz.0.310 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description+0x55/0x1e0 mm/kasan/report.c:378
 print_report+0x58/0x70 mm/kasan/report.c:482
 kasan_report+0x117/0x150 mm/kasan/report.c:595
 jffs2_xattr_delete_inode+0x2c8/0x2d0 fs/jffs2/xattr.c:602
 jffs2_do_clear_inode+0x58/0x390 fs/jffs2/readinode.c:1418
 evict+0x624/0xb50 fs/inode.c:823
 jffs2_new_inode+0x48a/0xd20 fs/jffs2/fs.c:-1
 jffs2_mkdir+0x189/0xec0 fs/jffs2/dir.c:483
 vfs_mkdir+0x40e/0x630 fs/namei.c:5423
 filename_mkdirat+0x285/0x510 fs/namei.c:5456
 __do_sys_mkdirat fs/namei.c:5477 [inline]
 __se_sys_mkdirat+0x35/0x150 fs/namei.c:5474
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f74b6b9e159
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f74b79b6028 EFLAGS: 00000246 ORIG_RAX: 0000000000000102
RAX: ffffffffffffffda RBX: 00007f74b6e25fa0 RCX: 00007f74b6b9e159
RDX: 00000000000001ff RSI: 0000200000000000 RDI: ffffffffffffff9c
RBP: 00007f74b6c3506b R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f74b6e26038 R14: 00007f74b6e25fa0 R15: 00007fff61b089a8
 </TASK>

Allocated by task 6703:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 unpoison_slab_object mm/kasan/common.c:351 [inline]
 __kasan_slab_alloc+0x6c/0x80 mm/kasan/common.c:377
 kasan_slab_alloc include/linux/kasan.h:253 [inline]
 slab_post_alloc_hook mm/slub.c:4720 [inline]
 slab_alloc_node mm/slub.c:5033 [inline]
 kmem_cache_alloc_noprof+0x2b4/0x600 mm/slub.c:5047
 jffs2_scan_make_ino_cache+0x89/0x1d0 fs/jffs2/scan.c:978
 jffs2_scan_inode_node fs/jffs2/scan.c:1025 [inline]
 jffs2_scan_eraseblock fs/jffs2/scan.c:814 [inline]
 jffs2_scan_medium+0x35ac/0x7240 fs/jffs2/scan.c:151
 jffs2_build_filesystem fs/jffs2/build.c:112 [inline]
 jffs2_do_mount_fs+0x775/0x22b0 fs/jffs2/build.c:416
 jffs2_do_fill_super+0x555/0xc50 fs/jffs2/fs.c:574
 mtd_get_sb+0x192/0x420 drivers/mtd/mtdsuper.c:59
 get_tree_mtd+0x597/0x7d0 drivers/mtd/mtdsuper.c:143
 vfs_get_tree+0x92/0x2a0 fs/super.c:1943
 fc_mount fs/namespace.c:1209 [inline]
 do_new_mount_fc fs/namespace.c:3785 [inline]
 do_new_mount+0x319/0xdc0 fs/namespace.c:3861
 do_mount fs/namespace.c:4194 [inline]
 __do_sys_mount fs/namespace.c:4407 [inline]
 __se_sys_mount+0x31d/0x420 fs/namespace.c:4384
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 5744:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 kasan_save_free_info+0x40/0x50 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:264 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:296
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2780 [inline]
 slab_free mm/slub.c:6630 [inline]
 kmem_cache_free+0x182/0x650 mm/slub.c:6757
 jffs2_free_ino_caches+0xec/0x1c0 fs/jffs2/nodelist.c:497
 jffs2_put_super+0x6c/0x170 fs/jffs2/super.c:335
 generic_shutdown_super+0x13d/0x2d0 fs/super.c:751
 kill_mtd_super+0x23/0x70 drivers/mtd/mtdsuper.c:176
 jffs2_kill_sb+0x96/0xb0 fs/jffs2/super.c:350
 deactivate_locked_super+0xbe/0x110 fs/super.c:586
 cleanup_mnt+0x3d3/0x460 fs/namespace.c:1329
 task_work_run+0x1d9/0x260 kernel/task_work.c:233
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 __exit_to_user_mode_loop kernel/entry/common.c:70 [inline]
 exit_to_user_mode_loop+0x204/0x770 kernel/entry/common.c:101
 __exit_to_user_mode_prepare include/linux/irq-entry-common.h:207 [inline]
 syscall_exit_to_user_mode_prepare include/linux/irq-entry-common.h:230 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:343 [inline]
 do_syscall_64+0x328/0x520 arch/x86/entry/syscall_64.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff8880325b2180
 which belongs to the cache jffs2_inode_cache of size 48
The buggy address is located 40 bytes inside of
 freed 48-byte region [ffff8880325b2180, ffff8880325b21b0)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x325b2
flags: 0xfff00000000000(node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000000 ffff88801e748b40 dead000000000100 dead000000000122
raw: 0000000000000000 0000000200400040 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0xd2cc0(GFP_KERNEL|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5830, tgid 5828 (syz.0.17), ts 89085743032
 set_page_owner include/linux/page_owner.h:33 [inline]
 post_alloc_hook+0x1f9/0x250 mm/page_alloc.c:1854
 prep_new_page mm/page_alloc.c:1862 [inline]
 get_page_from_freelist+0x220f/0x2280 mm/page_alloc.c:3933
 __alloc_frozen_pages_noprof+0x1fc/0x400 mm/page_alloc.c:5441
 alloc_slab_page mm/slub.c:3384 [inline]
 allocate_slab+0x7d/0x5e0 mm/slub.c:3499
 new_slab mm/slub.c:3550 [inline]
 refill_objects+0x2d5/0x350 mm/slub.c:7539
 refill_sheaf mm/slub.c:2917 [inline]
 __pcs_replace_empty_main+0x2c8/0x6c0 mm/slub.c:4811
 alloc_from_pcs mm/slub.c:4887 [inline]
 slab_alloc_node mm/slub.c:5021 [inline]
 kmem_cache_alloc_noprof+0x394/0x600 mm/slub.c:5047
 jffs2_do_read_inode+0x33f/0x6a0 fs/jffs2/readinode.c:1372
 jffs2_iget+0x228/0xcc0 fs/jffs2/fs.c:277
 jffs2_do_fill_super+0x59d/0xc50 fs/jffs2/fs.c:578
 mtd_get_sb+0x192/0x420 drivers/mtd/mtdsuper.c:59
 get_tree_mtd+0x597/0x7d0 drivers/mtd/mtdsuper.c:143
 vfs_get_tree+0x92/0x2a0 fs/super.c:1943
 fc_mount fs/namespace.c:1209 [inline]
 do_new_mount_fc fs/namespace.c:3785 [inline]
 do_new_mount+0x319/0xdc0 fs/namespace.c:3861
 do_mount fs/namespace.c:4194 [inline]
 __do_sys_mount fs/namespace.c:4407 [inline]
 __se_sys_mount+0x31d/0x420 fs/namespace.c:4384
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
page last free pid 15 tgid 15 ts 88711812410 stack trace:
 reset_page_owner include/linux/page_owner.h:26 [inline]
 __free_pages_prepare mm/page_alloc.c:1401 [inline]
 __free_frozen_pages+0xc97/0xd90 mm/page_alloc.c:2952
 __tlb_remove_table_free mm/mmu_gather.c:226 [inline]
 tlb_remove_table_rcu+0x85/0x100 mm/mmu_gather.c:287
 rcu_do_batch kernel/rcu/tree.c:2650 [inline]
 rcu_core+0x926/0x1260 kernel/rcu/tree.c:2919
 handle_softirqs+0x223/0x840 kernel/softirq.c:645
 run_ksoftirqd+0x36/0x60 kernel/softirq.c:1099
 smpboot_thread_fn+0x565/0xa70 kernel/smpboot.c:160
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Memory state around the buggy address:
 ffff8880325b2080: fa fb fb fb fb fb fc fc fa fb fb fb fb fb fc fc
 ffff8880325b2100: fa fb fb fb fb fb fc fc fa fb fb fb fb fb fc fc
>ffff8880325b2180: fa fb fb fb fb fb fc fc fa fb fb fb fb fb fc fc
                                  ^
 ffff8880325b2200: fa fb fb fb fb fb fc fc fa fb fb fb fb fb fc fc
 ffff8880325b2280: fa fb fb fb fb fb fc fc fa fb fb fb fb fb fc fc
==================================================================


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
