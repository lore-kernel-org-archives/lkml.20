Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793222713;
	b=xpWaUqCKczGeR7W6RBbcc0sxFh6nRheozAfM9VerccL/42bxo3FMwCUUcvb8G7lE0Zpx
	 Kv1BgeRt6Bl4OvNUgO3VEQ89i1f7VmVFNQ4Y53P8FYyvC7HaDdY7o70v2nRzDTm+2WpQ0
	 BLWzFKdWw/k+opTXBTPDAO9qcluXMz8NOhCv2l7bruoye4X2CKXd2MDCjpSbjxW7cBsa4
	 0Vld1fkaHSk1uVaTHo0Q9pv63P9ywez0uUno4AlWPBtdYi61vrjojGflJ6I8DeGET/Aa4
	 qA8uYE8HwdGPuSwMRjLdihCukCuiAYkZk1oMG1MnNGKE0idDlqI2BwwpdyV98V2iV1g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793222713;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ENw9Q5VwwMeL1RTcYiZmzftcc9Hrpk/z8YkgEUgfUU8=;
	b=5SVpNBCPoNA/R2NX/LGF7UYS274StP9JYOLsNgFfb7SuLAE+/Yo6JRkVr+avJ82ABRCh
	 6R7npFxMrtfxBruA2dM5uZBryOryvpAmvx/Jaafg/gyAfWI4ccGFc7d1YKqnWgQ+ziMH0
	 HF/Px7ghninHiDIXiqPH3YCZImpLXPx5avsKDAdlUdZCTUJSE/WAl43JjyCvZdJCiO0V5
	 EmWGCxcC1Wu28x1cQ/yPPzfpmBJHriSwnBmu+OWHGyWSuKCWSSR2Opv502sB6tmYa2aLx
	 EP9oQgo4s13HXG60ygqAM6YwQAAs7EOsoY7ZcINJKD10bQZYz+5ia6T+vLXhDNhnV3A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kCYAdIBg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0973D606A322
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:25:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0973D606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kCYAdIBg
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-533202fe429so105321cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:25:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793222712; cv=none;
        d=google.com; s=arc-20260327;
        b=ocaciDLHA1JVrYlwoiKPg2m6g7hFSYet2YNj5yYRtl28dWXemUdFg+TpECjHTv5Aum
         Xd+4lwpAfCpkTG+Dt7390koq5PmC3xYNYXzy0KzUe9PQx7IJcfsKQUYm+iXFChFrz57+
         k3B8L1V+8sxiAfNB9Qn6FkIhygf04PH1ksm76moO4VHXzWv0PFdZQRBw5oRhTnJzO1JU
         iN1kkITjKPLgmWMMWSJ+N+PKRDfdtRXzmDHYtw48LU/lEhr9hHOWR+9dNQpafkHmJbIq
         xlSCYwh5gDR9YCmfkogMxsOBYqaqo7qgBn7HNRT2F8a/KIslUkMb78DBpt1dSvYpVtxQ
         IwOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ENw9Q5VwwMeL1RTcYiZmzftcc9Hrpk/z8YkgEUgfUU8=;
        fh=8fjBYJmkMfseRIFmCU2yG4jWP9VT02KfD0X/81/1KZY=;
        b=fy6rboDmlw9HGcW9I6xA+8ikjNizMGQgkbsC5QNgSl4tHmi4Fl2WO+4ipenCEIWY4J
         8iXcjrpgD6A7czXrCHTnUPpqNo+BnbaL/8zGA1RlNR4TxtlA9tyRGMuIoccfzRIc5nTa
         Cec5Fw+G9LBoD2kuhdrYNloP959FZZs28zVTkyaNj6zBcbdr5IzFNfylOieJGiSnDt+I
         GFPAmrPnUEUIloqudZZOUh8triOjPgvKHRzBPyY4LovdWrxf5jiahoWgGR8rdtdBGnhJ
         NBN9/bVhsb8xlNcW1GCxj9+oVAkiMOmqom5LSkBAB7/B7pR1C0W2RnPbJoPZLCYXPhvC
         DJlw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793222712; x=1793827512; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ENw9Q5VwwMeL1RTcYiZmzftcc9Hrpk/z8YkgEUgfUU8=;
        b=kCYAdIBgcwMk8dQCBCk9CagCRzS9FRXwz3kvDTW5GyBcIV/KhP8kwMwjoWGBCh1XYB
         JR7DiboditS6PmQgCurzsz8rPXv2Os+n6nkjgAWicq/3H9ywMVVLYwmFEgDaTkepl2Hk
         HDCzZbDhctQi6gqmjPgz+hfGQX3Gcn8JI1bnMHKOvz+Hzpol2ErgcVKMh8EvNwyE4AcH
         VLY9xwAv12Op8reNpH2PkinlNsKu7buf6XPGtl7glgPtTq1lIOR6FYsJLLUaCBYHLp4t
         g2XOscARYgex+tgBsnrh8U1ADEGMxw9yoNS/p8du+dVmoFwB16AmHMhR3E9CP4KlQl/G
         Q1lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793222712; x=1793827512;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ENw9Q5VwwMeL1RTcYiZmzftcc9Hrpk/z8YkgEUgfUU8=;
        b=ws/I30iDtVdE7roDbs9xpz+tLyKWhXnh8Z6rTbUal+PcBh3B9fJvChNToBu4yYanUJ
         xxdnTfrq0l2zG4RgZWSUqyREj6JFB+nuaD876PZBzE9EKqbGKU7fgXL8O7uQH3JgU1AZ
         IlULQ1mglXf7Y1jG1xeuH1MZMvQnPm7LDpGyCQoR1PKMeDvCHUlKK5LB6QGcweByFXj3
         A7brQRMC9g2Ev5QNkAuhOkQZSOpnBPGCQuEcviyIoDYay5T1ZFnZhH6PwLmAaDkjVQlr
         74B9bw0ntrKQy57mFDGDdqP+5NoNkdl9Xt0fQDv1JUh9uUnZGD9DeFy+SBaZ1vjS+58s
         tNVQ==
