Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793311602;
	b=OujAcXBnnKjhkUTUddUmxkrLriSLywIij7HjLUKrnJU5wWXl9Er1De+WYqOci6VplCUg
	 8c6fwzKDaXUz63mLHZGxPEYhNEaSJP8+oE5c95o5Iz/4Gm5GwI6P/fwYllnW8SHP0qDho
	 20yGz09JV1BXrl+ZQ+M/GA6KpAczVxWAVTaUodY7KY91fOC0Ve9KWDyXZ3plemdEKP2hA
	 Q0eDgSiI81BnXDXuZDGhTZoBAnG3rAsV0lMY44QsTtXCH3N2UpMpk0DEthIfK2VFmMRW0
	 IAJZwutzub6/20O8tMmBxIn+Vy+Be72g9Xzqatg+QmJ4bKWzhC9Y4b28EZnmeuNdKyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793311602;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=vfDsYkb1rupmnaoE26fc2eH1wSISvhn3BAdlNxMy260=;
	b=RUu8EJwYFtRUj6iMmahqTutMghlpz1G8XX4arWg07CiZ2xo7vB96fXjZxWi3284KJMqk
	 Hp2M9KodVv/El03RpDrYfcqPhdYadvYf+MWZE/txhzVpXK7nnhlsQh/UD2TkVZpU4q/nA
	 QNsl+cA+fS1Zl+/C8Vl5zv7/TcVXvP5Mmx8YOgRXkGvDp/wpRI5n3f517VWbPM7FMMn+n
	 fvzd/x+wpZ+gJTPj9ysM7L9MnMCU/8MeUY23KJ3msAv9vl1/wUQjqyc38JqK/MAMXkaQo
	 EWQuARS4AYnn7PAxVeXl3dMDPNPLizfTTJpeQe0vgcPjBvC5PaAxyEdRpa3Fv9lRe4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Id73sxy8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25083606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 22:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Id73sxy8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF5081F031E6
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 22:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793311601;
	bh=vfDsYkb1rupmnaoE26fc2eH1wSISvhn3BAdlNxMy260=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Id73sxy8FQws9662a48X3WJ155EdYs1sKdjseAOifu6aMxceu2kV2X/E/kL8uFrse
	 rYsgZ1rH7wOdQn/P8N2Zes1J9QuPu5Jhp0WjItFxuzXWggT/+N5uW2s59px19vleYO
	 TxFWIHTLp4nh69tjwjNg2Jy2GwXin52E78x9KIa102a3TiHjPhkqPm5xiHlcqOmaoo
	 fpuV/LW+kvWM+wg3ORlZefZJ/ym5zIZ9L76th4F1uPN9HrB7RbAFYf0ChXGdMRRp4K
	 +9vLgYBWPi3ciskd221/ooktYgyVZaI0kcA9WWSztkiHu8Sti08O695BRPYVpIIFTA
	 o5C5Oa3egNKeQ==
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4322d310e7so3964266b.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:06:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw5epsUpfKGvQMZIrNbEFw8pe5r90PuKbxzvLZYxBbTLQ1OFVoRIDiza8Mna/sBrdSdMaf56f94LSJdykY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKWEwwCxAduIOAkzVS7cpw8nJy9A7iNYZPyoVGeXKh2IHooOSAN
	NFL/TtKA67aK8suH6Ca+lGmuem3aUrNVIyY+Y6lF0LbtXAl20aNCn2QjXlNyZk7XYDcMo6UsyxG
	EWOPHxh6c5mEnrOUDRMTuVTbKqX8IldM=
X-Received: by 2002:a17:906:c109:b0:c46:9ba4:872f with SMTP id
 a640c23a62f3a-c4ca7acbaf8mr32137666b.36.1793311600609; Thu, 29 Oct 2026
 15:06:40 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260918193937.569414-1-zide.chen@intel.com> <20260918193937.569414-6-zide.chen@intel.com>
In-Reply-To: <20260918193937.569414-6-zide.chen@intel.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Thu, 29 Oct 2026 15:06:28 -0700
X-Gmail-Original-Message-ID: <CAO9r8zOY8W6s5U8O_tZ3dERA4h+mnWWjeS2GDgF=gbo+CQDNLg@mail.gmail.com>
X-Gm-Features: AclHuK_h6YwuBizUsxN-GdymIVz4fJ18vw0iMYEWjNc1ZjkVmTudt-64at2AUZE
Message-ID: <CAO9r8zOY8W6s5U8O_tZ3dERA4h+mnWWjeS2GDgF=gbo+CQDNLg@mail.gmail.com>
Subject: Re: [PATCH v9 05/12] KVM: x86/pmu: Support PERF_METRICS MSR in
 mediated vPMU
To: Zide Chen <zide.chen@intel.com>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, kvm@vger.kernel.org, 
	Jim Mattson <jmattson@google.com>, Andi Kleen <ak@linux.intel.com>, 
	Stephane Eranian <eranian@google.com>, linux-kernel@vger.kernel.org, 
	Mingwei Zhang <mizhang@google.com>, Das Sandipan <Sandipan.Das@amd.com>, 
	Shukla Manali <Manali.Shukla@amd.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	Xudong Hao <xudong.hao@intel.com>
Content-Type: text/plain; charset="UTF-8"

> diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
> index 448044a2b121..f4d3801b97bc 100644
> --- a/arch/x86/kvm/pmu.c
> +++ b/arch/x86/kvm/pmu.c
> @@ -806,9 +806,16 @@ static bool kvm_need_any_pmc_intercept(struct kvm_vcpu *vcpu)
>                pmu->nr_arch_fixed_counters != kvm_host_pmu.num_counters_fixed;
>  }
>
> +static bool kvm_need_perf_metrics_intercept(struct kvm_vcpu *vcpu)

The name is confusing, this doesn't control the intercept of
PERF_METRICS (and it wouldn't be correct to use it for that AFAICT).

> +{
> +       return (kvm_host.perf_capabilities & PERF_CAP_PERF_METRICS) &&
> +               !kvm_vcpu_has_perf_metrics(vcpu);
> +}
>
