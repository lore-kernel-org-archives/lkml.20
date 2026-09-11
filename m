Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD55549B201
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789143329; cv=none; b=E+ROGUxaNBIxfqkngRPxaCH1gbCdC9vM9YD+GUKG8ZRkkkr06ifTrd0nX3cUytKFkLwPQTvtnR0c6RlEoKzPuO5vOAcUyyd8JqvTTHPoSWIiWrU2iamFehYtP0vOXwptmS1psPu1Bb5zoMsIrPjqsccZeFPiKfWK0Tb9t4KBquE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789143329; c=relaxed/simple;
	bh=4KYyzLal7sepM0yX0pg+b3ir53+QvyhpLlOlXzdkj0Y=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=nnlOR/JFyOCY+D2PSAlDO5/ZjMYZrBv/YieA0eFrOBgKFcsXOCiOhLwVoVyWrXXMB0cabHmjdKAa8ChOW8Z2UPISV4uUOJbdAqocPBAzJd9BFR9qhsL5AAx81EmEKzijaZB072vqG7lG1IsoY8PgFkRKQcp6PX5qy02aj/vcK3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-46dade0d7cdso967369fac.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:15:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789143326; x=1789748126;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=96GhTWlr7hycpFXFmxGq257fXg+gNbQD3LvS7nih380=;
        b=mAueEJuTapOMrlZFGbfjiPmGDqWBSUHBlurC18b++rIveDg5J28DVmhT7HF8LMbyGw
         D/D2B19qcb5sCYgul1pH5+djA1Tkpa/kBxbdTvoGdWxvcuhJcQZSxkwXSI8R4RYC0g4V
         4tmYPReiKaImziZeyKZiTJjk7CvyHewN4sxbYEKlifCxuXiG3D+tepb9vkGUqK0lUWhs
         Ocp82xP1y3q6VoQGLLShsyB5X5xG/IndVMztLj9FFPs+GDOQIpPzCML1nOV+P8e5KcZY
         aDJ8XdGgOmqKiOZYts5RvcLstiouNo/2rXZEKnpFvjbbBSQTMCcR6c4d8LFt5ROXcl2d
         jS7Q==
X-Gm-Message-State: AFuF++nVCk6QyU/MBQEhnd66BBIuZ1DjcWz19YBTTmVkPCk8yfiXDhoz
	FBc1/5fk9E6o25z5tCqXveKM7VMObZeSrhY4XOYHP8T+a9iIXwf56grld/4IiMMLB6YsqGNC3BK
	52i+y0BNCdIyC4Y6BrlQqV/FFfWIjxkw41irR11CS6pyKcDw2HswB0uOmphQ=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:c2d2:20b0:6b3:5537:8dbe with SMTP id
 006d021491bc7-6c0b9952b56mr2773715eaf.11.1789143326660; Fri, 11 Sep 2026
 09:15:26 -0700 (PDT)
Date: Fri, 11 Sep 2026 09:15:26 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa4291e.f81106d8.2ab401.001e.GAE@google.com>
Subject: [syzbot] [media?] KASAN: slab-use-after-free Read in v4l2_release (3)
From: syzbot <syzbot+34957180b0ed2581edaf@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    08df884136f1 Merge tag 'thermal-7.3-rc3' of git://git.kern..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=12d7d615580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c5c3949d762a91f
dashboard link: https://syzkaller.appspot.com/bug?extid=34957180b0ed2581edaf
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1082c925580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+34957180b0ed2581edaf@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in v4l2_release+0x30d/0x390 drivers/media/v4l2-core/v4l2-dev.c:466
Read of size 8 at addr ffff88803547c658 by task syz-executor112/6038

CPU: 1 UID: 0 PID: 6038 Comm: syz-executor112 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x13d/0x4b0 mm/kasan/report.c:482
 kasan_report+0xdf/0x1c0 mm/kasan/report.c:595
 v4l2_release+0x30d/0x390 drivers/media/v4l2-core/v4l2-dev.c:466
 __fput+0x3ff/0xb50 fs/file_table.c:512
 fput_close_sync+0x118/0x250 fs/file_table.c:617
 __do_sys_close fs/open.c:1560 [inline]
 __se_sys_close fs/open.c:1545 [inline]
 __x64_sys_close+0x8b/0x120 fs/open.c:1545
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fbd276a535e
Code: 08 0f 85 f5 e2 ff ff 49 89 fb 48 89 f0 48 89 d7 48 89 ce 4c 89 c2 4d 89 ca 4c 8b 44 24 08 4c 8b 4c 24 10 4c 89 5c 24 08 0f 05 <c3> 90 41 57 41 56 4d 89 c6 41 55 4d 89 cd 41 54 55 53 48 83 ec 08
RSP: 002b:00007ffce11b8c78 EFLAGS: 00000246 ORIG_RAX: 0000000000000003
RAX: ffffffffffffffda RBX: 00005555754b9400 RCX: 00007fbd276a535e
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000004
RBP: 0000000000000031 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000004
R13: 00007fbd276f005b R14: 0000000000000025 R15: 0000000000000003
 </TASK>

