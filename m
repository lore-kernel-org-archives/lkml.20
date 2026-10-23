Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792781746;
	b=1CjHquZWYAVAczly9lEO1YvG3Lo4XZwI10/1jLRJWCL8IfipUQzwM/EpSRs6SYoCfe/W
	 B6HZrERsv/3Td2bOBE0C1TdN9XdxSb9sct8rEHSYPxiRQbM6JWCrRhOeUAE/cyiuWMR/J
	 zZGuGw3quQ6TpZogPJ9EBwyl0SZq1bgBqM7R+aWepKAlQfYa7huQmbllGtft5zSsIeSuh
	 /xPpMSz0T+a+J/DS5+kBSFeCFMNSMxEZtUgxqpj8rVISfheib3NwEfRlmKV66alK/P4Pb
	 bkaJTBVPQMETuDXf4hVGpjfe0H1BmR86tpoirRDcyreOLy2yHbbEJ4+x8vqdv90HdPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792781746;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=H7bF4HrcRDAm1frhSShdaIaUyCju/nDUt7oEcWaxAZo=;
	b=qXrIipwcxFvp7NzqYfmOnsAozRQwbg2wtDl3JPC9TnEgfY0nr4/1Sp2ynNBzBD2r4wkT
	 VdZFk0EzKYcAilSuep6kv+c2O5vNvUgUGYaX8lIVTbCRQxkrLnRCL0fB0IdFp+qXqSnZt
	 ab8XGU+fLU+ErQhApzU60iQovHT8GASrEnprES+C5F97KSEqmxHxjbR6M9Kj7hzM9hm9O
	 sbXKlzcGVIAoD2xcORtG1ukd8R8OA/qUiISr6ndZJKs0v9fCAnuPw0/j8cwnz1XChot8o
	 qOQ/P/I8kkE8pADcEVg5q89G6SLm2/lEwfwryw681H9OCZIZrlzCijdRkQ0/B92IeuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=u9OQsGB5;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB09E606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 18:55:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB09E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=u9OQsGB5
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e9995cea88so11796555ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 11:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792781745; x=1793386545; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H7bF4HrcRDAm1frhSShdaIaUyCju/nDUt7oEcWaxAZo=;
        b=u9OQsGB57/ipLe95e4sVaNu5Jg/bT+PWigJKLHAMDC2LAOUeOW5gqAcaPhvFsMCjnk
         cbPIC1qBjjhgY/S5GjlLmGkol02YI1OJ5+FpNX0e0iA07N/Lq938cgDR0zMDhsRPIoTt
         vijkBJRnNPqjLTTSRy9lGBo+Fauxuk+MTY2aqXQRyCm749jfQck76anwk2jK3xZ/itgO
         Cc4V1MrvvranYhNz1RI1umOtgkhsSJ5FkwfV+wPbKLbGePJVtvAdOeS9gjeyRIWry92Q
         hw8+TYP+Rl5qzu12qdWQIjpayxi3VeRul/C9ZyiIMT971/xPTG19LH+YLqUs6UkM9WC8
         ZedQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792781745; x=1793386545;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H7bF4HrcRDAm1frhSShdaIaUyCju/nDUt7oEcWaxAZo=;
        b=vruqnrWNucJ362HKRhoeiGrhloQwSy6YbLzJhL/nxhJrldxxHdRiUwk7zvuP6p/aMq
         2GD6OsAaAGW/2dVWly5oYN3Y2Gz4Wd1q33VFd4pG17p+cKei0Wu2Fjiowi/s0PxtcjXK
         nsY5kB/mrbVi2bcMRtuCNm6xwrkOBR+Du4qfUqIj714wTqt6mo8WC2BK0SjQAD2WJAur
         4NZ721t4pMwH+H8SenwfA0SNnaBvYHg8vOgkCoa52bd+9lAN0WEZXZ0KEnpzO8wh/15k
         A1QB52aHdfZoR7IarXvsHTnrVFxLTU02hs8tEbuGUKdZ7iaJTb9L1uinSvF73u+J56PB
         SR2A==
X-Forwarded-Encrypted: i=1; AKwUvBws+BhxFspbD4SWUU4XZKDUwdsWjsZiNgr05KYQPZJp1p8co5/9RpLVUAKnaMq1lbIyMDca27QAq5ogVdo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYuEISQnMVQT89WLwQtJtsQIiqDBuN7FS6IuYptJNbz+2FtAC9
	TBNTk8I7O9kia+nSK61y6VHzcQh8YtFLjEin6kDeAuyrURKRc0CahjtfUdwKLyK1x2VDRfZ3Mjf
	hCYM5Y2uTM5Hdjg==
X-Received: from pldv12.prod.google.com ([2002:a17:902:ca8c:b0:2e5:e1dc:c5])
 (user=jmattson job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:2f8f:b0:2db:733c:fd1f with SMTP id d9443c01a7336-2ea7c169201mr30400375ad.8.1792781745065;
 Fri, 23 Oct 2026 11:55:45 -0700 (PDT)
Date: Fri, 23 Oct 2026 11:55:44 -0700
In-Reply-To: <20260918193937.569414-13-zide.chen@intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20260918193937.569414-1-zide.chen@intel.com> <20260918193937.569414-13-zide.chen@intel.com>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261023185544.3305206-1-jmattson@google.com>
Subject: Re: [PATCH v9 12/12] KVM: x86/pmu: Support RDPMC Metrics Clear Mode
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
> +		pmc = kvm_pmc_idx_to_pmc(pmu, INTEL_PMC_IDX_FIXED_SLOTS);
> +		if (pmc && intel_pmu_metrics_clear_enabled(pmu)) {

If kvm_vcpu_has_perf_metrics() requires fixed counter 3 (see my reply
to 5/12), pmc can't be NULL here.

[...]

> +	if (perf_capabilities & PERF_CAP_RDPMC_METRICS_CLEAR)
> +		pmu->fixed_ctr_ctrl_rsvd &=
> +			~intel_fixed_bits_by_idx(INTEL_FIXED_SLOTS_IDX,
> +						 INTEL_FIXED_3_METRICS_CLEAR);

This should be predicated on the guest actually having fixed counter 3
(and PERF_METRICS). intel_pmu_enable_fixed_counter_bits() only unmasks
bits for counters below nr_arch_fixed_counters.

[...]

> +		if ((data & PERF_CAP_RDPMC_METRICS_CLEAR) &&
> +		    !(data & PERF_CAP_PERF_METRICS))
> +			return 1;

If IA32_FIXED_CTR_CTRL.METRICS_CLEAR_EN[14] is only unmasked when the
vCPU has PERF_METRICS, is this check still necessary? KVM generally
doesn't police userspace's feature combinations unless it has to.
