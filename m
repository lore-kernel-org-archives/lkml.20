Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793615324;
	b=AleDLbTu4B8k8vRSJW6S+sPzqSDj/S0uwOTmflkvmsqvmskFPVs+ZXptDvXv1R5pDdNh
	 93CuI/HDRnyZO5/I7zBJNGuc0raLVPkvkFem8AnNz6wpntOvLdcEg1WCnPlrHoRjN0QwD
	 iGYhFHwFlYzN3nZfhHtlAfY2WKlledqaY5v9wIHCYACMl07+51eiObRZ367cD0fW+3TmL
	 0/3efkUk45pw/hRDIIbKYJtI396mZ43bXDNVImMeBX6oWLtfD6LzorTaSfn+ewlwEFYKW
	 hAK4SDspxCAkhlpity9ZRExzs+HR8IhWlBT5qVQXQPSs+Oz9KZ6XQccexerfLk0FEvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793615324;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=MV3whwGIKTeRrSMRHOmLjnv4u4c67+JiOel1WB4NBgY=;
	b=gCgfIf+DxR4Edgye5vu8NORaTm806+Gk2gcGP1jidTBiT4myhDQoU/m9iOZTA6acqXEg
	 WxDZL/FBm2PtswEw+5OmG5iwe3bwISW+WiXeDku/jeBmjFYN0gqJXd/eojLm2P1aIZCwg
	 xvA5mdCoBhzKN9a6fW6I4XtVftfgchAN6Skz52Xm2HnwlNJMJHLs5iRrQ2yqUmPe4nikE
	 1opwqFrKAXXiR65ktccQWwj6fIeRi7BBuDps2s8T9UdZhbwMVIboGq7TK6orXy6t1g4Y2
	 InF1CWqFKdI/gUpqYmbUh4R8Fgntv91301KG2eauwwGdcXxE+kIqhKgMwilo4S4/v6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XtMqBxaK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696C9606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XtMqBxaK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCC331F000C1;
	Mon,  2 Nov 2026 10:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793615324;
	bh=MV3whwGIKTeRrSMRHOmLjnv4u4c67+JiOel1WB4NBgY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XtMqBxaKvIGewdTAtI45J83eXsxlR44gTA+x2sUpOKIKu4K2xXdFOyCBaRQ8aYp1o
	 Y7a4Hlv/59tacoH0ha8mF9wEj7120mxa9jVC0sRAERxQOuTRnFNVyUs+cW+BD4SGyA
	 2kyKTYFxlefV0J1tsXZZ+pqMqr8uVDvW9ImndSFKr8sQM5hIWIkCv/7H1MHoiWgFun
	 AGNxrB0X12nPiib1TpC5Xyf/QOR2P+2qKwNMimEPl9zaOoA2UPpvY10FcrpOeFqnSW
	 tM1ERLSr0H+HS4ex3YtOs2Q/EmAuxUPWOJMvW4sVayyHaVHIAzFvQQsk2TmS8Z/Omn
	 qggZQQ6//qcKw==
Date: Mon, 2 Nov 2026 10:28:40 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: syzbot <syzbot+10e72ea5747737bcd2ad@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	syzkaller-bugs@googlegroups.com, "Liam R. Howlett" <liam@infradead.org>
Subject: Re: [syzbot] [mm?] general protection fault in validate_mm (2)
Message-ID: <auhlig-zjc4jQQuZ@gremlin>
References: <6ae78418.6552420f.2a0efc.005c.GAE@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ae78418.6552420f.2a0efc.005c.GAE@google.com>

+cc Liam

On Sun, Nov 01, 2026 at 10:25:28AM -0800, syzbot wrote:
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    36aad21d50d1 Merge tag 'ksmbd-for-7.4-rc1-part2' of git://..
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> console output: https://syzkaller.appspot.com/x/log.txt?x=12b81cb1580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=bd712e5dbce1d1a0
> dashboard link: https://syzkaller.appspot.com/bug?extid=10e72ea5747737bcd2ad
> compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
> userspace arch: i386
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12a58f95580000
>
> AI-generated root cause summary:
> In validate_mm() (mm/vma.c), struct anon_vma *anon_vma = vma->anon_vma caches
> the anon_vma pointer at the beginning of the VMA iteration loop. In
> vms_complete_munmap_vmas(), mm->mmap_lock is downgraded to a read lock before
> validate_mm() is called, allowing a concurrent page fault on another thread to
> populate vma->anon_vma via __anon_vma_prepare(). When this race occurs,
> vma_has_anon_rmap(vma) evaluates to true by re-reading vma->anon_vma, but
> anon_vma_lock_read(anon_vma) is invoked with the stale NULL local variable,
> resulting in an unhandled NULL-pointer dereference and kernel crash.
>
> full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=10e72ea5747737bcd2ad
>
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+10e72ea5747737bcd2ad@syzkaller.appspotmail.com

This is fixed at [0].

Why was no maintainer cc'd here? This is asking to be missed.

[0]:https://lore.kernel.org/linux-mm/20261102-fix-validate_mm-v1-1-5c309614ef15@kernel.org/

