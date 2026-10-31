Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793417375;
	b=jzUbWXnbQy6p0JqPCtuRYa5A8EjeWgHyjvnxrr9lweyb6vhHPvPm8JDfH2+9/VTYMow7
	 tbfbJxnjgEmM1srdg4ts92uriGO1UblmOwBuvYdJdCSNoe3Z3lKZhhgXnWwNcpQyIslUb
	 b0JnvIN4pqRUqbeGN99pmUggbPONkVZ1CYoE6iFL775lSVbo3JCV0WL8E/KONcs86Miyi
	 AsNBBeqtCsEtd+ZsrmffiP4/orRxoa10teDAy0KByksjTprUgPP1oQ2r1JOrb5AmhAq4w
	 pJ44sFncqwn7/QsruwlJ3XoFqbTLL+U8BfnMYcZXAYeOnLW0msR/WnIZVvwqvnt+fkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793417375;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=bWByFUz6u7bEhw8RRmX5SehgTNFi9ZCSWCcXAqDpexM=;
	b=gOkXm6jdmIrk6f5R8IFNHWh7Ge5v02NscLPamsD2B6aqMWNBKsTz0OZnkcBMzvUMsw43
	 AuLpdsJstCbYgRAf4+AOYp87YdhkAPXvjme8tGLFk/Gt9g9N9l3P49d1ydLG79PAPUNEC
	 wMppB1CTGEudx6kU5GBTXh+odXyT3FaSfwW2FxvgeIiv9JXB09WKJ1RXY+zc/cpBJmVMK
	 ESzMQmAEn2/daYPMq1R9AT6nf15/hXltvhS1FV0d+kFWPt7yT59XDzPE58hOSMKwz4H9h
	 YkH7iygM209OIRGttTMHLfrIVTSoVPykOyuoyzfpuwU6kITrdEFrIQNj8gZUdQGQaww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89192606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 03:29:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89192606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4a45b3f0bdfso1909908b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:29:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793417373; x=1794022173;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bWByFUz6u7bEhw8RRmX5SehgTNFi9ZCSWCcXAqDpexM=;
        b=sXMNj7Ev/yjNeE+j+V0toAFNZjDAcVPea+/ndmTXP2dRit/tevdL3P79r51XvV427x
         s2IR4pA0UE9EmAcK+SeyxHpxbMNObWl4BKBgswCIHo9YUhFf6YupS5a5X0QYjjZ3f3et
         YCVeXSPtUZGSIH8TsNFIGUORPtF6pVFCoguPJfU+dqtgRav0l1Ycftdd/CefYBghjt15
         cNugD66cO0TNnTlwdH66muzAmnzWRORkB6lacalaFsevHuq+Iz4aLhjigBLeUI1hamHl
         0sAUTUQzva1XhGktwToEScSCEMmc555BBtVMT1Ub2/dUGHuVCxEV66CzMMADyhcd6b3y
         zURg==
X-Gm-Message-State: AFq9FYI/kULqpAF3ZXheRxpO3NvfNnOxirV51nt0BReco1NM85Va/Al1
	Dk1HUzssL0mLso7YH505HQR05HQeRfQGHmi7UUBSjStaDuDpfSLr9YqDzBlIcxE6gb6Jtjx7Ebn
	KiMwZvv0YLoHgEsIIav3zS8NwrDYt8IqPzFfVt2Q43WdEVvJEFRD7zOUM7sQ=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:319a:b0:4f6:ae3d:8230 with SMTP id
 5614622812f47-5640de49f7bmr2960902b6e.46.1793417373596; Fri, 30 Oct 2026
 20:29:33 -0700 (PDT)
Date: Fri, 30 Oct 2026 20:29:33 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae5609d.264039fe.1edcaa.0001.GAE@google.com>
Subject: [syzbot] [media?] [usb?] KASAN: slab-use-after-free Read in v4l2_device_disconnect
From: syzbot <syzbot+1e71765881a6fc43185f@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, mchehab@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    4dd16e31135e Merge tag 'net-7.4-rc1' of git://git.kernel.o..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15639629580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=119e5f4d0a8d39cf
dashboard link: https://syzkaller.appspot.com/bug?extid=1e71765881a6fc43185f
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11a0808d580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/17a0632c09a1/disk-4dd16e31.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/d56bbd650c37/vmlinux-4dd16e31.xz
kernel image: https://storage.googleapis.com/syzbot-assets/83c14bba96f4/bzImage-4dd16e31.xz

