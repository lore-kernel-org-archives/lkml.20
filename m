Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01EDF352027
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 01:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789609745; cv=none; b=FKdyt8NY6mvZd2KLoYb07mb1pvs/Fn7vfdfvFqRwWSJsiNtBFRsHT47W2UwuTpuhMnhyPwfIuLN4ult1FFd0Kj8Pcf4iePemH1PrJtL6YBWf+BMDJpl+TDlkq0VCV1XyQK6A88V8zHd5IvtkD/AMOLCV3YrgeATevsxtu7SyhS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789609745; c=relaxed/simple;
	bh=+mIOWg0/34eHWQnV3XbW1ER9PIImR24J9j7FXyHsCOs=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=V5dZpCdTQZAMUx2uKPb4jP6iNR1FDF4JzpbuJaRM24UMV/xsc5H01IL7UBV9yXEVas7zZ0srBDct6GvUjO5BLAF0o2UU3kDxyFhdnluun58vFSR+9Z6TDBa7Gt53dOhhyK4zReKC9eZ7N2GWOyY36DEitBoeQud7fdQIrWkahSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7f4e0b45e4bso462064a34.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 18:49:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789609743; x=1790214543;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UTBE/YfKt9zy61P2i9NTCXNry4OVI3+12EHY6o/EHQs=;
        b=b0BxUCR+rQnkkw3EWKOI1YeDMBhcW4WgkDQnt/EQcQELBvBST8Vz07kUfVAPXmJrhR
         UgzUFjWuzEiEGikh6GAbauLIvrLdetJpqdEia3yTnhidryiRcFuaolBtMAyoc418G8mq
         0biO0S4WcY3IS0yxnHSyMKtiL/yWQ2sJPGw3rIQ8eTssW8VJZ3NLC6BwDr4pPkzxOGXY
         jwAe7pZJ5UF5xR8IRjgtkVMjDYnqIaKAmkYrFAD8mROjV+CF8AUiUbI0ZY+iUGVjFFyt
         LWTffxD2dL4DvqCu/51aN1byI3gP2PHrifp2ys2CzCd711poR4Cp+9zx+eblZczaHtBD
         7v7g==
X-Forwarded-Encrypted: i=1; AKwUvBx+EF90H8+x0964g3Tl9L7Gndzp3QPEXC2kXWUjo/6jM2M2m6yg07NmT2tfPsBuTwyZ+Kiq+9RKK1gtJGk=@vger.kernel.org
X-Gm-Message-State: AFuF++lSyxIesYQqdSSQ85KZfh8HsRw+2SJHbb+6U5IgAMRqCdwGDtBI
	gbqsl4paZgbdYsEgYdKfQV58LoTkeoGWwkcI2546d1rCwbtLW7SJ+iIRi/FDCJ78lpOl+SSA7hp
	qQ+YuxmkCKo/M2yVxUvrkvaHJhTptcskV/0psYMmcoNaQbdPG3USbyQvitiw=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2229:b0:6be:b2e3:27e with SMTP id
 006d021491bc7-6c7d0aec6d3mr4654913eaf.16.1789609743013; Wed, 16 Sep 2026
 18:49:03 -0700 (PDT)
Date: Wed, 16 Sep 2026 18:49:02 -0700
In-Reply-To: <6aab422e.d91e0f37.3a5804.cd4fSMTPIN_ADDED_BROKEN@gmr-mx.google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aab470e.b398a7c9.1f86be.0007.GAE@google.com>
Subject: Re: [syzbot] [jfs?] UBSAN: array-index-out-of-bounds in dbFindLeaf (2)
From: syzbot <syzbot+1afe7ef2d0062e19eeb3@syzkaller.appspotmail.com>
To: jchuang26@m.fudan.edu.cn, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
KASAN: slab-use-after-free Read in lbmIODone

==================================================================
BUG: KASAN: slab-use-after-free in lbmIODone+0x130e/0x16b0 fs/jfs/jfs_logmgr.c:2192
Read of size 4 at addr ffff88802babf608 by task ktimers/0/16

