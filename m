Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793645365;
	b=PEPh01joHtYo/T/7TdqEgJ2p482rXQyCIv02hG9iqLGnXMiTkFw8+q0s0KEoTzzCpTcg
	 Y7r0kUMtDqXZaLxEQETEjwm24ODGWTfzpI1XStOERjBBiv1nnUVeIwJDXcnKJXcHQcTUv
	 voyOcuuYk5cmiSNGicj51czvHAiRrx8penCiZsyyZroZy63SlneHBouV7nY26nIQO0MuP
	 5s0z4gp40Fg2CGeob4v2A2uyTPLql13oJ8p5S4F45Iuu3DN3MRJFxIM+A2MDcdobdTaTp
	 FV2QTmXIJ2Vog4wYVkP606aqlHIgrfcOmbi4UPsCbEbUvQw5K5ijuwpA/HEFXjQHyAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793645365;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=k3mxN1eIB0dDqgp1tKW7+mAdNCuHH0HDF+C6icwQ5rA=;
	b=w84UK/dr9LPQQex2JfQKB+4Czcea17yq/c6tkwnAEyP/+47+AyDlSvLlqlFi9BosoN7+
	 w4o4LOZuFG95YD5NHE+bK8E8fpBrsFs9PygGBvboyd9pU7rDpGg29Ejhsr2x0XcpNCifp
	 ZZxvvam8RULoizcEemKBxOaWK5mD9dYTvooAu5QIBT5iy/TgPYO0byjJrjkPn6sOrUyIu
	 yoBPGpR+dz9Q31DfCWMs7/PFDy8rrgPTAhOUXkWhHmWkLSgFUoN/o0eFGRh9uRe3VjbV9
	 H3Z3ApG8L8vFJc+z3zahIsURpafGpaPY1pya1ryyLyKNAMhrPhwRbRW6P4FyDLSBo9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=id03i6PG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B0D606A32E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 18:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=id03i6PG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 739121F00A22
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 18:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793645364;
	bh=k3mxN1eIB0dDqgp1tKW7+mAdNCuHH0HDF+C6icwQ5rA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=id03i6PG121xVfB+h0TVlj83nfP00/RSI+PHIj4cskZQfqMEbEvBLQETdTRaBR47n
	 PFhRyATJ0AeK3FiJlqvcs+xlZpbSQfNHXvMHEzyU/PF/OHd9rV1hRS6wgz2YdIgTAY
	 Z2b69gxX4ZblU4xbj8p1jjI9fD8aJYD9r2kcnFoohQP8Z2wQMky2HSJM9+Ki1w2kR6
	 JMmQbHkcrEZAZWc+NLdgJEU4IVDcOtA/gXr6pBj9x6vN4jjVQ+ocYsoitFi0+rBhMD
	 wRqxxqrrN/SD2qfGUNYvXZ8xfl2Qw9GwHwMNIivtfo5Npaf9ToyuDKp63Hg57pEXqJ
	 qquFDFrj0v/Eg==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c40f29667e6so516623066b.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 10:49:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByVkP53hbQZvyXzQYQ5b+f3prXMOEpQMMmrVyH1GbtWtDnrGz0b0ZljdfwspeIxMJmS/XPMxL1St2ezlso=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xP9mLdVkML+g/x+FHFO801dZpniv4H3b7Hhpn8ZdLo9Sk1/Xy
	bvrm957USFEiYxSdI47ZkuKTbMxndOg9sPSIBr+sMyh5Aig0Qi+Out5we16Q5gUcQbU7yBGk50m
	i9hgr2npbNFe0F1+qY2KdofYBYqoYwAg=
X-Received: by 2002:a17:907:84c:b0:c46:ba0d:3728 with SMTP id
 a640c23a62f3a-c4ca7a408c7mr889875966b.18.1793645363150; Mon, 02 Nov 2026
 10:49:23 -0800 (PST)
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
 <CALMp9eRvQ+iQdw_dWPLqZCrO7zpLut+O27pb-EPNa33hkegaBw@mail.gmail.com>
 <auUQgRVFASkWtkoK@google.com> <3276824d-f6a0-455a-bf0c-703fc6d52cf1@intel.com>
