Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28BC544D5F
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 16:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789663385; cv=none; b=CVJZAviwL+MVqmruEdQViAXZhna9kngQf3I2iovIGhC4Iykk1As91wT19nI5KddV4HPXMO2xlofXL2CIvPoZCQVu0okS+/WQygSJjd5n79icYKkeNF01QLW8xRFeaDgGPDpmE0civV/7o2HNCuB5xjN6WY1yOVbpvfFXNkXKDbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789663385; c=relaxed/simple;
	bh=cIsAonBm7AT9kKib+ne06UjOt6UC2xGlJRlfH1/tsdg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Kc/XYdfURoJW859E7EANxlgAg5q8JMYzV5FKdOCa3nuNiyBP/AAhqAvVeDagkdRti+Y2G2gKzTGZ+MIiuQdKt9smQF80313nWjT7gTtx3M+f6S0rNVrw7qUMRZTql09iZ5URbVmfE/Tgu+5D8ZlBg+8YUhA4W7ZLsZPzyg6r6WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7f653940ba4so1549125a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:43:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789663382; x=1790268182;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=K/fbjJV/JtFxyOtwCt/9zadIM0Su0RoqnaXFyA+VsBU=;
        b=EqjGb3LRSLJ5FYSrtOF2v5JRFCDAl5SVD/Lzaz6f67MzUtcODdCeP1UN+VBm4PaX3J
         TY07d/CTiA2SrnoHH/jUZHM7TS+jMKjU/0pGYHTalxG3AKAJkU+zzuMQGlWtJorZysLT
         Lp1Ap8jXIuvuvrTOrSKJObBBWbBKDJ3GB+2//4oee6VyCyHhij9l+Loet0NokXJBObxu
         7lHYP/3PR+3f31u6zgzoMJUufTeenj/CkSaH8HpxQMKUtGU38u8i9dbpXTYkJzgwK0Rt
         i7LTiWGk8L7Co+PoAWI5yoAlMYgoyd8whv2+GP172PQDTE1UI6WZf3+UcpXcKPAHqi9I
         lgdA==
X-Forwarded-Encrypted: i=1; AKwUvBybMM3h+wmMCa3fzRsYtAWbWWFCD5fSkyW9YOqq4eBksjK5UD1LngZSvHWieJUKTBYyzv0TUpWqtTChpu8=@vger.kernel.org
X-Gm-Message-State: AFuF++kO+B6mihAEZjC5n/Vv+mEZtRHPIQydqF33IZ3KC590ETXz0SHJ
	B9kWbM+0YPM3He9wsoDPZYkzEldFpj1NBHmym6iJqUQ/Iswjwbw3i2VsmHd3wDesEiPSjC86Yf4
	ujF39A5YgiZAMZJSCPeJEF88k4wE2MNXNROVLKey+f9bZcG1tL50lKwj//i4=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:6ac4:b0:6be:2c0f:e415 with SMTP id
 006d021491bc7-6c7d1fd8823mr7559769eaf.27.1789663382316; Thu, 17 Sep 2026
 09:43:02 -0700 (PDT)
Date: Thu, 17 Sep 2026 09:43:02 -0700
In-Reply-To: <20260917162900.97210-1-adarshdas950@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aac1896.b398a7c9.1f86be.001e.GAE@google.com>
Subject: Re: [syzbot] [kernel?] KASAN: slab-use-after-free Read in disable_device
From: syzbot <syzbot+4393dfdddf166f2de2b0@syzkaller.appspotmail.com>
To: adarshdas950@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
KASAN: slab-use-after-free Read in disable_device

smbdirect: ib_dev[rxe11] removed
=========================
==================================================================
BUG: KASAN: slab-use-after-free in kobject_uevent_net_broadcast lib/kobject_uevent.c:415 [inline]
BUG: KASAN: slab-use-after-free in kobject_uevent_env+0x1383/0x18b0 lib/kobject_uevent.c:611
Read of size 8 at addr ffff88802c191610 by task kworker/u33:13/1182

