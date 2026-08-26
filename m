Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543263C5848
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 11:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787744976; cv=none; b=CKl04Gz873OaEsHxD+yJZOuP/LQG0qRrPJ8Y512c2JSwj92/97p9NiX38+HJK/lrMIGwBY3aunZokFJUfemnhK7hM1Z6w3R/FJy0bxaPdqkgUWmkfMYail51we+iH4EK1U0e0QTYrN5cLvdwgWR6u4PWPbYBBXxeOAPGUXMqRPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787744976; c=relaxed/simple;
	bh=fH+Bx/zPNzpm8DG3lBQUI2o39SbWFvFhmQ9Dv6A1mOU=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=su19QZekY+RwYb2NLqhAXKCtihmSNPV6E/CHWOQUAKvZ4POharZBquHBMwlH0zjL9803wqfaRkSoUa16qhT9XGjz0lJK8/tQNdWGGaTGXo15yzwCq0KYyw5qqb0oV2ggjteuuKYgoO4i+bcDV4gnuGlBdi1wE+pQUAT7oqWEUDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7eb64224fd2so2744057a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 04:49:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787744973; x=1788349773;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u8dulTw8brdlXx+wY3t/avB2SGweGAEea9zHwvrnDp8=;
        b=oSKJyqPwjEUoTQndBHyJ2bBIMF9CqfjXzZC61KST+543bRyCMRdNcn/y35jgAsiFev
         fCNlFODrxGpcM8GKs+0JiOxfpZ5cShov5Nd6pUieUQONAw6v06z8OA43PdkYLj1jI4MT
         TjutSuSKTeaUNvwk/Q0FCAabFK4BI5ofzCM4Rll8NY2vvDQWR8AFrRJGjA+hLn86MHwf
         PynmxOwdCnUPkoK+8Kx2dwoSMKYX0XcIPLiK7tNAcdDj3zIZQHVjOFTjfIC5kawGg5hZ
         1KVBMbaD7fDj7/plPNPqB+3Nec/U+/4zjo4eZWkRlYUt4cI1mEpdahpVeVZHG8EJqPsu
         WC0w==
X-Gm-Message-State: AFuF++nGEU+ssY9GhaahrFwc4/OANzxED5eoeayOTddE8gG4RggIqAfn
	C6QlvchudL82pWwysxdMDKdrVpk3D/SZUflAKPyCKnCPfuFkYWspEdAbSb6wWZYffUsL58CFsAz
	j+HNtZgpRSjhq2YCTZGbdDl4JCSUWaiDSWM7YERoJq3sP+ugjHs1lyB5tdr4=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:858e:10b0:6b1:6f3d:2069 with SMTP id
 006d021491bc7-6b1a03ba182mr4435521eaf.10.1787744973270; Wed, 26 Aug 2026
 04:49:33 -0700 (PDT)
Date: Wed, 26 Aug 2026 04:49:33 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a8ed2cd.1d9ded08.62e62.00a8.GAE@google.com>
Subject: [syzbot] [usb?] KASAN: stack-out-of-bounds Write in append_midi1_out_jack
From: syzbot <syzbot+c35f34092a4bc9855be6@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    818bebeb63dd drm/xe: Don't hand out the flat CCS storage a..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=12dd6979580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ccca94d2c01b9e78
dashboard link: https://syzkaller.appspot.com/bug?extid=c35f34092a4bc9855be6
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17040579580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+c35f34092a4bc9855be6@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: stack-out-of-bounds in append_midi1_out_jack.isra.0+0x38c/0x470 drivers/usb/gadget/function/f_midi2.c:1713
Write of size 1 at addr ffffc90003277880 by task syz-executor119/6000

CPU: 2 UID: 0 PID: 6000 Comm: syz-executor119 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x13d/0x4b0 mm/kasan/report.c:482
 kasan_report+0xdf/0x1c0 mm/kasan/report.c:595
 append_midi1_out_jack.isra.0+0x38c/0x470 drivers/usb/gadget/function/f_midi2.c:1713
 f_midi2_create_usb_configs+0x748/0xdf0 drivers/usb/gadget/function/f_midi2.c:1815
 f_midi2_bind+0x1d12/0x2770 drivers/usb/gadget/function/f_midi2.c:2013
 usb_add_function+0x219/0x890 drivers/usb/gadget/composite.c:333
 configfs_composite_bind+0xd83/0x1960 drivers/usb/gadget/configfs.c:1802
 gadget_bind_driver+0x28c/0xbf0 drivers/usb/gadget/udc/core.c:1662
 call_driver_probe drivers/base/dd.c:628 [inline]
 really_probe+0x241/0xa60 drivers/base/dd.c:706
 __driver_probe_device+0x210/0x460 drivers/base/dd.c:868
 driver_probe_device+0x4a/0x140 drivers/base/dd.c:898
 __driver_attach+0x21f/0x5b0 drivers/base/dd.c:1292
 bus_for_each_dev+0x13e/0x1d0 drivers/base/bus.c:383
 bus_add_driver+0x305/0x5b0 drivers/base/bus.c:763
 driver_register+0x1e2/0x360 drivers/base/driver.c:174
 usb_gadget_register_driver_owner+0x132/0x210 drivers/usb/gadget/udc/core.c:1752
 gadget_dev_desc_UDC_store+0x1b0/0x2e0 drivers/usb/gadget/configfs.c:300
 flush_write_buffer fs/configfs/file.c:207 [inline]
 configfs_write_iter+0x302/0x4e0 fs/configfs/file.c:229
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6af/0x1050 fs/read_write.c:687
 ksys_write+0x12a/0x250 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fe46da0d9f7
