Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794740304;
	b=1/Josn7NaoRdEUMwGeSM+OPjMwNLKbfN/037o5jhHxw4XDrTlDdcv1flIR9DbD3jPi4C
	 EAC6RTzVg9Pk4d/oU1hDZBYgQ4w0qIcT3LtooM2X+2xtZmDLuQ0eNUHIyYd6G/gJLnQeQ
	 EOMqLAOV8wrD29gd1kly7Is/SsJLcknzHfcSLWaK+1A6Q85BiZVWNMc2cdgK3yltKLKi2
	 I5hBminRQT+mEuMggAukI4xKiLMFOTKygzTKFL8QT58Hgk4Bz0Ymdd75QfqBTPmgTYtGc
	 HpmGCngYiOk9mHVwsCCSBMZTo3ZYTgOm8mLf3hxfpl64dPDMVtop8e0YYGrkbNr3GRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794740304;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=gEBlYkFcdJCim3zj5oQSNe5WnMDFK3Q1GA0+OH1Yxbw=;
	b=pNUfHwjhk6uj/JmImMzp8VVgjXEH9qXRpq2tvfVrllO4nyHcHC/UZqw++fh0Gp7XxFM9
	 5Tc1PIgK1/Jb/I9kznbqXwiQWk6fCxWKeYkd8KLukmRdj/jJnsYgcTDC9Z4dyiiwJpYEV
	 8lW8jlgE1LSR+ocNHzQkMXAs+p1h3Wng64Bv2z4HX4LOou832iOvUtvCgBXKniINMb1U8
	 NRwfPCg/8llSOMEiVfbTwGr5hkXennCb8smomqOoa1IpDGNFlw0dNX3ONZqnlidNbN1Jc
	 9aq/JQzDnZNICVAr9KO4eSqkOAU4JURjoDJYlCBFbYzoJ/+QLGkac9NVSQ1r4tqLMwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55559606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 10:58:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55559606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4f8281066c4so3333454b6e.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 02:58:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794740303; x=1795345103;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gEBlYkFcdJCim3zj5oQSNe5WnMDFK3Q1GA0+OH1Yxbw=;
        b=hcZXaZrLt5ga0PA+Tfxez+FPuvqOMs85oGmkG43NN9E2ztvGe0Tu9qKCHSeH2JOWPz
         t8yG9DlDTE0UkM3SaUPPE+z/tqFFK/3rqLI58C/Zyrb21SbzaIX8QswHUq6kDYvbpodZ
         G6EO4BBQTHVn/9xpxceLQIUr3nB9/bxh4hd4QiTx31t1sUgw8oP8QyQCMJ5pZuUCbUA7
         mnHX8646P44CJED0yU8/5Dz0qYoV+cmV6V02UxJsljCF2LKu2iFPWx8CYTWlGSkcFI4u
         nJCZkd+VbigzaGckVGrLwrT4IR1Jb965VNACRxBDV3APyhCL9eXOZlZubT+D6KlpVfjP
         YCgA==
X-Forwarded-Encrypted: i=1; AL+hErHJ1glO9Mf405Fv6tZ1gOAf35be3sRXAYgzA4FeminoJ08Xja6hiXQZbe3kyppX5td2DD4/pVbbc0X6RXM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+YH+MM0EU60wJmetVLz5ZWSKJ4JWbjUfZ0nM1IeNHfbmEs7rHn
	Qu1MJfdQXmwUpVprTR+Zm78ZnFqz5Xg7+7gYWln48tI70Xuu4duEcbmKoJdiUIKIN0VJrpLB1BN
	dzHKBcwpY1kkkbzXHnadBlFVjdxjb0CZ5qgMR95v7B6ztjvQMhOnlnL2JCvM=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:11cb:b0:4bc:fbd4:2a43 with SMTP id
 5614622812f47-56e643d2026mr6364635b6e.41.1794740303299; Sun, 15 Nov 2026
 02:58:23 -0800 (PST)
