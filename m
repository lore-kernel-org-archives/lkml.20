Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793198960;
	b=KmuDMzDFhXL5rVOcgshYMjRLQm0hCVflMXzbVxUrAD87fAyo4YFga+7x2rMZVawTJ7nO
	 +TTu5jhw0RvV1XK8jbR5MH/pKj8xyp7iXnCA36EVe1EQRDqF4vIY2dO3R4f8vPZQIIDzu
	 pn1IanBWmVoa7kiYt8bYi2MvSsSvGxiQhGvLlBO4NsGnlp4+CBrCvmQSQa2Ax1C85QgMQ
	 2x8bRJvk7hrRQcYruPNcXg7Tc8+sIlvrE/JZGQK0E9oo44F8jCDbcBZIcmZpR93HyZcpM
	 mse1bsvy5iyZ6tBinJ0CM59I0XeuA/+qMo+TP1bpL2ppS8ip3LUWwubJUy/kRWH4FDw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793198960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=utCPzy+tkw4ynkgJD1keEVLYIPaT4gQebzETd+jl33s=;
	b=fWe2rst3gaeArfRrcDDpNQb0vAQ1g+I2FMLNwpDYin+7XIifsq15bzCA/c2lfLGnTMu0
	 UzdcGvixjpPaHyyK5Imux3knzZLRv6Qg8xuI530H/vIcZNwwTTd+DED7yNGKJrNP6lQbA
	 shq0mpS5GOeSoy0f/b3c4eyMfdQW9VaoqlHkrw43hgGMLEqrP9N+52X3Rws5oEKyAdrSs
	 TRDleW+zLMm/IGbCnyAxPT/JNnO6ZiRxKApZiYt1z0f456jRAgzQ1+eKzFmzLUsom6a0A
	 A42cbM0oszWAoWQXC38NT7vuyx1OnjYbM9B+SqbpqJb8vBYlrCQsx28NHDD5y/EegZQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dNBIc4c8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11934606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:49:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11934606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dNBIc4c8
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b1aa36fc0eso14378a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:49:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793198958; cv=none;
        d=google.com; s=arc-20260327;
        b=OLZKpbOYeSstYEszJNkrN72Bkss7Uj1T1JQBElejsUmsreFA6kDcLv7CqJVuJqDEIR
         /WgeaZArTs4mf3VQX2mtFPffjaOT/juZsW1n4nYDulHHXBJhhrtiVHCjEGOtXGl+604d
         IToCbuWsNGFk56CC50u5+axC0MTpl9jy/ZqCWHdx0JeyOTEj4GrwPRfbh0knOTh9VpXJ
         /9UrbYlIFzgwOOgvdhapLt7XUgtNt3Pw8UaRGMjyCQuf7OuAzhOOt/CRTllR8NDNeQMJ
         4yR9oyu/EobxVsojjNru224QMOaI6hn5F4g56Y5JLYlgmyLtpODA6ehJMvWt8HRD2Ele
         rJLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=utCPzy+tkw4ynkgJD1keEVLYIPaT4gQebzETd+jl33s=;
        fh=WvXvcl4G6zU4N+uwyb2Ni7W6Rc14U0foyYEOTeysMk4=;
        b=ltSQU08/oq2hkxdm4HTRbRtHhMBvISbCFLYKBTCeG1vA2sDDr0+aTVDK/iovE0cxyX
         KUfMUVBCqgmPPlQGc8m+c9FnVThAufZWiwodLx7U6umsypBnufL0fIrwuBEF7A72aXoC
         fk7kqdHUmtoq780LM/xBxsxpPw3OPWv4bjFgldcOOgSseIRb1shVUlhlirXALPgQ+a44
         4CLwRrPcpETFmdY1BxbG74KSEXmmHESfOrlFN0LhspAycJq1KZuIG9ycnpRQiQ2SLTc8
         rV2pwekL8C7am0TQxd8uRbcWManIKnfwC5Gj0n47xH12YvjBKplBYAthkx7r8ryQf+D9
         AXlw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793198958; x=1793803758; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=utCPzy+tkw4ynkgJD1keEVLYIPaT4gQebzETd+jl33s=;
        b=dNBIc4c8fsaG0NVOcYeVV2p4ae5N3eN0y3Klumt9jGzf2fRoQqNuMgVR7v5vG+18iz
         OgkRyhT3pdiFYLqoEijj1DM/rb6zHktERZR0l0kxhHB+y0T1hcnMmnDNIK/iF+Z6EH5a
         3KsIke5A0JpLMlsQY8fa2Wsge38S87XWFubshExtqt/IDdvjojOLYE5QjCeYn5RRG6/m
         zHtdIcQ+Fl3DSySlAMGGCre2EYpcEajV80n6lvlDNaPTba/3f1Mdj05qoxCf2f6F0HRG
         xgXYbbQGX/+5FrsHZrR5JoKCYQLgl9I9ktaswOMBwcm2W7fbp/HfbEjoUjOILu0GNw/v
         xzvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793198958; x=1793803758;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=utCPzy+tkw4ynkgJD1keEVLYIPaT4gQebzETd+jl33s=;
        b=hmB+cQ+j5HRH5airmWImndj3rVvoPq/Xxeo+vJOssdkM7+SL4aNYfhZxtrYijXKavp
         orZvZmQgxFmshyQIMIRo4g7H1UqeDZB6QmgxyzceIs/7V7YZt9pPM1i1cKX55kW354fH
         Xk/QmmDCzIWhdBpOPlqzRshUmwIPwam1RQEUFWuI+rp/S51MPuwiUW/yqRRb3j7J91Tt
         Qb2aQF210n5kgK7pGH/Sj13z4QNUxpnPF0SI3kJGhS4X1Xzh9tpY7fo4j67+Boi4KrmP
         YCPnx9+Vi7sF26wG4OvqgrYgUONhRBBa+dFm/iSvEJG8CrDIv26O54Fd84mnZND3dXhW
         SP0w==