CPU: 0 UID: 0 PID: 1182 Comm: kworker/u33:13 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Workqueue: ib-unreg-wq ib_unregister_work
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x13d/0x4b0 mm/kasan/report.c:482
 kasan_report+0xdf/0x1c0 mm/kasan/report.c:595
 kobject_uevent_net_broadcast lib/kobject_uevent.c:415 [inline]
 kobject_uevent_env+0x1383/0x18b0 lib/kobject_uevent.c:611
 device_del+0x605/0x9b0 drivers/base/core.c:3983
 remove_one_compat_dev drivers/infiniband/core/device.c:1036 [inline]
 remove_compat_devs drivers/infiniband/core/device.c:1047 [inline]
 disable_device+0x1ea/0x280 drivers/infiniband/core/device.c:1339
 __ib_unregister_device+0x2b4/0x480 drivers/infiniband/core/device.c:1571
 ib_unregister_work+0x19/0x30 drivers/infiniband/core/device.c:1683
 process_one_work+0xac7/0x1b10 kernel/workqueue.c:3396
 process_scheduled_works kernel/workqueue.c:3479 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3560
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Allocated by task 6226:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __kmalloc_cache_noprof+0x2f8/0x6d0 mm/slub.c:5563
 _kmalloc_noprof include/linux/slab.h:991 [inline]
 _kzalloc_noprof include/linux/slab.h:1312 [inline]
 uevent_net_init+0xd3/0x330 lib/kobject_uevent.c:782
 ops_init+0x1e2/0x5f0 net/core/net_namespace.c:137
 setup_net+0x118/0x3a0 net/core/net_namespace.c:443
 copy_net_ns+0x345/0x7a0 net/core/net_namespace.c:582
 create_new_namespaces+0x3ea/0xac0 kernel/nsproxy.c:132
 unshare_nsproxy_namespaces+0xf2/0x220 kernel/nsproxy.c:234
 ksys_unshare+0x4a2/0xa70 kernel/fork.c:3295
 __do_sys_unshare kernel/fork.c:3359 [inline]
 __se_sys_unshare kernel/fork.c:3357 [inline]
 __x64_sys_unshare+0x31/0x40 kernel/fork.c:3357
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 12:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 kasan_save_free_info+0x3b/0x70 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5f/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2748 [inline]
 slab_free mm/slub.c:6508 [inline]
 kfree+0x22b/0x6d0 mm/slub.c:6801
 ops_exit_list net/core/net_namespace.c:200 [inline]
 ops_undo_list+0x2ee/0xab0 net/core/net_namespace.c:253
 cleanup_net+0x499/0x920 net/core/net_namespace.c:706
 process_one_work+0xac7/0x1b10 kernel/workqueue.c:3396
 process_scheduled_works kernel/workqueue.c:3479 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3560
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

The buggy address belongs to the object at ffff88802c191600
 which belongs to the cache kmalloc-32 of size 32
The buggy address is located 16 bytes inside of
 freed 32-byte region [ffff88802c191600, ffff88802c191620)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffff88802c191b00 pfn:0x2c191
