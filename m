Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CFE4F30CD
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 18:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788545062; cv=none; b=UkdKn7X/rPg6EgzPdq0EV/VAzPduF4mrm3pHgPIkEbt1AE35WH9FeZDlJPc+Go4LHUGZmRX9HgqytV7onX42oM00J/wxU2WhBav4mkYC6Zmuk1fKETfhGkRT0oyrhZhBmnLf2sgcJJjCECSYBxPCR6JM0ItQviUGUFNR1lT6FyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788545062; c=relaxed/simple;
	bh=/yH8aVYL9rgcWQI9m6bPCfuomybYymR9ytuOIMtj2Cc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KwayVlBiO/Bq0QfAVrU4WKcMwFxMH6CuNKelDEoI4VciMEJ1xdU0IEMO5YZM8fCn1wtXPm41dvXO1vW+S25O2eqKztXv9uvhFNrKNnfsiKKjYIsxtVPu2D2G4lzVWDKcAILhnCNVLF+C+SavLmQxqeCme19DAX9ekAW/SmCnD/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mHTVUiMx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mHTVUiMx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1A041F00A3D;
	Fri,  4 Sep 2026 18:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788545060;
	bh=DGCg+9XQhae5xrlm+2I6t2/TceTizVHXTXtMqY0vCu8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mHTVUiMxY/B+v+UZO9BOCYc1tNc5tyIT/ZQyk+gDmDg3nfxToylVXqw+fJaZjEDJ/
	 r+p5wPcv1ipv+o6SP8nLjx7fdJE9D66qvhkHQUeVYTS/ze5kLCNrYp5QMmKILVHHVO
	 v4bEXIld4ZwwXabz6uvDRzLzkHB6bk8efcBPNdiCBUcsCV7soUQr5KbNkP4EsreVLM
	 TGDIYTkQQl20wnqDqqe1ZvZwc16Chf11GcWiTqmzeYn9jQEK2wbScizu1sa4AAhPuR
	 +fUJh4xxbn5/uaKM8jZan0McNr07y3ZZmsecN/Rb5I0bh+NyX0L+i/yFZPCwyKl99O
	 +BSS9KFYitd2A==
Date: Fri, 4 Sep 2026 19:04:15 +0100
From: Will Deacon <will@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>
Cc: syzbot <syzbot+417a6b7c02d5d03f9aa6@syzkaller.appspotmail.com>,
	andrealmeid@igalia.com, dave@stgolabs.net, dvhart@infradead.org,
	linux-kernel@vger.kernel.org, mingo@redhat.com,
	peterz@infradead.org, syzkaller-bugs@googlegroups.com,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: [syzbot] [kernel?] Internal error in futex_wake_op
Message-ID: <apsIH2hDpeiGiazJ@willie-the-truck>
References: <6a908778.1d9ded08.62e62.00dc.GAE@google.com>
 <877bl1a811.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877bl1a811.ffs@fw13>

