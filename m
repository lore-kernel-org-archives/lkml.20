Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794931174;
	b=vq+HS+QflXGCZucq31BmaPoBprsyowiIJjTfMMGC4J3sqtpXdPYMqATM0bfSjWgb15cC
	 LPwCS+w8PCx6XDM4a2hUAHLmejyI+r/JL9BMzehwzPTMPwtEMO+uVv8tTPscU1PjUClXt
	 I78yKvnXrwy+KVPmPWQxfTWp1mMM1LskjTeEplnEtGF+mTA8zYchNnHzOtbActQzZsGqa
	 nXhDrSJKuQ5sE27PwQ5awcKgHyYRKIUj6+UQGP/zlLjHdi8c83NKoUKXzb3Odj7s/eeFC
	 1rXWptqqv5P3X/2nbjEVwrXMW+U7jqD/nfAMKTA9S0c79WmbjFOAQD7v794aCWlL3+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794931174;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=0gD1zlvN4eThyjE43uOUbJ+uBXXfuLOk6FwIxVnKewg=;
	b=QLiyUfvsEx4w+shoyGzDyd+cvzOV7WCeqEMXszt7qo3wdJsN+kX8AsfTgcLW5LQ8N2sW
	 3cIuHey1UQY0QcVjb0rnKTMDxub1XvSZ6ofKif5xyYA3XxtWvaQOx6U07ZvtEKjX90tjM
	 B7/cRtCF6fgCnQVMkbBHh1p3oH7FUEpb6O6RM6XfDSAhynNfVDiK0KuFZ0Q4fGeMyPu7X
	 Ktz9aIxPrf0XXR+nrUQzIFELlQGpHk5UYgx0/ZyTdldGOiXxBHi04gmjmuEW0iAXy4Hi4
	 /CrIfNplHVJPUv+2agacU75m+NDpd1WcVr/yLOiIidL+2Yow/p/EsqWfuiPbNcQ+XwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PGeSPAbD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDEC606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PGeSPAbD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5CCD1F000C4;
	Tue, 17 Nov 2026 15:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794931174;
	bh=0gD1zlvN4eThyjE43uOUbJ+uBXXfuLOk6FwIxVnKewg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PGeSPAbDVQPtvdjyu1lyqjB7y3/sUtiyI1TwQSO+Jg20CM9l+zZ891VOYeqcE3xgx
	 kH1IOiBKH/UPt4nrMnV4shrc47KIjspcmEcqfp3lsaU0lEilmMPoDHlDduJNjJQBAG
	 tcEOP5yLZVJzmJZnpwMJjeA+CuKeIa5jfqj2eolwmP9X1p/N3oPwZ862WW5ai2rkyF
	 uXef5MdeFN+zT0VFl9vw7/E3xbmJIXyrwb2VOgk/WehF72XLXhJlsxG9i9nvmq4R9V
	 8PJWE6VhhRjxNFbp6C1keb4NwPYR1lXsrzzIjq53flbyIh2IoSQMMsXJOTZlyPFpNo
	 +v7iQ7nSnY6Aw==
Date: Tue, 17 Nov 2026 16:59:31 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Eryepa Yerepilov <yerepilov@gmail.com>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>
Subject: Re: [BUG] timers/nohz: Oops in wake_up_nohz_cpu+0xb with cpumask
 index -1
Message-ID: <avx548RXzTkrVRp1@localhost.localdomain>
References: <179491250540.103352.8910296528541632789@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179491250540.103352.8910296528541632789@gmail.com>

