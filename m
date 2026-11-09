Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794196718;
	b=mKoZ6Pu8WL5EtOFxn0k2MGKMg6UfCh+s9p4vb7Ah68ThvNId0rAakrpKK/awfQkTYwAZ
	 GefUuKkaFkDzpvZyAANefEKQGxXjHRGhKIccjWdd1wFvbm1d+2kpxJ7+WaqzkIzsWVQYH
	 lR5oV9MBfj7Clz+PS3yoDoHUt4Kpw7aDE4Wr/r7+T5lRbwrrc0whxlB7pnUSneFkV52Zz
	 CI1IpLLW5milH4oBljb9UXUBm6eO3GfCxp+4LvVhylAMZ7/Lek1TZwT+/guZzybjazYiW
	 9JcspUdck5fZF5iacohtSuQZD3bVfZtbr1FL1f+uJBNSs5FGUSlHJ1iMxAzhgVr7ELA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794196718;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=FmcI/wMjxKRabbUMuhYcTv6IrsP0rncRUcBSJiu7240=;
	b=kNUs5FWY+KCPHROhDxqN5g8YOSANWvq5GeibTJHrWE5QzWvFFkpOAeJve8iSTK2hBC5Y
	 3nSIQS5xepLLZVuuCT/pX/Oz6HmZLtVG4BOb3zZYjUMwFHMl2ueUIgNLIU4/Hzyfpaxik
	 KcEMdhzy50G1lNxGrMzmaEPb9KkR3f47JxrIAd4e97c9Eo12qoxKplG6hE68Oa1wPK1hY
	 dhEMGsZNR1qepmkax2lhUXIWq0cWkXugmVODadJGZdlEDn8Jt9JjO1Z3nFGZCZw4CBC7s
	 pyCh1oRSwqD2bM7BFCqXL0Sg1A3pcnChBGl5j7rqUnbIuCmt2GUv2IsfecuHLB6yvOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.72
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2C1606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 03:58:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C2C1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-8210034ccc0so654590a34.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 19:58:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794196717; x=1794801517;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FmcI/wMjxKRabbUMuhYcTv6IrsP0rncRUcBSJiu7240=;
        b=PwWxY2NmVjOpF8PQe3S471x917B3NQUDkYYhPOFG4VLSF2RGzIvmrT/zInqcZKfDVo
         fvFb6fK20U6m4PvuTo/CWDbJ6fjoqwj2FTQvDdBX/bDrZB/uByI0DaJM/VqRH/FEl8g9
         i2NWzdDtYWOGRaEfH26XmA3mHwV1bxyBsDgdDYvHnePGkXX6LVA0E+T46M0WopVuuC3s
         Z9+6uIja0azZ3Y7M0eTldWe/1GxmUCz+yJpCm4QU7TMZrlMvvZFIwfglkyU2O+2zRU65
         iCpsZ5hsXEjY9KIauL4h09+cSI4LacUlk6A06SDYzBjXtRFJdmqTckUSZ9GaUsv52XvQ
         +9IA==
X-Forwarded-Encrypted: i=1; AL+hErEcEKHNk6XdysdARughhPud+om4dB67fAV0OAkgyV5+1xCWGowcvXoME109W/MC2iNRS9u1cMnGs8tGfV4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9V4IjhFvCNjeOzEtKqzz3T7ZV5dT/lJKh/jB4eJTnrjzAaT9g0
	0tu5+nFCtlQV5OK+d4AypounsGgoSiYR3dlR+WAWW6CkRvTDRsFON1uMh025ZNuza4rYhiAsRDT
	lCxpB9SX15rG04AOUU3ynO+Z2IaCTAvi3jnlOyjSjMluTR+tMXDEWyQ7qYzo=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:318b:b0:4e6:9390:e153 with SMTP id
 5614622812f47-568145f2896mr2071786b6e.24.1794196717188; Sun, 08 Nov 2026
 19:58:37 -0800 (PST)
Date: Sun, 08 Nov 2026 19:58:37 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af144ed.f50b2b3a.2c0de7.0010.GAE@google.com>
Subject: [syzbot] [mm?] [bluetooth?] BUG: unable to handle kernel NULL pointer
 dereference in __refill_objects_node
From: syzbot <syzbot+73e34786d639a8eb1324@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, bsegall@google.com, david@kernel.org, 
	dietmar.eggemann@arm.com, juri.lelli@redhat.com, kees@kernel.org, 
	kprateek.nayak@amd.com, liam@infradead.org, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, ljs@kernel.org, 
	luiz.dentz@gmail.com, marcel@holtmann.org, mgorman@suse.de, mhocko@suse.com, 
	mingo@redhat.com, peterz@infradead.org, rostedt@goodmis.org, rppt@kernel.org, 
	surenb@google.com, syzkaller-bugs@googlegroups.com, vbabka@kernel.org, 
	vincent.guittot@linaro.org, vschneid@redhat.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    58c1eb84e977 arm64: sdei: Preserve the interrupted context..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=12d1d369580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a58b6b4d667e7a61
