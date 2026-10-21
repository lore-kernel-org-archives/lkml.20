Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792561169;
	b=3AQ9pK6Pygn8P/txY7ZaeBHJNxKwrUIMj8hyjY4tGsvZR+CVZUQitLehmvawby/ZO0Gi
	 mJopN53G3Mls4DQDpHy+iFu6OaGaLOoD2Hy7oW2GXTJP0tC1lwpGk9btk6w8sWMEXNfqK
	 dgqDjFTYyJQFB16wZvxQZ7L7bcP+UThgXOmp01XTsMDHwQJ4mHo+nkFEELe7roOkDRXg2
	 fPFEDis697pJzG8mgjIaJDBc9xGVOfn8srw0QWPhLA3xUDXbE3xWV8jV8tg6V2CR7U4+W
	 c0iR/udKiTsGsvZabztdNq7pQo8Pq2IQlex2MP3DAHTKXtvVxPEofRQ2ps8WZqyI4hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792561169;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=TnOW/P9t5St/1xN0d8b1YgYT14hih4Z7CV1qA3BWNBM=;
	b=4kEr86Oq7BS1d9D01tZ9H14UpeK91ISJvPqQNLpgh1Yc65d/36lvupf5ie6PyGcnrIOv
	 cL7qQ9IKe36zkZ6BSK0TPVsJN328d84mpurp5v4nmjNWZV9CIU+cQFNXoFJft/rBNSjJg
	 RbsPaz7tVmFsyJguRJ2LJdTPZY/S0IHSTU3Z761XUb/eyomfRs9m98FkdA4Dn309yM4DO
	 Sb1Y4dqIaBl6eD4tVvk+JnxfH5wEcnQYK8CyB8CNOMqqhOQksnHEN39v8m3StHDH3j15C
	 +aY4k55DI9XLnyYCDk668PoeA4x/VlKE9gc/yVmkUeVwL/prOwTB5jx6f1A/qpzN1vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=onVzm7Ev;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB7A606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:39:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DB7A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=onVzm7Ev
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-170135e43c7so317708c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 22:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792561168; x=1793165968; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TnOW/P9t5St/1xN0d8b1YgYT14hih4Z7CV1qA3BWNBM=;
        b=onVzm7EvUyb0VyXSFLPf2YY4M3mVABoOE+TxS/GEYwWXELul1ip+ILWL9q6jNwUfw4
         waNc+fcRnx2tpp8+Q7EA5eiI/o8kWRHr1L106V61sHQRQzq+pgUeX6TONVP+Fd6XwfUd
         lwncEqK5Tzj3HcHfmsDUFX5WxmU4lYX4xdWuBcvd4rhoCKearD23wdC+sL3egs32v+Lf
         u+jaDMYTkNWpw2rQ9Fn3D7SC3M8FKrFiwl8CfR/Bg5gfbfJbaQSbVxTmq+zVzoL7V8JK
         6NOvA84lPG07QlCqneScidnL+Q/ePkgcTEOtuIeoZoY3+eEYVw5eMkzmvcIlAKBCyitC
         dsqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792561168; x=1793165968;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TnOW/P9t5St/1xN0d8b1YgYT14hih4Z7CV1qA3BWNBM=;
        b=MgN5F58002xINFHRLy8LOlN0LDXh0uSZpbDLk5fcidgNOvjOs9g5VyyUeYyF4zW+pu
         wmfQfslpz4OsDds6/SDm0n0ZDMjxleBkM9kwQ8VkRmBQRSy8iiytydI/1OHnS8v42aLW
         m/P6L3fc1X9GBUkLnEndwiNsVTT2jRrGNUw02vFQrf2gOluCUu+ENGE74FVHUH8V+7UL
         TgLRbtFWtWOB9XI5C8m3B54ua/T2k8WguWf09wBG9cPVOfaDnHu4Gh3nCu/v4y+GhsUM
         NK833Io8I9ZtzaMCcSd7t9d1Z10WzeBPT3GFW+JwCUInu1FpVBYpxwkJKCBdogakZta+
         CATA==