AI-generated root cause summary:
In the em28xx driver, if initialization fails after video device nodes have been
registered, em28xx_v4l2_init() unregisters the nodes and drops its initial
reference on v4l2_dev without clearing dev->v4l2 to NULL. If a userspace process
has opened the video device node in the interim, the v4l2 instance remains
allocated until the file descriptor is closed. When the USB device is
disconnected or the extension is closed, em28xx_v4l2_fini() reads the non-NULL
dev->v4l2 pointer and concurrently attempts to disconnect and release the
already-destroyed or currently freeing v4l2_device, leading to a
slab-use-after-free in v4l2_device_disconnect().

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=1e71765881a6fc43185f

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+1e71765881a6fc43185f@syzkaller.appspotmail.com

em28xx 2-1:0.191: Closing video extension
==================================================================
BUG: KASAN: slab-use-after-free in v4l2_device_disconnect+0xa4/0xc0 drivers/media/v4l2-core/v4l2-device.c:78
Read of size 8 at addr ffff88807de14008 by task kworker/1:1/29

CPU: 1 UID: 0 PID: 29 Comm: kworker/1:1 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/05/2026
Workqueue: usb_hub_wq hub_event
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x13d/0x4b0 mm/kasan/report.c:482
 kasan_report+0xdf/0x1c0 mm/kasan/report.c:595
 v4l2_device_disconnect+0xa4/0xc0 drivers/media/v4l2-core/v4l2-device.c:78
 em28xx_v4l2_fini.cold+0x65/0x312 drivers/media/usb/em28xx/em28xx-video.c:2436
 em28xx_close_extension+0xd2/0x460 drivers/media/usb/em28xx/em28xx-core.c:1262
 em28xx_usb_disconnect.cold+0x13d/0x253 drivers/media/usb/em28xx/em28xx-cards.c:4489
 usb_unbind_interface+0x1dd/0x9b0 drivers/usb/core/driver.c:460
 device_remove drivers/base/dd.c:619 [inline]
 device_remove+0x12a/0x180 drivers/base/dd.c:611
 __device_release_driver drivers/base/dd.c:1357 [inline]
 device_release_driver_internal+0x441/0x610 drivers/base/dd.c:1380
 bus_remove_device+0x2bc/0x560 drivers/base/bus.c:681
 device_del+0x376/0x9b0 drivers/base/core.c:3965
 usb_disable_device+0x367/0x810 drivers/usb/core/message.c:1484
 usb_disconnect+0x2e2/0x9a0 drivers/usb/core/hub.c:2355
 hub_port_connect drivers/usb/core/hub.c:5425 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5725 [inline]
 port_event drivers/usb/core/hub.c:5889 [inline]
 hub_event+0x1bb1/0x4420 drivers/usb/core/hub.c:5971
 process_one_work+0xac7/0x1b10 kernel/workqueue.c:3495
 process_scheduled_works kernel/workqueue.c:3578 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3659
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Allocated by task 5952:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:409 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:426
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __kmalloc_cache_noprof+0x2f8/0x6d0 mm/slub.c:5680
 _kmalloc_noprof include/linux/slab.h:991 [inline]
 _kzalloc_noprof include/linux/slab.h:1312 [inline]
 em28xx_v4l2_init.cold+0x94/0x3a7f drivers/media/usb/em28xx/em28xx-video.c:2751
 em28xx_init_extension+0x13a/0x200 drivers/media/usb/em28xx/em28xx-core.c:1245
 request_module_async+0x1e/0x30 drivers/media/usb/em28xx/em28xx-cards.c:3723
 process_one_work+0xac7/0x1b10 kernel/workqueue.c:3495
 process_scheduled_works kernel/workqueue.c:3578 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3659
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Freed by task 7419:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 kasan_save_free_info+0x3b/0x70 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:264 [inline]
 __kasan_slab_free+0x5f/0x80 mm/kasan/common.c:296
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2780 [inline]
 slab_free mm/slub.c:6630 [inline]
 kfree+0x22b/0x6d0 mm/slub.c:6923
 em28xx_free_v4l2+0x7b/0x110 drivers/media/usb/em28xx/em28xx-video.c:2337
 v4l2_device_release drivers/media/v4l2-core/v4l2-device.c:51 [inline]
 kref_put include/linux/kref.h:65 [inline]
 v4l2_device_put+0xa3/0xd0 drivers/media/v4l2-core/v4l2-device.c:56
 v4l2_device_release+0x2cf/0x480 drivers/media/v4l2-core/v4l2-dev.c:229
 device_release+0xd2/0x270 drivers/base/core.c:2640
 kobject_cleanup lib/kobject.c:689 [inline]
 kobject_release lib/kobject.c:720 [inline]
 kref_put include/linux/kref.h:65 [inline]
 kobject_put+0x1f7/0x640 lib/kobject.c:737
 put_device+0x1f/0x30 drivers/base/core.c:3884
 video_put drivers/media/v4l2-core/v4l2-dev.c:173 [inline]
 v4l2_release+0x2da/0x390 drivers/media/v4l2-core/v4l2-dev.c:480
 __fput+0x3fb/0xb50 fs/file_table.c:512
 fput_close_sync+0x118/0x250 fs/file_table.c:618
 filp_close_sync+0x75/0xa0 fs/open.c:1573
 __do_sys_close fs/open.c:1596 [inline]
 __se_sys_close fs/open.c:1583 [inline]
 __x64_sys_close+0x81/0x110 fs/open.c:1583
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff88807de14000
 which belongs to the cache kmalloc-8k of size 8192
