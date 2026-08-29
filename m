Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE71239085
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 13:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788008825; cv=none; b=TWJY0uU3Q15S5HBWbX44fD4eeOvgPoJra+v+O0LFml66rLdWr2LmAWEtl9J0f7Pt2PtGmYk4j7X6xK6wuvPKN70cHnOBhL2rahwPANMJEG02pgn2qR/+zHg1YAp6JPHonlEWa5AAEniwoamppa2IoWFoMGMazknN09JSK2kI4Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788008825; c=relaxed/simple;
	bh=WZzRV+4eFnFrgo+CpezEfG9DZ1PJ4KS1k8ycz+NI6MA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=S38Le/kxRt5Vky/0L12iWGEZ06Y8r0SZLSCDXjG5Ba067qjX8E850O0ISAlx40RncDkYJDcQCZkKSYLPrU3SJ/oazSSzR0k8u0G2YRnts0ALypv43yzvIY4E0DqKG6TYtk/OIooSL2tNwhIJ+rPcCLH8UpSx4UT743606i0OpHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4a49f09233dso1523501b6e.2
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 06:07:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788008822; x=1788613622;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HNHZ3SvBtYETtn3B365vTnxavkM0YUNpdDaAnqTFNhI=;
        b=oPHf29BanbmBDIKgcNHkx9sf/1Rwj07LEAsc18/4ktHxRWKuCfeeCmcTTZVZRbiVCZ
         GNR7+ljyb1mg5TE3TPZD4y3tCkuD/JL7jy8EAGt8EeK7hEjQWFWMQ85CRUVHnHJeTPPl
         jcmrevpgE4tm342y6JtPzSIfFtoOH+W5Wu4yOxaIo7/xfKotAKXU3ILbzBGa8D8BWTnF
         pD0tyRcem8nxBJNWdix1Ybq7EMMakEQ9jYIk5sGZV+GyZbrtAfd92GyCffVDpSv6tAgj
         0m4mRDEtAFU5zw2EVJSWyWGj14FKqFCNXtp+Ow/Bix3Mv7btiCpcfI3XAwCdy5nASGu9
         /HYg==
X-Forwarded-Encrypted: i=1; AHgh+RqEY14Ql+oeprRICTlDBktLgVrK1LWdig96V5GRtjU32Gav583v2Lo3he7VqA8HiZ3swkWJxcUJ2+801Aw=@vger.kernel.org
X-Gm-Message-State: AFuF++lcHgXoBHaRu+T9zsD2XypSJcqNbFKQJXXJuHxd9kQq166ZEuGb
	j+NO26V6MZyEf5c58XJrA/aBIvQMR//rvw2HJpcw371vKDTEMGw8DZQ6Tj3ZsTu7f5vggJUjLhY
	aQ4ENMT4RY8oEDNHNtmInBIV37PGMORsST+d0rDLWfe85fXEBxDGB2MsIje0=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:5091:b0:4b2:8d89:69d4 with SMTP id
 5614622812f47-4b39823886fmr15849213b6e.13.1788008822149; Sat, 29 Aug 2026
 06:07:02 -0700 (PDT)
Date: Sat, 29 Aug 2026 06:07:02 -0700
In-Reply-To: <20260829123357.12294-1-lingrain580@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a92d976.1d9ded08.62e62.010a.GAE@google.com>
Subject: Re: [syzbot] [serial?] KASAN: slab-use-after-free Write in release_tty
From: syzbot <syzbot+bca09f5d8b843bbf7571@syzkaller.appspotmail.com>
To: lingrain580@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
KASAN: slab-use-after-free Read in gs_close

==================================================================
BUG: KASAN: slab-use-afte
BUG: KASAN: slab-use-after-free in rt_spin_lock+0x83/0x400 kernel/locking/spinlock_rt.c:56
Read of size 1 at addr ffff88802b80f488 by task syz-executor250/7350

