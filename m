Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793514303;
	b=YOh4IcAcANP22UezuUsrfflx0Wn3DMei8ZWgb+HjhV4EqYd6bL6pbabx8xvRAwal4nkd
	 C/WDKvowb5do8wNQ35Su7tv8VO6mTeZ9rN47fYIrcHgA40Lh5388aafY6kFM+831NVF2T
	 zMEmRGzLgCXe/rTmhCjzwwa8gw7ki6JEIVS9C2QJhLRnwcQ6odGmp2zoGUEPKuTH+CUIA
	 XKTeuAsp5/JnuiiTTV9OM7hmkrnvmf1tplIc/1CgZO4crflTlnWPtwLYTbC2kDaSUC5NX
	 /H1AX76R6Ol5o+MNOvPiR/CfGxjc/SGkpkUeDgeQucpGYT/hEmxudrG+wVpViBN5NAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793514303;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=LBCVhjiQ4UnXbgtuwkr79vPGmXAfsLMYipoK8FMATlg=;
	b=Glv5rjRJaUva9AMZISPfD4M9Qo2At2q6AMZyCaVWzb4dTrk73c0e8KW58ozZGxusF88K
	 vWMD2VSdY51o4147RMV2N+lTE0+LI6TF8bj7ALOVt0SIPSl3yl28gReE9KULPqfi4QacM
	 blhZw7oAWH3x8syzdrvwMzFtwF2xRrrkCny7mn8hhDIes83cgle8SY2wWKE5FzVcRpTko
	 tWmzPf0y7oYYlh0iyInu0PuHox9C2xdqFN8IXb2YPjD1nZslyDaERh6SWKuQisIw87SYj
	 ORpzwKgCcxacvN5gjbDB33oQdulk3uuKaycIL4fGVmM1cS8PMvr3XRL3vJnrJY1x8Cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83909606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 06:25:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83909606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4e778acdbc6so3397651b6e.3
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 23:25:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793514302; x=1794119102;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LBCVhjiQ4UnXbgtuwkr79vPGmXAfsLMYipoK8FMATlg=;
        b=QSHk/e4COJgsgG9fnpeeJF5yxl/9WZHQQCsvDa/r4bqBdKltX97aVNfr1gd09Tk8oF
         JInRIwhqd23wjzot/Q6BkLhAD8rtlkChIGhzSXiM7X8oAtn/bL4s6PEDvZHEopGm9Ex5
         mASy/gqz6MFwBCIYU5MdXW2/Y9sjvhPsa5xlH+EDZYzoLZzcU3prbvzqwLsPqIoXyRfP
         u1Lu3Yd2P8KfDQxc9Suirexxj2zjHSwp3heve2DkMgKgJfXp+0stsXPiSp/DgMYFchoO
         FMOqi8rruigdwmxZH5FaW+CRXBN+cWXDFcLytC8oZPg/OFPsxB4xKAfNbrrnRLLWyWZi
         GuEg==
X-Gm-Message-State: AFq9FYLWe4r9J+28bfdSfK1ONtZsdqJAEsH925jgPapIWB/3mgWbgZ0n
	Lpe2IKxdze1PUF7BJGTnT0zROw1BKcTSUWEk8bKKzpCH9vCX5L8wbv4v8WToJnnYU0pmhtHxLYn
	mwRY/wT9sWfPeJd14bY0xe5M58vlztcVHoGUhMbOoU3hW8DCw2W/+tLlE5Ho=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c3ed:b0:4cb:818f:d571 with SMTP id
 5614622812f47-5640df3d5aemr4760535b6e.25.1793514302487; Sat, 31 Oct 2026
 23:25:02 -0700 (PDT)
Date: Sat, 31 Oct 2026 23:25:02 -0700
In-Reply-To: <CAD8CXUk_NjipxtM_+BjrQc7fYebgxn+CCij+Q_t8AW8MyeJTLw@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae6db3e.c8ffc79a.e3697.000f.GAE@google.com>
Subject: Re: [syzbot] [serial?] KASAN: slab-use-after-free Read in check_tty_count
From: syzbot <syzbot+39a2135de1558208d3b3@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	varun.singh10011@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
KASAN: slab-use-after-free Read in check_tty_count

==================================================================
BUG: KASAN: slab-use-after-free in instrument_atomic_read include/linux/instrumented.h:82 [inline]
BUG: KASAN: slab-use-after-free in _test_bit include/asm-generic/bitops/instrumented-non-atomic.h:141 [inline]
BUG: KASAN: slab-use-after-free in tty_port_kopened include/linux/tty_port.h:234 [inline]
BUG: KASAN: slab-use-after-free in check_tty_count+0x134/0x2b0 drivers/tty/tty_io.c:287
Read of size 8 at addr ffff88802fb2d230 by task syz.1.18/6460

