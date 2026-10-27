Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793142623;
	b=C/h8XvdroIVYAgxxUzoJ7EFjpZhY8pZ/Vcasel/ZI19cNwquk2bY3LDIW8cuOFLwVllf
	 qoz9qlmmiN4nB0Iv+d343l0igdg78ymFJqEAbbYhMt5D5hQspv+ZUDdZKPHK11EBWlB/p
	 +nefByIIIjZX4k6dpyMz/nOkRyZ6yVRwmaH9OPrrng7CSG2MM7q5xNPXuFU/FJqoDaza/
	 ZtNFodertF0NDC1RygI/j7t724StZYJHWRqLLQKJBzo6+gR8z07/qKL8I0eAz9xXrAIhp
	 b1xoo18TZvMv5JuBpd7KuPy82bmbpBedkq5OhuEmy2OgAG0veLgLRrA73Hi4dn5iZdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793142623;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=odh1FEY3gfv9Oaa4XSlvByT1MReTjq4xb466aItSTqw=;
	b=qF0YSqaTuNWG363zMec3nLDD3WG0qsYZd+GN981ESGKIAVSQrHmgdFN6ts6WDzBKVeci
	 rZGJafIMdX+TNnswDtVD+sILC1yEm/5XGu2/NauqE1IWbeFNmHM2O4IQ4w5B8zJZdqgWL
	 q8mMiSWJBMFcZozOraz541ioVeUg15s9vQLYb80BvNJqdJuMgAIe6vL/EPafWVRthes1y
	 Kn0hKfV3iiZ72FAiqyouFfdotAnueBi788NQONSDrFtsd9qzl0GzVDEYC2dhDKl5tyia2
	 PwoYGnJ3/Ay1GuFEq/YkVqeSuW8yF0cv3BdCpBDK+q09l1+cfTC5OMcmONYjIQONBdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE798606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 23:10:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE798606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4cbf700ddccso461423b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:10:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793142622; x=1793747422;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=odh1FEY3gfv9Oaa4XSlvByT1MReTjq4xb466aItSTqw=;
        b=Mkn/QZxoCIc7sFv/TxWXj2CHKf/zUnNO4ufSAcE/Iyw6F+3oPNWk/FiU0BR7tJHIuk
         HkybTunxEaQvDtYSWMK5rJP5tZK4E5t9MoG2hgdv8L/C7kvzuuqd9ZHdOTQtJ2+KSOfE
         HicHVnhyQ+doqU5dQobJLFI9US9o9S9o+Jgn67AW/rLEjIOiWynkSJC+kB3uhWuvoQmH
         xTYiCPNOlviC6dGMQoUsQkbxS6QwDL2jrN/6Knv+lRkBOz2cxcWgo7qsPQX8TBrYQnnN
         Czzgo4C6Wd+gVltpn0xtPoohRgoYNCDug/nX8u1/rq0rHfBlpuhFkHjHboExjU5T+oaS
         cTlw==
X-Forwarded-Encrypted: i=1; AKwUvByS1VGjwSyXJ80y/WEn7htMs/JsNL90mInM3llG5hW2jMZAIuGgfI1W251mDsBxSbw4BsN4ChG+MehLA0s=@vger.kernel.org
X-Gm-Message-State: AFq9FYKzT+Q6+tMLFHBVV6yaor1KA4gJT5TT+P054KnsJbWBvIj2r1l9
	yceMugAJBqTYQ0WlVS2VdHJYUQbAREOP36OgiL8ly4nGqoGeUrG1TfOTKAj62dzgcP7wN9aInMy
	5SSnODOlcLPo83YE8C4hhTuD275pFs5sskGXu06tZeJBPkh9dK+qklH3J73M=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:f12:b0:4b3:7b31:8df0 with SMTP id
 5614622812f47-56382c83592mr462249b6e.10.1793142622081; Tue, 27 Oct 2026
 16:10:22 -0700 (PDT)
Date: Tue, 27 Oct 2026 16:10:22 -0700
In-Reply-To: <20261027113813.1332096-1-trintaeoitogc@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae12f5e.985912ea.1e5798.00c8.GAE@google.com>
Subject: [syzbot ci] Re: mm: clear pmd in pmdp_invalidate()
From: syzbot ci <syzbot+ci4a2df3f964e29c5c@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, david@kernel.org, liam@infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, ljs@kernel.org, 
	mhocko@suse.com, rppt@kernel.org, surenb@google.com, trintaeoitogc@gmail.com, 
	vbabka@kernel.org
Cc: syzbot@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot ci has tested the following series

[v1] mm: clear pmd in pmdp_invalidate()
https://lore.kernel.org/all/20261027113813.1332096-1-trintaeoitogc@gmail.com
* [PATCH] mm: clear pmd in pmdp_invalidate()

and found the following issue:
kernel BUG in page_table_check_clear

Full report is available here:
https://ci.syzbot.org/series/ea6c690b-0dbf-4e3e-8367-2b5092d2878d

***

kernel BUG in page_table_check_clear

tree:      mm-new
URL:       https://kernel.googlesource.com/pub/scm/linux/kernel/git/akpm/mm.git
base:      01146870c415f6ff70a469fb7ceb962a3f2c8c52
arch:      amd64
compiler:  Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
config:    https://ci.syzbot.org/builds/b4be77d2-e026-48a2-b906-ba8967ba2d37/config
syz repro: https://ci.syzbot.org/findings/8fa94c36-acda-4fe5-a760-1dea60977f77/syz_repro