On Fri, Sep 04, 2026 at 07:40:42AM +0200, Thomas Gleixner wrote:
> On Thu, Aug 27 2026 at 11:52, syzbot wrote:
> 
> CC+: ARM64 people...
> 
> > Hello,
> >
> > syzbot found the following issue on:
> >
> > HEAD commit:    68f892e99df9 Merge branch 'for-next/core' into for-kernelci
> > git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
> > console output: https://syzkaller.appspot.com/x/log.txt?x=13dc7415580000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=d1128bc53f2ef7f3
> > dashboard link: https://syzkaller.appspot.com/bug?extid=417a6b7c02d5d03f9aa6
> > compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
> > userspace arch: arm64
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1512d625580000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13e2859e580000
> >
> > Downloadable assets:
> > disk image: https://storage.googleapis.com/syzbot-assets/f98dd20a7b98/disk-68f892e9.raw.xz
> > vmlinux: https://storage.googleapis.com/syzbot-assets/441f1ad32549/vmlinux-68f892e9.xz
> > kernel image: https://storage.googleapis.com/syzbot-assets/8da5227b7dc8/Image-68f892e9.gz.xz
> >
> > IMPORTANT: if you fix the issue, please add the following tag to the commit:
> > Reported-by: syzbot+417a6b7c02d5d03f9aa6@syzkaller.appspotmail.com
> >
> > futex_wake_op: syz.0.17 tries to shift op by 144; fix this program
> > Internal error: synchronous external abort: 0000000096000010 [#1]  SMP

This is an _external_ abort!

> > Modules linked in:
> > CPU: 0 UID: 0 PID: 4917 Comm: syz.0.17 Tainted: G   M                syzkaller #0 PREEMPT 
> > Tainted: [M]=MACHINE_CHECK
> > Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/07/2026
> > pstate: 83000005 (Nzcv daif -PAN -UAO +TCO +DIT -SSBS BTYPE=--)
> > pc : __llsc_futex_atomic_or arch/arm64/include/asm/futex.h:51 [inline]
> > pc : __futex_atomic_or arch/arm64/include/asm/futex.h:239 [inline]
> > pc : arch_futex_atomic_op_inuser arch/arm64/include/asm/futex.h:269 [inline]
> > pc : futex_atomic_op_inuser kernel/futex/waitwake.c:251 [inline]
> > pc : futex_wake_op+0x450/0xfe8 kernel/futex/waitwake.c:302
> > lr : mte_enable_tco arch/arm64/include/asm/mte-kasan.h:62 [inline]
> > lr : uaccess_enable_privileged arch/arm64/include/asm/uaccess.h:147 [inline]
> > lr : __llsc_futex_atomic_or arch/arm64/include/asm/futex.h:51 [inline]
> > lr : __futex_atomic_or arch/arm64/include/asm/futex.h:239 [inline]
> > lr : arch_futex_atomic_op_inuser arch/arm64/include/asm/futex.h:269 [inline]
> > lr : futex_atomic_op_inuser kernel/futex/waitwake.c:251 [inline]
> > lr : futex_wake_op+0x43c/0xfe8 kernel/futex/waitwake.c:302
> > sp : ffff800093197980
> > x29: ffff800093197b40 x28: 0000000000010000 x27: 0000000000000000
> > x26: 1fffe00018d2a3ad x25: dfff800000000000 x24: ffff0000c6951d40
> > x23: ffff0000c6951d6c x22: 0000000000000002 x21: 1fffe00018d2a685
> > x20: ffff0000c1df3780 x19: ffff0000c695342c x18: 0000000000000000
> > x17: 72676f7270207369 x16: 687420786966203b x15: 3434312079622070
> > x14: 6f20746669687320 x13: 0000000000000001 x12: 0000000000000000
> > x11: 0000000000000000 x10: 00000000fffffff5 x9 : 0000000000000000

X11 is NULL...

> > x8 : 0000000000000080 x7 : ffff80008048c60c x6 : 0000000000000000
> > x5 : 0000000000000000 x4 : 0000000000000000 x3 : ffff8000805b0678
> > x2 : 0000000000000002 x1 : ffff0000c6951d40 x0 : 0000000000000000
> > Call trace:
> >  __llsc_futex_atomic_or arch/arm64/include/asm/futex.h:51 [inline] (P)
> >  __futex_atomic_or arch/arm64/include/asm/futex.h:239 [inline] (P)
> >  arch_futex_atomic_op_inuser arch/arm64/include/asm/futex.h:269 [inline] (P)
> >  futex_atomic_op_inuser kernel/futex/waitwake.c:251 [inline] (P)
> >  futex_wake_op+0x450/0xfe8 kernel/futex/waitwake.c:302 (P)
> >  do_futex+0x200/0x378 kernel/futex/syscalls.c:144
> >  __do_sys_futex kernel/futex/syscalls.c:210 [inline]
> >  __se_sys_futex kernel/futex/syscalls.c:191 [inline]
> >  __arm64_sys_futex+0x2e4/0x418 kernel/futex/syscalls.c:191
> >  __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
> >  invoke_syscall+0x98/0x244 arch/arm64/kernel/syscall.c:49
> >  el0_svc_common+0xec/0x23c arch/arm64/kernel/syscall.c:121
> >  do_el0_svc+0x4c/0x5c arch/arm64/kernel/syscall.c:140
> >  el0_svc+0x64/0x260 arch/arm64/kernel/entry-common.c:758
> >  el0t_64_sync_handler+0x44/0x104 arch/arm64/kernel/entry-common.c:777
> >  el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:590
> > Code: d500409f 1280014a f94057eb f9800171 (885f7d76) 
> > ---[ end trace 0000000000000000 ]---
> > ----------------
> > Code disassembly (best guess):
> >    0:	d500409f 	msr	pan, #0x0
> >    4:	1280014a 	mov	w10, #0xfffffff5            	// #-11
> >    8:	f94057eb 	ldr	x11, [sp, #168]
> >    c:	f9800171 	prfm	pstl1strm, [x11]
> > * 10:	885f7d76 	ldxr	w22, [x11] <-- trapping instruction

... so the futex is dereferencing NULL in the LDXR instruction implementing
the atomic_or operation. Normally, that would trigger a translation fault
and the exception fixup handler would cause the function to return -EFAULT.

However, in this case the userspace program has mapped PCI down at 0:

  r0 = openat(0xffffffffffffff9c, &(0x7f0000000300)='./mysys/bus/pci/devices/0000:00:02.0/resource0\x00', 0x2, 0x0)
  mmap(0x0, 0x1012, 0x3, 0x11, r0, 0x0)

and the access from the exclusive instruction generates the external
abort. That's expected, which is why mapping MMIO into userspace is a
bad idea. I suspect you could even make the abort asynchronous if you
wanted to, in which case the kernel couldn't work around it even if it
tried.

Will
