Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792852903;
	b=dWxg6yqtEsec6EY4VCo2tsyyLkuPORefsohXVl8PYQAaZlKb7rUSA9INDMNXG+u7fyZO
	 U6CWXkFJAx3NR/JRV++r/f2LWa33H2NPfw/6JZ57yvqV6Hnd4J4awNctOYeA3lKvhSDp6
	 Qh4RAoVmhrRiTItf7NvBpNo4KrlxTT3CU2kDlb+SiYs3U6u7eTiARCO8+Rl7yI+evcwz5
	 ghizmAVPdVjt1EyrUBzGj2a9nD1CqDmjNFKpBDLIEa2mi2REpngqtFM2uNB13s1V79tvA
	 K8h10joKIk8kng2mGLiVo1Trr83nsW/7gdnaducdv4KXSjJlybM2uKAaOTpe1WvF1uA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792852903;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=NjRRrK1A9aiWW7ngCjfuyTDCyUlnM9kGQxisEphXFAk=;
	b=L3ZN2kV3uK2DBNqp7tKYZMEQXQeTi7Z8VPc4ehT6da681D0+fE6Pur0/OYKWkr34bbkW
	 tV7Nvcj3f1xcWEH9eavH9bP5ewMWrP/SglTSLUJQxX5QuQEyyuKZrTsL7EBxQS0JxeTAp
	 c4yuAddxKn4N55QTOmilNOLH9zYygxOEjFe94xPk4QtofjTTBSfKerhP5gbHHmf4qURad
	 poSgDNpaMl45/QImsHJU22i2VfpZ9gAClMTD0wPjIYJG7FG5Tmz6NARNqo+jeIhPQTNfz
	 EOmPyUHYgkjjZ4gs8D13hKHvSlNwMnL166mRwDXUF1C9qPQ5ghlyTAu/SnB1fw2+EpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C31B606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 14:41:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C31B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4c734afb8deso2602476b6e.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 07:41:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792852901; x=1793457701;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NjRRrK1A9aiWW7ngCjfuyTDCyUlnM9kGQxisEphXFAk=;
        b=aQuUKcyKY4d4w3HL00dtPTSCACCPVcM/SjN22tUD50v1W3XrmWBSXwkBEymnEj2FtM
         4qSpu5S1tuaOqAquMi+WDQBSrNfgT7+UaDBUpwgGGRzjLqxyW36HsGIKRQBomASqkfxF
         Zp0r996qFtYJekszJ8akkMPrsohDwcamnXHF9SyPUMLIcI2MvxQgPep9nRwsolOJjj/Z
         ooOSnq8Wz7Ku8GmYl+rwHl3Xb7eGmJAiX8DJwMiA+ODne9r7v3JkkXUyCFBdH/Ur7F8V
         iIemDpyTQrxQD7C8Ea4AUhpc40hBpDki2DaSNnuwtvfqpz+Zrv1WvZDy0BRCmnBsuWf8
         QjHA==
X-Gm-Message-State: AFq9FYK8J5t8vm/AHjrOV+O3Pmj3vVzCZbht72u35VaPCnn6KGRKECTy
	2YTjTiNMOR0iLPtupGN3hESVV6CIWW9A1EitVACwxAmxOW3pI/cFYm0/NMjBh5V+Y64c0SfV7tv
	F6LRL3oU0o0KYKYmkEx9aJJUv/Pwg2Sn0fBtXrFdj/zeMU8bv2fiIrdyEOTk=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1b2b:b0:4f4:73a9:f853 with SMTP id
 5614622812f47-55bfff91bbdmr1235432b6e.1.1792852901630; Sat, 24 Oct 2026
 07:41:41 -0700 (PDT)
Date: Sat, 24 Oct 2026 07:41:41 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6adcc3a5.a6443767.132891.0002.GAE@google.com>
Subject: [syzbot] KASAN: invalid-free in raw_ioctl (2)
From: syzbot <syzbot+b7534c9b380f81a3b4be@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    f47d223627f8 Merge tag 'vfs-7.4-rc1.sync_close' of git://g..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=134b0771580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3f8ca06f873742e5
dashboard link: https://syzkaller.appspot.com/bug?extid=b7534c9b380f81a3b4be
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1207ca35580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+b7534c9b380f81a3b4be@syzkaller.appspotmail.com

raw-gadget.1 gadget.2: fail, usb_ep_enable returned -108
==================================================================
BUG: KASAN: double-free in raw_ioctl_ep_enable drivers/usb/gadget/legacy/raw_gadget.c:914 [inline]
BUG: KASAN: double-free in raw_ioctl+0x2413/0x41c0 drivers/usb/gadget/legacy/raw_gadget.c:1319
Free of addr ffff88802d076e20 by task syz-executor119/6042