X-Forwarded-Encrypted: i=1; AKwUvBxNXtcg645xfqk5Lt5T7BYGHW4MahTGTUjQW854Tmh+8pArgANyny82VOy8BzSd5lw8WI7p+M/tEpZjmEA=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1izOQx4M/KOSunYb00OFrF0ku6PePHQkgXsY0bk+F9N8EY4No
	L4Bns+XqS+gqgBIt0vVjpUFhk4VbIL6qVDgqRopB8n7k2c6DU604y2CG
X-Gm-Gg: AYBFou0bq9P+i8pKTzG1Rb9zxcWo+f1dhHJohYVlF3a6wcUXOJ5QDPrmvTePjH9FYzV
	D9eDTohNV2amAZVsoNav4noG3jKy4+gR1847IQtNJo94QKe/V/gZ9kJW4mka2FNUcuP7AkWlCAG
	4OZ7GUvEYVsD/1crvxdD/dNJxupmsO0lCY8Yt7M6UDa/wXaPYGJXPcPGxB8v8eYrOZ7ciR/owYQ
	oI1z/kj9jNCoDK6JrGrQVOZRryCiciHo3XybHUN1MHhaaTEHFwPJjR+MYFobmuQNsNJsj/uwvK4
	8Ms4t3ZzwspMakqkQMj/WLcGYjq57UVOSFGyo+0JuEvIEYmtVhDyjbj54kI1ExrxULxaycrWheA
	Mhmcm7qKEF+6qyRmpd1XTLBs2Sm6pHYJzZGsOdtFYJVqirnMvAt0dFtfGn0A7nTk16feAjV34zy
	SreIy0p2Wt7WIisqxLsJu6uX5/AFiNLqXGVe2qGCMOxtBuYGKYSP0Im9Z+qL0JOeMwMBMms7tJ7
	MQluj5uud//FAxk9il5K9Tz/7pPh/OZDtPvIQiVPbpIpl5qdjpkeFsrZeHWk6SpQNx0OX1/lWWF
	YcL6YkE8yLF357/wbWWSjfCCpb5Mnod+nIxUaBj/ct0fogU=
X-Received: by 2002:a05:7022:61a8:b0:168:3243:c910 with SMTP id a92af1059eb24-190a6adcc45mr2159610c88.13.1792561167798;
        Tue, 20 Oct 2026 22:39:27 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.165.23])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035c0c9a6sm3350955c88.3.2026.10.20.22.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 22:39:27 -0700 (PDT)
Date: Wed, 21 Oct 2026 11:09:20 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Cc: Peter Zijlstra <peterz@infradead.org>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, Srikar Dronamraju <srikar@linux.ibm.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, LKML <linux-kernel@vger.kernel.org>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Ingo Molnar <mingo@kernel.org>
Subject: Re: [next20260529]powerpc/pseries: multiple WARNs: RCU not watching
 for tracepoint and lockdep_hardirq_context() during boot and cpuidle
 (Power11)
Message-ID: <athOt8vlETgvNqrH@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <b44aefc5-e066-478b-8d34-50d2d0deab6b@linux.ibm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b44aefc5-e066-478b-8d34-50d2d0deab6b@linux.ibm.com>

