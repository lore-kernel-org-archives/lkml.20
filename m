Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794487275;
	b=ntcuGI/tN2dnz4ywWOxkndRuqDTvWBFHxWIxW5VhQmefM3ORDkOIdyktdStSpSNZcDE7
	 0mUSUcPQr1dNG9GTrHWIRwbl8wqzGEjBQ+R+VUChafqA6bXFXq9qaPFaePmvODSptWs3Y
	 JalAGu1Xop3b1KkvL7GMXzDvQyKPzw+WvgTvu6XTggZ43dar/640RMxfT80Qw3F+hT/OO
	 lS3n4IuRojhWUfGeSjUtWRrEskMiEZHtNTe08butBTsWEmzavtako+RdFSVX4jccAiSAt
	 4b0daxVkB3FEeRkuAuJvr/xiPGAqT9or6AlGjKHp7h9Tzqx1oKRBnAFvyoxEXXoA/Mg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794487275;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FIoCnP3oiDG1vIrSFHHGQKzBKdlWcMUHWJDoXuLp/j0=;
	b=fo/ToyUU+ZiAc+3lFbHE6wuhCqRY2mzbLBh2qOrbaTuAaZeu2MPNZX1LCeJ7w45P7Qgk
	 rd4vnhOFpoJI4WeuWNluu6oHdmAZYt/dOo+sZ5t9lRygxVGmb6rI6sXltmp49LDkbLYqr
	 O8Up6wYIOnzxIZDDLlCMvHm6Dzfou5CZF3+juvQuVhRx8flRhAuxqjPoKbMrP5RJazRNb
	 mLLMqTT2fS6wsIH7djdODaUVOXJuch1oHM6McZC1D68RdUTtUtChLp8k0BJ1//eWaFZdV
	 Mu6GqCGo0/LLEbohNi/i5wCoaOqHZJocMTSzhbfkHaTyzDh98MN2sdiXQbniVqJWaVw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=M7jRvnRS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.43
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133CD606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:41:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 133CD606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=M7jRvnRS
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-91e8938fd01so45943496d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:41:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794487274; cv=none;
        d=google.com; s=arc-20260327;
        b=BqNrMv2p2FosvfzE7cVnS7lqP7+MUBA78pFAHjNfrjxNXNfMN3BFYcpcSA2Syd/tfi
         7vXI4P+2xuIGSqxX+OV4/MdUGWd6CGCZMx6X++2T9IeA0K+kOyuMfA//Vgx2Ky77aZy3
         ElgwX/mjWHXruFON8e0+OoZG8bRFYg8rNaGblipyoA1wPdCcEkFbwc4RSkUug99pT1KQ
         8cDbyHzJuur/zFk0OZhF66g98iIWdPqVZc2Ssb9XDaB7a7+LlF/gAhYdkr59dnIPrrlK
         OOk4oITsW7jpHXlzdBdsfhlSeE2Opg9HRUH2qmEtlk/W9SSmtJ97nXMjcwiHFjNOabQV
         SsYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FIoCnP3oiDG1vIrSFHHGQKzBKdlWcMUHWJDoXuLp/j0=;
        fh=MgeQsB03vbb1RPy3tgmosTsq+J4toPk3fNrZBkZsUfw=;
        b=V8CfaWWpyDFylyQY/J8FsHyV1sYJ5O4BbtagQMiB/jQGkXJSqF04OgfkiyCbcSkJPY
         4Ni38/wJ4iWW3w98VCdfuweWeIvPrseWe9W6AY061vqrNA50AR8kf0R6YorA+kbu5Fik
         NsC46tEfEt8ysEtyOs3HHcR00c8/DAOMVX5j8FMHcOO23COOkMNBC1oruLdTm/CrVmA1
         +gUWUlCZKMO/Z/Hj7aV1IqNk2xX67yeJJuy3Xxv3rXBB7jei2JIXl0YQtccEoUOCRfn/
         pp2XEl5fvUdgIfL2VfonvrDguev7jO+jfDeHeNrNStHyoCbpZ74eOBKiQkr2iL1Ql69a
         Qs+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794487274; x=1795092074; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FIoCnP3oiDG1vIrSFHHGQKzBKdlWcMUHWJDoXuLp/j0=;
        b=M7jRvnRS5L4EUliLJVBY3EHEkl70dFDej6EATqoHSth807tgGmaodQlAAq2YpPaGeo
         rrQKv2ggOhQPG5sIxlY14jc9cSg3g/uOiP8b9Js2XXh86zMR4PKdL1tTFAC6dCoN+2Zg
         zAgz4/udTIlLlOqdxXKuUZgHMqkKse95Cg/9FdX3buE+aMQRvNYHorRytFwNYi7Yr5qc
         ndhs6f71mpZ8Qjm7L3VWjcBFmb6JSSWeNLBjruvRUzDemP7MUA1qcxC5qrAaftz4U1tk
         qO+0mORKQLq3AKIjTnB8b7rKR7d6PHBtRJlE3ZyWC1bIKWRvIfyrWEEQEh8DQmpJiKW+
         /klA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794487274; x=1795092074;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FIoCnP3oiDG1vIrSFHHGQKzBKdlWcMUHWJDoXuLp/j0=;
        b=VfqsC8omphL6Wg9Tsp9bhCesAnlJDBLulxnMSCwnP3OHQQDXEEtHKvUtOeQ5v7DIDv
         Z0UldepSYOefj0YR42x2k4Iv8pxmkSIKznwdfypYETLMZabA+bEzniXPUQ+Rr0B88GRL
         O0jeEa8zSURn8znWt70FakDnqyscYXIsVLhHfDVIXMzBUf+JWySFyCdyqvtzUrtJbDvJ
         W/c5Db1kqL8FVPgv8sF73K7UNN7IID1d2KFlbhpm03u+5oBdLIlj8WBKYSs1lQDwJI4O
         hyqWfdga1QpST8s8Yamn5AgH4SJIVYKLzfllW/LWjTnwgXPgWCvGMivgp3wY8mJFlnIq
         FQ0Q==
