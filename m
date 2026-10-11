Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB5C33FE09
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 08:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791707383; cv=none; b=USJhQPY+ThYJbHd2M/5zJWWWUnWJlaXTrIhRpnL5YBNbcSDabYD5z1UP6FVgvOSYhgOQkQs+5nhVDAHSTukRFWQg9jEeIopiGFneqGw2ovYE6SEa8PvzOjF239P6+g3hpiphb0UF7FEykjjLOBtH5/JrDQ7bAvr7/468qGsyqC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791707383; c=relaxed/simple;
	bh=0vuPLIw4xTywYGZ7S9XXR6BizcrvK1BtwaubE0dH18c=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=JelVPLVusjonTxyI5Hos5m4f0l7xf3UN6HpIdHE7Iq4ZQqPbWhuIQGN440qNHt4WgbqiD0Fy8Q7CeoC7NN7m5v1CuCG09ExnIazaSUwbbqV4kCAUila93+84+QR1kPtUmXMEny/iKdlKde13T54qqyrgewFWMo5x1leiPuZG7LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4f2040e10d8so1071493b6e.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 01:29:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791707381; x=1792312181;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=B/DSUiKtkFLYgy5lc4mPIdl1tA5a00PBWwdHtTRvEQY=;
        b=KSZCsR528QrW47FaqNRzeMMb8Tel1CZM3GImENPtsDsEvDazHDRPsrLmm3Z6Qk/cDe
         2F/sQCf1f5fDzyr6wiwWqEr76wBRmN0KI0CxsKX8BF3qGoG2r4zftcWykveV3J2X5t4d
         7QiWXXiEkma4pdYr7a+T75LzGun7iD8iXAUnUdEynF4vsI/OPbsyd3l/Eq6sXnPDicb7
         VMOmbs4rLbg1tMvWxrXTvsKuNNQeJ/HOG9x1f68cF5gTGS+mrBjIb1uP7YJVsefDpE1X
         JowZI0YekLu0S7xuCGBoO9wXWOrEZd81vyZ2D9NJmMdQN7inM4YLzp9fj7F5FtRtaKqb
         gvsg==
X-Forwarded-Encrypted: i=1; AKwUvBxSpP27FJuoUGJKYNau+6RQNauWlLZpezHVrIc1exEUd2RZXccGIBIgFi5P6Er5VJzola8L34wcliNBTS0=@vger.kernel.org
X-Gm-Message-State: AFq9FYK2LEzFzfGjmf4kGb5UNKWScphrxJwGJo9dus0hY9NgX7BOgLfH
	Fr8J+kaOB5/cS+A2wQl7DHmkEPuygeC31L/mUwQk26Kvzpu+czYOQPJhoMmogOuyuwaZ6nb585T
	3Vs/0CuJCfbeQBE9S2RLO7W8sGO4mg0Rv5gsgm0G/YvN+Sfez2treV3tiptM=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2e4d:b0:4d6:92b3:5c84 with SMTP id
 5614622812f47-50c58042fcfmr5768595b6e.65.1791707381187; Sun, 11 Oct 2026
 01:29:41 -0700 (PDT)
Date: Sun, 11 Oct 2026 01:29:41 -0700
In-Reply-To: <6a6d3a2e.6ce73036.24301b.0009.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6acb48f5.bbc4c7f9.15faa7.007e.GAE@google.com>
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Write in pn_bind
From: syzbot <syzbot+098999e05b6b877c01b3@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, khiemtranzo532001@gmail.com, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    a5ebb76233b7 Merge tag 'edac_urgent_for_v7.3_rc7' of git:/..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=15860f15580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=df4bbab1c2172b9f
dashboard link: https://syzkaller.appspot.com/bug?extid=098999e05b6b877c01b3
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1506fc3e580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+098999e05b6b877c01b3@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in gphonet_set_gadget drivers/usb/gadget/function/f_phonet.c:720 [inline]
BUG: KASAN: slab-use-after-free in pn_bind+0x106/0xb20 drivers/usb/gadget/function/f_phonet.c:510
Write of size 8 at addr ffff888034f78900 by task syz.0.19/6513