CPU: 1 UID: 0 PID: 6042 Comm: syz-executor119 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/07/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description+0x55/0x1e0 mm/kasan/report.c:378
 print_report+0x58/0x70 mm/kasan/report.c:482
 kasan_report_invalid_free+0xea/0x110 mm/kasan/report.c:557
 check_slab_allocation mm/kasan/common.c:-1 [inline]
 __kasan_slab_pre_free+0x104/0x120 mm/kasan/common.c:272
 kasan_slab_pre_free include/linux/kasan.h:199 [inline]
 slab_free_hook mm/slub.c:2693 [inline]
 slab_free mm/slub.c:6509 [inline]
 kfree+0x173/0x650 mm/slub.c:6802
 raw_ioctl_ep_enable drivers/usb/gadget/legacy/raw_gadget.c:914 [inline]
 raw_ioctl+0x2413/0x41c0 drivers/usb/gadget/legacy/raw_gadget.c:1319
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fea742a1c6b
Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
RSP: 002b:00007fea73a68060 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 000000000000000a RCX: 00007fea742a1c6b
RDX: 00007fea73a680c8 RSI: 0000000040095505 RDI: 0000000000000004
RBP: 0000000000000004 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007fea73a680e0
R13: 00007fea73a680c8 R14: 00007ffc0b27cfc0 R15: 00007ffc0b27d0a8
 </TASK>

Allocated by task 6042:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:409 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:426
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __do_kmalloc_node mm/slub.c:5414 [inline]
 __kmalloc_node_track_caller_noprof+0x4b4/0x720 mm/slub.c:5545
 memdup_user+0x2b/0xd0 mm/util.c:221
 raw_ioctl_ep_enable drivers/usb/gadget/legacy/raw_gadget.c:848 [inline]
 raw_ioctl+0xdbc/0x41c0 drivers/usb/gadget/legacy/raw_gadget.c:1319
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 6041:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 kasan_save_free_info+0x40/0x50 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:264 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:296
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2748 [inline]
 slab_free mm/slub.c:6509 [inline]
 kfree+0x1c5/0x650 mm/slub.c:6802
 dev_free+0x43f/0x750 drivers/usb/gadget/legacy/raw_gadget.c:226
 kref_put include/linux/kref.h:65 [inline]
 raw_release+0x199/0x260 drivers/usb/gadget/legacy/raw_gadget.c:474
 __fput+0x40d/0xa50 fs/file_table.c:512
 fput_close_sync+0x11f/0x240 fs/file_table.c:618
 filp_close_sync fs/open.c:1573 [inline]
 __do_sys_close fs/open.c:1596 [inline]
 __se_sys_close+0xa2/0x160 fs/open.c:1583
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff88802d076e20
 which belongs to the cache kmalloc-16 of size 16
The buggy address is located 0 bytes inside of
 16-byte region [ffff88802d076e20, ffff88802d076e30)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x2d076
flags: 0xfff00000000000(node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000000 ffff88801c041640 dead000000000100 dead000000000122
raw: 0000000000000000 0000000000800080 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0xd2c00(GFP_NOIO|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 29, tgid 29 (kworker/1:1), ts 14572529785
 set_page_owner include/linux/page_owner.h:33 [inline]
 post_alloc_hook+0x1f9/0x250 mm/page_alloc.c:1871
 prep_new_page mm/page_alloc.c:1879 [inline]
 get_page_from_freelist+0x2209/0x2280 mm/page_alloc.c:3943
 __alloc_frozen_pages_noprof+0x217/0x5a0 mm/page_alloc.c:5436
 alloc_slab_page mm/slub.c:3347 [inline]
 allocate_slab+0x7d/0x620 mm/slub.c:3462
 new_slab mm/slub.c:3513 [inline]
 refill_objects+0x2d5/0x350 mm/slub.c:7418
 refill_sheaf mm/slub.c:2885 [inline]
 __pcs_replace_empty_main+0x2c8/0x6c0 mm/slub.c:4774
 alloc_from_pcs mm/slub.c:4850 [inline]
 slab_alloc_node mm/slub.c:4984 [inline]
 __do_kmalloc_node mm/slub.c:5413 [inline]
 __kmalloc_noprof+0x47b/0x720 mm/slub.c:5439
 _kmalloc_noprof include/linux/slab.h:995 [inline]
 _kzalloc_noprof include/linux/slab.h:1312 [inline]
 rh_call_control drivers/usb/core/hcd.c:486 [inline]
 rh_urb_enqueue drivers/usb/core/hcd.c:817 [inline]
 usb_hcd_submit_urb+0x893/0x1b60 drivers/usb/core/hcd.c:1538
 usb_start_wait_urb+0x13f/0x5b0 drivers/usb/core/message.c:62
 usb_internal_control_msg drivers/usb/core/message.c:117 [inline]
 usb_control_msg+0x234/0x3e0 drivers/usb/core/message.c:167
 get_port_status drivers/usb/core/hub.c:610 [inline]
 hub_ext_port_status+0x112/0x840 drivers/usb/core/hub.c:627
 usb_hub_port_status drivers/usb/core/hub.c:677 [inline]
 hub_activate+0x737/0x1ad0 drivers/usb/core/hub.c:1193
 process_one_work kernel/workqueue.c:3396 [inline]
 process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3479
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3560
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
page_owner free stack trace missing

Memory state around the buggy address:
 ffff88802d076d00: 00 01 fc fc 00 01 fc fc fa fb fc fc 00 01 fc fc
 ffff88802d076d80: 00 01 fc fc 00 00 fc fc 00 00 fc fc 00 00 fc fc
>ffff88802d076e00: 00 01 fc fc fa fb fc fc fa fb fc fc 00 01 fc fc
                               ^
 ffff88802d076e80: fa fb fc fc fa fb fc fc 00 01 fc fc 00 01 fc fc
 ffff88802d076f00: 00 01 fc fc 00 00 fc fc 00 04 fc fc 00 04 fc fc
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