In-Reply-To: <3276824d-f6a0-455a-bf0c-703fc6d52cf1@intel.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Mon, 2 Nov 2026 10:49:11 -0800
X-Gmail-Original-Message-ID: <CAO9r8zMxQnRLKGrW69rX7703AatWMp6KOXMObL9baHRPs4dW8A@mail.gmail.com>
X-Gm-Features: AclHuK9elA3bTuNibJToBPiP04Z-isYfdu9yIT10eRqfuhSX3CWvUF7_3hpSAQY
Message-ID: <CAO9r8zMxQnRLKGrW69rX7703AatWMp6KOXMObL9baHRPs4dW8A@mail.gmail.com>
Subject: Re: [PATCH v2 11/16] KVM: x86/pmu: Emulate the GLOBAL_STATUS_SET and
 GLOBAL_INUSE MSRs
To: "Chen, Zide" <zide.chen@intel.com>
Cc: Jim Mattson <jmattson@google.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Peter Zijlstra <peterz@infradead.org>, kvm@vger.kernel.org, 
	Andi Kleen <ak@linux.intel.com>, Stephane Eranian <eranian@google.com>, linux-kernel@vger.kernel.org, 
	Mingwei Zhang <mizhang@google.com>, Das Sandipan <Sandipan.Das@amd.com>, 
	Shukla Manali <Manali.Shukla@amd.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	Xudong Hao <xudong.hao@intel.com>
Content-Type: text/plain; charset="UTF-8"

> >> OTOH, what about PerfMon v4 bits 58 (GLOBAL_STATUS_LBRS_FROZEN), 59
> >> (GLOBAL_STATUS_COUNTERS_FROZEN), and 61 (GLOBAL_STATUS_OVF_UNCORE)?  Per
> >> Intel SDM Vol. 4, Table 2-2, those bits are valid in
> >> IA32_PERF_GLOBAL_STATUS, IA32_PERF_GLOBAL_STATUS_RESET, and
> >> IA32_PERF_GLOBAL_STATUS_SET when CPUID.0AH:EAX[7:0] > 3.
> >>
> >> When those MSRs are passed through in mediated mode, the guest can set bits
> >> 58, 59, or 61 in hardware via IA32_PERF_GLOBAL_STATUS_SET. Leaving those
> >> bits set in pmu->global_status_rsvd for pmu->version >= 4 will break
> >> KVM_SET_MSRS(MSR_CORE_PERF_GLOBAL_STATUS) as well as any intercepted guest
> >> writes to GLOBAL_OVF_CTRL / GLOBAL_STATUS_SET.
> >>
> >> As I pointed out in patch 04/16, we can't pass through the PMU global
> >> controls unless their reserved bits match hardware.
> >
> > I think there are two other relevant (but pre-existing) problems here:
> >
> > 1. GLOBAL_STATUS_TRACE_TOPAPMI_BIT can leak from the host into the
> > guest. If a host PT PMI arrives while the guest context is loaded, bit
> > 55 will be set for the guest, and the guest won't be able to clear it if
> > OVF_CTRL is intercepted (it will #GP as it is reserved for the guest).
> > Similarly, the value can't be restored through KVM_SET_MSRS.
>
> I think mediated vPMU assumes that no host PMIs can be generated while
> guest PMU state is loaded.
>
> If PT state can leak into the guest via bit 55, similar leakage can also
> occur for other status bits, e.g. when the guest exposes fewer
> general-purpose or fixed counters than the host.
>
> The scenario where both host and guest can be active simultaneously is
> handled by the perfmon_mask case, where intel_mediated_pmu_{load,put}()
> filter guest-owned status bits.

Looking at the code:

kvm_mediated_pmu_load() -> perf_load_guest_context() ->
perf_ctx_disable() will iterate PMUs with for_each_epc() and disable
them, which skips PMUs without PERF_PMU_CAP_MEDIATED_VPMU.

Same for kvm_mediated_pmu_load() -> perf_load_guest_context()
->ctx_sched_out(), it also uses for_each_epc() to iterate PMUs and
schedule them out.

pt_init() does not set PERF_PMU_CAP_MEDIATED_VPMU on pt_pmu.pmu.capabilities

Please correct me if I am wrong.

>
> https://lore.kernel.org/kvm/20260821222002.54907-1-zide.chen@intel.com/T/#m90394fda6d71ed0dd539a579abfb0c1df1e044fe
>
> > (I think the PMI may also be lost as LVTPC points at the mediated vPMU
> > vector)
> >
> > 2. On AMD, bit 58 and 59 have a similar problem. HW accepts those bits
> > but they are reserved for the guest, so the guest can set them if
> > GLOBAL_STATUS_SET is passed through, but userspace cannot restore them.
>
> Right. That seems orthogonal to this series and could be addressed with
> follow-up fixes.

Maybe AMD folks on the thread will take a look :)
