Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB604BA1C2
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 15:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791213163; cv=none; b=dfYNTI9MCvRfrxzHe9BDDEOAg8MS8sO7BNS7J2H+9DO3vB1rrb7IHQqlZQSG1pguxkHrYJaQ7UzqhF97vdozm8RP9NrN/hE8YgFG5IHxg68Y41nxJYUdgsIWJrAjtJiu4QY5mD0GYc+FEafXUzU0f3hZOVYOYC7tc+Nk0igTdYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791213163; c=relaxed/simple;
	bh=sRwuXzFrOj9GTYRKq1oMrzs2OTcp8ueFo5NTbNnZrkg=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=a3dhDoPTqphUKTw6iNyB5Un3IXMYuSAKKluS9sRaFruAUF+8Xxzv5wx+h293bk7lgz7qWIy192P+ooSUBmbAF6iL+qKQQAq3AzVCQMkuQrSJqqsreBijLwfNcMwchUGD+ky6OaDMv/PTkauCRv14fRJ86F7Q0Adfok3bEfsWE9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4cc89e86e4dso3085160b6e.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 08:12:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791213159; x=1791817959;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oJGuor84k7kD9O1ss7s+t5q8iHTV+u3ikcKa79mzfTY=;
        b=SiLU3Q5tXCK2AJBz1URaTKkcHP0rnOTqBMKBGSFuGY61BWgr8dPjxLiTJzk20ek1oH
         1pf0SxkRKP/IDGbK0evxpnJr0MptntjgFGX2lhB0Yfm66PCLTjzyXumCbJjzky4OBw7Q
         3gr24GIdyBqfFjql2MfmfIvRaTIJfjbbkYWFAJ6PM7PeNF6ceNmgbjHDiv75C4BIDkre
         jh7nYB6yys8PgXtMvhNfc4B0UUalI4H9rtlyCjjKuyMsx80Qzxkya5xZBXc0MTB3LamB
         aek/tIexKZ+iWcx4CZJgFTzbo7xqs+sUNB6ne35atwp6vvWOb2gGSC5LuLqVL6xsvg2E
         8rag==
X-Gm-Message-State: AFuF++mkqWtvwD0rNbJwBkY9khzd8jXHp6X+24hoUIJu2fz/2vHA2KaE
	G7q1KlJYfktiw4hPxcgcVn3nWM9Sx6NLwVT0ocCzePqEUPa7tqn1TtNOOA0FtrQOaHyWiLS89s/
	ncbICN2jZLNfi31mBfzjMhLAfvEsJQjtb2TjByqRj2ue70JM7OSE0U76wC0A=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1484:b0:4f5:1cd4:d2be with SMTP id
 5614622812f47-4f52376db18mr10429500b6e.0.1791213159668; Mon, 05 Oct 2026
 08:12:39 -0700 (PDT)
Date: Mon, 05 Oct 2026 08:12:39 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac3be67.34119e79.2f92f3.0035.GAE@google.com>
Subject: [syzbot] KASAN: slab-out-of-bounds Write in utf32_to_utf8
From: syzbot <syzbot+a2748ba908c108e7e525@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    a90ee4305c4a Linux 7.3-rc6
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=1407a835580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=341a98f91c13ec9
dashboard link: https://syzkaller.appspot.com/bug?extid=a2748ba908c108e7e525
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1207a835580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+a2748ba908c108e7e525@syzkaller.appspotmail.com

loop0: detected capacity change from 0 to 8388608
==================================================================
BUG: KASAN: slab-out-of-bounds in utf32_to_utf8+0x24d/0x3d0 fs/nls/nls_base.c:111
Write of size 1 at addr ffff888039ad7000 by task syz-executor304/5946

CPU: 1 UID: 0 PID: 5946 Comm: syz-executor304 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/16/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description+0x55/0x1e0 mm/kasan/report.c:378
 print_report+0x58/0x70 mm/kasan/report.c:482
 kasan_report+0x117/0x150 mm/kasan/report.c:595
 utf32_to_utf8+0x24d/0x3d0 fs/nls/nls_base.c:111
 uni2char+0x35/0xa0 fs/nls/nls_utf8.c:21
 jfs_strfromUCS_le+0xd2/0x3d0 fs/jfs/jfs_unicode.c:31
 jfs_readdir+0x16fd/0x33f0 fs/jfs/jfs_dtree.c:2984
 wrap_directory_iterator+0x99/0xe0 fs/readdir.c:67
 iterate_dir+0x2f1/0x4e0 fs/readdir.c:110
 __do_sys_getdents64 fs/readdir.c:399 [inline]
 __se_sys_getdents64+0xf1/0x280 fs/readdir.c:384
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f316a089589
Code: c0 79 93 eb d5 48 8d 7c 1d 00 eb 99 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 d8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fff492e58d8 EFLAGS: 00000246 ORIG_RAX: 00000000000000d9
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007f316a089589
RDX: 0000000000002000 RSI: 00007fff492e5a10 RDI: 0000000000000003
RBP: 00007f316a0e2138 R08: 0000000000000000 R09: 6f6f6c2f7665642f
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000004
R13: 00007fff492e58e0 R14: 00007f316a10dcc0 R15: 0000000000000002
 </TASK>