Le Tue, Nov 17, 2026 at 01:48:25PM +0300, Eryepa Yerepilov a écrit :
> Hi,
> 
> Summary: 7.3.4-arch1-1 panicked in idle on CPU 0 inside
> wake_up_nohz_cpu(), reached from __mod_timer() by the clocksource
> watchdog timer. The faulting instruction is a bit test against a static
> cpumask, with the index in RAX = 0xffffffff, i.e. -1.
> 
> Full trace, copied from pstore (efi_pstore backend; the journal did not
> survive the panic, the machine rebooted ~10 s later because of
> panic_on_oops=1). Timestamps are seconds since boot, uptime 43040 s:
> 
>  [43040.869305] BUG: unable to handle page fault for address: ffffffffadef72d8
>  [43040.869312] #PF: supervisor read access in kernel mode
>  [43040.869315] #PF: error_code(0x0000) - not-present page
>  [43040.869318] PGD 47ac25067 P4D 47ac25067 PUD 47ac26063 PMD 0
>  [43040.869324] Oops: Oops: 0000 [#1] SMP NOPTI
>  [43040.869329] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Tainted: G           OE       7.3.4-arch1-1 #1 PREEMPT(full)  6c50e2b86768c03b0a904a1018778cfad2de7f30
>  [43040.869339] RIP: 0010:wake_up_nohz_cpu+0xb/0x160
>  [43040.869346] Code: 07 ff ff ff 66 66 2e 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 0f 1f 40 d6 0f 1f 44 00 00 89 f8 <48> 0f a3 05 3d ed 72 02 0f 83 da 00 00 00 48 83 ec 10 89 fe 66 90
>  [43040.869349] RSP: 0018:ffffcff5c0003dd0 EFLAGS: 00010082
>  [43040.869352] RAX: 00000000ffffffff RBX: ffff8d0c0ea1dfc0 RCX: 0000000000000000
>  [43040.869355] RDX: 000000001b000000 RSI: ffffffff8e9b66e0 RDI: 00000000ffffffff
>  [43040.869357] RBP: ffff8d0c0ea1dfc0 R08: ffff8d0c0ea1dfc0 R09: 00000001028c3160
>  [43040.869359] R10: 00001e45a76494c8 R11: 0000000000000009 R12: 0000000000000000
>  [43040.869362] R13: 00000001028c315c R14: ffffffff8e9b66e0 R15: 00000000ffffffff
>  [43040.869364] FS:  0000000000000000(0000) GS:ffff8d0c80110000(0000) knlGS:0000000000000000
>  [43040.869367] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>  [43040.869369] CR2: ffffffffadef72d8 CR3: 000000019bf59000 CR4: 0000000000f50ef0
>  [43040.869372] PKRU: 55555554
>  [43040.869374] Call Trace:
>  [43040.869376]  <IRQ>
>  [43040.869378]  __mod_timer+0x2b4/0x3a0
>  [43040.869384]  ? __pfx_clocksource_watchdog+0x10/0x10
>  [43040.869389]  clocksource_watchdog+0x559/0x590
>  [43040.869393]  ? __pfx_clocksource_watchdog+0x10/0x10
>  [43040.869398]  call_timer_fn+0x2a/0x140
>  [43040.869402]  ? __pfx_clocksource_watchdog+0x10/0x10
>  [43040.869405]  __run_timers+0x27c/0x330
>  [43040.869412]  run_timer_softirq+0x46/0xf0
>  [43040.869415]  ? irqtime_account_irq+0x33/0xd0
>  [43040.869419]  handle_softirqs+0xde/0x290
>  [43040.869429]  __irq_exit_rcu+0xb9/0x110
>  [43040.869433]  sysvec_apic_timer_interrupt+0x71/0x90
>  [43040.869438]  </IRQ>
>  [43040.869440]  <TASK>
>  [43040.869442]  asm_sysvec_apic_timer_interrupt+0x1a/0x20
>  [43040.869446] RIP: 0010:cpuidle_enter_state+0xbb/0x400
>  [43040.869473]  cpuidle_enter+0x31/0x50
>  [43040.869477]  do_idle+0x1d3/0x2f0
>  [43040.869483]  cpu_startup_entry+0x29/0x30
>  [43040.869487]  rest_init+0xf7/0x100
>  [43040.869497]  start_kernel+0xa0e/0xa20
>  [43040.869502]  x86_64_start_reservations+0x24/0x30
>  [43040.869507]  x86_64_start_kernel+0xda/0xe0
>  [43040.869511]  common_startup_64+0x13e/0x151
>  [43040.869519]  </TASK>
>  [43040.912025] Kernel panic - not syncing: Fatal exception in interrupt
> 
> What the registers say
> 
> The faulting instruction at wake_up_nohz_cpu+0xb is
> 
>   48 0f a3 05 3d ed 72 02    bt %rax,0x272ed3d(%rip)
> 
> i.e. a bit test on a static cpumask with the bit index in RAX. RAX and
> RDI both hold 0xffffffff, so the index is -1 and the effective address is
> the mask minus one 8-byte word: the faulting address 0xffffffffadef72d8
> is exactly 8 bytes below the tested mask at 0xffffffffadef72e0. That
> address is above the end of the image (link base 0xffffffff81000000,
> boot offset 0xac00000) and unmapped - hence error_code 0 with PMD 0.

Weird, I scratched my head a lot but I couldn't find what can trigger that,
aside your memory corruption. I could be missing something of course.

Maybe Thomas has an idea.

Thanks.

-- 
Frederic Weisbecker
SUSE Labs
