Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CFC2EEE7C
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789437784; cv=none; b=sJDFPzqXe/JYrRG6ZdFuYcXAosre+PqleutvIfPVqSGjRbjSrCo27FPrG5ejZfI2rSORH84/OJajqrDBkCqSda8oPDts9Xo2lI9GzEl+70KS5hXO45DVFun8aJyMQq08LUqebS84MvZTPUZYTPPMMb0sNaQLFuIsS7RvzrBX3O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789437784; c=relaxed/simple;
	bh=muEvNcbn5Qi8ij+OgmrWSfzdxVRuTfIP/qfR1KxS1L8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=uujVHFrZ3z5iHH7xweMCqrXw9E6XjbFINU89Ou04UpNmObFp1I7PqvWakeFttaMU0zKWbpKch0A9IamZIQDaq5AfIL7sQmiISeZq4vAs1qkf2LtROWZI/hY9hUV5M6en1dSTs1IX0H86UcxT3glMcfxO/GdacPr1yhL7S9xRwRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6a313ec13ceso6091592eaf.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 19:03:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789437781; x=1790042581;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3prM8VrSU44O1GiG0suhpvRimKKS5KnM1Lm8fUeGeus=;
        b=IUvQKOqAwJLNCIfBeNkRM0SY/g1+Nv8QYp8cA3EdezbcxXuRFBNeAA+q7utlPYlmFh
         4HqLaEcE9rgIHbz0jR8cq8DRGywub8ahqd4L7CK18vR3j71Z4xCfbwHtbOEQOjDkG+Uj
         3t+QTLoioLp04NtQ8BWK8jw/FHjXDlmHW6jb/oF9B3GheoivqQ5EJp9aRFiLQgzUpd8l
         uMQAhNV3xEhg0VZ+JJ0PGaJlbWph70br1WjJCFHbV84XNtlCbhxuXvHgbhOUS9KJxKJy
         waWS/AFFVSZR+pnw6J87osSfJyveMjAxoWETAdfnFolsoB4lQwKoojaDllxA9zWjCAQe
         WC6Q==
X-Forwarded-Encrypted: i=1; AKwUvBzJ3p845XnoSpCCVDXBLc/POVNsMmWCsWu26jEdw1nYZOTroNemj+I7Z9sAa6aBzamn/ZrYA+wYHm6aPYE=@vger.kernel.org
X-Gm-Message-State: AFuF++nFhAzy8alOXBi3pU8uuJO/lxm/8bF6FJHSZSKaWUspUntiSD4x
	sblpeMfWBIoivIY+juITwaignDoQ/i6cw33x3goqrv3P4pC+cSqxKFuMcND5M0PdFZLWqBa1WfG
	chSgX0sGtsvNEEY3CfBYjXuFbJBbjjk+GbTOWYmJZW5XgPkRXopoRMBqakAs=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:f028:b0:6c3:19de:d1ea with SMTP id
 006d021491bc7-6c53fa6f56cmr4904395eaf.6.1789437781676; Mon, 14 Sep 2026
 19:03:01 -0700 (PDT)
Date: Mon, 14 Sep 2026 19:03:01 -0700
In-Reply-To: <6aa8a1b1.9cc10357.125c5.d000SMTPIN_ADDED_BROKEN@gmr-mx.google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa8a755.a211d2ce.1a5198.02a3.GAE@google.com>
Subject: Re: [syzbot] [jfs?] UBSAN: array-index-out-of-bounds in dbFindLeaf (2)
From: syzbot <syzbot+1afe7ef2d0062e19eeb3@syzkaller.appspotmail.com>
To: jchuang26@m.fudan.edu.cn, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
KASAN: use-after-free Read in copy_folio_from_iter_atomic

==================================================================
BUG: KASAN: use-after-free in memcpy_from_iter lib/iov_iter.c:85 [inline]
BUG: KASAN: use-after-free in iterate_bvec include/linux/iov_iter.h:123 [inline]
BUG: KASAN: use-after-free in iterate_and_advance2 include/linux/iov_iter.h:306 [inline]
BUG: KASAN: use-after-free in iterate_and_advance include/linux/iov_iter.h:330 [inline]
BUG: KASAN: use-after-free in __copy_from_iter lib/iov_iter.c:261 [inline]
BUG: KASAN: use-after-free in copy_folio_from_iter_atomic+0xbbf/0x1a30 lib/iov_iter.c:491
Read of size 4096 at addr ffff88803a53c000 by task kworker/u8:23/3166

