Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793224226;
	b=joOfVWO2mUK3TKhZupjQJ8r5saBvnjOHXtw2B9EnS0Au/QTTl44+N3AZk5zBl6K7gjip
	 PyUyLht8tJ7BT6QiodOz21meNLpHvrwfjUBGex5VIEFW0/x7LzSIB3DdTApP8xX/5YxGq
	 Jl9KhhTMUjJKwmSxlHMMXO3qu3YpSPB89K6+PlVnbmlZMaMgybmXZNLoW8BfmLXj0+28h
	 oiYCZ4//CH5BqQFrbQv3riN/zCXJhhSeIXQ5iFv/jMzQDXUNosfvkZQ/8ECC6VPrTXr+3
	 bwSv3LtC0MQ17q7ge6b98yqQOe8wqovgJZvuHcpx3Qnr0chhllqcSSVCJ3Ii65qezjg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793224226;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=oVkrmmtCx8Wz/yMOuP0167k9m9+QdMkDrba4QH5xysg=;
	b=nk//rUgp3/UFsAn/k4e3DiOy1AhYuWzB26Ph6d2+4og772TgGRU3SgYPaW42K1QIsaqL
	 GQUDhEX4uYRbJERjClZ1R9+lftgHiLdFklXj762MK+SuoZBTacriJci36tbHBoDHu26H7
	 Ozq++OZZhsdT+ylrBxroM3FwvecCl/pW927rSXckFbKj2uSP3ynFp74eV6G/qzdq4iwfp
	 g4Luo3/hrO0RKHnlgK0ygmrmYiuFPJDDRxWCwKYQbRlZciF0sIV9moPMGtj94FiFM3WLL
	 TTBbQtXTQvGHW5geKVxmnTHzVgv4pU1ZrtV9H5N40czW95GVcXP62tDXeMt1mdwtPvw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ck0EDRnj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AB9606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:50:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4AB9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ck0EDRnj
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-533202fe429so116171cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:50:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793224225; cv=none;
        d=google.com; s=arc-20260327;
        b=iGnd5B00UfeA9guHNA52ELpeNMdtZDzGHza8Mk8z/ImydFvfQbtYoSncxGvmLlNZQE
         5+MDLDwm6H+5UbcjD2nGo/Jd/EaLD4COO+CEpATyNq9AQguXutyEBV9m6kPZUPraj0NQ
         uXn3Gvvj/51LcDOvimJertKxfGCambXfeoRjKsVgSZnVtuKE3yJwSALGFmLZRdKsl6Kd
         BiDSUZGskV3JgBjmxZAxM6mfUANCyhd5UpyOrFJnc6+k0x0MZag9j3MVNJDJgUaHe2sy
         Rd255DnvPa73IYM+wcCDKL8ou2yAqKgeAgFArNUlDUk2YLfO2GYCyIcYWHsfU8paHiMo
         72IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oVkrmmtCx8Wz/yMOuP0167k9m9+QdMkDrba4QH5xysg=;
        fh=ei+eZb7IUI+PaKEq8a5QkiaD1ov0O3cdkHrDhkcYgZw=;
        b=LiBuGAOrADfjmtyDa5ObKCRj8WkDjb2HOI4TvwpEckhnu4ABiGlQILWKMEG5kn1MO0
         FxW7GOKYzDfDQcz0RovCwifCedi75feKrEN2M63U6v0P+BFjjsotzqOlhTfS0+O70Lr6
         diSBshclpWZX9EbxURzpXs5sEHqkzH5ha/UjX9iYWdiAbRRxD1WDfEawQd3b7va2azT1
         RV8BLBNIZt1gJH8WZCEhYfF5uoxbYgHfA35k2w3ztHdx+aKrMgAup5AJgxVfoDkWIi6p
         LaZD/5PYbDE/9UTzxFJHYnZMYYdpClvqyenENFB73BTqoKO9KSQgWzXRE0E2kpG6icfC
         VGuA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793224225; x=1793829025; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oVkrmmtCx8Wz/yMOuP0167k9m9+QdMkDrba4QH5xysg=;
        b=ck0EDRnjLKay09UM84zGm1JVefEzd3YbVqAzsZSMjjotDQg6LmiDbJkH3c94ItREUn
         u1z/eRZ7MuZGZoCUEsb1K8spkWIdz4yXDM14DApiLWgu4IGn3joQziWF6ox99pbYO5Rr
         yu0aVIrTA4X1CIpIVU04f/y0FyVVyM0St+wAhgmx7uwflXlcImRhn6An9WYPHIc+qZQ9
         VhUSy6djLWm8jnzCsboEJHN9Xv5W4/ectCwU8xHPyCOzl9Cjp07Py95Q/TU4Z3f6K2WV
         +EW6QttUt3R9AkwIimZmUmR17AbuCKrbIjSHFKPn/W10HiJ/iuTJovy+F2h7oTHHYY02
         ej9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793224225; x=1793829025;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oVkrmmtCx8Wz/yMOuP0167k9m9+QdMkDrba4QH5xysg=;
        b=dBeQvkyRpj/6M10jMThSHvREK2sOG6xZvCIwqZSUka0oSBpSfqskGocDaWRe7XrkZF
         gqGezfFgYTvgakPuOGiF7qND9ZIdtWt7tMo0jbZRZGDXvBJ7IM8yvjdLB+JGXpVDv9ux
         VXQoo3eHPflaTwS3dDVn/5kAzbkDt3ckfmg64QhM477lzERizYTf3IW0YUHu+lxqVaZm
         7RM5vHJ2o8vPRP+3YcHBIZf/a/G6O3bTWR4Po33BsGMPXvoFCiskMrKSNe9QQH3oQmBZ
         aOYKAWGDDEibrFnwXPssF8Jzq4mP5qxlb8UBE5O10lypkZaGlU4Q5nOzX/5YBphOGHA/
         jgwA==