Code: 48 89 fa 4c 89 df e8 98 1d 00 00 8b 93 08 03 00 00 59 5e 48 83 f8 fc 74 1a 5b c3 0f 1f 84 00 00 00 00 00 48 8b 44 24 10 0f 05 <5b> c3 0f 1f 80 00 00 00 00 83 e2 39 83 fa 08 75 de e8 23 ff ff ff
RSP: 002b:00007fff00e4dd80 EFLAGS: 00000202 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 0000555572ba4400 RCX: 00007fe46da0d9f7
RDX: 000000000000000b RSI: 0000555572ba67e3 RDI: 0000000000000004
RBP: 0000555572ba67e3 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000202 R12: 00007fff00e4ddf0
R13: 0000555572ba6770 R14: 00007fe46da70cc0 R15: 0000000000000002
 </TASK>

The buggy address belongs to stack of task syz-executor119/6000
 and is located at offset 440 in frame:
 f_midi2_bind+0x0/0x2770 drivers/usb/gadget/function/f_midi2.c:1768

This frame has 6 objects:
 [32, 36) 'sw'
 [48, 56) 'card'
 [80, 88) 'ump'
 [112, 128) 'string_fn'
 [144, 160) 'strings'
 [176, 440) 'config'

The buggy address belongs to a 8-page vmalloc region starting at 0xffffc90003270000 allocated at kernel_clone+0x176/0x9d0 kernel/fork.c:2772
The buggy address belongs to the physical page:
page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x7ff248b6b pfn:0x50a87
flags: 0xfff00000000000(node=0|zone=1|lastcpupid=0x7ff)
raw: 00fff00000000000 dead000000000100 dead000000000122 0000000000000000
raw: 00000007ff248b6b 0000000000000000 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0x29c2(GFP_NOWAIT|__GFP_HIGHMEM|__GFP_IO|__GFP_FS|__GFP_ZERO), pid 5768, tgid 5768 (syz-executor), ts 51046718723
 set_page_owner include/linux/page_owner.h:33 [inline]
 post_alloc_hook+0xfd/0x120 mm/page_alloc.c:1871
 prep_new_page mm/page_alloc.c:1879 [inline]
 get_page_from_freelist+0x110d/0x35b0 mm/page_alloc.c:3943
 __alloc_frozen_pages_noprof+0x2eb/0x3300 mm/page_alloc.c:5436
 alloc_pages_mpol+0x201/0x550 mm/mempolicy.c:2495
 alloc_pages_noprof+0x1a/0x160 mm/mempolicy.c:2586
 vm_area_alloc_pages mm/vmalloc.c:3690 [inline]
 __vmalloc_area_node mm/vmalloc.c:3915 [inline]
 __vmalloc_node_range_noprof+0xdcc/0x1460 mm/vmalloc.c:4105
 __vmalloc_node_noprof+0xad/0xf0 mm/vmalloc.c:4166
 alloc_thread_stack_node kernel/fork.c:359 [inline]
 dup_task_struct kernel/fork.c:930 [inline]
 copy_process+0x803/0x8370 kernel/fork.c:2139
 kernel_clone+0x176/0x9d0 kernel/fork.c:2772
 __do_sys_clone+0xd9/0x120 kernel/fork.c:2914
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
page last free pid 5748 tgid 5748 ts 50853501051 stack trace:
 reset_page_owner include/linux/page_owner.h:26 [inline]
 __free_pages_prepare mm/page_alloc.c:1418 [inline]
 free_pages_prepare+0x586/0xe00 mm/page_alloc.c:1463
 __free_contig_range_common+0x14f/0x250 mm/page_alloc.c:7060
 __free_contig_range mm/page_alloc.c:7105 [inline]
 free_pages_bulk+0x12a/0x200 mm/page_alloc.c:5322
 vm_area_free_pages+0xad/0x2b0 mm/vmalloc.c:3462
 vfree mm/vmalloc.c:3511 [inline]
 vfree+0x108/0x730 mm/vmalloc.c:3485
 kcov_put kernel/kcov.c:447 [inline]
 kcov_put kernel/kcov.c:443 [inline]
 kcov_close+0x34/0x60 kernel/kcov.c:554
 __fput+0x3ff/0xb50 fs/file_table.c:512
 task_work_run+0x150/0x240 kernel/task_work.c:233
 exit_task_work include/linux/task_work.h:40 [inline]
 do_exit+0x951/0x2ae0 kernel/exit.c:1008
 do_group_exit+0xd5/0x2a0 kernel/exit.c:1151
 get_signal+0x1ec7/0x21e0 kernel/signal.c:3046
 arch_do_signal_or_restart+0x91/0x7e0 arch/x86/kernel/signal.c:337
 __exit_to_user_mode_loop kernel/entry/common.c:66 [inline]
 exit_to_user_mode_loop+0x139/0x700 kernel/entry/common.c:101
 __exit_to_user_mode_prepare include/linux/irq-entry-common.h:207 [inline]
 syscall_exit_to_user_mode_prepare include/linux/irq-entry-common.h:230 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:336 [inline]
 do_syscall_64+0x661/0x790 arch/x86/entry/syscall_64.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffffc90003277780: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffffc90003277800: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>ffffc90003277880: f3 f3 f3 f3 f3 f3 f3 f3 f3 00 00 00 00 00 00 00
                   ^
 ffffc90003277900: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffffc90003277980: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
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
