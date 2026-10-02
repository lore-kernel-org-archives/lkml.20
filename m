Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1DC4EF145
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 17:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790961186; cv=none; b=pA8Fw9TcU2UcegIFd2eAnkkulg8updwcmc6AYg/YNLJofOT6lFaFydlAf6IRTfygwUE21/ys8k/GZ67Qv1jfG1JxMk0E8dVkpaLJgkl25TkmDONmCHjxRyUB97cj7x9FF++4pTmBuvpcL4+u2BhqariJMz5V6lrEOr/T1/PH48U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790961186; c=relaxed/simple;
	bh=ZRLKpvWYF4hg2PfNcYWMwMxmZcPQfZIfYz47dgXwu8Y=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=kXDnnciPFc0pZwbUiexe9M1BVWAbuHUx3Kb4CEwKSH82ap+pjqFZ6gaSjUXx902jpGrUEMaQBBh6+ofO4SvBEur00k99sXjppkhWSOqyRZj9SlQFzgbhhTwfu+7AJLx3b2n7iTwufouRKtYrMwb6H/h6XGPmuudjxcNwtlYMqDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4dc57e2a3f2so12558153b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 10:13:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790961183; x=1791565983;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=r0jQpdJqDTs9G5OnmK3y5qP313gdhV9SoCfWKy20MeA=;
        b=SlkRLiu5cpWx+BX+QVL/xV5co+wmoPx/h2BHZMX8LlI0cTcZ0mWNWVD2d9ZXFx4UtR
         JQUBb8W1Isgoq9pWcCUC9wdj7CJOGPcuvPY1gBfj70vjEVynIQj4ICJJGAdfYs/AAZca
         RvAMmko/TBl2mvqP85+iO3D7vGwgvOVUKXJ95gTTgzzMaEhg1bKSixfISC/KwvstsmPy
         wzfrWjGjZUFeTeaXj928rj5N9HLFLjGWw6XGqkEidlCv8K3y/8mAzZSAyBZI+oUtNZFs
         Vu4LqTJ8izA8z8xm4BLU5W9REF9NFyhMo2QUAIUdZ1e+vFQ2sBFShQh86ptK1MkBg9jY
         AGzg==
X-Forwarded-Encrypted: i=1; AKwUvBxT6sVUMAWlv02+ekKCcitUHDY10AUmqJ7JlAuyxVy0LClreSWA6DGGtgnCq360INLL+ao35eHSr6NfaMw=@vger.kernel.org
X-Gm-Message-State: AFuF++ncnOaxEQtvYFdGKUOkxBn+Ws4nH1zJLaGe/3cPyKy1eMXNJYII
	sHJjk+O5HEoQQNLh2rkRgA+etMhHWOByk3FuLsP7Ewq4L9g8tZq0YYD7Fe/YhOXCXf8FyqbHLIn
	eYN//XxnyqfWamxN+1BzLG2tzL8jW8/SeDrCKXJjcMIXeBrmwdkBO5vSuNIA=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:10d2:b0:4eb:b0b9:2dbe with SMTP id
 5614622812f47-4f67a50d861mr126992b6e.27.1790961183727; Fri, 02 Oct 2026
 10:13:03 -0700 (PDT)
Date: Fri, 02 Oct 2026 10:13:03 -0700
In-Reply-To: <20261002125819.8899-1-kartikey406@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6abfe61f.eb639fcc.2b981.000d.GAE@google.com>
Subject: Re: [syzbot] [nvme?] KASAN: slab-use-after-free Read in nvme_query_zone_info
From: syzbot <syzbot+76c0f0ce8f1e846b4f84@syzkaller.appspotmail.com>
To: kartikey406@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
KASAN: slab-use-after-free Read in nvme_query_zone_info

==================================================================
BUG: KASAN: slab-use-after-free in nvme_query_zone_info+0x4fd/0x6f0 drivers/nvme/host/zns.c:47
Read of size 4 at addr ffff88802ab545f4 by task kworker/u8:33/6006