CPU: 0 UID: 0 PID: 6513 Comm: syz.0.19 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/07/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description+0x55/0x1e0 mm/kasan/report.c:378
 print_report+0x58/0x70 mm/kasan/report.c:482
 kasan_report+0x117/0x150 mm/kasan/report.c:595
 gphonet_set_gadget drivers/usb/gadget/function/f_phonet.c:720 [inline]
 pn_bind+0x106/0xb20 drivers/usb/gadget/function/f_phonet.c:510
 usb_add_function+0x290/0x930 drivers/usb/gadget/composite.c:333
 configfs_composite_bind+0xde0/0x1410 drivers/usb/gadget/configfs.c:1802
 gadget_bind_driver+0x2ca/0x9e0 drivers/usb/gadget/udc/core.c:1662
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x254/0xae0 drivers/base/dd.c:706
 __driver_probe_device+0x1e8/0x360 drivers/base/dd.c:868
 driver_probe_device+0x4f/0x240 drivers/base/dd.c:898
 __driver_attach+0x339/0x600 drivers/base/dd.c:1292
 bus_for_each_dev+0x23e/0x2c0 drivers/base/bus.c:383
 bus_add_driver+0x348/0x670 drivers/base/bus.c:763
 driver_register+0x23a/0x320 drivers/base/driver.c:174
 usb_gadget_register_driver_owner+0xf9/0x270 drivers/usb/gadget/udc/core.c:1752
 gadget_dev_desc_UDC_store+0x1c9/0x2f0 drivers/usb/gadget/configfs.c:300
 flush_write_buffer fs/configfs/file.c:207 [inline]
 configfs_write_iter+0x33a/0x430 fs/configfs/file.c:229
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x61e/0xbb0 fs/read_write.c:687
 ksys_write+0x156/0x270 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f8b0ad5e0d9
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f8b0a3be028 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007f8b0afe5fa0 RCX: 00007f8b0ad5e0d9
RDX: 000000000000000b RSI: 0000200000000280 RDI: 0000000000000003
RBP: 00007f8b0a3be090 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000002
R13: 00007f8b0afe6038 R14: 00007f8b0afe5fa0 R15: 00007ffddd2a1878
 </TASK>

Allocated by task 6508:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:409 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:426
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __do_kmalloc_node mm/slub.c:5414 [inline]
 __kvmalloc_node_noprof+0x5b4/0x890 mm/slub.c:7015
 alloc_netdev_mqs+0xa9/0x12c0 net/core/dev.c:12163
 gphonet_setup_default drivers/usb/gadget/function/f_phonet.c:706 [inline]
 phonet_alloc_inst+0xa4/0x190 drivers/usb/gadget/function/f_phonet.c:640
 try_get_usb_function_instance drivers/usb/gadget/functions.c:28 [inline]
 usb_get_function_instance+0xe3/0x2f0 drivers/usb/gadget/functions.c:44
 function_make+0x127/0x360 drivers/usb/gadget/configfs.c:626
 configfs_mkdir+0x4f6/0x9e0 fs/configfs/dir.c:1369
 vfs_mkdir+0x408/0x620 fs/namei.c:5439
 filename_mkdirat+0x289/0x520 fs/namei.c:5472
 __do_sys_mkdirat fs/namei.c:5493 [inline]
 __se_sys_mkdirat+0x35/0x150 fs/namei.c:5490
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 6510:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 kasan_save_free_info+0x40/0x50 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:264 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:296
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2748 [inline]
 slab_free mm/slub.c:6509 [inline]
 kfree+0x1c5/0x6d0 mm/slub.c:6802
 device_release+0xc4/0x1f0 drivers/base/core.c:-1
 kobject_cleanup lib/kobject.c:689 [inline]
 kobject_release lib/kobject.c:720 [inline]
 kref_put include/linux/kref.h:65 [inline]
 kobject_put+0x222/0x550 lib/kobject.c:737
 gphonet_register_netdev drivers/usb/gadget/function/f_phonet.c:729 [inline]
 pn_bind+0x131/0xb20 drivers/usb/gadget/function/f_phonet.c:511
 usb_add_function+0x290/0x930 drivers/usb/gadget/composite.c:333
 configfs_composite_bind+0xde0/0x1410 drivers/usb/gadget/configfs.c:1802
 gadget_bind_driver+0x2ca/0x9e0 drivers/usb/gadget/udc/core.c:1662
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x254/0xae0 drivers/base/dd.c:706
 __driver_probe_device+0x1e8/0x360 drivers/base/dd.c:868
 driver_probe_device+0x4f/0x240 drivers/base/dd.c:898
 __driver_attach+0x339/0x600 drivers/base/dd.c:1292
 bus_for_each_dev+0x23e/0x2c0 drivers/base/bus.c:383
 bus_add_driver+0x348/0x670 drivers/base/bus.c:763
 driver_register+0x23a/0x320 drivers/base/driver.c:174
 usb_gadget_register_driver_owner+0xf9/0x270 drivers/usb/gadget/udc/core.c:1752
 gadget_dev_desc_UDC_store+0x1c9/0x2f0 drivers/usb/gadget/configfs.c:300
 flush_write_buffer fs/configfs/file.c:207 [inline]
 configfs_write_iter+0x33a/0x430 fs/configfs/file.c:229
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x61e/0xbb0 fs/read_write.c:687
 ksys_write+0x156/0x270 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff888034f78000
 which belongs to the cache kmalloc-cg-8k of size 8192
