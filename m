Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794820728;
	b=zf2I8mhtZ78QEyWzrfy79zU+QSABczuWUB/pG96eGGTkPNIXVu+Ok0Rs4wTQF868wS0a
	 CRTqbfhnBvYHsXJhfnaCDfWAvfayarsTd8ezKAh92PvpX05tZlmpM08kmXyqkI+HSKxkh
	 BfzaCUwu1oDQZhFBjqSeAJDVhFoVBi99yXKkwdNIYg06/5DQN42YIq2gN1QCyBV5GAkAb
	 zjDkjKujaIQepuFYMFqX98G1J11D4UAhXJ8RNdSePRIeMlwZ12ySTG/69v9m6QhUUvUNL
	 ILlKcMOK0qRPS9Xn4JYDIEuBzEayTo71w4bggMFawVMQ+8ZW/Rl+FbJx6kzxjMGOIlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794820728;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=E8rkjePjz1Ut0WHRsT6b7Na+htFltLTMtUU6Wvnfv9I=;
	b=3067AowMAAIDCpkQws+ZJbZuiGzAn6z4JZZDB9McTGAoqpKtkyxDpd3bt8YHgRp7eq6k
	 S9VacyJegBgg4UIgEcgoIHdMsrPChpPz++iaKvvow5gYJziG4g3X6Jmz+YPchMJHWccDb
	 8qRzdjKgxoQcC2DsM7jSRSaa+DTUHSk/C9v4qA9Fu/rg3J8ZD6bRDZk58Pn4bk1+uIH90
	 /UnhJ7HiG+TSmRXNE4Ad75xJonh3Hw6dicDOxIdPVO+7QVVTuIhKe8HgK57tSZjqz1Itj
	 HPTf8yIZ/mul2ZYURV+nsJZNLzGaSowl1ZlRFTP8s4F6hTWrZOSC6r3dNnmYGXhJ3WA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44295606A336
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:18:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44295606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-571bc0b66d7so1917298b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 01:18:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794820727; x=1795425527;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E8rkjePjz1Ut0WHRsT6b7Na+htFltLTMtUU6Wvnfv9I=;
        b=2EKo7r0YSeXNuHWDzueyq7v9HBQlVkeq/XbrMxcKh1C+0ath4exJYjogWA5eNqYirs
         JL71+WM7rTkT/j/n4CrnLfWe/9dbkhRN/R3K4QXnIkJqlbrUWlIZho60bjXSyJszIIQ/
         EoeUF7Dg0YZ5PpSlhlofVwJhqbS3C6ZWjZa6qbkpAFVog6oObvzVeQmT1tW0Kq8813yb
         Pd14EYBvOhPZX8VVGmadCJpZ9qbWsChDaj1LSTkEWAdh5jEWQ6w5fog1d9osNo36G9Q0
         gRHTTbp4hUwe2jNks1qTZJgnxr2nk3t7sazGove5XEKb9UJdY0+SM0r3hxV4IvVIP0Yt
         9s2A==
X-Gm-Message-State: APuU4Z9LL93wNIeWOaKJ00HjIsC3EsgoMeJuG8OFKMUZeSY6t5k80dQY
	DaSfwvy4Z0JpNu/xUTFR/UHdfN+vBKmefAe83n/uP1E18J2ZdgvKthZrn8Y80WvauJzxiftzOcJ
	oAO0Xdt/whzZC9cqHjlcZpHZOqAWZvR6hDnCwb2Z21RdFcKXapLtIsJWnc4g=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:250d:b0:4d6:90f4:48b1 with SMTP id
 5614622812f47-56e65206dfamr7856763b6e.51.1794820727231; Mon, 16 Nov 2026
 01:18:47 -0800 (PST)
Date: Mon, 16 Nov 2026 01:18:47 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6afaca77.371d364b.254eb1.0015.GAE@google.com>
Subject: [syzbot] KASAN: slab-use-after-free Read in ppp_disconnect_channel
From: syzbot <syzbot+6b18da3ef22e33061add@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    6964ff21c5d8 net: mana: Allocate queue MSI-X vectors on de..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git
console output: https://syzkaller.appspot.com/x/log.txt?x=15f2ef35580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8fbc480f13a2deb8
dashboard link: https://syzkaller.appspot.com/bug?extid=6b18da3ef22e33061add
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=116bd4d9580000

