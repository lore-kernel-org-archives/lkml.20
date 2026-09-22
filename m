Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADFD56E071
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 17:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790096828; cv=none; b=KDU0PehpM/I+SnrPLl669bdVFnODjidxtp0D1kssFng74UOtwjybIe6A+Sxv8J8glyJS8VIBaMarxb/G8qtQPgf7jCKsNoTt2YXyyfbF3p1KO6pfJ8gM4lUbS6WkKx0u1lQI2y2ZRq5yETzOWTKrPlYHjGH4+9QOhXOYfEdrRWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790096828; c=relaxed/simple;
	bh=THqLxf2Nh8WONvTsUugDhC8C3Fhu1GnsjuOyv2a4vcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hm3JFUjEXkaks064MwXewAzriq3hMM8WLRQ6yCnH2FaHZSADJP5KX8ujIv8h8glnzdYIwlJ6qYT+SrKiBtZHvjZsSi2YTgx8fMyDUKMOqPLCWKSSLn8TEJU86LDjcOYhcRPj3aj3x1oKrBAJAXUY7/PZaj2vyRVvM9ULqd539KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=k3cqqhiK; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="k3cqqhiK"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso62255e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790096825; x=1790701625; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8JODXIaSFJC9qN9KmTlMz7Gcx5C6dm9DycX2u8LOJSM=;
        b=k3cqqhiK7tap7MRXZ4v4RDXWk9sJdPGOS67mRDbC2c8hP1Yf3I15f7B5OcNHG56zNY
         mPkc56tt1UamPeXosfp3fZrueWG+xAriUb7ELaZNUOUEwjqjN/AH2c+K7iYGoE/DvVrx
         wGBbjV1OaBnYm9x8kV07flmxPYl22+pTjjX5QMztWb9XEpDBH0Hz4Qx2I+wlgqAZ61Zj
         5Jtzl78qVJeGZAUeU/Z1ZUmf5Hy2XSg3/kTKSp6+dFdIXYqsoLye6VLWlXTHIajfPBR7
         RZInBh53oxTotqB1HqvRaf5Y2taGdP/5Ghspfgrny6XRw9+HIxPlJwvgh5Ly/LeU5bR8
         Ujdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790096825; x=1790701625;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8JODXIaSFJC9qN9KmTlMz7Gcx5C6dm9DycX2u8LOJSM=;
        b=jVbxj4SX8FKdXhqSst1QW1GVALC9TJqW+jLIPffzcF5wsAHzClTj4oD8E6yb0skPrH
         5KhIt+8k6V6fhpkQv3zpvKJAqD3j0DWgLkMqRU1Wdx+vXAAKUD2eDI/jar/sO0n3FFQe
         X7U2HqOuoTH4UF1c5/qZv9wJGliFPjJNDXOHLymFm1R9VShQGt4btfpu55f25z6Rz4N0
         6w1/ebmyFtRRIE2aiN0FMfh/iLyt5ckgS7qyDNtorbjxh5ypaSZp9GGFLd6cyByMVf7i
         tue1rcGBm/6EeQ1x6BRllBdIhVq+aEBjXsO543Ws69nHLLOmXnrjM7FCX+Q3vxAhXUDN
         tGpg==
X-Forwarded-Encrypted: i=1; AKwUvBzgHThm0cTNTyp70A/WUEbgcIt9JiBnUyQHETNzwFBYUIKsv4d2ffl+rP4Pv2yWAhDNYWTbMYZi3MXKEl4=@vger.kernel.org
X-Gm-Message-State: AFuF++koK7zCndZbPIQIL23a7plwTXwz9zxrsCvDkuh1oawIAIgkmLr4
	6EgNLQE/zKsacZCBOi/8KdRg1GodEp40BukVCFbmETt0ki2Tn7uh4J2Ze+1efjM89A==
