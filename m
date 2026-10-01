Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB4B35E956
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 20:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790886005; cv=none; b=LDEXGwaQoDAoOrosvIQ6f2Osyzo5+e8AxN56IjG5ca1KgqwYgFPWZiHwh02s8hAJvArXBkuUrYcb4nHUB5534DIreWKIyGz04wWoMhNQ0a03G9YxHBL1+OT7z43enwthxjR0qwg/fSfaqcg1wsQdvh4TNTJD2ObbAOFSEz5tkW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790886005; c=relaxed/simple;
	bh=EvF3/XLJJguSdEWHKotcl/0Dc8wY3IIs882yRyJF2jQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=miqWSLgLNxw0E9VIAThFgC9Fju2B0qoz+Ul5ykSEUJP91e9C8NEtkYjaiRN2dnMHczlf3ZgISmvZC35kadlUJxzjTrKPtDG7kJ+3REDZdSrNoR8QtVIk9luaJW2jKOzny/1Drwvtb5Zc1ebz4JijBd6BwHUCOwRqQ9xVab2lxTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4ab8b4887d4so6393312b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 13:20:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790886002; x=1791490802;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WHQISUEeIMuvuiMw5JhdOShG4dNPcmCoAdnfnhHrmhM=;
        b=iJKcMxr1oW+eiOL1Oo5X1jfPfaComllXH8NCr8dQ/AHRiDqn0UjrUo0rERAM547KSY
         OJYKfbKYT1KHHdV5GgxnB9VtOEpH5nfF2XljKgV1DJqGozd7etEsXcDK0W8e1dBQ/b0H
         F9LZsMTJ7dZZZMpVbXTW7PR6ZOa3XLxxoMmX29F+RwTJknCPP8LBRx2DJ27zNaduGhlU
         b8XkD182BZ76s9Cf/VAC+4ecfOQB+APlHnmY8z5ZYZN+RuvvQKb/n4wMLrJ2Cri1A+mt
         YgRA8SkD5HblpnMYqnXMrJz1vEH3UOuMQLPm3znH7iFRLuKZsKyHOd7sFOwkck0ibSCC
         V3Xg==
X-Forwarded-Encrypted: i=1; AKwUvByRdTeFzYT77vxxXjUbsm7CJZDl/ENXVwq1HFa3vAE2zoy+fbwEwQthj+MO3mKHDruLF6lFH9czYSgEWn8=@vger.kernel.org
X-Gm-Message-State: AFuF++ll/GR4UyvJsNn2w8Y+S9WvgIij8WzbvOEcsahBQxQqjEGD4tag
	rvgTc1KVRsPYP9EZbBvB4wPx/M40Ju7IEoJ3elB637OeubWQOw8ZC4bHCEr0JuK1wlW49Njnfw5
	XjL0OSR9Dy3t6ZIpxnTYvSTx9m2EWT9rw4FPyj+ZMxqibjNCx9fEwyY2lrvk=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:ecb:b0:4f4:ff3b:371a with SMTP id
 5614622812f47-4f529a0b8bamr255126b6e.21.1790886002522; Thu, 01 Oct 2026
 13:20:02 -0700 (PDT)
Date: Thu, 01 Oct 2026 13:20:02 -0700
In-Reply-To: <20261001194805.1254701-1-adrianox@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6abec072.eb639fcc.2b981.0002.GAE@google.com>
Subject: Re: [syzbot] [ext4?] KASAN: slab-use-after-free Write in do_split
From: syzbot <syzbot+09bec78ee77613a3efdd@syzkaller.appspotmail.com>
To: adrianox@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
KASAN: slab-out-of-bounds Write in do_split

==================================================================
BUG: KASAN: slab-out-of-bounds in dx_move_dirents fs/ext4/namei.c:1863 [inline]
BUG: KASAN: slab-out-of-bounds in do_split+0xf9c/0x1de0 fs/ext4/namei.c:2012
Write of size 90458 at addr ffff888032276c6e by task syz.0.77/6895
Write of size 90458 at addr ffff888032276c6e by task syz.0.77/6895

