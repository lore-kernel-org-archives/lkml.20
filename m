Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793227944;
	b=d9AUfLvaxg2kczdFl6Mp4qVX5xN5xcJcGO8+RjQfypBngdMsfGHLrK2TsgG/qpme32MJ
	 bU4DeWjq2Gyyrr+loVYL12lghzZfozs90ZR/jXaIqc/Jrr20Z6ln34WgJG2DRg3zMNFLZ
	 Jft5qVAqVRBOa3n4tw4Vqi0gewWRL0L2vKQtujEKwUuxRb/7Z6SQqvP1LrXvT9wl+5Gya
	 c39tVf22wmm8n0N3PATSD4uY9s9InQUY/GybqYCznMq43P8+xK+Ia3JGH+aisMA9fDyCV
	 fgYZMZXA3z1TopXLJWP50KDKFSwZ1h1TfP1cDaJIu2KYn7d0WJ1/26lxKCFN7nT4WDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793227944;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=xPA3khvwP2kQRrXhz1fOmmCIHEg7u7/AhyEuOBJrjVQ=;
	b=sxgAy/rGjUIy1pwqFZApJx1Uv6joSHnv3PKlGhV5pPrF24Lcu2vvOkABqr+90z1HQVR8
	 sIlhXc6attgorp/Y81uAj01ZSNqvlMNDwa5RC0D5z5R3ta1F51rMF6eVSt9cyzVZSTZJz
	 ZdySk5WrWmNxrrU9YPE+Z3sXQjRd+kkYursSpDdPjwL88rjWG5XBJtvo/Z0SLWCFGXoQI
	 ZVBT4lgWxbXrtzkcfvCZhLgogRK8L2+JinXphGUKq1KmSjAh9/8RGIQ+6nPx8iwbuz0tR
	 8LPS2k26zorSnEC28cc5Qd7/C0XEl/IVs3KG1UzLKPdt2rJi70FbdXMzzrP7XQS1XZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556CE606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 22:52:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 556CE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-54213290993so1423278b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:52:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793227943; x=1793832743;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xPA3khvwP2kQRrXhz1fOmmCIHEg7u7/AhyEuOBJrjVQ=;
        b=wGphz0bEOLLjNUGW04ffURNR5bkd6q8FU+fm6veGN8CrDYMdrrWwmehYHJX5VIM/WZ
         Eect1ritiX5oh/MVotvo5zAwamTmy+8Fw/5ORd5rqQd7p4HZ5ALqc2nylKnmrhQXNdBQ
         h59NEiCRjyKsBhjqIT/YzB4sQjM7w5mSk0dVd+Na7Ti+yTlByILEtK/vMTuQghDiIvE6
         eGUvWFBK3vGDkQ/1KfSwv96oWtPJwazOEaSfXavCY/nfb/aSFlHp9uu1sHXhJyTUKILk
         15QZLTi3pL/+nwmxRCU4AbzNU84T7uVB0cliLoT1UONNFxRaBtGbM8OdxTCOj5kulLNL
         d2AQ==
X-Gm-Message-State: AFq9FYLLq8z11y1EUTdqtaW9SYFCqrSVjsUIwgtBwLn8cf8YL0XwrwOb
	fa6jEjegttyepUS0a58fS7JemqS1OvRA8MKZyv9Fl26a0kag/HMt1Yu6bE3/kRbNN7NpEaVxRg+
	m+qpQNwuFhAuCietBLSOLPeq4kCyLKLpHQ42PX5PCbttA+1UYajjetTVCTkk=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:e84:b0:54c:7bef:90d6 with SMTP id
 5614622812f47-5639fa6d1abmr2277627b6e.4.1793227943403; Wed, 28 Oct 2026
 15:52:23 -0700 (PDT)