Date: Sun, 15 Nov 2026 02:58:23 -0800
In-Reply-To: <6ac5b02e.fe639fcc.32b100.000f.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af9904f.84fe3b82.798c4.0000.GAE@google.com>
Subject: Re: [syzbot] [bluetooth?] KASAN: slab-use-after-free Read in mesh_send_sync
From: syzbot <syzbot+f20755f37da70df33a16@syzkaller.appspotmail.com>
To: hdanton@sina.com, igorpetindev@gmail.com, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, luiz.dentz@gmail.com, marcel@holtmann.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    23c62304dde2 Merge tag 'for-linus-7.4a-rc3-tag' of git://g..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=17227da1580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5c210800cfc8f61e
dashboard link: https://syzkaller.appspot.com/bug?extid=f20755f37da70df33a16
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
userspace arch: i386
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13ceb769580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+f20755f37da70df33a16@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in mesh_send_sync+0x3d9/0x430 net/bluetooth/mgmt.c:2343
Read of size 1 at addr ffff88804f72623b by task kworker/u34:0/67

CPU: 3 UID: 0 PID: 67 Comm: kworker/u34:0 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Workqueue: hci0 hci_cmd_sync_work
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x13d/0x4b0 mm/kasan/report.c:482
 kasan_report+0xdf/0x1c0 mm/kasan/report.c:595
 mesh_send_sync+0x3d9/0x430 net/bluetooth/mgmt.c:2343
 hci_cmd_sync_work+0x1b6/0x4c0 net/bluetooth/hci_sync.c:338
 process_one_work+0xac7/0x1b10 kernel/workqueue.c:3495
 process_scheduled_works kernel/workqueue.c:3578 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3659
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Allocated by task 6696:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:409 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:426
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __kmalloc_cache_noprof+0x2f8/0x6d0 mm/slub.c:5680
 _kmalloc_noprof include/linux/slab.h:991 [inline]
 _kzalloc_noprof include/linux/slab.h:1312 [inline]
 mgmt_mesh_add+0x54/0x410 net/bluetooth/mgmt_util.c:413
 mesh_send+0x2b4/0x770 net/bluetooth/mgmt.c:2536
 hci_mgmt_cmd net/bluetooth/hci_sock.c:1739 [inline]
 hci_sock_sendmsg+0x159f/0x26f0 net/bluetooth/hci_sock.c:1859
 sock_sendmsg_nosec net/socket.c:800 [inline]
 __sock_sendmsg net/socket.c:818 [inline]
 __sys_sendto+0x492/0x4e0 net/socket.c:2283
 __do_sys_sendto net/socket.c:2290 [inline]
 __se_sys_sendto net/socket.c:2286 [inline]
 __ia32_sys_sendto+0xdd/0x1b0 net/socket.c:2286
 do_syscall_32_irqs_on arch/x86/entry/syscall_32.c:79 [inline]
 __do_fast_syscall_32+0x14d/0x8e0 arch/x86/entry/syscall_32.c:286
 do_fast_syscall_32+0x32/0x70 arch/x86/entry/syscall_32.c:311
 entry_SYSENTER_compat_after_hwframe+0x84/0x8e

Freed by task 67:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 kasan_save_free_info+0x3b/0x70 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:264 [inline]
 __kasan_slab_free+0x5f/0x80 mm/kasan/common.c:296
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2780 [inline]
 slab_free mm/slub.c:6630 [inline]
 kfree+0x22b/0x6d0 mm/slub.c:6923
 mesh_send_complete net/bluetooth/mgmt.c:1095 [inline]
 mesh_send_start_complete+0x1a1/0x210 net/bluetooth/mgmt.c:2319
 hci_cmd_sync_work+0x20a/0x4c0 net/bluetooth/hci_sync.c:340
 process_one_work+0xac7/0x1b10 kernel/workqueue.c:3495
 process_scheduled_works kernel/workqueue.c:3578 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3659
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

The buggy address belongs to the object at ffff88804f726200
 which belongs to the cache kmalloc-96 of size 96
The buggy address is located 59 bytes inside of
 freed 96-byte region [ffff88804f726200, ffff88804f726260)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffff88804f726c80 pfn:0x4f726
