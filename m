Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC0A175A95
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 21:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788987785; cv=none; b=ZcnvPKV+pmV1qnCLTBM9gaadsg+J7d68wKXtY8h6sKF6PbGvQpQMtLUSpnVs3zaaISw0iqJi56wRWzhJS6DgjfTZuhJEK9pzKPPJT/G74f+sUgRo37jLLcMQ7L+hUZSGPEzQw43ktd8gvCCTrQ/kTcsapJS9Q/Y75cR+KSqgR9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788987785; c=relaxed/simple;
	bh=8Dqi+S5s+S6r7pWHDxbcdqh44mnZFoWbJIVG700S1Uo=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=AonM4N7LCZkkUcp+uXrnkj4cV0Hj0qKyv1yNSdm19QUSx/CXDbelZZ3D/2NwF8ESxpMh2BvNuWyGfu+nzi6dG1AvzJ0lhx8HVR6g2KjYDdxch/HYntMtmNqRuU9NBBCVlFUGxVm9V9ikCOcHVdgDSYsNHRyjEfW/PqRK2n6Gf5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6b1b6df25efso6700398eaf.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 14:03:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788987782; x=1789592582;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=R4uFlmPis4I2/CDsco/uKwVMubwS7kUjh40D1BNZ658=;
        b=THXgp2+UHKdilTodaHbsaYveubRO8rAmAKmWi8BmwVBL7heDy/RMLlXUYOKH2Gffu0
         JPhqwZdP1fhZ64zMB+4qZwK2lghp1aDzWhcvaMblzKVbJ3ZPS9aBxH4ZQrfmrgGOfyoU
         vODPN9Dfz/KOL/MeGQE/+cgn0k0EQB0hvkKMLyZa169ycTs6l0nJI7ydLXp9vVCU2gtw
         0P5YaxpXxdn02ARg3R6z+IVElUjAFhR4OeN6RjlDggqamGAw4JQAYJFMTIpLSGypuV1Z
         u80FMDSCLxyQHa1yj1ER8Kop90rvSo7L/6+ypi9hFf7jg0Qfk4Oqpr4XCrn3qcRSDCOO
         1FWw==
X-Forwarded-Encrypted: i=1; AKwUvBzfYX18nN+DR6eC+14ZQGzw69/nCC7U6Oe+nzG7rI2eTWbul8fZh/dZvjxvzAdzFSoYZ46naoZVsL2H6Fs=@vger.kernel.org
X-Gm-Message-State: AFuF++m/ImsMLWWmzwvhKj54TeVCh8k1W73oAJEsBHmSAac7AKGLsA8s
	OlpYh7HMUveof2FGeazSiYJPQDnFmhMLQ1Gh0cCC7L0zkLT0METoFDZGOs6VM+txjIGwx7yR5Fq
	m269Ag2G+91fEgngUIyt6zDIDW5prOgRNBEeXAAC0tvNxA1o7WXK5emBVifo=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1613:b0:6b1:a8b3:3b43 with SMTP id
 006d021491bc7-6b6fd7d71c3mr21413292eaf.24.1788987781967; Wed, 09 Sep 2026
 14:03:01 -0700 (PDT)
Date: Wed, 09 Sep 2026 14:03:01 -0700
In-Reply-To: <20260909202914.275119-1-user@adriano>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa1c985.f81106d8.2ab401.0000.GAE@google.com>
Subject: Re: [syzbot] [serial?] KASAN: slab-use-after-free Write in release_tty
From: syzbot <syzbot+bca09f5d8b843bbf7571@syzkaller.appspotmail.com>
To: adrianox@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
KASAN: slab-use-after-free Read in gs_close

==================================================================
BUG: KASAN: slab-use-after-free in rt_spin_lock+0x83/0x40 kernel/locking/spinlock_rt.c:56
BUG: KASAN: slab-use-after-free in rt_spin_lock+0x83/0x400 kernel/locking/spinlock_rt.c:56
Read of size 1 at addr ffff88802b714488 by task syz-executor158/7333

CPU: 1 UID: 0 PID: 7333 Comm: syz-executor158 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description+0x55/0x1e0 mm/kasan/report.c:378
 print_report+0x58/0x70 mm/kasan/report.c:482
 kasan_report+0x117/0x150 mm/kasan/report.c:595
 __kasan_check_byte+0x2a/0x40 mm/kasan/common.c:574
 kasan_check_byte include/linux/kasan.h:402 [inline]
 lock_acquire+0x7d/0x350 kernel/locking/lockdep.c:5916
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
RIP: 0033:0x7fccd3f6ec0e
Code: 08 0f 85 65 e1 ff ff 49 89 fb 48 89 f0 48 89 d7 48 89 ce 4c 89 c2 4d 89 ca 4c 8b 44 24 08 4c 8b 4c 24 10 4c 89 5c 24 08 0f 05 <c3> 90 41 57 41 56 4d 89 c6 41 55 4d 89 cd 41 54 55 53 48 83 ec 08
RSP: 002b:00007ffed8338a08 EFLAGS: 00000246 ORIG_RAX: 0000000000000003
RAX: ffffffffffffffda RBX: 000055556cea1400 RCX: 00007fccd3f6ec0e
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000003
RBP: 0000000000000008 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000083a90
R13: 0000000000083ac2 R14: 00007fccd400bb2c R15: 00007fccd400bb20
 </TASK>

