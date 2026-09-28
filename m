Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE2954706C
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 00:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790554409; cv=none; b=QCkyg1G7Cit/d7a0tPRKHnkwTx9XctYRjI/7/OD81TvL/r2VmY3EjQuVH6lNHkE6Hi2rwn/2qMktmvY/Z0/w4O42WvqUNDtsIVDE+MIFav6BEzaKzGP8F+iLqSsw/ntAzhzt6pS0c5trKI+tP/oyEpxt26fw1dQf1pIJA013uM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790554409; c=relaxed/simple;
	bh=YZydMoameDYL3fo6XfSreYDvxZwQWHV2MCw3517c0iY=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=XWJQwdO1nF1IVWIPt+Nf1r7rJhqEkLsoo2QmpsD+34ntdz3qLB2dLbUmMyUmvEoQpodm2y3hN7MuBzQ/n7onJUfuPV7WfKXInJQAeo7mkzQQ+0ohEgWjasdsbluR2E4Z1TnoamQ96I0dLoIrkdNR0qvNFD6V+Ey2GRqAt2777jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-81120824498so4740372a34.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 17:13:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790554404; x=1791159204;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/gihveQMEggeio5H0RThhS3vMuwQoXGYNU/ZAKVdLUI=;
        b=RzEkWmRfF83CNtIUq/VuGCMBx1VD4g4iMIZQhN3tz8xIGSEMIw6eSJlUeVj6RWPqtq
         CKpd8/DzhVvRyuXPC8J+wQ1FldQh1d80llCtPx+eeK5uJqjf5pu1JuNHKykmsWpgxnsG
         fNdj6Llo0HrVXi1ffWYZ1x8rcIcsrQuZoAa27L3OOmSWT4Gh2vYUlTCi1mtQgV4j5d3u
         O/D5AohT+Mta/J4ItBRmb8ylekVk7g+z8SpJSvqbJb/qk3m5vgLBda0qAZt6sKOiMCCx
         ZtxsLkR+ypKyEsNxAuXPmKFFNiTEgtjQY7RCuVj2i8STczfOQH8BoYnrEUMv/ZnN9JlO
         a0NA==
X-Gm-Message-State: AFuF++mpJcevIP3HBeZ+wnrTFmOe2LdCbeGzo4Huic9hOCD5Z0KYy0de
	GXaJ3TpQdA2uZlhckjjvyX6XUIh5igVXUOqQqDjTPXqXzqjPEpw9ut32JkV8BAR1gW9Absk3cPV
	6h86NZDrdNy4YAZ7cxfvsEyv2L2CdIMWSkCCQFwrcGjNrgwaWNqmy5++eLko=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:16aa:b0:4c9:f7ca:82b1 with SMTP id
 5614622812f47-4d72cd3640amr8838646b6e.33.1790554404223; Sun, 27 Sep 2026
 17:13:24 -0700 (PDT)
Date: Sun, 27 Sep 2026 17:13:24 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab9b124.dc2998a4.2261f5.0070.GAE@google.com>
Subject: [syzbot] [mmc?] KASAN: slab-use-after-free Read in memstick_next_req
From: syzbot <syzbot+34f63c11dab47d09ad9a@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-usb@vger.kernel.org, maximlevitsky@gmail.com, oakad@yahoo.com, 
	syzkaller-bugs@googlegroups.com, ulf.hansson@linaro.org, ulfh@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    d58dffe9ee2c USB: core: amend usb_get_from_anchor() kernel..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=1371cd25580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c451f9f64434b622
dashboard link: https://syzkaller.appspot.com/bug?extid=34f63c11dab47d09ad9a
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/424c61cbb872/disk-d58dffe9.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/4124586dc97c/vmlinux-d58dffe9.xz
kernel image: https://storage.googleapis.com/syzbot-assets/a07e8e384dc4/bzImage-d58dffe9.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+34f63c11dab47d09ad9a@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in memstick_next_req+0x1f4/0x240 drivers/memstick/core/memstick.c:227
Read of size 4 at addr ffff888113453074 by task kworker/1:2/15608

