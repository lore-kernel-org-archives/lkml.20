Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793064875;
	b=jrfyIGY8DylZLdYbHGgZWKoYOG8U5wHMbK0D3KltB4hs33qqBQpgdiq7zol81BYGxwxc
	 00uukf6g3yGTbMbtPabYGG3OiA9cjAWjvtC7lKlnaLv7ntiVpkGuArl8WOsbH0t1Vo1C3
	 YzKNLbxJRXRdTBp/U1zGsIb6vZ3ba7rjbfenM9MjL4o3732wM6WBIYVBAjzryV63MJT6s
	 ACOTsLGZ28Y3J2Gwi00xp22t3kJkWIZ8PulpgwAClyDHBLJft1nLKks2M//a69XD3RWOE
	 Yp+WpQ9+4LV78E0Z3zrq+HCVfRlvPkxQ2Vv2gaoJaBuJgkfHHBj0l0kjcS7vxP7NEMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793064875;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=sOsZVBn4b4LzfHznAaYs4t6qNeqkDZnQmy54g818oX0=;
	b=0/ubotc1WWHonZPXf76DHQWZYIOPUEq1F//Nj7Za11lwfhF2gREQrMOJWAjS8dbPi7ay
	 fb08x7PqctY9krP0UYS0PCRJ4RX7SZ9/K45dqa1KBGKeDCPaV9BJ5SklJlqcXbjsfCL3n
	 vy/lBCxQKZUTMyyJWzgMgLddyJ7tV+R7fW6cqqGNL9H2DYs56zpRP0Ii3y05tbP69KpD4
	 O/cuycEt0swGaIP1IbuEDexSCULf1+TeeICdClgRXclFGWkkmwObrkhybJQDnzqbXnI3b
	 zXP6xrAL18rkXzr97gxzqZfU1Ox2cmgHy4YKPIkf65xA0EmeaTfwLGZoa5DVvRM0zjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.70
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81753606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 01:34:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81753606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-815f2b1ecc3so8903980a34.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:34:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793064873; x=1793669673;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sOsZVBn4b4LzfHznAaYs4t6qNeqkDZnQmy54g818oX0=;
        b=BZjEhvMR3dIF2wp6F4bKhWxW5uLaFVm+Z0gTlyGCbEPiDpZ07J6lR7qvP7Ay1wu2j/
         2OYyamBVwS4GEPlgQZJlU3RIlDRHozl40i3h1ah6Q6jZtxdnaMaCdBekkfIXSRkhpJ5g
         6QX7dFAm0XYii4KsqQH71We71/zEAmiY1+G6bwaoGTmxtRNMHq7uk0Fe6dSNkAvFxhea
         C45C+sL84AZ6KvJV7S9O/x2e3Shsylpn+HXM5MxB1lz8XyplabF3gE7Jcj3XFJG7PSgF
         e7SvmtvsTiRZE+Rg1TN5LyG6S/za7E3S8noAYdX0Ps2kmZmwE7qAZiOm4h1CN4jMQh7T
         txcg==
X-Forwarded-Encrypted: i=1; AKwUvBx6ywDBzn33+5kzMMIDSzqDWjcBcWJQGGHueajOMm6G6zS7ZSmGhAOGOJ9csllzpLpL47LCtQHSi18m3p8=@vger.kernel.org
X-Gm-Message-State: AFq9FYL3tDBuJUUkeqjY8YvvAVF7o4m0nrKSo2pl0Jox41GVzcom+kiU
	iXUev73IalifGRXTJrwc62xWDk+T3MXdHlaBIuNC07j3DyGYgfld38FFKnEsjEJr0jzeBDave5P
	QWlbt4q0peq8PSRniDJwWkUcYqmt2O11CFdzWgbt/w0eg7imZvbN73a5+Cf0=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c1c2:b0:4f7:8bdd:b74 with SMTP id
 5614622812f47-55c00353e23mr5669489b6e.51.1793064873598; Mon, 26 Oct 2026
 18:34:33 -0700 (PDT)
Date: Mon, 26 Oct 2026 18:34:33 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6adfffa9.6200f071.51519.0f0e.GAE@google.com>
Subject: [syzbot] [jffs2?] KASAN: slab-use-after-free Read in
 jffs2_erase_pending_blocks (2)
From: syzbot <syzbot+49c659b5564b2a44083c@syzkaller.appspotmail.com>
To: dwmw2@infradead.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, richard@nod.at, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    734bef548a96 Merge tag 'net-next-7.4' of git://git.kernel...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13aa8195580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7ad42626b3d97dc5
dashboard link: https://syzkaller.appspot.com/bug?extid=49c659b5564b2a44083c
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/6c95be5ca2c8/disk-734bef54.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/975644b166ab/vmlinux-734bef54.xz
kernel image: https://storage.googleapis.com/syzbot-assets/131e7835977a/bzImage-734bef54.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+49c659b5564b2a44083c@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in list_empty include/linux/list.h:419 [inline]
BUG: KASAN: slab-use-after-free in jffs2_erase_pending_blocks+0x217/0x2400 fs/jffs2/erase.c:108
Read of size 8 at addr ffff88803c752228 by task jffs2_gcd_mtd0/8922

