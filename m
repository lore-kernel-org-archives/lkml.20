Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794847187;
	b=rh1+8j1nFbYpiZOB4Xu075EUjPXHAcxGOlE2MoGxpiV0tpx0VntCCbklEpPcAfjo3jlb
	 W996aMGwuQJdJF6YWRC2ufsI7m+akQxZwre5yNssl0b8j1NputtdtOR3gY0vx6nAGUDYa
	 tJM0afZPZ4LJParjH+gJHutAFlyF9rYXacg/+pBDswB5/5pqXAFIForeKX5yqwd09cCt0
	 hU3iUWZGBvw5lH5OhyDYg7yxGEr6Kk0XGB6nK4brhX8U3CKbO4P4RlhG25Iga3EeKBcNR
	 Jn2Mldmjgt9hlQx4A2P0YhUTIXTqZnLk+HwIf6cSAXrawaX2Pa5Q/zJJRzalquyE1Tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794847187;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=anLUZAdg+yS//6sj2yfcS+Rizyqykf4Omnwq1z+HIPg=;
	b=hMeng7SuvJYUoUPMN0U6GiQZgGPIY/npC4D5pfQ5sOWBxLzcX3e1OG+V4Az+MtOo3AAn
	 81gtgZq4IOnhAucLyAl2/hxgVKHHwko3NhjYjSyd3Wik3+I5TTFFLiaHAwEYX7qieUsrF
	 +Hd3F21i4waktPHGgJTUBs+AnxWkB9rytU6U0JVD4yfU8iPzbdqC7Glerg/XH103lLRpA
	 0MVYsh0Uoa8T/hk6g4qS/UKh6l4n+EVIo5baXtTAnnhYUlm3yhH+KjDv1pZbb1F3s46x8
	 7462uLC/hh0duqTix5mTeO8DGoXEqPAf9bOJc+AystBcH0hpSftjlqqTCeOqwkUOmMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N6M3VN1G;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30DC606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:39:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F30DC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N6M3VN1G
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8b5a6f2f27fso1528900b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794847186; x=1795451986; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=anLUZAdg+yS//6sj2yfcS+Rizyqykf4Omnwq1z+HIPg=;
        b=N6M3VN1G5XJ1QnxdA+ltjlnKGwoFejKkcQ2jbsLkwpPHz8kVjpchKpwy2UFsBKOfr7
         DCBXIAAOZno0B1CQ8Pnk0Ei7T14WX1gWMFf9eS7+ZM9jE2R9xpAuHly/Ny0U2TmdBMAT
         KuyM1em8ZaLj5v6DBUNw6yDQDIc72FVX+mmoz009K/sEZCxZw4uTSgCGEoLnxmZ9C27Z
         5X5VOZJlXLLzGELzTKwPQMvs89auWI+YI858+5dfhWS0+mXV5RdrTPKC7/8KBqgD015M
         +x3Q0mPRicmLDO/tevjKa96dd44kgicrhWal5Q6U4srlHUrn00QaE1sBk/4zrsmFi9TW
         Ynog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794847186; x=1795451986;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=anLUZAdg+yS//6sj2yfcS+Rizyqykf4Omnwq1z+HIPg=;
        b=dApG0F1+scrU9zu7t5EzBpGroufZUmwDEMSdrz8WGAQehNFjdnX04yLL0s0HY0bUK2
         ZWMfaFIweq8fDeRbxS+kvGwY58UtEc8EUaU383GN1MfS+q2DSqPlH6hFwAQ1jn0OLerv
         jrymWtX5jPDZCcVGbqXoDurmeBxmvt948jmXF/e353OKLOhACsBdFM63yBAvkovsVa5B
         h8bUscQIkVMoJ2eQiMppSr72y4qa3pSH0hqogFzssBx5HWTSxLMFQM9GxcTyQ5oHnsJK
         XyVZg903kTxENLaOSYtsov7jh0ZeZckNNeZOw5khSx6BQmF5TUjNStoAwX+Y09oVpTbH
         +LQQ==
