Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793315977;
	b=zW94DdsyusXwWiYv5LuJfpk1q1L3CXU/9OS9TAt8P8fHi7tPXcTbPbV5IsUqCSXRXmRH
	 2tyhrzDIBQrDHXxXK2HaEIE3CMbsNtOMbc//F6TjETo/OlNc7WEfC7tznt+U0ONzrsc8b
	 X5DunTTgHcVWfGWby8604cjltpgImOZLiyBrZB0Q1+ifiqFm/TpWfM8A83z+N96p6lGPQ
	 wZeYKtQkp4wVpG/XrkxMXzpu6tccwkhbMD6D8ZPP735Q74cYsDA5Txm9tSRgCePk1Ag2r
	 Cz8RZC7Kp5QJLriET91ZIWdpW3p9dtJku/Z0ipeDbBRCoO/tyOfLmmX0F9XWVPhHakw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793315977;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4o4yx6uKrIgl2Ge60xAHsUJZAj2BU5ETNvNPMJDaFcU=;
	b=1mvWHH8btlNmVnIPMlDc2TIxaQlWe4kFU8unxS24JpsOXdMZdmlsSZ2uMsQAO2RlupDe
	 XfBtbFTBwbW8Jg6V5sZqGJmrtB8foB+hZH4HLoCTWHDEvfIha8XsxZLcMj1uGYBU1ptD4
	 BewLXq79U1PVQz0PTSG/1W6Hf6K18Bz90kOxssP4oRwZQboOqIrhN2xQ7BEzLDrCTdNud
	 iRbU0cLDUI9MwnOvqO2SV9fQa3yE9CI4zBkGEYwRRYcBzx31Alh6pobJHI1bbUuHc2ZdO
	 XAMJOrNACfXNgBfetu5p48OMLiZdJy1EdJ8KOZwGXXO1KxcDHroOgPXox1ez7S3oLbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NcwpuPC2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE69606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 23:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NcwpuPC2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CDAA1F01825
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 23:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793315976;
	bh=4o4yx6uKrIgl2Ge60xAHsUJZAj2BU5ETNvNPMJDaFcU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=NcwpuPC2Op2XiOCN3CxK7du7I1HYVo0DRcXSENw650aCofdptif3ICtsFm/lu7spv
	 NHps+vRbV2EovrEu9aVivxBaNGreLvER/7qObQYGph2Zg6odAVAENlj8+ICNZRNKt5
	 OiXnxb7VoK6WQQRxY5WINR639bshwUbA0h8spf2O1DKafJbIIaoImrSP2vnYA1fcMr
	 wwkzj7rhVYy+8tgD5vqQCZEayIe2CKzCL8g1X2NoNihoVxzUL+jklcUDVeYVgk4haM
	 KnOTuzoidjraKymlIrs2k6jLvrJfqy45hC8gElIP0j3AtL2im2ghSAVxnHfSxTGmSW
	 IDOp3MrhRCd1Q==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c43373ae89aso9302466b.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:19:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwAcY+eR8wldIPzI87s5J/bKPkLOfw5AYS4Bzag+nx3SjkgwsTWPeJsNO7odYOwdUvUfEgXc7QN/BFWNiE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIysvHMcnDCAVZ1H29J1Yco7Kya/AY41K7smkPxtKXUzcC6JvAk
	WnZg4C6/RN5rbKL1gOdiu1RuFb0vF9OkSegzabb4VWvoUgSwAvX/cck2ABc9vM0tYi0YDK52taZ
	zD9lOnAqAaMmDjPGmzEfD5zmJoFe77/Y=
X-Received: by 2002:a17:907:96a1:b0:c45:d8aa:6ae5 with SMTP id
 a640c23a62f3a-c4ca7b605e4mr47008066b.42.1793315975074; Thu, 29 Oct 2026
 16:19:35 -0700 (PDT)
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
 <CAO9r8zOY8W6s5U8O_tZ3dERA4h+mnWWjeS2GDgF=gbo+CQDNLg@mail.gmail.com> <e5e719ec-7012-413c-a446-86fd35aca33d@intel.com>
In-Reply-To: <e5e719ec-7012-413c-a446-86fd35aca33d@intel.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Thu, 29 Oct 2026 16:19:23 -0700
X-Gmail-Original-Message-ID: <CAO9r8zOLCBhWZ5P1BEU24p8++3jVLTPSOdNreBk3RUC10Z79TQ@mail.gmail.com>
X-Gm-Features: AclHuK-HIDxM5PvTgWzHqGOjwQ4_GIVyrAYkUpF_p4ww4kQ0W2ZOlnH7mE27Ag0
Message-ID: <CAO9r8zOLCBhWZ5P1BEU24p8++3jVLTPSOdNreBk3RUC10Z79TQ@mail.gmail.com>
Subject: Re: [PATCH v9 05/12] KVM: x86/pmu: Support PERF_METRICS MSR in
 mediated vPMU
To: "Chen, Zide" <zide.chen@intel.com>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, kvm@vger.kernel.org, 
	Jim Mattson <jmattson@google.com>, Andi Kleen <ak@linux.intel.com>, 
	Stephane Eranian <eranian@google.com>, linux-kernel@vger.kernel.org, 
	Mingwei Zhang <mizhang@google.com>, Das Sandipan <Sandipan.Das@amd.com>, 
	Shukla Manali <Manali.Shukla@amd.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	Xudong Hao <xudong.hao@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 4:17=E2=80=AFPM Chen, Zide <zide.chen@intel.com> wr=
ote:
>
>
>
> On 10/29/2026 5:06 PM, Yosry Ahmed wrote:
> >> diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
> >> index 448044a2b121..f4d3801b97bc 100644
> >> --- a/arch/x86/kvm/pmu.c
> >> +++ b/arch/x86/kvm/pmu.c
> >> @@ -806,9 +806,16 @@ static bool kvm_need_any_pmc_intercept(struct kvm=
_vcpu *vcpu)
> >>                pmu->nr_arch_fixed_counters !=3D kvm_host_pmu.num_count=
ers_fixed;
> >>  }
> >>
> >> +static bool kvm_need_perf_metrics_intercept(struct kvm_vcpu *vcpu)
> >
> > The name is confusing, this doesn't control the intercept of
> > PERF_METRICS (and it wouldn't be correct to use it for that AFAICT).
>
> Right, these two APIs do not directly determine whether the mentioned
> resources need interception:
>
> kvm_need_any_pmc_intercept()
> kvm_need_perf_metrics_intercept()

Jim suggested folding kvm_need_perf_metrics_intercept() into
kvm_need_any_pmc_intercept(). The name of kvm_need_any_pmc_intercept()
might be confusing as well, but at least it's one less interface to
worry about?

>
> This is different from kvm_need_perf_global_ctrl_intercept() and
> kvm_need_rdpmc_intercept().
>
> How about change them to something like these?
>
> kvm_pmu_has_unexposed_pmcs()
> kvm_pmu_has_unexposed_perf_metrics()
>
> Or merge them into one single API? kvm_pmu_has_unexposed_resources()

I don't like this name any better, but I don't have better
suggestions. Since we already have kvm_need_any_pmc_intercept(), let's
just use it for now?
