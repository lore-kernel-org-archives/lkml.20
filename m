Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793655435;
	b=Wnnx5BI+ZvWn+UfgHOpiZdiKb6aBdEiXX2dIG4yg02A/nO1QH/3u4y5GKg5L3gQnimxN
	 Ab/2dklavBefaMenuRVyqdeGCnv+OPwD5p11yhxz0gnPBoM3ezBoAleOKJDrpfX8klMfH
	 MSZCA7BLrcGLAWjY4yvWabjy88xq9m5BKcQaThJlm/quXyVb2DbI+Kp45XQHUGy5+Vcw1
	 H40YJ3OkJkpnopBf/WmLBxd8seYpy8nggBnVC4uED9p5DPbJNrKp957grh10uY5U9Wj/E
	 dEdDctK4auDDzFXNuHcrHkyjcev5hQWNEQUMj1hGawyguwdwOKWDZT/RHLsOMw3OLxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793655435;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=VeHb/7+mqIyInEKjZyFtleHGQ583OKHZZwEKQ2ya4ZM=;
	b=DhEz+Sf5TvxoBeq6dRo9H0E3NIs+/jIB9KWSbLJHy/dbCLTcJUEcMoOj+scH9yWjR9ZB
	 P2Isx4fpsOp1weLZRW7RZh6HJBT33W8qqoz1FYqEgSIGQ67HiN2fWqZH1Fhmij4to0fO0
	 MGR6ZlBZBTVJglkviKf6/69P1pwnWBAzpQ3uaGoD9p9srBeB2Nbk5263RSZzlFDjW7epv
	 jhell2EIv3Of2xM9G3iL+k6XEK8rGRoc2keNk/0O1sBauXnHJ9ZuRlRt8AmhX0wwEBA4O
	 MbKACHnVEQHCHTLet3Jf9Q2Mo79vmgp7yxHyhb8W9Cu5diP7z8P4pRbeffkTyc+bAQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nYvXrYYT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF6B606A32F
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 21:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nYvXrYYT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02D961F00A1B
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 21:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793655430;
	bh=VeHb/7+mqIyInEKjZyFtleHGQ583OKHZZwEKQ2ya4ZM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=nYvXrYYT8kUH8zuvCJlYV199AdYhv2UTeQEcxjvoLj+Lwh2EinEq8Lw1u6Bh2Wnsq
	 oMlxkLuxiCWtfUROpt0HGkuFunk0uILUHOzWc8e14B+tqO+TDVcJPHQItaX+buiTio
	 dDqrPACOULO8Rmzr2yzKm+C/BMe5e7wzYcHox2Jvt61YtHWbOhbDKHB5fwX47F1S8+
	 TqEvd9sLncQREHmX6/m1ZaBdwwuzu7yxG26fso9sYkLwaswDcUcGlODsYfmHax9Rpt
	 CakQXC6/ibmKWA0Z0kAtlRD8bH40leBy8b2RpulsdTZrXQndjUeA0ejfuktgfVhdWn
	 NcDvR+Nf1LrKg==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c3fd91337baso593457266b.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 13:37:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBy2qx2SialdlqFkpfCuTEd4YdWdZUunPwNVeAFNgTRrCr0mBsEYazYEcXZn/waoP/xdUtmQW3n/BIedou4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FzL1JSQRzXv+I52kGtlX5h2g9KWFu1gv+k8XDoYHAG6mn2l4E
	A64rGUjsSP1Y8aTE+QYxIfM4o1XBA+lRSUNIUIJIJRgCr0l0jDqFazFTgezQSVXvKZKInsg0L9Z
	QymXIDh12lX7xI29roHd6AIBs9A/dsx8=
X-Received: by 2002:a17:906:2990:b0:c3f:e414:d35a with SMTP id
 a640c23a62f3a-c4cba44d6e2mr470635166b.26.1793655428951; Mon, 02 Nov 2026
 13:37:08 -0800 (PST)
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
 <CAO9r8zMxQnRLKGrW69rX7703AatWMp6KOXMObL9baHRPs4dW8A@mail.gmail.com> <6c9a13c9-e6c1-4540-a8ca-1f0e800f3571@intel.com>