CPU: 1 UID: 0 PID: 15608 Comm: kworker/1:2 Not tainted syzkaller #0 PREEMPT(lazy) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/16/2026
Workqueue: events rtsx_usb_ms_handle_req
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x13d/0x4b0 mm/kasan/report.c:482
 kasan_report+0xdf/0x1c0 mm/kasan/report.c:595
 memstick_next_req+0x1f4/0x240 drivers/memstick/core/memstick.c:227
 rtsx_usb_ms_handle_req+0x1dc/0x1a00 drivers/memstick/host/rtsx_usb_ms.c:520
 process_one_work+0xac7/0x1b10 kernel/workqueue.c:3396
 process_scheduled_works kernel/workqueue.c:3479 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3560
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x69f/0xc90 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Allocated by task 9796:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0x8f/0xa0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __kmalloc_cache_noprof+0x2d8/0x680 mm/slub.c:5563
 _kmalloc_noprof include/linux/slab.h:991 [inline]
 _kzalloc_noprof include/linux/slab.h:1312 [inline]
 memstick_alloc_card drivers/memstick/core/memstick.c:383 [inline]
 memstick_check+0x2c1/0x10d0 drivers/memstick/core/memstick.c:452
 process_one_work+0xac7/0x1b10 kernel/workqueue.c:3396
 process_scheduled_works kernel/workqueue.c:3479 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3560
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x69f/0xc90 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Freed by task 9796:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 kasan_save_free_info+0x3b/0x70 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x43/0x70 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2748 [inline]
 slab_free mm/slub.c:6499 [inline]
 kfree+0x20c/0x650 mm/slub.c:6792
 memstick_alloc_card drivers/memstick/core/memstick.c:420 [inline]
 memstick_check+0x72b/0x10d0 drivers/memstick/core/memstick.c:452
 process_one_work+0xac7/0x1b10 kernel/workqueue.c:3396
 process_scheduled_works kernel/workqueue.c:3479 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3560
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x69f/0xc90 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

The buggy address belongs to the object at ffff888113453000
 which belongs to the cache kmalloc-2k of size 2048
The buggy address is located 116 bytes inside of
 freed 2048-byte region [ffff888113453000, ffff888113453800)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x113450
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0x200000000000040(head|node=0|zone=2)
page_type: f5(slab)
raw: 0200000000000040 ffff888100042000 dead000000000100 dead000000000122
raw: 0000000000000000 0000000000080008 00000000f5000000 0000000000000000
head: 0200000000000040 ffff888100042000 dead000000000100 dead000000000122
head: 0000000000000000 0000000000080008 00000000f5000000 0000000000000000
head: 0200000000000003 fffffffffffffe01 00000000ffffffff 00000000ffffffff
head: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 2979, tgid 2979 (syz-executor), ts 50665226939
 set_page_owner include/linux/page_owner.h:33 [inline]
 post_alloc_hook+0xfd/0x120 mm/page_alloc.c:1871
 prep_new_page mm/page_alloc.c:1879 [inline]
 get_page_from_freelist+0xf4b/0x3440 mm/page_alloc.c:3943
 __alloc_frozen_pages_noprof+0x2d7/0x2f70 mm/page_alloc.c:5436
 alloc_slab_page mm/slub.c:3347 [inline]
 allocate_slab mm/slub.c:3462 [inline]
 new_slab+0xa9/0x6e0 mm/slub.c:3513
 refill_objects+0xe3/0x410 mm/slub.c:7410
 refill_sheaf mm/slub.c:2885 [inline]
 __pcs_replace_empty_main+0x35e/0x650 mm/slub.c:4774
 alloc_from_pcs mm/slub.c:4850 [inline]
 slab_alloc_node mm/slub.c:4984 [inline]
 __do_kmalloc_node mm/slub.c:5413 [inline]
 __kmalloc_noprof+0x61c/0x7e0 mm/slub.c:5439
 _kmalloc_noprof include/linux/slab.h:995 [inline]
 sk_prot_alloc+0x10b/0x2a0 net/core/sock.c:2251
 sk_alloc+0x36/0xe80 net/core/sock.c:2307
 __netlink_create+0x5e/0x2c0 net/netlink/af_netlink.c:627
 __netlink_kernel_create+0xed/0x750 net/netlink/af_netlink.c:2024
 netlink_kernel_create include/linux/netlink.h:62 [inline]
 diag_net_init+0xbd/0x140 net/core/sock_diag.c:333
 ops_init+0x1e2/0x5f0 net/core/net_namespace.c:137
 setup_net+0x118/0x3a0 net/core/net_namespace.c:443
 copy_net_ns+0x345/0x7a0 net/core/net_namespace.c:582
 create_new_namespaces+0x3ea/0xac0 kernel/nsproxy.c:132
page last free pid 2979 tgid 2979 ts 50662397831 stack trace:
 reset_page_owner include/linux/page_owner.h:26 [inline]
 __free_pages_prepare mm/page_alloc.c:1418 [inline]
 __free_frozen_pages+0x714/0xfc0 mm/page_alloc.c:2962
 rcu_do_batch kernel/rcu/tree.c:2650 [inline]
 rcu_core+0x5f0/0x1260 kernel/rcu/tree.c:2919
 handle_softirqs+0x1d9/0x9b0 kernel/softirq.c:645
 __do_softirq kernel/softirq.c:679 [inline]
 invoke_softirq kernel/softirq.c:519 [inline]
 __irq_exit_rcu+0x168/0x210 kernel/softirq.c:758
 irq_exit_rcu+0x9/0x30 kernel/softirq.c:775
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1062 [inline]
 sysvec_apic_timer_interrupt+0x8f/0xb0 arch/x86/kernel/apic/apic.c:1062
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:674

Memory state around the buggy address:
 ffff888113452f00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff888113452f80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff888113453000: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                                             ^
 ffff888113453080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888113453100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
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
