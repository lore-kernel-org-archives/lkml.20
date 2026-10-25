Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792891206;
	b=vPDcPzK7MRLz6xRTztkWo0PNKCC87PyVQmRd5PfSHyw4bU61RIT39J+94jtY7AzRzCxq
	 ARsUwlMKNip7k8cyJAeceV1Z3rAF/v9/zyOZ8zLfbANT+bA36tYv7KgH60ZfxP7D6YJ2Y
	 vS8ur9jLTAx4ORyr6qkSjMOeLf2K6F5twWVAwP6SVrfGwiRVLmwwVxvR8wma0NxgiaKPy
	 VMVTMsLmSTtruolBbVgR5JuMMC43+iPQJMdNebZSIU5vOWXwOacq+38cIKIqkOtMM+NI9
	 VnO9ueNhbON5A65C2fxtUfpI7QsyOynnhVfkFB75Qg/+VwqObXtaSKPx3oxqhEovPTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792891206;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=Fi+ijDq1Mg1llE2oxXd3mCn+/cAVsBD2tELJliTiq+o=;
	b=uWa3JpgGghIr47DX25Pk20HRV7cs/gj31WlA9mcvJO4k/wpJldiZ6GzyxTEl2AVXOJbX
	 3L276L4DIoMAaZCh4PcrAq0SUU/CvB8VBn18wYcPz35iUNGTBDduRDovn63MwLU918VcT
	 VTg7mSde7Yp+VvO0/bvwDv6QHg7DrpaxWGcGiqnbiVLaaQg8o5ClbomdVuIpv+Gtz5nkq
	 437OsMiznhRbbMdwewwEJb2nDSis6DN8ILnsobTG8vCZN9uekBlEOa8QQtWFCqZIln+wn
	 V006RTdRFaY68h4XEeqn97f2SOosEs5DOicS9aPu8+az+n4Ux6vMZFJdcM9InTDF8DQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9890D606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 01:20:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9890D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4a45b3f0bdfso3289140b6e.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 18:20:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792891204; x=1793496004;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Fi+ijDq1Mg1llE2oxXd3mCn+/cAVsBD2tELJliTiq+o=;
        b=bXSTLXZZlkEYyAFPh9jPTLYXxy1DvARVxhAOILgCgeuxiXA1CNbvzB2jESH5jhXNom
         eII8+DeSWmYROZ/XedvkYmDfL0EyULnkeRrCzoP0uc0rBtmK1OlgIZPdU0wn9ayHHmf0
         ixwDXMeT4QK+/scPwVR/Ozz/f2yX0WM6AqEgTcNeJK6+CjdmekGAvD7xmuw50AhW9LDU
         OGvCjL7YrWMe99hc2Us2EcoM1iiPPob0Gq5oS1xBgIpmJYW6uwOKShJak6HBSlySUx52
         ftAwEWG7MthinBbmZgJKT/nrv+EQ158HWxCyNnDgYe6Z7faDA4fUtbNy4T9x0nl87vyS
         FcuQ==
X-Forwarded-Encrypted: i=1; AKwUvBzjgtI+o9R6hR8zTSSqRozfGW7cugAd+YATOQ5O7iseZ2UAVcLtEA87ckQ1fAISOeXgVdP3jhgjTY4lS0w=@vger.kernel.org
X-Gm-Message-State: AFq9FYJFiWsj6F+nsao0dqolXlRPATcLaTuOqhrLFLG9F4PxkJuOB10c
	apqMqdqAZ0VTj8iU54emRZWalwavemMNtyAZsdeTjaxEWMLvlLpjxjJIc2w5ccJXYkuf5+t2WuZ
	AnvM0AULj2QCCy08zjMtkdEv8mwnQjxhu0O1Eaguyk1VCZnucQB0ZrPUzsyI=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c1b4:b0:4f4:6c04:8ac2 with SMTP id
 5614622812f47-55c0026230fmr2137822b6e.10.1792891204616; Sat, 24 Oct 2026
 18:20:04 -0700 (PDT)
Date: Sat, 24 Oct 2026 18:20:04 -0700
In-Reply-To: <20261025010125.1085-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6add5944.a6443767.132891.000a.GAE@google.com>
Subject: Re: [syzbot] [dm?] KASAN: slab-use-after-free Read in snapshot_ctr
From: syzbot <syzbot+8e6fc64255334ccf3ab3@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
KASAN: slab-use-after-free Read in snapshot_ctr

