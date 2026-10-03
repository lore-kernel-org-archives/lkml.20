Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA36E2DF13F
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 11:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791028088; cv=none; b=JiY2P6KUrHk3VFgx6Q4le2pBEPVHBzraiMlWjHMi1BUV/s0gqODOqYZWqBmO7ks0GEJoKSmB1ycRoJUU13O6FNmbJ6hguP2dioNbm6Q6Zd0Sfook0KjGTqH+1wA0IbVc+O4I+m/963tTmhFX3CoYrGEa4r1Dfm/wp5SL3t2i0G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791028088; c=relaxed/simple;
	bh=8RzP9P40zxWfG+GRohn7rRgnGGyURri30+8I9ewE48E=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=L33p+ZYwrx/qWAMqVXjjsoTUzzgrnJJCWw7H73ceVQztXtZqnQt+5wijsOUHtiZzDgdYrMHwt8ALgNiVb3/3iilt6fAzRjyDhGkFzxpwAuWsFOf65x6vifC2mSbGPTT10X7cLo4TcUVTFkHmRerkjE5/5u+n7moxHjF64/bNp6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b28deb7ee3so58642b6e.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 04:48:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791028083; x=1791632883;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hzwrOO2X5b7R2BfcppMJ6NMMuxDDOh3AWZ1dEgDlU+Q=;
        b=loi4I9ub9mUJrVLtcbr83Li9G6hYD4DuIgv7hgIylxfA3RDqIf9BFebAYnlf56LiqZ
         qVxtdBkHMiJ6WesvMWKrTE4iIC/NhLQ1vSeYm3/zoULrLsNTPVNnLj7S1tKpD7H6QYkB
         1cCbzzYvL6+ZQTGRPtyvcrZG92ZTGamGZ1anIdHg1BxunKvqPVZETlQ69iH2PCIcEinp
         Q/F7T1yfPKQreuXBOKIflS8kQ/Gl5Q9klv583NaJS9nazV2rYWS+We6UPegcAa2f577C
         t++poFhOFRS3Hpz/WL4UBPj4MdWceH00GNi3ueENVwFmhWijpthcH9ZmM/ZPAxZ+7M4+
         rrYQ==
X-Gm-Message-State: AFuF++nsmE0ca+pYHfG1aqy+gRbvrVtXYnHU8bJfseONPVLpkjXYDzjF
	vX06KvhFA4gqrcYWpwJAC3WiNUYaBSuWm0WlNxtHnTcJLxCeIYZpBtPmNDKsq9mKMJoUooVr116
	ro0A7x4Jj0AQejUKzVL8xqO7AA+Kpwkf5g0PefhyYwyIDG0W+u7NtkO0cpLk=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:bd6:b0:4b9:a8ac:47c with SMTP id
 5614622812f47-4f52a26cb8bmr4634215b6e.26.1791028083068; Sat, 03 Oct 2026
 04:48:03 -0700 (PDT)
Date: Sat, 03 Oct 2026 04:48:03 -0700
In-Reply-To: <20261003110632.121743-1-nsvatoslav515@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac0eb73.34119e79.2f92f3.0014.GAE@google.com>
Subject: Re: [syzbot] [ecryptfs?] KASAN: slab-out-of-bounds Read in md5_blocks
From: syzbot <syzbot+46bbbe175b7eea8036b8@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, nsvatoslav515@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
KASAN: slab-use-after-free Read in ecryptfs_write_tag_70_packet

==================================================================
BUG: KASAN: slab-use-after-free in ecryptfs_write_tag_70_packet+0x1260/0x1300 fs/ecryptfs/keystore.c:740
Read of size 4 at addr ffff88802600c298 by task syz.0.17/6331

CPU: 0 UID: 0 PID: 6331 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/16/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description+0x55/0x1e0 mm/kasan/report.c:378
 print_report+0x58/0x70 mm/kasan/report.c:482
 kasan_report+0x117/0x150 mm/kasan/report.c:595
 ecryptfs_write_tag_70_packet+0x1260/0x1300 fs/ecryptfs/keystore.c:740
 ecryptfs_encrypt_filename fs/ecryptfs/crypto.c:1378 [inline]
 ecryptfs_encrypt_and_encode_filename+0x576/0x1580 fs/ecryptfs/crypto.c:1789
 ecryptfs_lookup+0x20e/0x780 fs/ecryptfs/inode.c:402
 lookup_one_qstr_excl+0x12d/0x360 fs/namei.c:1810
 __start_dirop fs/namei.c:2920 [inline]
 start_dirop fs/namei.c:2942 [inline]
 filename_create+0x20e/0x370 fs/namei.c:5103
 filename_mkdirat+0xd2/0x510 fs/namei.c:5449
 __do_sys_mkdirat fs/namei.c:5477 [inline]
 __se_sys_mkdirat+0x35/0x150 fs/namei.c:5474
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fb17ed9e159
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fb17fcc2028 EFLAGS: 00000246 ORIG_RAX: 0000000000000102
RAX: ffffffffffffffda RBX: 00007fb17f025fa0 RCX: 00007fb17ed9e159
RDX: 0000000000000080 RSI: 0000200000000100 RDI: 0000000000000003
RBP: 00007fb17ee3506b R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fb17f026038 R14: 00007fb17f025fa0 R15: 00007ffe3c5b3ec8
 </TASK>