X-Forwarded-Encrypted: i=1; AKwUvByLGMvqKGeTCEtgG80uTcfOchqoE2IcG1tOU9PpIWywJbhtQi7ED3lvFwCq/8GWmLNi6cHQyll7+ELH51g=@vger.kernel.org
X-Gm-Message-State: AFq9FYJKYC68u7oWmepugqCqfEan+JgHKxIfV1Fvj3ZzmakcNG6kZSP1
	dPusmr8cjJ0v7YvOtu4Iu+2aztIdpCaWCMrU+mXvgMPhSJqGypiA5rFfMMZKuSP8iFKYzW1lS9z
	qWiKGDHoXXdhamnGnwqeNQ51b3jT93q0GcYgCtbwxhUV330ESm/wiHQD6aTU=
X-Gm-Gg: AYBFou2Sm8nKQ3XgjvqhLHXrRFQKTtX7cueLaMYiiQdtOP32zThY5WrMHrLa+/Tee/S
	jdTbMySIFXy5u1sFttq2DoTiSTD2u0X1XC2evr6ShX1IXHwwNifk39+totZkB4+xBHfXRypGR3O
	c5hSOXRsLH4Z9PAOJRszK6GmJMTJ1U9K8laWOY3tcK2DJp8rUcsWaLRqfiptJEfp2JKETbTk1AK
	WMRDjRBxPVQWWFvXMOMbgwG9s82BnpTSutLB+1bEtHuuHWayZfEeF3ex99ccg/Xf71Rt5UuERCE
	UblVQSCUgbCew8/yMqofQNf+wNOxcduou3x9iwLhg+Uh92jSf5o2E6Mr/ee4w56vQIbp5QGYr4Z
	d9f22JLF+LnbAdyJhmj/7brbFiNMPOBwBv9od
X-Received: by 2002:a05:622a:5c0b:b0:533:9731:f0f1 with SMTP id
 d75a77b69052e-5414df1402dmr3259361cf.10.1793224224056; Wed, 28 Oct 2026
 14:50:24 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260827223755.143247-1-zide.chen@intel.com> <20260827223755.143247-15-zide.chen@intel.com>
In-Reply-To: <20260827223755.143247-15-zide.chen@intel.com>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 28 Oct 2026 14:50:09 -0700
X-Gm-Features: AclHuK-liHGzIvCMjGYc6qSRUa3UjMY3TGndjwxwFoPElrqbY_zUPbSfw_KI05g
Message-ID: <CALMp9eRypTqSvMUes6PVB8z30EcppLJ3i_votpMnJOawP1c4sA@mail.gmail.com>
Subject: Re: [PATCH v2 14/16] KVM: x86/pmu: Ignore AnyThread bit if
 CPUID.0AH:EDX[15] is set
To: Zide Chen <zide.chen@intel.com>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, kvm@vger.kernel.org, Andi Kleen <ak@linux.intel.com>, 
	Stephane Eranian <eranian@google.com>, linux-kernel@vger.kernel.org, 
	Mingwei Zhang <mizhang@google.com>, Das Sandipan <Sandipan.Das@amd.com>, 
	Shukla Manali <Manali.Shukla@amd.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	Xudong Hao <xudong.hao@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 3:48=E2=80=AFPM Zide Chen <zide.chen@intel.com> wro=