>
> Oops: general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] SMP KASAN NOPTI
> KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
> CPU: 0 UID: 0 PID: 6142 Comm: syz-executor263 Not tainted syzkaller #0 PREEMPT(full)
> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> RIP: 0010:anon_vma_lock_read mm/internal.h:315 [inline]
> RIP: 0010:validate_mm+0x3d4/0x780 mm/vma.c:707
> Code: d2 e0 98 ff 48 89 df e8 5a 10 f1 ff c6 05 db a8 dd 0f 01 90 0f 0b 90 e9 04 fd ff ff e8 b5 e0 98 ff 48 8b 44 24 08 48 c1 e8 03 <80> 3c 28 00 0f 85 25 03 00 00 48 8b 44 24 08 4c 8d 63 30 48 8b 00
> RSP: 0018:ffffc900040d7870 EFLAGS: 00010246
> RAX: 0000000000000000 RBX: ffff88806b186000 RCX: 0000000000000000
> RDX: ffff888000794b00 RSI: ffffffff8274c56b RDI: 0000000000000005
> RBP: dffffc0000000000 R08: 0000000000000000 R09: 0000000000000001
> R10: ffff88806b186083 R11: 0000000000000001 R12: ffff88806b186010
> R13: ffff88806b186040 R14: 0000000000000001 R15: 000000000000003d
> FS:  0000000000000000(0000) GS:ffff888095281000(0063) knlGS:000000005727b3c0
> CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
> CR2: 00000000f7f72000 CR3: 000000004e463000 CR4: 0000000000352ef0
> Call Trace:
>  <TASK>
>  vms_complete_munmap_vmas+0x83b/0xdf0 mm/vma.c:1437
>  do_vmi_align_munmap+0x44f/0x5f0 mm/vma.c:1677
>  do_vmi_munmap+0x1f8/0x410 mm/vma.c:1725
>  __vm_munmap+0x196/0x3c0 mm/vma.c:3562
>  __do_sys_munmap mm/mmap.c:1094 [inline]
>  __se_sys_munmap mm/mmap.c:1091 [inline]
>  __ia32_sys_munmap+0x57/0x80 mm/mmap.c:1091
>  do_syscall_32_irqs_on arch/x86/entry/syscall_32.c:79 [inline]
>  __do_fast_syscall_32+0x14b/0x8c0 arch/x86/entry/syscall_32.c:282
>  do_fast_syscall_32+0x32/0x70 arch/x86/entry/syscall_32.c:307
>  entry_SYSENTER_compat_after_hwframe+0x84/0x8e
> RIP: 0023:0xf7eaafbc
> Code: d2 74 05 c1 e8 0c 89 02 8b 5d fc 31 c0 c9 c3 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 0f 1f 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 2e 8d b4 26 00 00 00 00 8d b4 26 00 00 00 00 58 b8
> RSP: 002b:00000000ff8ab10c EFLAGS: 00000296 ORIG_RAX: 000000000000005b
> RAX: ffffffffffffffda RBX: 0000000020088000 RCX: 0000000000001000
> RDX: 00000000f7f70ff4 RSI: 00000000000000fb RDI: 0000000000000040
> RBP: 00000000ff8ab168 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
>  </TASK>
> Modules linked in:
> ---[ end trace 0000000000000000 ]---
> RIP: 0010:anon_vma_lock_read mm/internal.h:315 [inline]
> RIP: 0010:validate_mm+0x3d4/0x780 mm/vma.c:707
> Code: d2 e0 98 ff 48 89 df e8 5a 10 f1 ff c6 05 db a8 dd 0f 01 90 0f 0b 90 e9 04 fd ff ff e8 b5 e0 98 ff 48 8b 44 24 08 48 c1 e8 03 <80> 3c 28 00 0f 85 25 03 00 00 48 8b 44 24 08 4c 8d 63 30 48 8b 00
> RSP: 0018:ffffc900040d7870 EFLAGS: 00010246
> RAX: 0000000000000000 RBX: ffff88806b186000 RCX: 0000000000000000
> RDX: ffff888000794b00 RSI: ffffffff8274c56b RDI: 0000000000000005
> RBP: dffffc0000000000 R08: 0000000000000000 R09: 0000000000000001
> R10: ffff88806b186083 R11: 0000000000000001 R12: ffff88806b186010
> R13: ffff88806b186040 R14: 0000000000000001 R15: 000000000000003d
> FS:  0000000000000000(0000) GS:ffff888095281000(0063) knlGS:000000005727b3c0
> CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
> CR2: 00000000f7f72000 CR3: 000000004e463000 CR4: 0000000000352ef0
> ----------------
> Code disassembly (best guess), 4 bytes skipped:
>    0:	48 89 df             	mov    %rbx,%rdi
>    3:	e8 5a 10 f1 ff       	call   0xfff11062
>    8:	c6 05 db a8 dd 0f 01 	movb   $0x1,0xfdda8db(%rip)        # 0xfdda8ea
>    f:	90                   	nop
>   10:	0f 0b                	ud2
>   12:	90                   	nop
>   13:	e9 04 fd ff ff       	jmp    0xfffffd1c
>   18:	e8 b5 e0 98 ff       	call   0xff98e0d2
>   1d:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
>   22:	48 c1 e8 03          	shr    $0x3,%rax
> * 26:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1) <-- trapping instruction
>   2a:	0f 85 25 03 00 00    	jne    0x355
>   30:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
>   35:	4c 8d 63 30          	lea    0x30(%rbx),%r12
>   39:	48 8b 00             	mov    (%rax),%rax
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
>

--
Cheers, Lorenzo
