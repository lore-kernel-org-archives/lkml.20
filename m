Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21911431E5E
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 22:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788559232; cv=none; b=jddaE0l2GPIsyHHd2WV+sM2K57XZuRXmSVAfbiQ3dx0snYNBWgEABwj58mHhDtVnScvLiG9QqsFcewOMT58s93bEjjkbABhO/IPQtzCiCj0OPgjNIkb5N5Kri/exjkDn+ITWf/I7ybfZxO/2W5uW48XL7JUd7uQ2OYqtdxGmTNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788559232; c=relaxed/simple;
	bh=ynm7sEqQ3KSr8jwMPaEN1cYByfVXNcWazHGRrpo6es8=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=D8eYoul3evKDYqTh2enZWSVTEl+HTl7+ShBnMuU/WtvT9rJtviwEGKBwhkGozxLP+qosUFnu+ZSaE0FsN5DHfp2/wa9KPJyivhWjlNJEOF7gnO8z2F/UE1OF3Hk5aRXwUmacAquHfPV4ed7dw8HOVYtMZqE3T667fkHTkBgpp2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6b1b19eab8bso1094981eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 15:00:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788559226; x=1789164026;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dO7aa6Y0Re9KYAlKh9YoKOJummlZlCZLSFYR4cBNXoQ=;
        b=tATv1G+W3uWBWOWEATSigMeTgeMg0aLWgYYR/qbEawS+/RzU8ATWqVfv7Z1ntkXzJD
         zuiZVMQzcl9598WoDhw8JLNRPRrARVYp7cmg9NaBmh7XJtXu59pU1O6q6+OA+IWeyCfl
         aiTKIxceIx/ooF3H8Z0GSngfu17iZL5uU2DrkCTQz8PPquY82HC/qg9svh9ms2Y/EuIK
         rEKirymqcXmglpUP0wXZHKYXPSXhVSmSh5VIPhaxu6NFOuzkq+A+3hXsT2syRMI2NpaH
         CveKa9etkCjTjY+k1axdeZDy7MpVFBUQPL58s53ppjt8dlQDu+gz92oAo13M+20DSyko
         z4Bg==
X-Gm-Message-State: AFuF++kbNarS8wgKL9q4En8uYkqjZAcWogsdc8qOpzycDCpVhmNOgzZL
	sPzPwyu/6kwfRxVktwDPYYnUyNwZkmH/TO9DH9UJTMKQ+0pUSpqW5zqX3rCDmZK6yVAuzmoet+V
	x3ZhzIHJEPiasTvC9oEcq0ILn3so2lXDsJbYbt/kinRiNgUjSRkAO6l59E8A=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1997:b0:6a3:7ad3:e728 with SMTP id
 006d021491bc7-6b6fe2aefbbmr6942530eaf.28.1788559226728; Fri, 04 Sep 2026
 15:00:26 -0700 (PDT)
Date: Fri, 04 Sep 2026 15:00:26 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9b3f7a.2e649fcc.1e1977.0001.GAE@google.com>
Subject: [syzbot] KASAN: slab-use-after-free Write in o2hb_region_dev_store
From: syzbot <syzbot+3025e3e8fc0b928af8f5@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    bc35965f6940 Merge tag 'mm-hotfixes-stable-2026-09-03-17-4..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=119c84f9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c5c3949d762a91f
dashboard link: https://syzkaller.appspot.com/bug?extid=3025e3e8fc0b928af8f5
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1714a8f9580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+3025e3e8fc0b928af8f5@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in o2hb_map_slot_data fs/ocfs2/cluster/heartbeat.c:1811 [inline]
BUG: KASAN: slab-use-after-free in o2hb_region_dev_store+0x1751/0x1b00 fs/ocfs2/cluster/heartbeat.c:1936
Write of size 8 at addr ffff8880262b82e8 by task syz.3.20/6459