==================================================================
BUG: KASAN: slab-use-after-free in snapshot_ctr+0x5cb/0x1370 drivers/md/dm-snap.c:1282
Read of size 8 at addr ffff88801388a898 by task syz.0.17/5914

CPU: 0 UID: 0 PID: 5914 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description+0x55/0x1e0 mm/kasan/report.c:378
 print_report+0x58/0x70 mm/kasan/report.c:482
 kasan_report+0x117/0x150 mm/kasan/report.c:595
 snapshot_ctr+0x5cb/0x1370 drivers/md/dm-snap.c:1282
 dm_table_add_target+0x58d/0xc70 drivers/md/dm-table.c:749
 populate_table drivers/md/dm-ioctl.c:1602 [inline]
 table_load+0x325/0x8a0 drivers/md/dm-ioctl.c:1645
 ctl_ioctl drivers/md/dm-ioctl.c:2221 [inline]
 dm_ctl_ioctl+0x9ec/0xe10 drivers/md/dm-ioctl.c:2243
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f5604b9f559
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f5605b42028 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f5604e25fa0 RCX: 00007f5604b9f559
RDX: 0000200000001640 RSI: 00000000c138fd09 RDI: 0000000000000003
RBP: 00007f5604c36b20 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f5604e26038 R14: 00007f5604e25fa0 R15: 00007ffe1ba2cfd8
 </TASK>

Allocated by task 5914:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:409 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:426
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __kmalloc_cache_node_noprof+0x3d1/0x620 mm/slub.c:5582
 _kmalloc_node_noprof include/linux/slab.h:1196 [inline]
 open_table_device drivers/md/dm.c:733 [inline]
 dm_get_table_device+0x23e/0x740 drivers/md/dm.c:821
 dm_get_device+0x327/0x750 drivers/md/dm-table.c:388
 snapshot_ctr+0x2b2/0x1370 drivers/md/dm-snap.c:1267
 dm_table_add_target+0x58d/0xc70 drivers/md/dm-table.c:749
 populate_table drivers/md/dm-ioctl.c:1602 [inline]
 table_load+0x325/0x8a0 drivers/md/dm-ioctl.c:1645
 ctl_ioctl drivers/md/dm-ioctl.c:2221 [inline]
 dm_ctl_ioctl+0x9ec/0xe10 drivers/md/dm-ioctl.c:2243
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 5914:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 kasan_save_free_info+0x40/0x50 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:264 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:296
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2748 [inline]
 slab_free mm/slub.c:6509 [inline]
 kfree+0x1c5/0x650 mm/slub.c:6802
 close_table_device drivers/md/dm.c:798 [inline]
 dm_put_table_device+0x255/0x2a0 drivers/md/dm.c:841
 upgrade_mode drivers/md/dm-table.c:326 [inline]
 dm_get_device+0x567/0x750 drivers/md/dm-table.c:399
 snapshot_ctr+0x471/0x1370 drivers/md/dm-snap.c:1277
 dm_table_add_target+0x58d/0xc70 drivers/md/dm-table.c:749
 populate_table drivers/md/dm-ioctl.c:1602 [inline]
 table_load+0x325/0x8a0 drivers/md/dm-ioctl.c:1645
 ctl_ioctl drivers/md/dm-ioctl.c:2221 [inline]
 dm_ctl_ioctl+0x9ec/0xe10 drivers/md/dm-ioctl.c:2243
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff88801388a880
 which belongs to the cache kmalloc-96 of size 96
The buggy address is located 24 bytes inside of
 freed 96-byte region [ffff88801388a880, ffff88801388a8e0)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x1388a
