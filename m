Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793557593;
	b=Hk/m9fb0BdbklBcWA6pRcAWBN3gTw05TE6GrbEIZ+yhBcyT6IO2jUFL1OInsZbBifCVs
	 PScKniZ4Z7ee3a4C03WASrerqk9Xn82fGYnJq9TdBzaMuQpptgIAzTKBXkuzSRm8+MV/u
	 7i74fjCE1ngESJQnIlPD5rSThyZraSXtdN/EIQWRR5pSpg2RS4RES1H+SQt8waD0MCZSk
	 c3btnKcOfUYHUJqdhLCNa5BLnPpYSPPzz4kcPYquMEGHeXU3vb8HjD+k3VGAvxZmUQajw
	 DydiYWzT3ksbGG35kUMy+GiqJZ038yFPDoD4sjox/2m7Ihh1C3DZJ/soF4CjVr7SomA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793557593;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=Oz0eBbUy0UD0qCyaTCcP8ubaVbAzDpSNVHs3IbCGdj0=;
	b=J8iIQ9pQyl4UW12TmwgqYCHj5k9EU8sycpGPHC/QbqMTkDYNgrKf3GH86MsPpHDxuD51
	 QvJi8wVO4ucbm1X3rAEPU2d+reN3oWJR0Xo2uoJufXVQmyQNhf3Q2tCPtENM/v4U4xS2H
	 lz5tuN944bMHHwFhBy8yU3rruO7TpQ+QWaVTvh756T0HOTYQl51uoDSP7xRr25SYxJsBF
	 K1SRFli0SaMFK3MENxztSqWPt1qvK/TRN3udKNKBSyu9ZV9LV2maPD7z7GDYXpL8l9XTy
	 nyNDJBbD38+nN98hxDBcg8Hk97V8dva4t8DQ1Wg+pimlwA8+nqsJrllH04MPRq7rN5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1D3606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 18:26:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C1D3606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4eb0b989f0eso3466231b6e.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 10:26:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793557592; x=1794162392;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oz0eBbUy0UD0qCyaTCcP8ubaVbAzDpSNVHs3IbCGdj0=;
        b=kn1FS0ucnZTjPhQBitQv2zJ7dSZgag/i7k6h6258VneYYpcEsr6yaUD6WHkl2Fh0ZM
         j0I/VIQFSaMHZNWOoUoE4KX8268pEeD8SOCCQMmRz6DS6wUIvcGhJ1PkTV6B2fEuQnzO
         jTcLhB+C9Qnt58Iw/D/VuwR2mLR6t2Uh38bDcSwIXk9ElqbwLdNgM2yFLhGj6VWFj2Bg
         eTwgIxE0DEES9iaJHkv/JJO40dAfwHAF6sggzhz8CDL5lu3K1gylnWCIpZEJAByHTp1v
         f8B3v3gDGxhR5iv9iOWX798A/zmx/Vkbmlmuct53WY0SmpRBmEA+f+BByzRtvky4We7u
         Wv9Q==
X-Forwarded-Encrypted: i=1; AKwUvBws4fIRtJqQxIU+T0d3V5Iq4vkDt0Fr1CyKAl2ybOzwKVUY1XAhtcrhmtIWBK0iuGKmaHMvydevzyOhNpo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLtyQPcHRM5hsaBeLEs5rvoKAbkTp43cTqz0wKx8AXlM62MQNDS
	QtA4wP+OUX/52HFQiXzSRSD/Ad7G1zZATpsvBPaXPf55Tw3rQvvFXqYKI1xWEqAnrEfCJUrbwj8
	ApGLSzLsVKQjuk0cq/W/r5MKLK+88TqrEJMxvxelIWFvj6cuav6RO32w0NPw=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1509:b0:495:ca1b:7865 with SMTP id
 5614622812f47-563ef93c527mr5693492b6e.11.1793557592568; Sun, 01 Nov 2026
 10:26:32 -0800 (PST)
