Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDE2476041
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787762984; cv=none; b=IZnPqcDC3SiqyFsL8e3geLHZIoFzJ6YsRvlhkHaouHVLdlkjnksuULrwJ5Po5UEMV2ApeVJjt/vX17EEfq89pWf816w0olrWs5SQrHlV9EiojLuolZvu+6m2PKNkMgEbDDIkkX5MSqwpJ/8nEAbkhnynHX0omFAYSWZFDAsrdMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787762984; c=relaxed/simple;
	bh=phsbyYf7Boh6K8o1ijxZ80eQZFGXbuMPeGJ9bwUfdkY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=MnOGz3rxUHXNFVbxxBeJExNaZiHZGjmsomz3o2aCBlA34UevNXfHeGVU04bRezZRIMXphfxVQUmpyxVgyV9w5eYQ+TXgTbfUrIszVVc3sveVkvq5qWQmYM8+BDk42tMiMl7v/y+i4bfjpmm8RMTIdD/grf7d6Qs64Hnw9r90cso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7eb6429750eso1883619a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 09:49:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787762976; x=1788367776;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hM5n+FIa5Wh0Q3xyXi+CMf3mznCub4whjLl+zoYHlTQ=;
        b=N7AfZGZ5ZLjoskFc2Q4R4j3MvgiiFkPbqJTfgHbueTHnHDX7nR8xbTTa259emkXsQd
         WnUho/TA8DAh8zme4kgzb7OpatbgABlp+jWut0myjem1/b1Uo8piUIFsuOS6bBLzjSWf
         BZZ26YfV7iC08bJKFVg/XCGwk+RaqQYsA8Tvy2BH0nY47cIRwHWwc+eFyrnIxeshenV2
         DjyVWfw2xe9dnExPwBM72uU5/Ye4mQ4cafwOvU0KFKwPRyoKpMygUHCYCcmtKyzow3OY
         q6mOgNBk1a9O4yBP9KJJyvUUHhs+bVhYR+PBg9HSBCFOJK8UQht9RbZduEmHHQNVk90n
         S9fg==
X-Forwarded-Encrypted: i=1; AHgh+RqO8ExgePGvOstMazWyH5ylZc8mAWta0pi4+FklrlULzNQs3bBeMrZya5VGR/TdAUfbsHgaHrw8CMh27G4=@vger.kernel.org
X-Gm-Message-State: AFuF++nI2kfBHaPOwsyUNn5sMjBqtwRy0xRdTwUBe7yuSOqQ/kG3MzXu
	IyF7ve+nIhp28C6SpBKM3/tT4IrqDQM+rOVl3CQi+yrTFPOTjKEobZe4K5WC07+hhqj69n0Yazd
	cPmm9vxuIKHbfEglfkRZttbSS7EA5C5n8ELFmTmTuNzpWrSBQv8BD7rx1QBk=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4def:b0:6b1:5c1b:582f with SMTP id
 006d021491bc7-6b1a0388a21mr7741330eaf.5.1787762976565; Wed, 26 Aug 2026
 09:49:36 -0700 (PDT)
Date: Wed, 26 Aug 2026 09:49:36 -0700
In-Reply-To: <6a68bbd5.073198cf.94f0f.004a.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a8f1920.1d9ded08.62e62.00b7.GAE@google.com>
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Read in stub_rx_loop
From: syzbot <syzbot+06fa667a0931a3430026@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, i@zenithal.me, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, shuah@kernel.org, syzkaller-bugs@googlegroups.com, 
	valentina.manea.m@gmail.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    818bebeb63dd drm/xe: Don't hand out the flat CCS storage a..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=151ce979580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ccca94d2c01b9e78
dashboard link: https://syzkaller.appspot.com/bug?extid=06fa667a0931a3430026
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13a28d49580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+06fa667a0931a3430026@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in stub_recv_cmd_submit drivers/usb/usbip/stub_rx.c:609 [inline]
BUG: KASAN: slab-use-after-free in stub_rx_pdu drivers/usb/usbip/stub_rx.c:688 [inline]
BUG: KASAN: slab-use-after-free in stub_rx_loop+0x2d3b/0x31c0 drivers/usb/usbip/stub_rx.c:707
Read of size 4 at addr ffff888034999db0 by task stub_rx/6028