X-Forwarded-Encrypted: i=1; AL+hErGFKmniA+hx4SvrANS8qMWE3CPL9RSV1DaC42eAw2ujO5yJZq/h8vvMVbGDWuOe6iMLkd8kMtCxqKX4NhU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9DS8M6Y+1YL5Z1A/SWOcpv2Zt/ag1fo+E0GpxfONdLPo79Ctm0
	srLzNibTzqmfwb5aq6f5ursnsSfLNDpRC7YENcrP0EEskDsDfeJFD8uT
X-Gm-Gg: AYBFou1khDbIxEU1iiKwIxRYC6lly/g76/ExAl1DQN98yzGsqa0+ptAh5D8/EwZaobZ
	vKHZxwu15C8GRB03Ez0E0SwaTvgF0RZt03/GfsiO9ubQaOS3wFy+i+6Nt+AHCVMpS5IaptQ9tmj
	Ic+0Aegelcq+a/lyVNGifFbu3k7AoY/N0CbPjw5uuy9nuoJdJfDuDRGsw+iTqHMnmtHRfjy3vqj
	H2aXQuE/x+8ZvltYhhV7mLX6l/gtscL2gD8+w+AUQDGPK47KN3vEX01Ic8FNf5nrNHI0UF4LUYt
	xAtkPXD/ihmhMOsq2k7q/qcjK3m2KVzw4r9S5LFT/MHKl+Ra5EYP+gngccj74R0GJ/49JjGJxJT
	KVyL8cGfIUwGDx2JY80+O6Z8Z86JrAncbwZ7T+9Rt2OoJ576FV98uz4GE53Qu9q4LYvi7Rphy27
	eG+dudfV40+En2rbovClw4mLsJxb9S225ofj6t/utdiJcN8XvA8Sj6MrSKkxZya9IHGi/nDHnRG
	zYqrIZ/h+8/9As1Z8mQRg+fdCJaehJLNiGJM4G+L5hik9+rPPEELwnJ+67eO35w3r34HdGTyGrK
	cI/2Q1Ft3HC8H3XG5ZuFPi2Y1ueyfI0vNCGiygA1N9yBucSiodvnoE9C7MuVwthbgb4IXs6LmWY
	=
X-Received: by 2002:a05:6a00:4b54:b0:886:3a6c:a9da with SMTP id d2e1a72fcca58-8beb619a613mr10209991b3a.26.1794847185885;
        Mon, 16 Nov 2026 08:39:45 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([49.207.233.38])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed2b199cesm4137290b3a.52.2026.11.16.08.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:39:45 -0800 (PST)
Date: Mon, 16 Nov 2026 22:09:38 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Ritesh Harjani <ritesh.list@gmail.com>
Cc: Shrikanth Hegde <sshegde@linux.ibm.com>, maddy@linux.ibm.com, 
	linuxppc-dev@lists.ozlabs.org, chzigotzky@xenosoft.de, mpe@ellerman.id.au, npiggin@gmail.com, 
	christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org, msuchanek@suse.de, 
	harshpb@linux.ibm.com, gautam@linux.ibm.com, amachhiw@linux.ibm.com, 
	venkat88@linux.ibm.com, nnmlinux@linux.ibm.com
Subject: Re: [PATCH v3 1/3] powerpc/irq: Add ppc_hard_irq_disable()
Message-ID: <avsxGj4j9P7eFwGO@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20261112130913.4124175-1-sshegde@linux.ibm.com>
 <20261112130913.4124175-2-sshegde@linux.ibm.com>
 <fqx4802o.ritesh.list@gmail.com>
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
In-Reply-To: <fqx4802o.ritesh.list@gmail.com>

