Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819E615E5DC
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 02:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789869752; cv=none; b=W6TBjk3yksOZmPxtTsjbV/lrEJJC7/2gtiwFjpC3BAvUtskaASSISB4hqezyAX8kXq3pP47Q9XJS0wKQY2KngZ6MboX4TBs30/pSPqY2caL7vXaKwtXe+MdmM67Chrcs7UzOwzClRYk7acoNvMnx/aCLFJb6jNTWjqFQ9kDEZuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789869752; c=relaxed/simple;
	bh=9uSa/hm1ymxon1IRVtj0oZVesExXdByn6Dxh1jkM0Eo=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=ahu6LL9vRsY4pvRXXK7R1bAVkrgZkIWsiE5Qu0bae1OXT4XzX1H+o4FYtE2H0rbLokmJKo5geUE0po6uAxt84y6MQbarHjqBR24fK5J0giPUnjdOQrJx3QQCWh831QaGjKSda3t7jmAckfGnIVxGqhxqbMlX1JCfoVDN+ko25DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6c2474b64bbso2522775eaf.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 19:02:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789869749; x=1790474549;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X+4ycWhQtc8KNt7Sd5hkOb35v5kZlN0yeq4JM6q0nHg=;
        b=jZ9dS9JvDn+ESYA9msMGl5UV0nfks4cRtEpvXVmxARq5HTkZX/SqoT6nl3bhiWl583
         3SpVb/E5zNQGDcKfZIOlmGAr6/54/W9Nfw+imuSh/n4k7zDbw1czh1mKvHD+SASSbPOp
         +y/g3hYBBCCkXGGEfvA5zw2xVxjKqxCDP1D3twsdNvsckMLFrvSSv+/Ib5qrO+UA3xO1
         PKhkokd10Mm6DQFZr8aFq1o4Rx2MUpyZPsnUTkXwLrqkP4yUUg7p4S99CF3BTMYXKkcC
         1DF/boni6D6uYh3+hzCZRvIT2xS+KPfny5C0KaDjrUGChZ3C1bo6A3T8/VHQqz5J9Ot6
         gZlw==
X-Gm-Message-State: AFuF++lj9TAAr4M0/JSF5b4v4tazyAEFIw6v1MyEl3p5dlX/+k2Uvt33
	6kxhPwRVJ7wwGXQXbXwgrO8HVac6S2I40EmY1h5EIwnTArSbcpsvS5Z4QhbNq2Ld+KC9HxIxgjy
	xeq+7EKcanw7o6Gr/yIy9FsJ272YQqBuFKtBn0o5/yq4yaYjzPMwmdMtw6rk=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:3104:b0:6b3:6bc7:2ea7 with SMTP id
 006d021491bc7-6ca9a63e159mr5644098eaf.7.1789869749364; Sat, 19 Sep 2026
 19:02:29 -0700 (PDT)
Date: Sat, 19 Sep 2026 19:02:29 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aaf3eb5.3179f8cd.1e36b2.0006.GAE@google.com>
Subject: [syzbot] KASAN: slab-use-after-free Read in fcloop_rport_lsrqst_work
From: syzbot <syzbot+77955102efac681ec73b@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    518e5b794c06 Merge tag 'for-7.3-rc3-tag' of git://git.kern..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=15045ff9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=84649d3ff8d550cb
dashboard link: https://syzkaller.appspot.com/bug?extid=77955102efac681ec73b
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1210d915580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+77955102efac681ec73b@syzkaller.appspotmail.com

nvmet_fc: {0:0}: Association deleted
nvmet_fc: {0:0}: Association freed
==================================================================
BUG: KASAN: slab-use-after-free in fcloop_rport_lsrqst_work+0x242/0x2e0 drivers/nvme/target/fcloop.c:342
Read of size 8 at addr ffff8880234fdc38 by task kworker/u33:6/188