Date: Wed, 28 Oct 2026 15:52:23 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae27ca7.5451848c.f7707.0002.GAE@google.com>
Subject: [syzbot] [mm?] BUG: Bad page state in hugetlb_no_page
From: syzbot <syzbot+d06e9fe6d6a7b537fe49@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    d135ab453a74 Merge tag 'backlight-next-7.4' of git://git.k..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=13ecd97f980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c87c97847f0654ee
dashboard link: https://syzkaller.appspot.com/bug?extid=d06e9fe6d6a7b537fe49
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1544ad31580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+d06e9fe6d6a7b537fe49@syzkaller.appspotmail.com

BUG: Bad page state in process syz-executor125  pfn:60600
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x200000a00 pfn:0x60600
head: order:0 mapcount:0 entire_mapcount:1 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000058(uptodate|dirty|head|node=0|zone=1|lastcpupid=0x7ff)
raw: 00fff00000000058 dead000000000100 dead000000000122 0000000000000000
raw: 0000000200000a00 0000000000000002 00000000ffffffff 0000000000000000
head: 00fff00000000058 dead000000000100 dead000000000122 0000000000000000
head: 0000000200000a00 0000000000000002 00000000ffffffff 0000000000000000
head: 00fff00000000000 0000000000000000 00000000ffffffff 0000000000000000
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000000
page dumped because: PAGE_FLAGS_CHECK_AT_FREE flag(s) set
page_owner tracks the page as allocated
page last allocated via order 9, migratetype Movable, gfp_mask 0x146cca(GFP_HIGHUSER_MOVABLE|__GFP_NOWARN|__GFP_RETRY_MAYFAIL|__GFP_COMP), pid 5964, tgid 5962 (syz-executor125), ts 99736440450
 set_page_owner include/linux/page_owner.h:33 [inline]
 post_alloc_hook+0x1f9/0x250 mm/page_alloc.c:1854
 prep_new_page mm/page_alloc.c:1862 [inline]
 get_page_from_freelist+0x220f/0x2280 mm/page_alloc.c:3933
 __alloc_frozen_pages_noprof+0x1fc/0x400 mm/page_alloc.c:5429
 alloc_buddy_frozen_folio mm/hugetlb.c:1811 [inline]
 only_alloc_fresh_hugetlb_folio+0x135/0x450 mm/hugetlb.c:1852
 alloc_fresh_hugetlb_folio mm/hugetlb.c:1871 [inline]
 alloc_surplus_hugetlb_folio+0xb9/0x350 mm/hugetlb.c:2103
 alloc_buddy_hugetlb_folio mm/hugetlb.c:2183 [inline]
 hugetlb_alloc_folio+0x568/0xb00 mm/hugetlb.c:2899
 alloc_hugetlb_folio+0x57c/0x900 mm/hugetlb.c:3067
 hugetlb_no_page+0xea5/0x16f0 mm/hugetlb.c:5875
 hugetlb_fault+0x776/0x1440 mm/hugetlb.c:-1
 handle_mm_fault+0x24fc/0x3750 mm/memory.c:6844
 do_user_addr_fault+0xb35/0x1480 arch/x86/mm/fault.c:1343
 handle_page_fault arch/x86/mm/fault.c:1483 [inline]
 exc_page_fault+0x6a/0xc0 arch/x86/mm/fault.c:1536
 asm_exc_page_fault+0x26/0x30 arch/x86/include/asm/idtentry.h:595
