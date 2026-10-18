Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7823D7D8D
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 18:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792347930; cv=none; b=LeKmSoq6Bm+Knx/BMheXHiVMv1me5bBwdBor3wtKnAXGcBwZvGaAnwhvwRng/k9xC/LdRSInXTaKNphvoia/stbMrSw+mmbKZYIimCeGfho10jmBTjKOyBUuHo2J6eyRvbMOMivHYVcJ3XA2FyU0L1leptQ1xwCjh9h46Vtcr90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792347930; c=relaxed/simple;
	bh=jegQvsSzZeNsOd6vqpdGdfCv1Cp53XvKshV27Ngjhjk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=BYvYy4B1ZNMC+ZQQYdEgj9NahEgMU6FtefpK/hma2jatiRQ1YZ4URtKKAkl9TwMzgr5sAKT8ke8RcOoaHMUxUCt4bdwbksnY5rpSiRZMfQwQyVJe4kT2lqWe6wlyudcAibP3gBzWBpZGtcn6GnQcpshaFN8+vxWyGjuWRwcUh+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4e778acdbc6so2773697b6e.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 11:25:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792347927; x=1792952727;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7fIT9nYfM+8FJB6JoX0Pio4ldgpsa2j8wEWRbRr9es4=;
        b=H74JAONhn2JswuOzX443byHnKehMHjAS9PJrECmZaSsjIIzgzUuRWffT+78sNiSRHq
         a9bmjpSpyqYoiiwI3SH7HHq9LEnTeO7qPlcP26NhqzfiK+SmMkfZA0d4Lwzpb5Q/kMpC
         OFw7wod81Z0qNqpr0UZNhydPYyLGFN1NncBAvB1pTAwHBkXpyWooX/W2XNKycFOk0P0U
         swe5EdUK+McwNJ86As6OsNFq1ZNcDqLMx4SK2ex+A34i2CfikQAibfDv8/WcHRhV2Rmy
         XLleBtdb2bdZ0TRzsFW/XcV28nzqbfAgXg0ZBD3XLfq8efITEeK5iJDkrYOFsDIPGq1e
         /OYA==
X-Forwarded-Encrypted: i=1; AKwUvBwF6NjOy2PB82BhtJTNXD0mRIBWnzylUO5q+sh0Ymx2pH8b+Cpk/v3zCjm7Y8wEwndH3iay2ScWiZlReyA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+2J3vZUrgvdVWDDuBMRI/j5XLRCYIABZEmelWpvH3bg3RYFmO
	WSdzAxvRCSm+a/H751A6ck0zqELcWOmWXMHvpkZoqihLiI7vPqelwFtkZD/9c+rARJIkKOCcX6L
	HgB7Dx8aFQclieHh4jW89Px0JSUPYdFo1uxOE4kKCfa8fAfLN5SamTi8rzpE=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:f87:b0:4eb:80c0:f4bc with SMTP id
 5614622812f47-53ccd5e64e4mr4216643b6e.10.1792347927652; Sun, 18 Oct 2026
 11:25:27 -0700 (PDT)
Date: Sun, 18 Oct 2026 11:25:27 -0700
In-Reply-To: <6a7bfdf7.ed659fcc.23056a.007f.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad50f17.6814cce4.34c49f.010f.GAE@google.com>
Subject: Re: [syzbot] [jffs2?] KASAN: slab-use-after-free Read in jffs2_xattr_delete_inode
From: syzbot <syzbot+3a8099322b09d8d073d1@syzkaller.appspotmail.com>
To: dwmw2@infradead.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, luquijeffrey@gmail.com, richard@nod.at, 
	sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    32c52ec87d62 x86/insn-eval: Fix shadowed segment index in ..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=17065495580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b38d39c45202f4fa
dashboard link: https://syzkaller.appspot.com/bug?extid=3a8099322b09d8d073d1
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17684bc9580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+3a8099322b09d8d073d1@syzkaller.appspotmail.com

R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f7e4a6b6038 R14: 00007f7e4a6b5fa0 R15: 00007ffd3d272cc8
 </TASK>
==================================================================
BUG: KASAN: slab-use-after-free in jffs2_xattr_delete_inode+0x2c8/0x2d0 fs/jffs2/xattr.c:602
Read of size 4 at addr ffff888036a21728 by task syz.0.252/7233

