Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793210255;
	b=uDMFq8lGtNjiL0ctlbwmZIeqpngqPjag2OGyYfNHEz+QD2OvGUKjZLJMSkJhUT5bFNuf
	 Hb/DC5jhyLa+gHwwjRP6mGnCqW7owuoK6vmhqU6MRzpUNkccbVGGvelunhAfHkEPAP0FD
	 dm41LUx5I8C8wH9zgKMxGGqmaiS91RqYiur6N0LmBFS6CRscqTLTZqZo5irHRqfQnoCq7
	 jAXFrevF8GoR/ApwWBw3dsAxXdserCealsZDIskob37KCuEhH6xVML9oqKcr/xfG0xybD
	 OU4hbKUTNVdjrB1fvspjIH5BQIe+hMmVwPLtdvF+Ykox/UTxHL4psAnd1/8Sxv1m0QQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793210255;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=A8Qa0RXrX/7XNwbg8ZPCHY/+0wHx6NViJNjYhzl2jao=;
	b=zg6gG+CvtLeSMkpdHcojOudP/XpePiXq7XuopeDuNoLeViBtXTKND8npb0H8Jwo9OqAZ
	 FCWk+RGTH1CE1W9pORKHIrS/yREEOEIciM6ZJoykG5xjIp3/c8D6pX5jv/bCi7lIs/lE1
	 fRsgSez2MHXbCNXiSeuWcssCVOB23owYnhSEr5iZ6YyAptEn4GQOv0KjFTxl53xSHrjZb
	 qBfflmWWMCbz4/DX4Jw/G4U7qd1tFY4vXkyS0ZhH9M1w/2s/DI1HLemHp4wf1N2HxM0Vy
	 nRJqLf6oPVUQ656Ly72PzWDk7dj3sFu2obYUQyrcdNGAWox0n2RxT6vnoAWkUj68Kbw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PTyR36wD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF9D606A321
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:57:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAF9D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PTyR36wD
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b1aa36fc0eso1330a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:57:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793210253; cv=none;
        d=google.com; s=arc-20260327;
        b=bGO+xDvuMCcZfDRDlcV/hQGcmNYNJe9jqT9H9lj3rkIq2sqoJSeW56oUd76CSSJvGk
         yn41sLNGSBeK1fmBlX9PK7Xw+dakCTRhuh+ptlO8I7l4KjRzQIOww4LYtd01RTyZBIeW
         SQ5QUDWNVc4vHDA4UI0UreBVF5oE/WOaQCm2/mwPI223H6iE1Btr6YcG8AmddcXs4QYT
         vVCVfYqIo1kh49Ztb8qpOJgM2uVOe7olRv+g4rQVCifuTySSwUF5RJa/A9BBqsLOQOXu
         X/c9R8gDta326iXL6jcgKq35/iVEjSpj7I0Ub3uO+ShNbOkLMqz/+TH2gPl1LLJ9jlUB
         tArQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A8Qa0RXrX/7XNwbg8ZPCHY/+0wHx6NViJNjYhzl2jao=;
        fh=vE597oOfVeOuOAPor9a68PRBrBlWDOTA++KnLGBmCZ4=;
        b=FMZdD0uo+ygM5NmU99xyaDwgjnfXfldCGs1gp8wRgMaz5wm7xV+1A5qfbCDmV+JBt3
         RayMSTUsmYwFOLrwTixyKHv3UF5EP6yt39lEKTTixTX3Qs7O46/ggxojtF/IJxcSxgml
         3bcAJyGAh4fJras1IXC2KSuaka/Mtq2DWJUVDgaQRl9Rff44lhXr9lh9OlFByt6vXpRn
         N0wxIAD/Y6JglgyjkNoIpHnImJdlF2IIbrtPhbB1QnUBZkPrBw/OaWDKdWlWbfVR7J60
         adzpeS5yQTCDnJ/9WsbQEHu3I8Wv1XUbSn0vg2UQ7F+haIRCrahFAPfm09/hOM4B6KjP
         KoUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793210253; x=1793815053; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A8Qa0RXrX/7XNwbg8ZPCHY/+0wHx6NViJNjYhzl2jao=;
        b=PTyR36wDE767qX1UcGNiYx9neazEbkrUFr6YQVJeFw5uHpzwmI8aapiA1c94+AB34P
         kCPbLvHntxY5oy8tC0Zqg0dHVxwxYvspKevFci258uZKjHvdqYsskD0C/OV8EeCXGeiC
         bkLtk76uCalpZMpSLbiJib0TdHufIb3piKcyEqWOorkpLj+Y0nPRSGxzyZloiEvfx0PM
         6myWSQ3eG+lcJ1zVe0Rr3cQRbN2qF3eT/ymud5/N0gLwU8fgiA6s0VIqh+7q+LS3SLQy
         5sKJkUZ+TDohA9EEnmhPFpEpSut03C1Vj8Xa/Dynj9OMRxPdDvLyEGB1KtIzY+JLEc9W
         C73Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793210253; x=1793815053;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A8Qa0RXrX/7XNwbg8ZPCHY/+0wHx6NViJNjYhzl2jao=;
        b=mTTwR4fWiKtlsH4ZVOr+vCcLIUG4bnutnMZQTvEzjhimf/6wEQev7u+DnJGvCPnLrd
         b/PVsIkj9vJHnvqZgq/nh/dHD3KPTZv6j4TvhASl0kUkIHjDY7uUBBrFBMJW7jJXGFNN
         wkxs2vXXP2RA9N0dOGewkCJGw2M1LrHbMmhEN7DZMudrad65TGnxCbIVxZNTnQstSkx5
         GUnDXizTs6ui7bzMMiCTS5Dq/5ZeD3kPtt+jUqjwk4d1GeFzdLWJVoVPXsxdZFgoH03G
         xqr5nmKM5tdURJNpPx0lk0kB6oqCOpi81BDmv8auv9dUhM/Cxu7IogPqoNhAJJLsBRHM
         IT/g==
