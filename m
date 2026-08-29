Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664AB2DA749
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 04:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787979304; cv=none; b=bV9itYb15BkpBlbLiRHQ14O456RrAt5EMxcKOwPVOjPwdt+tr19QZUlKRWiNnOikJxHtS2M3uiRO7MdYUqbVnLev6dZSWowOAATjmCfLqmnQ2xuFBN6qFGoXiRnR2IQByF5Le6J/+Fi6Mc0nSxop6/TuDVrRLTOQl1C8TJKYJhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787979304; c=relaxed/simple;
	bh=uVpVTrL4mLcJc1JXOKOhprAHV0NSzkXbJfj/vJuIBoM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ueWriiFFdXpjKmT1U1JqxLWtRsI4Uxke4GNN2sto+S6hH3gYKuQvfUcDJY0FtWsVvv+S8NZ0KTisPYY1sLlyQhLDcL987Qzox+J4GgdJDdHNSmMxjTYKeCAZf4Mc3jknqHdRU8FcbmkC7oQu9urPowdaVi+ioAq5gQthBaJbjlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sfrn9+TE; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sfrn9+TE"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-395cf2535acso1755443a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 21:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787979303; x=1788584103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zlp9XccJOHaqggXl14JiRdhGmLxh9KRLa7YnG7QmXxc=;
        b=sfrn9+TEde6N1fM1tbTPf94STFHDQwubAt0g26CR/e/JhBEp1Ujdj/DhrImRQqiyBV
         dcFJGrh5yRKJmXPzzUJaw7205eTAuYpXM61A7l9CQxp1rf3/f46oZHlPs8JgsLxkPLVv
         kb7NDXSzI5Zj1NVhD9wOEjC8V0vqaJ4t/mpEiXow1BTrpI9LNiyq4rqulwe8ayVJGCYn
         d74bYtwJ9cDVqiC7pQzEjz+yvxaJKGyjgPBjRPXMuSKx8tN/atensNSUo2/1FCs+eHzR
         5rEVkHZ/bzu81pgk5IVw1/G02WeSNsx8AwwyX/akYk7CSiI3WaFUrwZ827ofr02cnPTv
         L/QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787979303; x=1788584103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zlp9XccJOHaqggXl14JiRdhGmLxh9KRLa7YnG7QmXxc=;
        b=H0D4qZXT7IDEdI6bVLrzfZICfjRNAt44uiph9KwOoafKQ+lLsrQWQa3OzWYLEpBUGk
         476rlh8RD578NUlat3aSAfwDtrIfu4nmbzL9ZQzoEp62u6pMursRLiEfwrvkpFk4awNg
         TD8vL3c5Rv+HOUFgAWKwqKc0sgIQNArucBbF2Zv4YvAIHnAOYHfFUc2vs4Yn1Q6CP0Bm
         QYtQ55G/aUN8aOcSEFfqoRElPOkoQ51QLXAb7PS+glaVk+7bsS9a7n1EFoCDpzmlAUJ9
         sGMC+PJf2//eOo/cq4wRq9mJcMF5EEM4b+ZePALnPuQYXmKK7/OhfU2+4lILoDfe+9V3
         MYdA==
X-Forwarded-Encrypted: i=1; AKwUvByq9D+Kh3IWb7QtM1+dZGZlzwgZR/3MpsqvXlYx7DtvILRQy4eI0RVj6n08EkoyQ+GD1EsMJ38wbMxfjvg=@vger.kernel.org
X-Gm-Message-State: AFuF++mXdMVhA0/0pnlmr6z7kzGQiEYSsaunLQceuKG7YntqTnXTiI6e
	I4MGrAWL1L+1woiz50aG3CIMP1GIhAvtLgrvYD3aeGiLsMc9351YmlwF