AI-generated root cause summary:
In `ppp_unregister_channel()`, `ppp_disconnect_channel(pch)` is invoked prior to
clearing `pch->chan`. While `ppp_disconnect_channel()` disconnects the channel
and waits in `synchronize_net()`, `pch->ppp` is NULL while `pch->chan` is still
non-NULL, allowing a concurrent `PPPIOCCONNECT` ioctl to pass the `!pch->chan`
check and re-attach the dying channel onto `ppp->channels`. Additionally,
`ppp_disconnect_channel()` prematurely unlocks `pch->upl` after nullifying
`pch->ppp` before acquiring `ppp_lock(ppp)` to delete `pch->clist`. As a result,
the unregistering channel is queued for RCU release by `ppp_release_channel()`
while its `clist` node remains linked into `ppp->channels`, causing a slab
use-after-free and linked list corruption on subsequent operations.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=6b18da3ef22e33061add

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+6b18da3ef22e33061add@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in __list_del_entry_valid_or_report+0x92/0x190 lib/list_debug.c:62
Read of size 8 at addr ffff88807ee8aa10 by task syz-executor994/6046

CPU: 0 UID: 0 PID: 6046 Comm: syz-executor994 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 11/06/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description+0x55/0x1e0 mm/kasan/report.c:378
 print_report+0x58/0x70 mm/kasan/report.c:482
 kasan_report+0x117/0x150 mm/kasan/report.c:595
 __list_del_entry_valid_or_report+0x92/0x190 lib/list_debug.c:62
 __list_del_entry_valid include/linux/list.h:140 [inline]
 __list_del_entry include/linux/list.h:261 [inline]
 list_del_rcu include/linux/rculist.h:178 [inline]
 ppp_disconnect_channel+0xd6/0x2a0 drivers/net/ppp/ppp_generic.c:3645
 ppp_unregister_channel+0x64/0x270 drivers/net/ppp/ppp_generic.c:3085
 ppp_asynctty_close+0x79/0x110 drivers/net/ppp/ppp_async.c:183
 tty_ldisc_kill drivers/tty/tty_ldisc.c:613 [inline]
 tty_ldisc_release+0x23f/0x520 drivers/tty/tty_ldisc.c:781
 tty_release_struct+0x2a/0xd0 drivers/tty/tty_io.c:1656
 tty_release+0xc62/0x1670 drivers/tty/tty_io.c:1827
 __fput+0x408/0xa40 fs/file_table.c:512
 fput_close_sync+0x11f/0x240 fs/file_table.c:618
 filp_close_sync fs/open.c:1574 [inline]
 __do_sys_close fs/open.c:1597 [inline]
 __se_sys_close+0xa2/0x160 fs/open.c:1584
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x16a/0x530 arch/x86/entry/syscall_64.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fa749932e5e
Code: 08 0f 85 f5 e2 ff ff 49 89 fb 48 89 f0 48 89 d7 48 89 ce 4c 89 c2 4d 89 ca 4c 8b 44 24 08 4c 8b 4c 24 10 4c 89 5c 24 08 0f 05 <c3> 90 41 57 41 56 4d 89 c6 41 55 4d 89 cd 41 54 55 53 48 83 ec 08
RSP: 002b:00007ffdce7a74b8 EFLAGS: 00000246 ORIG_RAX: 0000000000000003
RAX: ffffffffffffffda RBX: 0000555594214400 RCX: 00007fa749932e5e
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000004
RBP: 0000000000000005 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000005
R13: 00007ffdce7a7540 R14: 00007ffdce7a7538 R15: 00007ffdce7a7570
 </TASK>