Date: Sun, 01 Nov 2026 10:26:32 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae78458.64e51036.15cf6a.0015.GAE@google.com>
Subject: [syzbot] [media?] [usb?] KASAN: slab-use-after-free Read in dev_dbg_obj
From: syzbot <syzbot+54648a6c1187a7ef46a6@syzkaller.appspotmail.com>
To: laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-usb@vger.kernel.org, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    cbbddb6b08cc Merge tag 'power-utilities-2026.10.31' of git..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11fc0581580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=bd712e5dbce1d1a0
dashboard link: https://syzkaller.appspot.com/bug?extid=54648a6c1187a7ef46a6
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
userspace arch: i386
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12f0e62d580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-cbbddb6b.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/4e9212cb9d41/vmlinux-cbbddb6b.xz
kernel image: https://storage.googleapis.com/syzbot-assets/b7710a90cc0c/bzImage-cbbddb6b.xz

AI-generated root cause summary:
In drivers/media/usb/em28xx/em28xx-video.c, if em28xx_v4l2_init() fails after
registering video devices (e.g. during v4l2_mc_create_media_graph()) while
userspace concurrently holds an open file handle to a video device node,
unregister_dev drops the initial v4l2_dev reference but leaves dev->v4l2
non-NULL. When the device disconnects, em28xx_v4l2_fini() is called and
incorrectly drops the initial reference a second time via
v4l2_device_put(&v4l2->v4l2_dev). This refcount underflow causes
em28xx_free_v4l2() to free struct em28xx_v4l2 prematurely, resulting in a slab
use-after-free when userspace closes the file descriptor and
v4l2_device_release() accesses embedded media entities.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=54648a6c1187a7ef46a6

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+54648a6c1187a7ef46a6@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in media_type include/media/media-entity.h:443 [inline]
BUG: KASAN: slab-use-after-free in dev_dbg_obj+0x630/0x830 drivers/media/mc/mc-entity.c:96
Read of size 4 at addr ffff888023601bd0 by task v4l_id/6384

CPU: 2 UID: 0 PID: 6384 Comm: v4l_id Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x13d/0x4b0 mm/kasan/report.c:482
 kasan_report+0xdf/0x1c0 mm/kasan/report.c:595
 media_type include/media/media-entity.h:443 [inline]
 dev_dbg_obj+0x630/0x830 drivers/media/mc/mc-entity.c:96
 media_gobj_destroy drivers/media/mc/mc-entity.c:179 [inline]
 media_gobj_destroy+0x4d/0x240 drivers/media/mc/mc-entity.c:173
 __media_device_unregister_entity+0x20c/0x2f0 drivers/media/mc/mc-device.c:597
 media_device_unregister_entity+0x4b/0x70 drivers/media/mc/mc-device.c:677
 v4l2_device_release+0x363/0x480 drivers/media/v4l2-core/v4l2-dev.c:208
 device_release+0xd2/0x270 drivers/base/core.c:2640
 kobject_cleanup lib/kobject.c:689 [inline]
 kobject_release lib/kobject.c:720 [inline]
 kref_put include/linux/kref.h:65 [inline]
 kobject_put+0x1f7/0x640 lib/kobject.c:737
 put_device+0x1f/0x30 drivers/base/core.c:3886
 video_put drivers/media/v4l2-core/v4l2-dev.c:173 [inline]
 v4l2_release+0x2da/0x390 drivers/media/v4l2-core/v4l2-dev.c:480
 __fput+0x3fb/0xb50 fs/file_table.c:512
 fput_close_sync+0x118/0x250 fs/file_table.c:618
 filp_close_sync+0x75/0xa0 fs/open.c:1573
 __do_sys_close fs/open.c:1596 [inline]
 __se_sys_close fs/open.c:1583 [inline]
 __x64_sys_close+0x81/0x110 fs/open.c:1583
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x121/0x770 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fb504ca7407
Code: 48 89 fa 4c 89 df e8 38 aa 00 00 8b 93 08 03 00 00 59 5e 48 83 f8 fc 74 1a 5b c3 0f 1f 84 00 00 00 00 00 48 8b 44 24 10 0f 05 <5b> c3 0f 1f 80 00 00 00 00 83 e2 39 83 fa 08 75 de e8 23 ff ff ff
RSP: 002b:00007ffe26ad6260 EFLAGS: 00000202 ORIG_RAX: 0000000000000003
RAX: ffffffffffffffda RBX: 00007fb5053c2880 RCX: 00007fb504ca7407
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000003
RBP: 00007fb5053c26e8 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000202 R12: 0000000000000013
R13: 00007ffe26ad6490 R14: 00007fb505529000 R15: 0000564e446754d8
 </TASK>