flags: 0xfff00000000200(workingset|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000200 ffff88801c042780 ffffea00009e2150 ffffea0000b76b90
raw: ffff88802c191b00 000000000040002e 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0xd2800(GFP_NOWAIT|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5277, tgid 5277 (v4l_id), ts 17982672979
 set_page_owner include/linux/page_owner.h:33 [inline]
 post_alloc_hook+0xfd/0x120 mm/page_alloc.c:1871
 prep_new_page mm/page_alloc.c:1879 [inline]
 get_page_from_freelist+0x110d/0x35d0 mm/page_alloc.c:3943
 __alloc_frozen_pages_noprof+0x2eb/0x3300 mm/page_alloc.c:5436
 alloc_slab_page mm/slub.c:3347 [inline]
 allocate_slab mm/slub.c:3462 [inline]
 new_slab+0xa9/0x6e0 mm/slub.c:3513
 refill_objects+0xe3/0x410 mm/slub.c:7417
 refill_sheaf mm/slub.c:2885 [inline]
 __pcs_replace_empty_main+0x35e/0x650 mm/slub.c:4774
 alloc_from_pcs mm/slub.c:4850 [inline]
 slab_alloc_node mm/slub.c:4984 [inline]
 __kmalloc_cache_noprof+0x4f4/0x6d0 mm/slub.c:5559
 _kmalloc_noprof include/linux/slab.h:991 [inline]
 slab_free_hook mm/slub.c:2700 [inline]
 slab_free mm/slub.c:6508 [inline]
 kmem_cache_free+0x40f/0x6c0 mm/slub.c:6635
 anon_vma_free mm/rmap.c:137 [inline]
 __put_anon_vma+0x114/0x3a0 mm/rmap.c:2970
 put_anon_vma mm/internal.h:290 [inline]
 unlink_anon_vmas+0x5e4/0x8d0 mm/rmap.c:536
 free_pgtables+0x2e7/0xd80 mm/memory.c:414
 exit_mmap+0x44c/0xa00 mm/mmap.c:1327
 __mmput+0x12a/0x410 kernel/fork.c:1193
 mmput+0x67/0x80 kernel/fork.c:1216
 exit_mm kernel/exit.c:617 [inline]
 do_exit+0x8b1/0x2ae0 kernel/exit.c:999
 do_group_exit+0xd5/0x2a0 kernel/exit.c:1154
page last free pid 5151 tgid 5151 ts 17918242618 stack trace:
 reset_page_owner include/linux/page_owner.h:26 [inline]
 __free_pages_prepare mm/page_alloc.c:1418 [inline]
 __free_frozen_pages+0x79f/0x10f0 mm/page_alloc.c:2962
 __pagetable_free include/linux/mm.h:3804 [inline]
 pagetable_free include/linux/mm.h:3828 [inline]
 pagetable_dtor_free include/linux/mm.h:3927 [inline]
 __tlb_remove_table include/asm-generic/tlb.h:221 [inline]
 __tlb_remove_table_free mm/mmu_gather.c:228 [inline]
 tlb_remove_table_rcu+0x2cf/0x380 mm/mmu_gather.c:291
 rcu_do_batch kernel/rcu/tree.c:2650 [inline]
 rcu_core+0x5f0/0x1260 kernel/rcu/tree.c:2919
 handle_softirqs+0x1e6/0x9d0 kernel/softirq.c:645
 do_softirq kernel/softirq.c:546 [inline]
 do_softirq+0xaf/0xf0 kernel/softirq.c:533
 __local_bh_enable_ip+0xff/0x120 kernel/softirq.c:473
 local_bh_enable include/linux/bottom_half.h:33 [inline]
 fpregs_unlock arch/x86/include/asm/fpu/api.h:77 [inline]
 fpu_clone+0x11d/0x7a0 arch/x86/kernel/fpu/core.c:714
 copy_thread+0x4ae/0xbe0 arch/x86/kernel/process.c:226
 copy_process+0x4cf7/0x8370 kernel/fork.c:2319
 kernel_clone+0x176/0x9d0 kernel/fork.c:2769
 __do_sys_clone+0xd9/0x120 kernel/fork.c:2911
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffff88802c191500: fa fb fb fb fc fc fc fc fa fb fb fb fc fc fc fc
 ffff88802c191580: 00 00 00 00 fc fc fc fc 00 00 00 00 fc fc fc fc
>ffff88802c191600: fa fb fb fb fc fc fc fc fa fb fb fb fc fc fc fc
                         ^
 ffff88802c191680: 00 00 00 00 fc fc fc fc fa fb fb fb fc fc fc fc
 ffff88802c191700: fa fb fb fb fc fc fc fc fa fb fb fb fc fc fc fc
==================================================================


Tested on:

commit:         238650ef Merge tag 'powerpc-7.3-4' of git://git.kernel..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=144ed3f9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c5c3949d762a91f
dashboard link: https://syzkaller.appspot.com/bug?extid=4393dfdddf166f2de2b0
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Note: no patches were applied.
