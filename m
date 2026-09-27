Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6E729D288
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 02:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790475280; cv=none; b=HyQUlrJhCAeJGfVuaUgg0B/UH77xYTuXg7YAdg1NWx5pzJYNYtO1XHjiNVCpsybzXBiP/bNhbkncUcBepYgdrekOHAfrcYngFZZL78LBkorhEh5ap6vWu6jm8rha1okzy/fHp6tDP98h+GiEXWdNIzf6TfISHoExlAaK7sHWiDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790475280; c=relaxed/simple;
	bh=0vtOAAvvSEQYRQN/I/I1QT1BRH73Mqm7/0e+U2zSS/s=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=e9OTpFWNVw4fPj+DktukxQC6g506uUU5FngekCb02pjuiO3ihyN+QZkGT1ydHS0w4VVU3UKX1daY5N8o3AIElOJwp7hd9a4rtEpP4bVaWmfCtJSiijfu80uLtnqZZLiE9Qez/pahyc9q6uy6Xn2KF0hCrndZgWRWdXnOpynDh5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4a41f46d629so3781844b6e.3
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 19:14:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790475277; x=1791080077;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JVvyfRdZzZXGWfCHa8xWpQZCMkGUrRnfRBX6R0hOcjE=;
        b=Lc8P6wz90es9VTptLlTJLiNtKSU/cueScVf5TM/9LWObI8QjEG6Zal49xKlkNO+9T4
         bGIKWAkylasclfrd7xTgM/HZD38bYd2DLQG27DMbC8hihmJ/GqgCimidNVL8Ovmlh6Ah
         hDIaLYOUmANBKKj6mKSHpjoefSyxCUn8dPWGpQxclSA3X+PTUCW+crJ5ntd5JuVpCDSo
         CiNihdr/fJYzUFGRk/MScUCC2uXo1/WAvwWF0a42A1NkTFfqUomXy4GvlyaJPLBR7p2C
         jalvIRFADP9ie697PnAxoPxDw0MMHgB1xHSMpeZufz5sTaF4fFLQKj5Bj0zyFVbqaxaH
         NiOw==
X-Forwarded-Encrypted: i=1; AKwUvBxbCjlsQfnBYxarhD52JTWdQiGbHVzuZ+vL69dBzs/iOVot+ad/LrL2YZiXpqnEoKc7v06VS2SY9JdZ/1g=@vger.kernel.org
X-Gm-Message-State: AFuF++l1+/1fkibhiG8dBHL7VpfdPHGUsBpP8p7D1h5lsmNUHaxiJuN+
	17zSlA5Pp7WOsHTjLgVT6MfXNKmFqh3cuQajyjpslBjT+ph0Dw3bv3vCTkbpRXkfBDxXPtwK+fZ
	PVgl4HONk2hppB3/42fLw+WnIDHyIQKY2ySfMbfyJFkk0Ui3M0m7LXxI/g1Y=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1919:b0:4d6:9153:2963 with SMTP id
 5614622812f47-4d72b733900mr12165050b6e.52.1790475276885; Sat, 26 Sep 2026
 19:14:36 -0700 (PDT)
Date: Sat, 26 Sep 2026 19:14:36 -0700
In-Reply-To: <6a8af6b0.ae6ddae5.3da009.0066.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab87c0c.dc2998a4.2261f5.005c.GAE@google.com>
Subject: Re: [syzbot] [jffs2?] KASAN: invalid-free in jffs2_free_inode
From: syzbot <syzbot+675e84fdf3dde67b4946@syzkaller.appspotmail.com>
To: dwmw2@infradead.org, kartikey406@gmail.com, kees@kernel.org, 
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, richard@nod.at, 
	syzkaller-bugs@googlegroups.com, viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    f5f84daefcd9 Add linux-next specific files for 20260925
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=10f35a05580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=be00179930e43a43
dashboard link: https://syzkaller.appspot.com/bug?extid=675e84fdf3dde67b4946
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17b49315580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16e12605580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/e42cbc7060af/disk-f5f84dae.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/e80a7ee494ac/vmlinux-f5f84dae.xz
kernel image: https://storage.googleapis.com/syzbot-assets/f41cc55a1308/bzImage-f5f84dae.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+675e84fdf3dde67b4946@syzkaller.appspotmail.com

RSP: 002b:00007ffed613c038 EFLAGS: 00000246 ORIG_RAX: 000000000000010a
RAX: ffffffffffffffda RBX: 00007fa9e1225fa0 RCX: 00007fa9e0f9e159
RDX: 0000200000000080 RSI: ffffffffffffff9c RDI: 0000200000000000
RBP: 00007ffed613c0a0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000001
R13: 00007fa9e1225fac R14: 00007fa9e1225fa0 R15: 00007fa9e1225fa0
 </TASK>
