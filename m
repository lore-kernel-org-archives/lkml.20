Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685D6556BB3
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 13:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788959948; cv=none; b=dO4sz8wgsRxiPW4cf66F67NhoLTYCrH5IppUpC0NZVbku8BdwI1V2LczzsqI6mwCwIRwXY8dI0khtB4JRpWwhaqL93MydQr2PszrO9rX9Gg/wrmRDg/D7gvoUgK+36fC5zAoWql+LDY/uuztXQlCfIc9imUOdTFfkpnjKcBkE5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788959948; c=relaxed/simple;
	bh=wGABA6qAtGMS8sMFfIUl55VuYMra61+EjNgTLjAgN0I=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=V8tj9Zwh9dx0tOx6qYOzyGv9kOTom9jZOCtdfdlxJoa5hfEWm5oqJBOnOklAk4qfHpftg6dXjPyPHd/+nLeY73JpbLH6qpv/fC4uvRWL/3W3kboe+ZbJeqpaAvm1S6fZCTnyYSMDnLSJVU6afI17/3e0QNmWdMuif+mH1R/Xk6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4b2f2b8d88fso6411430b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 06:19:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788959943; x=1789564743;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Fahh3hMEs0DwR+8uO6S2JO66E0ba7QGO2PpmuiMCivE=;
        b=DE/zo9HYRXKYYjRUmPw6DsCK0VOvPVya5kjZLISoEh1J4RCExGt4mq71i8eGv9Tea5
         oXJjCoXCW5NOW+9CRkBHaO/Vcvll59Nb4d0rVMRSHbmG70kUxYuU3xgLz6itHlryCn2Z
         aD/4UJO146G+Maa1Bd+0F8KOqZFWz8rs7gbl2yakVuPcJJEDqgkTxOo9//431WtDiwOr
         88riUYTutOL1wWmdWeuL8YpOAEGz4j+PQNtUkUEiUp+NBJsJqwFRsn7lG9k6yyFGyLdT
         BkcxE31qExvQ1zfrDQIKLAPMHzLEFCs8wN7/x/wdvijjo0/NT61gBK0jxxOHnlCp6cD4
         +7CA==
X-Gm-Message-State: AFuF++m86Qv6PJ6DcJ3g9pAGXT6zqg6Qa/aLU614oag3GXYSSWagB5bn
	XKj6xU0/QlkwPxhIG9udy/Cr6j61KNMP62pQDgLyLvmUia0EcowHU7zO/I81FVFU3xYFu6eJ9Ck
	Ledf27GswNImKyrT7eIajS3Wk7adtZhJBQc82rZ3Safi/nBV1irsxwjDqkXA=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1c89:b0:6be:4eb3:e1c6 with SMTP id
 006d021491bc7-6bee48ac472mr786543eaf.19.1788959942907; Wed, 09 Sep 2026
 06:19:02 -0700 (PDT)
Date: Wed, 09 Sep 2026 06:19:02 -0700
In-Reply-To: <20260909130533.9011-1-syedtayyabfarooq08@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa15cc6.f2639fcc.29487d.0007.GAE@google.com>
Subject: Re: [syzbot] [serial?] KASAN: slab-use-after-free Write in tty_init_dev
From: syzbot <syzbot+fe63e4d633540f230624@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syedtayyabfarooq08@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
KASAN: slab-use-after-free Read in gs_close

==================================================================
BUG: KASAN: slab-use-after-free in __raw_spin_lock_irq include/linux/spinlock_api_smp.h:165 [inline]
BUG: KASAN: slab-use-after-free in _raw_spin_lock_irq+0x36/0x50 kernel/locking/spinlock.c:189
Read of size 1 at addr ffff8880364433a0 by task syz-executor276/6040