X-Forwarded-Encrypted: i=1; AKwUvBxFLIcVMGvhwdeeS0KyS9p2VAvuN4s1zCz4bgoUBwKpOhgoQGnTJTH/Q/kOPpCc4qQCPm9WR6+f5IZ9om4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKADdwemlMMQnWAAVj9i8dZ31ICYT5hvTLsa143pz6sdQn3ax6X
	hgrcJI7aTu0wfvdtZ7tecZLCxKVRg6Nf5p5FfljF8W72cz08woA0mfB5A+whQ9ZOot0j7/5kRpm
	ZHpFUxZ3ThZnyEmGLRqM+0uvrXuODhMg+646m/ZJyuWb2Xt/AT8HgvNh7lxs=
X-Gm-Gg: AYBFou0LCFUwZVjhcArOWtepN/KoZvBUVpm27KMKh5NS++iSzbNGdTBbBlEfwzwya+0
	ymKTe+uNe0Nr5MKzmNk6B5pmQ3tlyq4tvV6G/TISt7xOkak5A++q9xpesxqAJ2imBU6v+BMsl6i
	UoIN5LB1BkjLk5YJSUbQnVsyPXvYbRYW78+eHAlObwaM5TeX5RB/873T6jP+mqIXK9MuOzFip70
	kJfwbn+NTXwT8jXD66SlsTgb6ic0NvvVV7UuRGQ4Hq9Bbv9BO4CJgBmN9nhXfnzb/ysrmNH5QAA
	Kv6pAqac4FsKAkx4iHTEaSsw5FF0F2ICwhIKvaTCgtXY8XJhdjZ0SYN9CiXgtEmiEySEtMVvgXZ
	ljtLIMnsmnzwydWAqfMKhYOXoLOnXJQQneqBE
