Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFD437DAA3
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 07:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790839125; cv=none; b=iHW3Jimq2hRMhPUMwCYAH4xdguIfcLQrARnZiUVVmtoKwfMswndR4jzN05fhMOY/DtcLXoOe1/1E8TEAx9s/gebks9WOW4vjgmd6KJnmuS8469uDRvkVmgGSW9W48xE89AD9cXtOoikbM41ZIwLWzWi5rOXexlu9EpmOkye1F3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790839125; c=relaxed/simple;
	bh=H5QqzO340Mgc1wxZ90zMB6SaYLaXTP9IfgD6kxUa5bE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=lilRC//YoHrT5Nj6+9K+aJ0Fpx9Qi2P7AY4mhu2a9DAUkFOTbHF4NBxuchVA3ZGY0X3vuNCJFSiacBp1z568A2NEVE47GYX+FwGo7a9J+Wo2uKWTM8baoxouXrbkTqBUXet/RTsAwMg/YsIdEUJWRLTgQN2A1Q8FzqSDlGqM7Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4f4612a1a5cso99947b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 00:18:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790839120; x=1791443920;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=H1NeBZs/BiIvSB3dUF6FDhWNaXOlWaehl+IwOREtHm8=;
        b=HQAswu2/PVX016jSDvfHKoSC/2Qyt08pbpfg8VrmKLdkQNugE/Su+KceEPvTaTtE1O
         aGiwE4me8m0ywaN+S81B41gRRS3KpjKM0VG8R79uX5UYoHMHbhDuUvFjQ0DhViu/hNFB
         ZyZDg1uIvrcrOW/zRxp10D9Y04ogzAIJykblNnQkpj1jDSZJxerOg4qqMZkxIKPtlZ6f
         hRmKFhK0DPsm6oOGJE0cM5zgjwqVyYc3lcIxC+/Gdg+nj3msL6NOi+h1T4N1g67fQZgN
         wfxc4PV5wC0nccuxBf/JRThYlSMt1SzIGhFrwRyqIE3a8ossavz68l+a6jdwz5RMuNnV
         Cbow==
X-Forwarded-Encrypted: i=1; AKwUvByWXJeP9Y07HE8kjrP22RxMf/ifiht36ZKouhZjmFGTXNRtsDX305v3DJnOdtR+K1IAkUY0GmDAXIylVYE=@vger.kernel.org
X-Gm-Message-State: AFuF++nkLa6RK3pK5StI7Jz+G5t4Mq5Lo5dvmaxpXkx3K+l63KMBJfqa
	T2xbhXmu6YKuiRBDGS8V6AsK3LUIJkvvzIIhWxpLANVnhY2mBlaZU0eVQ10mXpTqTBtrZnRTAVq
	euDSlbzFCgjQrIVMSQhDGvJSV7BTMNhbkAbweCh7/DjlbZghwRtty6k0zpgI=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:6403:b0:4d6:9133:cfe4 with SMTP id
 5614622812f47-4f30baf2638mr2331816b6e.41.1790839120106; Thu, 01 Oct 2026
 00:18:40 -0700 (PDT)
Date: Thu, 01 Oct 2026 00:18:40 -0700
In-Reply-To: <6a6e98c8.6ce73036.24301b.001a.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6abe0950.9b478af7.e8d7a.0001.GAE@google.com>
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Read in uvcg_extension_drop
From: syzbot <syzbot+f093afc4e90b1908abdc@syzkaller.appspotmail.com>
To: bolewara@gmail.com, devnull@kernel.org, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    551c722f4080 Merge tag 'rtc-7.3-fixes' of git://git.kernel..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=163d6b15580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7d012d9c67977ee4
dashboard link: https://syzkaller.appspot.com/bug?extid=f093afc4e90b1908abdc
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17d333f5580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+f093afc4e90b1908abdc@syzkaller.appspotmail.com

R10: 0000000000000000 R11: 0000000000000202 R12: 00007ffddb96a9a8
R13: 0000000000000002 R14: 00007f778c218cc0 R15: 0000000000000002
 </TASK>
==================================================================
BUG: KASAN: slab-use-after-free in __list_del_entry_valid_or_report+0x18a/0x1d0 lib/list_debug.c:49
Read of size 8 at addr ffff88802274e158 by task syz-executor227/5999