X-Forwarded-Encrypted: i=1; AKwUvBz7NIhIhO7M8zEbGcKod9Qc5+lwUeA5m2+V5LNyLev+7VYiLbE0Qr+qeqek0bdZfqlWkyc5hJer3fTGIF8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLBd0fojaR6PmGqvQcwkBo4oRdca7RZOQXLfRKr78L8CenU8n/i
	Zr6ardvu42DzIPegogG6qz+ancj63tYlPWQElW7Zwtafj3srrpexbFK8CsR/+ivB8u55O7cNl/b
	QcTJ+/RJCipM4TJt1/N+lEUeasRmGhZaj8rgYTI7q
X-Gm-Gg: AYBFou3xExxLmJDCTiGJLm1E5NsRIhAgobrWStebZd6NiXAaJ6J5mX5F4b4Fgimy324
	Ta6JK1F7LFPQx6QZw8lsZitKwRHDkYUvZrVPQ+vV02Jc8I0Tyg5kh9f2tP6LTt0zNnLOyfcfgA+
	NchzbNo1X8vUmx56OcUw4qEU0Enp9WOF+LPeXx7B2aDOaouuaixCGibQBW6FNUZBsy2LkQXrSlV
	9XspVHuSu22jCv4Wvt+0fiWHy4SiswVMnkLZt2xRAqV6MmHIi2lhY/3bzgzBgwTHNR1FiVDtKyU
	Sq8u73q10aC8Ie9RkQ890ttEc5pFiyjkhYhelW+OBwMs7gsPduHZOvnAtPIY9Nzmrdz7KRtl4Tt
	cmgtsM6h1jZv57qNa75gshSgn4Y2Ne9LLGAZ1
X-Received: by 2002:a05:6402:c548:20b0:6b4:18f4:94a0 with SMTP id
 4fb4d7f45d1cf-6b4b0e81e36mr9727a12.1.1793210252740; Wed, 28 Oct 2026 10:57:32
 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260827223755.143247-1-zide.chen@intel.com> <20260827223755.143247-10-zide.chen@intel.com>
In-Reply-To: <20260827223755.143247-10-zide.chen@intel.com>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 28 Oct 2026 10:57:20 -0700
X-Gm-Features: AclHuK_UZXIlonVDc0fZszRQciOeJw350hJpkRZR2SLL6hpILBmEJQYohIrIKt0
Message-ID: <CALMp9eSUcm3aygzDSn7qD_58AxZm6y1M58LOHXpLhcPV43L8Ow@mail.gmail.com>
Subject: Re: [PATCH v2 09/16] KVM: x86/pmu: Switch to bitmask-based KVM PMU capabilities
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
> Intel platforms support non-contiguous fixed counters via CPUID.0AH:ECX
> starting with PerfMon v5, and support non-contiguous GP counters
> through the Architectural PerfMon Extension (CPUID leaf 23H).
>
> struct x86_pmu_capability now exposes {,fixed_}cntr_mask64 bitmaps,
> which may contain sparse bits representing non-contiguous counters.
> Switch KVM's kvm_host_pmu and kvm_pmu_cap consumers over to the new
> bitmask fields.
>
> CPUID.0AH:EAX[15:8] and CPUID.0AH:EDX[4:0] enumerate only contiguous
> counters. Derive these values from kvm_pmu_cap.{,fixed_}cntr_mask64 as
> the number of consecutive counters starting at index 0.
>
> Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
> Co-developed-by: Zide Chen <zide.chen@intel.com>
> Signed-off-by: Zide Chen <zide.chen@intel.com>
> ---
[ ... ]
> @@ -772,7 +773,8 @@ static void svm_recalc_pmu_msr_intercepts(struct kvm_=
vcpu *vcpu)
>                 svm_set_intercept_for_msr(vcpu, MSR_F15H_PERF_CTR + 2 * i=
,
>                                           MSR_TYPE_RW, intercept);
>
> -       for ( ; i < kvm_pmu_cap.num_counters_gp; i++)
> +       host_only_gp_mask =3D kvm_pmu_cap.cntr_mask64 & ~gp_mask;

Should kvm_pmu_cap.cntr_mask64 be kvm_host_pmu.cntr_mask64, as it is
on the VMX side?

[ ... ]

> @@ -556,7 +557,7 @@ static void intel_pmu_refresh(struct kvm_vcpu *vcpu)
>          */
>         nr_gp_counters =3D min_t(int, eax.split.num_counters, X86_PMC_IDX=
_MAX - 1);
>         pmu->pmc_exists64 =3D (BIT_ULL(nr_gp_counters) - 1) &
> -                           (BIT_ULL(kvm_pmu_cap.num_counters_gp) - 1);
> +                           kvm_pmu_cap.cntr_mask64;

CPUID.0AH:EAX[15:8] (eax.split.num_counters) can only enumerate contiguous
GP counters 0 .. nr_gp_counters - 1. If kvm_pmu_cap.cntr_mask64 ever had a
hole below nr_gp_counters (when leaf 0x23 isn't exposed to the guest to
advertise a sparse mask), masking (BIT_ULL(nr_gp_counters) - 1) with
kvm_pmu_cap.cntr_mask64 would silently punch a hole in the guest's GP
counters even though guest CPUID.0AH:EAX[15:8] told the guest that all
counters 0 .. nr_gp_counters - 1 exist. Should nr_gp_counters be clamped to
find_first_zero_bit(kvm_pmu_cap.cntr_mask, KVM_MAX_NR_GP_COUNTERS) until
leaf 0x23 is supported?
