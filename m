Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E40449B11
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789389426; cv=none; b=C+w2qiIgegxR+Pl5gEk4m+0gLAPsQ+xIDTShwCb0Ln1e0f7CN+jrXjTHD6yeExYUNB8PJ1tRIkRTOdl3yOxRfaUDIDcQMVa33siz+ljXK74JUUBq6IXJbNZJZXL+X3W4+VBLnSnsguvkoek9GR8ERA9Mft/8MkbKHKrK3eHSuP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789389426; c=relaxed/simple;
	bh=8JfImYkWMN2z8zY/DFCLfhhHTMkSq3MZm/WUGiZF0CU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=gxPc8NMB3tmA/KwR1NzxuOWwiNnEMLIiL16jYeiW09lHBEApHpcNY/zbtUh2a6Il/2SaWEa4AjFkY+GsXCYXzhvMvafMKqckBKsQhQS0oZAOxsRCGVyvOpdQGX0scv0Nvp8QQAuja8e3xxxU4382/cf0c0JvLmUTbWDZtj9yt54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6c324a0c0faso1784643eaf.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:37:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789389423; x=1789994223;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SSLp5OKYuN7gkXOwQJ1j8JpiEmQ1dS03NKwz82+mzNs=;
        b=rpM6j7bAeUghGPK/0NNgpux6FxuNdt8Y7A0FyL3EHHHtuqIaCQGY0X0gXvETxETVaq
         gbATeSVQDjVdXK7eFqEamcC3/owikH0Oc2TBsr6GO3m2HNnHaAr5AkKYkgzhHX+gPcQQ
         aHQdXP5hH4IjS6FcU4cx3VjCyvbrYMQMALbhZLQLfSjKuGSxqNYGy0qfjt7SqxQodXCx
         9ShLBjXHIOpb6Fa8waAX+tE8TVOfFrL9zWGLreymtxOCLbub18ZIYOTglaaVyGT14Vuj
         iPIoA0PaVat8cfSttfy6VlQf1ZAqbdLw5qfK86XCsFgL7gH6Bv4/3HgX90fGow2CLgv8
         TJwA==
X-Forwarded-Encrypted: i=1; AKwUvBzQejbqxka9iEcUItkJakqCu2LNFZJvPCg1dRwNM4c1M3Wf42iCRnRSXfHYNtoF2ZTJGvttCIfbumq4ick=@vger.kernel.org
X-Gm-Message-State: AFuF++kd/1BuCi49AA14GeW/f7v3Rh5vgH3fUWQFedZFZofBcNVi7/5z
	APKWlUpODjqvJAs6WWQMYu5Z3gpcSeNlyxywoJf7AW/ANqJeYZbWLXeCfOiEkky3gxX+75Vw+B8
	pYhdaqmQeIzU7aJH/1VqKNtTr6JodwbczC1Re10wpPFAovwy0YuNm3MWiRvQ=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1c90:b0:6be:b2e3:27e with SMTP id
 006d021491bc7-6c53fc7ab29mr1026057eaf.16.1789389423031; Mon, 14 Sep 2026
 05:37:03 -0700 (PDT)
Date: Mon, 14 Sep 2026 05:37:03 -0700
In-Reply-To: <6aa7e4d0.62481f88.1223bb.56dcSMTPIN_ADDED_BROKEN@gmr-mx.google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa7ea6f.016ef6ab.da411.0020.GAE@google.com>
Subject: Re: [syzbot] [mmc?] WARNING: ODEBUG bug in vub300_disconnect
From: syzbot <syzbot+f4a0159ce6802a0a4774@syzkaller.appspotmail.com>
To: jchuang26@m.fudan.edu.cn, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
KASAN: slab-use-after-free Read in mmc_host_classdev_release

==================================================================
BUG: KASAN: slab-use-after-free in mmc_host_classdev_release+0xfb/0x120 drivers/mmc/core/host.c:70
Read of size 8 at addr ffff888029c334c8 by task kworker/u32:4/5855

