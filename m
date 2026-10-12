Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F763218E91
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791790447; cv=none; b=KdYyRqg1Hb827WnieKgyXMZSHIN3VJYwNHmawpSD3gvvhpw5lcvfEUCZ8z9ShebQ0BaQ8Wbh2CFNK8GoNhasITFi81+FD6XdDWV+LaKw2kNfSscgwmVf3RXa1g6RBJYolq1Yf1PaVOQvIVrUFbZNj71tF90V6nuxbFVNFovoBI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791790447; c=relaxed/simple;
	bh=u5ucv+40qY58UBntT4AAB1wVtj+A7pCpsxVHCqRID6w=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=mJIRpOnCzIEFOryWbKZn9S3cfv8S4PACyCQMN9GRKRBo6vX+IJqROVAdFOYTxC1WnEe21TlDOKnVbl7cIh5YBAddHH0Xa0GnR55PoNu8rOcV4Zt5Y+6KifEVXwLsUkBJj7rlyO2oeOEzYtC+z1G2hwbbV3YbUQcHQc+LVloJ+tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4a41f46d629so3615321b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 00:34:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791790444; x=1792395244;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9FkpmxoWQebif50Tv+jOwqD26ylFf+0GbU4WXI8dpFU=;
        b=nO4Jvt5ntV1nIv+0xc+gL0XaofnlM+ONGD7mDtq5WZeASIfW9xXrAqkBzruFnybB0R
         Ph6MvQw+BZ/dqiYaiguvp4HGWpQvE3CA/plGQOYZe/VzPYs+HHmNxIEmSx34OccqoikJ
         WV9joYivbMMahAOG9kARKbjhtjHpNvHGMGqX+qd34u3ewLI/AQlvLqA+oKrCVCfqT52/
         K/XC1esSql7Ox2VnI0Spmx8ZZoXXVb0D2qP4z5wD+oN57T7otJYBoXNJfeQxr9o/KQ0o
         La7WsO4sKEKy89vWNisP9SHwKpzIZwKBO2hnBiBtKa30+bw48mSinAumrRp56OwBo3iS
         zEVA==
X-Forwarded-Encrypted: i=1; AKwUvBxD/08pVnMaO7ZC49B9ShQfZtmK/NbApwQuPOSKloIIIf48lnhoQGNOaRjvyawgEIMfr/pGfCy0vJV4ZkY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIxpsYiUKO9nvQdEQhCKTsIrj3AzA/zan3C7cu++GZ46345Lva2
	sxUiUPvieyztFs7SHbTgiKeR+zntpGoRzwloizQI9ey09+uuu0FrYWE9JhoRdV7l36loMFppuwk
	MRnYN1eegbVqPY5sE0kuc1Ggg8Z7yZ4ZjR3DM3RBYn1Oe8ipF+DofBvWYzSM=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1818:b0:4f5:41e:932e with SMTP id
 5614622812f47-50c54177a32mr7942842b6e.35.1791790444417; Mon, 12 Oct 2026
 00:34:04 -0700 (PDT)
Date: Mon, 12 Oct 2026 00:34:04 -0700
In-Reply-To: <CAJAt6L8sFcjHfppw1YB_gnAH_KQYeBe+12E_fP5j=xeLszA60g@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6acc8d6c.0e5b5d80.2c029c.0557.GAE@google.com>
Subject: Re: [syzbot] WARNING: ODEBUG bug in hwsim_del_radio_nl
From: syzbot <syzbot+19cbce4cc656ecd4febc@syzkaller.appspotmail.com>
To: aryanarora.w1@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
KASAN: invalid-free in rcu_free_sheaf

==================================================================
BUG: KASAN: double-free in rcu_free_sheaf+0x1a/0xe0 mm/slub.c:6061
Free of addr ffff88802b245a00 by task ksoftirqd/3/34