flags: 0x4fff00000000200(workingset|node=1|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 04fff00000000200 ffff88801d442280 ffffea000114bb10 ffffea000105ef90
raw: ffff88804f726c80 000000000020001e 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0xd2cc0(GFP_KERNEL|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 37, tgid 37 (kworker/u33:0), ts 11020237037
 set_page_owner include/linux/page_owner.h:33 [inline]
 post_alloc_hook+0xfd/0x120 mm/page_alloc.c:1860
 prep_new_page mm/page_alloc.c:1868 [inline]
 get_page_from_freelist+0xdae/0x2c80 mm/page_alloc.c:3950
 __alloc_frozen_pages_noprof+0x2ad/0x31e0 mm/page_alloc.c:5492
 alloc_slab_page mm/slub.c:3384 [inline]
 allocate_slab mm/slub.c:3499 [inline]
 new_slab+0xb1/0x6d0 mm/slub.c:3550
 refill_objects+0xe3/0x410 mm/slub.c:7539
 refill_sheaf mm/slub.c:2917 [inline]
 __pcs_replace_empty_main+0x35e/0x650 mm/slub.c:4811
 alloc_from_pcs mm/slub.c:4887 [inline]
 slab_alloc_node mm/slub.c:5021 [inline]
 __kmalloc_cache_node_noprof+0x517/0x710 mm/slub.c:5695
 _kmalloc_node_noprof include/linux/slab.h:1196 [inline]
 __get_vm_area_node+0x124/0x350 mm/vmalloc.c:3270
 __vmalloc_node_range_noprof+0x2ad/0x1440 mm/vmalloc.c:4112
 __vmalloc_node_noprof+0xad/0xf0 mm/vmalloc.c:4213
 alloc_thread_stack_node kernel/fork.c:359 [inline]
 dup_task_struct kernel/fork.c:931 [inline]
 copy_process+0x80b/0x88e0 kernel/fork.c:2150
 kernel_clone+0x176/0x9d0 kernel/fork.c:2798
 user_mode_thread+0xd1/0x120 kernel/fork.c:2875
 call_usermodehelper_exec_work kernel/umh.c:169 [inline]
 call_usermodehelper_exec_work+0xcb/0x180 kernel/umh.c:155
 process_one_work+0xac7/0x1b10 kernel/workqueue.c:3495
 process_scheduled_works kernel/workqueue.c:3578 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3659
page last free pid 37 tgid 37 ts 11020040140 stack trace:
 reset_page_owner include/linux/page_owner.h:26 [inline]
 __free_pages_prepare mm/page_alloc.c:1402 [inline]
 __free_frozen_pages+0x7b1/0x10f0 mm/page_alloc.c:2958
 ___free_pages_bulk mm/kasan/shadow.c:333 [inline]
 __kasan_populate_vmalloc_do mm/kasan/shadow.c:385 [inline]
 __kasan_populate_vmalloc+0x164/0x210 mm/kasan/shadow.c:424
 kasan_populate_vmalloc include/linux/kasan.h:580 [inline]
 alloc_vmap_area+0x963/0x2bc0 mm/vmalloc.c:2151
 __get_vm_area_node+0x1ed/0x350 mm/vmalloc.c:3281
 __vmalloc_node_range_noprof+0x2ad/0x1440 mm/vmalloc.c:4112
 __vmalloc_node_noprof+0xad/0xf0 mm/vmalloc.c:4213
 alloc_thread_stack_node kernel/fork.c:359 [inline]
 dup_task_struct kernel/fork.c:931 [inline]
 copy_process+0x80b/0x88e0 kernel/fork.c:2150
 kernel_clone+0x176/0x9d0 kernel/fork.c:2798
 user_mode_thread+0xd1/0x120 kernel/fork.c:2875
 call_usermodehelper_exec_work kernel/umh.c:169 [inline]
 call_usermodehelper_exec_work+0xcb/0x180 kernel/umh.c:155
 process_one_work+0xac7/0x1b10 kernel/workqueue.c:3495
 process_scheduled_works kernel/workqueue.c:3578 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3659
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Memory state around the buggy address:
 ffff88804f726100: 00 00 00 00 00 00 00 00 00 fc fc fc fc fc fc fc
 ffff88804f726180: 00 00 00 00 00 00 00 00 00 fc fc fc fc fc fc fc
>ffff88804f726200: fa fb fb fb fb fb fb fb fb fb fb fb fc fc fc fc
                                        ^
 ffff88804f726280: 00 00 00 00 00 00 00 00 00 fc fc fc fc fc fc fc
 ffff88804f726300: 00 00 00 00 00 00 00 00 00 fc fc fc fc fc fc fc
==================================================================