CPU: 1 UID: 0 PID: 7350 Comm: syz-executor250 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description+0x55/0x1e0 mm/kasan/report.c:378
 print_report+0x58/0x70 mm/kasan/report.c:482
 kasan_report+0x117/0x150 mm/kasan/report.c:595
 __kasan_check_byte+0x2a/0x40 mm/kasan/common.c:574
 kasan_check_byte include/linux/kasan.h:402 [inline]
 lock_acquire+0x7d/0x350 kernel/locking/lockdep.c:5882
 rt_spin_lock+0x83/0x400 kernel/locking/spinlock_rt.c:56
 spin_lock_irq include/linux/spinlock_rt.h:96 [inline]
 gs_close+0xb9/0xbb0 drivers/usb/gadget/function/u_serial.c:698
 tty_release+0x35f/0x1680 drivers/tty/tty_io.c:1718
 __fput+0x42a/0xa80 fs/file_table.c:512
 fput_close_sync+0x11f/0x240 fs/file_table.c:617
 __do_sys_close fs/open.c:1560 [inline]
 __se_sys_close fs/open.c:1545 [inline]
 __x64_sys_close+0x7e/0x110 fs/open.c:1545
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f0fb9530c0e
Code: 08 0f 85 65 e1 ff ff 49 89 fb 48 89 f0 48 89 d7 48 89 ce 4c 89 c2 4d 89 ca 4c 8b 44 24 08 4c 8b 4c 24 10 4c 89 5c 24 08 0f 05 <c3> 90 41 57 41 56 4d 89 c6 41 55 4d 89 cd 41 54 55 53 48 83 ec 08
RSP: 002b:00007ffec4f19768 EFLAGS: 00000246 ORIG_RAX: 0000000000000003
RAX: ffffffffffffffda RBX: 000055557741e400 RCX: 00007f0fb9530c0e
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000003
RBP: 0000000000000008 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00000000000864ed
R13: 000000000008651f R14: 00007f0fb95cdb2c R15: 00007f0fb95cdb20
 </TASK>

Allocated by task 7351:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __kmalloc_cache_noprof+0x3d5/0x680 mm/slub.c:5563
 _kmalloc_noprof include/linux/slab.h:991 [inline]
 _kzalloc_noprof include/linux/slab.h:1312 [inline]
 gs_port_alloc drivers/usb/gadget/function/u_serial.c:1262 [inline]
 gserial_alloc_line_no_console+0x23a/0x700 drivers/usb/gadget/function/u_serial.c:1342
 gserial_alloc_line+0x18/0x90 drivers/usb/gadget/function/u_serial.c:1376
 acm_alloc_instance+0xc7/0x140 drivers/usb/gadget/function/f_acm.c:891
 try_get_usb_function_instance drivers/usb/gadget/functions.c:28 [inline]
 usb_get_function_instance+0xe3/0x2f0 drivers/usb/gadget/functions.c:44
 function_make+0x127/0x360 drivers/usb/gadget/configfs.c:626
 configfs_mkdir+0x4f6/0x9e0 fs/configfs/dir.c:1360
 vfs_mkdir+0x408/0x620 fs/namei.c:5410
 filename_mkdirat+0x289/0x520 fs/namei.c:5443
 __do_sys_mkdirat fs/namei.c:5464 [inline]
 __se_sys_mkdirat+0x35/0x150 fs/namei.c:5461
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 7351:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 kasan_save_free_info+0x40/0x50 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2748 [inline]
 slab_free mm/slub.c:6499 [inline]
 kfree+0x1c5/0x6d0 mm/slub.c:6792
 gserial_free_port+0x240/0x2c0 drivers/usb/gadget/function/u_serial.c:1306
 gserial_free_line+0xc3/0x1f0 drivers/usb/gadget/function/u_serial.c:1323
 acm_free_instance+0x39/0x60 drivers/usb/gadget/function/f_acm.c:875
 usb_put_function_instance+0x90/0xb0 drivers/usb/gadget/functions.c:77
 config_item_cleanup fs/configfs/item.c:128 [inline]
 config_item_release+0x13a/0x2d0 fs/configfs/item.c:137
 configfs_rmdir+0x885/0x950 fs/configfs/dir.c:1571
 vfs_rmdir+0x3e9/0x6b0 fs/namei.c:5515
 filename_rmdir+0x292/0x520 fs/namei.c:5572
 __do_sys_rmdir fs/namei.c:5595 [inline]
 __se_sys_rmdir+0x2e/0x140 fs/namei.c:5592
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff88802b80f000
 which belongs to the cache kmalloc-2k of size 2048