CPU: 3 UID: 0 PID: 34 Comm: ksoftirqd/3 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x13d/0x4b0 mm/kasan/report.c:482
 kasan_report_invalid_free+0xb8/0x190 mm/kasan/report.c:557
 check_slab_allocation+0xc3/0xf0 mm/kasan/common.c:246
 kasan_slab_pre_free include/linux/kasan.h:199 [inline]
 slab_free_hook mm/slub.c:2693 [inline]
 __rcu_free_sheaf_prepare+0x117/0x300 mm/slub.c:3009
 rcu_free_sheaf+0x1a/0xe0 mm/slub.c:6061
 rcu_do_batch kernel/rcu/tree.c:2650 [inline]
 rcu_core+0x5f0/0x1260 kernel/rcu/tree.c:2919
 handle_softirqs+0x1e6/0x9d0 kernel/softirq.c:645
 run_ksoftirqd kernel/softirq.c:1099 [inline]
 run_ksoftirqd+0x38/0x60 kernel/softirq.c:1091
 smpboot_thread_fn+0x3d3/0xab0 kernel/smpboot.c:160
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Allocated by task 12:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:409 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:426
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __kmalloc_cache_noprof+0x2f8/0x6d0 mm/slub.c:5563
 _kmalloc_noprof include/linux/slab.h:991 [inline]
 _kzalloc_noprof include/linux/slab.h:1312 [inline]
 hwsim_update_pib.isra.0+0x53/0x410 drivers/net/ieee802154/mac802154_hwsim.c:103
 hwsim_set_promiscuous_mode+0x14f/0x3a0 drivers/net/ieee802154/mac802154_hwsim.c:326
 drv_set_promiscuous_mode+0x133/0x330 net/mac802154/driver-ops.h:127
 drv_start net/mac802154/driver-ops.h:167 [inline]
 mac802154_scan_worker+0x68e/0x1240 net/mac802154/scan.c:248
 process_one_work+0xac7/0x1b10 kernel/workqueue.c:3396
 process_scheduled_works kernel/workqueue.c:3479 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3560
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Freed by task 34:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 kasan_save_free_info+0x3b/0x70 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:264 [inline]
 __kasan_slab_free+0x5f/0x80 mm/kasan/common.c:296
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2748 [inline]
 __rcu_free_sheaf_prepare+0x5d/0x300 mm/slub.c:3009
 rcu_free_sheaf+0x1a/0xe0 mm/slub.c:6061
 rcu_do_batch kernel/rcu/tree.c:2650 [inline]
 rcu_core+0x5f0/0x1260 kernel/rcu/tree.c:2919
 handle_softirqs+0x1e6/0x9d0 kernel/softirq.c:645
 run_ksoftirqd kernel/softirq.c:1099 [inline]
 run_ksoftirqd+0x38/0x60 kernel/softirq.c:1091
 smpboot_thread_fn+0x3d3/0xab0 kernel/smpboot.c:160
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

The buggy address belongs to the object at ffff88802b245a00
 which belongs to the cache kmalloc-64 of size 64
The buggy address is located 0 bytes inside of
 64-byte region [ffff88802b245a00, ffff88802b245a40)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x2b245
flags: 0xfff00000000000(node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000000 ffff88801c0428c0 dead000000000100 dead000000000122
raw: 0000000000000000 0000000000200020 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0xd2cc0(GFP_KERNEL|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 1, tgid 1 (swapper/0), ts 6670034199
 set_page_owner include/linux/page_owner.h:33 [inline]
 post_alloc_hook+0xfd/0x120 mm/page_alloc.c:1871
 prep_new_page mm/page_alloc.c:1879 [inline]
 get_page_from_freelist+0x110d/0x35d0 mm/page_alloc.c:3943
 __alloc_frozen_pages_noprof+0x2eb/0x3300 mm/page_alloc.c:5436
 alloc_slab_page mm/slub.c:3347 [inline]
 allocate_slab mm/slub.c:3462 [inline]
 new_slab+0xa9/0x6e0 mm/slub.c:3513
 refill_objects+0xe3/0x410 mm/slub.c:7418
 refill_sheaf mm/slub.c:2885 [inline]
 __pcs_replace_empty_main+0x35e/0x650 mm/slub.c:4774
 alloc_from_pcs mm/slub.c:4850 [inline]
 slab_alloc_node mm/slub.c:4984 [inline]
 __kmalloc_cache_noprof+0x4f4/0x6d0 mm/slub.c:5559
 _kmalloc_noprof include/linux/slab.h:991 [inline]
 __kthread_create_on_node+0xce/0x3f0 kernel/kthread.c:483
 kthread_create_on_node+0xc7/0x100 kernel/kthread.c:559
 init_rescuer+0x321/0x550 kernel/workqueue.c:5805
 __alloc_workqueue+0xe82/0x1950 kernel/workqueue.c:5993
 alloc_workqueue_va kernel/workqueue.c:6033 [inline]
 alloc_workqueue_noprof+0xc7/0x130 kernel/workqueue.c:6049
 nvme_core_init+0x4a/0x1f0 drivers/nvme/host/core.c:5516
 do_one_initcall+0x11c/0x6f0 init/main.c:1362
 do_initcall_level init/main.c:1424 [inline]
 do_initcalls init/main.c:1440 [inline]
 do_basic_setup init/main.c:1460 [inline]
 kernel_init_freeable+0x6ea/0x7b0 init/main.c:1675
 kernel_init+0x21/0x1e0 init/main.c:1565
page_owner free stack trace missing

Memory state around the buggy address:
 ffff88802b245900: 00 00 00 00 00 00 00 00 fc fc fc fc fc fc fc fc
 ffff88802b245980: 00 00 00 00 00 00 00 00 fc fc fc fc fc fc fc fc
>ffff88802b245a00: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
                   ^
 ffff88802b245a80: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
 ffff88802b245b00: 00 00 00 00 00 00 00 00 fc fc fc fc fc fc fc fc
==================================================================


Tested on:

commit:         24a19b95 Linux 7.3-rc7
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1204429c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3b57b1287207ae97
dashboard link: https://syzkaller.appspot.com/bug?extid=19cbce4cc656ecd4febc
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15b119c9580000

