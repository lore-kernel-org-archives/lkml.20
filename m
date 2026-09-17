Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5082B36B918
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789612153; cv=none; b=PkSZ9TT/8W7kkJLPeY6B9d+81qnqIXW3NmyG25SrbnhJEeCx9RkpjLGZ3wXx1Jhga6DYRvR47PUlRfuLwU6Ek2lDGAgxuyuFEeGfGJiHyS8mGAZ55JtmTo3Xu/rO1wzz3LnM5kqRi9+PaJ4scUiBxTrJxWpnQWGIaC5f8VVb9/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789612153; c=relaxed/simple;
	bh=NzKsn7Z6MVG/0XvS7n30mRYujLpS6W+BHCR/ou1uLo0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=gyfzszsM545XG7BbeusoyKl2u+T9b2ANwzorAjANfofKvfyb7AmtFM90gY8vJUuDbljQvlbowq7p035fZF7FwHwqk75hJrOvkw8lUq3VUhlAhTWBVGVBDELYjva5qZANv9Txd5ncgvQy06KbaiHZu5nDeEXBEFjnlzfvndvQ5Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6c1b7981b4eso236612eaf.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 19:29:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789612142; x=1790216942;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nkgrfFfUTiUzbbaamXR4TAYtKrXysxM78IJhwg9DTrU=;
        b=wAjI9whtINwCYAJdtPbgLe7L5oPYdYuGdyskSikvJIhoAkG2BtPinmNOHacESqONZe
         xtK5YRQFEtYXCCtAEVk56uv3E9MFGEV/KqE4YzYp31KmZQifDuxNg8ZZXdNU08fRTcAu
         Q+4DGBAyyaTH1Cgjp9adHKikINj8cHQYEBboT5/9cbzoA3yULx/0xnL1fP0X+1EBX/21
         CXYVcdFzUZONpcWI7yGriOvhDT1YlJ0dh2fYMSXUK1z86wnl2guM+kLf9K/EMRa6PDRY
         TaCxEmo8FNz2K57CbrrRkll18uWIgFKwfGkMoFHVIHStfDEocMp71/I7CbPUC/mmArkP
         co6A==
X-Forwarded-Encrypted: i=1; AKwUvBz/ME9ko8R0ZJdXUeiNSbRh/fKLZ91mf3CC2PyDc8cuZM9HH0l/wh67bCwfipSvefkXl6qvXd7MHl+jhJk=@vger.kernel.org
X-Gm-Message-State: AFuF++nK2OTSlsO3hLN5CqNznLk55ALFNOR7lseDC551X0Vc4S5Uxgy3
	l+xOfPYgtWjaJGX0pinsrJ5F3fElgVZndLX35i+2RQC7f/Cc9jPrGlU5oEwsXolJzaRUH2WVU7l
	8pyIneflIx4dkRq0/VJvu4WUKa1IQXKBDYDd32AuJKFjGf1CIF4sB85JH8vg=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:81c5:b0:6b3:506e:b484 with SMTP id
 006d021491bc7-6c7d1bc844dmr4603921eaf.16.1789612141792; Wed, 16 Sep 2026
 19:29:01 -0700 (PDT)
Date: Wed, 16 Sep 2026 19:29:01 -0700
In-Reply-To: <6aab4218.10e42a5c.15bc98.c8fdSMTPIN_ADDED_BROKEN@gmr-mx.google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aab506d.87c06881.1db2b3.0006.GAE@google.com>
Subject: Re: [syzbot] [mmc?] WARNING: ODEBUG bug in vub300_disconnect
From: syzbot <syzbot+f4a0159ce6802a0a4774@syzkaller.appspotmail.com>
To: jchuang26@m.fudan.edu.cn, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
KASAN: slab-use-after-free Read in mmc_host_classdev_release

==================================================================
BUG: KASAN: slab-use-after-free in mmc_host_classdev_release+0xfb/0x120 drivers/mmc/core/host.c:70
Read of size 8 at addr ffff88801394e4c8 by task kworker/u32:4/5913

