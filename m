Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793876991;
	b=D+tu2PTiNV1ZFcKVHbJKFo22MqkTPcvGNJ3F/6wW2U+IeXK1VkxZtP//1xIonBYCEOrJ
	 OLYoq8ifWOiYvRBVsP5FEFqTGYe6NtqnxSxGXl34n99mAE6emBtidwch54D7CShMtsVI4
	 Ld/BsB4hMUqXSxVYvw9WyJ66nNpxdliYs5PCaqeaDJ+z00aHuNHe9woamFg92RAyDMGMO
	 cLtjv34wPxdBN2IZwGoHUs7dtJwl59Hi9DxY+OfAERU9NteoyZYmPUWJC1zV0OUPr0OTL
	 GD6zZsYJrucwD4nmwRzQ2LhEm5hNb6uIXvxDJqWyxoEdz4hTDnOMlDMOsnb2BLaPi5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793876991;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=BR00Dpxko6WL7FYEXY9i3C8lkNmUwrkbEGiJyBaasfE=;
	b=dPqyC8nkytrbenTWFIngVjlxFKB+98QFw/pJMoSKN68X0p5XSs7sY29YZKoUKE6aZxPE
	 I0vi9OKUtCzNA9ggv3ZNxGdAb0EPAu3eermw8XWd54s/uvZQhqHImA51ZZ0JCZb9+pf5/
	 nlSzpY2sThTadZdphAv5PSx9wFgMK4v1h4BoZEva7mZj4QQCf9evdwvYvD8zIBBpf2IRY
	 kR7jIb5w7gQ7hiM0I3i15R8ELM+rJjuvlnA6KUl3Oeied0OobpIeqx9umD8IYtYYFGPev
	 53hOAjQNTSSR+g43TjQDI0FYxnPfuvE/iPxf0s1zJI9Jnlnxxct5xmL4ixiu38WN9kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997CB606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:09:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 997CB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4e778acdbc6so2489686b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 03:09:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793876989; x=1794481789;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BR00Dpxko6WL7FYEXY9i3C8lkNmUwrkbEGiJyBaasfE=;
        b=jaqtPyKBu0TYh2HIstm3wDB0VioiCJHjU5Yf7MSprxGPyzPnylULKo6Avfu/VvlD8k
         AM2I6pWMnBm+0uXGrmOeAZLO6ZiCOX7ydkmaWiVJlYVHYfKVDTDkK02RLMcv+B45s8p8
         46FDkVLvqNVOr5NjF8G2ZbEsUqnXUTZsZdgsSzd/D3TlFjS4dqPRkayfffby0lln1WJ1
         4+P7TlIogpbwCzKnCqopS3hizj4gsxC2yymcnj8kdHoeE9+Q393U5MMgYEdEeLyl2uNC
         4BBDNJxplLN3zPnAGss45pvj6JhWH3X3DL4wIsXFE5nHTMy5LXv0tx4GGJOTku4SJ5/8
         cQCA==
X-Forwarded-Encrypted: i=1; AKwUvBzVDg/Zg+eXY3+ggOo3QRR7QbBNByMPtox+++w44+LBv9/dcw0oUY1i+xkHkaC+wz/PAZzNBjbcDSDLiZY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bMJr9IvIi245CfbQnUOo4wf+EAsdtZnknvEuoF1uzbChZtrmK
	oeGtcM3eafY0ptA0XEDXoBNRid7ypyMBlr0gLRs73KzmZoi2l92ZuKNrInZ3JsXXQ1YhoYsu+MV
	1o8ECw+hk0w4uRe+ZVqKEYnECmbhLDAu7ZQSubSvQ9XhueBqIqDzbhPEkaKc=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:120a:b0:55b:ea1c:3ce8 with SMTP id
 5614622812f47-5640def172emr13317976b6e.21.1793876989635; Thu, 05 Nov 2026
 03:09:49 -0800 (PST)
Date: Thu, 05 Nov 2026 03:09:49 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aec63fd.5f5735a5.290c1c.0002.GAE@google.com>
Subject: [syzbot] [greybus?] [usb?] KASAN: slab-out-of-bounds Read in gb_svc_request_handler
From: syzbot <syzbot+693652ded53d3eb9cb91@syzkaller.appspotmail.com>
To: elder@kernel.org, gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org, 
	johan@kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    6628e7d4c6b2 Linux 7.4-rc1
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=1308eadd580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f9bf69220d319004
dashboard link: https://syzkaller.appspot.com/bug?extid=693652ded53d3eb9cb91
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17bebe69580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12c1344e580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/d415be35d54e/disk-6628e7d4.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/69e49385122b/vmlinux-6628e7d4.xz
kernel image: https://storage.googleapis.com/syzbot-assets/51be81fff25f/bzImage-6628e7d4.xz

