Received: from mail-oi2-f11.google.com (mail-oi2-f11.google.com [74.125.231.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FA4125A0
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 00:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789864119; cv=none; b=TTjJ2T8oQ2ykyxXxE/Izf9CzHFBb9vGpg5XGFZYnHnJDCiO64sppAApEPCr/zNNp5GDijk6jgJgmypVbwLYQ2V11eIYn21jqX4RNWJm7ZKZikn1pMN0t5G4N068Awie9tsEKMxFmZSMaSlg+AZDDFK70g7FHtchDIWfpST5B4x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789864119; c=relaxed/simple;
	bh=J85FaY8hAWBjhygK/XgUN89yhwVad/Lz+KB4pdXzSjY=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Gqx+uADag7r8yaOseHrP4DE1cSwv2kbt3F4Yy21rKcrYDgZeC1Jv/VhZEPkKQk+PMbQkFRy5fjdECcKPz+0W4s0W7d8OipxyaxSQffZ3/AsiGnLkDSVL9ryGqQW2aQNJKjKXLNnf9iUp3bI/UUsJtTcFyScC5OE/VYVVmYZvn88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi2-f11.google.com with SMTP id 5614622812f47-4bfec71901fso955616b6e.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 17:28:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789864116; x=1790468916;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2ReM82aEcRwh1FAqo17hhPk/qhH0GNuuHIChn6NhnZg=;
        b=LBtb82Zw+oG4rtmQ5iCa9Mpy0xeTsLZYI1yc3UFCTHkOuNbHBmQpCDfuFrznQAXxRQ
         z+fx8Jr1hN+DA0fjszjj4fcLvRdkm1/oC07XYLY7bDkKvj9CKnotGGAj33KezC9GHjaA
         OAb6Ta2UExQsbayC9/0DrK64NtDyrkQKx6GzT99GgnT5P4sNGPYg4YxINvOTBzdoJIVr
         8jpV3rO3NIXQFqOisf8Vbx5FdrDO/7h1rpyFUFmhVidsaj4+WJauqWAEg73FTTOd5Qw6
         hHF7/Ilk0PpkJxJ0lcRQc+51HwqYEmyC55U2M6VSlfjWpxvgA6isnjhGJxCQ4TLERe5a
         pmQw==
X-Forwarded-Encrypted: i=1; AKwUvByA6GzFXPLYFXRhTM9hSvm+xbHCiAlz0wsIy2IuTQO4tCi2YoQ+1orXV55kKIpzAJo4zT8G6Pchq2CAPpA=@vger.kernel.org
X-Gm-Message-State: AFuF++myp7/u6+rYd2HU7QGJxyL/yZAlxivByLMNsqJ1LHsWw8CprXy/
	dqhBTdMicPAh18GMoMZHdKBDzNeyBTWpCTevCCc5mFqbkwDkFO4evaAIqxnPx1CNh3aPFevTHAT
	y5X9pb1pLxLo754pIWdPIErMqmMoyUGddZCiCxRuQNZzhXzMWo+U21SwAeP8=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1f11:b0:6b7:83d6:2935 with SMTP id
 006d021491bc7-6ca9d14501dmr6425675eaf.56.1789864116376; Sat, 19 Sep 2026
 17:28:36 -0700 (PDT)
Date: Sat, 19 Sep 2026 17:28:36 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aaf28b4.71f81b7d.15fa6d.000e.GAE@google.com>
Subject: [syzbot] [nvme?] KASAN: slab-use-after-free Read in fcloop_t2h_xmt_ls_rsp
From: syzbot <syzbot+2a31ef5d37a9d722e987@syzkaller.appspotmail.com>
To: hch@lst.de, justin.tee@broadcom.com, kch@nvidia.com, 
	linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org, 
	nareshgottumukkala83@gmail.com, paul.ely@broadcom.com, sagi@grimberg.me, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    50d05c7c76c9 Merge tag 'landlock-7.3-rc3' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16386115580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=85bc5cc2fc7394d9
dashboard link: https://syzkaller.appspot.com/bug?extid=2a31ef5d37a9d722e987
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
userspace arch: i386

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-50d05c7c.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/303a0ade8f9e/vmlinux-50d05c7c.xz
kernel image: https://storage.googleapis.com/syzbot-assets/70b8ca71442b/bzImage-50d05c7c.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2a31ef5d37a9d722e987@syzkaller.appspotmail.com

(NULL device *): Disconnect LS failed: No Association
==================================================================
BUG: KASAN: slab-use-after-free in fcloop_t2h_xmt_ls_rsp+0x393/0x460 drivers/nvme/target/fcloop.c:518
Read of size 4 at addr ffff8880237d2228 by task kworker/1:4/5844

CPU: 1 UID: 0 PID: 5844 Comm: kworker/1:4 Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Workqueue: events nvme_fc_handle_ls_rqst_work
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x13d/0x4b0 mm/kasan/report.c:482
 kasan_report+0xdf/0x1c0 mm/kasan/report.c:595
 fcloop_t2h_xmt_ls_rsp+0x393/0x460 drivers/nvme/target/fcloop.c:518
 nvme_fc_xmt_ls_rsp+0x1bd/0x270 drivers/nvme/host/fc.c:1456
 nvme_fc_handle_ls_rqst_work+0x43c/0x2100 drivers/nvme/host/fc.c:1660
 process_one_work+0xac7/0x1b10 kernel/workqueue.c:3396
 process_scheduled_works kernel/workqueue.c:3479 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3560
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Allocated by task 8325:
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

Freed by task 17245:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 kasan_save_free_info+0x3b/0x70 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5f/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2748 [inline]
 slab_free mm/slub.c:6499 [inline]
 kfree+0x22b/0x6d0 mm/slub.c:6792
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
 do_syscall_32_irqs_on arch/x86/entry/syscall_32.c:79 [inline]
 __do_fast_syscall_32+0x13a/0x8b0 arch/x86/entry/syscall_32.c:291
 do_fast_syscall_32+0x32/0x70 arch/x86/entry/syscall_32.c:316
 entry_SYSENTER_compat_after_hwframe+0x84/0x8e

The buggy address belongs to the object at ffff8880237d2200
 which belongs to the cache kmalloc-256 of size 256
The buggy address is located 40 bytes inside of
 freed 256-byte region [ffff8880237d2200, ffff8880237d2300)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x237d2
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
page last allocated via order 1, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5746, tgid 5746 (syz-executor), ts 39099710655
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
 ____ip_mc_inc_group+0x40b/0x10d0 net/ipv4/igmp.c:1601
 __ip_mc_inc_group net/ipv4/igmp.c:1639 [inline]
 ip_mc_inc_group net/ipv4/igmp.c:1645 [inline]
 ip_mc_up+0x154/0x390 net/ipv4/igmp.c:1950
 inetdev_event+0x6f0/0x17f0 net/ipv4/devinet.c:1630
 notifier_call_chain+0x99/0x3f0 kernel/notifier.c:85
 call_netdevice_notifiers_info+0xbe/0x110 net/core/dev.c:2275
 call_netdevice_notifiers_extack net/core/dev.c:2313 [inline]
 call_netdevice_notifiers net/core/dev.c:2327 [inline]
 __dev_notify_flags+0x22c/0x4b0 net/core/dev.c:9853
 netif_change_flags+0x108/0x160 net/core/dev.c:9882
 do_setlink.isra.0+0x1ac4/0x3e60 net/core/rtnetlink.c:3266
 rtnl_changelink net/core/rtnetlink.c:3905 [inline]
 __rtnl_newlink net/core/rtnetlink.c:4076 [inline]
 rtnl_newlink+0x13c1/0x2620 net/core/rtnetlink.c:4215
page last free pid 5151 tgid 5151 ts 10778201277 stack trace:
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
 alloc_filename fs/namei.c:147 [inline]
 do_getname+0x35/0x390 fs/namei.c:187
 class_filename_flags_constructor include/linux/fs.h:2586 [inline]
 do_readlinkat+0xa9/0x370 fs/stat.c:569
 __do_sys_readlink fs/stat.c:605 [inline]
 __se_sys_readlink fs/stat.c:602 [inline]
 __x64_sys_readlink+0x78/0xc0 fs/stat.c:602
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x121/0x770 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffff8880237d2100: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff8880237d2180: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff8880237d2200: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                  ^
 ffff8880237d2280: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff8880237d2300: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
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