Allocated by task 6046:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:409 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:426
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __kmalloc_cache_noprof+0x31c/0x600 mm/slub.c:5680
 _kmalloc_noprof include/linux/slab.h:991 [inline]
 _kzalloc_noprof include/linux/slab.h:1312 [inline]
 ppp_register_net_channel+0x58/0x770 drivers/net/ppp/ppp_generic.c:2989
 ppp_asynctty_open+0x331/0x4c0 drivers/net/ppp/ppp_async.c:154
 tty_ldisc_open+0xa1/0x100 drivers/tty/tty_ldisc.c:432
 tty_set_ldisc+0x365/0x540 drivers/tty/tty_ldisc.c:563
 tty_ioctl+0xc30/0xde0 drivers/tty/tty_io.c:2718
 vfs_ioctl fs/ioctl.c:52 [inline]
 __do_sys_ioctl fs/ioctl.c:598 [inline]
 __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:584
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x16a/0x530 arch/x86/entry/syscall_64.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 6059:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 kasan_save_free_info+0x40/0x50 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:264 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:296
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2780 [inline]
 slab_free mm/slub.c:6630 [inline]
 kfree+0x1c5/0x650 mm/slub.c:6923
 rcu_do_batch kernel/rcu/tree.c:2650 [inline]
 rcu_core+0x92e/0x1230 kernel/rcu/tree.c:2919
 handle_softirqs+0x265/0x8d0 kernel/softirq.c:669
 __do_softirq kernel/softirq.c:703 [inline]
 invoke_softirq kernel/softirq.c:542 [inline]
 __irq_exit_rcu+0xc6/0x220 kernel/softirq.c:786
 irq_exit_rcu+0x9/0x30 kernel/softirq.c:809
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1062 [inline]
 sysvec_apic_timer_interrupt+0xa6/0xc0 arch/x86/kernel/apic/apic.c:1062
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:674

Last potentially related work creation:
 kasan_save_stack+0x3e/0x60 mm/kasan/common.c:57
 kasan_record_aux_stack+0xbd/0xd0 mm/kasan/generic.c:556
 __call_rcu_common kernel/rcu/tree.c:3287 [inline]
 call_rcu+0x86/0x300 kernel/rcu/tree.c:3395
 ppp_release+0x98/0x130 drivers/net/ppp/ppp_generic.c:419
 __fput+0x408/0xa40 fs/file_table.c:512
 fput_close_sync+0x11f/0x240 fs/file_table.c:618
 filp_close_sync fs/open.c:1574 [inline]
 __do_sys_close fs/open.c:1597 [inline]
 __se_sys_close+0xa2/0x160 fs/open.c:1584
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x16a/0x530 arch/x86/entry/syscall_64.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff88807ee8a800
 which belongs to the cache kmalloc-1k of size 1024