X-Gm-Gg: AYBFou3cuRHwiuhCLBUdKn9hslDfxddL5U8uUWYzNscBWtM3CX4bNENm/2CerS3+a9e
	RfP22ccN67MuHHEd1lZ+uUO6i3waUln+eLHubMY83MdUyH4WQSWBLjfBybaaVogtpfWZ83VLej4
	sql1uDVp2h84i/ONE9aTTNiCIPcsoZm/5c/OS8EuOxBDPy2xngUs1U8w11XDWD6WTghE57qilRr
	nw6ZRwsM5ufhRTl5cOZUgCzjDhx9gmW4idJtO1fGvyqNsaf3YegZgXxLjy7FbEAF360C8hqSg/a
	uxSEM93ZVVFEe9YyXT9b67cNVWR+9mDdffYoAkqFpw06WrvqkjikxpdnT++uBv5fQbdnL9PbibG
	3xYYKmRkopU51bA3a/ITHhmSCSvvNCVLmIkAf+3OaAWWCjXwoBe/8jwy3dTRE36qlIjuNZNYPrS
	HP+ioC+CzVzc2SI+Aju+KTEjvrgLNgUHP2lW/IJikdwc0Xf+IW+IzQTm+7jv6Tp4o=
X-Received: by 2002:a17:90a:e70f:b0:38f:cfe2:fd3a with SMTP id 98e67ed59e1d1-3969bc5054dmr25473885a91.15.1787979302562;
        Fri, 28 Aug 2026 21:55:02 -0700 (PDT)