CPU: 2 UID: 0 PID: 5855 Comm: kworker/u32:4 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Workqueue: kvub300d vub300_deadwork_thread
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x13d/0x4b0 mm/kasan/report.c:482
 kasan_report+0xdf/0x1c0 mm/kasan/report.c:595
 mmc_host_classdev_release+0xfb/0x120 drivers/mmc/core/host.c:70
 device_release+0xd2/0x270 drivers/base/core.c:2640
 kobject_cleanup lib/kobject.c:689 [inline]
 kobject_release lib/kobject.c:720 [inline]
 kref_put include/linux/kref.h:65 [inline]
 kobject_put+0x1f7/0x640 lib/kobject.c:737
 put_device+0x1f/0x30 drivers/base/core.c:3884
 vub300_delete drivers/mmc/host/vub300.c:379 [inline]
 kref_put include/linux/kref.h:65 [inline]
 vub300_deadwork_thread+0x22c/0x550 drivers/mmc/host/vub300.c:739
 process_one_work+0xac7/0x1b10 kernel/workqueue.c:3396
 process_scheduled_works kernel/workqueue.c:3479 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3560
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Allocated by task 1026:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __kmalloc_cache_noprof+0x2f8/0x6d0 mm/slub.c:5563
 _kmalloc_noprof include/linux/slab.h:991 [inline]
 _kzalloc_noprof include/linux/slab.h:1312 [inline]
 usb_alloc_dev+0x55/0x1090 drivers/usb/core/usb.c:651
 hub_port_connect drivers/usb/core/hub.c:5483 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5720 [inline]
 port_event drivers/usb/core/hub.c:5884 [inline]
 hub_event+0x2b93/0x4420 drivers/usb/core/hub.c:5966
 process_one_work+0xac7/0x1b10 kernel/workqueue.c:3396
 process_scheduled_works kernel/workqueue.c:3479 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3560
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Freed by task 5855:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 kasan_save_free_info+0x3b/0x70 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5f/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2748 [inline]
 slab_free mm/slub.c:6499 [inline]
 kfree+0x22b/0x6d0 mm/slub.c:6792
 device_release+0xd2/0x270 drivers/base/core.c:2640
 kobject_cleanup lib/kobject.c:689 [inline]
 kobject_release lib/kobject.c:720 [inline]
 kref_put include/linux/kref.h:65 [inline]
 kobject_put+0x1f7/0x640 lib/kobject.c:737
 put_device+0x1f/0x30 drivers/base/core.c:3884
 usb_put_dev+0x23/0x30 drivers/usb/core/usb.c:790
 vub300_delete drivers/mmc/host/vub300.c:378 [inline]
 kref_put include/linux/kref.h:65 [inline]
 vub300_deadwork_thread+0x224/0x550 drivers/mmc/host/vub300.c:739
 process_one_work+0xac7/0x1b10 kernel/workqueue.c:3396
 process_scheduled_works kernel/workqueue.c:3479 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3560
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

The buggy address belongs to the object at ffff888029c33000
 which belongs to the cache kmalloc-2k of size 2048