X-Forwarded-Encrypted: i=1; AL+hErFsQRXajOLq/E1ZhKSrAUS2NxFjkJPzAW8/CIq0BTANswGpCeVWtOjQPjhdOmnR6zGy7qc25uOW/LZhuBU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+wZY8+P5W7QHtB6OcdBNYCGlhXZ4ObqUiOEOQ/XLLwHKTXlmCQ
	Hv+JzB09ZcaAJSObm9cDbmzPnh6EI0PScqJ7Tdv0VzPu3ODjUiDyupcq6cOi0+393bhR6UBa0mm
	T33ma0MQLgIueWh44it9XuvKNj+RPyJs/ShHxxhM2
X-Gm-Gg: AYBFou2pfMiDis03nQw9k4AfZzqPFmtFsl0onu7mzzF+JiE9F+idoHmLM74BGw2oXKZ
	RXSq1dHUq9LegRRU54joXZIvlCsLk2NFdcXYWAeLWb0rsQ1BB5TNkLYNzgBzZFg8afp57mHuvQy
	jrl6EHqCEWvm90lDKV+IHrsvj4k0qB/xlzQRwiihiVQWmj8qibhiob2Qwxvhsi6uzzNeoI+bheD
	bXKtAM19v5pGWt5X1JQVRPjWcrUbLMw6jYs7PZTZDIDEPVaeSjSoJf2raSjrKESJ5tIinkVQCsO
	OURfUhbpMbmq/QNKyWYrwbfxsueoFmerfqWx9IBztKMDnTDfgXeht5193gozoado0xZFv6wiuCv
	DwKnd4fhxcseYHqcWkkhKWTxRGP+QToa5Krj145/QFaJVYiD7D8GRjXWmWFhUZ3Q8mTgrSkxXOa
	nM7SIjHmgUpgbK1O5WYX/3ogW4o7nbM/Nvo5r5tnKdkV4=
X-Received: by 2002:a05:6214:55c1:b0:91f:10c3:1bfc with SMTP id
 6a1803df08f44-91f10c32037mr52866176d6.48.1794487273295; Thu, 12 Nov 2026
 04:41:13 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <6af55517.a0c627da.5d811.0011.GAE@google.com>
In-Reply-To: <6af55517.a0c627da.5d811.0011.GAE@google.com>
From: Pimyn Girgis <pimyn@google.com>
Date: Thu, 12 Nov 2026 13:41:02 +0100
X-Gm-Features: AclHuK_attCAnoNuGFMRE_bVy_a69Tw0-PxKKa9Q328h3Xb-ONM8x-Dc5m4eh3o
Message-ID: <CAJWNTGzTPD-pWeKhVcAO-J475n0osXVrZTG-gmHtwXRTAgWWig@mail.gmail.com>
Subject: Re: [syzbot] [virt?] BUG: unable to handle kernel paging request in
 __run_timers (3)