dashboard link: https://syzkaller.appspot.com/bug?extid=73e34786d639a8eb1324
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1255c1a1580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/b1ec47537e12/disk-58c1eb84.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/3bca0c2b1169/vmlinux-58c1eb84.xz
kernel image: https://storage.googleapis.com/syzbot-assets/0a7c49594d5a/Image-58c1eb84.gz.xz

AI-generated root cause summary:
In mm/slub.c, __refill_objects_node() replenishes percpu sheaves by detaching a
freelist from a partial slab via get_freelist_nofreeze() and iterating through
the freelist pointers in a while (count && refilled < max) loop. Because the
loop condition only checks count and refilled rather than validating that object
is non-NULL, a prematurely terminated or corrupted freelist (where fewer objects
are linked in slab->freelist than the expected count = slab->objects -
slab->inuse) causes object to become NULL before count reaches zero. On the
subsequent iteration, get_freepointer() dereferences NULL + s->offset (offset
0x400 for kmalloc-2k), resulting in an immediate kernel NULL pointer dereference
crash at address 0x0000000000000400.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=73e34786d639a8eb1324

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+73e34786d639a8eb1324@syzkaller.appspotmail.com

Unable to handle kernel NULL pointer dereference at virtual address 00000000000004e8
Mem abort info:
  ESR = 0x0000000096000005
  EC = 0x25: DABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x05: level 1 translation fault
Data abort info:
  ISV = 0, ISS = 0x00000005, ISS2 = 0x00000000
  CM = 0, WnR = 0, TnD = 0, TagAccess = 0
  GCS = 0, Overlay = 0, DirtyBit = 0
user pgtable: 4k pages, 48-bit VAs, pgdp=000000011857f000
[00000000000004e8] pgd=080000011cba0403, p4d=080000011cba0403, pud=0000000000000000
Internal error: Oops: 0000000096000005 [#1]  SMP
Modules linked in:
CPU: 0 UID: 0 PID: 4870 Comm: syz-executor Not tainted syzkaller #0 PREEMPT 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 11/06/2026
pstate: 83400005 (Nzcv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
pc : get_freepointer mm/slub.c:596 [inline]
pc : __refill_objects_node+0x308/0x510 mm/slub.c:7413
lr : get_freelist_nofreeze mm/slub.c:4494 [inline]
lr : __refill_objects_node+0x2b8/0x510 mm/slub.c:7409
sp : ffff800094587600
x29: ffff800094587690 x28: 0000000000000000 x27: 0000000000000000
x26: 0000000000000006 x25: fffffdffc3256e00 x24: 0000000000000003
x23: 0000000000000006 x22: 000000000000000c x21: 0000000000000001
x20: ffff0000c0022138 x19: 0000000000000004 x18: ffff800123625000
x17: ffff0001ace953a6 x16: ffff0000db9cd894 x15: 00000000000c8000
x14: 00000000005c615b x13: 0000000000000001 x12: 0000000000000003
x11: 0000000000000000 x10: fffffdffc3256e20 x9 : ffff0000c0022120
x8 : 00000000000004e8 x7 : 0000000000000000 x6 : 0000000000000000
x5 : 0000000000000001 x4 : 0000000000000008 x3 : 00000002000c000c
x2 : 0000000000000000 x1 : 00000002000c0003 x0 : 0000000000000001
Call trace:
 get_freepointer mm/slub.c:595 [inline] (P)
 __refill_objects_node+0x308/0x510 mm/slub.c:7413 (P)
 refill_objects+0x78/0x320 mm/slub.c:7526
 refill_sheaf+0x44/0x6c mm/slub.c:2917
 __pcs_replace_empty_main+0x22c/0x4f4 mm/slub.c:4811
 alloc_from_pcs mm/slub.c:4887 [inline]
 slab_alloc_node mm/slub.c:5021 [inline]
 kmem_cache_alloc_noprof+0x35c/0x5d4 mm/slub.c:5047
 dup_mm kernel/fork.c:1532 [inline]
 copy_mm+0xb8/0x328 kernel/fork.c:1594
 copy_process+0x1698/0x35a0 kernel/fork.c:2320
 kernel_clone+0x234/0x8e8 kernel/fork.c:2790
 __do_sys_clone kernel/fork.c:2932 [inline]
 __se_sys_clone kernel/fork.c:2900 [inline]
 __arm64_sys_clone+0x168/0x1d4 kernel/fork.c:2900
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x244 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0xec/0x23c arch/arm64/kernel/syscall.c:121
 do_el0_svc+0x4c/0x5c arch/arm64/kernel/syscall.c:140
 el0_svc+0x60/0x1d8 arch/arm64/kernel/entry-common.c:797
 el0t_64_sync_handler+0x44/0x104 arch/arm64/kernel/entry-common.c:816
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:606
Code: f9401fe8 f900029b 2a1a03f7 b9402908 (f87b691c) 
---[ end trace 0000000000000000 ]---
----------------
Code disassembly (best guess):
   0:	f9401fe8 	ldr	x8, [sp, #56]
   4:	f900029b 	str	x27, [x20]
   8:	2a1a03f7 	mov	w23, w26
   c:	b9402908 	ldr	w8, [x8, #40]
* 10:	f87b691c 	ldr	x28, [x8, x27] <-- trapping instruction


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