CPU: 2 UID: 0 PID: 6040 Comm: syz-executor276 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x13d/0x4b0 mm/kasan/report.c:482
 kasan_report+0xdf/0x1c0 mm/kasan/report.c:595
 __kasan_check_byte+0x36/0x50 mm/kasan/common.c:574
 kasan_check_byte include/linux/kasan.h:402 [inline]
 lock_acquire kernel/locking/lockdep.c:5916 [inline]
 lock_acquire+0x132/0x380 kernel/locking/lockdep.c:5899
 __raw_spin_lock_irq include/linux/spinlock_api_smp.h:165 [inline]
 _raw_spin_lock_irq+0x36/0x50 kernel/locking/spinlock.c:189
 spin_lock_irq include/linux/spinlock.h:377 [inline]
 gs_close+0xc6/0xcd0 drivers/usb/gadget/function/u_serial.c:736
 tty_release+0x40e/0x1300 drivers/tty/tty_io.c:1718
 tty_open+0x31d/0xe20 drivers/tty/tty_io.c:2119
 chrdev_open+0x234/0x6a0 fs/char_dev.c:411
 do_dentry_open+0x6ab/0x14d0 fs/open.c:996
 vfs_open+0x82/0x3f0 fs/open.c:1101
 do_open fs/namei.c:4837 [inline]
 path_openat+0x19fa/0x2440 fs/namei.c:5000
 do_file_open+0x20e/0x430 fs/namei.c:5029
 do_sys_openat2+0x10f/0x1e0 fs/open.c:1417
 do_sys_open fs/open.c:1423 [inline]
 __do_sys_openat fs/open.c:1439 [inline]
 __se_sys_openat fs/open.c:1434 [inline]
 __x64_sys_openat+0x12d/0x210 fs/open.c:1434
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fb0988eba1e
Code: 08 0f 85 f5 e2 ff ff 49 89 fb 48 89 f0 48 89 d7 48 89 ce 4c 89 c2 4d 89 ca 4c 8b 44 24 08 4c 8b 4c 24 10 4c 89 5c 24 08 0f 05 <c3> 90 41 57 41 56 4d 89 c6 41 55 4d 89 cd 41 54 55 53 48 83 ec 08
RSP: 002b:00007fb098896158 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 00007fb0988966c0 RCX: 00007fb0988eba1e
RDX: 0000000000000002 RSI: 00007fb098937028 RDI: ffffffffffffff9c
RBP: 0000000000000021 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: ffffffffffffffd0
R13: 0000000000000000 R14: 00007ffc902179f0 R15: 00007ffc90217ad8
 </TASK>

Allocated by task 6038:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __kmalloc_cache_noprof+0x2f8/0x6d0 mm/slub.c:5563
 _kmalloc_noprof include/linux/slab.h:991 [inline]
 _kzalloc_noprof include/linux/slab.h:1312 [inline]
 gs_port_alloc drivers/usb/gadget/function/u_serial.c:1269 [inline]
 gserial_alloc_line_no_console+0xac/0x740 drivers/usb/gadget/function/u_serial.c:1349
 gserial_alloc_line+0x16/0xa0 drivers/usb/gadget/function/u_serial.c:1383
 acm_alloc_instance+0xd9/0x160 drivers/usb/gadget/function/f_acm.c:891
 try_get_usb_function_instance+0x136/0x1f0 drivers/usb/gadget/functions.c:28
 usb_get_function_instance+0x16/0x70 drivers/usb/gadget/functions.c:44
 function_make+0x18c/0x3f0 drivers/usb/gadget/configfs.c:626
 configfs_mkdir+0x525/0xd40 fs/configfs/dir.c:1369
 vfs_mkdir+0x364/0x850 fs/namei.c:5410
 filename_mkdirat+0x48b/0x5e0 fs/namei.c:5443
 __do_sys_mkdir fs/namei.c:5470 [inline]
 __se_sys_mkdir fs/namei.c:5467 [inline]
 __x64_sys_mkdir+0x6b/0x90 fs/namei.c:5467
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 6038:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 kasan_save_free_info+0x3b/0x70 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5f/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2748 [inline]
 slab_free mm/slub.c:6499 [inline]
 kfree+0x22b/0x6d0 mm/slub.c:6792
 tty_port_destructor drivers/tty/tty_port.c:294 [inline]
 kref_put include/linux/kref.h:65 [inline]
 tty_port_put drivers/tty/tty_port.c:309 [inline]
 tty_port_put+0x18d/0x1e0 drivers/tty/tty_port.c:306
 gserial_free_port+0x13e/0x2f0 drivers/usb/gadget/function/u_serial.c:1313
 gserial_free_line+0xf8/0x1e0 drivers/usb/gadget/function/u_serial.c:1330
 acm_free_instance+0x3b/0x60 drivers/usb/gadget/function/f_acm.c:875
 usb_put_function_instance+0x97/0xc0 drivers/usb/gadget/functions.c:77
 config_item_cleanup+0x146/0x240 fs/configfs/item.c:128
 config_item_release fs/configfs/item.c:137 [inline]
 kref_put include/linux/kref.h:65 [inline]
 config_item_put fs/configfs/item.c:149 [inline]
 config_item_put+0x93/0xb0 fs/configfs/item.c:146
 configfs_rmdir+0x5e3/0x950 fs/configfs/dir.c:1580
 vfs_rmdir fs/namei.c:5515 [inline]
 vfs_rmdir+0x328/0x8a0 fs/namei.c:5488
 filename_rmdir+0x31a/0x5c0 fs/namei.c:5572
 __do_sys_rmdir fs/namei.c:5595 [inline]
 __se_sys_rmdir fs/namei.c:5592 [inline]
 __x64_sys_rmdir+0x46/0x70 fs/namei.c:5592
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff888036443000
 which belongs to the cache kmalloc-2k of size 2048