X-Received: by 2002:a05:622a:2298:b0:536:d46:ffa7 with SMTP id
 d75a77b69052e-5414e3fe9afmr2752931cf.12.1793222710639; Wed, 28 Oct 2026
 14:25:10 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260827223755.143247-1-zide.chen@intel.com> <20260827223755.143247-12-zide.chen@intel.com>
In-Reply-To: <20260827223755.143247-12-zide.chen@intel.com>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 28 Oct 2026 14:24:57 -0700
X-Gm-Features: AclHuK9dEqdUmO-HHiIIftvXmEGOnx7VGEu94hz8TxQGo8ovabGloAkS3SRkWVQ
Message-ID: <CALMp9eRvQ+iQdw_dWPLqZCrO7zpLut+O27pb-EPNa33hkegaBw@mail.gmail.com>
Subject: Re: [PATCH v2 11/16] KVM: x86/pmu: Emulate the GLOBAL_STATUS_SET and
 GLOBAL_INUSE MSRs
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
> Intel PerfMon v4 introduces IA32_PERF_GLOBAL_STATUS_SET (0x391) to
> allow software to set individual bits in the global status MSR. Reads
> of IA32_PERF_GLOBAL_STATUS_SET always return zero.
>
> IA32_PERF_GLOBAL_INUSE (0x392) is also introduced in v4, to track
> which counters and the PMI are currently claimed by other agents,
> allowing independent software agents to check counter availability
> without a shared scheduler arbitrating between them.
>
> IA32_PERF_GLOBAL_INUSE is an read-only MSR, and any write attempt
> results in a #GP.
>
> Neither MSR is part of the VM state, so they don't need to be
> advertised to userspace, nor saved and restored during live
> migration.
>
> Originally-by: Yang Weijiang <weijiang.yang@intel.com>
> Signed-off-by: Zide Chen <zide.chen@intel.com>
> ---
> v2:
> - Change intel_pmu_get_global_inuse() to return u64, to match the
>   surrounding code style.
> - Add the missing vmcs02 updates for these two MSRs.
> - Change "> 3" to ">=3D 4" to make the "v4-gated" more obvious and match
>   the existing code style.
> ---
>  arch/x86/include/asm/msr-index.h |  4 ++++
>  arch/x86/kvm/pmu.c               |  9 ++++++++
>  arch/x86/kvm/vmx/nested.c        |  2 ++
>  arch/x86/kvm/vmx/pmu_intel.c     | 37 ++++++++++++++++++++++++++++++++
>  arch/x86/kvm/vmx/vmx.c           |  4 ++++
>  5 files changed, 56 insertions(+)
>
> diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-=
index.h
> index 11b99d237e05..0b093cf41edf 100644
> --- a/arch/x86/include/asm/msr-index.h
> +++ b/arch/x86/include/asm/msr-index.h
> @@ -1240,6 +1240,10 @@
>  #define MSR_CORE_PERF_GLOBAL_CTRL      0x0000038f
>  #define MSR_CORE_PERF_GLOBAL_OVF_CTRL  0x00000390
>  #define MSR_CORE_PERF_GLOBAL_STATUS_SET        0x00000391
> +#define MSR_CORE_PERF_GLOBAL_INUSE     0x00000392
> +
> +/* Intel IA32_PERF_GLOBAL_INUSE MSR */
> +#define PERF_GLOBAL_INUSE_PMI_INUSE    BIT_ULL(63)
>
>  #define MSR_PERF_METRICS               0x00000329
>
> diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
> index 437a7bc49bf8..7c05cf5157bf 100644
> --- a/arch/x86/kvm/pmu.c
> +++ b/arch/x86/kvm/pmu.c
> @@ -832,6 +832,8 @@ bool kvm_pmu_is_valid_msr(struct kvm_vcpu *vcpu, u32 =
msr)
>         case MSR_CORE_PERF_GLOBAL_CTRL:
>         case MSR_CORE_PERF_GLOBAL_OVF_CTRL:
>                 return kvm_pmu_has_perf_global_ctrl(vcpu_to_pmu(vcpu));
> +       case MSR_CORE_PERF_GLOBAL_STATUS_SET:
> +               return vcpu_to_pmu(vcpu)->version >=3D 4;

