Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B76E247280
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 01:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790905052; cv=none; b=pNdpzsFEhYCvLG0NqJjquLHi7zLSN2KD4VD7EH6dtxxPBHS/jy0Xpiod8qeO36ZcuV+I9YFYm6pb2gB7/yx3XGAKyXDEnhMoLlTghgT3U+LhBYdAWDMXCj9IjzZdQMBwkSu6nHuVe90vkkm/z/uD6PGTfBIXsabXIAk79iutdP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790905052; c=relaxed/simple;
	bh=yUAC/5VsxeWve7cnT8ouSGtp/dbrg+oflB6NdwSHnYQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=ZlJaSwrS1zGa9k0eHmxEmYpSFRXJqGmnO8ym1BHGmJ6Gg7Oj2konp1zSamB+GHi8mC0DQAEx/fYUlr1DaswM9zgZRJJfv3+UGIP+kX1p/t3EIrh1Nzx8sfkk/D1iVf7VmmFjKS+bBt3wm2KHoF0OjeH52w7dM7CLv4dIOH12yq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4eb0b989f0eso2581522b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 18:37:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790905049; x=1791509849;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vsMU2tbyBwgu3R71DI4hbY4+W8irSZULn5e09aRfibg=;
        b=G7otqKnKBMogmD/46nYStUrvu4RjPB4Tk5jdixYiizXkZxZFo33enb7OY7agl5cY3W
         dVbr9VWzqCwXMEW9aT/1ju5ORZYvaYu98smc7cvI4epDmWCXog/7a565PnIlbWAYDLj7
         +i94pabDs2viMiuymu8GUFT9GEiGZOxaku3BTpjpLLXcpEX3SVGGSlRx35vZiQymMgmF
         oyiSQS9Qc6zGJ9UhpBvB/jS9Sm/v18FjBPfbKu9NENBjGJTORnBA32k16OMDzbpIKkl/
         ICbvPRzgjv46+CIH58AGVHCx8KfQdewrTGcG1Hp5hMs45x6xDvQvBjZ5gPnoGuOmg6hG
         ZLeg==
X-Forwarded-Encrypted: i=1; AKwUvBzom+cxjyrPCk2kz82R5/h2KZbqVkhygN/KQ75H6fjwR3pxSijqGQtqZ9iQv4TOFfpq92BuE6uPaAH3pDc=@vger.kernel.org
X-Gm-Message-State: AFuF++mynwuzdLiIrphq9XgDcZZA+s8psBHXxx5HBZsZrmfhcKI1mJeB
	8IqQT04iKeq9zurcapweG2FBdiaSepgh+EA3B69Oi6sXrIrBIQA3YDa1E4OS91VAbN0iW8uFAxa
	L9OBGkIhpTIaj3bEIIVK4AXrz1gp1ryPz5XFgB//m2+mMJ8GDGzLGuXysgEo=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:23cc:b0:4d6:9133:cfe1 with SMTP id
 5614622812f47-4f30b6ff3f7mr4192828b6e.38.1790905049307; Thu, 01 Oct 2026
 18:37:29 -0700 (PDT)
Date: Thu, 01 Oct 2026 18:37:29 -0700
In-Reply-To: <6abf0753.eb639fcc.2b981.0008.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6abf0ad9.7503fbd6.2d3f6.0013.GAE@google.com>
Subject: Re: [syzbot] [nvme?] KASAN: slab-use-after-free Read in nvme_query_zone_info
From: syzbot <syzbot+76c0f0ce8f1e846b4f84@syzkaller.appspotmail.com>
To: axboe@kernel.dk, hch@lst.de, kbusch@kernel.org, 
	linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org, 
	sagi@grimberg.me, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    d24e8ac715de Merge tag 'net-7.3-rc6' of git://git.kernel.o..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=16c2d3f5580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7d012d9c67977ee4
dashboard link: https://syzkaller.appspot.com/bug?extid=76c0f0ce8f1e846b4f84
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17a1cbf5580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+76c0f0ce8f1e846b4f84@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in nvme_query_zone_info+0x4fd/0x6f0 drivers/nvme/host/zns.c:47
Read of size 4 at addr ffff88803745a5f4 by task kworker/u8:13/5985