On Sat, Nov 14, 2026 at 10:46:15AM +0530, Ritesh Harjani wrote:
> Shrikanth Hegde <sshegde@linux.ibm.com> writes:
> 
> > Add a flavour of interrupt disable which could be used in
> > multiple places which also takes care of lockdep in both 32 and
> > 64 bit archs.
> >
> > On PPC64:
> > - Disable hard interrupts using hard_irq_disable. It takes care of
> >   lockdep and tracing. local_irq_disable only alters softmask's state.
> >
> > On PPC32:
> > - Interrupts are hard disabled with local_irq_disable. It also takes
> >   care of lockdep and tacing.
> >
> > Subsequent patch uses this API in KVM code to avoid the warnings.
> > Wider use of it is possible, but it will be taken subsequently.
> >
> > Suggested-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> > Tested-by: Christian Zigotzky <chzigotzky@xenosoft.de>
> > Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
> > Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> > ---
> >  arch/powerpc/include/asm/hw_irq.h | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> >
> > diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm/hw_irq.h
> > index b7eee6385ae5..075442366e1e 100644
> > --- a/arch/powerpc/include/asm/hw_irq.h
> > +++ b/arch/powerpc/include/asm/hw_irq.h
> > @@ -516,6 +516,23 @@ static inline unsigned long mtmsr_isync_irqsafe(unsigned long msr)
> >  
> >  #define ARCH_IRQ_INIT_FLAGS	IRQ_NOREQUEST
> >  
> > +/*
> > + * Hard-disable interrupts while keeping the IRQ tracing state
> > + * consistent.
> > + *
> > + * On PPC64, local_irq_disable() only soft-disables interrupts, leaving
> > + * a window where an interrupt can be recorded in irq_happened before
> > + * interrupts are hard-disabled.
> > + *
> > + * On PPC32, hard_irq_disable() does not update the IRQ tracing state, so
> > + * use local_irq_disable().
> > + */
> > +#ifdef CONFIG_PPC64
> > +#define ppc_hard_irq_disable()	hard_irq_disable()
> > +#else
> > +#define ppc_hard_irq_disable()	local_irq_disable()
> > +#endif
> > +
> 
> So I looked up the history of how did we end up here. And looks like we
> will be papering over the problem, if we make the above change and add
> yet another helper on PPC :)
> 
> Ideally, ppc32 shouldn't need a hard_irq_disable() definition at all.
> As I understand it, the contract when this was all added was that, it is
> meant for architectures which implement lazy IRQ disabling i.e.
>     commit d04c56f73c30a5e593202ecfcf25ed43d42363a2
>     Author: Paul Mackerras <paulus@ozlabs.org>
>     Date:   Wed Oct 4 16:47:49 2006 +1000
>         [POWERPC] Lazy interrupt disabling for 64-bit machines
>  
> ...where local_irq_disable() only sets a soft mask. Code that really
> wants interrupts disabled at the hardware level then calls
> hard_irq_disable() as well.
> 
> This commit which defined a generic stub for hard_irq_disable() makes the
> contract clear i.e.
>     commit 2d3fbbb391e280724f7f7804ab00ff61cf1b6a4c
>     Author: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>     Date:   Thu May 10 22:22:46 2007 -0700
> 
>         Add hard_irq_disable()
> which says:
>     This patch implements a generic hard_irq_disable() function which is meant to
>     be called -after- local_irq_disable() and ensures that interrupts are fully
>     disabled on that CPU.  The default implementation is a nop, though powerpc
>     does already provide an appropriate one.
> 
> And then the following even implements such a contract in stop_machine() i.e.:
>     commit a12bb44471b819c7f33d8a83044e7116c124e3d5
>     Author: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>     Date:   Thu May 10 22:22:47 2007 -0700
> 
>         stop_machine() now uses hard_irq_disable
> 
>         Add a call to hard_irq_disable() to stop_machine so that we make sure IRQs are
>         really disabled and not only lazy-disabled on archs like powerpc as some users
>         of stop_machine() may rely on that.
> 
>         [akpm@linux-foundation.org: build fix]
>         Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>         Acked-by: Rusty Russell <rusty@rustcorp.com.au>
>         Cc: Paul Mackerras <paulus@samba.org>
>         Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
>         Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
> 
>     diff --git a/kernel/stop_machine.c b/kernel/stop_machine.c
>     index daabb74ee0bc..fcee2a8e6da3 100644
>     --- a/kernel/stop_machine.c
>     +++ b/kernel/stop_machine.c
>     @@ -8,6 +8,8 @@
>     #include <linux/sched.h>
>     #include <linux/stop_machine.h>
>     #include <linux/syscalls.h>
>     +#include <linux/interrupt.h>
>     +
>     #include <asm/atomic.h>
>     #include <asm/semaphore.h>
>     #include <asm/uaccess.h>
>     @@ -45,6 +47,7 @@ static int stopmachine(void *cpu)
>             if (stopmachine_state == STOPMACHINE_DISABLE_IRQ 
>                 && !irqs_disabled) {
>                 local_irq_disable();
>     +			hard_irq_disable();
>                 irqs_disabled = 1;
>                 /* Ack: irqs disabled. */
>                 smp_mb(); /* Must read state first. */
>     @@ -124,6 +127,7 @@ static int stop_machine(void)
> 
>         /* Make them disable irqs. */
>         local_irq_disable();
>     +	hard_irq_disable();
>         stopmachine_set_state(STOPMACHINE_DISABLE_IRQ);
> 
>         return 0;
> 
> 
> However, note that after introducing the lazy interrupt disabling in
> 2006, we saw build failures on ppc32, since hard_irq_disable()
> definition didn't exist on that until then. This commit adds that
> definition, which is not wrong, since the lazy interrupt disabling patch
> really needed hard_irq_disable() to disable hardware interrupts. Hence
> this commit defined it on PPC32 as well, as local_irq_disable() itself
> i.e.
> 
>     commit 143db67af02cecab28032ec3a52e586b1433fe70
>     Author: Michael Ellerman <michael@ellerman.id.au>
>     Date:   Sun Nov 26 17:36:15 2006 +1100
> 
>         [POWERPC] Provide dummy hard_irq_enable/disable() for PPC32
> 
>         To allow arch/powerpc/kernel/crash.c to build on 32-bit we need a
>         definition of hard_irq_disable(). 32-bit doesn't support the lazy
>         interrupt disabling mechanism, so on 32-bit hard_irq_disable() is
>         simply local_irq_disable(). Add a definition for hard_irq_enable()
>         just for completeness.
> 
>         This allows (KEXEC=y && PPC32=y) to build again. Broken since
>         d04c56f73c30a5e593202ecfcf25ed43d42363a2.
> 
>         Signed-off-by: Michael Ellerman <michael@ellerman.id.au>
>         Signed-off-by: Paul Mackerras <paulus@samba.org>
> 
>     diff --git a/include/asm-powerpc/hw_irq.h b/include/asm-powerpc/hw_irq.h
>     index fd3f2a206271..d604863d72fb 100644
>     --- a/include/asm-powerpc/hw_irq.h
>     +++ b/include/asm-powerpc/hw_irq.h
>     @@ -102,6 +102,9 @@ static inline void local_irq_save_ptr(unsigned long *flags)
>     #define local_irq_save(flags)	local_irq_save_ptr(&flags)
>     #define irqs_disabled()		((mfmsr() & MSR_EE) == 0)
> 
>     +#define hard_irq_enable()	local_irq_enable()
>     +#define hard_irq_disable()	local_irq_disable()
>     +
>     #endif /* CONFIG_PPC64 */
> 
>     #define mask_irq(irq)						\
> 
> 
> Note that the above is where we first defined hard_irq_disable() for
> PPC32.
> Ideally, IIUC, we don't really need this on PPC32 assuming the contract
> is only for archs which uses lazy interrupt disabling (i.e. PPC64),
> however, there were places where we ended up using hard_irq_disable()
> assuming it disables hardware interrupts for both PPC32 and PPC64 code
> and later maybe at a number of other places too.
> 
> Note that until this time, lockdep and IRQ tracing was not added. So it
> wasn't a problem. However, later somewhere we ended up changing the
> definition of hard_irq_disable(), to arch_local_irq_disable, maybe in
> this...
>    commit 5d38902c4838 ("powerpc: Add irqtrace support for 32-bit powerpc")
> 
> 
> So IMO, in the longer term, I think we don't need hard_irq_disable() for
> PPC32, and it should fallback to generic empty stub, after we fix all
> those code paths and use appropriate helpers there. However, that might
> need careful inspection of a lot of code paths.
> 
Yeah this makes sense. PPC32 shouldn't have hard_irq_disable at all.

> 
> Hence, meanwhile, I think instead of defining another helper like
> ppc_hard_irq_disable(), (which was stupid on my part to even suggest w/o
> looking at this history), we should change hard_irq_disable() definition
> back to local_irq_disable() for PPC32, which anyways takes care of
> trace_hardirqs_off().
> 
> Therefore, I think we need the following 2 diffs - which should fix both
> of the reported issues as well. And this way, we don't need another hard
> irq disabling helper on PPC.
> 
> DIFF(1)
> 
>     diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm/hw_irq.h
>     index b7eee6385ae5..ddb850e62abd 100644
>     --- a/arch/powerpc/include/asm/hw_irq.h
>     +++ b/arch/powerpc/include/asm/hw_irq.h
>     @@ -464,7 +464,7 @@ static inline bool arch_irqs_disabled(void)
>             return arch_irqs_disabled_flags(arch_local_save_flags());
>      }
>     
>     -#define hard_irq_disable()             arch_local_irq_disable()
>     +#define hard_irq_disable()             local_irq_disable()
>     
>      static inline bool regs_irqs_disabled(struct pt_regs *regs)
>      {
> 
> 
> and...
> 
> DIFF(2)
> 
>     diff --git a/arch/powerpc/kvm/booke.c b/arch/powerpc/kvm/booke.c
>     index 13ad4cf5fa71..543479fc9630 100644
>     --- a/arch/powerpc/kvm/booke.c
>     +++ b/arch/powerpc/kvm/booke.c
>     @@ -722,7 +722,6 @@ int kvmppc_core_prepare_to_enter(struct kvm_vcpu *vcpu)
>             if (vcpu->arch.shared->msr & MSR_WE) {
>                     local_irq_enable();
>                     kvm_vcpu_halt(vcpu);
>     -               local_irq_disable();
>                     hard_irq_disable();
> 
>                     kvmppc_set_exit_type(vcpu, EMULATED_MTMSRWE_EXITS);
>     diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
>     index 9194cf492d1c..f4db7dea57b3 100644
>     --- a/arch/powerpc/kvm/powerpc.c
>     +++ b/arch/powerpc/kvm/powerpc.c
>     @@ -81,12 +81,6 @@ int kvmppc_prepare_to_enter(struct kvm_vcpu *vcpu)
>             int r;
> 
>             WARN_ON(irqs_disabled());
>     -       /*
>     -        * local_irq_disable() first: on 32-bit, hard_irq_disable() alone is a
>     -        * raw MSR[EE] clear that bypasses the lockdep/irq-tracing state, and
>     -        * the xfer_to_guest_mode helpers assert IRQs are seen as disabled.
>     -        */
>     -       local_irq_disable();
>             hard_irq_disable();
> 
>             while (true) {
>     @@ -101,7 +95,6 @@ int kvmppc_prepare_to_enter(struct kvm_vcpu *vcpu)
>                             */
>                             local_irq_enable();
>                             r = kvm_xfer_to_guest_mode_handle_work(vcpu);
>     -                       local_irq_disable();
>                             hard_irq_disable();
>                             if (r) {
>                                     /*
>     @@ -134,7 +127,6 @@ int kvmppc_prepare_to_enter(struct kvm_vcpu *vcpu)
>                             local_irq_enable();
>                             trace_kvm_check_requests(vcpu);
>                             r = kvmppc_core_check_requests(vcpu);
>     -                       local_irq_disable();
>                             hard_irq_disable();
>                             if (r > 0)
>                                     continue;
> 
> 
> @Shrikanth, @Mukesh, your thoughts?
Yeah this looks good. We can go ahead with this implementation.
> If this looks good to you too, would you like to take this forward?
> 
> And, if I am not wrong, with the above 2 diffs, we don't need this patch
> either [1].
> 
> [1]: [PATCH] powerpc/entry: Trace the IRQ disable before irqentry_exit() on 32-bit
> [1]: https://lore.kernel.org/linuxppc-dev/a14571be1897955f43d9994f0e093de3ada6ecde.1793447880.git.ritesh.list@gmail.com/
> 
> 
> 
> -ritesh
Regards,
Mukesh