In-Reply-To: <6c9a13c9-e6c1-4540-a8ca-1f0e800f3571@intel.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Mon, 2 Nov 2026 13:36:57 -0800
X-Gmail-Original-Message-ID: <CAO9r8zOWzr61pkkF01AvEp+YSOo6bA1N=L91RYiM=ETtK5+D9w@mail.gmail.com>
X-Gm-Features: AclHuK_81Xn7MYXwfn7C7Q8S_viok9JTdCsG-LNAeRMkvievKFooIXM0eiyMCfE
Message-ID: <CAO9r8zOWzr61pkkF01AvEp+YSOo6bA1N=L91RYiM=ETtK5+D9w@mail.gmail.com>
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

> >>> 1. GLOBAL_STATUS_TRACE_TOPAPMI_BIT can leak from the host into the
> >>> guest. If a host PT PMI arrives while the guest context is loaded, bit
> >>> 55 will be set for the guest, and the guest won't be able to clear it if
> >>> OVF_CTRL is intercepted (it will #GP as it is reserved for the guest).
> >>> Similarly, the value can't be restored through KVM_SET_MSRS.
> >>
> >> I think mediated vPMU assumes that no host PMIs can be generated while
> >> guest PMU state is loaded.
> >>
> >> If PT state can leak into the guest via bit 55, similar leakage can also
> >> occur for other status bits, e.g. when the guest exposes fewer
> >> general-purpose or fixed counters than the host.
> >>
> >> The scenario where both host and guest can be active simultaneously is
> >> handled by the perfmon_mask case, where intel_mediated_pmu_{load,put}()
> >> filter guest-owned status bits.
> >
> > Looking at the code:
> >
> > kvm_mediated_pmu_load() -> perf_load_guest_context() ->
> > perf_ctx_disable() will iterate PMUs with for_each_epc() and disable
> > them, which skips PMUs without PERF_PMU_CAP_MEDIATED_VPMU.
> >
> > Same for kvm_mediated_pmu_load() -> perf_load_guest_context()
> > ->ctx_sched_out(), it also uses for_each_epc() to iterate PMUs and
> > schedule them out.
> >
> > pt_init() does not set PERF_PMU_CAP_MEDIATED_VPMU on pt_pmu.pmu.capabilities
> >
> > Please correct me if I am wrong.
>
> My apologies, this bug is indeed real because pt_pmu lacks the
> PERF_PMU_CAP_MEDIATED_VPMU capability.
>
> Adding this capability to pt_pmu seems intuitive, but unlike
>
>                        the core PMU (which merely toggles enable bits),
> Intel PT is an AUX-based PMU. Stopping and restarting it on every VM
> transition is heavier, and I'm not sure whether it could introduce a
> noticeable performance penalty.
>
> However, whether the solution is adding PERF_PMU_CAP_MEDIATED_VPMU or
> some other mechanism to enforce mutual exclusion between pt_pmu and
> mediated vPMU, we can address that in a separate patch.
>
> To immediately protect guest state and live migration in this series,
> I'm thinking of adding the following defensive filter in
> intel_mediated_pmu_put():
>
> + /*
> +  * Scrub bits that are not virtualized for the guest to prevent
> +  * possible host state from leaking into guest state and breaking
> +  * live migration.
> +  */
> +  pmu->global_status &= ~pmu->global_status_rsvd;

This doesn't prevent the leakage, it just clears it on the guest->host
switch. So it helps live migration but I am not sure if it's better or
worse if the guest sees the bit unexpectedly appear AND then
unexpectedly disappear.

We can clear it when the MSR is read by userspace, which should fix
live migration, but the guest will still see the bit, and it will
still disappear unexpectedly but only during live migration.

The guest still won't be able to clear it when OVF_CTRL is intercepted.
