Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794652576;
	b=JlPrk9nB4e6SO+PsLfYxbvP+h8UYy20N7wjl8jRRFktxClJ6qY9ZUCndePnJjvBVs81C
	 aqaqQcmEujpF0llR3bJzVv4xe1bm3dcSWqT2O5A+sWub8NvqCkJ4WeMOVZD6q75wzR4iB
	 thvC7udt1N+SxVIyBTWAGV8EAuoKbb4FPUSKxL0dSbGmzvj4Ds0/3nuzPwbKIDgCey8Tk
	 sM9AHH0JRAJumn+gkQdYrkzv6wmMioQsxlXujmk4aHLx0DAvoZ6Fn/UxHLNmWkhU8Od+2
	 XIi+2Fz+8Y4MOPzDmamPKjhBVJHOcCW2ebjLMjxPoNo/CGoNfKei4Jy+3Sh4b8jvuYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794652576;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References;
	bh=eo/LUF38V7+DYWv6Y1kyhmG3AAWawCm0XQ6aJuiVHCw=;
	b=J4XUczJUMkIlM+5gPCX/fnUypGB1aKtksYPB5bH5g/2fLCku3ki+eRli2l0BjL9a0zfD
	 y+hka5T4AnA74zuXGyB2Q8KWaTVZIYu47kKQhiaeZEkNMFHViQaRB1S5SjQQZmxJrRrxc
	 t+IMa0k0dC/jR2miuQcr6RI62M2swySU7ce6lhHrunA7Rud1T4Kh95rH3/O0j096HMalf
	 0aEipTRWEystesT4r4vcc9EqtAB92lT4L6PeQv1JiT3JMhN1ZJn+hX0GU4IjIIhWoHljG
	 WmHAJh/lebqAq4EvzlWFM29Oi7uTjX+l2G3WTttyP6OyV6i3FquxuDzE9fqhJgZxOtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gx4fQqI2;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F27606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 10:36:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04F27606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gx4fQqI2
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-372bdb942dbso1980461eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 02:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794652575; x=1795257375; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=eo/LUF38V7+DYWv6Y1kyhmG3AAWawCm0XQ6aJuiVHCw=;
        b=gx4fQqI2NwyYx3z2F5xSvBf3epI9E9WuGjvjgXmb44FXs9nvEpXK1Z7JERf2nkEa5H
         t0hBtzX0m85sJnUZ5xOyogLTNog0caZEEDVlDkp/XQhwjLUhg2DzMetRXtFcFYPI9A2n
         A9R6566OGL+dhUeVB2z3Q0DGFj5dxW1fB2hO1a42k2bis3UopDjF/gJ0MRo6F6KF906f
         DnmlAQmZO9BObNX5O7I7yy59BTczpWK4G4OslE0v9P7RfrFfoEt3YJtZV0P4JNYyu15Z
         plOBhm7t1L9ALL/RxY9DIdK3GLA3LX7zwX5FY4Tq+udbKEfVp23ImdR72fxqpHlcwL9S
         gKZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794652575; x=1795257375;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eo/LUF38V7+DYWv6Y1kyhmG3AAWawCm0XQ6aJuiVHCw=;
        b=cvQ4+3FsYlPs2/L7Sp8RYiLT3VFIMgVGrG/YWhyTJwcTMSgQXYaaiDFzzIEAdc7bm5
         vHb7fLb5aKMgyzEabRQYonCk5LHouccf5gPZerlywkosC9Kit/3f5+GTvgNTqT51pu3g
         a7CmVAVrYNLuAwWh7PNAjWTMtWesuIKTUycEwGlGcZ0Evq+f7t9lYZmY/yukWUfKG3Gb
         3Ua3Q8eu9BcGOB0soyMGSzfohii2hWuEq3mQZzNfCiXUiK/8M9NoAJiDbY/XFOYJ8i9v
         NRaloOxX/hpkaBnZEtEg1JqLIvEqg4tbEzk8+fD+wwrWf56WE3k9fMIVESXxNbmfGtQp
         Rj+g==
X-Forwarded-Encrypted: i=1; AL+hErEUmKtQ1wqFnYHMQRHWBntqlfbW4RDdrcCY+9flO4Cc7nmAFDM0UTPEzcIvhctFsX80vOAUEPTsEHOwHQs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Qx1DSFgukGyCH+mDXusRyvv2iBbZAFikZqohkTlaDLO1ClA25
	/TLR3DDRR2ClG2d7cst7apn4zhxQzIYwoyqd8FbRP2I9pkBNZk2qfrHV