AI-generated root cause summary:
In drivers/greybus/operation.c, gb_connection_recv() verifies that the received
buffer length is at least sizeof(header) and that size >= msg_size, but fails to
check whether msg_size (from header.size) is at least sizeof(header). When an
incoming message has header.size < sizeof(struct gb_operation_msg_hdr),
gb_operation_create_incoming() computes request_size = size - sizeof(struct
gb_operation_msg_hdr), causing an unsigned size_t underflow to SIZE_MAX. While
gb_operation_message_alloc() wraps the allocation size back to the short
msg_size (allocating e.g. 7 bytes), gb_operation_message_init() sets
payload_size to SIZE_MAX and sets payload to header + 1 (offset 8, past the end
of the buffer). Consequently, request handlers like gb_svc_version_request()
pass the payload_size validation and perform out-of-bounds heap reads on
op->request->payload.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=693652ded53d3eb9cb91

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+693652ded53d3eb9cb91@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-out-of-bounds in gb_svc_version_request drivers/greybus/svc.c:658 [inline]
BUG: KASAN: slab-out-of-bounds in gb_svc_request_handler+0x10de/0x1250 drivers/greybus/svc.c:1271
Read of size 1 at addr ffff888104ad2108 by task kworker/u8:0/12

CPU: 0 UID: 0 PID: 12 Comm: kworker/u8:0 Not tainted syzkaller #0 PREEMPT(lazy) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/07/2026
Workqueue: greybus1:0 gb_operation_work
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x13d/0x4b0 mm/kasan/report.c:482
 kasan_report+0xdf/0x1c0 mm/kasan/report.c:595
 gb_svc_version_request drivers/greybus/svc.c:658 [inline]
 gb_svc_request_handler+0x10de/0x1250 drivers/greybus/svc.c:1271
 gb_operation_request_handle drivers/greybus/operation.c:243 [inline]
 gb_operation_work+0xb7/0x990 drivers/greybus/operation.c:280
 process_one_work+0xac7/0x1b10 kernel/workqueue.c:3495
 process_scheduled_works kernel/workqueue.c:3578 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3659
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x69f/0xc90 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Allocated by task 0:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:409 [inline]
 __kasan_kmalloc+0x8f/0xa0 mm/kasan/common.c:426
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __do_kmalloc_node mm/slub.c:5531 [inline]
 __kmalloc_noprof+0x315/0x7e0 mm/slub.c:5556
 _kmalloc_noprof include/linux/slab.h:995 [inline]
 _kzalloc_noprof include/linux/slab.h:1312 [inline]
 gb_operation_message_alloc+0x9b/0x2c0 drivers/greybus/operation.c:380
 gb_operation_create_common+0x9f/0x710 drivers/greybus/operation.c:532
 gb_operation_create_incoming drivers/greybus/operation.c:644 [inline]
 gb_connection_recv_request drivers/greybus/operation.c:926 [inline]
 gb_connection_recv+0x1dc/0x1050 drivers/greybus/operation.c:1063
 greybus_data_rcvd+0x244/0x600 drivers/greybus/connection.c:89
 cport_in_callback+0x1fb/0x280 drivers/greybus/es2.c:840
 __usb_hcd_giveback_urb+0x38e/0x610 drivers/usb/core/hcd.c:1657
 usb_hcd_giveback_urb+0x3ca/0x4a0 drivers/usb/core/hcd.c:1741
 dummy_timer+0xdb5/0x3840 drivers/usb/gadget/udc/dummy_hcd.c:2051
 __run_hrtimer kernel/time/hrtimer.c:2079 [inline]
 __hrtimer_run_queues+0x448/0x9a0 kernel/time/hrtimer.c:2136
 hrtimer_run_softirq+0x1ca/0x360 kernel/time/hrtimer.c:2153
 handle_softirqs+0x209/0xa00 kernel/softirq.c:669
 __do_softirq kernel/softirq.c:703 [inline]
 invoke_softirq kernel/softirq.c:542 [inline]
 __irq_exit_rcu+0x17a/0x220 kernel/softirq.c:786
 irq_exit_rcu+0x9/0x30 kernel/softirq.c:809
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1062 [inline]
 sysvec_apic_timer_interrupt+0x8f/0xb0 arch/x86/kernel/apic/apic.c:1062
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:674

The buggy address belongs to the object at ffff888104ad2100
 which belongs to the cache kmalloc-8 of size 8
The buggy address is located 1 bytes to the right of
 allocated 7-byte region [ffff888104ad2100, ffff888104ad2107)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffff888104ad2600 pfn:0x104ad2