CPU: 3 UID: 0 PID: 188 Comm: kworker/u33:6 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Workqueue: nvmet-wq fcloop_tport_lsrqst_work
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x13d/0x4b0 mm/kasan/report.c:482
 kasan_report+0xdf/0x1c0 mm/kasan/report.c:595
 fcloop_rport_lsrqst_work+0x242/0x2e0 drivers/nvme/target/fcloop.c:342
 process_one_work+0xac7/0x1b10 kernel/workqueue.c:3396
 process_scheduled_works kernel/workqueue.c:3479 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3560
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Allocated by task 188:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __do_kmalloc_node mm/slub.c:5414 [inline]
 __kmalloc_noprof+0x32f/0x840 mm/slub.c:5439
 _kmalloc_noprof include/linux/slab.h:995 [inline]
 _kzalloc_noprof include/linux/slab.h:1312 [inline]
 nvmet_fc_xmt_disconnect_assoc drivers/nvme/target/fc.c:489 [inline]
 nvmet_fc_target_assoc_free+0xbd5/0x2220 drivers/nvme/target/fc.c:1177
 kref_put include/linux/kref.h:65 [inline]
 nvmet_fc_tgt_a_put drivers/nvme/target/fc.c:1195 [inline]
 nvmet_fc_delete_assoc_work.cold+0x118/0x144 drivers/nvme/target/fc.c:1068
 process_one_work+0xac7/0x1b10 kernel/workqueue.c:3396
 process_scheduled_works kernel/workqueue.c:3479 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3560
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Freed by task 6009:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 kasan_save_free_info+0x3b/0x70 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5f/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2748 [inline]
 slab_free mm/slub.c:6508 [inline]
 kfree+0x22b/0x6d0 mm/slub.c:6801
 nvmet_fc_free_pending_reqs drivers/nvme/target/fc.c:1619 [inline]
 nvmet_fc_unregister_targetport+0x351/0x760 drivers/nvme/target/fc.c:1651
 __targetport_unreg drivers/nvme/target/fcloop.c:1600 [inline]
 fcloop_delete_target_port+0x185/0x1f0 drivers/nvme/target/fcloop.c:1630
 dev_attr_store+0x58/0x80 drivers/base/core.c:2509
 sysfs_kf_write+0xf2/0x150 fs/sysfs/file.c:145
 kernfs_fop_write_iter+0x3e0/0x5f0 fs/kernfs/file.c:345
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6af/0x1050 fs/read_write.c:687
 ksys_write+0x12a/0x250 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff8880234fdc00
 which belongs to the cache kmalloc-256 of size 256
The buggy address is located 56 bytes inside of
 freed 256-byte region [ffff8880234fdc00, ffff8880234fdd00)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x234fc
head: order:1 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88801c042b40 dead000000000100 dead000000000122
raw: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
head: 00fff00000000040 ffff88801c042b40 dead000000000100 dead000000000122
head: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
head: 00fff00000000001 ffffffffffffff81 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000002
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 1, migratetype Unmovable, gfp_mask 0xd2040(__GFP_IO|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5742, tgid 5742 (udevd), ts 51615023593
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
 _kmalloc_array_noprof include/linux/slab.h:1211 [inline]
 security_inode_init_security+0x113/0x370 security/security.c:1347
 shmem_mknod+0x2ce/0x480 mm/shmem.c:3838
 lookup_open+0x1255/0x1990 fs/namei.c:4567
 open_last_lookups fs/namei.c:4767 [inline]
 path_openat+0xa2c/0x2440 fs/namei.c:4997
 do_file_open+0x20e/0x430 fs/namei.c:5029
 do_sys_openat2+0x10f/0x1e0 fs/open.c:1417
 do_sys_open fs/open.c:1423 [inline]
 __do_sys_openat fs/open.c:1439 [inline]
 __se_sys_openat fs/open.c:1434 [inline]
 __x64_sys_openat+0x12d/0x210 fs/open.c:1434
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
page last free pid 29 tgid 29 ts 51596759354 stack trace:
 reset_page_owner include/linux/page_owner.h:26 [inline]
 __free_pages_prepare mm/page_alloc.c:1418 [inline]
 __free_frozen_pages+0x79f/0x10f0 mm/page_alloc.c:2962
 rcu_do_batch kernel/rcu/tree.c:2650 [inline]
 rcu_core+0x5f0/0x1260 kernel/rcu/tree.c:2919
 handle_softirqs+0x1e6/0x9d0 kernel/softirq.c:645
 run_ksoftirqd kernel/softirq.c:1099 [inline]
 run_ksoftirqd+0x38/0x60 kernel/softirq.c:1091
 smpboot_thread_fn+0x3d3/0xab0 kernel/smpboot.c:160
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Memory state around the buggy address:
 ffff8880234fdb00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff8880234fdb80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff8880234fdc00: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                        ^
 ffff8880234fdc80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff8880234fdd00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