X-Forwarded-Encrypted: i=1; AKwUvBwhjyM5uNiL2/+cTE5VrWnCGbR/vQWgkCYFeFC6UScT9RfdNYabUzgE1wS4Et9p2vg16IDo0qW4f4Lps3E=@vger.kernel.org
X-Gm-Message-State: AFq9FYKWgOR3G87fhOEbE+5ILEj4hD5E+Izgqhoz9xThzXEHxt54tkJL
	s7JV35czqZ6jnqzja/XwPKWz2OpzAeoGYFm9PhFVC5VinFTApgwjpVbYVw6AjOv4oKnZXohdV/O
	aSNKjbgue4GYTBX1+w+Tcc/+2G+GPqAm5/9wXVGV1
X-Gm-Gg: AYBFou38GrBnhWKMcb4kFJL1utpaWlcP9D4Hi+zxKmJggiO6UzfnBc+pXVqurLwEbpA
	CVEaz63fr11ROr2WNkdSxnHzlAAGvEw+qzLJ5fSp5jym6upFCAWxWvja5/OZu+LUlyR6Wf8Qa6G
	qteB26um7sBW9x3auSic6Z1AZWNNkSx6wT78HDRpf02QFu3zjZfsmEPAdeZtoE9igtcd5+A4xHX
	+JNqFU1Nm93M0mBBztPX8NxLQAIxAdrMRVfUB2B2GE7dkrk+NgCWc4/giJOygNmXdGthW3D31u3
	XJCb0GamYkEe/ed3bZSrWSZVlN1nTdAqSzMmmgDjFmV7i5nolkp0l55pU0zuFsXaoScnKF9S1JO
	MlgOhx4CelFFID1AtmipW+LmU6SugzpOlVHO8pQ==
X-Received: by 2002:a05:6402:c502:10b0:6b1:aa31:a627 with SMTP id
 4fb4d7f45d1cf-6b4994b7ce3mr82073a12.4.1793198957960; Wed, 28 Oct 2026
 07:49:17 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260827223755.143247-1-zide.chen@intel.com> <20260827223755.143247-7-zide.chen@intel.com>
In-Reply-To: <20260827223755.143247-7-zide.chen@intel.com>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 28 Oct 2026 07:49:03 -0700
X-Gm-Features: AclHuK8n77ASv0YtAhp7uY-rKpDmMZOITBWFwgXV3mX-mvm_sx5SsIOEQuKTOts
Message-ID: <CALMp9eQ2D2BjX8ZNqRuNp9h46Rw-_7pJD=50JAXbNHf5KEVj2A@mail.gmail.com>
Subject: Re: [PATCH v2 06/16] KVM: x86/pmu: Drop nr_arch_{gp,fixed}_counters
 from kvm_pmu
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
> From: Dapeng Mi <dapeng1.mi@linux.intel.com>
>
> This is a preparatory step toward fully bitmap-based PMU capability
> handling. Later patches switch KVM's view of host PMU capabilities from
> counter counts to counter bitmaps.
>
> Populate and use pmc_exists directly when walking guest-visible PMCs,
> instead of relying on pmu->nr_arch_{gp,fixed}_counters as intermediate
> state.
>
> Iterate counters via the newly added pmc_exists based helpers, and
> remove the now-redundant nr_arch_{gp,fixed}_counters fields from struct
> kvm_pmu.
>
> Note: {vmx,svm}_recalc_pmu_msr_intercepts() may leave stale intercepts
> on GP MSRs after CPUID narrowing. This corner case is resolved by the
> following patch: "KVM: x86/pmu: Switch to bitmask-based KVM PMU
> capabilities".

Are you saying that you are deliberately breaking bisection?!? Shame on you=
!

> Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
> Co-developed-by: Zide Chen <zide.chen@intel.com>
> Signed-off-by: Zide Chen <zide.chen@intel.com>
> ---
> v2:
> - Fix AMD legacy PMU MSR intercept handling for guest PMU
>   narrowing reconfiguration by adding for_each_clear_bit_from().
> - Re-word the stale interception changelog part.
> ---
[ ... ]
> -       for (i =3D 0; i < pmu->nr_arch_fixed_counters; i++)
> +       kvm_for_each_fixed_counter(i, fixed_mask)
>                 vmx_set_intercept_for_msr(vcpu, MSR_CORE_PERF_FIXED_CTR0 =
+ i,
>                                           MSR_TYPE_RW, intercept);
>         for ( ; i < kvm_pmu_cap.num_counters_fixed; i++)

Doesn't this potentially leave stale intercepts on FC MSRs after CPUID
narrowing as well?