te:
>
> Intel PerfMon v5 introduces the ANYTHREAD_DEPRECATION capability
> (CPUID.0AH:EDX[15]) to indicate that AnyThread counting is deprecated
> and that writes to the AnyThread bit in IA32_PERFEVTSELx are ignored.
>
> When ANYTHREAD_DEPRECATION is present in the guest CPUID, emulate the
> architectural behavior and silently ignore writes to the AnyThread bit
> instead of injecting #GP.
>
> Continue to inject #GP when ANYTHREAD_DEPRECATION is not present in the
> guest CPUID, e.g. for PerfMon v3/v4 guests or when the capability is
> not configured for a PerfMon v5+ guest.
>
> Advertise CPUID.0AH:EDX[15] only for PMU version 5+ guests, since the
> bit doesn't exist below version 5.
>
> Signed-off-by: Zide Chen <zide.chen@intel.com>
> ---
> v2:
> - Advertise anythread_deprecated only if kvm_pmu_cap.version >=3D 5.
> - Add the missing AnyThr bit handling for IA32_FIXED_CTR_CTRL.
> - Update the comments to be clearer.
> ---
>  arch/x86/kvm/cpuid.c         |  2 +-
>  arch/x86/kvm/vmx/pmu_intel.c | 19 +++++++++++++++++++
>  2 files changed, 20 insertions(+), 1 deletion(-)
>
> diff --git a/arch/x86/kvm/cpuid.c b/arch/x86/kvm/cpuid.c
> index 63201d4ea4a1..ef208906b3ee 100644
> --- a/arch/x86/kvm/cpuid.c
> +++ b/arch/x86/kvm/cpuid.c
> @@ -1542,7 +1542,7 @@ static inline int __do_cpuid_func(struct kvm_cpuid_=
array *array, u32 function)
>                                             KVM_MAX_NR_FIXED_COUNTERS);
>                 edx.split.bit_width_fixed =3D kvm_pmu_cap.bit_width_fixed=
;
>
> -               if (kvm_pmu_cap.version)
> +               if (kvm_pmu_cap.version >=3D 5)
>                         edx.split.anythread_deprecated =3D 1;
>
>                 entry->eax =3D eax.full;
> diff --git a/arch/x86/kvm/vmx/pmu_intel.c b/arch/x86/kvm/vmx/pmu_intel.c
> index c7472778137a..599c69dfa6e3 100644
> --- a/arch/x86/kvm/vmx/pmu_intel.c
> +++ b/arch/x86/kvm/vmx/pmu_intel.c
> @@ -446,6 +446,12 @@ static int intel_pmu_set_msr(struct kvm_vcpu *vcpu, =
struct msr_data *msr_info)
>                 if (data & pmu->fixed_ctr_ctrl_rsvd)
>                         return 1;
>
> +               /*
> +                * This is to emulate ANYTHREAD_DEPRECATION. Guests witho=
ut
> +                * support for it would have had the write rejected by
> +                * pmu->fixed_ctr_ctrl_rsvd above.
> +                */
> +               data &=3D ~intel_pmu_fixed_ctrl_bits(pmu, INTEL_FIXED_0_A=
NYTHREAD);
>                 if (pmu->fixed_ctr_ctrl !=3D data)
>                         reprogram_fixed_counters(pmu, data);
>                 break;
> @@ -494,6 +500,8 @@ static int intel_pmu_set_msr(struct kvm_vcpu *vcpu, s=
truct msr_data *msr_info)
>                         if (data & eventsel_rsvd)
>                                 return 1;
>
> +                       /* See above comments for MSR_CORE_PERF_FIXED_CTR=
_CTRL. */
> +                       data &=3D ~ARCH_PERFMON_EVENTSEL_ANY;
>                         if (data !=3D pmc->eventsel) {
>                                 pmc->eventsel =3D data;
>                                 pmc->eventsel_hw =3D data;
> @@ -603,6 +611,17 @@ static void intel_pmu_refresh(struct kvm_vcpu *vcpu)
>         pmu->pmc_exists64 =3D (BIT_ULL(nr_gp_counters) - 1) &
>                             kvm_pmu_cap.cntr_mask64;
>
> +       /*
> +        * AnyThread counting is not supported by KVM due to cross-VM
> +        * information leakage concerns on SMT cores. Therefore, AnyThrea=
d
> +        * remains unavailable for PerfMon v3/v4 guests, where AnyThread
> +        * deprecation is not enumerated.
> +        */
> +       if (pmu->version >=3D 5 && edx.split.anythread_deprecated) {
> +               pmu->eventsel_rsvd &=3D ~ARCH_PERFMON_EVENTSEL_ANY;
> +               fixed_enable_bits |=3D INTEL_FIXED_0_ANYTHREAD;
> +       }
> +

According to Intel SDM Vol. 4, Table 2-2 ("IA-32 Architectural MSRs"), only
Fixed Counters 0, 1, and 2 have an AnyThread bit (bits 2, 6, and 10 of
IA32_FIXED_CTR_CTRL). FC3 has never had an AnyThread bit;
IA32_FIXED_CTR_CTR[bit 14] is reserved in PerfMon v5 and becomes
METRICS_CLEAR_EN in PerfMon v6. Passing INTEL_FIXED_0_ANYTHREAD to
intel_pmu_fixed_ctrl_bits() will wrongly clear bit 14 in
pmu->fixed_ctr_ctrl_rsvd once Fixed Counter 3 is enabled.

On hardware with CPUID.0AH:EDX.ANYTHREAD_DEPRECATION[15] =3D 1, if software
sets the AnyThread bit in IA32_PERFEVTSELx or IA32_FIXED_CTR_CTRL and then
reads the MSR back with RDMSR, does hardware return 0 for the AnyThread
bit, or does it return 1 but otherwise ignore the bit?