==================================================================
BUG: KASAN: double-free in jffs2_free_inode+0x41/0x60 fs/jffs2/super.c:52
Free of addr ffff8880216a6380 by task syz.0.224/6314

CPU: 0 UID: 0 PID: 6314 Comm: syz.0.224 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/16/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description+0x55/0x1e0 mm/kasan/report.c:378
 print_report+0x58/0x70 mm/kasan/report.c:482
 kasan_report_invalid_free+0xea/0x110 mm/kasan/report.c:557
 check_slab_allocation mm/kasan/common.c:-1 [inline]
 __kasan_slab_pre_free+0x104/0x120 mm/kasan/common.c:272
 kasan_slab_pre_free include/linux/kasan.h:199 [inline]
 slab_free_hook mm/slub.c:2725 [inline]
 slab_free mm/slub.c:6630 [inline]
 kfree+0x173/0x650 mm/slub.c:6923
 jffs2_free_inode+0x41/0x60 fs/jffs2/super.c:52
 i_callback fs/inode.c:318 [inline]
 alloc_inode+0x17c/0x1b0 fs/inode.c:353
 iget_locked+0x12c/0x690 fs/inode.c:1473
 jffs2_iget+0xac/0xcc0 fs/jffs2/fs.c:265
 jffs2_lookup+0x377/0x430 fs/jffs2/dir.c:114
 lookup_one_qstr_excl+0x12d/0x360 fs/namei.c:1810
 __start_dirop fs/namei.c:2920 [inline]
 start_dirop fs/namei.c:2942 [inline]
 filename_create+0x20e/0x370 fs/namei.c:5101
 filename_symlinkat+0xf7/0x410 fs/namei.c:5824
 __do_sys_symlinkat fs/namei.c:5850 [inline]
 __se_sys_symlinkat+0x4e/0x2b0 fs/namei.c:5845
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fa9e0f9e159
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffed613c038 EFLAGS: 00000246 ORIG_RAX: 000000000000010a
RAX: ffffffffffffffda RBX: 00007fa9e1225fa0 RCX: 00007fa9e0f9e159
RDX: 0000200000000080 RSI: ffffffffffffff9c RDI: 0000200000000000
RBP: 00007ffed613c0a0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000001
R13: 00007fa9e1225fac R14: 00007fa9e1225fa0 R15: 00007fa9e1225fa0
 </TASK>

Allocated by task 6042:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:409 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:426
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __do_kmalloc_node mm/slub.c:5531 [inline]
 __kmalloc_noprof+0x366/0x710 mm/slub.c:5556
 _kmalloc_noprof include/linux/slab.h:995 [inline]
 jffs2_do_read_inode_internal+0x4d11/0x6790 fs/jffs2/readinode.c:1271
 jffs2_do_read_inode+0x4b4/0x6a0 fs/jffs2/readinode.c:1389
 jffs2_iget+0x228/0xcc0 fs/jffs2/fs.c:277
 jffs2_lookup+0x377/0x430 fs/jffs2/dir.c:114
 lookup_one_qstr_excl+0x12d/0x360 fs/namei.c:1810
 __start_dirop fs/namei.c:2920 [inline]
 start_dirop fs/namei.c:2942 [inline]
 filename_create+0x20e/0x370 fs/namei.c:5101
 filename_symlinkat+0xf7/0x410 fs/namei.c:5824
 __do_sys_symlinkat fs/namei.c:5850 [inline]
 __se_sys_symlinkat+0x4e/0x2b0 fs/namei.c:5845
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 15:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 kasan_save_free_info+0x40/0x50 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:264 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:296
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2780 [inline]
 slab_free mm/slub.c:6630 [inline]
 kfree+0x1c5/0x650 mm/slub.c:6923
 jffs2_free_inode+0x41/0x60 fs/jffs2/super.c:52
 rcu_do_batch kernel/rcu/tree.c:2650 [inline]
 rcu_core+0x926/0x1260 kernel/rcu/tree.c:2919
 handle_softirqs+0x223/0x840 kernel/softirq.c:645
 run_ksoftirqd+0x36/0x60 kernel/softirq.c:1099
 smpboot_thread_fn+0x565/0xa70 kernel/smpboot.c:160
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

The buggy address belongs to the object at ffff8880216a6380
 which belongs to the cache kmalloc-8 of size 8
The buggy address is located 0 bytes inside of
 8-byte region [ffff8880216a6380, ffff8880216a6388)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffff8880216a6a60 pfn:0x216a6