The buggy address is located 1160 bytes inside of
 freed 2048-byte region [ffff88802b80f000, ffff88802b80f800)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x2b808
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0x80000000000040(head|node=0|zone=1)
page_type: f5(slab)
raw: 0080000000000040 ffff88813ffbb000 dead000000000100 dead000000000122
raw: 0000000000000000 0000000000080008 00000000f5000000 0000000000000000
head: 0080000000000040 ffff88813ffbb000 dead000000000100 dead000000000122
head: 0000000000000000 0000000000080008 00000000f5000000 0000000000000000
head: 0080000000000003 fffffffffffffe01 00000000ffffffff 00000000ffffffff
head: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 507, tgid 507 (kworker/u8:8), ts 39189094710
 set_page_owner include/linux/page_owner.h:33 [inline]
 post_alloc_hook+0x1f9/0x250 mm/page_alloc.c:1871
 prep_new_page mm/page_alloc.c:1879 [inline]
 get_page_from_freelist+0x2591/0x2600 mm/page_alloc.c:3943
 __alloc_frozen_pages_noprof+0x230/0x5c0 mm/page_alloc.c:5436
 alloc_slab_page mm/slub.c:3347 [inline]
 allocate_slab+0x7d/0x620 mm/slub.c:3462
 new_slab mm/slub.c:3513 [inline]
 refill_objects+0x2d8/0x350 mm/slub.c:7410
 refill_sheaf mm/slub.c:2885 [inline]
 __pcs_replace_empty_main+0x339/0x690 mm/slub.c:4774
 alloc_from_pcs mm/slub.c:4850 [inline]
 slab_alloc_node mm/slub.c:4984 [inline]
 __do_kmalloc_node mm/slub.c:5413 [inline]
 __kmalloc_noprof+0x54b/0x790 mm/slub.c:5439
 _kmalloc_noprof include/linux/slab.h:995 [inline]
 _kzalloc_noprof include/linux/slab.h:1312 [inline]
 scsi_alloc_target+0x138/0xbc0 drivers/scsi/scsi_scan.c:505
 __scsi_scan_target+0x164/0xe10 drivers/scsi/scsi_scan.c:1780
 scsi_scan_channel drivers/scsi/scsi_scan.c:1885 [inline]
 scsi_scan_host_selected+0x36e/0x680 drivers/scsi/scsi_scan.c:1914
 do_scsi_scan_host drivers/scsi/scsi_scan.c:2047 [inline]
 do_scan_async+0x10e/0x660 drivers/scsi/scsi_scan.c:2057
 async_run_entry_fn+0x9d/0x430 kernel/async.c:129
 process_one_work kernel/workqueue.c:3387 [inline]
 process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3470
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3551
 kthread+0x38b/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
page_owner free stack trace missing

Memory state around the buggy address:
 ffff88802b80f380: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88802b80f400: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff88802b80f480: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                      ^
 ffff88802b80f500: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88802b80f580: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


Tested on:

commit:         cf72cbb3 Merge tag 'io_uring-7.3-20260828' of git://gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=168a1d79580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e618aabdc2dca7e6
dashboard link: https://syzkaller.appspot.com/bug?extid=bca09f5d8b843bbf7571
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1330ae25580000