To: syzbot <syzbot+0d91f453e89c72a04157@syzkaller.appspotmail.com>
Cc: ajay.kaher@broadcom.com, alexey.makhalov@broadcom.com, 
	bcm-kernel-feedback-list@broadcom.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, hpa@zytor.com, jgross@suse.com, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, 
	syzkaller-bugs@googlegroups.com, tglx@kernel.org, 
	virtualization@lists.linux.dev, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

#syz invalid


On Thu, Nov 12, 2026 at 6:56=E2=80=AFAM syzbot
<syzbot+0d91f453e89c72a04157@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    d164c7d754f0 Merge tag 'devicetree-fixes-for-7.4-1' of gi=
t..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=3D179566fd58000=
0
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3D1cf189394a856=
f11
> dashboard link: https://syzkaller.appspot.com/bug?extid=3D0d91f453e89c72a=
04157
> compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for D=
ebian) 2.44
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D173a724e580=
000
>
> Downloadable assets:
> disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d=
900f083ada3/non_bootable_disk-d164c7d7.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/0f548ae8bf9e/vmlinu=
x-d164c7d7.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/79563ef77b97/b=
zImage-d164c7d7.xz
>
> AI-generated root cause summary:
> proc_bus_pci_write() in drivers/pci/proc.c allows userspace to write raw =
values
> directly into the PCI configuration space of PCI devices without restrict=
ing
> writes to critical platform host bridge registers when lockdown is not ac=
tive.
> Writing to device 00:00.0 (the Q35 Host Bridge / DRAM Controller) overwri=
tes
> memory controller registers, causing QEMU to unmap system RAM and return
> all-ones (0xffffffffffffffff) for affected physical addresses. Consequent=
ly,
> when the timer subsystem in __run_timers() dequeues an active timer from =
an
> affected page, entry->next and entry->pprev evaluate to 0xfffffffffffffff=
f,
> causing __hlist_del() to trigger a fatal supervisor write page fault at a=
ddress
> 0xffffffffffffffff.
>
> full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=3D0d91f45=
3e89c72a04157
>
> IMPORTANT: if you fix the issue, please add the following tag to the comm=
it:
> Reported-by: syzbot+0d91f453e89c72a04157@syzkaller.appspotmail.com
>
> BUG: unable to handle page fault for address: ffffffffffffffff
> #PF: supervisor write access in kernel mode
> #PF: error_code(0x0002) - not-present page
> PGD fd99067 P4D fd99067 PUD fd9b067 PMD 0
> Oops: Oops: 0002 [#1] SMP KASAN NOPTI
> CPU: 2 UID: 0 PID: 0 Comm: swapper/2 Not tainted syzkaller #0 PREEMPT(ful=
l)
> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.=
16.3-2 04/01/2014
> RIP: 0010:__hlist_del include/linux/list.h:1045 [inline]
> RIP: 0010:detach_timer kernel/time/timer.c:892 [inline]
> RIP: 0010:expire_timers kernel/time/timer.c:1783 [inline]
> RIP: 0010:__run_timers+0x68a/0xb00 kernel/time/timer.c:2375
> Code: 8b 3b 48 89 f8 48 c1 e8 03 42 80 3c 20 00 0f 85 08 03 00 00 48 8b 4=
3 08 48 89 c2 48 c1 ea 03 42 80 3c 22 00 0f 85 db 02 00 00 <4c> 89 38 48 89=
 44 24 08 4d 85 ff 74 24 e8 54 50 15 00 49 8d 7f 08
