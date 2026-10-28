Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793224813;
	b=XauWGYrCFPpddDz+MAg66CH2q1Xx/wB8X5uKBFS6/03hLMuO4f+hELGmTcpiXIJzkP6x
	 djOeT3jvWAU3eN1hMRRTl6UTWvgEyQeKkLBOXd68ffznuWY1zj8OdoxsVnqKqhmqg33mI
	 sikWDN1wLhHQMGeE4T0IXK4OnSx4NjtlCF4yvDa9u+2dLZ4Z5WJqW5S0GGQozyl5VYle9
	 XcMlT+HeOf4RspGEW2s7ZMwERFk6L3JGQ0wncZo8y9lz7lN9P3eADNENo3qJe3W9naMLb
	 lZU1R2Vo1fgO706/rEcGHjPK22+e7ceAzMz7jWc6PdrnARIplKk68lzLWXJkKqkDgHQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793224813;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Zd8GwumqtnoBvLyA8njp+tA2dovdp6CzXPw6aKHUqHA=;
	b=v1THHRqVw8yG1ORSNv9e5BCOWwRfaV+Zbhxim2CzdVK3HoLvJ3h7I77qvYXSDkzUDC+s
	 boH17pgCOCTcTp2QIWA+VJHZ0LYiFPdCgIpqS2Xxa1PBD7e9mi9Nz6vPVv1ZaLfg7P/w2
	 LddmXu5HE5Y1rLb8fXJPMBWMdy1WhXAN46rrbVcCGGLny19k2Pi2hrqZn2X6cH0sdh9nz
	 8mVf2cLV0Y+R2U6lvzQB8oSKtcEuTAu0Rt1jh1Z2gDXG4CHUqN9avW9n94kO+eoXvPXs8
	 flZResXb/AbRbMAak0FgZJs1Dq8mcuBnjxcoG7WKUtFcTYGfI0j2P+D78DR2kzN9S2A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cGEijWkU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD14606A322
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 22:00:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AD14606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cGEijWkU
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6ae14cdc63aso1909a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:00:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793224811; cv=none;
        d=google.com; s=arc-20260327;
        b=l5dAqtd1LL1/D3le9VsROAj8PlVyA3yMSZW8qPdsJSo/QK1/WuR1eLMeibfbqyVF2n
         NB3mAWkFXK61IbnWPEanmj8B7WwT5YoE93LrytUcXIBPzDKtsbUSWAShxk40X/+kXFSA
         5o51TgTntA2BdQc98c7dO4L1VEaMI2kski2NlZ+8pAlK9pRXMEZsANVVHKNGOHVDJiBF
         WIgIBAZoNVpmbgurwW/WlurqUaq9NklyRg16i+7hAXqM8VvpMsj+qdjxzaq4LospslOt
         U0dF7nLVgxbKS3Z32Uitopb5oRmJyHdCXL7s5N3Un79/0C5D0WTmTcYGBI7ZLCzAyWzM
         P5CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Zd8GwumqtnoBvLyA8njp+tA2dovdp6CzXPw6aKHUqHA=;
        fh=fOk8gBADCFKFtAoNzlU2ddDr0cIl8U7sX6WVWKqExqc=;
        b=SfqVFFmh2pq0pY6j683g9yTfbpYdhYyPLMA5NLRXffuEp8X8MAr9ctBJ+7imlIsh7M
         PnVTeOpU2yWKO9HwArKSQ2FLsZbE13+KbnIj2V+jlIXf9qj7XLDUEYbT5zob78Dj8st0
         Q2g2Y1WzLi/k4SBa/rDWBB1VOw3GSEmbrCF7+bcmyltcQKcElFTfk9tXZIUSmHaPq+Qt
         hk6W4IdctAfxDZxWSU/3xdpnm6P8UHavpQ18xEkhwVQNlk0p/wSMPRNx+nuNmtosmtcj
         h32G+3a0wmaNa45An6P4L0Ohel/Q/0JtskJmz+5Kyxyw3BSaeRQJp7LvK+AvgKEYgZG/
         zccg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793224811; x=1793829611; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zd8GwumqtnoBvLyA8njp+tA2dovdp6CzXPw6aKHUqHA=;
        b=cGEijWkU8d3u8I4DeLf0OBEZHdOnUTbvXgTJBs//K8zjj+wvyhhgmGzt7LB2uVNPdJ
         5BzzTvSqi32PdWYa6Vs3BJWESnVJE/reximmLDqIKfJ++ei3SoZic7Sxul71ogeGk2Ik
         FA6bDsgpHzeOM6kHBPcyZm/Rrb304oDDQPWLmk87ktaOQ9ULxCRwKtgz1stEVsWeRXx0
         E1wDXiwfLSCyglmOkLq5FyjiEiRbHLmbd1bnHnsycOq3GGg3BtJD2mbTd4V8pjy8pG1y
         ZuR38i+9mNdIApE7ph2XUpnShAmIY6ZmkTgjmB+0XN9+PqYNNYpGmbK9r9q+BFcYkdDZ
         WUWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793224811; x=1793829611;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zd8GwumqtnoBvLyA8njp+tA2dovdp6CzXPw6aKHUqHA=;
        b=GHX+gxPk3JJX0zLGSYPpqOQfQnwHH+xW4J42k9oa36BYFIIX5qYC4anlUg1lzVtG+J
         9W7WUJTe/GHYS2a5/BIWKgju1FNl/4kh1+aUvJUpn7opK/pjwk1VGjRUUK5D/8pzKn0F
         N3tqUfZ91D1hXoBRhekPB1wbGQpuKdB4I9mw3GqrlYFdqNMrWAsZxQAvDazVNLCH8uod
         mXTAdu50m45eZlE7JB3c2E/ijkSixeH+KAI08Ea+5tG7V54f8KkKRB0GzIx3j84xosxK
         /U5sx/4vb1UI8vyqI5pDGWSRxmb6813WVPpY3lT4C6S0m9axx0fzwf/qIcGKyDqJ3kZ5
         vLuA==