CPU: 0 UID: 0 PID: 6460 Comm: syz.1.18 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x13d/0x4b0 mm/kasan/report.c:482
 kasan_report+0xdf/0x1c0 mm/kasan/report.c:595
 check_region_inline mm/kasan/generic.c:186 [inline]
 kasan_check_range+0x10f/0x1e0 mm/kasan/generic.c:200
 instrument_atomic_read include/linux/instrumented.h:82 [inline]
 _test_bit include/asm-generic/bitops/instrumented-non-atomic.h:141 [inline]
 tty_port_kopened include/linux/tty_port.h:234 [inline]
 check_tty_count+0x134/0x2b0 drivers/tty/tty_io.c:287
 tty_release+0x95/0x1300 drivers/tty/tty_io.c:1703
 __fput+0x3fb/0xb50 fs/file_table.c:512
 fput_close_sync+0x118/0x250 fs/file_table.c:618
 filp_close_sync+0x75/0xa0 fs/open.c:1573
 __range_close+0x4a6/0x8b0 fs/file.c:919
 __do_sys_close_range fs/file.c:1003 [inline]
 __se_sys_close_range fs/file.c:954 [inline]
 __x64_sys_close_range+0x1f8/0x430 fs/file.c:954
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f2c3f39e0d9
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffe8f94f768 EFLAGS: 00000246 ORIG_RAX: 00000000000001b4
RAX: ffffffffffffffda RBX: 00007f2c3f627da0 RCX: 00007f2c3f39e0d9
RDX: 0000000000000000 RSI: 000000000000001e RDI: 0000000000000003
RBP: 00007f2c3f627da0 R08: 00007f2c3f626038 R09: 0000000000000000
R10: 000000000003fda0 R11: 0000000000000246 R12: 0000000000016d7e
R13: 00007f2c3f625fac R14: 0000000000016aa0 R15: 00007ffe8f94f870
 </TASK>

Allocated by task 6461:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:409 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:426
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __kmalloc_cache_noprof+0x2f8/0x6d0 mm/slub.c:5680
 _kmalloc_noprof include/linux/slab.h:991 [inline]
 _kzalloc_noprof include/linux/slab.h:1312 [inline]
 gs_port_alloc drivers/usb/gadget/function/u_serial.c:1218 [inline]
 gserial_alloc_line_no_console+0xac/0x710 drivers/usb/gadget/function/u_serial.c:1298
 gserial_alloc_line+0x16/0xa0 drivers/usb/gadget/function/u_serial.c:1332
 acm_alloc_instance+0xd9/0x160 drivers/usb/gadget/function/f_acm.c:891
 try_get_usb_function_instance+0x136/0x1f0 drivers/usb/gadget/functions.c:28
 usb_get_function_instance+0x16/0x70 drivers/usb/gadget/functions.c:44
 function_make+0x18c/0x3f0 drivers/usb/gadget/configfs.c:626
 configfs_mkdir+0x525/0xd40 fs/configfs/dir.c:1369
 vfs_mkdir+0x36d/0x8a0 fs/namei.c:5428
 filename_mkdirat+0x4c4/0x630 fs/namei.c:5461
 __do_sys_mkdirat fs/namei.c:5482 [inline]
 __se_sys_mkdirat fs/namei.c:5479 [inline]
 __x64_sys_mkdirat+0x89/0xc0 fs/namei.c:5479
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 6461:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 kasan_save_free_info+0x3b/0x70 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:264 [inline]
 __kasan_slab_free+0x5f/0x80 mm/kasan/common.c:296
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2780 [inline]
 slab_free mm/slub.c:6630 [inline]
 kfree+0x22b/0x6d0 mm/slub.c:6923
 gserial_free_port+0x141/0x2f0 drivers/usb/gadget/function/u_serial.c:1262
 gserial_free_line+0xf8/0x1e0 drivers/usb/gadget/function/u_serial.c:1279
 acm_free_instance+0x3b/0x60 drivers/usb/gadget/function/f_acm.c:875
 usb_put_function_instance+0x97/0xc0 drivers/usb/gadget/functions.c:77
 config_item_cleanup+0x146/0x240 fs/configfs/item.c:128
 config_item_release fs/configfs/item.c:137 [inline]
 kref_put include/linux/kref.h:65 [inline]
 config_item_put fs/configfs/item.c:149 [inline]
 config_item_put+0x93/0xb0 fs/configfs/item.c:146
 configfs_rmdir+0x5e3/0x950 fs/configfs/dir.c:1580
 vfs_rmdir fs/namei.c:5533 [inline]
 vfs_rmdir+0x328/0x8e0 fs/namei.c:5506
 filename_rmdir+0x31a/0x610 fs/namei.c:5590
 __do_sys_rmdir fs/namei.c:5613 [inline]
 __se_sys_rmdir fs/namei.c:5610 [inline]
 __x64_sys_rmdir+0x46/0x70 fs/namei.c:5610
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff88802fb2d000
 which belongs to the cache kmalloc-2k of size 2048