CPU: 0 UI
CPU: 0 UID: 0 PID: 5985 Comm: kworker/u8:13 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/05/2026
Workqueue: async async_run_entry_fn
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x13d/0x4b0 mm/kasan/report.c:482
 kasan_report+0xdf/0x1c0 mm/kasan/report.c:595
 nvme_query_zone_info+0x4fd/0x6f0 drivers/nvme/host/zns.c:47
 nvme_update_ns_info_block+0x1b2e/0x2af0 drivers/nvme/host/core.c:2430
 nvme_update_ns_info+0xc6/0xd90 drivers/nvme/host/core.c:2553
 nvme_alloc_ns+0x1a9f/0x3e50 drivers/nvme/host/core.c:4293
 nvme_scan_ns+0x79d/0x910 drivers/nvme/host/core.c:4483
 async_run_entry_fn+0x9f/0x580 kernel/async.c:129
 process_one_work+0xac7/0x1b10 kernel/workqueue.c:3396
 process_scheduled_works kernel/workqueue.c:3479 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3560
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Allocated by task 13:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:409 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:426
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __kmalloc_cache_noprof+0x2f8/0x6d0 mm/slub.c:5563
 _kmalloc_noprof include/linux/slab.h:991 [inline]
 _kzalloc_noprof include/linux/slab.h:1312 [inline]
 nvme_get_effects_log+0x13a/0x280 drivers/nvme/host/core.c:3422
 nvme_alloc_ns_head drivers/nvme/host/core.c:4037 [inline]
 nvme_init_ns_head drivers/nvme/host/core.c:4153 [inline]
 nvme_alloc_ns+0x25f0/0x3e50 drivers/nvme/host/core.c:4267
 nvme_scan_ns+0x79d/0x910 drivers/nvme/host/core.c:4483
 async_run_entry_fn+0x9f/0x580 kernel/async.c:129
 process_one_work+0xac7/0x1b10 kernel/workqueue.c:3396
 process_scheduled_works kernel/workqueue.c:3479 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3560
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Freed by task 5948:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 kasan_save_free_info+0x3b/0x70 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:264 [inline]
 __kasan_slab_free+0x5f/0x80 mm/kasan/common.c:296
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2748 [inline]
 slab_free mm/slub.c:6508 [inline]
 kfree+0x22b/0x6d0 mm/slub.c:6801
 nvme_free_cels drivers/nvme/host/core.c:5165 [inline]
 nvme_free_ctrl+0x1e4/0x6b0 drivers/nvme/host/core.c:5183
 device_release+0xd2/0x270 drivers/base/core.c:2640
 kobject_cleanup lib/kobject.c:689 [inline]
 kobject_release lib/kobject.c:720 [inline]
 kref_put include/linux/kref.h:65 [inline]
 kobject_put+0x1f7/0x640 lib/kobject.c:737
 put_device+0x1f/0x30 drivers/base/core.c:3884
 nvme_sysfs_delete+0xc9/0xf0 drivers/nvme/host/sysfs.c:500
 dev_attr_store+0x58/0x80 drivers/base/core.c:2509
 sysfs_kf_write+0xf2/0x150 fs/sysfs/file.c:145
 kernfs_fop_write_iter+0x3e0/0x5f0 fs/kernfs/file.c:345
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6af/0x1050 fs/read_write.c:687
 ksys_write+0x12a/0x250 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff88803745a000
 which belongs to the cache kmalloc-4k of size 4096
The buggy address is located 1524 bytes inside of
 freed 4096-byte region [ffff88803745a000, ffff88803745b000)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x37458
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88801c032140 dead000000000100 dead000000000122
raw: 0000000000000000 0000000000040004 00000000f5000000 0000000000000000
head: 00fff00000000040 ffff88801c032140 dead000000000100 dead000000000122
head: 0000000000000000 0000000000040004 00000000f5000000 0000000000000000
head: 00fff00000000003 fffffffffffffe01 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd2040(__GFP_IO|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 4974, tgid 4974 (udevd), ts 23285385277
 set_page_owner include/linux/page_owner.h:33 [inline]
 post_alloc_hook+0xfd/0x120 mm/page_alloc.c:1871
 prep_new_page mm/page_alloc.c:1879 [inline]
 get_page_from_freelist+0x110d/0x35d0 mm/page_alloc.c:3943
 __alloc_frozen_pages_noprof+0x2eb/0x3300 mm/page_alloc.c:5436
 alloc_slab_page mm/slub.c:3347 [inline]
 allocate_slab mm/slub.c:3462 [inline]
 new_slab+0xa9/0x6e0 mm/slub.c:3513
 refill_objects+0xe3/0x410 mm/slub.c:7417
 refill_sheaf mm/slub.c:2885 [inline]
 __pcs_replace_empty_main+0x35e/0x650 mm/slub.c:4774
 alloc_from_pcs mm/slub.c:4850 [inline]
 slab_alloc_node mm/slub.c:4984 [inline]
 __do_kmalloc_node mm/slub.c:5413 [inline]
 __kmalloc_noprof+0x67c/0x840 mm/slub.c:5439
 _kmalloc_noprof include/linux/slab.h:995 [inline]
 tomoyo_realpath_from_path+0xb6/0x690 security/tomoyo/realpath.c:251
 tomoyo_get_realpath security/tomoyo/file.c:151 [inline]
 tomoyo_check_open_permission+0x2af/0x3c0 security/tomoyo/file.c:776
 tomoyo_file_open+0x6b/0x90 security/tomoyo/tomoyo.c:334
 security_file_open+0xb5/0x1e0 security/security.c:2739
 do_dentry_open+0x588/0x14d0 fs/open.c:973
 vfs_open+0x82/0x3f0 fs/open.c:1101
 do_open fs/namei.c:4837 [inline]
 path_openat+0x19fa/0x2440 fs/namei.c:5000
 do_file_open+0x20e/0x430 fs/namei.c:5029
 do_sys_openat2+0x10f/0x1e0 fs/open.c:1417
page last free pid 4967 tgid 4967 ts 22520049234 stack trace:
 reset_page_owner include/linux/page_owner.h:26 [inline]
 __free_pages_prepare mm/page_alloc.c:1418 [inline]
 __free_frozen_pages+0x79f/0x10f0 mm/page_alloc.c:2962
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x47/0xf0 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x1a0/0x1f0 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x69/0x90 mm/kasan/common.c:361
 kasan_slab_alloc include/linux/kasan.h:253 [inline]
 slab_post_alloc_hook mm/slub.c:4683 [inline]
 slab_alloc_node mm/slub.c:4996 [inline]
 kmem_cache_alloc_noprof+0x269/0x6a0 mm/slub.c:5010
 alloc_filename fs/namei.c:147 [inline]
 do_getname+0x35/0x390 fs/namei.c:187
 class_filename_flags_constructor include/linux/fs.h:2586 [inline]
 do_sys_openat2+0xc7/0x1e0 fs/open.c:1416
 do_sys_open fs/open.c:1423 [inline]
 __do_sys_openat fs/open.c:1439 [inline]
 __se_sys_openat fs/open.c:1434 [inline]
 __x64_sys_openat+0x12d/0x210 fs/open.c:1434
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffff88803745a480: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88803745a500: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff88803745a580: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                                             ^
 ffff88803745a600: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88803745a680: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