CPU: 0 UID: 0 PID: 7233 Comm: syz.0.252 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/07/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description+0x55/0x1e0 mm/kasan/report.c:378
 print_report+0x58/0x70 mm/kasan/report.c:482
 kasan_report+0x117/0x150 mm/kasan/report.c:595
 jffs2_xattr_delete_inode+0x2c8/0x2d0 fs/jffs2/xattr.c:602
 jffs2_do_clear_inode+0x58/0x390 fs/jffs2/readinode.c:1418
 evict+0x624/0xb50 fs/inode.c:822
 jffs2_new_inode+0x49c/0xd40 fs/jffs2/fs.c:-1
 jffs2_mkdir+0x189/0xec0 fs/jffs2/dir.c:483
 vfs_mkdir+0x408/0x620 fs/namei.c:5409
 filename_mkdirat+0x289/0x520 fs/namei.c:5442
 __do_sys_mkdirat fs/namei.c:5463 [inline]
 __se_sys_mkdirat+0x35/0x150 fs/namei.c:5460
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f7e4a42e159
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f7e49a8e028 EFLAGS: 00000246 ORIG_RAX: 0000000000000102
RAX: ffffffffffffffda RBX: 00007f7e4a6b5fa0 RCX: 00007f7e4a42e159
RDX: 00000000000001ff RSI: 0000200000000000 RDI: ffffffffffffff9c
RBP: 00007f7e4a4c506b R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f7e4a6b6038 R14: 00007f7e4a6b5fa0 R15: 00007ffd3d272cc8
 </TASK>

Allocated by task 7215:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 unpoison_slab_object mm/kasan/common.c:351 [inline]
 __kasan_slab_alloc+0x6c/0x80 mm/kasan/common.c:377
 kasan_slab_alloc include/linux/kasan.h:253 [inline]
 slab_post_alloc_hook mm/slub.c:4683 [inline]
 slab_alloc_node mm/slub.c:4996 [inline]
 kmem_cache_alloc_noprof+0x360/0x690 mm/slub.c:5010
 jffs2_scan_make_ino_cache+0x89/0x1d0 fs/jffs2/scan.c:978
 jffs2_sum_process_sum_data fs/jffs2/summary.c:418 [inline]
 jffs2_sum_scan_sumnode+0x49d/0x2870 fs/jffs2/summary.c:640
 jffs2_scan_eraseblock fs/jffs2/scan.c:546 [inline]
 jffs2_scan_medium+0x807/0x70c0 fs/jffs2/scan.c:151
 jffs2_build_filesystem fs/jffs2/build.c:112 [inline]
 jffs2_do_mount_fs+0x775/0x22c0 fs/jffs2/build.c:416
 jffs2_do_fill_super+0x555/0xc50 fs/jffs2/fs.c:574
 mtd_get_sb+0x18a/0x410 drivers/mtd/mtdsuper.c:57
 get_tree_mtd+0x597/0x7d0 drivers/mtd/mtdsuper.c:141
 vfs_get_tree+0x92/0x2a0 fs/super.c:1932
 fc_mount fs/namespace.c:1282 [inline]
 do_new_mount_fc fs/namespace.c:3898 [inline]
 do_new_mount+0x325/0xb00 fs/namespace.c:3974
 do_mount fs/namespace.c:4338 [inline]
 __do_sys_mount fs/namespace.c:4556 [inline]
 __se_sys_mount+0x31d/0x420 fs/namespace.c:4533
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 6374:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 kasan_save_free_info+0x40/0x50 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:264 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:296
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2748 [inline]
 slab_free mm/slub.c:6509 [inline]
 kmem_cache_free+0x187/0x6d0 mm/slub.c:6636
 jffs2_free_ino_caches+0xec/0x1c0 fs/jffs2/nodelist.c:497
 jffs2_put_super+0x6c/0x170 fs/jffs2/super.c:335
 generic_shutdown_super+0x13d/0x2d0 fs/super.c:751
 kill_mtd_super+0x23/0x70 drivers/mtd/mtdsuper.c:174
 jffs2_kill_sb+0x96/0xb0 fs/jffs2/super.c:350
 deactivate_locked_super+0xbe/0x110 fs/super.c:586
 cleanup_mnt+0x204/0x2a0 fs/namespace.c:1396
 task_work_run+0x1d9/0x270 kernel/task_work.c:233
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 __exit_to_user_mode_loop kernel/entry/common.c:70 [inline]
 exit_to_user_mode_loop+0x204/0x770 kernel/entry/common.c:101
 __exit_to_user_mode_prepare include/linux/irq-entry-common.h:207 [inline]
 syscall_exit_to_user_mode_prepare include/linux/irq-entry-common.h:230 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:343 [inline]
 do_syscall_64+0x328/0x520 arch/x86/entry/syscall_64.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff888036a21700
 which belongs to the cache jffs2_inode_cache of size 48