The buggy address is located 560 bytes inside of
 freed 2048-byte region [ffff88802fb2d000, ffff88802fb2d800)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x2fb28
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88801c442f00 dead000000000100 dead000000000122
raw: 0000000000000000 0000000000080008 00000000f5000000 0000000000000000
head: 00fff00000000040 ffff88801c442f00 dead000000000100 dead000000000122
head: 0000000000000000 0000000000080008 00000000f5000000 0000000000000000
head: 00fff00000000003 fffffffffffffe01 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5732, tgid 5732 (syz-executor), ts 48781510074
 set_page_owner include/linux/page_owner.h:33 [inline]
 post_alloc_hook+0xfd/0x120 mm/page_alloc.c:1856
 prep_new_page mm/page_alloc.c:1864 [inline]
 get_page_from_freelist+0x1113/0x35e0 mm/page_alloc.c:3935
 __alloc_frozen_pages_noprof+0x2bd/0x3280 mm/page_alloc.c:5444
 alloc_slab_page mm/slub.c:3384 [inline]
 allocate_slab mm/slub.c:3499 [inline]
 new_slab+0xb1/0x6d0 mm/slub.c:3550
 refill_objects+0xe3/0x410 mm/slub.c:7539
 refill_sheaf mm/slub.c:2917 [inline]
 __pcs_replace_empty_main+0x35e/0x650 mm/slub.c:4811
 alloc_from_pcs mm/slub.c:4887 [inline]
 slab_alloc_node mm/slub.c:5021 [inline]
 __do_kmalloc_node mm/slub.c:5530 [inline]
 __kmalloc_node_track_caller_noprof+0x6a3/0x870 mm/slub.c:5662
 kmalloc_reserve+0xe8/0x350 net/core/skbuff.c:638
 __alloc_skb+0x185/0x710 net/core/skbuff.c:716
 alloc_skb include/linux/skbuff.h:1390 [inline]
 nlmsg_new include/net/netlink.h:1055 [inline]
 rtmsg_ifinfo_build_skb+0x81/0x260 net/core/rtnetlink.c:4617
 rtmsg_ifinfo_event net/core/rtnetlink.c:4659 [inline]
 rtmsg_ifinfo_event net/core/rtnetlink.c:4649 [inline]
 rtnetlink_event+0x137/0x1f0 net/core/rtnetlink.c:7229
 notifier_call_chain+0x99/0x3f0 kernel/notifier.c:86
 call_netdevice_notifiers_info+0xbe/0x110 net/core/dev.c:2313
 call_netdevice_notifiers_extack net/core/dev.c:2351 [inline]
 call_netdevice_notifiers net/core/dev.c:2365 [inline]
 netif_set_mac_address+0x370/0x4a0 net/core/dev.c:10235
 do_setlink.isra.0+0x75f/0x3f50 net/core/rtnetlink.c:3246
 rtnl_changelink net/core/rtnetlink.c:3942 [inline]
 __rtnl_newlink net/core/rtnetlink.c:4113 [inline]
 rtnl_newlink+0x13c1/0x2620 net/core/rtnetlink.c:4252
page last free pid 5726 tgid 5722 ts 45751756529 stack trace:
 reset_page_owner include/linux/page_owner.h:26 [inline]
 __free_pages_prepare mm/page_alloc.c:1403 [inline]
 __free_frozen_pages+0x7b4/0x1110 mm/page_alloc.c:2954
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x47/0xf0 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x1a0/0x1f0 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x69/0x90 mm/kasan/common.c:361
 kasan_slab_alloc include/linux/kasan.h:253 [inline]
 slab_post_alloc_hook mm/slub.c:4720 [inline]
 slab_alloc_node mm/slub.c:5033 [inline]
 kmem_cache_alloc_lru_noprof+0x265/0x6a0 mm/slub.c:5066
 __d_alloc+0x34/0xad0 fs/dcache.c:1945
 __d_alloc_parallel+0x105/0x15e0 fs/dcache.c:2879
 lookup_open+0x6c4/0x19e0 fs/namei.c:4479
 open_last_lookups fs/namei.c:4774 [inline]
 path_openat+0xe75/0x23f0 fs/namei.c:5013
 do_file_open+0x20e/0x430 fs/namei.c:5045
 do_sys_openat2+0x163/0x1d0 fs/open.c:1442
 do_sys_open fs/open.c:1448 [inline]
 __do_sys_openat fs/open.c:1464 [inline]
 __se_sys_openat fs/open.c:1459 [inline]
 __x64_sys_openat+0x12d/0x210 fs/open.c:1459
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffff88802fb2d100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88802fb2d180: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff88802fb2d200: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                     ^
 ffff88802fb2d280: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88802fb2d300: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


Tested on:

commit:         cbbddb6b Merge tag 'power-utilities-2026.10.31' of git..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=176eed29580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=245a52f53bb4b06b
dashboard link: https://syzkaller.appspot.com/bug?extid=39a2135de1558208d3b3
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Note: no patches were applied.