X-Gm-Gg: AYBFou1lnlLvwLUgvRYQdbIPHgh43j64C2BP3lgV4IziVjrskeJIcLECnHq1fj664IR
	+Fv5Uvvdk+9FYCE4hHrwdWbcb9ind2botLUCuk0DJXmDIvf9UCgATwl3Sm8jXfUrywjKf+TlIbL
	0H33RFoC4wF9xfv/hpg8Gr9j95QLbmBdUmN436dZVWUw0CRue9phx5B/tcoiyFiyTDJ/poEe35t
	Ezaxk22exKs3Qz/d+v5j4T/6lyil/MVmDQQRKRF296FfrN7HH4cJhjhxft8Ozr4F+Bb4wkyyW81
	1R91ryBZfe0ZCSn9TONK/EsQ944M7742MNC1cLGGDIIkbAWbC82Nj1IUfMAxSRZgeJBIaAQwmuN
	ePUs7z1VNcPES/iFtoAQMiDqOVIe8gxzAHffKD1vuBnP8dCMkyZu1mUEi/q5BFipq+ER+7ireSF
	6vdRnkbEpvEHAD9hmLA4vPG0vTLeun7oSAjluwCSH6EWnzCjNrWlEZQJFSTvuEF1U6NTvC6fvT+
	FbgaWTep4HRze9m8TXkfiqFapOqzAdVAVNNC9JymhGxOya1h/HrK3iEOPsS0fnUd2SCRrbhde3N
	WtCobgP32MNa0SVbiB6S/DfvVL2lnAP9sMH+7/NRf1TEaCZOFA==
X-Received: by 2002:a05:693c:808f:b0:351:29c8:643 with SMTP id 5a478bee46e88-379675fc97fmr4946543eec.18.1794652574783;
        Sat, 14 Nov 2026 02:36:14 -0800 (PST)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955ffcbc9sm23108783eec.18.2026.11.14.02.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 02:36:13 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, chzigotzky@xenosoft.de
Cc: sshegde@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org, msuchanek@suse.de, harshpb@linux.ibm.com, gautam@linux.ibm.com, amachhiw@linux.ibm.com, venkat88@linux.ibm.com, nnmlinux@linux.ibm.com, mkchauras@gmail.com
Subject: Re: [PATCH v3 1/3] powerpc/irq: Add ppc_hard_irq_disable()
In-Reply-To: <20261112130913.4124175-2-sshegde@linux.ibm.com>
Date: Sat, 14 Nov 2026 10:46:15 +0530
Message-ID: <fqx4802o.ritesh.list@gmail.com>
References: <20261112130913.4124175-1-sshegde@linux.ibm.com> <20261112130913.4124175-2-sshegde@linux.ibm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Shrikanth Hegde <sshegde@linux.ibm.com> writes:

> Add a flavour of interrupt disable which could be used in
> multiple places which also takes care of lockdep in both 32 and
> 64 bit archs.
>
> On PPC64:
> - Disable hard interrupts using hard_irq_disable. It takes care of
>   lockdep and tracing. local_irq_disable only alters softmask's state.
>
> On PPC32:
> - Interrupts are hard disabled with local_irq_disable. It also takes
>   care of lockdep and tacing.
>
> Subsequent patch uses this API in KVM code to avoid the warnings.
> Wider use of it is possible, but it will be taken subsequently.
>
> Suggested-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> Tested-by: Christian Zigotzky <chzigotzky@xenosoft.de>
> Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/hw_irq.h | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm/hw_irq.h
> index b7eee6385ae5..075442366e1e 100644
> --- a/arch/powerpc/include/asm/hw_irq.h
> +++ b/arch/powerpc/include/asm/hw_irq.h
> @@ -516,6 +516,23 @@ static inline unsigned long mtmsr_isync_irqsafe(unsigned long msr)
>  
>  #define ARCH_IRQ_INIT_FLAGS	IRQ_NOREQUEST
>  
> +/*
> + * Hard-disable interrupts while keeping the IRQ tracing state
> + * consistent.
> + *
> + * On PPC64, local_irq_disable() only soft-disables interrupts, leaving
> + * a window where an interrupt can be recorded in irq_happened before
> + * interrupts are hard-disabled.
> + *
> + * On PPC32, hard_irq_disable() does not update the IRQ tracing state, so
> + * use local_irq_disable().
> + */
> +#ifdef CONFIG_PPC64
> +#define ppc_hard_irq_disable()	hard_irq_disable()
> +#else
> +#define ppc_hard_irq_disable()	local_irq_disable()
> +#endif
> +

So I looked up the history of how did we end up here. And looks like we
will be papering over the problem, if we make the above change and add
yet another helper on PPC :)

Ideally, ppc32 shouldn't need a hard_irq_disable() definition at all.
As I understand it, the contract when this was all added was that, it is
meant for architectures which implement lazy IRQ disabling i.e.
    commit d04c56f73c30a5e593202ecfcf25ed43d42363a2
    Author: Paul Mackerras <paulus@ozlabs.org>
    Date:   Wed Oct 4 16:47:49 2006 +1000
        [POWERPC] Lazy interrupt disabling for 64-bit machines
 