Received: from Default ([2409:40f4:101c:2e82:3697:838b:5d1b:b1b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d40ac7sm10496081c88.7.2026.08.28.21.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 21:55:02 -0700 (PDT)
From: Jeffin Philip <jeffinphilip14@gmail.com>
To: syzbot+f8a0f50ead274d8516d3@syzkaller.appspotmail.com
Cc: bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	linux-kernel@vger.kernel.org,
	mingo@redhat.com,
	syzkaller-bugs@googlegroups.com,
	tglx@kernel.org,
	x86@kernel.org
Subject: Re: [syzbot] [kernel?] KASAN: slab-use-after-free Read in atkbd_event_work
Date: Sat, 29 Aug 2026 10:24:48 +0530
Message-ID: <20260829045448.22343-1-jeffinphilip14@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <6a923059.1d9ded08.62e62.00fa.GAE@google.com>
References: <6a923059.1d9ded08.62e62.00fa.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, Aug 29, 01:05, syzbot wrote:

>==================================================================
>BUG: KASAN: slab-use-after-free in atkbd_event_work+0x592/0x650 drivers/input/keyboard/atkbd.c:-1
>Read of size 4 at addr ffff888025c96164 by task kworker/1:2/3686
>
>CPU: 1 UID: 0 PID: 3686 Comm: kworker/1:2 Not tainted syzkaller >0 PREEMPT(full) 
>Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/16/2026
>Workqueue: events atkbd_event_work
>Call Trace:
> <TASK>
> dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
> print_address_description+0x55/0x1e0 mm/kasan/report.c:378
> print_report+0x58/0x70 mm/kasan/report.c:482
> kasan_report+0x117/0x150 mm/kasan/report.c:595
> atkbd_event_work+0x592/0x650 drivers/input/keyboard/atkbd.c:-1
> process_one_work kernel/workqueue.c:3387 [inline]
> process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3470
> worker_thread+0xa47/0xfb0 kernel/workqueue.c:3551
> kthread+0x38b/0x480 kernel/kthread.c:436
> ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
> ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
> </TASK>
>
>Allocated by task 5621:
> kasan_save_stack mm/kasan/common.c:57 [inline]
> kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
> poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
> __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:415
> kasan_kmalloc include/linux/kasan.h:263 [inline]
> __kmalloc_cache_noprof+0x321/0x600 mm/slub.c:5563
> _kmalloc_noprof include/linux/slab.h:991 [inline]
> _kzalloc_noprof include/linux/slab.h:1312 [inline]
> input_allocate_device+0x4e/0x2a0 drivers/input/input.c:1960
> atkbd_connect+0xb1/0x9c0 drivers/input/keyboard/atkbd.c:1258
> serio_connect_driver drivers/input/serio/serio.c:44 [inline]
> serio_driver_probe+0x82/0xa0 drivers/input/serio/serio.c:748
> call_driver_probe drivers/base/dd.c:-1 [inline]
> really_probe+0x254/0xae0 drivers/base/dd.c:706
> __driver_probe_device+0x1e8/0x360 drivers/base/dd.c:868
> driver_probe_device+0x4f/0x240 drivers/base/dd.c:898
> __device_attach_driver+0x270/0x410 drivers/base/dd.c:1026
> bus_for_each_drv+0x258/0x2f0 drivers/base/bus.c:500
> __device_attach+0x2c4/0x450 drivers/base/dd.c:1098
> device_initial_probe+0xa1/0xd0 drivers/base/dd.c:1153
> bus_probe_device+0x12a/0x220 drivers/base/bus.c:620
> device_add+0x7d7/0xb80 drivers/base/core.c:3776
> serio_add_port drivers/input/serio/serio.c:512 [inline]
> serio_handle_event+0x9f2/0xd20 drivers/input/serio/serio.c:197
> process_one_work kernel/workqueue.c:3387 [inline]
> process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3470
> worker_thread+0xa47/0xfb0 kernel/workqueue.c:3551
> kthread+0x38b/0x480 kernel/kthread.c:436
> ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
> ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
>
>Freed by task 8139:
> kasan_save_stack mm/kasan/common.c:57 [inline]
> kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
> kasan_save_free_info+0x40/0x50 mm/kasan/generic.c:584
> poison_slab_object mm/kasan/common.c:253 [inline]
> __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:285
> kasan_slab_free include/linux/kasan.h:235 [inline]
> slab_free_hook mm/slub.c:2748 [inline]
> slab_free mm/slub.c:6499 [inline]
> kfree+0x1c5/0x650 mm/slub.c:6792
> input_dev_release+0xab/0xc0 drivers/input/input.c:1644
> device_release+0xc4/0x1f0 drivers/base/core.c:-1
> kobject_cleanup lib/kobject.c:689 [inline]
> kobject_release lib/kobject.c:720 [inline]
> kref_put include/linux/kref.h:65 [inline]
> kobject_put+0x222/0x550 lib/kobject.c:737
> atkbd_disconnect+0xb5/0x110 drivers/input/keyboard/atkbd.c:966
> serio_disconnect_driver drivers/input/serio/serio.c:62 [inline]
> serio_driver_remove+0x85/0xa0 drivers/input/serio/serio.c:755
> device_remove drivers/base/dd.c:616 [inline]
> __device_release_driver drivers/base/dd.c:1349 [inline]
> device_release_driver_internal+0x48b/0x880 drivers/base/dd.c:1372
> serio_disconnect_port drivers/input/serio/serio.c:646 [inline]
> serio_unregister_port+0x128/0x150 drivers/input/serio/serio.c:679
> userio_char_release+0x80/0xc0 drivers/input/serio/userio.c:105
> __fput+0x418/0xa50 fs/file_table.c:512
> task_work_run+0x1d9/0x270 kernel/task_work.c:233
> resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
> __exit_to_user_mode_loop kernel/entry/common.c:70 [inline]
> exit_to_user_mode_loop+0x204/0x770 kernel/entry/common.c:101
> __exit_to_user_mode_prepare include/linux/irq-entry-common.h:207 [inline]
> syscall_exit_to_user_mode_prepare include/linux/irq-entry-common.h:230 [inline]
> syscall_exit_to_user_mode include/linux/entry-common.h:336 [inline]
> do_syscall_64+0x328/0x520 arch/x86/entry/syscall_64.c:89
> entry_SYSCALL_64_after_hwframe+0x77/0x7f
>
>The buggy address belongs to the object at ffff888025c96000
> which belongs to the cache kmalloc-4k of size 4096
>The buggy address is located 356 bytes inside of
> freed 4096-byte region [ffff888025c96000, ffff888025c97000)
>
>The buggy address belongs to the physical page:
>page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x25c90
>head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
>flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
>page_type: f5(slab)
>raw: 00fff00000000040 ffff88801b042140 dead000000000100 dead000000000122
>raw: 0000000000000000 0000000000040004 00000000f5000000 0000000000000000
>head: 00fff00000000040 ffff88801b042140 dead000000000100 dead000000000122
>head: 0000000000000000 0000000000040004 00000000f5000000 0000000000000000
>head: 00fff00000000003 fffffffffffffe01 00000000ffffffff 00000000ffffffff
>head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
>page dumped because: kasan: bad access detected
>page_owner tracks the page as allocated
>page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd2040(__GFP_IO|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 4978, tgid 4978 (udevd), ts 44140195112
> set_page_owner include/linux/page_owner.h:33 [inline]
> post_alloc_hook+0x1f9/0x250 mm/page_alloc.c:1871
> prep_new_page mm/page_alloc.c:1879 [inline]
> get_page_from_freelist+0x2209/0x2280 mm/page_alloc.c:3943
> __alloc_frozen_pages_noprof+0x217/0x5a0 mm/page_alloc.c:5436
> alloc_slab_page mm/slub.c:3347 [inline]
> allocate_slab+0x7d/0x620 mm/slub.c:3462
> new_slab mm/slub.c:3513 [inline]
> refill_objects+0x2d5/0x350 mm/slub.c:7410
> refill_sheaf mm/slub.c:2885 [inline]
> __pcs_replace_empty_main+0x2c8/0x6c0 mm/slub.c:4774
> alloc_from_pcs mm/slub.c:4850 [inline]
> slab_alloc_node mm/slub.c:4984 [inline]
> __do_kmalloc_node mm/slub.c:5413 [inline]
> __kmalloc_noprof+0x47b/0x720 mm/slub.c:5439
> _kmalloc_noprof include/linux/slab.h:995 [inline]
> tomoyo_realpath_from_path+0xef/0x640 security/tomoyo/realpath.c:251
> tomoyo_get_realpath security/tomoyo/file.c:151 [inline]
> tomoyo_check_open_permission+0x229/0x470 security/tomoyo/file.c:776
> security_file_open+0xa9/0x240 security/security.c:2739
> do_dentry_open+0x4a0/0x1380 fs/open.c:973
> vfs_open+0x3b/0x340 fs/open.c:1101
> do_open fs/namei.c:4837 [inline]
> path_openat+0x1443/0x1d60 fs/namei.c:5000
> do_file_open+0x23e/0x4a0 fs/namei.c:5029
> do_sys_openat2+0x115/0x200 fs/open.c:1417
> do_sys_open fs/open.c:1423 [inline]
> __do_sys_openat fs/open.c:1439 [inline]
> __se_sys_openat fs/open.c:1434 [inline]
> __x64_sys_openat+0x138/0x170 fs/open.c:1434
>page last free pid 4981 tgid 4981 ts 44132500299 stack trace:
> reset_page_owner include/linux/page_owner.h:26 [inline]
> __free_pages_prepare mm/page_alloc.c:1418 [inline]
> __free_frozen_pages+0xc93/0xd90 mm/page_alloc.c:2962
> __slab_free+0x274/0x2c0 mm/slub.c:5815
> qlink_free mm/kasan/quarantine.c:163 [inline]
> qlist_free_all+0x99/0x100 mm/kasan/quarantine.c:179
> kasan_quarantine_reduce+0x148/0x160 mm/kasan/quarantine.c:286
> __kasan_slab_alloc+0x22/0x80 mm/kasan/common.c:350
> kasan_slab_alloc include/linux/kasan.h:253 [inline]
> slab_post_alloc_hook mm/slub.c:4683 [inline]
> slab_alloc_node mm/slub.c:4996 [inline]
> __kmalloc_cache_noprof+0x29f/0x600 mm/slub.c:5559
> _kmalloc_noprof include/linux/slab.h:991 [inline]
> _kzalloc_noprof include/linux/slab.h:1312 [inline]
> kernfs_iop_get_link+0x66/0x6c0 fs/kernfs/symlink.c:137
> vfs_readlink+0x24a/0x540 fs/namei.c:6419
> do_readlinkat+0x218/0x510 fs/stat.c:583
> __do_sys_readlink fs/stat.c:605 [inline]
> __se_sys_readlink fs/stat.c:602 [inline]
> __x64_sys_readlink+0x7f/0x90 fs/stat.c:602
> do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
> do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
> entry_SYSCALL_64_after_hwframe+0x77/0x7f
>
>Memory state around the buggy address:
> ffff888025c96000: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> ffff888025c96080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>>ffff888025c96100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>                                                       ^
> ffff888025c96180: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> ffff888025c96200: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>==================================================================

I believe this is a similar issue as this one[1]. The solution may be the same
too(?)

[1]: https://lore.kernel.org/all/6a90d9ef.4d659fcc.734b4.0019.GAE@google.com/T/

Thanks,
Jeffin.