CPU: 1 UID: 0 PID: 3166 Comm: kworker/u8:23 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/08/2026
Workqueue: loop0 loop_workfn
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description+0x55/0x1e0 mm/kasan/report.c:378
 print_report+0x58/0x70 mm/kasan/report.c:482
 kasan_report+0x117/0x150 mm/kasan/report.c:595
 check_region_inline mm/kasan/generic.c:-1 [inline]
 kasan_check_range+0x264/0x2c0 mm/kasan/generic.c:200
 __asan_memcpy+0x29/0x70 mm/kasan/shadow.c:105
 memcpy_from_iter lib/iov_iter.c:85 [inline]
 iterate_bvec include/linux/iov_iter.h:123 [inline]
 iterate_and_advance2 include/linux/iov_iter.h:306 [inline]
 iterate_and_advance include/linux/iov_iter.h:330 [inline]
 __copy_from_iter lib/iov_iter.c:261 [inline]
 copy_folio_from_iter_atomic+0xbbf/0x1a30 lib/iov_iter.c:491
 generic_perform_write+0x5a8/0x8b0 mm/filemap.c:4392
 shmem_file_write_iter+0xfb/0x120 mm/shmem.c:3440
 lo_rw_aio+0xc78/0xf30 include/linux/percpu-rwsem.h:-1
 do_req_filebacked drivers/block/loop.c:430 [inline]
 loop_handle_cmd drivers/block/loop.c:1949 [inline]
 loop_process_work+0x638/0x11d0 drivers/block/loop.c:1984
 process_one_work kernel/workqueue.c:3396 [inline]
 process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3479
 worker_thread+0x92d/0xe10 kernel/workqueue.c:3560
 kthread+0x38b/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x36 pfn:0x3a53c
flags: 0x80000000000000(node=0|zone=1)
raw: 0080000000000000 ffffea0000c43308 ffffea0001046588 0000000000000000
raw: 0000000000000036 0000000000000000 00000000ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as freed
page last allocated via order 0, migratetype Unmovable, gfp_mask 0xdc0(GFP_KERNEL|__GFP_ZERO), pid 6669, tgid 6668 (syz.0.55), ts 183365717538
 set_page_owner include/linux/page_owner.h:33 [inline]
 post_alloc_hook+0x1f9/0x250 mm/page_alloc.c:1871
 prep_new_page mm/page_alloc.c:1879 [inline]
 get_page_from_freelist+0x2591/0x2600 mm/page_alloc.c:3943
 __alloc_frozen_pages_noprof+0x230/0x5c0 mm/page_alloc.c:5436
 alloc_pages_mpol+0xd4/0x280 mm/mempolicy.c:2486
 alloc_frozen_pages_noprof mm/mempolicy.c:2557 [inline]
 alloc_pages_noprof+0xd2/0x2f0 mm/mempolicy.c:2577
 lbmLogInit fs/jfs/jfs_logmgr.c:1813 [inline]
 lmLogInit+0x357/0x1a20 fs/jfs/jfs_logmgr.c:1267
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
page last free pid 6431 tgid 6431 ts 183464359442 stack trace:
 reset_page_owner include/linux/page_owner.h:26 [inline]
 __free_pages_prepare mm/page_alloc.c:1418 [inline]
 __free_frozen_pages+0xf3d/0x1000 mm/page_alloc.c:2962
 lbmLogShutdown fs/jfs/jfs_logmgr.c:1861 [inline]
 lmLogShutdown+0x44e/0x850 fs/jfs/jfs_logmgr.c:1681
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

Memory state around the buggy address:
 ffff88803a53bf00: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
 ffff88803a53bf80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>ffff88803a53c000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
                   ^
 ffff88803a53c080: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
 ffff88803a53c100: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
==================================================================


Tested on:

commit:         58785836 Merge tag 'nfsd-7.3-1' of git://git.kernel.or..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=146248c9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a8915f6d5e9da1d8
dashboard link: https://syzkaller.appspot.com/bug?extid=1afe7ef2d0062e19eeb3
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=13ca75f9580000

