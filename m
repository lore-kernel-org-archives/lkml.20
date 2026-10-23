Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792780065;
	b=damKl7Rgri440ZIkkccroLiHsYGsqx6uC7pnCC5v9ZRoe9rAa02YM8F0rj4ASKlXgmby
	 0iNWKKuU2HE7miIUaAVLuOoO+jx22kJ9oZyfFv0kgJ4HdanSyNNlPKJjCVrWOFiDy9fD5
	 YR9+PHwS9FfBuXEzRCuwR4ao1QLbORu9GPnO7m2ksgwARtkdmu9g8RShjctf2Yemy6tpF
	 pWHQZWIvxtVxvZq+JeLG8UwN9wMMo7SXC+7Zfcui7uNZ5KdMp+0OR6aiyaMpcyUOJBKwB
	 vyq7BZDLICR2fybNarmP/EHkM8SSWy1YdBVG5cOITVuMBJ4cUSCVPIiVscStQftbwhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792780065;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=3IeOutF+wMeMppvQuqzygdEXEQlLVsY7ZzZRX7jYVpw=;
	b=x1A1IShPton0r4K7RrtzZiiVjLWUMIZ7lbtU1ZJn7sC6ygyNcZyAjRO/RSt1cyiSMdT8
	 R0ySQoXtguYAlQj3lThovCQFxEQMucrCRqQ9OrDVmqUKrZhf3nDky2G+b1JUCZNQCAtm/
	 D9CUfF097hamINk19dfOoApLl7N5U7eJcpmKHKOqTJnZZA+CrSH5hfyMkgTDq6P8XM8yT
	 8+CFSnPyujA/CBPDjmnOGcdQ4WkLFb6PAJg5i9CFxiHTG8do1x6NqcIpRyIEKcFxqBDFn
	 9X28tUi0SX5Ksj9l7gwLMD8Qe9Sb7E+VkrxqpGjQxil22CkVgrEG5FGOfCc/wijV5vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=cDp2UDN4;
	arc=none smtp.remote-ip=209.85.216.72
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39ACB606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 18:27:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39ACB606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=cDp2UDN4
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ada6ccd402so1037706a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 11:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792780064; x=1793384864; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3IeOutF+wMeMppvQuqzygdEXEQlLVsY7ZzZRX7jYVpw=;
        b=cDp2UDN47M8RQHr0YefYNHYqkoJlDZAJH2S34MJsUlUCxMkQx6K2ceVZ6j/t1MA0d1
         08qJVn6x9mPuInLC7vAcK/f/cGlL024vhXRAq+Nh3u+ewWmWclGg3Hr4Uen+R2sW8PjP
         qbKcym2oGrROB3cr4W7GCf5OWGMfZjtrSqYTzFG1ZzmKl4pBwNDsbTRlYmM/wuGRPjkr
         0FKP3IBTTcf9YyniYe1XmUfhYf4p91TUZ10b38uPYqjvCyT/Aldlnvf3mM2M6L6XuW9G
         TA+fD1ax5i4qOuJNjzzDsBQnXlV1ESeLJhXL1ZdR55K381+lwmUuFyCIBaSxAktW2QLp
         9BSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792780064; x=1793384864;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3IeOutF+wMeMppvQuqzygdEXEQlLVsY7ZzZRX7jYVpw=;
        b=cKr/fxiWD0PDQKzoux0Fhwgb3i8XAtTvlk3HxW5eP571ClCYZg3xP9JLLJv+8OmWmD
         MpI3oupftpXBHo9RtDX2QoPc8LkIdw9X7p0GyclJ96wmnsAU/zMZXq8TEiGrKGF4yXq0
         B2dkgjKyRUrrXXIBLRem1k6EGAlwzz031wblSEs+GjJL17M9pgICIRt4UAcEFgDtQrhK
         yM0BGT/xwbbur4ZByfhHD7fYYfLyk/swh7VdVtShfYGwtYDOqi44RsGJTiKY0lu3EF06
         5FiWq3YziWPrD4swuusunMCzFwLmhDP/tDr6byG8cZTQdqYpTqNpgu77K8Q1dniw93mp
         HMPw==
X-Forwarded-Encrypted: i=1; AKwUvBw2qrS3jwEe1eMV3gD7sTUjMHtHD0YiVF2PLcbS+oS4jpAH3VcrOP9ZOt3JzenYcXmuhzjXXXtY5krkmNQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLwungLwkBfYPze9ajy7tXkwfV7+em4liCdAf/ccv02ksHpLDrP
	blhGiNgr8GKNIhT0co79ldCAyQatadoo3clUr09Jn/SKFJVgrVJr4/nGUSv8g6L38al4TaQlCwU
	FKCGkT4T/irJMVQ==