On Mon, Jun 01, 2026 at 06:57:46PM +0530, Venkat Rao Bagalkote wrote:
> Greetings!!!
> 
> 
> I am observing multiple reproducible WARN_ONs related to RCU and lockdep IRQ
> state tracking on a Power11 pSeries system when running on latest linux-next
> kernel.
> 
> 
> Environment:
>   Architecture: ppc64le (Power11, pSeries LPAR)
>   Kernel: 7.1.0-rc5-next-20260529
>   Config: PREEMPT(lazy)
>           CONFIG_LOCKDEP=y
>           CONFIG_PROVE_LOCKING=y
> 
> 
> 
[...]
> Warning2:
> 
> [    0.010098] ------------[ cut here ]------------
> [    0.010103] DEBUG_LOCKS_WARN_ON(lockdep_hardirq_context())
> [    0.010107] WARNING: kernel/locking/lockdep.c:4406 at
> lockdep_hardirqs_on_prepare+0x22c/0x2d4, CPU#0: swapper/0/1
> [    0.010116] Modules linked in:
> [    0.010120] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Tainted: G     W       
>    7.1.0-rc5-next-20260529 #1 PREEMPT(lazy)
> [    0.010125] Tainted: [W]=WARN
> [    0.010127] Hardware name: IBM,9080-HEX Power11 (architected) 0x820200
> 0xf000007 of:IBM,FW1110.01 (NH1110_069) hv:phyp pSeries
> [    0.010131] NIP:  c00000000031549c LR: c000000000315498 CTR:
> 0000000000000000
> [    0.010135] REGS: c0000000045bf100 TRAP: 0700   Tainted: G   W           
> (7.1.0-rc5-next-20260529)
> [    0.010139] MSR:  8000000002021033 <SF,VEC,ME,IR,DR,RI,LE>  CR: 44044228 
> XER: 00000005
> [    0.010147] CFAR: c00000000022e9d4 IRQMASK: 3
> [    0.010147] GPR00: c000000000315498 c0000000045bf3c0 c000000001ccf100
> 000000000000002e
> [    0.010147] GPR04: 3fffffffffff7fff c0000000045bf1b0 c0000000045bf1a8
> 0000000000000000
> [    0.010147] GPR08: c0000000029d1230 0000000000010002 c0000000048b2b00
> 0000000000000003
> [    0.010147] GPR12: c000000002d514e0 c000000003ea1000 c000000000011ae4
> 0000000000000000
> [    0.010147] GPR16: 0000000000000000 0000000000000000 0000000000000000
> 0000000000000000
> [    0.010147] GPR20: 0000000000000000 0000000000000004 c000000000272684
> c0000000029bb0c0
> [    0.010147] GPR24: 0000000ebc171000 c000000ebeb63850 c000000003084d00
> c00000000308b2d0
> [    0.010147] GPR28: c00000000002a488 0000000000000001 0000000000000000
> c000000002246e08
> [    0.010188] NIP [c00000000031549c]
> lockdep_hardirqs_on_prepare+0x22c/0x2d4
> [    0.010192] LR [c000000000315498] lockdep_hardirqs_on_prepare+0x228/0x2d4
> [    0.010196] Call Trace:
> [    0.010198] [c0000000045bf3c0] [c000000000315498]
> lockdep_hardirqs_on_prepare+0x228/0x2d4 (unreliable)
> [    0.010204] [c0000000045bf430] [c0000000004bb778]
> trace_hardirqs_on+0xec/0x1b0
> [    0.010209] [c0000000045bf4b0] [c0000000015ad574]
> irqentry_exit+0x58c/0xe1c
> [    0.010213] [c0000000045bf540] [c00000000002a488]
> timer_interrupt+0x210/0x564
> [    0.010219] [c0000000045bf5f0] [c00000000003b960]
> __replay_soft_interrupts+0x14c/0x374
> [    0.010224] [c0000000045bf7d0] [c00000000003bd74]
> arch_local_irq_restore.part.0+0x1ec/0x224
> [    0.010230] [c0000000045bf810] [c0000000015c17d4]
> _raw_spin_unlock_irqrestore+0x54/0xac
> [    0.010235] [c0000000045bf840] [c0000000002cdd54]
> set_user_nice+0x110/0x220
> [    0.010240] [c0000000045bf8e0] [c000000000266a94]
> create_worker+0x13c/0x310
> [    0.010245] [c0000000045bf9a0] [c0000000002726f4]
> workqueue_prepare_cpu+0x70/0xe4
> [    0.010251] [c0000000045bf9e0] [c000000000232604]
> cpuhp_invoke_callback+0x1e8/0x3c0
> [    0.010256] [c0000000045bfa50] [c000000000232924]
> __cpuhp_invoke_callback_range+0x148/0x230
> [    0.010261] [c0000000045bfaf0] [c000000000234f68] _cpu_up+0x19c/0x3cc
> [    0.010265] [c0000000045bfbb0] [c00000000023533c] cpu_up+0x1a4/0x1f4
> [    0.010269] [c0000000045bfc40] [c00000000203d1f4]
> bringup_nonboot_cpus+0xbc/0x128
> [    0.010275] [c0000000045bfca0] [c00000000204b98c] smp_init+0x44/0xd0
> [    0.010279] [c0000000045bfd00] [c000000002006d4c]
> kernel_init_freeable+0x23c/0x3b0
> [    0.010284] [c0000000045bfdc0] [c000000000011b0c] kernel_init+0x30/0x274
> [    0.010288] [c0000000045bfe30] [c00000000000debc]
> ret_from_kernel_user_thread+0x14/0x1c
> [    0.010292] ---- interrupt: 0 at 0x0
> [    0.010296] Code: 4182ff74 3d22013c 3929c1d4 81290000 2c090000 4082ff60
> 3c82ffda 3c62ffd9 3884f998 38634590 4bf19461 60000000 <0fe00000> 4bffff40
> 60000000 60000000
> [    0.010310] irq event stamp: 7440
> [    0.010312] hardirqs last  enabled at (7439): [<c0000000015c1824>]
> _raw_spin_unlock_irqrestore+0xa4/0xac
> [    0.010317] hardirqs last disabled at (7440): [<c00000000003bc30>]
> arch_local_irq_restore.part.0+0xa8/0x224
> [    0.010323] softirqs last  enabled at (0): [<c00000000022b6ac>]
> copy_process+0xb24/0x1dec
> [    0.010328] softirqs last disabled at (0): [<0000000000000000>] 0x0
> [    0.010331] ---[ end trace 0000000000000000 ]---
> 
Root cause:
On powerpc, a soft-masked interrupt that arrives while IRQs are soft-disabled
is recorded in irq_happened. It is replayed when IRQs are re-enabled. Here
that happens through 
_raw_spin_unlock_irqrestore()
	arch_local_irq_restore()
		__replay_soft_interrupts()
			timer_interrupt().