The buggy address is located 528 bytes inside of
 freed 1024-byte region [ffff88807ee8a800, ffff88807ee8ac00)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffff88807ee8b800 pfn:0x7ee88
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000240(workingset|head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000240 ffff88813ff25dc0 ffffea0000d8da10 ffffea0000a40a10
raw: ffff88807ee8b800 000000000010000d 00000000f5000000 0000000000000000
head: 00fff00000000240 ffff88813ff25dc0 ffffea0000d8da10 ffffea0000a40a10
head: ffff88807ee8b800 000000000010000d 00000000f5000000 0000000000000000
head: 00fff00000000003 fffffffffffffe01 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5684, tgid 5684 (syz-executor), ts 79942213210
 set_page_owner include/linux/page_owner.h:33 [inline]
 post_alloc_hook+0x1f9/0x250 mm/page_alloc.c:1860
 prep_new_page mm/page_alloc.c:1868 [inline]
 get_page_from_freelist+0x225d/0x22e0 mm/page_alloc.c:3950
 __alloc_frozen_pages_noprof+0x211/0x450 mm/page_alloc.c:5492
 alloc_slab_page mm/slub.c:3384 [inline]
 allocate_slab+0x7d/0x5e0 mm/slub.c:3499
 new_slab mm/slub.c:3550 [inline]
 refill_objects+0x2d5/0x350 mm/slub.c:7539
 refill_sheaf mm/slub.c:2917 [inline]
 __pcs_replace_empty_main+0x2c8/0x6c0 mm/slub.c:4811
 alloc_from_pcs mm/slub.c:4887 [inline]
 slab_alloc_node mm/slub.c:5021 [inline]
 __do_kmalloc_node mm/slub.c:5530 [inline]
 __kmalloc_noprof+0x476/0x710 mm/slub.c:5556
 _kmalloc_noprof include/linux/slab.h:995 [inline]
 _kzalloc_noprof include/linux/slab.h:1312 [inline]
 ip6t_alloc_initial_table+0x6b/0x6d0 net/ipv6/netfilter/ip6_tables.c:40
 ip6table_filter_table_init+0x1c/0xb0 net/ipv6/netfilter/ip6table_filter.c:41
 xt_find_table_lock+0x311/0x400 net/netfilter/x_tables.c:1353
 xt_request_find_table_lock+0x26/0x100 net/netfilter/x_tables.c:1378
 get_info net/ipv6/netfilter/ip6_tables.c:983 [inline]
 do_ip6t_get_ctl+0x77b/0x12f0 net/ipv6/netfilter/ip6_tables.c:1675
 nf_getsockopt+0x26e/0x290 net/netfilter/nf_sockopt.c:116
 ipv6_getsockopt+0x34e/0x420 net/ipv6/ipv6_sockglue.c:1385
 do_sock_getsockopt+0x4aa/0x640 net/socket.c:2505
 __sys_getsockopt net/socket.c:2536 [inline]
 __do_sys_getsockopt net/socket.c:2543 [inline]
 __se_sys_getsockopt net/socket.c:2540 [inline]
 __x64_sys_getsockopt+0x1a4/0x240 net/socket.c:2540
page last free pid 3332 tgid 3332 ts 79846699335 stack trace:
 reset_page_owner include/linux/page_owner.h:26 [inline]
 __free_pages_prepare mm/page_alloc.c:1402 [inline]
 __free_frozen_pages+0xd1a/0xe10 mm/page_alloc.c:2958
 __slab_free+0x269/0x2c0 mm/slub.c:5926
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x99/0x100 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x148/0x160 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x22/0x80 mm/kasan/common.c:361
 kasan_slab_alloc include/linux/kasan.h:253 [inline]
 slab_post_alloc_hook mm/slub.c:4720 [inline]
 slab_alloc_node mm/slub.c:5033 [inline]
 kmem_cache_alloc_node_noprof+0x34f/0x600 mm/slub.c:5105
 __alloc_skb+0x1db/0x7a0 net/core/skbuff.c:707
 alloc_skb include/linux/skbuff.h:1395 [inline]
 nlmsg_new include/net/netlink.h:1055 [inline]
 inet6_ifmcaddr_notify+0xfa/0x1e0 net/ipv6/mcast.c:940
 __ipv6_dev_mc_dec+0x2f3/0x3a0 net/ipv6/mcast.c:1038
 ipv6_mc_destroy_dev+0x33a/0x590 net/ipv6/mcast.c:2902
 addrconf_ifdown+0x1662/0x1bd0 net/ipv6/addrconf.c:4076
 addrconf_notify+0x1bc/0x1050 net/ipv6/addrconf.c:-1
 notifier_call_chain+0x1a5/0x3d0 kernel/notifier.c:86
 call_netdevice_notifiers_extack net/core/dev.c:2351 [inline]
 call_netdevice_notifiers net/core/dev.c:2365 [inline]
 unregister_netdevice_many_notify+0x1432/0x1dc0 net/core/dev.c:12802
 ops_exit_rtnl_list net/core/net_namespace.c:188 [inline]
 ops_undo_list+0x391/0x8f0 net/core/net_namespace.c:249
 cleanup_net+0x578/0x810 net/core/net_namespace.c:713

Memory state around the buggy address:
 ffff88807ee8a900: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88807ee8a980: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff88807ee8aa00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                         ^
 ffff88807ee8aa80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88807ee8ab00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
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
