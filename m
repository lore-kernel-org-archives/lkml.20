Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FB7519E00
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 16:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790095085; cv=none; b=MS3rlGj6OAfv6wfZlFhIF1B8Q5bm7B9BcrNOHefOna4nex2kRd3a+3WpGKrhDuaZy0S1UKmXmWAuBATM88fOAt8esUi+v7eGhBRgQdsuvecdDzi8pG4jgZpfgT5AUB0Ys2E17ZiI5zkSFPd0cm9uMNWy9ANAL74W14Myc7V1830=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790095085; c=relaxed/simple;
	bh=oWVWz9/UOGboFOBqCRKNmH51jELuYZDsjrQ9SROQhZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GZADZlSjHUa7JQbboQeE/URqfRzG4zlUuV8QIpZ0L1Rrj6bEOkjjfD4CdzB7kPPHmB/snjkqypIiCg5PLCsgh6CaTj/gn/s63t41sL+v8MgVlucClDbrkxlAV1KBvKbGySBs33XbLkpFn8i5tkKfrhfKNhK7ndVAUbjvYmWBIQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CMY8Hvr8; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CMY8Hvr8"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e8185e037so25504645e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790095074; x=1790699874; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NB1J3hVZLGBcKEFzRbrkKSyu3nClV6Zj2pFFC1qb/tE=;
        b=CMY8Hvr8By0P1jaUGeeF6iT+E6Xdl3nZYOOvA79Zv4PnYg/+1L0WMyPU6IAX0QeA0q
         rNUNqf+TfxYr3NXIEdlTYNzR37N+A2DTXy74OY3afMqka+NRBTw5jRrbrzc7SSEEbJIS
         APrDnP2zMtYRCQstGS1gI0EZ4EIB8eMGKnZ57x42E71UGKTAMPW2m/cFJLZVx+kZHPEL
         Xy0/b1EsIgKVY3Nm4kNgxxv7lywRsd/aLW2XEiaZfgtvkVllXZawQJHkH1gCoPRZeTw5
         6yh8f7cvl4GfZvZoaVN0QFG9tZxODRHyhM/PPuPNs0Xf1t6KeCDas84VdkQMjZ/qe/4f
         dkug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790095074; x=1790699874;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NB1J3hVZLGBcKEFzRbrkKSyu3nClV6Zj2pFFC1qb/tE=;
        b=r35wEpbzKFewcGHq9Bssg1yFcOzKdtJJhZRQMrIbXdfNvWnd9aoR9QCnSD9DRpWUQX
         2MkZOG2vONU3rJGNA4K4Ue8GmFq490jwe/RI0mVLl7TW2d+7WiycPmABF05WJ5qNtcfZ
         8BGvGE0YhlQHidUXs66P/pJVqrAEy25hdU/6gTxYo6u05Ny/MYwRBXStdYPLAczCFLsw
         zTg6zkTYLwxruWFBxiVpE9+IDlar/LAvHaKgq8EitYvv6XNFQofZ6SSNPIZlCG4jBSSl
         5GI6K90xRzB/fmX7KUIXw/Zas/Lh5TC4TKJEBEGMAW1xabWftORk1lL1M0Rx4ybX74xD
         EFVg==
X-Forwarded-Encrypted: i=1; AKwUvBxg43bQjKFatNKxG0AGVaWF9cRv3XwEJfsVh9WNggVidrQJHbflk0JNOLdD1dVq4zeDB7XJujjpx3mFND4=@vger.kernel.org
X-Gm-Message-State: AFuF++nkKwJBDJrzlayoxLrx02+3Okcijg4Eb3g0K7wlYrcA8orCW03g
	kQ0vescBqx4cV6U938MnCwwsSvbIhMfozP/Kx1YyjKW4ODpQnfXpOcH0bif5ENuDKg==
X-Gm-Gg: AYBFou3ANG5+qUsrk3knPrcNRZv1TO5ZjNRspVzEd4R5A2CjdbZPCjhMGWGuQbxApnB
	3503TEfQRSS8zy/5/JlI3iaWiX/7eKMPLFFuDboEu+nastUHJ7TN9KYpKYdyZ6HmNaeTkn49shh
	fFSRD/tVWCvc0m9uDABdVTsrGIzzOAMgVYO+X8HWSzkKJcSbKCqaIhB5UUEp1VzT7JDsobg0CJS
	o2hT493Twv3KSJ4bMNZwu0S0KkQtts0GFyMZ51tFXiTeQLpzZpxmOR05xX7J2xzx1HeIZEw7ROI
	D1IqLm85g0gU2EJmKcLfF32ILPys/Up8dTdKzg8pZQNKugMhEL8CFySQp3NilBmveGuhHaEV+lw
	YRLH2JyrsBW3EmY34Am589DAmJ6BFBQOEUrpqHGHDKErWYPkHSUCCNSQ/BNu1uqaOZ+Erh/JbcS
	hmSRxv7dF/h+gpiZvML7mA3xRNIiqhzXeWCIP+g0vE4af/1SU9t4hwmF6aUHz3uSbHr5hn42AWK
	nRl9uhBgsNuUIeY06BxyhSoQ4ZLm19AqOLvmsAnbEg=
