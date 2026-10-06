Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77A113CF82
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 02:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791255151; cv=none; b=qj5ajgPEvvKi62gXs9c5Zb6tU0SYzDeRceP4mOk8sE6EP4LC9Y+KWhNrzoVr5Jlk0kbgEgJXj6iL1NWb4sRtHV5rA83fQ+vktcHwQC+c76yoim8gJrqqNzXPalf0g4teXeahkfSDwsi1j1o3p3uOj0ApFVpk87H5GiULjY4fTK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791255151; c=relaxed/simple;
	bh=PoOjC/dVjJSZWceSOaILIVvLCUiBqOOKOkYm21GURMg=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=OGbti/D5ERNcTu+auc9tlPa39yEqauolrbrPjYp/2uTx2gbZPajpG0ZkzEazGX/ITuhu5INBsTDU996FRmD/tJkSUY1UvG/9txfMyyzo4cMBUPWCPYLM9U4q9vSgDr2guiZxGPH+ZptQXnITVHP/3H8HEpOfb1IyP9OC2cUDV1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4f9e7ea8bfcso468564b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 19:52:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791255148; x=1791859948;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eKlcSjcpN68aZ4kTMBBPFgNsti4k+DS+dshMdqWyVBY=;
        b=0ZR6nmYgkw1UC8whBLuILg0jJus30dQPupttJ9clKFkk7xFVAdwCtXQWmRPx7wQyBy
         t6eX/C5PmkeIRlBkKyF2ibdFCta4VvvfpcFzO6OSVQzzFTAqlpcoyxZXtRyyVaVuutD8
         cWuDXHHQHRVOrElLM4csy71jOsR8iQzpMxTNPhkD4aJrAwI7ah/owB4fwFkHy15MHwpK
         VhjaxvPsgcKMB6rfkcjZs0xEeL8mfAKmS0FgQm1xDouFI4X70HKdgbnqjdGFRcCfxH1a
         hf3EV0ZIuNvE5KEeT2FtdDcC9rSmDwGmjGSb/64LX2P+xZbsL2f9PCxOQ86ign4uo/cB
         H8QA==
X-Forwarded-Encrypted: i=1; AKwUvBxEPwfKotvsLsT6NbbGqZBmSw+bCnNBoUvXPyBdrTAc1MTssmZYhnmpLr0jcAro32mJNWfLkFcmPnx+t7g=@vger.kernel.org
X-Gm-Message-State: AFuF++n3eYDAOYGphSnFNh6eTDnR2/SscRn/kcjR8xCbMkRfYFa0tX5p
	oQmc5mlHsh4XnEQbM3A0fDOd+XIUuAWVl+spjqpf8K3hwm6vyf2wzu/yATMVLLeIKeIC/Fk83J2
	IkqIr5fx2UacR5MtEbuVX9Zc8qc8spNIfxV9ONOcp5fTMDWWOfb7xOLuCKoM=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:191f:b0:4f9:e0b0:37af with SMTP id
 5614622812f47-4fb40c97e56mr178464b6e.27.1791255148695; Mon, 05 Oct 2026
 19:52:28 -0700 (PDT)
Date: Mon, 05 Oct 2026 19:52:28 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac4626c.9ad129c8.3858c0.0043.GAE@google.com>
Subject: [syzbot] [usb?] KASAN: slab-use-after-free Write in ffs_data_clear
From: syzbot <syzbot+6227549bd2c8a1ec8ba0@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    9f24d789f03b Add linux-next specific files for 20261001
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=150cd3f5580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c999b3b0b3b9da44
dashboard link: https://syzkaller.appspot.com/bug?extid=6227549bd2c8a1ec8ba0
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/dd8482e32335/disk-9f24d789.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/c0d5a36cf052/vmlinux-9f24d789.xz
kernel image: https://storage.googleapis.com/syzbot-assets/e5992c4e2fd4/bzImage-9f24d789.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+6227549bd2c8a1ec8ba0@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in ffs_closed drivers/usb/gadget/function/f_fs.c:4427 [inline]
BUG: KASAN: slab-use-after-free in ffs_data_clear+0x543/0x5b0 drivers/usb/gadget/function/f_fs.c:2305
Write of size 1 at addr ffff8880237b1e4a by task syz-executor/11910