flags: 0x200000000000200(workingset|node=0|zone=2)
page_type: f5(slab)
raw: 0200000000000200 ffff888100041500 ffffea00040eb410 ffffea000403ef50
raw: ffff888104ad2600 000000000080007a 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0xd2cc0(GFP_KERNEL|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 1, tgid 1 (swapper/0), ts 5446373684
 set_page_owner include/linux/page_owner.h:33 [inline]
 post_alloc_hook+0xfd/0x120 mm/page_alloc.c:1856
 prep_new_page mm/page_alloc.c:1864 [inline]
 get_page_from_freelist+0xf4b/0x3440 mm/page_alloc.c:3935
 __alloc_frozen_pages_noprof+0x299/0x2d50 mm/page_alloc.c:5444
 alloc_slab_page mm/slub.c:3384 [inline]
 allocate_slab mm/slub.c:3499 [inline]
 new_slab+0xb1/0x6d0 mm/slub.c:3550
 refill_objects+0xe3/0x410 mm/slub.c:7539
 refill_sheaf mm/slub.c:2917 [inline]
 __pcs_replace_empty_main+0x35e/0x650 mm/slub.c:4811
 alloc_from_pcs mm/slub.c:4887 [inline]
 slab_alloc_node mm/slub.c:5021 [inline]
 __do_kmalloc_node mm/slub.c:5530 [inline]
 __kmalloc_noprof+0x617/0x7e0 mm/slub.c:5556
 _kmalloc_noprof include/linux/slab.h:995 [inline]
 _kzalloc_noprof include/linux/slab.h:1312 [inline]
 acpi_ns_internalize_name+0x161/0x2e0 drivers/acpi/acpica/nsutils.c:331
 acpi_ns_get_node_unlocked+0x18c/0x500 drivers/acpi/acpica/nsutils.c:666
 acpi_ns_get_node+0x6c/0xf0 drivers/acpi/acpica/nsutils.c:726
 acpi_ns_evaluate+0xb01/0x1670 drivers/acpi/acpica/nseval.c:62
 acpi_ut_evaluate_object+0xf7/0x610 drivers/acpi/acpica/uteval.c:60
 acpi_ut_execute_power_methods+0x1f9/0x3c0 drivers/acpi/acpica/uteval.c:288
 acpi_get_object_info+0xa43/0xbe0 drivers/acpi/acpica/nsxfname.c:366
 acpi_set_pnp_ids drivers/acpi/scan.c:1405 [inline]
 acpi_init_device_object+0xc12/0x1a90 drivers/acpi/scan.c:1827
 acpi_add_single_object+0xe8/0x1a10 drivers/acpi/scan.c:1877
page last free pid 1 tgid 1 ts 5222696283 stack trace:
 reset_page_owner include/linux/page_owner.h:26 [inline]
 __free_pages_prepare mm/page_alloc.c:1403 [inline]
 __free_frozen_pages+0x714/0xfc0 mm/page_alloc.c:2954
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x47/0xf0 mm/kasan/quarantine.c:179
 kasan_quarantine_remove_cache+0x168/0x190 mm/kasan/quarantine.c:388
 kmem_cache_shrink+0xd/0x20 mm/slab_common.c:620
 acpi_os_purge_cache+0x15/0x20 drivers/acpi/osl.c:1622
 acpi_purge_cached_objects+0xa3/0x140 drivers/acpi/acpica/utxface.c:239
 acpi_initialize_objects+0x8b/0x100 drivers/acpi/acpica/utxfinit.c:250
 acpi_bus_init drivers/acpi/bus.c:1381 [inline]
 acpi_init+0x1b0/0x840 drivers/acpi/bus.c:1471
 do_one_initcall+0x11c/0x6f0 init/main.c:1419
 do_initcall_level init/main.c:1481 [inline]
 do_initcalls init/main.c:1497 [inline]
 do_basic_setup init/main.c:1517 [inline]
 kernel_init_freeable+0x6ea/0x7b0 init/main.c:1732
 kernel_init+0x21/0x1e0 init/main.c:1622
 ret_from_fork+0x69f/0xc90 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Memory state around the buggy address:
 ffff888104ad2000: fa fc fc fc fa fc fc fc fa fc fc fc fa fc fc fc
 ffff888104ad2080: fa fc fc fc fa fc fc fc fa fc fc fc fa fc fc fc
>ffff888104ad2100: 07 fc fc fc fa fc fc fc 06 fc fc fc 06 fc fc fc
                      ^
 ffff888104ad2180: 06 fc fc fc 06 fc fc fc 06 fc fc fc 06 fc fc fc
 ffff888104ad2200: 06 fc fc fc 06 fc fc fc fa fc fc fc fa fc fc fc
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