MSR_CORE_PERF_GLOBAL_STATUS_SET should be handled in pmu_intel.c? It is an
Intel-specific MSR (note that commit 79a71cc2568f ("KVM: x86/pmu: Move
Intel specific MSRs to pmu_intel.c") moved all of MSR_CORE_PERF_GLOBAL_*
into pmu_intel.c).

Moreover, checking "vcpu_to_pmu(vcpu)->version >=3D 4" here without checkin=
g the
vendor will expose MSR_CORE_PERF_GLOBAL_STATUS_SET on AMD when AMD's
pmu->version reaches 4.

> @@ -865,6 +867,7 @@ int kvm_pmu_get_msr(struct kvm_vcpu *vcpu, struct msr=
_data *msr_info)
>         case MSR_AMD64_PERF_CNTR_GLOBAL_STATUS_CLR:
>         case MSR_AMD64_PERF_CNTR_GLOBAL_STATUS_SET:
>         case MSR_CORE_PERF_GLOBAL_OVF_CTRL:
> +       case MSR_CORE_PERF_GLOBAL_STATUS_SET:
>                 msr_info->data =3D 0;
>                 break;
>         default:
> @@ -931,6 +934,12 @@ int kvm_pmu_set_msr(struct kvm_vcpu *vcpu, struct ms=
r_data *msr_info)
>                 if (!msr_info->host_initiated)
>                         pmu->global_status &=3D ~data;
>                 break;
> +       case MSR_CORE_PERF_GLOBAL_STATUS_SET:
> +               if (data & pmu->global_status_rsvd)
> +                       return 1;
> +               if (!msr_info->host_initiated)
> +                       pmu->global_status |=3D data;
> +               break;

According to Intel SDM Vol. 4, Table 2-2 ("IA-32 Architectural MSRs"),
IA32_PERF_GLOBAL_STATUS.CondChgd[bit 63] cannot be set by writing to
IA32_PERF_GLOBAL_STATUS_SET, because IA32_PERF_GLOBAL_STATUS_SET[bit 63] is
reserved.  In other words, it is not possible to save/restore
IA32_PERF_GLOBAL_STATUS when bit 63 is set.

Because bit 63 is clear in pmu->global_status_rsvd:

1. An intercepted guest WRMSR(MSR_CORE_PERF_GLOBAL_STATUS_SET, BIT_ULL(63))
   succeeds instead of injecting #GP(0) and sets bit 63 in
   pmu->global_status.
2. When bit 63 is set in pmu->global_status (whether it was set by
   kvm_pmu_set_msr() or by intel_mediated_pmu_put()), the next
   intel_mediated_pmu_load() will try to write an illegal value to
   MSR_CORE_PERF_GLOBAL_STATUS_SET. I don't think we get a #GP, because
   every wrmsr is "safe" these days, but the write will be ignored.

OTOH, what about PerfMon v4 bits 58 (GLOBAL_STATUS_LBRS_FROZEN), 59
(GLOBAL_STATUS_COUNTERS_FROZEN), and 61 (GLOBAL_STATUS_OVF_UNCORE)?  Per
Intel SDM Vol. 4, Table 2-2, those bits are valid in
IA32_PERF_GLOBAL_STATUS, IA32_PERF_GLOBAL_STATUS_RESET, and
IA32_PERF_GLOBAL_STATUS_SET when CPUID.0AH:EAX[7:0] > 3.

When those MSRs are passed through in mediated mode, the guest can set bits
58, 59, or 61 in hardware via IA32_PERF_GLOBAL_STATUS_SET. Leaving those
bits set in pmu->global_status_rsvd for pmu->version >=3D 4 will break
KVM_SET_MSRS(MSR_CORE_PERF_GLOBAL_STATUS) as well as any intercepted guest
writes to GLOBAL_OVF_CTRL / GLOBAL_STATUS_SET.

As I pointed out in patch 04/16, we can't pass through the PMU global
controls unless their reserved bits match hardware.

[ ... ]

> +static u64 intel_pmu_get_global_inuse(struct kvm_vcpu *vcpu)
> +{
> +       struct kvm_pmu *pmu =3D vcpu_to_pmu(vcpu);
> +       unsigned long fixed_mask =3D kvm_fixed_pmc_mask(pmu);
> +       unsigned long gp_mask =3D kvm_gp_pmc_mask(pmu);
> +       bool pmi_inuse =3D false;
> +       u64 eventsel, data =3D 0;
> +       u32 fixed_ctrl;
> +       int i;
> +
> +       kvm_for_each_gp_counter(i, gp_mask) {
> +               eventsel =3D pmu->gp_counters[i].eventsel;
> +
> +               if (eventsel & ARCH_PERFMON_EVENTSEL_EVENT)
> +                       data |=3D BIT_ULL(i);
> +               pmi_inuse |=3D eventsel & ARCH_PERFMON_EVENTSEL_INT;
> +       }
> +       kvm_for_each_fixed_counter(i, fixed_mask) {
> +               fixed_ctrl =3D fixed_ctrl_field(pmu->fixed_ctr_ctrl, i);
> +
> +               if (fixed_ctrl & (INTEL_FIXED_0_KERNEL | INTEL_FIXED_0_US=
ER))
> +                       data |=3D BIT_ULL(KVM_FIXED_PMC_BASE_IDX + i);
> +               pmi_inuse |=3D fixed_ctrl & INTEL_FIXED_0_ENABLE_PMI;
> +       }
> +       pmi_inuse |=3D pmu->pebs_enable;

Nit: I am always complaining about unnecessary use of '!!', but I
think it is warranted in the two assignments to pmi_inuse above.

[ ... ]

> diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> index 56daf5c61082..2dabb7e64956 100644
> --- a/arch/x86/kvm/vmx/vmx.c
> +++ b/arch/x86/kvm/vmx/vmx.c
> @@ -4282,6 +4282,10 @@ static void vmx_recalc_pmu_msr_intercepts(struct k=
vm_vcpu *vcpu)
>                                   MSR_TYPE_RW, intercept);
>         vmx_set_intercept_for_msr(vcpu, MSR_CORE_PERF_GLOBAL_OVF_CTRL,
>                                   MSR_TYPE_RW, intercept);
> +       vmx_set_intercept_for_msr(vcpu, MSR_CORE_PERF_GLOBAL_STATUS_SET,
> +                                 MSR_TYPE_RW, intercept || pmu->version =
< 4);
> +       vmx_set_intercept_for_msr(vcpu, MSR_CORE_PERF_GLOBAL_INUSE,
> +                                 MSR_TYPE_RW, intercept || pmu->version =
< 4);

When a PMU event filter denies a fixed counter in mediated mode,
kvm_mediated_pmu_refresh_event_filter() clears the entire 4-bit control
nybble in pmu->fixed_ctr_ctrl_hw (written to physical IA32_FIXED_CTR_CTRL),
while pmu->fixed_ctr_ctrl contains the guest-written value.

If MSR_CORE_PERF_GLOBAL_INUSE is passed through, a guest RDMSR of
IA32_PERF_GLOBAL_INUSE will see FCx_InUse =3D=3D 0 (and potentially PMI_InU=
se
=3D=3D 0) from hardware even though RDMSR(IA32_FIXED_CTR_CTRL) reports the
fixed counter as enabled (and intel_pmu_get_global_inuse() reports it as
in-use when MSR_CORE_PERF_GLOBAL_INUSE is intercepted).