CPU: 0 UID: 0 PID: 11910 Comm: syz-executor Tainted: G             L     Y syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP, [Y]=FORCED_BIND
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description+0x55/0x1e0 mm/kasan/report.c:378
 print_report+0x58/0x70 mm/kasan/report.c:482
 kasan_report+0x117/0x150 mm/kasan/report.c:595
 ffs_closed drivers/usb/gadget/function/f_fs.c:4427 [inline]
 ffs_data_clear+0x543/0x5b0 drivers/usb/gadget/function/f_fs.c:2305
 ffs_data_reset drivers/usb/gadget/function/f_fs.c:2336 [inline]
 ffs_fs_kill_sb+0x84/0x370 drivers/usb/gadget/function/f_fs.c:2180
 deactivate_locked_super+0xbe/0x110 fs/super.c:586
 cleanup_mnt+0x3d3/0x460 fs/namespace.c:1329
 task_work_run+0x1d9/0x260 kernel/task_work.c:233
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 __exit_to_user_mode_loop kernel/entry/common.c:70 [inline]
 exit_to_user_mode_loop+0x204/0x770 kernel/entry/common.c:101
 __exit_to_user_mode_prepare include/linux/irq-entry-common.h:207 [inline]
 syscall_exit_to_user_mode_prepare include/linux/irq-entry-common.h:230 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:343 [inline]
 do_syscall_64+0x328/0x520 arch/x86/entry/syscall_64.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f0c0c99f397
Code: a2 c7 05 5c 43 25 00 00 00 00 00 eb 96 e8 e1 12 00 00 90 31 f6 e9 09 00 00 00 66 0f 1f 84 00 00 00 00 00 b8 a6 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 01 c3 48 c7 c2 e8 ff ff ff f7 d8 64 89 02 b8
RSP: 002b:00007ffcc71a0748 EFLAGS: 00000246 ORIG_RAX: 00000000000000a6
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 00007f0c0c99f397
RDX: 0000000000000000 RSI: 0000000000000009 RDI: 00007ffcc71a0800
RBP: 00007ffcc71a0800 R08: 00007ffcc71a1800 R09: 00000000ffffffff
R10: 0000000000000000 R11: 0000000000000246 R12: 00007ffcc71a1890
R13: 00007f0c0ca344bb R14: 00000000000ca529 R15: 00007ffcc71a18d0
 </TASK>

Allocated by task 17405:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:409 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:426
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __kmalloc_cache_noprof+0x31c/0x600 mm/slub.c:5680
 _kmalloc_noprof include/linux/slab.h:991 [inline]
 _kzalloc_noprof include/linux/slab.h:1312 [inline]
 _ffs_alloc_dev drivers/usb/gadget/function/f_fs.c:4276 [inline]
 ffs_alloc_inst+0x152/0x310 drivers/usb/gadget/function/f_fs.c:4176
 try_get_usb_function_instance drivers/usb/gadget/functions.c:28 [inline]
 usb_get_function_instance+0xe3/0x2f0 drivers/usb/gadget/functions.c:44
 function_make+0x127/0x360 drivers/usb/gadget/configfs.c:626
 configfs_mkdir+0x4f6/0x9e0 fs/configfs/dir.c:1369
 vfs_mkdir+0x40e/0x630 fs/namei.c:5423
 filename_mkdirat+0x285/0x510 fs/namei.c:5456
 __do_sys_mkdirat fs/namei.c:5477 [inline]
 __se_sys_mkdirat+0x35/0x150 fs/namei.c:5474
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 17408:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 kasan_save_free_info+0x40/0x50 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:264 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:296
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2780 [inline]
 slab_free mm/slub.c:6630 [inline]
 kfree+0x1c5/0x650 mm/slub.c:6923
 _ffs_free_dev drivers/usb/gadget/function/f_fs.c:4336 [inline]
 ffs_free_inst+0x233/0x2c0 drivers/usb/gadget/function/f_fs.c:4152
 usb_put_function_instance+0x95/0xc0 drivers/usb/gadget/functions.c:77
 config_item_cleanup fs/configfs/item.c:128 [inline]
 config_item_release+0x13a/0x2d0 fs/configfs/item.c:137
 configfs_rmdir+0x885/0x950 fs/configfs/dir.c:1580
 vfs_rmdir+0x3e6/0x6a0 fs/namei.c:5528
 filename_rmdir+0x292/0x520 fs/namei.c:5585
 __do_sys_rmdir fs/namei.c:5608 [inline]
 __se_sys_rmdir+0x2e/0x140 fs/namei.c:5605
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff8880237b1e00
 which belongs to the cache kmalloc-128 of size 128