CPU: 0 UID: 0 PID: 5913 Comm: kworker/u32:4 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Workqueue: kvub300d vub300_deadwork_thread
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x13d/0x4b0 mm/kasan/report.c:482
 kasan_report+0xdf/0x1c0 mm/kasan/report.c:595
 mmc_host_classdev_release+0xfb/0x120 drivers/mmc/core/host.c:70
 device_release+0xd2/0x270 drivers/base/core.c:2640
 kobject_cleanup lib/kobject.c:689 [inline]
 kobject_release lib/kobject.c:720 [inline]
 kref_put include/linux/kref.h:65 [inline]
 kobject_put+0x1f7/0x640 lib/kobject.c:737
 put_device+0x1f/0x30 drivers/base/core.c:3884
 vub300_delete drivers/mmc/host/vub300.c:379 [inline]
 kref_put include/linux/kref.h:65 [inline]
 vub300_deadwork_thread+0x22c/0x550 drivers/mmc/host/vub300.c:739
 process_one_work+0xac7/0x1b10 kernel/workqueue.c:3396
 process_scheduled_works kernel/workqueue.c:3479 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3560
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Allocated by task 5872:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __kmalloc_cache_noprof+0x2f8/0x6d0 mm/slub.c:5563
 _kmalloc_noprof include/linux/slab.h:991 [inline]
 _kzalloc_noprof include/linux/slab.h:1312 [inline]
 usb_alloc_dev+0x55/0x1090 drivers/usb/core/usb.c:651
 hub_port_connect drivers/usb/core/hub.c:5483 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5720 [inline]
 port_event drivers/usb/core/hub.c:5884 [inline]
 hub_event+0x2b93/0x4420 drivers/usb/core/hub.c:5966
 process_one_work+0xac7/0x1b10 kernel/workqueue.c:3396
 process_scheduled_works kernel/workqueue.c:3479 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3560
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Freed by task 5913:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 kasan_save_free_info+0x3b/0x70 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5f/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2748 [inline]
 slab_free mm/slub.c:6499 [inline]
 kfree+0x22b/0x6d0 mm/slub.c:6792
 device_release+0xd2/0x270 drivers/base/core.c:2640
 kobject_cleanup lib/kobject.c:689 [inline]
 kobject_release lib/kobject.c:720 [inline]
 kref_put include/linux/kref.h:65 [inline]
 kobject_put+0x1f7/0x640 lib/kobject.c:737
 put_device+0x1f/0x30 drivers/base/core.c:3884
 usb_put_dev+0x23/0x30 drivers/usb/core/usb.c:790
 vub300_delete drivers/mmc/host/vub300.c:378 [inline]
 kref_put include/linux/kref.h:65 [inline]
 vub300_deadwork_thread+0x224/0x550 drivers/mmc/host/vub300.c:739
 process_one_work+0xac7/0x1b10 kernel/workqueue.c:3396
 process_scheduled_works kernel/workqueue.c:3479 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3560
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

The buggy address belongs to the object at ffff88801394e000
 which belongs to the cache kmalloc-2k of size 2048
The buggy address is located 1224 bytes inside of
 freed 2048-byte region [ffff88801394e000, ffff88801394e800)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffff888013948000 pfn:0x13948
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000240(workingset|head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000240 ffff88801c042f00 ffffea0000949e10 ffffea0000963610
raw: ffff888013948000 0000000000080006 00000000f5000000 0000000000000000
head: 00fff00000000240 ffff88801c042f00 ffffea0000949e10 ffffea0000963610
head: ffff888013948000 0000000000080006 00000000f5000000 0000000000000000
head: 00fff00000000003 fffffffffffffe01 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5137, tgid 5137 (klogd), ts 63556494154
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
 syslog_print+0xf8/0x620 kernel/printk/printk.c:1585
 do_syslog+0x5bd/0x6d0 kernel/printk/printk.c:1763
 __do_sys_syslog kernel/printk/printk.c:1855 [inline]
 __se_sys_syslog kernel/printk/printk.c:1853 [inline]
 __x64_sys_syslog+0x74/0xb0 kernel/printk/printk.c:1853
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x121/0x770 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
page last free pid 115 tgid 115 ts 60500294326 stack trace:
 reset_page_owner include/linux/page_owner.h:26 [inline]
 __free_pages_prepare mm/page_alloc.c:1418 [inline]
 free_unref_folios+0xa4a/0x1790 mm/page_alloc.c:3022
 shrink_folio_list+0x455c/0x5e40 mm/vmscan.c:1511
 evict_folios+0x348/0x1650 mm/vmscan.c:4910
 try_to_shrink_lruvec+0x366/0x830 mm/vmscan.c:5076
 shrink_one+0x307/0x850 mm/vmscan.c:5117
 shrink_many mm/vmscan.c:5180 [inline]
 lru_gen_shrink_node mm/vmscan.c:5258 [inline]
 shrink_node+0x2b20/0x4320 mm/vmscan.c:6247
 kswapd_shrink_node mm/vmscan.c:7101 [inline]
 balance_pgdat+0xb20/0x1f00 mm/vmscan.c:7279
 kswapd+0x556/0xb50 mm/vmscan.c:7555
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Memory state around the buggy address:
 ffff88801394e380: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88801394e400: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff88801394e480: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                              ^
 ffff88801394e500: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88801394e580: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


Tested on:

commit:         50d05c7c Merge tag 'landlock-7.3-rc3' of git://git.ker..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=14fb93f9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=85bc5cc2fc7394d9
dashboard link: https://syzkaller.appspot.com/bug?extid=f4a0159ce6802a0a4774
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
userspace arch: i386
patch:          https://syzkaller.appspot.com/x/patch.diff?x=165458c9580000