------------[ cut here ]------------
kernel BUG at mm/page_table_check.c:83!
Oops: invalid opcode: 0000 [#1] SMP KASAN PTI
CPU: 0 UID: 0 PID: 5817 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
RIP: 0010:page_table_check_clear+0x4ec/0x500 mm/page_table_check.c:83
Code: 89 e7 e8 f7 1a f4 ff e9 bd fb ff ff e8 4d 37 83 ff 90 0f 0b e8 45 37 83 ff 90 0f 0b e8 3d 37 83 ff 90 0f 0b e8 35 37 83 ff 90 <0f> 0b e8 2d 37 83 ff 90 0f 0b 66 2e 0f 1f 84 00 00 00 00 00 90 90
RSP: 0018:ffffc900035eed50 EFLAGS: 00010293
RAX: ffffffff8244dd9b RBX: 0000000000000200 RCX: ffff88810d88bc00
RDX: 0000000000000000 RSI: 00000000ffffffff RDI: 0000000000000000
RBP: ffff888104dea000 R08: ffff888104dea04b R09: 1ffff110209bd409
R10: dffffc0000000000 R11: ffffed10209bd40a R12: 00000000ffffffff
R13: 0000000000000001 R14: ffff888104dea048 R15: 0000000000116200
FS:  00007f8b11ee36c0(0000) GS:ffff88818c4c0000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000200000000140 CR3: 0000000112c36000 CR4: 00000000000006f0
Call Trace:
 <TASK>
 page_table_check_pmd_clear include/linux/page_table_check.h:64 [inline]
 pmdp_invalidate+0x2fc/0x310 mm/pgtable-generic.c:206
 __split_huge_pmd_locked mm/huge_memory.c:3323 [inline]
 split_huge_pmd_locked+0x100a/0x2e50 mm/huge_memory.c:3476
 __split_huge_pmd+0x202/0x2e0 mm/huge_memory.c:3490
 zap_pmd_range mm/memory.c:2136 [inline]
 zap_pud_range mm/memory.c:2179 [inline]
 zap_p4d_range mm/memory.c:2200 [inline]
 __zap_vma_range+0xb85/0x4f80 mm/memory.c:2240
 zap_vma_range_batched+0x3e0/0x5b0 mm/memory.c:2351
 madvise_dontneed_single_vma mm/madvise.c:868 [inline]
 madvise_dontneed_free mm/madvise.c:959 [inline]
 madvise_vma_behavior+0x252b/0x41d0 mm/madvise.c:1370
 madvise_walk_vmas+0x924/0xb00 mm/madvise.c:1687
 madvise_do_behavior+0x385/0x540 mm/madvise.c:1916
 do_madvise+0x327/0x3a0 mm/madvise.c:2014
 __do_sys_madvise mm/madvise.c:2023 [inline]
 __se_sys_madvise mm/madvise.c:2021 [inline]
 __x64_sys_madvise+0xa6/0xc0 mm/madvise.c:2021
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f8b10f9f559
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f8b11ee3028 EFLAGS: 00000246 ORIG_RAX: 000000000000001c
RAX: ffffffffffffffda RBX: 00007f8b11225fa0 RCX: 00007f8b10f9f559
RDX: 0000000000000004 RSI: 0000000000003000 RDI: 000020000015e000
RBP: 00007f8b11036b20 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f8b11226038 R14: 00007f8b11225fa0 R15: 00007fff02a6aba8
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:page_table_check_clear+0x4ec/0x500 mm/page_table_check.c:83
Code: 89 e7 e8 f7 1a f4 ff e9 bd fb ff ff e8 4d 37 83 ff 90 0f 0b e8 45 37 83 ff 90 0f 0b e8 3d 37 83 ff 90 0f 0b e8 35 37 83 ff 90 <0f> 0b e8 2d 37 83 ff 90 0f 0b 66 2e 0f 1f 84 00 00 00 00 00 90 90
RSP: 0018:ffffc900035eed50 EFLAGS: 00010293
RAX: ffffffff8244dd9b RBX: 0000000000000200 RCX: ffff88810d88bc00
RDX: 0000000000000000 RSI: 00000000ffffffff RDI: 0000000000000000
RBP: ffff888104dea000 R08: ffff888104dea04b R09: 1ffff110209bd409
R10: dffffc0000000000 R11: ffffed10209bd40a R12: 00000000ffffffff
R13: 0000000000000001 R14: ffff888104dea048 R15: 0000000000116200
FS:  00007f8b11ee36c0(0000) GS:ffff88818c4c0000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000200000000140 CR3: 0000000112c36000 CR4: 00000000000006f0


***

If these findings have caused you to resend the series or submit a
separate fix, please add the following tag to your commit message:
  Tested-by: syzbot@syzkaller.appspotmail.com

---
This report is generated by a bot. It may contain errors.
syzbot ci engineers can be reached at syzkaller@googlegroups.com.

To test a fix for this bug, please reply with `#syz test`
(on a separate line) and attach the patch to the email.

Notes:
- The patch will be applied on top of the tested series (as an
  incremental fix).
- To test a new version of the whole series, please send it directly
  to syzbot@lists.linux.dev.
- Arguments like custom git repos and branches are not supported.