X-Gm-Gg: AYBFou1+FNNF1PMOwQeL2RKbtQUG7ZdqVz9w/X1P04/DmWdl+Hk41g0avHBtt25Oh7z
	2xb4I/NM61XELXOb2IsCKRaIsdFZSqNa8sWssK4LiBU5kYgui6Bbx4Xn/9f5n21NQ5UQYajRx58
	1zjQ/CzXezLQtZ4Df3jfBNW96G7dyM3RhctRqSyjNHgHY8Kxzib6+OCGRXejDF10QYqUs7MYfZe
	kA4En0du/4XvL6MgjIPSu27tBeQVzQDeXi9++jxwnTl11koTM76Aob5zzqrGD01dqHCzGjGFRRK
	+RHJSXVyIwEew2RVTTW4KTR5wQbVg+W06zTyhQshgGdd/QRxqXHqIWkh82Omq9cJOdrAolXjBuw
	j8hKqwxWoHgLcvmzZ4Wd0cDocgDbjKG02RpDFCtkuCf5/f8F4q6UQPiEbEud6Poo6ym1ja8A9d5
	yBVxqqwUaAcdTUBBmiFLPJXeKXrvOapw+aLZvglZtKvLwp9SzuOvjD2F3BK5p6Fql54wsLuBBaY
	0C4B6W0awvC6UX7H1z7czuF72qAO4m0iK0PjM4K1zg=
X-Received: by 2002:a05:600c:5487:b0:49f:bd3c:bc1e with SMTP id 5b1f17b1804b1-49fc573a0damr223240355e9.25.1790096824351;
        Tue, 22 Sep 2026 10:07:04 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1ccb90sm4537125e9.6.2026.09.22.10.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 10:07:03 -0700 (PDT)
Date: Tue, 22 Sep 2026 18:07:00 +0100
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
Message-ID: <arK1tHUEJsCQEKzn@google.com>
References: <20260914113338.159227-1-fuad.tabba@linux.dev>
 <20260914113338.159227-11-fuad.tabba@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914113338.159227-11-fuad.tabba@linux.dev>

On Mon, Sep 14, 2026 at 12:33:30PM +0100, Fuad Tabba wrote:
> EL2 implements PSCI 1.1 for protected VMs: CPU_ON, CPU_OFF,
> PSCI_VERSION and PSCI_FEATURES are decided at EL2 (CPU_ON and CPU_OFF
> still exit to the host, which only schedules or parks the target),
> AFFINITY_INFO, CPU_SUSPEND and the platform power operations are
> forwarded to the host, and anything else returns NOT_SUPPORTED,
> including the TRNG calls and the functions above 1.1, SYSTEM_OFF2
> among them, that the host handled for a protected guest until now.
> TRNG for protected guests is a follow-up. AFFINITY_INFO stays
> with the host, which returns OFF only once it has parked the target:
> the host is what a guest polls to see a CPU_OFF complete before it
> issues the next CPU_ON, as Linux does on hotplug.
> 
> Three consequences follow:
> 
>   - A protected VM has one primary vCPU, the first whose hyp vCPU is
>     created with mp_state RUNNABLE. A second one, or an mp_state other
>     than RUNNABLE or STOPPED, fails that vCPU's first KVM_RUN with
>     -EINVAL.
> 
>   - CPU_ON finds its target among the hyp vCPUs, which exist from the
>     target's first KVM_RUN; before that the guest gets
>     INVALID_PARAMETERS.
> 
>   - A vCPU EL2 holds powered off doesn't run: handle___kvm_vcpu_run()
>     returns ARM_EXCEPTION_IL, reported as KVM_EXIT_FAIL_ENTRY. Its
>     existing bail-outs return the same code instead of an -EINVAL that
>     handle_exit() didn't recognise, for every hyp vCPU.
> 
> Non-protected VMs keep power_state ON and accept any mp_state.
> 
> Each protected vCPU is OFF, ON_PENDING or ON. CPU_ON moves the target
> to ON_PENDING, and the target's next run resets it and moves it to ON.
> The racing transitions are cmpxchg, and the reset state is published
> with a release/acquire pair, documented at each site. CPU_OFF publishes
> OFF with a release, so the target's clear of reset_state.reset is
> ordered before it and a CPU_ON that then wins on OFF republishes after
> the clear. Rolling a CPU_ON the host failed back to OFF needs the
> host's return value, which the per-EC marshalling patch delivers along
> with the rollback. Until then such a target stays ON_PENDING, and the
> reset has no observable effect: flush_hyp_vcpu() copies the host's
> context in on every entry until that patch removes the copy, so the
> target enters on the host's values rather than the ones EL2 reset.
> 
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>  arch/arm64/kvm/hyp/include/nvhe/pkvm.h |  14 ++
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c     |  25 ++-
>  arch/arm64/kvm/hyp/nvhe/pkvm.c         | 283 ++++++++++++++++++++++++-
>  3 files changed, 311 insertions(+), 11 deletions(-)
> 