X-Received: by 2002:a05:600c:1989:b0:49c:e42b:a4ac with SMTP id 5b1f17b1804b1-49fc5714d14mr215915795e9.11.1790095073306;
        Tue, 22 Sep 2026 09:37:53 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1ccb90sm2616575e9.6.2026.09.22.09.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 09:37:52 -0700 (PDT)
Date: Tue, 22 Sep 2026 17:37:49 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	catalin.marinas@arm.com, will@kernel.org, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	mark.rutland@arm.com, steven.price@arm.com, qperret@google.com,
	tabba@google.com
Subject: Re: [PATCH v3 10/18] KVM: arm64: Handle PSCI calls for protected VMs
 at EL2
Message-ID: <arKu3SkgM9kftBEv@google.com>
References: <20260914113338.159227-1-fuad.tabba@linux.dev>
 <20260914113338.159227-11-fuad.tabba@linux.dev>
 <arKuPQ-w5EFXo-n8@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arKuPQ-w5EFXo-n8@google.com>

On Tue, Sep 22, 2026 at 05:35:09PM +0100, Vincent Donnefort wrote:
> On Mon, Sep 14, 2026 at 12:33:30PM +0100, Fuad Tabba wrote:
> > EL2 implements PSCI 1.1 for protected VMs: CPU_ON, CPU_OFF,
> > PSCI_VERSION and PSCI_FEATURES are decided at EL2 (CPU_ON and CPU_OFF
> > still exit to the host, which only schedules or parks the target),
> > AFFINITY_INFO, CPU_SUSPEND and the platform power operations are
> > forwarded to the host, and anything else returns NOT_SUPPORTED,
> > including the TRNG calls and the functions above 1.1, SYSTEM_OFF2
> > among them, that the host handled for a protected guest until now.
> > TRNG for protected guests is a follow-up. AFFINITY_INFO stays
> > with the host, which returns OFF only once it has parked the target:
> > the host is what a guest polls to see a CPU_OFF complete before it
> > issues the next CPU_ON, as Linux does on hotplug.
> > 
> > Three consequences follow:
> > 
> >   - A protected VM has one primary vCPU, the first whose hyp vCPU is
> >     created with mp_state RUNNABLE. A second one, or an mp_state other
> >     than RUNNABLE or STOPPED, fails that vCPU's first KVM_RUN with
> >     -EINVAL.
> > 
> >   - CPU_ON finds its target among the hyp vCPUs, which exist from the
> >     target's first KVM_RUN; before that the guest gets
> >     INVALID_PARAMETERS.
> > 
> >   - A vCPU EL2 holds powered off doesn't run: handle___kvm_vcpu_run()
> >     returns ARM_EXCEPTION_IL, reported as KVM_EXIT_FAIL_ENTRY. Its
> >     existing bail-outs return the same code instead of an -EINVAL that
> >     handle_exit() didn't recognise, for every hyp vCPU.
> > 
> > Non-protected VMs keep power_state ON and accept any mp_state.
> > 
> > Each protected vCPU is OFF, ON_PENDING or ON. CPU_ON moves the target
> > to ON_PENDING, and the target's next run resets it and moves it to ON.
> > The racing transitions are cmpxchg, and the reset state is published
> > with a release/acquire pair, documented at each site. CPU_OFF publishes
> > OFF with a release, so the target's clear of reset_state.reset is
> > ordered before it and a CPU_ON that then wins on OFF republishes after
> > the clear. Rolling a CPU_ON the host failed back to OFF needs the
> > host's return value, which the per-EC marshalling patch delivers along
> > with the rollback. Until then such a target stays ON_PENDING, and the
> > reset has no observable effect: flush_hyp_vcpu() copies the host's
> > context in on every entry until that patch removes the copy, so the
> > target enters on the host's values rather than the ones EL2 reset.
> > 
> > Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> > ---
> >  arch/arm64/kvm/hyp/include/nvhe/pkvm.h |  14 ++
> >  arch/arm64/kvm/hyp/nvhe/hyp-main.c     |  25 ++-
> >  arch/arm64/kvm/hyp/nvhe/pkvm.c         | 283 ++++++++++++++++++++++++-
> >  3 files changed, 311 insertions(+), 11 deletions(-)
> > 
> > diff --git a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
> > index a04b7c04d5135..63b368baf0e72 100644
> > --- a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
> > +++ b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
> > @@ -29,6 +29,12 @@ struct pkvm_hyp_vcpu {
> >  
> >  	/* The previous exit's ARM_EXCEPTION_* code. */
> >  	u32 exit_code;
> > +
> > +	/*
> > +	 * PSCI_0_2_AFFINITY_LEVEL_{OFF, ON_PENDING, ON}. A non-protected
> > +	 * vCPU is always ON.
> > +	 */
> > +	int power_state;
> >  };
> >  
> >  /*
> > @@ -46,6 +52,12 @@ struct pkvm_hyp_vm {
> >  	struct hyp_pool pool;
> >  	hyp_spinlock_t lock;
> >  
> > +	/*
> > +	 * The vCPU initialised RUNNABLE: claimed under vm_table_lock,
> > +	 * released only if its own init fails.
> > +	 */
> > +	struct pkvm_hyp_vcpu *primary_vcpu;
> > +
> >  	/* Array of the hyp vCPU structures for this VM. */
> >  	struct pkvm_hyp_vcpu *vcpus[];
> >  };
> > @@ -98,4 +110,6 @@ void kvm_init_pvm_id_regs(struct kvm_vcpu *vcpu);
> >  void kvm_reset_pvm_sys_regs(struct kvm_vcpu *vcpu);
> >  int kvm_check_pvm_sysreg_table(void);
> >  
> > +int pkvm_reset_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu);
> > +struct pkvm_hyp_vcpu *pkvm_mpidr_to_hyp_vcpu(struct pkvm_hyp_vm *vm, u64 mpidr);
> >  #endif /* __ARM64_KVM_NVHE_PKVM_H__ */
> > diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > index 9cc8ef16897c1..da8ab636063cf 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > @@ -8,6 +8,7 @@
> >  #include <hyp/switch.h>
> >  
> >  #include <linux/irqchip/arm-gic-v3.h>
> > +#include <uapi/linux/psci.h>
> >  
> >  #include <asm/pgtable-types.h>
> >  #include <asm/kvm_asm.h>
> > @@ -456,14 +457,12 @@ static void handle___kvm_vcpu_run(struct kvm_cpu_context *host_ctxt)
> >  {
> >  	struct pkvm_hyp_vcpu *hyp_vcpu;
> >  	struct kvm_vcpu *host_vcpu;
> > -	int ret;
> > +	int ret = ARM_EXCEPTION_IL;
> >  
> >  	host_vcpu = get_host_hyp_vcpus(host_ctxt, 1, &hyp_vcpu);
> >  
> > -	if (!host_vcpu) {
> > -		ret = -EINVAL;
> > +	if (!host_vcpu)
> >  		goto out;
> > -	}
> >  
> >  	if (unlikely(hyp_vcpu)) {
> >  		/*
> > @@ -472,8 +471,22 @@ static void handle___kvm_vcpu_run(struct kvm_cpu_context *host_ctxt)
> >  		 * loading a vcpu. Therefore, if SME features enabled the host
> >  		 * is misbehaving.
> >  		 */
> > -		if (unlikely(system_supports_sme() && read_sysreg_s(SYS_SVCR))) {
> > -			ret = -EINVAL;
> > +		if (unlikely(system_supports_sme() && read_sysreg_s(SYS_SVCR)))
> > +			goto out;
> > +
> > +		/*
> > +		 * ON has a single writer, pkvm_reset_vcpu() on this CPU, so
> > +		 * READ_ONCE suffices. ON_PENDING takes the reset; -ECANCELED
> > +		 * is a rollback that raced it.
> > +		 */
> > +		switch (READ_ONCE(hyp_vcpu->power_state)) {
> > +		case PSCI_0_2_AFFINITY_LEVEL_ON:
> > +			break;
> > +		case PSCI_0_2_AFFINITY_LEVEL_ON_PENDING:
> > +			if (pkvm_reset_vcpu(hyp_vcpu))
> > +				goto out;
> > +			break;
> > +		default:
> >  			goto out;
> >  		}
> >  
> > diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > index 855cb77c8bba1..d970cba12ca47 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > @@ -5,6 +5,7 @@
> >   */
> >  
> >  #include <kvm/arm_hypercalls.h>
> > +#include <kvm/arm_psci.h>
> >  
> >  #include <linux/kvm_host.h>
> >  #include <linux/mm.h>
> > @@ -433,6 +434,40 @@ static void pkvm_init_features_from_host(struct pkvm_hyp_vm *hyp_vm, const struc
> >  		   allowed_features, KVM_VCPU_MAX_FEATURES);
> >  }
> >  
> > +static int pkvm_vcpu_init_psci(struct pkvm_hyp_vcpu *hyp_vcpu, u32 mp_state)
> > +{
> > +	struct vcpu_reset_state *reset_state = &hyp_vcpu->vcpu.arch.reset_state;
> > +	struct pkvm_hyp_vm *hyp_vm = pkvm_hyp_vcpu_to_hyp_vm(hyp_vcpu);
> > +	struct kvm_vcpu *host_vcpu;
> > +
> > +	if (!pkvm_hyp_vcpu_is_protected(hyp_vcpu)) {
> > +		/* The host manages a non-protected vCPU: always ON at EL2. */
> > +		hyp_vcpu->power_state = PSCI_0_2_AFFINITY_LEVEL_ON;
> > +		return 0;
> > +	}
> > +
> > +	if (mp_state != KVM_MP_STATE_RUNNABLE && mp_state != KVM_MP_STATE_STOPPED)
> > +		return -EINVAL;
> > +
> > +	if (mp_state == KVM_MP_STATE_STOPPED) {
> > +		reset_state->reset = false;
> > +		hyp_vcpu->power_state = PSCI_0_2_AFFINITY_LEVEL_OFF;
> > +		return 0;
> > +	}
> > +
> > +	hyp_assert_lock_held(&vm_table_lock);
> > +	if (hyp_vm->primary_vcpu)
> > +		return -EINVAL;
> > +	hyp_vm->primary_vcpu = hyp_vcpu;
> > +
> > +	host_vcpu = hyp_vcpu->host_vcpu;
> > +	reset_state->pc = READ_ONCE(host_vcpu->arch.ctxt.regs.pc);
> > +	reset_state->r0 = READ_ONCE(host_vcpu->arch.ctxt.regs.regs[0]);
> > +	reset_state->reset = true;
> > +	hyp_vcpu->power_state = PSCI_0_2_AFFINITY_LEVEL_ON_PENDING;
> > +	return 0;
> > +}
> > +
> >  static void unpin_host_vcpu(struct kvm_vcpu *host_vcpu)
> >  {
> >  	if (host_vcpu)
> > @@ -447,6 +482,9 @@ static void unpin_host_sve_state(struct pkvm_hyp_vcpu *hyp_vcpu)
> >  		return;
> >  
> >  	sve_state = hyp_vcpu->vcpu.arch.sve_state;
> > +	if (!sve_state)
> > +		return;
> > +
> >  	hyp_unpin_shared_mem(sve_state,
> >  			     sve_state + vcpu_sve_state_size(&hyp_vcpu->vcpu));
> >  }
> > @@ -559,10 +597,12 @@ static int init_pkvm_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu,
> >  			      struct kvm_vcpu *host_vcpu)
> >  {
> >  	int ret = 0;
> > +	u32 mp_state;
> >  
> >  	if (hyp_pin_shared_mem(host_vcpu, host_vcpu + 1))
> >  		return -EBUSY;
> >  
> > +	mp_state = READ_ONCE(host_vcpu->arch.mp_state.mp_state);
> >  	hyp_vcpu->host_vcpu = host_vcpu;
> >  
> >  	hyp_vcpu->vcpu.kvm = &hyp_vm->kvm;
> > @@ -571,7 +611,6 @@ static int init_pkvm_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu,
> >  
> >  	hyp_vcpu->vcpu.arch.hw_mmu = &hyp_vm->kvm.arch.mmu;
> >  	hyp_vcpu->vcpu.arch.cflags = READ_ONCE(host_vcpu->arch.cflags);
> > -	hyp_vcpu->vcpu.arch.mp_state.mp_state = KVM_MP_STATE_STOPPED;
> >  
> >  	if (!pkvm_hyp_vcpu_is_protected(hyp_vcpu)) {
> >  		/*
> > @@ -601,9 +640,12 @@ static int init_pkvm_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu,
> >  
> >  	if (pkvm_hyp_vcpu_is_protected(hyp_vcpu))
> >  		kvm_reset_pvm_sys_regs(&hyp_vcpu->vcpu);
> > +	ret = pkvm_vcpu_init_psci(hyp_vcpu, mp_state);
> >  done:
> > -	if (ret)
> > +	if (ret) {
> >  		unpin_host_vcpu(host_vcpu);
> > +		unpin_host_sve_state(hyp_vcpu);
> > +	}
> 
> Was it planned for a different commit of the series?

Ha no it wasn't, you're calling unpin_host_sve_state() unconditionally. 

> 
> >  	return ret;
> >  }
> >

[...]