Before replaying, arch_local_irq_restore() deliberately calls irq_enter() at
line 317. The reason is to keep softirqs from running inside the replayed
handlers. irq_enter() does preempt_count_add(HARDIRQ_OFFSET) and
lockdep_hardirq_enter(). So the replayed handler starts with one hardirq level
already held.
The replayed timer_interrupt() is defined with DEFINE_INTERRUPT_HANDLER_ASYNC.
It runs irq_enter_rcu(), then the handler body, then irq_exit_rcu(), then
irqentry_exit(). In a real hardirq the nesting depth goes 0 → 1 → 0 over this
sequence. In the replay case it goes 1 → 2 → 1. This matches your "preempt
count is 2 compared to 1" observation.
When irqentry_exit() takes the return-to-kernel path with IRQs enabled in the
interrupted context, it calls trace_hardirqs_on(). That reaches
lockdep_hardirqs_on_prepare(). Lockdep expects hardirq context to be fully
unwound at that point. It checks DEBUG_LOCKS_WARN_ON(lockdep_hardirq_context())
at line 4448. The per-CPU hardirq_context is still 1, left over from the
outer irq_enter() in arch_local_irq_restore(). So the warning fires, and
lockdep disables itself (debug_locks is cleared).

The replay path's own irq_enter()/irq_exit() bracket is still open when the
generic entry code's irqentry_exit() tries to re-establish the "IRQs on" state.
This is not a real nested-IRQ bug. The generic entry code simply assumes it runs
outside any hardirq context.

This warning is harmless and we are working on this to fix it.

Regards,
Mukesh

[...]