page last free pid 5968 tgid 5962 ts 99714065632 stack trace:
 reset_page_owner include/linux/page_owner.h:26 [inline]
 __free_pages_prepare mm/page_alloc.c:1401 [inline]
 __free_frozen_pages+0xc97/0xd90 mm/page_alloc.c:2952
 update_and_free_hugetlb_folio+0x17c/0x280 mm/hugetlb.c:1568
 folios_put_refs+0x73d/0xb30 mm/folio.c:1020
 free_pages_and_swap_cache+0x41e/0x490 mm/swap_state.c:647
 __tlb_batch_free_encoded_pages mm/mmu_gather.c:138 [inline]
 tlb_batch_pages_flush mm/mmu_gather.c:151 [inline]
 tlb_flush_mmu_free mm/mmu_gather.c:397 [inline]
 tlb_flush_mmu+0x6d3/0xa30 mm/mmu_gather.c:404
 tlb_finish_mmu+0xf4/0x220 mm/mmu_gather.c:529
 zap_vma_range_batched+0x4b0/0x5a0 mm/memory.c:2321
 madvise_dontneed_single_vma mm/madvise.c:873 [inline]
 madvise_dontneed_free mm/madvise.c:964 [inline]
 madvise_vma_behavior+0x2361/0x43b0 mm/madvise.c:1375
 madvise_walk_vmas+0x924/0xb00 mm/madvise.c:1692
 madvise_do_behavior+0x385/0x540 mm/madvise.c:1921
 do_madvise+0x327/0x3a0 mm/madvise.c:2019
 __do_sys_madvise mm/madvise.c:2028 [inline]
 __se_sys_madvise mm/madvise.c:2026 [inline]
 __x64_sys_madvise+0xa6/0xc0 mm/madvise.c:2026
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
Modules linked in:
CPU: 1 UID: 0 PID: 5970 Comm: syz-executor125 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/07/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 bad_page+0xdc/0x120 mm/page_alloc.c:630
 free_page_is_bad mm/page_alloc.c:1065 [inline]
 __free_pages_prepare mm/page_alloc.c:1392 [inline]
 __free_frozen_pages+0xd3b/0xd90 mm/page_alloc.c:2952
 update_and_free_hugetlb_folio+0x17c/0x280 mm/hugetlb.c:1568
 folios_put_refs+0x73d/0xb30 mm/folio.c:1020
 free_pages_and_swap_cache+0x41e/0x490 mm/swap_state.c:647
 __tlb_batch_free_encoded_pages mm/mmu_gather.c:138 [inline]
 tlb_batch_pages_flush mm/mmu_gather.c:151 [inline]
 tlb_flush_mmu_free mm/mmu_gather.c:397 [inline]
 tlb_flush_mmu+0x6d3/0xa30 mm/mmu_gather.c:404
 tlb_finish_mmu+0xf4/0x220 mm/mmu_gather.c:529
 zap_vma_range_batched+0x4b0/0x5a0 mm/memory.c:2321
 madvise_dontneed_single_vma mm/madvise.c:873 [inline]
 madvise_dontneed_free mm/madvise.c:964 [inline]
 madvise_vma_behavior+0x2361/0x43b0 mm/madvise.c:1375
 madvise_walk_vmas+0x924/0xb00 mm/madvise.c:1692
 madvise_do_behavior+0x385/0x540 mm/madvise.c:1921
 do_madvise+0x327/0x3a0 mm/madvise.c:2019
 __do_sys_madvise mm/madvise.c:2028 [inline]
 __se_sys_madvise mm/madvise.c:2026 [inline]
 __x64_sys_madvise+0xa6/0xc0 mm/madvise.c:2026
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f6a83c0bd37
Code: 8b 54 24 78 64 48 2b 14 25 28 00 00 00 75 0a 48 81 c4 88 00 00 00 5b 5d c3 e8 05 0d 00 00 0f 1f 44 00 00 b8 1c 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 d0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f6a803d0178 EFLAGS: 00000202 ORIG_RAX: 000000000000001c
RAX: ffffffffffffffda RBX: 0000200000000000 RCX: 00007f6a83c0bd37
RDX: 0000000000000004 RSI: 0000000000c00000 RDI: 0000200000000000
RBP: 0000000000000003 R08: 1999999999999999 R09: 0000000000000000
R10: 00007f6a83c85220 R11: 0000000000000202 R12: ffffffffffffffd0
R13: 0000000000000000 R14: 00007ffe29fa7790 R15: 00007ffe29fa7878
 </TASK>


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
