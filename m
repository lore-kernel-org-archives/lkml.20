Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C249230C160
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 05:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788500447; cv=none; b=V5FjaTs931gimcBDX7p3TTboGir9wvkZn3DS+Lj4Nx5gaRr7uz1g4mij9CYoVqouI+WyH0CWsMZRdudPi0UMfuWt3Ugh1Lyjxxec6/fVx7DgxWinEEvmZBp4VrVY73qkZNt5f/x4pz5c4dAxq5MwPzUndo84D1uHOd7uZZUwpUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788500447; c=relaxed/simple;
	bh=oBkZqD8z7VEeSY4eMxro8rmnifQulYHdec6qnb762zw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qNa4eNba7s2IY0/9eVsX2Zmbdm/byvoy84nPTwWIs3k5Eg5Yuz1S8Lvar7UXFGH7j8WhGSaAmttt55RYHOy01G3ktZSjnQWAakK2P7C0jtQuyjeL4aCDyF3bDij1jbCtB3Yxahgbhc5MwfiU3NJDrcGFzcs3BJPOgx2H/YfZiN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y4Nt/Xbg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y4Nt/Xbg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF3201F00A3E;
	Fri,  4 Sep 2026 05:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788500445;
	bh=BlKzeHDQmdtQhSMD7OZocK5DgYOQx2sPWKFRmowF4ZA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Y4Nt/XbgyI8nVqTwDtBy/J2KzyHS2HOTvEw+ONB+x+Qe4BI+8XA29uFRrhjEiXBsS
	 nVoEeo8qQnWTyzKYycrZ/OChUZQEOWR8CU+P3Gg9CzxqXrOKgPVPKPHgNNNKgb8M+X
	 rYToNvecMtejJkCQaOZ7vNiJfOQ5oOt1hGG+AifQhnhFKmTD0ZdDpDu92fZ42o/yWh
	 EVjeWIGWG14do/+Ftly9yAA7Rlcg92BEit6NpzuUjrenoedMdR8/WZVw75toIy8IML
	 VVyjnWo0Xm3zMAleaV4FwUkxEhss7K/SGb3TFqXST0JQsTsFLtAGEaWQWizR3h9WvV
	 h9vB5Jffv81fA==
From: Thomas Gleixner <tglx@kernel.org>
To: syzbot <syzbot+417a6b7c02d5d03f9aa6@syzkaller.appspotmail.com>,
 andrealmeid@igalia.com, dave@stgolabs.net, dvhart@infradead.org,
 linux-kernel@vger.kernel.org, mingo@redhat.com, peterz@infradead.org,
 syzkaller-bugs@googlegroups.com
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: Re: [syzbot] [kernel?] Internal error in futex_wake_op
In-Reply-To: <6a908778.1d9ded08.62e62.00dc.GAE@google.com>
References: <6a908778.1d9ded08.62e62.00dc.GAE@google.com>
Date: Fri, 04 Sep 2026 07:40:42 +0200
Message-ID: <877bl1a811.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Aug 27 2026 at 11:52, syzbot wrote:

CC+: ARM64 people...

> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    68f892e99df9 Merge branch 'for-next/core' into for-kernelci
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
> console output: https://syzkaller.appspot.com/x/log.txt?x=13dc7415580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=d1128bc53f2ef7f3
> dashboard link: https://syzkaller.appspot.com/bug?extid=417a6b7c02d5d03f9aa6
> compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
> userspace arch: arm64
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1512d625580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13e2859e580000
>
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/f98dd20a7b98/disk-68f892e9.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/441f1ad32549/vmlinux-68f892e9.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/8da5227b7dc8/Image-68f892e9.gz.xz
>
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+417a6b7c02d5d03f9aa6@syzkaller.appspotmail.com
>
> futex_wake_op: syz.0.17 tries to shift op by 144; fix this program
> Internal error: synchronous external abort: 0000000096000010 [#1]  SMP
> Modules linked in:
> CPU: 0 UID: 0 PID: 4917 Comm: syz.0.17 Tainted: G   M                syzkaller #0 PREEMPT 
> Tainted: [M]=MACHINE_CHECK
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/07/2026
> pstate: 83000005 (Nzcv daif -PAN -UAO +TCO +DIT -SSBS BTYPE=--)
> pc : __llsc_futex_atomic_or arch/arm64/include/asm/futex.h:51 [inline]
> pc : __futex_atomic_or arch/arm64/include/asm/futex.h:239 [inline]
> pc : arch_futex_atomic_op_inuser arch/arm64/include/asm/futex.h:269 [inline]
> pc : futex_atomic_op_inuser kernel/futex/waitwake.c:251 [inline]
> pc : futex_wake_op+0x450/0xfe8 kernel/futex/waitwake.c:302
> lr : mte_enable_tco arch/arm64/include/asm/mte-kasan.h:62 [inline]
> lr : uaccess_enable_privileged arch/arm64/include/asm/uaccess.h:147 [inline]
> lr : __llsc_futex_atomic_or arch/arm64/include/asm/futex.h:51 [inline]
> lr : __futex_atomic_or arch/arm64/include/asm/futex.h:239 [inline]
> lr : arch_futex_atomic_op_inuser arch/arm64/include/asm/futex.h:269 [inline]
> lr : futex_atomic_op_inuser kernel/futex/waitwake.c:251 [inline]
> lr : futex_wake_op+0x43c/0xfe8 kernel/futex/waitwake.c:302
> sp : ffff800093197980
> x29: ffff800093197b40 x28: 0000000000010000 x27: 0000000000000000
> x26: 1fffe00018d2a3ad x25: dfff800000000000 x24: ffff0000c6951d40
> x23: ffff0000c6951d6c x22: 0000000000000002 x21: 1fffe00018d2a685
> x20: ffff0000c1df3780 x19: ffff0000c695342c x18: 0000000000000000
> x17: 72676f7270207369 x16: 687420786966203b x15: 3434312079622070
> x14: 6f20746669687320 x13: 0000000000000001 x12: 0000000000000000
> x11: 0000000000000000 x10: 00000000fffffff5 x9 : 0000000000000000
> x8 : 0000000000000080 x7 : ffff80008048c60c x6 : 0000000000000000
> x5 : 0000000000000000 x4 : 0000000000000000 x3 : ffff8000805b0678
> x2 : 0000000000000002 x1 : ffff0000c6951d40 x0 : 0000000000000000
> Call trace:
>  __llsc_futex_atomic_or arch/arm64/include/asm/futex.h:51 [inline] (P)
>  __futex_atomic_or arch/arm64/include/asm/futex.h:239 [inline] (P)
>  arch_futex_atomic_op_inuser arch/arm64/include/asm/futex.h:269 [inline] (P)
>  futex_atomic_op_inuser kernel/futex/waitwake.c:251 [inline] (P)
>  futex_wake_op+0x450/0xfe8 kernel/futex/waitwake.c:302 (P)
>  do_futex+0x200/0x378 kernel/futex/syscalls.c:144
>  __do_sys_futex kernel/futex/syscalls.c:210 [inline]
>  __se_sys_futex kernel/futex/syscalls.c:191 [inline]
>  __arm64_sys_futex+0x2e4/0x418 kernel/futex/syscalls.c:191
>  __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
>  invoke_syscall+0x98/0x244 arch/arm64/kernel/syscall.c:49
>  el0_svc_common+0xec/0x23c arch/arm64/kernel/syscall.c:121
>  do_el0_svc+0x4c/0x5c arch/arm64/kernel/syscall.c:140
>  el0_svc+0x64/0x260 arch/arm64/kernel/entry-common.c:758
>  el0t_64_sync_handler+0x44/0x104 arch/arm64/kernel/entry-common.c:777
>  el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:590
> Code: d500409f 1280014a f94057eb f9800171 (885f7d76) 
> ---[ end trace 0000000000000000 ]---
> ----------------
> Code disassembly (best guess):
>    0:	d500409f 	msr	pan, #0x0
>    4:	1280014a 	mov	w10, #0xfffffff5            	// #-11
>    8:	f94057eb 	ldr	x11, [sp, #168]
>    c:	f9800171 	prfm	pstl1strm, [x11]
> * 10:	885f7d76 	ldxr	w22, [x11] <-- trapping instruction
>
>
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
>
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
>
> If you want syzbot to run the reproducer, reply with:
> #syz test: git://repo/address.git branch-or-commit-hash
> If you attach or paste a git patch, syzbot will apply it before testing.
>
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
>
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
>
> If you want to undo deduplication, reply with:
> #syz undup