CPU: 1 UID: 0 PID: 8922 Comm: jffs2_gcd_mtd0 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/16/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description+0x55/0x1e0 mm/kasan/report.c:378
 print_report+0x58/0x70 mm/kasan/report.c:482
 kasan_report+0x117/0x150 mm/kasan/report.c:595
 list_empty include/linux/list.h:419 [inline]
 jffs2_erase_pending_blocks+0x217/0x2400 fs/jffs2/erase.c:108
 jffs2_garbage_collect_pass+0x6cc/0x2170 fs/jffs2/gc.c:253
 jffs2_garbage_collect_thread+0x693/0x720 fs/jffs2/background.c:155
 kthread+0x38b/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Allocated by task 8839:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:409 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:426
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __kmalloc_cache_noprof+0x3d0/0x670 mm/slub.c:5563
 _kmalloc_noprof include/linux/slab.h:991 [inline]
 _kzalloc_noprof include/linux/slab.h:1312 [inline]
 jffs2_init_fs_context+0x4f/0xc0 fs/jffs2/super.c:314
 alloc_fs_context+0x99e/0xd00 fs/fs_context.c:295
 do_new_mount+0x177/0xb00 fs/namespace.c:3966
 do_mount fs/namespace.c:4350 [inline]
 __do_sys_mount fs/namespace.c:4565 [inline]
 __se_sys_mount+0x31d/0x420 fs/namespace.c:4542
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 7208:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 kasan_save_free_info+0x40/0x50 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:264 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:296
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2748 [inline]
 slab_free mm/slub.c:6509 [inline]
 kfree+0x1c5/0x6d0 mm/slub.c:6802
 deactivate_locked_super+0xbe/0x110 fs/super.c:586
 cleanup_mnt+0x204/0x2a0 fs/namespace.c:1396
 task_work_run+0x1d9/0x260 kernel/task_work.c:233
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 __exit_to_user_mode_loop kernel/entry/common.c:70 [inline]
 exit_to_user_mode_loop+0x204/0x770 kernel/entry/common.c:101
 __exit_to_user_mode_prepare include/linux/irq-entry-common.h:207 [inline]
 syscall_exit_to_user_mode_prepare include/linux/irq-entry-common.h:230 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:343 [inline]
 do_syscall_64+0x328/0x520 arch/x86/entry/syscall_64.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff88803c752000
 which belongs to the cache kmalloc-4k of size 4096
The buggy address is located 552 bytes inside of
 freed 4096-byte region [ffff88803c752000, ffff88803c753000)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x3c750
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0x80000000000040(head|node=0|zone=1)
page_type: f5(slab)
raw: 0080000000000040 ffff88813ff11140 dead000000000100 dead000000000122
raw: 0000000000000000 0000000000040004 00000000f5000000 0000000000000000
head: 0080000000000040 ffff88813ff11140 dead000000000100 dead000000000122
head: 0000000000000000 0000000000040004 00000000f5000000 0000000000000000
head: 0080000000000003 fffffffffffffe01 00000000ffffffff 00000000ffffffff
head: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5254, tgid 5254 (dhcpcd), ts 52755560116
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
 __kmalloc_node_track_caller_noprof+0x619/0x7b0 mm/slub.c:5545
 kmalloc_reserve net/core/skbuff.c:638 [inline]
 __alloc_skb+0x2c1/0x7a0 net/core/skbuff.c:716
 alloc_skb include/linux/skbuff.h:1390 [inline]
 nlmsg_new include/net/netlink.h:1055 [inline]
 ctrl_build_family_msg net/netlink/genetlink.c:1387 [inline]
 ctrl_getfamily+0x3d0/0x5c0 net/netlink/genetlink.c:1467
 genl_family_rcv_msg_doit+0x233/0x340 net/netlink/genetlink.c:1114
 genl_family_rcv_msg net/netlink/genetlink.c:1194 [inline]
 genl_rcv_msg+0x614/0x7a0 net/netlink/genetlink.c:1209
 netlink_rcv_skb+0x226/0x4a0 net/netlink/af_netlink.c:2576
 genl_rcv+0x28/0x40 net/netlink/genetlink.c:1218
 netlink_unicast_kernel net/netlink/af_netlink.c:1335 [inline]
 netlink_unicast+0x90c/0xac0 net/netlink/af_netlink.c:1361
 netlink_sendmsg+0x7f0/0xb20 net/netlink/af_netlink.c:1920
 sock_sendmsg_nosec+0x14e/0x190 net/socket.c:800
page last free pid 5254 tgid 5254 ts 52751440575 stack trace:
 reset_page_owner include/linux/page_owner.h:26 [inline]
 __free_pages_prepare mm/page_alloc.c:1418 [inline]
 __free_frozen_pages+0xf8e/0x1070 mm/page_alloc.c:2962
 skb_release_all net/core/skbuff.c:1188 [inline]
 __kfree_skb+0x5d/0x210 net/core/skbuff.c:1202
 netlink_recvmsg+0x5ce/0xa70 net/netlink/af_netlink.c:1998
 sock_recvmsg_nosec net/socket.c:1154 [inline]
 sock_recvmsg+0x196/0x1e0 net/socket.c:1176
 ____sys_recvmsg+0x1f6/0x510 net/socket.c:2935
 ___sys_recvmsg+0x213/0x5a0 net/socket.c:2977
 __sys_recvmsg net/socket.c:3010 [inline]
 __do_sys_recvmsg net/socket.c:3016 [inline]
 __se_sys_recvmsg net/socket.c:3013 [inline]
 __x64_sys_recvmsg+0x1b4/0x290 net/socket.c:3013
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffff88803c752100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88803c752180: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff88803c752200: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                  ^
 ffff88803c752280: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88803c752300: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
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