CPU: 0 UID: 0 PID: 6006 Comm: kworker/u8:33 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/05/2026
Workqueue: async async_run_entry_fn
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x13d/0x4b0 mm/kasan/report.c:482
 kasan_report+0xdf/0x1c0 mm/kasan/report.c:595
 nvme_que
 nvme_query_zone_info+0x4fd/0x6f0 drivers/nvme/host/zns.c:47
 nvme_update_ns_info_block+0x1b2e/0x2af0 drivers/nvme/host/core.c:2433
 nvme_update_ns_info+0xc6/0xd90 drivers/nvme/host/core.c:2556
 nvme_alloc_ns+0x1a9f/0x3e50 drivers/nvme/host/core.c:4296
 nvme_scan_ns+0x79d/0x910 drivers/nvme/host/core.c:4486
 async_run_entry_fn+0x9f/0x580 kernel/async.c:129
 process_one_work+0xac7/0x1b10 kernel/workqueue.c:3396
 process_scheduled_works kernel/workqueue.c:3479 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3560
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Allocated by task 5960:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:409 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:426
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __kmalloc_cache_noprof+0x2f8/0x6d0 mm/slub.c:5563
 _kmalloc_noprof include/linux/slab.h:991 [inline]
 _kzalloc_noprof include/linux/slab.h:1312 [inline]
 nvme_get_effects_log+0x13a/0x280 drivers/nvme/host/core.c:3425
 nvme_alloc_ns_head drivers/nvme/host/core.c:4040 [inline]
 nvme_init_ns_head drivers/nvme/host/core.c:4156 [inline]
 nvme_alloc_ns+0x25f0/0x3e50 drivers/nvme/host/core.c:4270
 nvme_scan_ns+0x79d/0x910 drivers/nvme/host/core.c:4486
 async_run_entry_fn+0x9f/0x580 kernel/async.c:129
 process_one_work+0xac7/0x1b10 kernel/workqueue.c:3396
 process_scheduled_works kernel/workqueue.c:3479 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3560
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Freed by task 6114:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 kasan_save_free_info+0x3b/0x70 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:264 [inline]
 __kasan_slab_free+0x5f/0x80 mm/kasan/common.c:296
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2748 [inline]
 slab_free mm/slub.c:6508 [inline]
 kfree+0x22b/0x6d0 mm/slub.c:6801
 nvme_free_cels drivers/nvme/host/core.c:5170 [inline]
 nvme_free_ctrl+0x1e4/0x6b0 drivers/nvme/host/core.c:5188
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

The buggy address belongs to the object at ffff88802ab54000
 which belongs to the cache kmalloc-4k of size 4096
The buggy address is located 1524 bytes inside of
 freed 4096-byte region [ffff88802ab54000, ffff88802ab55000)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x2ab50
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88801c032140 dead000000000122 0000000000000000
raw: 0000000000000000 0000000000040004 00000000f5000000 0000000000000000
head: 00fff00000000040 ffff88801c032140 dead000000000122 0000000000000000
head: 0000000000000000 0000000000040004 00000000f5000000 0000000000000000
head: 00fff00000000003 fffffffffffffe01 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5960, tgid 5960 (kworker/u8:13), ts 101247514992
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
 _kzalloc_noprof include/linux/slab.h:1312 [inline]
 nvme_alloc_ns_head drivers/nvme/host/core.c:4018 [inline]
 nvme_init_ns_head drivers/nvme/host/core.c:4156 [inline]
 nvme_alloc_ns+0xa55/0x3e50 drivers/nvme/host/core.c:4270
 nvme_scan_ns+0x79d/0x910 drivers/nvme/host/core.c:4486
 async_run_entry_fn+0x9f/0x580 kernel/async.c:129
 process_one_work+0xac7/0x1b10 kernel/workqueue.c:3396
 process_scheduled_works kernel/workqueue.c:3479 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3560
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
page last free pid 6081 tgid 6081 ts 95954222108 stack trace:
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
 __do_kmalloc_node mm/slub.c:5413 [inline]
 __kmalloc_noprof+0x2cc/0x840 mm/slub.c:5439
 _kmalloc_noprof include/linux/slab.h:995 [inline]
 tomoyo_realpath_from_path+0xb6/0x690 security/tomoyo/realpath.c:251
 tomoyo_get_realpath security/tomoyo/file.c:151 [inline]
 tomoyo_path_perm+0x276/0x460 security/tomoyo/file.c:827
 security_inode_getattr+0x116/0x280 security/security.c:1895
 vfs_getattr fs/stat.c:259 [inline]
 vfs_fstat+0x4b/0xe0 fs/stat.c:281
 __do_sys_newfstat+0x8b/0x110 fs/stat.c:551
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffff88802ab54480: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88802ab54500: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff88802ab54580: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                                             ^
 ffff88802ab54600: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88802ab54680: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


Tested on:

commit:         ce1e0223 Merge tag 'devicetree-fixes-for-7.3-2' of git..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=179d0bf5580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7d012d9c67977ee4
dashboard link: https://syzkaller.appspot.com/bug?extid=76c0f0ce8f1e846b4f84
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=104d6035580000