CPU: 2 UID: 0 PID: 6459 Comm: syz.3.20 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x13d/0x4b0 mm/kasan/report.c:482
 kasan_report+0xdf/0x1c0 mm/kasan/report.c:595
 o2hb_map_slot_data fs/ocfs2/cluster/heartbeat.c:1811 [inline]
 o2hb_region_dev_store+0x1751/0x1b00 fs/ocfs2/cluster/heartbeat.c:1936
 flush_write_buffer fs/configfs/file.c:207 [inline]
 configfs_write_iter+0x302/0x4e0 fs/configfs/file.c:229
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6af/0x1050 fs/read_write.c:687
 ksys_write+0x12a/0x250 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f79d5d9e019
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f79d6c1c028 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007f79d6025fa0 RCX: 00007f79d5d9e019
RDX: 0000000000000001 RSI: 00002000000005c0 RDI: 0000000000000004
RBP: 00007f79d5e3500c R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f79d6026038 R14: 00007f79d6025fa0 R15: 00007ffc42008128
 </TASK>

Allocated by task 6459:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __do_kmalloc_node mm/slub.c:5414 [inline]
 __kmalloc_noprof+0x32f/0x840 mm/slub.c:5439
 _kmalloc_noprof include/linux/slab.h:995 [inline]
 _kzalloc_noprof include/linux/slab.h:1312 [inline]
 o2hb_map_slot_data fs/ocfs2/cluster/heartbeat.c:1802 [inline]
 o2hb_region_dev_store+0x88b/0x1b00 fs/ocfs2/cluster/heartbeat.c:1936
 flush_write_buffer fs/configfs/file.c:207 [inline]
 configfs_write_iter+0x302/0x4e0 fs/configfs/file.c:229
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6af/0x1050 fs/read_write.c:687
 ksys_write+0x12a/0x250 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 6458:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 kasan_save_free_info+0x3b/0x70 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5f/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2748 [inline]
 slab_free mm/slub.c:6499 [inline]
 kfree+0x22b/0x6d0 mm/slub.c:6792
 o2hb_unmap_slot_data+0x190/0x330 fs/ocfs2/cluster/heartbeat.c:1596
 o2hb_region_dev_store+0x112e/0x1b00 fs/ocfs2/cluster/heartbeat.c:2027
 flush_write_buffer fs/configfs/file.c:207 [inline]
 configfs_write_iter+0x302/0x4e0 fs/configfs/file.c:229
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6af/0x1050 fs/read_write.c:687
 ksys_write+0x12a/0x250 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff8880262b8200
 which belongs to the cache kmalloc-256 of size 256
The buggy address is located 232 bytes inside of
 freed 256-byte region [ffff8880262b8200, ffff8880262b8300)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x262b8
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
page last allocated via order 1, migratetype Unmovable, gfp_mask 0xd2040(__GFP_IO|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 39, tgid 39 (kdevtmpfs), ts 6186544854
 set_page_owner include/linux/page_owner.h:33 [inline]
 post_alloc_hook+0xfd/0x120 mm/page_alloc.c:1871
 prep_new_page mm/page_alloc.c:1879 [inline]
 get_page_from_freelist+0x110d/0x35d0 mm/page_alloc.c:3943
 __alloc_frozen_pages_noprof+0x2eb/0x3300 mm/page_alloc.c:5436
 alloc_slab_page mm/slub.c:3347 [inline]
 allocate_slab mm/slub.c:3462 [inline]
 new_slab+0xa9/0x6e0 mm/slub.c:3513
 refill_objects+0xe3/0x410 mm/slub.c:7410
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
 vfs_mknod+0x3a5/0x7f0 fs/namei.c:5269
 handle_create drivers/base/devtmpfs.c:232 [inline]
 handle drivers/base/devtmpfs.c:384 [inline]
 devtmpfs_work_loop+0x48d/0xae4 drivers/base/devtmpfs.c:399
 devtmpfsd+0x3f/0x50 drivers/base/devtmpfs.c:441
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
page_owner free stack trace missing

Memory state around the buggy address:
 ffff8880262b8180: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff8880262b8200: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff8880262b8280: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                                          ^
 ffff8880262b8300: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff8880262b8380: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
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