The buggy address is located 8 bytes inside of
 freed 8192-byte region [ffff88807de14000, ffff88807de16000)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x7de10
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88813ff0d280 dead000000000100 dead000000000122
raw: 0000000000000000 0000000000020002 00000000f5000000 0000000000000000
head: 00fff00000000040 ffff88813ff0d280 dead000000000100 dead000000000122
head: 0000000000000000 0000000000020002 00000000f5000000 0000000000000000
head: 00fff00000000003 fffffffffffffe01 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd2040(__GFP_IO|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5287, tgid 5287 (dhcpcd-run-hook), ts 43652285249
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
 __kmalloc_cache_noprof+0x4ef/0x6d0 mm/slub.c:5676
 _kmalloc_noprof include/linux/slab.h:991 [inline]
 _kzalloc_noprof include/linux/slab.h:1312 [inline]
 tomoyo_print_bprm security/tomoyo/audit.c:26 [inline]
 tomoyo_init_log+0xb78/0x1f80 security/tomoyo/audit.c:262
 tomoyo_supervisor+0x506/0x1340 security/tomoyo/common.c:2232
 tomoyo_audit_path_log security/tomoyo/file.c:169 [inline]
 tomoyo_execute_permission+0x38e/0x4b0 security/tomoyo/file.c:624
 tomoyo_find_next_domain+0x38d/0x2010 security/tomoyo/domain.c:763
 tomoyo_bprm_check_security security/tomoyo/tomoyo.c:102 [inline]
 tomoyo_bprm_check_security+0x12d/0x1d0 security/tomoyo/tomoyo.c:92
 security_bprm_check+0x87/0x1e0 security/security.c:834
 search_binary_handler fs/exec.c:1767 [inline]
 exec_binprm fs/exec.c:1809 [inline]
 bprm_execve fs/exec.c:1865 [inline]
 bprm_execve+0x80b/0x1940 fs/exec.c:1841
 do_execveat_common.isra.0+0x49d/0x580 fs/exec.c:1963
 __do_sys_execve fs/exec.c:2036 [inline]
 __se_sys_execve fs/exec.c:2030 [inline]
 __x64_sys_execve+0x93/0xd0 fs/exec.c:2030
page last free pid 5281 tgid 5281 ts 43568219751 stack trace:
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
 __do_kmalloc_node mm/slub.c:5530 [inline]
 __kvmalloc_node_noprof+0x2f6/0x9b0 mm/slub.c:7136
 proc_sys_call_handler+0x2c7/0x5a0 fs/proc/proc_sysctl.c:583
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6af/0x1050 fs/read_write.c:687
 ksys_write+0x12a/0x250 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffff88807de13f00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff88807de13f80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff88807de14000: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                      ^
 ffff88807de14080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88807de14100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