The buggy address is located 40 bytes inside of
 freed 48-byte region [ffff888036a21700, ffff888036a21730)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x36a21
flags: 0x80000000000000(node=0|zone=1)
page_type: f5(slab)
raw: 0080000000000000 ffff88801ef9c3c0 dead000000000100 dead000000000122
raw: 0000000000000000 0000000200400040 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0xd2cc0(GFP_KERNEL|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 6518, tgid 6517 (syz.0.17), ts 167124265480
 set_page_owner include/linux/page_owner.h:33 [inline]
 post_alloc_hook+0x1f9/0x250 mm/page_alloc.c:1871
 prep_new_page mm/page_alloc.c:1879 [inline]
 get_page_from_freelist+0x2591/0x2600 mm/page_alloc.c:3943
 __alloc_frozen_pages_noprof+0x230/0x5c0 mm/page_alloc.c:5436
 alloc_slab_page mm/slub.c:3347 [inline]
 allocate_slab+0x7d/0x620 mm/slub.c:3462
 new_slab mm/slub.c:3513 [inline]
 refill_objects+0x2d8/0x350 mm/slub.c:7418
 refill_sheaf mm/slub.c:2885 [inline]
 __pcs_replace_empty_main+0x339/0x690 mm/slub.c:4774
 alloc_from_pcs mm/slub.c:4850 [inline]
 slab_alloc_node mm/slub.c:4984 [inline]
 kmem_cache_alloc_noprof+0x45d/0x690 mm/slub.c:5010
 jffs2_do_new_inode+0x27/0x500 fs/jffs2/write.c:28
 jffs2_new_inode+0x46e/0xd40 fs/jffs2/fs.c:466
 jffs2_mkdir+0x189/0xec0 fs/jffs2/dir.c:483
 vfs_mkdir+0x408/0x620 fs/namei.c:5409
 filename_mkdirat+0x289/0x520 fs/namei.c:5442
 __do_sys_mkdirat fs/namei.c:5463 [inline]
 __se_sys_mkdirat+0x35/0x150 fs/namei.c:5460
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
page last free pid 5649 tgid 5649 ts 149814430617 stack trace:
 reset_page_owner include/linux/page_owner.h:26 [inline]
 __free_pages_prepare mm/page_alloc.c:1418 [inline]
 __free_frozen_pages+0xf8e/0x1070 mm/page_alloc.c:2962
 kasan_depopulate_vmalloc_pte+0x6d/0x90 mm/kasan/shadow.c:484
 apply_to_pte_range mm/memory.c:3470 [inline]
 apply_to_pmd_range mm/memory.c:3514 [inline]
 apply_to_pud_range mm/memory.c:3550 [inline]
 apply_to_p4d_range mm/memory.c:3586 [inline]
 __apply_to_page_range+0xbd8/0x1420 mm/memory.c:3622
 __kasan_release_vmalloc+0xa2/0xd0 mm/kasan/shadow.c:602
 kasan_release_vmalloc include/linux/kasan.h:593 [inline]
 kasan_release_vmalloc_node mm/vmalloc.c:2306 [inline]
 purge_vmap_node+0x220/0x960 mm/vmalloc.c:2328
 __purge_vmap_area_lazy+0x783/0xb40 mm/vmalloc.c:2418
 drain_vmap_area_work+0x27/0x40 mm/vmalloc.c:2452
 process_one_work kernel/workqueue.c:3396 [inline]
 process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3479
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3560
 kthread+0x38b/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Memory state around the buggy address:
 ffff888036a21600: fa fb fb fb fb fb fc fc fa fb fb fb fb fb fc fc
 ffff888036a21680: fa fb fb fb fb fb fc fc fa fb fb fb fb fb fc fc
>ffff888036a21700: fa fb fb fb fb fb fc fc fa fb fb fb fb fb fc fc
                                  ^
 ffff888036a21780: fa fb fb fb fb fb fc fc fa fb fb fb fb fb fc fc
 ffff888036a21800: fa fb fb fb fb fb fc fc fa fb fb fb fb fb fc fc
==================================================================


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