CPU: 0 UID: 0 PID: 16 Comm: ktimers/0 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description+0x55/0x1e0 mm/kasan/report.c:378
 print_report+0x58/0x70 mm/kasan/report.c:482
 kasan_report+0x117/0x150 mm/kasan/report.c:595
 lbmIODone+0x130e/0x16b0 fs/jfs/jfs_logmgr.c:2192
 blk_update_request+0x57b/0xe50 block/blk-mq.c:1016
 blk_mq_end_request+0x3e/0x70 block/blk-mq.c:1147
 blk_complete_reqs block/blk-mq.c:1222 [inline]
 blk_done_softirq+0x10a/0x160 block/blk-mq.c:1227
 handle_softirqs+0x1da/0x6d0 kernel/softirq.c:645
 __do_softirq kernel/softirq.c:679 [inline]
 run_ktimerd+0x6a/0x100 kernel/softirq.c:1174
 smpboot_thread_fn+0x565/0xa70 kernel/smpboot.c:160
 kthread+0x38b/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Allocated by task 6752:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __kmalloc_cache_noprof+0x3d5/0x680 mm/slub.c:5563
 _kmalloc_noprof include/linux/slab.h:991 [inline]
 lbmLogInit fs/jfs/jfs_logmgr.c:1819 [inline]
 lmLogInit+0x3e5/0x1a20 fs/jfs/jfs_logmgr.c:1267
 open_inline_log fs/jfs/jfs_logmgr.c:1173 [inline]
 lmLogOpen+0x4e3/0xf90 fs/jfs/jfs_logmgr.c:1067
 jfs_mount_rw+0xf3/0x670 fs/jfs/jfs_mount.c:257
 jfs_fill_super+0x769/0xda0 fs/jfs/super.c:533
 get_tree_bdev_flags+0x430/0x4f0 fs/super.c:1873
 vfs_get_tree+0x92/0x2a0 fs/super.c:1933
 fc_mount fs/namespace.c:1198 [inline]
 do_new_mount_fc fs/namespace.c:3772 [inline]
 do_new_mount+0x319/0xdc0 fs/namespace.c:3848
 do_mount fs/namespace.c:4181 [inline]
 __do_sys_mount fs/namespace.c:4397 [inline]
 __se_sys_mount+0x31d/0x420 fs/namespace.c:4374
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x155/0x510 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 6475:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 kasan_save_free_info+0x40/0x50 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2748 [inline]
 slab_free mm/slub.c:6508 [inline]
 kfree+0x1c5/0x6d0 mm/slub.c:6801
 lbmLogShutdown fs/jfs/jfs_logmgr.c:1862 [inline]
 lmLogShutdown+0x456/0x850 fs/jfs/jfs_logmgr.c:1681
 lmLogClose+0x28c/0x530 fs/jfs/jfs_logmgr.c:1457
 jfs_umount+0x2da/0x3b0 fs/jfs/jfs_umount.c:124
 jfs_put_super+0x8c/0x190 fs/jfs/super.c:194
 generic_shutdown_super+0x13d/0x2d0 fs/super.c:755
 kill_block_super+0x44/0xa0 fs/super.c:1904
 deactivate_locked_super+0xbc/0x110 fs/super.c:589
 cleanup_mnt+0x3d3/0x460 fs/namespace.c:1317
 task_work_run+0x1d9/0x270 kernel/task_work.c:233
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 __exit_to_user_mode_loop kernel/entry/common.c:70 [inline]
 exit_to_user_mode_loop+0x14e/0x570 kernel/entry/common.c:101
 __exit_to_user_mode_prepare include/linux/irq-entry-common.h:207 [inline]
 syscall_exit_to_user_mode_prepare include/linux/irq-entry-common.h:230 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:343 [inline]
 do_syscall_64+0x317/0x510 arch/x86/entry/syscall_64.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff88802babf600
 which belongs to the cache kmalloc-256 of size 256
The buggy address is located 8 bytes inside of
 freed 256-byte region [ffff88802babf600, ffff88802babf700)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffff88802babfc00 pfn:0x2babe