X-Received: from pjvk6.prod.google.com ([2002:a17:90a:dd06:b0:3ad:ce09:ff3])
 (user=jmattson job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:1a86:b0:3ac:b7b9:6484 with SMTP id 98e67ed59e1d1-3adeae8622dmr109354a91.45.1792780064392;
 Fri, 23 Oct 2026 11:27:44 -0700 (PDT)
Date: Fri, 23 Oct 2026 11:27:43 -0700
In-Reply-To: <20260918193937.569414-6-zide.chen@intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20260918193937.569414-1-zide.chen@intel.com> <20260918193937.569414-6-zide.chen@intel.com>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261023182743.3248481-1-jmattson@google.com>
Subject: Re: [PATCH v9 05/12] KVM: x86/pmu: Support PERF_METRICS MSR in
 mediated vPMU
From: Jim Mattson <jmattson@google.com>
To: Zide Chen <zide.chen@intel.com>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, kvm@vger.kernel.org, Andi Kleen <ak@linux.intel.com>, 
	Stephane Eranian <eranian@google.com>, linux-kernel@vger.kernel.org, 
	Mingwei Zhang <mizhang@google.com>, Das Sandipan <Sandipan.Das@amd.com>, 
	Shukla Manali <Manali.Shukla@amd.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	Xudong Hao <xudong.hao@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 18, 2026 at 12:39 PM Zide Chen <zide.chen@intel.com> wrote:
>
> +static inline bool kvm_vcpu_has_perf_metrics(struct kvm_vcpu *vcpu)
> +{
> +	return kvm_vcpu_get_perf_caps(vcpu) & PERF_CAP_PERF_METRICS;
> +}

The SDM, volume 3, section 22.3.9.3, says:

> IA32_PERF_GLOBAL_CTRL. EN_PERF_METRICS[48]: If this bit is set *and*
> fixed-function performance-monitoring counter 3 is enabled, built-in
> performance metrics are enabled. [emphasis mine]

and

> The values in MSR_PERF_METRICS are derived from fixed-function
> performance-monitoring counter 3.

Hence, a dependency on fixed counter 3 belongs in this predicate.
Perhaps something like:

	static inline bool kvm_pmu_has_fixed_counter(struct kvm_pmu *pmu,
						     unsigned int idx)
	{
		return idx < pmu->nr_arch_fixed_counters;
	}

	static inline bool kvm_vcpu_has_perf_metrics(struct kvm_vcpu *vcpu)
	{
		return (kvm_vcpu_get_perf_caps(vcpu) & PERF_CAP_PERF_METRICS) &&
		       kvm_pmu_has_fixed_counter(vcpu_to_pmu(vcpu),
						 INTEL_PMC_IDX_FIXED_SLOTS -
						 INTEL_PMC_IDX_FIXED);
	}

with intel_pmu_refresh() calling kvm_vcpu_has_perf_metrics() instead of
testing perf_capabilities directly. (nr_arch_fixed_counters has already
been computed at that point; all_valid_pmc_idx has not.)

KVM only supports contiguous fixed counters today (see patch 2), so a
simple comparison against nr_arch_fixed_counters suffices. However, if KVM
ever honors the CPUID.0AH:ECX fixed counter bitmap, a separate helper
keeps that assumption in one place.

As it stands, if userspace sets PERF_CAP_PERF_METRICS for a version 1
vPMU, MSR_PERF_METRICS is passed through (kvm_vcpu_has_mediated_pmu()
only requires a non-zero version), but intel_pmu_refresh() bails out
before it gets to the PERF_METRICS code. With patch 11, that leaves
perf_metrics_rsvd at ~0ull, so a value the guest writes directly to
hardware can be saved with KVM_GET_MSRS, but not restored with
KVM_SET_MSRS.

Since nr_arch_fixed_counters is 0 for a v1 vPMU, the above handles that
case too. It also takes care of the METRICS_CLEAR_EN unmasking without
fixed counter 3 that Sashiko flagged on patch 12, and it obviates the
NULL pmc check in intel_emulate_rdpmc().

[...]

> +	case MSR_PERF_METRICS:
> +		pmu->perf_metrics = data;
> +		break;

On a part with only four metrics (e.g. Ice Lake), userspace can stuff
bits 63:32 into pmu->perf_metrics here, and the unchecked wrmsrq() in
intel_mediated_pmu_load() will then #GP on every VM-entry. Patch 11
isn't an optional follow-on; it needs to be folded into this patch.
