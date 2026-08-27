Received: from mail-oi2-f4.google.com (mail-oi2-f4.google.com [74.125.231.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70FA4DA559
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787856821; cv=none; b=SZKXwpwlmjte9kn90D+Jti+eWzNIpphIGjjLowUm4Em6b92HlcaSW7DHsWxUvDGMzEIBibL5n7KUlTqZww5H8s5TDZNWfEJxlj8+wNNMFalhvgA9h46MADh5Y8ldj8H3GcMeuJBovZ8x/KxTGjS5z/MtcG5LsUFWFZmxoprfGiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787856821; c=relaxed/simple;
	bh=iaN/4u6361qQxz+55/dYN/c/M2gbiI8ALO9x2zvxqHQ=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=dM1HnTP2IK4+rXs3CrRbcvkvsiKAq0LCy+5vihz+VshSF+NrcmJ0SDSZtH2YAUxOTui2cyrhsY5qHYOYjuiHVNZJNMPPi/+wwJ1iBGY5q7fgtxUtgK/rp216VzNFM1qC35xQ7o22Y16jnEEDA4PBxhb5C45q4zrSec6AFfXu2Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi2-f4.google.com with SMTP id 5614622812f47-4ab2d8e7e4cso78879b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:53:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787856804; x=1788461604;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a6dn4f5aEIwbpKJdwOuExKeoWNlh36i9YANW9BkFg7w=;
        b=KqHE6tjNZ3wuzMeYhVAQqPlABIm8J2BcmySbjoS6kzsPintq6di1Y4lyO8xiObjWbI
         hKg4yEeAT1nQUf/KmbTCMFE7GW3bhPBLYwTiYcwXDKK2Il2RnFeYbWWevRoDxXvskBQk
         Z9rZyhNkAqYr1UEk/figkHRqq8hA/7FmR6fRqz1HyPZ+HKc//pgSpT/YdfqL0z8dHqwJ
         7zGpo5bgVMfmZEGY181KW8q9kmbAtHzyptDMwvi0NClZ+5PYficU3f+yTO4GFaJCdQpV
         eF05UA/ZF0wW7DhCUi6V8uIXR4zHbbfuRMACSdBGvV0x2HfzMpxc/WwylSpJwC7ssewt
         gXpA==
X-Forwarded-Encrypted: i=1; AHgh+RrGl6NjSjWaGjgeKcLNwk9WmXQ9bRm3T4eLOCAxBlJFQt5U+hEEaxSY7GIgmpyYejwKBrfU/u7839pVN8M=@vger.kernel.org
X-Gm-Message-State: AFuF++lHJi/JrX07pgvm+N6c3GlT4LskS2VG0aZgMqXkaQzmQvL6mnIv
	43WvZVxjk02YtYjYiJN9egJ1L8arIYt9idDNF1yxEI5CHDpKCae48Q+2XCeA5R4ioxmTu2nncvH
	A/LW5isdAXiigK9GCz45hTKtRKFOTVa7kwm99ZR/l2LPJ8/VQH+NqKMcTQlY=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1c0e:b0:486:8a11:6e8b with SMTP id
 5614622812f47-4b397f9f538mr1447947b6e.2.1787856804474; Thu, 27 Aug 2026
 11:53:24 -0700 (PDT)
Date: Thu, 27 Aug 2026 11:53:24 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9087a4.4d659fcc.734b4.0014.GAE@google.com>
Subject: [syzbot] [media?] [usb?] KASAN: slab-use-after-free Read in sd_stopN
From: syzbot <syzbot+537b5eb78cebbff5ea70@syzkaller.appspotmail.com>
To: hverkuil@kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-usb@vger.kernel.org, mchehab@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    818bebeb63dd drm/xe: Don't hand out the flat CCS storage a..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13fff549580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ccca94d2c01b9e78
dashboard link: https://syzkaller.appspot.com/bug?extid=537b5eb78cebbff5ea70
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10b2f979580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-818bebeb.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/6e4100526b12/vmlinux-818bebeb.xz
kernel image: https://storage.googleapis.com/syzbot-assets/723c4783ee96/bzImage-818bebeb.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+537b5eb78cebbff5ea70@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in sd_stopN+0xaf/0xc0 drivers/media/usb/gspca/ov534_9.c:1615
Read of size 4 at addr ffff8880582fc000 by task syz.2.154/6638

CPU: 1 UID: 0 PID: 6638 Comm: syz.2.154 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x13d/0x4b0 mm/kasan/report.c:482
 kasan_report+0xdf/0x1c0 mm/kasan/report.c:595
 sd_stopN+0xaf/0xc0 drivers/media/usb/gspca/ov534_9.c:1615
 gspca_stream_off+0xd5/0x470 drivers/media/usb/gspca/gspca.c:737
 gspca_stop_streaming+0x34/0x50 drivers/media/usb/gspca/gspca.c:1365
 __vb2_queue_cancel+0xb8/0xe90 drivers/media/common/videobuf2/videobuf2-core.c:2199
 vb2_core_streamoff+0x5e/0x140 drivers/media/common/videobuf2/videobuf2-core.c:2376
 __vb2_cleanup_fileio.isra.0+0x6e/0x160 drivers/media/common/videobuf2/videobuf2-core.c:2974
 vb2_core_queue_release+0x1f/0x190 drivers/media/common/videobuf2/videobuf2-core.c:2676
 vb2_queue_release drivers/media/common/videobuf2/videobuf2-v4l2.c:943 [inline]
 _vb2_fop_release+0xe8/0x280 drivers/media/common/videobuf2/videobuf2-v4l2.c:1146
 v4l2_release+0x280/0x390 drivers/media/v4l2-core/v4l2-dev.c:471
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
RIP: 0033:0x7f0daab9e0d9
Code: Unable to access opcode bytes at 0x7f0daab9e0af.
RSP: 002b:00007f0daba48028 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
RAX: fffffffffffffe00 RBX: 00007f0daae26090 RCX: 00007f0daab9e0d9
RDX: 0000000000001000 RSI: 0000200000000600 RDI: 0000000000000005
RBP: 00007f0daac35024 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f0daae26128 R14: 00007f0daae26090 R15: 00007ffd25d699f8
 </TASK>

Allocated by task 2317:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __kmalloc_cache_noprof+0x2e7/0x6b0 mm/slub.c:5484
 _kmalloc_noprof include/linux/slab.h:988 [inline]
 _kzalloc_noprof include/linux/slab.h:1309 [inline]
 usb_alloc_dev+0x55/0x1090 drivers/usb/core/usb.c:651
 hub_port_connect drivers/usb/core/hub.c:5478 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5715 [inline]
 port_event drivers/usb/core/hub.c:5879 [inline]
 hub_event+0x2b93/0x4420 drivers/usb/core/hub.c:5961
 process_one_work+0xac7/0x1b10 kernel/workqueue.c:3387
 process_scheduled_works kernel/workqueue.c:3470 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3551
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Freed by task 2317:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 kasan_save_free_info+0x3b/0x70 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5f/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2678 [inline]
 slab_free mm/slub.c:6372 [inline]
 kfree+0x22b/0x6c0 mm/slub.c:6687
 device_release+0xd2/0x270 drivers/base/core.c:2640
 kobject_cleanup lib/kobject.c:689 [inline]
 kobject_release lib/kobject.c:720 [inline]
 kref_put include/linux/kref.h:65 [inline]
 kobject_put+0x1f7/0x640 lib/kobject.c:737
 put_device+0x1f/0x30 drivers/base/core.c:3884
 hub_port_connect drivers/usb/core/hub.c:5415 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5715 [inline]
 port_event drivers/usb/core/hub.c:5879 [inline]
 hub_event+0x1bb1/0x4420 drivers/usb/core/hub.c:5961
 process_one_work+0xac7/0x1b10 kernel/workqueue.c:3387
 process_scheduled_works kernel/workqueue.c:3470 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3551
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

The buggy address belongs to the object at ffff8880582fc000
 which belongs to the cache kmalloc-2k of size 2048
The buggy address is located 0 bytes inside of
 freed 2048-byte region [ffff8880582fc000, ffff8880582fc800)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffff8880582fa000 pfn:0x582f8
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000240(workingset|head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000240 ffff88801c042f00 ffffea0000d28010 ffffea0001636a10
raw: ffff8880582fa000 0000000800080006 00000000f5000000 0000000000000000
head: 00fff00000000240 ffff88801c042f00 ffffea0000d28010 ffffea0001636a10
head: ffff8880582fa000 0000000800080006 00000000f5000000 0000000000000000
head: 00fff00000000003 fffffffffffffe01 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5872, tgid 5872 (syz-executor), ts 140556794415
 set_page_owner include/linux/page_owner.h:33 [inline]
 post_alloc_hook+0xfd/0x120 mm/page_alloc.c:1871
 prep_new_page mm/page_alloc.c:1879 [inline]
 get_page_from_freelist+0x110d/0x35b0 mm/page_alloc.c:3943
 __alloc_frozen_pages_noprof+0x2eb/0x3300 mm/page_alloc.c:5436
 alloc_slab_page mm/slub.c:3267 [inline]
 allocate_slab mm/slub.c:3382 [inline]
 new_slab+0xa5/0x640 mm/slub.c:3428
 refill_objects+0xe3/0x410 mm/slub.c:7305
 refill_sheaf mm/slub.c:2805 [inline]
 __pcs_replace_empty_main+0x372/0x680 mm/slub.c:4677
 alloc_from_pcs mm/slub.c:4775 [inline]
 slab_alloc_node mm/slub.c:4907 [inline]
 __kmalloc_cache_noprof+0x47b/0x6b0 mm/slub.c:5480
 _kmalloc_noprof include/linux/slab.h:988 [inline]
 rtnl_newlink+0x139/0x2620 net/core/rtnetlink.c:4113
 rtnetlink_rcv_msg+0x95e/0xe90 net/core/rtnetlink.c:7132
 netlink_rcv_skb+0x159/0x420 net/netlink/af_netlink.c:2556
 netlink_unicast_kernel net/netlink/af_netlink.c:1319 [inline]
 netlink_unicast+0x585/0x850 net/netlink/af_netlink.c:1345
 netlink_sendmsg+0x8b0/0xda0 net/netlink/af_netlink.c:1900
 sock_sendmsg_nosec net/socket.c:800 [inline]
 __sock_sendmsg net/socket.c:815 [inline]
 __sys_sendto+0x48b/0x4e0 net/socket.c:2281
 __do_sys_sendto net/socket.c:2288 [inline]
 __se_sys_sendto net/socket.c:2284 [inline]
 __x64_sys_sendto+0xe0/0x1c0 net/socket.c:2284
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
page last free pid 5872 tgid 5872 ts 140543763839 stack trace:
 reset_page_owner include/linux/page_owner.h:26 [inline]
 __free_pages_prepare mm/page_alloc.c:1418 [inline]
 __free_frozen_pages+0x79f/0x10f0 mm/page_alloc.c:2962
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x47/0xf0 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x1a0/0x1f0 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x69/0x90 mm/kasan/common.c:350
 kasan_slab_alloc include/linux/kasan.h:253 [inline]
 slab_post_alloc_hook mm/slub.c:4586 [inline]
 slab_alloc_node mm/slub.c:4919 [inline]
 __do_kmalloc_node mm/slub.c:5336 [inline]
 __kvmalloc_node_noprof+0x2ed/0x970 mm/slub.c:6900
 netif_alloc_netdev_queues net/core/dev.c:11291 [inline]
 alloc_netdev_mqs+0xb4e/0x15c0 net/core/dev.c:12187
 rtnl_create_link+0xc13/0xf80 net/core/rtnetlink.c:3777
 rtnl_newlink_create net/core/rtnetlink.c:3959 [inline]
 __rtnl_newlink net/core/rtnetlink.c:4098 [inline]
 rtnl_newlink+0x15bc/0x2620 net/core/rtnetlink.c:4215
 rtnetlink_rcv_msg+0x95e/0xe90 net/core/rtnetlink.c:7132
 netlink_rcv_skb+0x159/0x420 net/netlink/af_netlink.c:2556
 netlink_unicast_kernel net/netlink/af_netlink.c:1319 [inline]
 netlink_unicast+0x585/0x850 net/netlink/af_netlink.c:1345
 netlink_sendmsg+0x8b0/0xda0 net/netlink/af_netlink.c:1900
 sock_sendmsg_nosec net/socket.c:800 [inline]
 __sock_sendmsg net/socket.c:815 [inline]
 __sys_sendto+0x48b/0x4e0 net/socket.c:2281
 __do_sys_sendto net/socket.c:2288 [inline]
 __se_sys_sendto net/socket.c:2284 [inline]
 __x64_sys_sendto+0xe0/0x1c0 net/socket.c:2284
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffff8880582fbf00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff8880582fbf80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff8880582fc000: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                   ^
 ffff8880582fc080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff8880582fc100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
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