head: order:1 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0x80000000000240(workingset|head|node=0|zone=1)
page_type: f5(slab)
raw: 0080000000000240 ffff88813febeb40 ffffea0000bf8690 ffff88813febd988
raw: ffff88802babfc00 000000000010000e 00000000f5000000 0000000000000000
head: 0080000000000240 ffff88813febeb40 ffffea0000bf8690 ffff88813febd988
head: ffff88802babfc00 000000000010000e 00000000f5000000 0000000000000000
head: 0080000000000001 ffffffffffffff81 00000000ffffffff 00000000ffffffff
head: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000002
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 1, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 6752, tgid 6751 (syz.0.56), ts 258143057879
 set_page_owner include/linux/page_owner.h:33 [inline]
 post_alloc_hook+0x1f9/0x250 mm/page_alloc.c:1871
 prep_new_page mm/page_alloc.c:1879 [inline]
 get_page_from_freelist+0x2591/0x2600 mm/page_alloc.c:3943
 __alloc_frozen_pages_noprof+0x230/0x5c0 mm/page_alloc.c:5436
 alloc_slab_page mm/slub.c:3347 [inline]
 allocate_slab+0x7d/0x620 mm/slub.c:3462
 new_slab mm/slub.c:3513 [inline]
 refill_objects+0x2d8/0x350 mm/slub.c:7417
 refill_sheaf mm/slub.c:2885 [inline]
 __pcs_replace_empty_main+0x339/0x690 mm/slub.c:4774
 alloc_from_pcs mm/slub.c:4850 [inline]
 slab_alloc_node mm/slub.c:4984 [inline]
 __kmalloc_cache_noprof+0x46f/0x680 mm/slub.c:5559
 _kmalloc_noprof include/linux/slab.h:991 [inline]
 lbmLogInit fs/jfs/jfs_logmgr.c:1819 [inline]
 lmLogInit+0x3e5/0x1a20 fs/jfs/jfs_logmgr.c:1267
 open_inline_log fs/jfs/jfs_logmgr.c:1173 [inline]
 lmLogOpen+0x4e3/0xf90 fs/jfs/jfs_logmgr.c:1067
 jfs_mount_rw+0xf3/0x670 fs/jfs/jfs_mount.c:257
 jfs_fill_super+0x769/0xda0 fs/jfs/super.c:533
 get_tree_bdev_flags+0x430/0x4f0 fs/super.c:1873
 vfs_get_tree+0x92/0x2a0 fs/super.c:1933
 fc_mount fs/namespace.c:1198 [inline]
 do_new_mount_fc fs/namespace.c:3772 [inline]
 do_new_mount+0x319/0xdc0 fs/namespace.c:3848
 do_mount fs/namespace.c:4181 [inline]
 __do_sys_mount fs/namespace.c:4397 [inline]
 __se_sys_mount+0x31d/0x420 fs/namespace.c:4374
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x155/0x510 arch/x86/entry/syscall_64.c:84
page last free pid 6132 tgid 6132 ts 257131051219 stack trace:
 reset_page_owner include/linux/page_owner.h:26 [inline]
 __free_pages_prepare mm/page_alloc.c:1418 [inline]
 __free_frozen_pages+0xf3d/0x1000 mm/page_alloc.c:2962
 __slab_free+0x250/0x2a0 mm/slub.c:5823
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x99/0x100 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x148/0x160 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x22/0x80 mm/kasan/common.c:350
 kasan_slab_alloc include/linux/kasan.h:253 [inline]
 slab_post_alloc_hook mm/slub.c:4683 [inline]
 slab_alloc_node mm/slub.c:4996 [inline]
 __do_kmalloc_node mm/slub.c:5413 [inline]
 __kmalloc_noprof+0x3b9/0x790 mm/slub.c:5439
 _kmalloc_noprof include/linux/slab.h:995 [inline]
 tomoyo_realpath_from_path+0xef/0x640 security/tomoyo/realpath.c:251
 tomoyo_get_realpath security/tomoyo/file.c:151 [inline]
 tomoyo_path_number_perm+0x246/0x5f0 security/tomoyo/file.c:728
 security_file_ioctl+0xc3/0x2a0 security/security.c:2512
 __do_sys_ioctl fs/ioctl.c:591 [inline]
 __se_sys_ioctl+0x47/0x170 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x155/0x510 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffff88802babf500: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff88802babf580: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff88802babf600: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                      ^
 ffff88802babf680: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88802babf700: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
==================================================================


Tested on:

commit:         238650ef Merge tag 'powerpc-7.3-4' of git://git.kernel..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=150b93f9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a8915f6d5e9da1d8
dashboard link: https://syzkaller.appspot.com/bug?extid=1afe7ef2d0062e19eeb3
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=115458c9580000