The buggy address is located 1224 bytes inside of
 freed 2048-byte region [ffff888029c33000, ffff888029c33800)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffff888029c31000 pfn:0x29c30
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000240(workingset|head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000240 ffff88801c042f00 ffffea0000965a10 ffffea0000854a10
raw: ffff888029c31000 0000000000080006 00000000f5000000 0000000000000000
head: 00fff00000000240 ffff88801c042f00 ffffea0000965a10 ffffea0000854a10
head: ffff888029c31000 0000000000080006 00000000f5000000 0000000000000000
head: 00fff00000000003 fffffffffffffe01 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5136, tgid 5136 (klogd), ts 52095697133
 set_page_owner include/linux/page_owner.h:33 [inline]
 post_alloc_hook+0xfd/0x120 mm/page_alloc.c:1871
 prep_new_page mm/page_alloc.c:1879 [inline]
 get_page_from_freelist+0x110d/0x35d0 mm/page_alloc.c:3943
 __alloc_frozen_pages_noprof+0x2eb/0x3300 mm/page_alloc.c:5436
 alloc_slab_page mm/slub.c:3347 [inline]
 allocate_slab mm/slub.c:3462 [inline]
 new_slab+0xa9/0x6e0 mm/slub.c:3513
 refill_objects+0xe3/0x410 mm/slub.c:7410
 refill_sheaf mm/slub.c:2885 [inline]
 __pcs_replace_empty_main+0x35e/0x650 mm/slub.c:4774
 alloc_from_pcs mm/slub.c:4850 [inline]
 slab_alloc_node mm/slub.c:4984 [inline]
 __kmalloc_cache_noprof+0x4f4/0x6d0 mm/slub.c:5559
 _kmalloc_noprof include/linux/slab.h:991 [inline]
 syslog_print+0xf8/0x620 kernel/printk/printk.c:1585
 do_syslog+0x5bd/0x6d0 kernel/printk/printk.c:1763
 __do_sys_syslog kernel/printk/printk.c:1855 [inline]
 __se_sys_syslog kernel/printk/printk.c:1853 [inline]
 __x64_sys_syslog+0x74/0xb0 kernel/printk/printk.c:1853
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x121/0x770 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
page last free pid 5737 tgid 5737 ts 44841793649 stack trace:
 reset_page_owner include/linux/page_owner.h:26 [inline]
 __free_pages_prepare mm/page_alloc.c:1418 [inline]
 __free_frozen_pages+0x79f/0x10f0 mm/page_alloc.c:2962
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x47/0xf0 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x1a0/0x1f0 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x69/0x90 mm/kasan/common.c:350
 kasan_slab_alloc include/linux/kasan.h:253 [inline]
 slab_post_alloc_hook mm/slub.c:4683 [inline]
 slab_alloc_node mm/slub.c:4996 [inline]
 __do_kmalloc_node mm/slub.c:5413 [inline]
 __kmalloc_noprof+0x2cc/0x840 mm/slub.c:5439
 _kmalloc_noprof include/linux/slab.h:995 [inline]
 tomoyo_add_entry security/tomoyo/common.c:2166 [inline]
 tomoyo_supervisor+0x65d/0x1340 security/tomoyo/common.c:2238
 tomoyo_audit_env_log security/tomoyo/environ.c:37 [inline]
 tomoyo_env_perm+0x191/0x200 security/tomoyo/environ.c:64
 tomoyo_environ security/tomoyo/domain.c:673 [inline]
 tomoyo_find_next_domain+0x13d7/0x2010 security/tomoyo/domain.c:889
 tomoyo_bprm_check_security security/tomoyo/tomoyo.c:102 [inline]
 tomoyo_bprm_check_security+0x12d/0x1d0 security/tomoyo/tomoyo.c:92
 security_bprm_check+0x87/0x1e0 security/security.c:820
 search_binary_handler fs/exec.c:1755 [inline]
 exec_binprm fs/exec.c:1797 [inline]
 bprm_execve fs/exec.c:1853 [inline]
 bprm_execve+0x80b/0x1940 fs/exec.c:1829
 do_execveat_common.isra.0+0x4a5/0x580 fs/exec.c:1951
 __do_sys_execve fs/exec.c:2024 [inline]
 __se_sys_execve fs/exec.c:2018 [inline]
 __x64_sys_execve+0x93/0xd0 fs/exec.c:2018
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x121/0x770 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffff888029c33380: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888029c33400: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff888029c33480: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                              ^
 ffff888029c33500: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888029c33580: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


Tested on:

commit:         50d05c7c Merge tag 'landlock-7.3-rc3' of git://git.ker..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=174c2115580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=85bc5cc2fc7394d9
dashboard link: https://syzkaller.appspot.com/bug?extid=f4a0159ce6802a0a4774
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
userspace arch: i386
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15aeb5f9580000