Allocated by task 6330:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:409 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:426
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __do_kmalloc_node mm/slub.c:5531 [inline]
 __kmalloc_noprof+0x366/0x710 mm/slub.c:5556
 _kmalloc_noprof include/linux/slab.h:995 [inline]
 _kmalloc_array_noprof include/linux/slab.h:1211 [inline]
 security_inode_init_security+0x102/0x3e0 security/security.c:1386
 shmem_symlink+0xe0/0x4d0 mm/shmem.c:4269
 vfs_symlink+0x18e/0x330 fs/namei.c:5807
 filename_symlinkat+0x1cd/0x410 fs/namei.c:5832
 __do_sys_symlinkat fs/namei.c:5852 [inline]
 __se_sys_symlinkat+0x4e/0x2b0 fs/namei.c:5847
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 6330:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 kasan_save_free_info+0x40/0x50 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:264 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:296
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2780 [inline]
 slab_free mm/slub.c:6630 [inline]
 kfree+0x1c5/0x650 mm/slub.c:6923
 security_inode_init_security+0x34e/0x3e0 security/security.c:1413
 shmem_symlink+0xe0/0x4d0 mm/shmem.c:4269
 vfs_symlink+0x18e/0x330 fs/namei.c:5807
 filename_symlinkat+0x1cd/0x410 fs/namei.c:5832
 __do_sys_symlinkat fs/namei.c:5852 [inline]
 __se_sys_symlinkat+0x4e/0x2b0 fs/namei.c:5847
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff88802600c200
 which belongs to the cache kmalloc-256 of size 256
The buggy address is located 152 bytes inside of
 freed 256-byte region [ffff88802600c200, ffff88802600c300)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x2600c
head: order:1 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88813ff24b40 dead000000000100 dead000000000122
raw: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
head: 00fff00000000040 ffff88813ff24b40 dead000000000100 dead000000000122
head: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
head: 00fff00000000001 ffffffffffffff81 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000002
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 1, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 1, tgid 1 (swapper/0), ts 8442970623
 set_page_owner include/linux/page_owner.h:33 [inline]
 post_alloc_hook+0x1f9/0x250 mm/page_alloc.c:1854
 prep_new_page mm/page_alloc.c:1862 [inline]
 get_page_from_freelist+0x220f/0x2280 mm/page_alloc.c:3933
 __alloc_frozen_pages_noprof+0x1fc/0x400 mm/page_alloc.c:5471
 alloc_slab_page mm/slub.c:3384 [inline]
 allocate_slab+0x7d/0x5e0 mm/slub.c:3499
 new_slab mm/slub.c:3550 [inline]
 refill_objects+0x2d5/0x350 mm/slub.c:7539
 refill_sheaf mm/slub.c:2917 [inline]
 __pcs_replace_empty_main+0x2c8/0x6c0 mm/slub.c:4811
 alloc_from_pcs mm/slub.c:4887 [inline]
 slab_alloc_node mm/slub.c:5021 [inline]
 __kmalloc_cache_noprof+0x396/0x600 mm/slub.c:5676
 _kmalloc_noprof include/linux/slab.h:991 [inline]
 _kzalloc_noprof include/linux/slab.h:1312 [inline]
 bus_add_driver+0x19d/0x6e0 drivers/base/bus.c:755
 driver_register+0x23a/0x320 drivers/base/driver.c:174
 do_one_initcall+0x250/0x870 init/main.c:1360
 do_initcall_level+0x10a/0x1a0 init/main.c:1422
 do_initcalls+0x59/0xa0 init/main.c:1438
 kernel_init_freeable+0x29d/0x3e0 init/main.c:1673
 kernel_init+0x22/0x1d0 init/main.c:1563
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
page_owner free stack trace missing

Memory state around the buggy address:
 ffff88802600c180: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff88802600c200: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff88802600c280: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                            ^
 ffff88802600c300: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff88802600c380: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
==================================================================


Tested on:

commit:         f0406245 Add linux-next specific files for 20261002
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=16672ec9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=dfd189b706ddeebe
dashboard link: https://syzkaller.appspot.com/bug?extid=46bbbe175b7eea8036b8
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=13bad035580000