flags: 0xfff00000000200(workingset|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000200 ffff88813ff24500 ffffea0000adf290 ffffea0000adaf50
raw: ffff8880216a6a60 000000000080004e 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0xd2cc0(GFP_KERNEL|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 1, tgid 1 (swapper/0), ts 3479526280
 set_page_owner include/linux/page_owner.h:33 [inline]
 post_alloc_hook+0x1f9/0x250 mm/page_alloc.c:1854
 prep_new_page mm/page_alloc.c:1862 [inline]
 get_page_from_freelist+0x2209/0x2280 mm/page_alloc.c:3933
 __alloc_frozen_pages_noprof+0x1fc/0x400 mm/page_alloc.c:5441
 alloc_slab_page mm/slub.c:3384 [inline]
 allocate_slab+0x7d/0x5e0 mm/slub.c:3499
 new_slab mm/slub.c:3550 [inline]
 refill_objects+0x2d5/0x350 mm/slub.c:7539
 refill_sheaf mm/slub.c:2917 [inline]
 __pcs_replace_empty_main+0x2c8/0x6c0 mm/slub.c:4811
 alloc_from_pcs mm/slub.c:4887 [inline]
 slab_alloc_node mm/slub.c:5021 [inline]
 __do_kmalloc_node mm/slub.c:5530 [inline]
 __kmalloc_noprof+0x476/0x710 mm/slub.c:5556
 _kmalloc_noprof include/linux/slab.h:995 [inline]
 acpi_ex_allocate_name_string+0x79/0x290 drivers/acpi/acpica/exnames.c:66
 acpi_ex_get_name_string+0x488/0xa90 drivers/acpi/acpica/exnames.c:367
 acpi_ds_create_operand+0x5c7/0xbe0 drivers/acpi/acpica/dsutils.c:446
 acpi_ds_evaluate_name_path+0x1a5/0x460 drivers/acpi/acpica/dsutils.c:778
 acpi_ds_exec_end_op+0x28b/0x1b00 drivers/acpi/acpica/dswexec.c:374
 acpi_ps_parse_loop+0xfa3/0x23f0 drivers/acpi/acpica/psloop.c:553
 acpi_ps_parse_aml+0x388/0x1020 drivers/acpi/acpica/psparse.c:489
 acpi_ps_execute_method+0x89d/0xa70 drivers/acpi/acpica/psxface.c:190
 acpi_ns_evaluate+0xd05/0x1320 drivers/acpi/acpica/nseval.c:205
page last free pid 1 tgid 1 ts 3320811456 stack trace:
 reset_page_owner include/linux/page_owner.h:26 [inline]
 __free_pages_prepare mm/page_alloc.c:1401 [inline]
 __free_frozen_pages+0xc93/0xd90 mm/page_alloc.c:2952
 __slab_free+0x269/0x2c0 mm/slub.c:5926
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x99/0x100 mm/kasan/quarantine.c:179
 kasan_quarantine_remove_cache+0x35d/0x380 mm/kasan/quarantine.c:388
 kmem_cache_shrink+0xd/0x20 mm/slab_common.c:611
 acpi_os_purge_cache+0x15/0x20 drivers/acpi/osl.c:1622
 acpi_purge_cached_objects+0xac/0x100 drivers/acpi/acpica/utxface.c:239
 acpi_initialize_objects+0x2e/0xb0 drivers/acpi/acpica/utxfinit.c:250
 acpi_bus_init+0xa8/0x360 drivers/acpi/bus.c:1397
 acpi_init+0xa1/0x1f0 drivers/acpi/bus.c:1486
 do_one_initcall+0x250/0x870 init/main.c:1360
 do_initcall_level+0x10a/0x1a0 init/main.c:1422
 do_initcalls+0x59/0xa0 init/main.c:1438
 kernel_init_freeable+0x29d/0x3e0 init/main.c:1673
 kernel_init+0x22/0x1d0 init/main.c:1563
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158

Memory state around the buggy address:
 ffff8880216a6280: fa fc fc fc fa fc fc fc fa fc fc fc fa fc fc fc
 ffff8880216a6300: fa fc fc fc fa fc fc fc fa fc fc fc fa fc fc fc
>ffff8880216a6380: fa fc fc fc fa fc fc fc fa fc fc fc fa fc fc fc
                   ^
 ffff8880216a6400: fa fc fc fc fa fc fc fc 05 fc fc fc 05 fc fc fc
 ffff8880216a6480: 05 fc fc fc 05 fc fc fc 06 fc fc fc 06 fc fc fc
==================================================================


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
