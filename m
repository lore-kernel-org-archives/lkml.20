Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792826021;
	b=vC/SnbfLZQP0DbZwsVu40cCML6Vmileu4licxO0UvvZqmH25OLLc0GOdhP8MhQ1goP32
	 Tdp7zumvwJcov64NZJXLmTc4nswNbM7Cl3QB4835DcxUIgG8xksMcpD3tIXw07obxm1CB
	 55EoetwaA7FPy+/X4a3oQy6WHiez8KXI5jfgZvneQ7gFvISgPRgtCW+CE+L1lItZMXRXp
	 foBJ4sp/JwhuffM31kAxma8Y2dtryz5W/pJb4JDYqbRFjbDEaWS3V/EMiRVY7QBTZv8br
	 nmnc9Jlzr3YzvjuCVXWfvrw7XpnCuhRd2w2c6vurx+Tdb0eSI8StpKCY5s2lvaYqjqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792826021;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=kNHFNt8SmJ8cd5Z9Sx/36IlbVhmpvjSnWwa8Mn0QAug=;
	b=Evf9mSe8dYY/dyV785GTfgdj2Crjoq3lbLo02yr7KK9MUrN4lHkJyWkI1JwTys+gxNbd
	 2altUjSoSuGSH7GgnUFLLyj4QUeYFxBMrI5G9USUmQscX4++iPD3S8HMIo+cTyM80nKKS
	 sNHET5Mxu4nvS7+cNNDvRmJCzA8OWok/X1YT80qcu9S+Yd5qzIGv4FcP+C+k/lWocRdLI
	 hrh9gLy4lJYMLntnELgqoQeV9DackU7oXAKTpgwXKUdeq1XqTH+VlodghIhnnaWaN6XyU
	 57nVNIm0QLP9Dm20LHKeFuvICbheaqi3W+PGGX+xnhOFoyVjGaxme0n/ye2tyYPBkVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCEE4606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 07:13:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCEE4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4db3db8687fso2338257b6e.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 00:13:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792826020; x=1793430820;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kNHFNt8SmJ8cd5Z9Sx/36IlbVhmpvjSnWwa8Mn0QAug=;
        b=aSl59OCBaqE9Fj+o5/c9Ln2CQ8+qAVpRsfFs5l0OGDSr98IdggNwUmmEp3knKT6hde
         voqiB6jNd/IohCvAqW9WTnAfpuz0tMAZ4dhKsmsRWI67RCou+1Iw8GMo1mWa0EFcnjV9
         KsWwWStEcAAI+i2B3WKgdRL3XuT0rnYbDTXLWjQXnK/nfRe0BhQDgTEKqM6RTJilTTUP
         uoqkG4MTEaJqQGULOfxqBMJPZAPwfgYO6hVrwVS5zNTS1ikfVvhkEe5RGjFBQ8/oJ1XO
         DYogdNV2l41+B0i8mXfgkJkHbFKRrjdYYh9V9hVQx8yccAHYMf4/+xpYg4p0g2kCVIFa
         bMcg==
X-Forwarded-Encrypted: i=1; AKwUvBwjMNMsKFGs0i+VDxihKCQq2ZfUhTLWPAyJgrNV9gorAbo2fTx4/ijP3kQzJ28cS4p/JkqsNYUOO0PRjAY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJzAeouLYwNoKFvGC2S+FSQSrcstLX/YsfP65HCrw/6joq6/UEW
	rZTHeBCQ5I4M6tfaGSb6M3pyWwOP1jM74yf5MNWthbwO3zlvnvw7nGytLO4k1d6obVLwBDSiZkH
	9zjCvWz3mHeWWVr+gj8iOxPrrmMGhcnO6OLGUx0SXFrfJtQWfbWsNH0szeaU=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1205:b0:4fc:5e91:5377 with SMTP id
 5614622812f47-55c0038d63fmr828839b6e.59.1792826019851; Sat, 24 Oct 2026
 00:13:39 -0700 (PDT)
Date: Sat, 24 Oct 2026 00:13:39 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6adc5aa3.4ce6c07b.2dfc0c.0002.GAE@google.com>
Subject: [syzbot] [jffs2?] KASAN: slab-use-after-free Read in jffs2_garbage_collect_thread
From: syzbot <syzbot+ae2d1f6d474e1725bdc0@syzkaller.appspotmail.com>
To: dwmw2@infradead.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, richard@nod.at, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    f47d223627f8 Merge tag 'vfs-7.4-rc1.sync_close' of git://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15f8c121580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b8fd4ba7675545d0
dashboard link: https://syzkaller.appspot.com/bug?extid=ae2d1f6d474e1725bdc0
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/259fe840897d/disk-f47d2236.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/c8fb4bab2404/vmlinux-f47d2236.xz
kernel image: https://storage.googleapis.com/syzbot-assets/e3144718bd67/bzImage-f47d2236.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ae2d1f6d474e1725bdc0@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in rt_spin_lock+0x83/0x400 kernel/locking/spinlock_rt.c:56
Read of size 1 at addr ffff88804f2b02c0 by task jffs2_gcd_mtd0/12364