...where local_irq_disable() only sets a soft mask. Code that really
wants interrupts disabled at the hardware level then calls
hard_irq_disable() as well.

This commit which defined a generic stub for hard_irq_disable() makes the
contract clear i.e.
    commit 2d3fbbb391e280724f7f7804ab00ff61cf1b6a4c
    Author: Benjamin Herrenschmidt <benh@kernel.crashing.org>
    Date:   Thu May 10 22:22:46 2007 -0700

        Add hard_irq_disable()
which says:
    This patch implements a generic hard_irq_disable() function which is meant to
    be called -after- local_irq_disable() and ensures that interrupts are fully
    disabled on that CPU.  The default implementation is a nop, though powerpc
    does already provide an appropriate one.

And then the following even implements such a contract in stop_machine() i.e.:
    commit a12bb44471b819c7f33d8a83044e7116c124e3d5
    Author: Benjamin Herrenschmidt <benh@kernel.crashing.org>
    Date:   Thu May 10 22:22:47 2007 -0700

        stop_machine() now uses hard_irq_disable

        Add a call to hard_irq_disable() to stop_machine so that we make sure IRQs are
        really disabled and not only lazy-disabled on archs like powerpc as some users
        of stop_machine() may rely on that.

        [akpm@linux-foundation.org: build fix]
        Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
        Acked-by: Rusty Russell <rusty@rustcorp.com.au>
        Cc: Paul Mackerras <paulus@samba.org>
        Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
        Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>

    diff --git a/kernel/stop_machine.c b/kernel/stop_machine.c
    index daabb74ee0bc..fcee2a8e6da3 100644
    --- a/kernel/stop_machine.c
    +++ b/kernel/stop_machine.c
    @@ -8,6 +8,8 @@
    #include <linux/sched.h>
    #include <linux/stop_machine.h>
    #include <linux/syscalls.h>
    +#include <linux/interrupt.h>
    +
    #include <asm/atomic.h>
    #include <asm/semaphore.h>
    #include <asm/uaccess.h>
    @@ -45,6 +47,7 @@ static int stopmachine(void *cpu)
            if (stopmachine_state == STOPMACHINE_DISABLE_IRQ 
                && !irqs_disabled) {
                local_irq_disable();
    +			hard_irq_disable();
                irqs_disabled = 1;
                /* Ack: irqs disabled. */
                smp_mb(); /* Must read state first. */
    @@ -124,6 +127,7 @@ static int stop_machine(void)

        /* Make them disable irqs. */
        local_irq_disable();
    +	hard_irq_disable();
        stopmachine_set_state(STOPMACHINE_DISABLE_IRQ);

        return 0;


However, note that after introducing the lazy interrupt disabling in
2006, we saw build failures on ppc32, since hard_irq_disable()
definition didn't exist on that until then. This commit adds that
definition, which is not wrong, since the lazy interrupt disabling patch
really needed hard_irq_disable() to disable hardware interrupts. Hence
this commit defined it on PPC32 as well, as local_irq_disable() itself
i.e.

    commit 143db67af02cecab28032ec3a52e586b1433fe70
    Author: Michael Ellerman <michael@ellerman.id.au>
    Date:   Sun Nov 26 17:36:15 2006 +1100

        [POWERPC] Provide dummy hard_irq_enable/disable() for PPC32

        To allow arch/powerpc/kernel/crash.c to build on 32-bit we need a
        definition of hard_irq_disable(). 32-bit doesn't support the lazy
        interrupt disabling mechanism, so on 32-bit hard_irq_disable() is
        simply local_irq_disable(). Add a definition for hard_irq_enable()
        just for completeness.

        This allows (KEXEC=y && PPC32=y) to build again. Broken since
        d04c56f73c30a5e593202ecfcf25ed43d42363a2.

        Signed-off-by: Michael Ellerman <michael@ellerman.id.au>
        Signed-off-by: Paul Mackerras <paulus@samba.org>

    diff --git a/include/asm-powerpc/hw_irq.h b/include/asm-powerpc/hw_irq.h
    index fd3f2a206271..d604863d72fb 100644
    --- a/include/asm-powerpc/hw_irq.h
    +++ b/include/asm-powerpc/hw_irq.h
    @@ -102,6 +102,9 @@ static inline void local_irq_save_ptr(unsigned long *flags)
    #define local_irq_save(flags)	local_irq_save_ptr(&flags)
    #define irqs_disabled()		((mfmsr() & MSR_EE) == 0)

    +#define hard_irq_enable()	local_irq_enable()
    +#define hard_irq_disable()	local_irq_disable()
    +
    #endif /* CONFIG_PPC64 */

    #define mask_irq(irq)						\


Note that the above is where we first defined hard_irq_disable() for
PPC32.
Ideally, IIUC, we don't really need this on PPC32 assuming the contract
is only for archs which uses lazy interrupt disabling (i.e. PPC64),
however, there were places where we ended up using hard_irq_disable()
assuming it disables hardware interrupts for both PPC32 and PPC64 code
and later maybe at a number of other places too.

Note that until this time, lockdep and IRQ tracing was not added. So it
wasn't a problem. However, later somewhere we ended up changing the
definition of hard_irq_disable(), to arch_local_irq_disable, maybe in
this...
   commit 5d38902c4838 ("powerpc: Add irqtrace support for 32-bit powerpc")


So IMO, in the longer term, I think we don't need hard_irq_disable() for
PPC32, and it should fallback to generic empty stub, after we fix all
those code paths and use appropriate helpers there. However, that might
need careful inspection of a lot of code paths.


Hence, meanwhile, I think instead of defining another helper like
ppc_hard_irq_disable(), (which was stupid on my part to even suggest w/o
looking at this history), we should change hard_irq_disable() definition
back to local_irq_disable() for PPC32, which anyways takes care of
trace_hardirqs_off().

Therefore, I think we need the following 2 diffs - which should fix both
of the reported issues as well. And this way, we don't need another hard
irq disabling helper on PPC.

DIFF(1)

    diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm/hw_irq.h
    index b7eee6385ae5..ddb850e62abd 100644
    --- a/arch/powerpc/include/asm/hw_irq.h
    +++ b/arch/powerpc/include/asm/hw_irq.h
    @@ -464,7 +464,7 @@ static inline bool arch_irqs_disabled(void)
            return arch_irqs_disabled_flags(arch_local_save_flags());
     }
    
    -#define hard_irq_disable()             arch_local_irq_disable()
    +#define hard_irq_disable()             local_irq_disable()
    
     static inline bool regs_irqs_disabled(struct pt_regs *regs)
     {


and...

DIFF(2)

    diff --git a/arch/powerpc/kvm/booke.c b/arch/powerpc/kvm/booke.c
    index 13ad4cf5fa71..543479fc9630 100644
    --- a/arch/powerpc/kvm/booke.c
    +++ b/arch/powerpc/kvm/booke.c
    @@ -722,7 +722,6 @@ int kvmppc_core_prepare_to_enter(struct kvm_vcpu *vcpu)
            if (vcpu->arch.shared->msr & MSR_WE) {
                    local_irq_enable();
                    kvm_vcpu_halt(vcpu);
    -               local_irq_disable();
                    hard_irq_disable();

                    kvmppc_set_exit_type(vcpu, EMULATED_MTMSRWE_EXITS);
    diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
    index 9194cf492d1c..f4db7dea57b3 100644
    --- a/arch/powerpc/kvm/powerpc.c
    +++ b/arch/powerpc/kvm/powerpc.c
    @@ -81,12 +81,6 @@ int kvmppc_prepare_to_enter(struct kvm_vcpu *vcpu)
            int r;

            WARN_ON(irqs_disabled());
    -       /*
    -        * local_irq_disable() first: on 32-bit, hard_irq_disable() alone is a
    -        * raw MSR[EE] clear that bypasses the lockdep/irq-tracing state, and
    -        * the xfer_to_guest_mode helpers assert IRQs are seen as disabled.
    -        */
    -       local_irq_disable();
            hard_irq_disable();

            while (true) {
    @@ -101,7 +95,6 @@ int kvmppc_prepare_to_enter(struct kvm_vcpu *vcpu)
                            */
                            local_irq_enable();
                            r = kvm_xfer_to_guest_mode_handle_work(vcpu);
    -                       local_irq_disable();
                            hard_irq_disable();
                            if (r) {
                                    /*
    @@ -134,7 +127,6 @@ int kvmppc_prepare_to_enter(struct kvm_vcpu *vcpu)
                            local_irq_enable();
                            trace_kvm_check_requests(vcpu);
                            r = kvmppc_core_check_requests(vcpu);
    -                       local_irq_disable();
                            hard_irq_disable();
                            if (r > 0)
                                    continue;


@Shrikanth, @Mukesh, your thoughts?
If this looks good to you too, would you like to take this forward?

And, if I am not wrong, with the above 2 diffs, we don't need this patch
either [1].

[1]: [PATCH] powerpc/entry: Trace the IRQ disable before irqentry_exit() on 32-bit
[1]: https://lore.kernel.org/linuxppc-dev/a14571be1897955f43d9994f0e093de3ada6ecde.1793447880.git.ritesh.list@gmail.com/



-ritesh