CPU: 1 UID: 0 PID: 6895 Comm: syz.0.77 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/16/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description+0x55/0x1e0 mm/kasan/report.c:378
 print_report+0x58/0x70 mm/kasan/report.c:482
 kasan_report+0x117/0x150 mm/kasan/report.c:595
 check_region_inline mm/kasan/generic.c:-1 [inline]
 kasan_check_range+0x264/0x2c0 mm/kasan/generic.c:200
 __asan_memset+0x22/0x50 mm/kasan/shadow.c:84
 dx_move_dirents fs/ext4/namei.c:1863 [inline]
 do_split+0xf9c/0x1de0 fs/ext4/namei.c:2012
 make_indexed_dir+0xdab/0x1360 fs/ext4/namei.c:2347
 __ext4_add_entry+0x1e77/0x1ff0 fs/ext4/namei.c:2451
 ext4_add_entry fs/ext4/namei.c:2488 [inline]
 ext4_rename fs/ext4/namei.c:3958 [inline]
 ext4_rename2+0x1f71/0x3270 fs/ext4/namei.c:4237
 vfs_rename+0xbd9/0xef0 fs/namei.c:6208
 filename_renameat2+0x533/0x9b0 fs/namei.c:6326
 __do_sys_rename fs/namei.c:6370 [inline]
 __se_sys_rename+0x55/0x2c0 fs/namei.c:6366
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fb2e4cce159
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fb2e430d028 EFLAGS: 00000246 ORIG_RAX: 0000000000000052
RAX: ffffffffffffffda RBX: 00007fb2e4f56090 RCX: 00007fb2e4cce159
RDX: 0000000000000000 RSI: 0000200000000780 RDI: 0000200000000100
RBP: 00007fb2e4d6506b R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fb2e4f56128 R14: 00007fb2e4f56090 R15: 00007ffd63540a48
 </TASK>

The buggy address belongs to the physical page:
page: refcount:2 mapcount:0 mapping:ffff8880235f7420 index:0x8 pfn:0x32276
memcg:ffff88801c2dc200
aops:def_blk_aops ino:700000 dentry name(?):""
flags: 0x8000000000493c(referenced|uptodate|dirty|lru|active|owner_2|private|node=0|zone=1)
raw: 008000000000493c ffffea0000c5ca88 ffff88801aed5ff8 ffff8880235f7420
raw: 0000000000000008 ffff88804e147240 00000002ffffffff ffff88801c2dc200
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0x152c40(GFP_NOFS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_HARDWALL), pid 6830, tgid 6830 (udevd), ts 205206771286
 set_page_owner include/linux/page_owner.h:33 [inline]
 post_alloc_hook+0x1f9/0x250 mm/page_alloc.c:1871
 prep_new_page mm/page_alloc.c:1879 [inline]
 get_page_from_freelist+0x2591/0x2600 mm/page_alloc.c:3943
 __alloc_frozen_pages_noprof+0x230/0x5c0 mm/page_alloc.c:5436
 alloc_pages_mpol+0xd4/0x280 mm/mempolicy.c:2486
 alloc_frozen_pages_noprof mm/mempolicy.c:2557 [inline]
 alloc_pages_noprof+0xd2/0x2f0 mm/mempolicy.c:2577
 folio_alloc_noprof+0x22/0xc0 mm/mempolicy.c:2587
 filemap_alloc_folio_noprof+0x111/0x4c0 mm/filemap.c:1019
 ractl_alloc_folio mm/readahead.c:200 [inline]
 page_cache_ra_unbounded+0x2d6/0x8f0 mm/readahead.c:288
 do_page_cache_ra mm/readahead.c:348 [inline]
 force_page_cache_ra+0x26f/0x2e0 mm/readahead.c:378
 filemap_get_pages+0x493/0x1e80 mm/filemap.c:2714
 filemap_read+0x429/0x11e0 mm/filemap.c:2824
 blkdev_read_iter+0x2f8/0x430 block/fops.c:832
 new_sync_read fs/read_write.c:493 [inline]
 vfs_read+0x59e/0xa90 fs/read_write.c:574
 ksys_read+0x156/0x270 fs/read_write.c:716
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
page last free pid 20 tgid 20 ts 205159236283 stack trace:
 reset_page_owner include/linux/page_owner.h:26 [inline]
 __free_pages_prepare mm/page_alloc.c:1418 [inline]
 __free_frozen_pages+0xf8e/0x1070 mm/page_alloc.c:2962
 __tlb_remove_table_free mm/mmu_gather.c:228 [inline]
 tlb_remove_table_rcu+0x85/0x100 mm/mmu_gather.c:291
 rcu_do_batch kernel/rcu/tree.c:2650 [inline]
 rcu_core kernel/rcu/tree.c:2919 [inline]
 rcu_cpu_kthread+0xb2c/0x1740 kernel/rcu/tree.c:3007
 smpboot_thread_fn+0x565/0xa70 kernel/smpboot.c:160
 kthread+0x38b/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Memory state around the buggy address:
 ffff888032276f00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffff888032276f80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>ffff888032277000: 00 00 fc fc 00 04 fc fc fa fb fc fc 00 05 fc fc
                         ^
 ffff888032277080: fa fb fc fc fa fb fc fc 00 00 fc fc 00 00 fc fc
 ffff888032277100: fa fb fc fc fa fb fc fc 00 00 fc fc fa fb fc fc
==================================================================


Tested on:

commit:         d24e8ac7 Merge tag 'net-7.3-rc6' of git://git.kernel.o..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1269c725580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=718e346eb0b8f38
dashboard link: https://syzkaller.appspot.com/bug?extid=09bec78ee77613a3efdd
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=12dec725580000