The buggy address is located 2304 bytes inside of
 freed 8192-byte region [ffff888034f78000, ffff888034f7a000)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x34f78
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
memcg:ffff888034f7a011
flags: 0x80000000000040(head|node=0|zone=1)
page_type: f5(slab)
raw: 0080000000000040 ffff88813ff08640 dead000000000100 dead000000000122
raw: 0000000000000000 0000000300020002 00000000f5000000 ffff888034f7a011
head: 0080000000000040 ffff88813ff08640 dead000000000100 dead000000000122
head: 0000000000000000 0000000300020002 00000000f5000000 ffff888034f7a011
head: 0080000000000003 fffffffffffffe01 00000000ffffffff 00000000ffffffff
head: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd60c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_RETRY_MAYFAIL|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 72, tgid 72 (kworker/u8:4), ts 112596841346
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
 __kvmalloc_node_noprof+0x6f4/0x890 mm/slub.c:7015
 alloc_netdev_mqs+0xa9/0x12c0 net/core/dev.c:12163
 nsim_create+0x87/0x1160 drivers/net/netdevsim/netdev.c:1136
 __nsim_dev_port_add+0x7f8/0xcd0 drivers/net/netdevsim/dev.c:1434
 nsim_dev_port_add_all+0x37/0xf0 drivers/net/netdevsim/dev.c:1495
 nsim_dev_reload_create drivers/net/netdevsim/dev.c:1547 [inline]
 nsim_dev_reload_up+0x4dd/0x880 drivers/net/netdevsim/dev.c:983
 devlink_reload+0x4bb/0x890 net/devlink/dev.c:475
 devlink_pernet_pre_exit+0x1ff/0x420 net/devlink/core.c:584
 ops_pre_exit_list net/core/net_namespace.c:161 [inline]
 ops_undo_list+0x17d/0x8d0 net/core/net_namespace.c:235
 cleanup_net+0x575/0x810 net/core/net_namespace.c:706
page last free pid 5849 tgid 5849 ts 110263695073 stack trace:
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
 kmem_cache_alloc_noprof+0x360/0x690 mm/slub.c:5010
 vm_area_dup+0x28/0x750 mm/vma_init.c:128
 __split_vma+0x1d7/0xa00 mm/vma.c:560
 vms_gather_munmap_vmas+0x322/0x1370 mm/vma.c:1507
 do_vmi_align_munmap+0x2c7/0x4d0 mm/vma.c:1675
 do_vmi_munmap+0x252/0x2d0 mm/vma.c:1732
 __vm_munmap+0x241/0x3e0 mm/vma.c:3415
 __do_sys_munmap mm/mmap.c:1094 [inline]
 __se_sys_munmap mm/mmap.c:1091 [inline]
 __x64_sys_munmap+0x60/0x70 mm/mmap.c:1091
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffff888034f78800: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888034f78880: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff888034f78900: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                   ^
 ffff888034f78980: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888034f78a00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
