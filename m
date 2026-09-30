Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0899F4CC63E
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790769090; cv=none; b=bYIhva+/BsDLeNCGIlTCFiyx6giLw5TR2f23JxhfbdQuABkabNG8v+XtqlekJBSWiWjZMbtG3uQNFbaKIypsDUBKbbF7+NQdFUmzI48P2Ei5eEJfD+9JEqe6Jf+kfJ9HgG39ZMjm40LzSEp5qTIZevr9mtZn8J52Rx0CgeIMCKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790769090; c=relaxed/simple;
	bh=cZegvy39G5iLLcnEjuA5z9QITjFNoJmUoYjktZSL9y4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=AUpbs9Y/e2uv9CaQRsliWoC6morvUAA2+gqzFWaM6QmcHkWzO+neZL8EtEb10YPj1mnc8rWppJE5Zd9CDFRGEWvjWtRwQqWX4QixhlJikwTO0AV3x8Y/sKwjsGtOsg9c6mXjlC6Qo9j6QqeDAS0Pcfd+4qpZP7xFoW6xvLHI3Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b28dbf4197so9300477b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 04:51:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790769088; x=1791373888;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ALSU5E4U7fg/eXilG2fEf5fAMQDTtLIfrMfFlIKzAps=;
        b=Z4CD8pBC9gtUPYghkD4lPJ68EwZoA3DfmowyN4bzXTvJaLC7ipR7PgxLRvM2eoXsDp
         61r2TO02oMlnpbRo1OsZMSEejCJOVcCx2ZajzKxK0MiURNnJIewOGSBMucJ1YclVt6Hi
         3INiaoY5J5qdL2Ll6SzGqZpdfSXpBU5GCHXTflvLYWgmvC2/9A4E0TmZgf7CKk9LrB29
         Bhighm1Bi36EIuAN4C6O7fwN3F7EkbM55xLHuI5490LXcGn0wVmPuhlCCZGnm9XfDAUd
         NsdXoc9uZ8NbQBnORnKoeos4t5qlAVBWga0hZ+XVP04CcIWAeHW8bT23WhfjuDgcHx8y
         ELhg==
X-Forwarded-Encrypted: i=1; AKwUvBwvp3plsqgjww5tUi5ekvkPc0+5z/9lE+I/kjjHsSZYNfdjrZUrb3+7wtA2pho+9Rty2ARg2Wsht8IDviE=@vger.kernel.org
X-Gm-Message-State: AFuF++l8zi3zUOk1eWLjz2sXPpUWqN5WGN8gShADQSMzYgCkHFFtbapX
	vXway0nPSqCo1aLsBEIW+5q0BR+2oYULhQuah2nzR0bNQkrwPoA65rUwAk3yNH16wbxKM5uW2k4
	JY9dCj0gBYIP3bXddLnoJ1KZKkaRiqDYc7767+0G2wN0mZJ1Mll24RY67o0M=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:11c9:b0:4d6:90d3:e183 with SMTP id
 5614622812f47-4f1b9a42d14mr936012b6e.44.1790769087935; Wed, 30 Sep 2026
 04:51:27 -0700 (PDT)
Date: Wed, 30 Sep 2026 04:51:27 -0700
In-Reply-To: <69e1f975.050a0220.1de265.0009.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6abcf7bf.fac9d4e5.17396.0000.GAE@google.com>
Subject: Re: [syzbot] [mm?] KCSAN: data-race in mas_wr_store_entry /
 mtree_range_walk (2)
From: syzbot <syzbot+38a879f4a73497f2dfef@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, elver@google.com, jannh@google.com, 
	jkrshnmenon@gmail.com, liam.howlett@oracle.com, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, ljs@kernel.org, pfalcato@suse.de, 
	syzkaller-bugs@googlegroups.com, vbabka@kernel.org
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    551c722f4080 Merge tag 'rtc-7.3-fixes' of git://git.kernel..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=1426a3f5580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ea1e6d8de13bab08
dashboard link: https://syzkaller.appspot.com/bug?extid=38a879f4a73497f2dfef
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=179a2b15580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+38a879f4a73497f2dfef@syzkaller.appspotmail.com

==================================================================
BUG: KCSAN: data-race in mas_wr_store_entry / mtree_range_walk

write to 0xffff8881105bc000 of 8 bytes by task 3634 on cpu 1:
 mte_set_node_dead lib/maple_tree.c:305 [inline]
 mas_put_in_tree lib/maple_tree.c:1652 [inline]
 mas_replace_node lib/maple_tree.c:1667 [inline]
 mas_wr_node_store lib/maple_tree.c:3276 [inline]
 mas_wr_store_entry+0x3c1f/0x5ac0 lib/maple_tree.c:3606
 mas_store_prealloc+0x421/0x670 lib/maple_tree.c:5031
 vma_iter_store_overwrite mm/vma.h:704 [inline]
 commit_merge+0x7b4/0x840 mm/vma.c:847
 vma_merge_existing_range mm/vma.c:1070 [inline]
 vma_modify+0x9eb/0xd50 mm/vma.c:1756
 vma_modify_flags+0x1be/0x250 mm/vma.c:1799
 mprotect_fixup+0x382/0x660 mm/mprotect.c:824
 do_mprotect_pkey+0x69f/0x950 mm/mprotect.c:1002
 __do_sys_mprotect mm/mprotect.c:1023 [inline]
 __se_sys_mprotect mm/mprotect.c:1020 [inline]
 __x64_sys_mprotect+0x48/0x60 mm/mprotect.c:1020
 x64_sys_call+0xd54/0x2550 arch/x86/include/generated/asm/syscalls_64.h:11
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x112/0x360 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

read to 0xffff8881105bc000 of 8 bytes by task 3640 on cpu 0:
 ma_dead_node lib/maple_tree.c:505 [inline]
 mtree_range_walk+0x35a/0x480 lib/maple_tree.c:2119
 mas_state_walk lib/maple_tree.c:3013 [inline]
 mas_walk+0x1ac/0x340 lib/maple_tree.c:4458
 lock_vma_under_rcu+0xc9/0x210 mm/mmap_lock.c:304
 do_user_addr_fault+0x239/0x1060 arch/x86/mm/fault.c:1334
 handle_page_fault arch/x86/mm/fault.c:1483 [inline]
 exc_page_fault+0x62/0xa0 arch/x86/mm/fault.c:1536
 asm_exc_page_fault+0x26/0x30 arch/x86/include/asm/idtentry.h:595

value changed: 0xffff8881058c0526 -> 0xffff8881105bc000

Reported by Kernel Concurrency Sanitizer on:
CPU: 0 UID: 0 PID: 3640 Comm: syz-executor108 Not tainted syzkaller #0 PREEMPT(lazy) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/16/2026
==================================================================


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