Allocated by task 5946:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:409 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:426
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __kmalloc_cache_noprof+0x3d5/0x680 mm/slub.c:5563
 _kmalloc_noprof include/linux/slab.h:991 [inline]
 jfs_readdir+0x1169/0x33f0 fs/jfs/jfs_dtree.c:2887
 wrap_directory_iterator+0x99/0xe0 fs/readdir.c:67
 iterate_dir+0x2f1/0x4e0 fs/readdir.c:110
 __do_sys_getdents64 fs/readdir.c:399 [inline]
 __se_sys_getdents64+0xf1/0x280 fs/readdir.c:384
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff888039ad6000
 which belongs to the cache kmalloc-4k of size 4096
The buggy address is located 0 bytes to the right of
 allocated 4096-byte region [ffff888039ad6000, ffff888039ad7000)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x39ad0
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0x80000000000040(head|node=0|zone=1)
page_type: f5(slab)
raw: 0080000000000040 ffff88813ffbe140 dead000000000100 dead000000000122
raw: 0000000000000000 0000000000040004 00000000f5000000 0000000000000000
head: 0080000000000040 ffff88813ffbe140 dead000000000100 dead000000000122
head: 0000000000000000 0000000000040004 00000000f5000000 0000000000000000
head: 0080000000000003 fffffffffffffe01 00000000ffffffff 00000000ffffffff
head: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd2040(__GFP_IO|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 4965, tgid 4965 (udevd), ts 54440526702
 set_page_owner include/linux/page_owner.h:33 [inline]
 post_alloc_hook+0x1f9/0x250 mm/page_alloc.c:1871
 prep_new_page mm/page_alloc.c:1879 [inline]
 get_page_from_freelist+0x2591/0x2600 mm/page_alloc.c:3943
 __alloc_frozen_pages_noprof+0x230/0x5c0 mm/page_alloc.c:5436
 alloc_slab_page mm/slub.c:3347 [inline]
 allocate_slab+0x7d/0x620 mm/slub.c:3462
 new_slab mm/slub.c:3513 [inline]
 refill_objects+0x2d8/0x350 mm/slub.c:7418
 refill_sheaf mm/slub.c:2885 [inline]
 __pcs_replace_empty_main+0x339/0x690 mm/slub.c:4774
 alloc_from_pcs mm/slub.c:4850 [inline]
 slab_alloc_node mm/slub.c:4984 [inline]
 __do_kmalloc_node mm/slub.c:5413 [inline]
 __kmalloc_noprof+0x54b/0x790 mm/slub.c:5439
 _kmalloc_noprof include/linux/slab.h:995 [inline]
 tomoyo_realpath_from_path+0xef/0x640 security/tomoyo/realpath.c:251
 tomoyo_get_realpath security/tomoyo/file.c:151 [inline]
 tomoyo_path_perm+0x283/0x560 security/tomoyo/file.c:827
 security_inode_getattr+0x12b/0x310 security/security.c:1895
 vfs_getattr fs/stat.c:259 [inline]
 vfs_fstat fs/stat.c:281 [inline]
 __do_sys_newfstat fs/stat.c:551 [inline]
 __se_sys_newfstat fs/stat.c:546 [inline]
 __x64_sys_newfstat+0x133/0x270 fs/stat.c:546
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
page last free pid 4961 tgid 4961 ts 54392098709 stack trace:
 reset_page_owner include/linux/page_owner.h:26 [inline]
 __free_pages_prepare mm/page_alloc.c:1418 [inline]
 __free_frozen_pages+0xf8e/0x1070 mm/page_alloc.c:2962
 __slab_free+0x250/0x2a0 mm/slub.c:5823
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x99/0x100 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x148/0x160 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x22/0x80 mm/kasan/common.c:361
 kasan_slab_alloc include/linux/kasan.h:253 [inline]
 slab_post_alloc_hook mm/slub.c:4683 [inline]
 slab_alloc_node mm/slub.c:4996 [inline]
 kmem_cache_alloc_noprof+0x360/0x690 mm/slub.c:5010
 alloc_filename fs/namei.c:147 [inline]
 do_getname+0x2e/0x250 fs/namei.c:187
 class_filename_flags_constructor include/linux/fs.h:2586 [inline]
 do_sys_openat2+0xcc/0x200 fs/open.c:1416
 do_sys_open fs/open.c:1423 [inline]
 __do_sys_openat fs/open.c:1439 [inline]
 __se_sys_openat fs/open.c:1434 [inline]
 __x64_sys_openat+0x138/0x170 fs/open.c:1434
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffff888039ad6f00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffff888039ad6f80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>ffff888039ad7000: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
                   ^
 ffff888039ad7080: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff888039ad7100: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
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
