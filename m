Received: from mail-oa2-f9.google.com (mail-oa2-f9.google.com [74.125.231.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C273CB570
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789442503; cv=none; b=bgT0H6AG9+1hF4RKF1sPV2yejYx2jB+4CB9tEO94WO0Y8dLMnq65qC54Ftar/o0s6TfKw1GiIptSAkM5QAMSbFb6eZapKojVL3CZq+4wIiufxSGaFk6OQtjM6Ssm/ZjqkYc3cgLOtmDFDc+Q7aMm+Fjjc1SsllrHYAUy0mbWhV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789442503; c=relaxed/simple;
	bh=MEYFJYsY+RTaESRv+TZOZv2fHWrIJDmysonyukmQYW8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=kLplXJyI3PioBkZqa9nVwdixTiXbGk2sFooxr7iov6Z4GCrjahDsnLNvY9MT5GrV92DHDkhuQDg+PHZ+Av6O1SSwBSTVQg3ApVogsXOeiEJVG26Ps7P+cBy1cXN+G7fIuuiWQirtaxFy9Cp8S7cbjkug5X/ieTJmeKxfO9jSsyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa2-f9.google.com with SMTP id 586e51a60fabf-47bd4bcc3e2so1503478fac.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 20:21:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789442500; x=1790047300;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PC6b2bcsi5ktAeKfbcnzJOTU2tF7Dr2qonz/+XPV0sw=;
        b=tZ4nGq8bTF6zSLwaxm8eOrv0rnMByItFSNKy+HraPxDj/vML+aoKxNrlIy+RM8sJ/T
         oMs8MR2v1l71g21HCe22kbMind4RaFGuN3paFrHqT8YkK3XqRh7GCnJjZnArLga1fhfb
         +86Ob1jpftxxnigpVRXMB96CuPptBcnri1FpcpRjuYA+dK0e5DnJxRu6LSZjWaCplARJ
         ezQXtHr3NhRYaqAbrhS5FwOCKW7roy5ar6bibuGfZsYw0pEI40Xuhatqyd5IF2Eqfo0/
         uHNK/9Iqr9Tgi9KaGn5FQdfz7cajvJLGv2uZj0FtUoiJ0oe9SJ/jG4zKr9QhfwTNl34K
         wEyA==
X-Forwarded-Encrypted: i=1; AKwUvBysPmErTLwbXheouc9a6kAHQK5vLbs6EM/LcUqM6zq9mnuqxWHStXQsHhmV4EBaAVYWxU8EH2O8LUhG+JU=@vger.kernel.org
X-Gm-Message-State: AFuF++mHJE2wh74F0hILQFn9WCVlkVrWEY1ILq5gIKi9D386vPOPd7mn
	cX/k52o7dn7sur+OgfB4oYC387U/pF6hnaK8UCUpwYdI12wi4EFbq9G4B891Swpf01ekIAZWu2A
	lBr7JPrt36StgCEGIIYakH+eK9vCcp7olWyiFW3965El60OZu5yKnmDb5yIU=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4de7:b0:6b1:a11a:eef4 with SMTP id
 006d021491bc7-6c540088e05mr2913439eaf.14.1789442500244; Mon, 14 Sep 2026
 20:21:40 -0700 (PDT)
Date: Mon, 14 Sep 2026 20:21:40 -0700
In-Reply-To: <6a923059.1d9ded08.62e62.00fa.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa8b9c4.f81106d8.2ab401.005d.GAE@google.com>
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Read in atkbd_event_work
From: syzbot <syzbot+f8a0f50ead274d8516d3@syzkaller.appspotmail.com>
To: bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	jeffinphilip14@gmail.com, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, mingo@redhat.com, syzkaller-bugs@googlegroups.com, 
	tglx@kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    704340f1cd0d Merge tag 'x86_urgent_for_7.3-rc4' of git://g..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=1318a115580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5e4e3a0e188a497e
dashboard link: https://syzkaller.appspot.com/bug?extid=f8a0f50ead274d8516d3
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1718a115580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=129c5925580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/020eba5164c7/disk-704340f1.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/c1203c300bbc/vmlinux-704340f1.xz
kernel image: https://storage.googleapis.com/syzbot-assets/7378e6cf5c10/bzImage-704340f1.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+f8a0f50ead274d8516d3@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in atkbd_event_work+0x592/0x650 drivers/input/keyboard/atkbd.c:-1
Read of size 4 at addr ffff88807f924164 by task kworker/0:1/10

CPU: 0 UID: 0 PID: 10 Comm: kworker/0:1 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/05/2026
Workqueue: events atkbd_event_work
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description+0x55/0x1e0 mm/kasan/report.c:378
 print_report+0x58/0x70 mm/kasan/report.c:482
 kasan_report+0x117/0x150 mm/kasan/report.c:595
 atkbd_event_work+0x592/0x650 drivers/input/keyboard/atkbd.c:-1
 process_one_work kernel/workqueue.c:3396 [inline]
 process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3479
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3560
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Allocated by task 9:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __kmalloc_cache_noprof+0x321/0x600 mm/slub.c:5563
 _kmalloc_noprof include/linux/slab.h:991 [inline]
 _kzalloc_noprof include/linux/slab.h:1312 [inline]
 input_allocate_device+0x4e/0x2a0 drivers/input/input.c:1960
 atkbd_connect+0xb1/0x9c0 drivers/input/keyboard/atkbd.c:1258
 serio_connect_driver drivers/input/serio/serio.c:44 [inline]
 serio_driver_probe+0x82/0xa0 drivers/input/serio/serio.c:748
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x254/0xae0 drivers/base/dd.c:706
 __driver_probe_device+0x1e8/0x360 drivers/base/dd.c:868
 driver_probe_device+0x4f/0x240 drivers/base/dd.c:898
 __device_attach_driver+0x270/0x410 drivers/base/dd.c:1026
 bus_for_each_drv+0x258/0x2f0 drivers/base/bus.c:500
 __device_attach+0x2c4/0x450 drivers/base/dd.c:1098
 device_initial_probe+0xa1/0xd0 drivers/base/dd.c:1153
 bus_probe_device+0x12a/0x220 drivers/base/bus.c:620
 device_add+0x7d7/0xb80 drivers/base/core.c:3776
 serio_add_port drivers/input/serio/serio.c:512 [inline]
 serio_handle_event+0x9e6/0xf80 drivers/input/serio/serio.c:197
 process_one_work kernel/workqueue.c:3396 [inline]
 process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3479
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3560
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Freed by task 5639:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 kasan_save_free_info+0x40/0x50 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2748 [inline]
 slab_free mm/slub.c:6508 [inline]
 kfree+0x1c5/0x650 mm/slub.c:6801
 input_dev_release+0xab/0xc0 drivers/input/input.c:1644
 device_release+0xc4/0x1f0 drivers/base/core.c:-1
 kobject_cleanup lib/kobject.c:689 [inline]
 kobject_release lib/kobject.c:720 [inline]
 kref_put include/linux/kref.h:65 [inline]
 kobject_put+0x222/0x550 lib/kobject.c:737
 atkbd_disconnect+0xb5/0x110 drivers/input/keyboard/atkbd.c:966
 serio_disconnect_driver drivers/input/serio/serio.c:62 [inline]
 serio_driver_remove+0x85/0xa0 drivers/input/serio/serio.c:755
 device_remove drivers/base/dd.c:616 [inline]
 __device_release_driver drivers/base/dd.c:1349 [inline]
 device_release_driver_internal+0x48b/0x880 drivers/base/dd.c:1372
 serio_disconnect_port drivers/input/serio/serio.c:646 [inline]
 serio_unregister_port+0x128/0x150 drivers/input/serio/serio.c:679
 userio_char_release+0x80/0xc0 drivers/input/serio/userio.c:105
 __fput+0x418/0xa50 fs/file_table.c:512
 task_work_run+0x1d9/0x270 kernel/task_work.c:233
 exit_task_work include/linux/task_work.h:40 [inline]
 do_exit+0x73a/0x2360 kernel/exit.c:1011
 do_group_exit+0x22d/0x2f0 kernel/exit.c:1154
 __do_sys_exit_group kernel/exit.c:1165 [inline]
 __se_sys_exit_group kernel/exit.c:1163 [inline]
 __x64_sys_exit_group+0x3f/0x40 kernel/exit.c:1163
 x64_sys_call+0x18c6/0x18d0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff88807f924000
 which belongs to the cache kmalloc-4k of size 4096
The buggy address is located 356 bytes inside of
 freed 4096-byte region [ffff88807f924000, ffff88807f925000)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x7f920
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88801b042140 dead000000000100 dead000000000122
raw: 0000000000000000 0000000000040004 00000000f5000000 0000000000000000
head: 00fff00000000040 ffff88801b042140 dead000000000100 dead000000000122
head: 0000000000000000 0000000000040004 00000000f5000000 0000000000000000
head: 00fff00000000003 fffffffffffffe01 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd2040(__GFP_IO|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 4982, tgid 4982 (udevd), ts 43635359949
 set_page_owner include/linux/page_owner.h:33 [inline]
 post_alloc_hook+0x1f9/0x250 mm/page_alloc.c:1871
 prep_new_page mm/page_alloc.c:1879 [inline]
 get_page_from_freelist+0x2209/0x2280 mm/page_alloc.c:3943
 __alloc_frozen_pages_noprof+0x217/0x5a0 mm/page_alloc.c:5436
 alloc_slab_page mm/slub.c:3347 [inline]
 allocate_slab+0x7d/0x620 mm/slub.c:3462
 new_slab mm/slub.c:3513 [inline]
 refill_objects+0x2d5/0x350 mm/slub.c:7417
 refill_sheaf mm/slub.c:2885 [inline]
 __pcs_replace_empty_main+0x2c8/0x6c0 mm/slub.c:4774
 alloc_from_pcs mm/slub.c:4850 [inline]
 slab_alloc_node mm/slub.c:4984 [inline]
 __do_kmalloc_node mm/slub.c:5413 [inline]
 __kmalloc_noprof+0x47b/0x720 mm/slub.c:5439
 _kmalloc_noprof include/linux/slab.h:995 [inline]
 tomoyo_realpath_from_path+0xef/0x640 security/tomoyo/realpath.c:251
 tomoyo_get_realpath security/tomoyo/file.c:151 [inline]
 tomoyo_check_open_permission+0x229/0x470 security/tomoyo/file.c:776
 security_file_open+0xa9/0x240 security/security.c:2739
 do_dentry_open+0x4a0/0x1380 fs/open.c:973
 vfs_open+0x3b/0x340 fs/open.c:1101
 do_open fs/namei.c:4837 [inline]
 path_openat+0x1443/0x1d60 fs/namei.c:5000
 do_file_open+0x23e/0x4a0 fs/namei.c:5029
 do_sys_openat2+0x115/0x200 fs/open.c:1417
 do_sys_open fs/open.c:1423 [inline]
 __do_sys_openat fs/open.c:1439 [inline]
 __se_sys_openat fs/open.c:1434 [inline]
 __x64_sys_openat+0x138/0x170 fs/open.c:1434
page last free pid 4985 tgid 4985 ts 43408573557 stack trace:
 reset_page_owner include/linux/page_owner.h:26 [inline]
 __free_pages_prepare mm/page_alloc.c:1418 [inline]
 __free_frozen_pages+0xc93/0xd90 mm/page_alloc.c:2962
 __slab_free+0x274/0x2c0 mm/slub.c:5823
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x99/0x100 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x148/0x160 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x22/0x80 mm/kasan/common.c:350
 kasan_slab_alloc include/linux/kasan.h:253 [inline]
 slab_post_alloc_hook mm/slub.c:4683 [inline]
 slab_alloc_node mm/slub.c:4996 [inline]
 __kmalloc_cache_noprof+0x29f/0x600 mm/slub.c:5559
 _kmalloc_noprof include/linux/slab.h:991 [inline]
 _kzalloc_noprof include/linux/slab.h:1312 [inline]
 kernfs_fop_open+0x3ac/0xce0 fs/kernfs/file.c:634
 do_dentry_open+0x816/0x1380 fs/open.c:996
 vfs_open+0x3b/0x340 fs/open.c:1101
 do_open fs/namei.c:4837 [inline]
 path_openat+0x1443/0x1d60 fs/namei.c:5000
 do_file_open+0x23e/0x4a0 fs/namei.c:5029
 do_sys_openat2+0x115/0x200 fs/open.c:1417
 do_sys_open fs/open.c:1423 [inline]
 __do_sys_openat fs/open.c:1439 [inline]
 __se_sys_openat fs/open.c:1434 [inline]
 __x64_sys_openat+0x138/0x170 fs/open.c:1434
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffff88807f924000: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88807f924080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff88807f924100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                                       ^
 ffff88807f924180: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88807f924200: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