CPU: 3 UID: 0 PID: 5999 Comm: syz-executor227 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x13d/0x4b0 mm/kasan/report.c:482
 kasan_report+0xdf/0x1c0 mm/kasan/report.c:595
 __list_del_entry_valid_or_report+0x18a/0x1d0 lib/list_debug.c:49
 __list_del_entry_valid include/linux/list.h:140 [inline]
 __list_del_entry include/linux/list.h:261 [inline]
 list_del include/linux/list.h:275 [inline]
 uvcg_extension_drop+0x88/0x290 drivers/usb/gadget/function/uvc_configfs.c:1260
 client_drop_item+0xa6/0x100 fs/configfs/dir.c:979
 configfs_mkdir+0x70b/0xd40 fs/configfs/dir.c:1452
 vfs_mkdir+0x364/0x850 fs/namei.c:5410
 filename_mkdirat+0x48b/0x5e0 fs/namei.c:5443
 __do_sys_mkdir fs/namei.c:5470 [inline]
 __se_sys_mkdir fs/namei.c:5467 [inline]
 __x64_sys_mkdir+0x6b/0x90 fs/namei.c:5467
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f778c194d07
Code: 77 01 c3 48 c7 c2 d8 ff ff ff f7 d8 64 89 02 48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 b8 53 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 01 c3 48 c7 c2 d8 ff ff ff f7 d8 64 89 02 b8
RSP: 002b:00007ffddb96a878 EFLAGS: 00000202 ORIG_RAX: 0000000000000053
RAX: ffffffffffffffda RBX: 0000000000002710 RCX: 00007f778c194d07
RDX: 0000000000000000 RSI: 00000000000001ff RDI: 00007f778c1f0488
RBP: 00007f778c1f0488 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000202 R12: 00007ffddb96a9a8
R13: 0000000000000002 R14: 00007f778c218cc0 R15: 0000000000000002
 </TASK>

Allocated by task 5999:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:409 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:426
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __kmalloc_cache_noprof+0x2f8/0x6d0 mm/slub.c:5563
 _kmalloc_noprof include/linux/slab.h:991 [inline]
 _kzalloc_noprof include/linux/slab.h:1312 [inline]
 uvcg_extension_make+0x98/0x4e0 drivers/usb/gadget/function/uvc_configfs.c:1276
 configfs_mkdir+0x7ef/0xd40 fs/configfs/dir.c:1378
 vfs_mkdir+0x364/0x850 fs/namei.c:5410
 filename_mkdirat+0x48b/0x5e0 fs/namei.c:5443
 __do_sys_mkdir fs/namei.c:5470 [inline]
 __se_sys_mkdir fs/namei.c:5467 [inline]
 __x64_sys_mkdir+0x6b/0x90 fs/namei.c:5467
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 5999:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 kasan_save_free_info+0x3b/0x70 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:264 [inline]
 __kasan_slab_free+0x5f/0x80 mm/kasan/common.c:296
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2748 [inline]
 slab_free mm/slub.c:6508 [inline]
 kfree+0x22b/0x6d0 mm/slub.c:6801
 config_item_cleanup+0x146/0x240 fs/configfs/item.c:128
 config_item_release fs/configfs/item.c:137 [inline]
 kref_put include/linux/kref.h:65 [inline]
 config_item_put fs/configfs/item.c:149 [inline]
 config_item_put+0x93/0xb0 fs/configfs/item.c:146
 uvcg_extension_drop+0x80/0x290 drivers/usb/gadget/function/uvc_configfs.c:1259
 client_drop_item+0xa6/0x100 fs/configfs/dir.c:979
 configfs_mkdir+0x70b/0xd40 fs/configfs/dir.c:1452
 vfs_mkdir+0x364/0x850 fs/namei.c:5410
 filename_mkdirat+0x48b/0x5e0 fs/namei.c:5443
 __do_sys_mkdir fs/namei.c:5470 [inline]
 __se_sys_mkdir fs/namei.c:5467 [inline]
 __x64_sys_mkdir+0x6b/0x90 fs/namei.c:5467
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff88802274e100
 which belongs to the cache kmalloc-192 of size 192
The buggy address is located 88 bytes inside of
 freed 192-byte region [ffff88802274e100, ffff88802274e1c0)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x2274e
flags: 0xfff00000000000(node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000000 ffff88801c0423c0 dead000000000100 dead000000000122
raw: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0xd2cc0(GFP_KERNEL|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 1, tgid 1 (swapper/0), ts 8964019714
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
 __usb_create_hcd+0x7b6/0xac0 drivers/usb/core/hcd.c:2577
 dummy_hcd_probe+0x130/0x2fa drivers/usb/gadget/udc/dummy_hcd.c:2717
 platform_probe+0x106/0x1d0 drivers/base/platform.c:1507
 call_driver_probe drivers/base/dd.c:628 [inline]
 really_probe+0x241/0xa60 drivers/base/dd.c:706
 __driver_probe_device+0x210/0x460 drivers/base/dd.c:868
 driver_probe_device+0x4a/0x140 drivers/base/dd.c:898
 __device_attach_driver+0x1df/0x320 drivers/base/dd.c:1026
 bus_for_each_drv+0x159/0x1e0 drivers/base/bus.c:500
 __device_attach+0x1e4/0x4d0 drivers/base/dd.c:1098
page_owner free stack trace missing

Memory state around the buggy address:
 ffff88802274e000: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88802274e080: fb fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
>ffff88802274e100: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                                    ^
 ffff88802274e180: fb fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
 ffff88802274e200: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