X-Forwarded-Encrypted: i=1; AKwUvBySn19dIKfDXk50R6/fJ6BjtUjURqSeh5yiYG4giBXEmZxivoGjuqaBUpIysbkm9loZu79/tS2zrJ3YiVQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIl+q010zO8bCiHmpPxwimmsoUiAMj3Q85Sw5e5vhS0kj9GlhFI
	IOWiHx/WmlxhqceXtnesrW8nts3pj0e8NuoNEr1A2jYTD0qPLj3YIR8EHt5ddA92GXFngtFjkxg
	b3rGlSN9MMJfB4A8ga5q4kxxpEVzevjDFlWdYiQ7/
X-Gm-Gg: AYBFou3+qt1eQCle172zdW1ySvscqu8NdxTd9rgIiKeOolvV+vM5BHjQXwTKQComejA
	gKbPhTfzRYv+ORLkfjuckXC+EYvjm7ylZw0eg65zWh0KdWoNUHqDKLU9u6D1rrX9zjP3FjWG6Pe
	aCXTM9oF2wsTRy7RWQKhmObINsSAx3XIJyNt5QzQwWkwju1zcYdFudw5l+MiQaQpiEIHEXqXDgW
	WMcTltT48JSc6BkxhCh50HfnpWz1YJK49u9PfBXhFoacyAWpem78j3DfTEadaJFJzDdL8Sh7e+r
	rWCBZKdCahjZEV8ZVxabK2yOdo+WmlABZswY60kobsHsCMtwJBtSPWFI9Hq4d6gEmvb1QN7DsAR
	bOc8O6VuIgRNSl4noj3Q6lJz8VK77JjRS4hY3
X-Received: by 2002:a05:6402:460e:20b0:6a6:7385:3eac with SMTP id
 4fb4d7f45d1cf-6b4b3dcbc10mr10028a12.11.1793224810422; Wed, 28 Oct 2026
 15:00:10 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260827223755.143247-1-zide.chen@intel.com> <20260827223755.143247-16-zide.chen@intel.com>
In-Reply-To: <20260827223755.143247-16-zide.chen@intel.com>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 28 Oct 2026 14:59:58 -0700
X-Gm-Features: AclHuK8PnD4hDj7w7FAway9rxYKulg8rm0HEMNYmqHvDAoVs2zXnBvFZD5wfoD8
Message-ID: <CALMp9eSvh5+PqSXVQAAMoWwvZiMCVEooxuVd-e-sM8mODoLb9A@mail.gmail.com>
Subject: Re: [PATCH v2 15/16] KVM: x86/pmu: Advertise PerfMon version 5 on
 Intel hosts
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
> KVM currently caps the guest PerfMon version at 2 for all Intel
> platforms. Now that KVM emulates the basic architectural PMU features
> introduced in PerfMon versions 3 through 5, raise the guest PerfMon
> version to 5. Features that require additional emulation support, e.g.
> architectural LBR will be enabled separately.
>
> PerfMon versions 3 and 4 continue to be exposed as version 2 because
> KVM cannot safely virtualize AnyThread due to cross-VM information
> leakage. PerfMon v5 is supported because it provides the
> AnyThread-deprecated capability, allowing KVM to indicate that
> AnyThread is deprecated.
>
> When enable_mediated_pmu is disabled or in the non-Intel paths, KVM
> retains the existing cap of version 2.
>
> Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
> Signed-off-by: Zide Chen <zide.chen@intel.com>
> ---
> v2:
> - Cap vPMU v3/v4 to v2, as AnyThread cannot be safely virtualized.
>   (Sashiko)
> ---
>  arch/x86/kvm/pmu.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
> index 4cb7c796daac..1a7be7d73b62 100644
> --- a/arch/x86/kvm/pmu.c
> +++ b/arch/x86/kvm/pmu.c
> @@ -175,7 +175,21 @@ void kvm_init_pmu_capability(struct kvm_pmu_ops *pmu=
_ops)
>         }
>
>         memcpy(&kvm_pmu_cap, &kvm_host_pmu, sizeof(kvm_host_pmu));
> -       kvm_pmu_cap.version =3D min(kvm_pmu_cap.version, 2);
> +
> +       if (is_intel && enable_mediated_pmu) {
> +               kvm_pmu_cap.version =3D min(kvm_pmu_cap.version, 5);
> +
> +               /*
> +                * PMU v3/v4 has AnyThread support, which KVM cannot safe=
ly
> +                * virtualize. Expose PMU v2 instead of advertising a par=
tially
> +                * functional PMU v3/v4 to guests.
> +                */
> +               if (kvm_pmu_cap.version =3D=3D 3 || kvm_pmu_cap.version =
=3D=3D 4)
> +                       kvm_pmu_cap.version =3D 2;

Nit: on Intel, enable_mediated_pmu already requires host_pmu->version >=3D =
4
(see intel_is_mediated_pmu_supported()), so kvm_pmu_cap.version =3D=3D 3 is
impossible when (is_intel && enable_mediated_pmu) is true. Hence, I think t=
his
can be simplified to:

        if (is_intel && enable_mediated_pmu && kvm_pmu_cap.version >=3D 5)
                kvm_pmu_cap.version =3D 5;
        else
                kvm_pmu_cap.version =3D min(kvm_pmu_cap.version, 2);