Allocated by task 5082:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __kmalloc_cache_noprof+0x2f8/0x6d0 mm/slub.c:5563
 _kmalloc_noprof include/linux/slab.h:991 [inline]
 _kzalloc_noprof include/linux/slab.h:1312 [inline]
 sur40_probe+0x1a8/0x1580 drivers/input/touchscreen/sur40.c:675
 usb_probe_interface+0x386/0x9b0 drivers/usb/core/driver.c:399
 call_driver_probe drivers/base/dd.c:628 [inline]
 really_probe+0x241/0xa60 drivers/base/dd.c:706
 __driver_probe_device+0x210/0x460 drivers/base/dd.c:868
 driver_probe_device+0x4a/0x140 drivers/base/dd.c:898
 __device_attach_driver+0x1df/0x320 drivers/base/dd.c:1026
 bus_for_each_drv+0x159/0x1e0 drivers/base/bus.c:500
 __device_attach+0x1e4/0x4d0 drivers/base/dd.c:1098
 device_initial_probe+0xaf/0xd0 drivers/base/dd.c:1153
 bus_probe_device+0x64/0x160 drivers/base/bus.c:620
 device_add+0x121d/0x1970 drivers/base/core.c:3776
 usb_set_configuration+0xd97/0x1c60 drivers/usb/core/message.c:2268
 usb_generic_driver_probe+0xa1/0xe0 drivers/usb/core/generic.c:250
 usb_probe_device+0xef/0x400 drivers/usb/core/driver.c:293
 call_driver_probe drivers/base/dd.c:628 [inline]
 really_probe+0x241/0xa60 drivers/base/dd.c:706
 __driver_probe_device+0x210/0x460 drivers/base/dd.c:868
 driver_probe_device+0x4a/0x140 drivers/base/dd.c:898
 __device_attach_driver+0x1df/0x320 drivers/base/dd.c:1026
 bus_for_each_drv+0x159/0x1e0 drivers/base/bus.c:500
 __device_attach+0x1e4/0x4d0 drivers/base/dd.c:1098
 device_initial_probe+0xaf/0xd0 drivers/base/dd.c:1153
 bus_probe_device+0x64/0x160 drivers/base/bus.c:620
 device_add+0x121d/0x1970 drivers/base/core.c:3776
 usb_new_device.part.0+0xcc2/0x1686 drivers/usb/core/hub.c:2708
 usb_new_device include/linux/workqueue.h:715 [inline]
 hub_port_connect drivers/usb/core/hub.c:5580 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5720 [inline]
 port_event drivers/usb/core/hub.c:5884 [inline]
 hub_event.cold+0x1e3/0xe90 drivers/usb/core/hub.c:5966
 process_one_work+0xac7/0x1b10 kernel/workqueue.c:3396
 process_scheduled_works kernel/workqueue.c:3479 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3560
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Freed by task 5082:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 kasan_save_free_info+0x3b/0x70 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5f/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2748 [inline]
 slab_free mm/slub.c:6499 [inline]
 kfree+0x22b/0x6d0 mm/slub.c:6792
 sur40_disconnect+0xb8/0x170 drivers/input/touchscreen/sur40.c:835
 usb_unbind_interface+0x1dd/0x9e0 drivers/usb/core/driver.c:461
 device_remove drivers/base/dd.c:618 [inline]
 device_remove+0x12a/0x180 drivers/base/dd.c:610
 __device_release_driver drivers/base/dd.c:1349 [inline]
 device_release_driver_internal+0x44e/0x620 drivers/base/dd.c:1372
 bus_remove_device+0x2bc/0x560 drivers/base/bus.c:664
 device_del+0x376/0x9b0 drivers/base/core.c:3965
 usb_disable_device+0x367/0x810 drivers/usb/core/message.c:1478
 usb_disconnect+0x2e2/0x9a0 drivers/usb/core/hub.c:2350
 hub_port_connect drivers/usb/core/hub.c:5420 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5720 [inline]
 port_event drivers/usb/core/hub.c:5884 [inline]
 hub_event+0x1bb1/0x4420 drivers/usb/core/hub.c:5966
 process_one_work+0xac7/0x1b10 kernel/workqueue.c:3396
 process_scheduled_works kernel/workqueue.c:3479 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3560
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

The buggy address belongs to the object at ffff88803547c000
 which belongs to the cache kmalloc-4k of size 4096
The buggy address is located 1624 bytes inside of
 freed 4096-byte region [ffff88803547c000, ffff88803547d000)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x35478
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88801c043040 dead000000000100 dead000000000122
raw: 0000000000000000 0000000000040004 00000000f5000000 0000000000000000
head: 00fff00000000040 ffff88801c043040 dead000000000100 dead000000000122
head: 0000000000000000 0000000000040004 00000000f5000000 0000000000000000
head: 00fff00000000003 fffffffffffffe01 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd2040(__GFP_IO|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5149, tgid 5149 (udevd), ts 15027584225
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
page last free pid 5142 tgid 5142 ts 14824943792 stack trace:
 reset_page_owner include/linux/page_owner.h:26 [inline]
 __free_pages_prepare mm/page_alloc.c:1418 [inline]
 __free_frozen_pages+0x79f/0x10f0 mm/page_alloc.c:2962
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x47/0xf0 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x1a0/0x1f0 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x69/0x90 mm/kasan/common.c:350
 kasan_slab_alloc include/linux/kasan.h:253 [inline]
 slab_post_alloc_hook mm/slub.c:4683 [inline]
 slab_alloc_node mm/slub.c:4996 [inline]
 kmem_cache_alloc_noprof+0x269/0x6a0 mm/slub.c:5010
 alloc_empty_file+0x5b/0x1c0 fs/file_table.c:262
 path_openat+0xdb/0x2440 fs/namei.c:4986
 do_file_open+0x20e/0x430 fs/namei.c:5029
 do_sys_openat2+0x10f/0x1e0 fs/open.c:1417
 do_sys_open fs/open.c:1423 [inline]
 __do_sys_openat fs/open.c:1439 [inline]
 __se_sys_openat fs/open.c:1434 [inline]
 __x64_sys_openat+0x12d/0x210 fs/open.c:1434
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffff88803547c500: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88803547c580: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff88803547c600: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                                    ^
 ffff88803547c680: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88803547c700: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
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