CPU: 0 UID: 0 PID: 6028 Comm: stub_rx Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x13d/0x4b0 mm/kasan/report.c:482
 kasan_report+0xdf/0x1c0 mm/kasan/report.c:595
 stub_recv_cmd_submit drivers/usb/usbip/stub_rx.c:609 [inline]
 stub_rx_pdu drivers/usb/usbip/stub_rx.c:688 [inline]
 stub_rx_loop+0x2d3b/0x31c0 drivers/usb/usbip/stub_rx.c:707
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Allocated by task 6028:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 unpoison_slab_object mm/kasan/common.c:340 [inline]
 __kasan_slab_alloc+0x89/0x90 mm/kasan/common.c:366
 kasan_slab_alloc include/linux/kasan.h:253 [inline]
 slab_post_alloc_hook mm/slub.c:4586 [inline]
 slab_alloc_node mm/slub.c:4919 [inline]
 kmem_cache_alloc_noprof+0x26b/0x6a0 mm/slub.c:4933
 stub_priv_alloc drivers/usb/usbip/stub_rx.c:314 [inline]
 stub_recv_cmd_submit drivers/usb/usbip/stub_rx.c:490 [inline]
 stub_rx_pdu drivers/usb/usbip/stub_rx.c:688 [inline]
 stub_rx_loop+0x638/0x31c0 drivers/usb/usbip/stub_rx.c:707
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Freed by task 6029:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 kasan_save_free_info+0x3b/0x70 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5f/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2678 [inline]
 slab_free mm/slub.c:6372 [inline]
 kmem_cache_free+0x127/0x6b0 mm/slub.c:6499
 stub_free_priv_and_urb+0x427/0x570 drivers/usb/usbip/stub_main.c:321
 stub_send_ret_submit+0xecf/0x1810 drivers/usb/usbip/stub_tx.c:333
 stub_tx_loop+0xe2/0x3e0 drivers/usb/usbip/stub_tx.c:437
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

The buggy address belongs to the object at ffff888034999d80
 which belongs to the cache stub_priv of size 64
The buggy address is located 48 bytes inside of
 freed 64-byte region [ffff888034999d80, ffff888034999dc0)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffff888034999e00 pfn:0x34999
flags: 0xfff00000000200(workingset|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000200 ffff8881016c7540 ffff88802aafa948 ffff88802aafa948
raw: ffff888034999e00 000000080020001c 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0xd2820(GFP_ATOMIC|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 6028, tgid 6028 (stub_rx), ts 78215496489
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
 kmem_cache_alloc_noprof+0x46e/0x6a0 mm/slub.c:4933
 stub_priv_alloc drivers/usb/usbip/stub_rx.c:314 [inline]
 stub_recv_cmd_submit drivers/usb/usbip/stub_rx.c:490 [inline]
 stub_rx_pdu drivers/usb/usbip/stub_rx.c:688 [inline]
 stub_rx_loop+0x638/0x31c0 drivers/usb/usbip/stub_rx.c:707
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
page last free pid 15 tgid 15 ts 77527058318 stack trace:
 reset_page_owner include/linux/page_owner.h:26 [inline]
 __free_pages_prepare mm/page_alloc.c:1418 [inline]
 __free_frozen_pages+0x79f/0x10f0 mm/page_alloc.c:2962
 __pagetable_free include/linux/mm.h:3745 [inline]
 pagetable_free include/linux/mm.h:3769 [inline]
 pagetable_dtor_free include/linux/mm.h:3868 [inline]
 __tlb_remove_table include/asm-generic/tlb.h:221 [inline]
 __tlb_remove_table_free mm/mmu_gather.c:228 [inline]
 tlb_remove_table_rcu+0x2cf/0x380 mm/mmu_gather.c:291
 rcu_do_batch kernel/rcu/tree.c:2645 [inline]
 rcu_core+0x5a2/0x10e0 kernel/rcu/tree.c:2897
 handle_softirqs+0x1e6/0x9d0 kernel/softirq.c:645
 __do_softirq kernel/softirq.c:679 [inline]
 invoke_softirq kernel/softirq.c:519 [inline]
 __irq_exit_rcu+0x194/0x210 kernel/softirq.c:767
 irq_exit_rcu+0x9/0x30 kernel/softirq.c:784
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1062 [inline]
 sysvec_apic_timer_interrupt+0xa3/0xc0 arch/x86/kernel/apic/apic.c:1062
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:674

Memory state around the buggy address:
 ffff888034999c80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff888034999d00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff888034999d80: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
                                     ^
 ffff888034999e00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff888034999e80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
==================================================================


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