The buggy address is located 928 bytes inside of
 freed 2048-byte region [ffff888036443000, ffff888036443800)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x36440
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88801c042f00 dead000000000100 dead000000000122
raw: 0000000000000000 0000000000080008 00000000f5000000 0000000000000000
head: 00fff00000000040 ffff88801c042f00 dead000000000100 dead000000000122
head: 0000000000000000 0000000000080008 00000000f5000000 0000000000000000
head: 00fff00000000003 fffffffffffffe01 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 6038, tgid 6038 (syz-executor276), ts 77096280293
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
 __kmalloc_cache_noprof+0x4f4/0x6d0 mm/slub.c:5559
 _kmalloc_noprof include/linux/slab.h:991 [inline]
 _kzalloc_noprof include/linux/slab.h:1312 [inline]
 gs_port_alloc drivers/usb/gadget/function/u_serial.c:1269 [inline]
 gserial_alloc_line_no_console+0xac/0x740 drivers/usb/gadget/function/u_serial.c:1349
 gserial_alloc_line+0x16/0xa0 drivers/usb/gadget/function/u_serial.c:1383
 acm_alloc_instance+0xd9/0x160 drivers/usb/gadget/function/f_acm.c:891
 try_get_usb_function_instance+0x136/0x1f0 drivers/usb/gadget/functions.c:28
 usb_get_function_instance+0x16/0x70 drivers/usb/gadget/functions.c:44
 function_make+0x18c/0x3f0 drivers/usb/gadget/configfs.c:626
 configfs_mkdir+0x525/0xd40 fs/configfs/dir.c:1369
 vfs_mkdir+0x364/0x850 fs/namei.c:5410
 filename_mkdirat+0x48b/0x5e0 fs/namei.c:5443
page last free pid 1169 tgid 1169 ts 76886153795 stack trace:
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
 copy_signal kernel/fork.c:1746 [inline]
 copy_process+0x3075/0x8370 kernel/fork.c:2304
 kernel_clone+0x176/0x9d0 kernel/fork.c:2766
 user_mode_thread+0xd1/0x120 kernel/fork.c:2843
 call_usermodehelper_exec_sync kernel/umh.c:130 [inline]
 call_usermodehelper_exec_work+0x6b/0x180 kernel/umh.c:161
 process_one_work+0xac7/0x1b10 kernel/workqueue.c:3396
 process_scheduled_works kernel/workqueue.c:3479 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3560
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Memory state around the buggy address:
 ffff888036443280: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888036443300: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff888036443380: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                               ^
 ffff888036443400: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888036443480: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


Tested on:

commit:         893e1178 Merge tag 'x86_urgent_for_7.3-rc3' of git://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=167e2ef9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c5c3949d762a91f
dashboard link: https://syzkaller.appspot.com/bug?extid=fe63e4d633540f230624
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1006d749580000