Allocated by task 7334:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __kmalloc_cache_noprof+0x3d5/0x680 mm/slub.c:5563
 _kmalloc_noprof include/linux/slab.h:991 [inline]
 _kzalloc_noprof include/linux/slab.h:1312 [inline]
 gs_port_alloc drivers/usb/gadget/function/u_serial.c:1264 [inline]
 gserial_alloc_line_no_console+0x23a/0x700 drivers/usb/gadget/function/u_serial.c:1349
 gserial_alloc_line+0x18/0x90 drivers/usb/gadget/function/u_serial.c:1383
 acm_alloc_instance+0xc7/0x140 drivers/usb/gadget/function/f_acm.c:891
 try_get_usb_function_instance drivers/usb/gadget/functions.c:28 [inline]
 usb_get_function_instance+0xe3/0x2f0 drivers/usb/gadget/functions.c:44
 function_make+0x127/0x360 drivers/usb/gadget/configfs.c:626
 configfs_mkdir+0x4f6/0x9e0 fs/configfs/dir.c:1369
 vfs_mkdir+0x408/0x620 fs/namei.c:5410
 filename_mkdirat+0x289/0x520 fs/namei.c:5443
 __do_sys_mkdirat fs/namei.c:5464 [inline]
 __se_sys_mkdirat+0x35/0x150 fs/namei.c:5461
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 7334:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 kasan_save_free_info+0x40/0x50 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2748 [inline]
 slab_free mm/slub.c:6499 [inline]
 kfree+0x1c5/0x6d0 mm/slub.c:6792
 gserial_free_port+0x240/0x2c0 drivers/usb/gadget/function/u_serial.c:1313
 gserial_free_line+0xc3/0x1f0 drivers/usb/gadget/function/u_serial.c:1330
 acm_free_instance+0x39/0x60 drivers/usb/gadget/function/f_acm.c:875
 usb_put_function_instance+0x95/0xc0 drivers/usb/gadget/functions.c:77
 config_item_cleanup fs/configfs/item.c:128 [inline]
 config_item_release+0x13a/0x2d0 fs/configfs/item.c:137
 configfs_rmdir+0x885/0x950 fs/configfs/dir.c:1580
 vfs_rmdir+0x3e9/0x6b0 fs/namei.c:5515
 filename_rmdir+0x292/0x520 fs/namei.c:5572
 __do_sys_rmdir fs/namei.c:5595 [inline]
 __se_sys_rmdir+0x2e/0x140 fs/namei.c:5592
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff88802b714000
 which belongs to the cache kmalloc-2k of size 2048
The buggy address is located 1160 bytes inside of
 freed 2048-byte region [ffff88802b714000, ffff88802b714800)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x2b710
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0x80000000000040(head|node=0|zone=1)
page_type: f5(slab)
raw: 0080000000000040 ffff88813ff00000 dead000000000100 dead000000000122
raw: 0000000000000000 0000000000080008 00000000f5000000 0000000000000000
head: 0080000000000040 ffff88813ff00000 dead000000000100 dead000000000122
head: 0000000000000000 0000000000080008 00000000f5000000 0000000000000000
head: 0080000000000003 fffffffffffffe01 00000000ffffffff 00000000ffffffff
head: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 1, tgid 1 (swapper/0), ts 22801572255
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
 __kmalloc_cache_noprof+0x46f/0x680 mm/slub.c:5559
 _kmalloc_noprof include/linux/slab.h:991 [inline]
 _kzalloc_noprof include/linux/slab.h:1312 [inline]
 usb_hub_create_port_device+0x7d/0xc40 drivers/usb/core/port.c:759
 hub_configure drivers/usb/core/hub.c:1739 [inline]
 hub_probe+0x26d6/0x3c20 drivers/usb/core/hub.c:2006
 usb_probe_interface+0x788/0xe50 drivers/usb/core/driver.c:399
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x254/0xae0 drivers/base/dd.c:706
 __driver_probe_device+0x1e8/0x360 drivers/base/dd.c:868
 driver_probe_device+0x4f/0x240 drivers/base/dd.c:898
 __device_attach_driver+0x270/0x410 drivers/base/dd.c:1026
 bus_for_each_drv+0x25b/0x2f0 drivers/base/bus.c:500
 __device_attach+0x2c7/0x450 drivers/base/dd.c:1098
page_owner free stack trace missing

Memory state around the buggy address:
 ffff88802b714380: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88802b714400: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff88802b714480: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                      ^
 ffff88802b714500: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88802b714580: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


Tested on:

commit:         50d05c7c Merge tag 'landlock-7.3-rc3' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17722c8e580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e618aabdc2dca7e6
dashboard link: https://syzkaller.appspot.com/bug?extid=bca09f5d8b843bbf7571
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1578aef9580000