> RSP: 0018:ffffc90000658d48 EFLAGS: 00010046
> RAX: ffffffffffffffff RBX: ffff8880456d98d8 RCX: 0000000000000102
> RDX: 1fffffffffffffff RSI: ffffffff81f92b99 RDI: ffff8880456d98e0
> RBP: ffffc90000658e08 R08: 0000000000000000 R09: 0000000000000001
> R10: ffffffff926ab25f R11: 0000000000000001 R12: dffffc0000000000
> R13: fffff520000cb1c1 R14: ffff88806a2266c0 R15: ffffffffffffffff
> FS:  0000000000000000(0000) GS:ffff8880d4675000(0000) knlGS:0000000000000=
000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: ffffffffffffffff CR3: 0000000059bd9000 CR4: 0000000000352ef0
> Call Trace:
>  <IRQ>
>  __run_timer_base kernel/time/timer.c:2387 [inline]
>  __run_timer_base kernel/time/timer.c:2379 [inline]
>  run_timer_base+0x114/0x190 kernel/time/timer.c:2396
>  run_timer_softirq+0x1a/0x50 kernel/time/timer.c:2406
>  handle_softirqs+0x216/0xa20 kernel/softirq.c:669
>  __do_softirq kernel/softirq.c:703 [inline]
>  invoke_softirq kernel/softirq.c:542 [inline]
>  __irq_exit_rcu+0x178/0x220 kernel/softirq.c:786
>  irq_exit_rcu+0x9/0x30 kernel/softirq.c:809
>  instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1062 [inli=
ne]
>  sysvec_apic_timer_interrupt+0xa3/0xc0 arch/x86/kernel/apic/apic.c:1062
>  </IRQ>
>  <TASK>
>  asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.=
h:674
> RIP: 0010:pv_native_safe_halt+0xf/0x20 arch/x86/kernel/paravirt.c:64
> Code: 67 a0 02 e9 43 61 03 00 0f 1f 00 90 90 90 90 90 90 90 90 90 90 90 9=
0 90 90 90 90 f3 0f 1e fa eb 07 0f 00 2d c3 6d 1c 00 fb f4 <c3> cc cc cc cc=
 66 2e 0f 1f 84 00 00 00 00 00 66 90 90 90 90 90 90
> RSP: 0018:ffffc90000197e00 EFLAGS: 00000206
> RAX: 000000000004ea47 RBX: ffff888020aba580 RCX: ffffffff8bef5325
> RDX: 0000000000000001 RSI: ffffffff8e629989 RDI: ffffffff8c835980
> RBP: ffffed10041574b0 R08: 0000000000000001 R09: ffffed100d446825
> R10: ffff88806a23412b R11: 0000000000000001 R12: 0000000000000000
> R13: 0000000000000000 R14: 1ffff92000032fc4 R15: dffffc0000000000
>  arch_safe_halt arch/x86/include/asm/paravirt.h:62 [inline]
>  default_idle+0x9/0x10 arch/x86/kernel/process.c:768
>  default_idle_call+0x6c/0xb0 kernel/sched/idle.c:122
>  cpuidle_idle_call kernel/sched/idle.c:199 [inline]
>  do_idle+0x3ae/0x5b0 kernel/sched/idle.c:355
>  cpu_startup_entry+0x4f/0x60 kernel/sched/idle.c:458
>  start_secondary+0x21d/0x2d0 arch/x86/kernel/smpboot.c:312
>  common_startup_64+0x13e/0x158
>  </TASK>
> Modules linked in:
> CR2: ffffffffffffffff
> ---[ end trace 0000000000000000 ]---
> ----------------
> Code disassembly (best guess):
>    0:   8b 3b                   mov    (%rbx),%edi
>    2:   48 89 f8                mov    %rdi,%rax
>    5:   48 c1 e8 03             shr    $0x3,%rax
>    9:   42 80 3c 20 00          cmpb   $0x0,(%rax,%r12,1)
>    e:   0f 85 08 03 00 00       jne    0x31c
>   14:   48 8b 43 08             mov    0x8(%rbx),%rax
>   18:   48 89 c2                mov    %rax,%rdx
>   1b:   48 c1 ea 03             shr    $0x3,%rdx
>   1f:   42 80 3c 22 00          cmpb   $0x0,(%rdx,%r12,1)
>   24:   0f 85 db 02 00 00       jne    0x305
> * 2a:   4c 89 38                mov    %r15,(%rax) <-- trapping instructi=
on
>   2d:   48 89 44 24 08          mov    %rax,0x8(%rsp)
>   32:   4d 85 ff                test   %r15,%r15
>   35:   74 24                   je     0x5b
>   37:   e8 54 50 15 00          call   0x155090
>   3c:   49 8d 7f 08             lea    0x8(%r15),%rdi
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
> --
> You received this message because you are subscribed to the Google Groups=
 "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion visit https://groups.google.com/d/msgid/syzkaller=
-bugs/6af55517.a0c627da.5d811.0011.GAE%40google.com.



--=20
=E2=B2=A0=E2=B2=9F=E2=B2=93=E2=B2=99=E2=B2=8F=E2=B2=9B =E2=B2=84=E2=B2=89=
=E2=B2=B1=E2=B2=A3=E2=B2=85=E2=B2=93=E2=B2=9F=E2=B2=A5 - Pimyn Girgis
Software Engineer
Kernel Dynamic Analysis
pimyn@google.com