[...]

> +
> +/*
> + * Returns true when handled at EL2, false when the host must wake the target
> + * vCPU.
> + */
> +static bool pvm_psci_vcpu_on(struct pkvm_hyp_vcpu *hyp_vcpu)
> +{
> +	struct pkvm_hyp_vm *hyp_vm = pkvm_hyp_vcpu_to_hyp_vm(hyp_vcpu);
> +	struct vcpu_reset_state *reset_state;
> +	struct pkvm_hyp_vcpu *target;
> +	unsigned long cpu_id, ret;
> +	int power_state;
> +
> +	cpu_id = smccc_get_arg1(&hyp_vcpu->vcpu);
> +	if (!kvm_psci_valid_affinity(&hyp_vcpu->vcpu, cpu_id)) {
> +		ret = PSCI_RET_INVALID_PARAMS;
> +		goto error;
> +	}
> +
> +	target = pkvm_mpidr_to_hyp_vcpu(hyp_vm, cpu_id);
> +	if (!target) {
> +		ret = PSCI_RET_INVALID_PARAMS;
> +		goto error;
> +	}
> +
> +	/*
> +	 * vCPUs race to power on the same target. Relaxed: reset_state
> +	 * is published by the release on reset_state.reset below.
> +	 */
> +	power_state = cmpxchg_relaxed(&target->power_state,
> +				      PSCI_0_2_AFFINITY_LEVEL_OFF,
> +				      PSCI_0_2_AFFINITY_LEVEL_ON_PENDING);
> +	switch (power_state) {
> +	case PSCI_0_2_AFFINITY_LEVEL_ON_PENDING:
> +		ret = PSCI_RET_ON_PENDING;
> +		goto error;
> +	case PSCI_0_2_AFFINITY_LEVEL_ON:
> +		ret = PSCI_RET_ALREADY_ON;
> +		goto error;
> +	case PSCI_0_2_AFFINITY_LEVEL_OFF:
> +		break;
> +	default:
> +		ret = PSCI_RET_INTERNAL_FAILURE;
> +		goto error;
> +	}
> +
> +	reset_state = &target->vcpu.arch.reset_state;
> +	reset_state->pc = smccc_get_arg2(&hyp_vcpu->vcpu);
> +	reset_state->r0 = smccc_get_arg3(&hyp_vcpu->vcpu);
> +	reset_state->be = kvm_vcpu_is_be(&hyp_vcpu->vcpu);
> +	/*
> +	 * Publish reset_state.{pc, r0, be} to the target vCPU. Pairs with
> +	 * smp_load_acquire(&reset_state->reset) in pkvm_reset_vcpu().
> +	 */
> +	smp_store_release(&reset_state->reset, true);
> +
> +	/* The host requests KVM_REQ_VCPU_RESET and wakes the target. */
> +	return false;
> +
> +error:
> +	smccc_set_retval(&hyp_vcpu->vcpu, ret, 0, 0, 0);
> +	return true;
> +}
> +
> +/*
> + * Returns true when handled at EL2, false when the host must stop scheduling
> + * the vCPU.
> + */
> +static bool pvm_psci_vcpu_off(struct pkvm_hyp_vcpu *hyp_vcpu)
> +{
> +	/* No other writer runs while this vCPU is ON and executing. */
> +	WARN_ON(READ_ONCE(hyp_vcpu->power_state) != PSCI_0_2_AFFINITY_LEVEL_ON);
> +
> +	/*
> +	 * Orders pkvm_reset_vcpu()'s clear of reset_state.reset before OFF, so
> +	 * a CPU_ON that wins on OFF republishes after it. Pairs with the
> +	 * cmpxchg in pvm_psci_vcpu_on().
> +	 */
> +	smp_store_release(&hyp_vcpu->power_state, PSCI_0_2_AFFINITY_LEVEL_OFF);

Is there an issue either with the comment or with pvm_psci_vcpu_on()? the
cmpxchg is relaxed. I would have expected cmpxchg_acquire().

> +
> +	/* Return to the host so that it can finish powering off the vcpu. */
> +	return false;
> +}
> +

[...]

-- 
Vincent