CPU: 1 UID: 0 PID: 12364 Comm: jffs2_gcd_mtd0 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/07/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description+0x55/0x1e0 mm/kasan/report.c:378
 print_report+0x58/0x70 mm/kasan/report.c:482
 kasan_report+0x117/0x150 mm/kasan/report.c:595
 __kasan_check_byte+0x2a/0x40 mm/kasan/common.c:585
 kasan_check_byte include/linux/kasan.h:402 [inline]
 lock_acquire+0x7d/0x350 kernel/locking/lockdep.c:5916
 rt_spin_lock+0x83/0x400 kernel/locking/spinlock_rt.c:56
 spin_lock include/linux/spinlock_rt.h:45 [inline]
 jffs2_garbage_collect_thread+0x1dc/0x720 fs/jffs2/background.c:94
 kthread+0x38b/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Allocated by task 12363:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:409 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:426
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __kmalloc_cache_noprof+0x3d5/0x680 mm/slub.c:5563
 _kmalloc_noprof include/linux/slab.h:991 [inline]
 _kzalloc_noprof include/linux/slab.h:1312 [inline]
 jffs2_init_fs_context+0x4f/0xc0 fs/jffs2/super.c:314
 alloc_fs_context+0x9a3/0xd00 fs/fs_context.c:295
 do_new_mount+0x177/0xb00 fs/namespace.c:3966
 do_mount fs/namespace.c:4350 [inline]
 __do_sys_mount fs/namespace.c:4566 [inline]
 __se_sys_mount+0x31d/0x420 fs/namespace.c:4543
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 10613:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 kasan_save_free_info+0x40/0x50 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:264 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:296
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2748 [inline]
 slab_free mm/slub.c:6509 [inline]
 kfree+0x1c5/0x6d0 mm/slub.c:6802
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

The buggy address belongs to the object at ffff88804f2b0000
 which belongs to the cache kmalloc-4k of size 4096
The buggy address is located 704 bytes inside of
 freed 4096-byte region [ffff88804f2b0000, ffff88804f2b1000)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x4f2b0
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0x80000000000040(head|node=0|zone=1)
page_type: f5(slab)
raw: 0080000000000040 ffff88813ff44140 dead000000000100 dead000000000122
raw: 0000000000000000 0000000000040004 00000000f5000000 0000000000000000
head: 0080000000000040 ffff88813ff44140 dead000000000100 dead000000000122
head: 0000000000000000 0000000000040004 00000000f5000000 0000000000000000
head: 0080000000000003 fffffffffffffe01 00000000ffffffff 00000000ffffffff
head: 00000007f6daf3f9 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd2820(GFP_ATOMIC|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 157, tgid 157 (kworker/u8:6), ts 576233263105
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
 __do_kmalloc_node mm/slub.c:5413 [inline]
 __kmalloc_node_track_caller_noprof+0x61e/0x7b0 mm/slub.c:5545
 kmalloc_reserve net/core/skbuff.c:637 [inline]
 __alloc_skb+0x2c1/0x7a0 net/core/skbuff.c:715
 alloc_skb include/linux/skbuff.h:1384 [inline]
 nsim_dev_trap_skb_build drivers/net/netdevsim/dev.c:744 [inline]
 nsim_dev_trap_report drivers/net/netdevsim/dev.c:801 [inline]
 nsim_dev_trap_report_work+0x2b1/0xcb0 drivers/net/netdevsim/dev.c:847
 process_one_work kernel/workqueue.c:3396 [inline]
 process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3479
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3560
 kthread+0x38b/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
page last free pid 5567 tgid 5567 ts 576130778544 stack trace:
 reset_page_owner include/linux/page_owner.h:26 [inline]
 __free_pages_prepare mm/page_alloc.c:1418 [inline]
 __free_frozen_pages+0xf8e/0x1070 mm/page_alloc.c:2962
 __slab_free+0x250/0x2a0 mm/slub.c:5823
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x99/0x100 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x148/0x160 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x22/0x80 mm/kasan/common.c:361
 kasan_slab_alloc include/linux/kasan.h:253 [inline]
 slab_post_alloc_hook mm/slub.c:4683 [inline]
 slab_alloc_node mm/slub.c:4996 [inline]
 __kmalloc_cache_noprof+0x353/0x680 mm/slub.c:5559
 _kmalloc_noprof include/linux/slab.h:991 [inline]
 poll_get_entry fs/select.c:168 [inline]
 __pollwait+0x27f/0x430 fs/select.c:223
 poll_wait include/linux/poll.h:45 [inline]
 pipe_poll+0x186/0x5a0 fs/pipe.c:759
 vfs_poll include/linux/poll.h:82 [inline]
 select_poll_one fs/select.c:480 [inline]
 do_select+0x1016/0x1640 fs/select.c:536
 core_sys_select+0x86f/0xb40 fs/select.c:677
 do_pselect fs/select.c:770 [inline]
 __do_sys_pselect6 fs/select.c:809 [inline]
 __se_sys_pselect6+0x267/0x320 fs/select.c:800
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffff88804f2b0180: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88804f2b0200: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff88804f2b0280: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                           ^
 ffff88804f2b0300: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88804f2b0380: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


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