Allocated by task 34:
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

The buggy address belongs to the object at ffff888023600000
 which belongs to the cache kmalloc-8k of size 8192
The buggy address is located 7120 bytes inside of
 freed 8192-byte region [ffff888023600000, ffff888023602000)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x23600
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88801d443180 dead000000000100 dead000000000122
raw: 0000000000000000 0000000000020002 00000000f5000000 0000000000000000
head: 00fff00000000040 ffff88801d443180 dead000000000100 dead000000000122
head: 0000000000000000 0000000000020002 00000000f5000000 0000000000000000
head: 00fff00000000003 fffffffffffffe01 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5812, tgid 5812 (syz-executor), ts 73629010596
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
 __kmalloc_noprof+0x677/0x840 mm/slub.c:5556
 _kmalloc_noprof include/linux/slab.h:995 [inline]
 _kzalloc_noprof include/linux/slab.h:1312 [inline]
 ops_init+0x77/0x5f0 net/core/net_namespace.c:127
 setup_net+0x118/0x3a0 net/core/net_namespace.c:443
 copy_net_ns+0x340/0x7a0 net/core/net_namespace.c:584
 create_new_namespaces+0x3ea/0xac0 kernel/nsproxy.c:132
 unshare_nsproxy_namespaces+0xf6/0x210 kernel/nsproxy.c:234
 ksys_unshare+0x44f/0x980 kernel/fork.c:3298
 __do_sys_unshare kernel/fork.c:3364 [inline]
 __se_sys_unshare kernel/fork.c:3362 [inline]
 __ia32_sys_unshare+0x30/0x40 kernel/fork.c:3362
 do_syscall_32_irqs_on arch/x86/entry/syscall_32.c:79 [inline]
 __do_fast_syscall_32+0x14b/0x8c0 arch/x86/entry/syscall_32.c:282
 do_fast_syscall_32+0x32/0x70 arch/x86/entry/syscall_32.c:307
page last free pid 5501 tgid 5501 ts 24218447288 stack trace:
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
 kmem_cache_alloc_node_noprof+0x282/0x6e0 mm/slub.c:5105
 __alloc_skb+0x140/0x710 net/core/skbuff.c:705
 alloc_skb include/linux/skbuff.h:1390 [inline]
 alloc_skb_with_frags+0xdb/0x750 net/core/skbuff.c:6898
 sock_alloc_send_pskb+0x86a/0x9e0 net/core/sock.c:3093
 unix_dgram_sendmsg+0x3f4/0x1a80 net/unix/af_unix.c:2148
 unix_seqpacket_sendmsg+0x12a/0x1d0 net/unix/af_unix.c:2549
 sock_sendmsg_nosec net/socket.c:800 [inline]
 __sock_sendmsg net/socket.c:818 [inline]
 sock_write_iter+0x560/0x5d0 net/socket.c:1269
 do_iter_readv_writev+0x6f7/0x930 fs/read_write.c:828
 vfs_writev+0x360/0xdd0 fs/read_write.c:1058
 do_writev+0x28a/0x340 fs/read_write.c:1104
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x121/0x770 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffff888023601a80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888023601b00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff888023601b80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                                 ^
 ffff888023601c00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888023601c80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
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