flags: 0xfff00000000000(node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000000 ffff88801c041280 dead000000000100 dead000000000122
raw: 0000000000000000 0000000000200020 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0x252800(GFP_NOWAIT|__GFP_NORETRY|__GFP_COMP|__GFP_THISNODE), pid 5850, tgid 5850 (syz-executor), ts 160176372736
 set_page_owner include/linux/page_owner.h:33 [inline]
 post_alloc_hook+0x1f9/0x250 mm/page_alloc.c:1871
 prep_new_page mm/page_alloc.c:1879 [inline]
 get_page_from_freelist+0x2209/0x2280 mm/page_alloc.c:3943
 __alloc_pages_slowpath+0x3f9/0xec0 mm/page_alloc.c:4884
 __alloc_frozen_pages_noprof+0x3f3/0x5a0 mm/page_alloc.c:5449
 alloc_slab_page mm/slub.c:3347 [inline]
 allocate_slab+0x7d/0x620 mm/slub.c:3462
 new_slab mm/slub.c:3513 [inline]
 ___slab_alloc+0x16a/0x960 mm/slub.c:4568
 slab_alloc_node mm/slub.c:4987 [inline]
 __kmalloc_cache_node_noprof+0x1db/0x620 mm/slub.c:5578
 _kmalloc_node_noprof include/linux/slab.h:1196 [inline]
 alloc_node_nr_active kernel/workqueue.c:5079 [inline]
 __alloc_workqueue+0x746/0x1fe0 kernel/workqueue.c:5974
 alloc_workqueue_va kernel/workqueue.c:6033 [inline]
 alloc_workqueue_noprof+0xe3/0x210 kernel/workqueue.c:6049
 ieee80211_register_hw+0x368f/0x4b00 net/mac80211/main.c:1523
 mac80211_hwsim_new_radio+0x3258/0x56b0 drivers/net/wireless/virtual/mac80211_hwsim_main.c:6143
 hwsim_new_radio_nl+0xd8b/0xf90 drivers/net/wireless/virtual/mac80211_hwsim_main.c:6966
 genl_family_rcv_msg_doit+0x233/0x340 net/netlink/genetlink.c:1114
 genl_family_rcv_msg net/netlink/genetlink.c:1194 [inline]
 genl_rcv_msg+0x614/0x7a0 net/netlink/genetlink.c:1209
 netlink_rcv_skb+0x226/0x4a0 net/netlink/af_netlink.c:2579
 genl_rcv+0x28/0x40 net/netlink/genetlink.c:1218
page last free pid 5899 tgid 5899 ts 159580482965 stack trace:
 reset_page_owner include/linux/page_owner.h:26 [inline]
 __free_pages_prepare mm/page_alloc.c:1418 [inline]
 __free_frozen_pages+0xc93/0xd90 mm/page_alloc.c:2962
 __slab_free+0x274/0x2c0 mm/slub.c:5823
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x99/0x100 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x148/0x160 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x22/0x80 mm/kasan/common.c:361
 kasan_slab_alloc include/linux/kasan.h:253 [inline]
 slab_post_alloc_hook mm/slub.c:4683 [inline]
 slab_alloc_node mm/slub.c:4996 [inline]
 kmem_cache_alloc_noprof+0x2b9/0x600 mm/slub.c:5010
 vm_area_alloc+0x24/0x140 mm/vma_init.c:36
 __mmap_new_vma mm/vma.c:2671 [inline]
 __mmap_region mm/vma.c:2904 [inline]
 mmap_region+0x13d6/0x25b0 mm/vma.c:2989
 do_mmap+0xe0a/0x1300 mm/mmap.c:573
 vm_mmap_pgoff+0x272/0x4e0 mm/util.c:581
 ksys_mmap_pgoff+0x4dc/0x760 mm/mmap.c:619
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffff88801388a780: 00 00 00 00 00 00 00 00 00 00 00 fc fc fc fc fc
 ffff88801388a800: 00 00 00 00 00 00 00 00 00 00 00 fc fc fc fc fc
>ffff88801388a880: fa fb fb fb fb fb fb fb fb fb fb fb fc fc fc fc
                            ^
 ffff88801388a900: 00 00 00 00 00 00 00 00 00 fc fc fc fc fc fc fc
 ffff88801388a980: 00 00 00 00 00 00 00 00 00 00 00 fc fc fc fc fc
==================================================================


Tested on:

commit:         f47d2236 Merge tag 'vfs-7.4-rc1.sync_close' of git://g..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=1093470d580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=97e47414c855a3d8
dashboard link: https://syzkaller.appspot.com/bug?extid=8e6fc64255334ccf3ab3
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=12f7d931580000