The buggy address is located 74 bytes inside of
 freed 128-byte region [ffff8880237b1e00, ffff8880237b1e80)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffff8880237b1d00 pfn:0x237b1
flags: 0xfff00000000200(workingset|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000200 ffff88801b041a00 ffffea0001dd3110 ffffea0001eb1c10
raw: ffff8880237b1d00 000000000010000f 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0xd2cc0(GFP_KERNEL|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5624, tgid 5624 (syz-executor), ts 199870517782
 set_page_owner include/linux/page_owner.h:33 [inline]
 post_alloc_hook+0x1f9/0x250 mm/page_alloc.c:1854
 prep_new_page mm/page_alloc.c:1862 [inline]
 get_page_from_freelist+0x220f/0x2280 mm/page_alloc.c:3933
 __alloc_frozen_pages_noprof+0x1fc/0x400 mm/page_alloc.c:5468
 alloc_slab_page mm/slub.c:3384 [inline]
 allocate_slab+0x7d/0x5e0 mm/slub.c:3499
 new_slab mm/slub.c:3550 [inline]
 refill_objects+0x2d5/0x350 mm/slub.c:7539
 refill_sheaf mm/slub.c:2917 [inline]
 __pcs_replace_empty_main+0x2c8/0x6c0 mm/slub.c:4811
 alloc_from_pcs mm/slub.c:4887 [inline]
 slab_alloc_node mm/slub.c:5021 [inline]
 __kmalloc_cache_noprof+0x396/0x600 mm/slub.c:5676
 _kmalloc_noprof include/linux/slab.h:991 [inline]
 _kzalloc_noprof include/linux/slab.h:1312 [inline]
 mm_init_sched+0x56/0x350 kernel/sched/fair.c:1660
 mm_alloc_sched_noprof include/linux/mm_types.h:1675 [inline]
 mm_init+0x8e3/0xcb0 kernel/fork.c:1143
 dup_mm kernel/fork.c:1538 [inline]
 copy_mm+0xfc/0x470 kernel/fork.c:1594
 copy_process+0x1ea2/0x4430 kernel/fork.c:2310
 kernel_clone+0x2d7/0x940 kernel/fork.c:2774
 __do_sys_clone kernel/fork.c:2916 [inline]
 __se_sys_clone kernel/fork.c:2900 [inline]
 __x64_sys_clone+0x1b6/0x230 kernel/fork.c:2900
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
page last free pid 5624 tgid 5624 ts 199869898357 stack trace:
 reset_page_owner include/linux/page_owner.h:26 [inline]
 __free_pages_prepare mm/page_alloc.c:1401 [inline]
 free_pages_prepare+0x9eb/0xaf0 mm/page_alloc.c:1446
 __free_contig_range_common+0x174/0x340 mm/page_alloc.c:7090
 __free_contig_range mm/page_alloc.c:7135 [inline]
 free_pages_bulk+0x48/0x120 mm/page_alloc.c:5354
 vm_area_free_pages mm/vmalloc.c:3505 [inline]
 vfree+0x22c/0x490 mm/vmalloc.c:3554
 __do_replace+0x850/0x9a0 net/ipv6/netfilter/ip6_tables.c:1110
 do_replace net/ipv6/netfilter/ip6_tables.c:1161 [inline]
 do_ip6t_set_ctl+0xb45/0xe30 net/ipv6/netfilter/ip6_tables.c:1648
 nf_setsockopt+0x26f/0x290 net/netfilter/nf_sockopt.c:101
 do_sock_setsockopt+0x17c/0x1b0 net/socket.c:2399
 __sys_setsockopt net/socket.c:2424 [inline]
 __do_sys_setsockopt net/socket.c:2430 [inline]
 __se_sys_setsockopt net/socket.c:2427 [inline]
 __x64_sys_setsockopt+0x13d/0x1b0 net/socket.c:2427
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffff8880237b1d00: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff8880237b1d80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff8880237b1e00: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                              ^
 ffff8880237b1e80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff8880237b1f00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
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
