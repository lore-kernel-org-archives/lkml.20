Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793316767;
	b=lPBuN91LV7/CrPhIyyRRHdklttoOh5d/IWwx7hJK7EnfYgB1jkxzWpVFBty4+wGoZJYP
	 SLNlYEgxWASwEs7pOBVIc004TquDLkNvNL5Uva59TXMQ4h3t1/qMwdE9VWyfigerc+p9Y
	 HDtx9yxbpNCsSU0rBCX/JKtGtyL34mMnn6zKKkU2HNaRQckgh+k/OOL+M+iz0dV+hBdyh
	 /7Or+0oVXsQ0ixnx9+q2Dvec9nvK3a26LYA/Wvln55l9osKi88Z2q6zG3mHMG1QJ/Dk/G
	 P+x2yeov/MNBioYQAeJoORBZ0bzGKLlLxZSzMkby+oKSrTE1DhkCRefQYatVOPW9c1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793316767;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=WQ+R1Wi6/OkFtKp/Hx8pPIEYSzqwbjd3PW+lXZaX1Uc=;
	b=hd6iBpLMNwx5yPWJrrlBA3yTUGjinqeu8zcEC4mNn5o84uIaEnVk/5hSBasroROzpAeV
	 XGWF7pTygl+5bofbXkzExifv2obPE9j9W96clQyTA9Ce+UqhgoZPSOgpOrgHvZpkAzAhr
	 CWdHEeIyy8dR6SqF9elBREnAlVrGfk0MSSNtTsTtf4KxLjc27MQTBCrIg85XJ3zMB+h4n
	 vAsNROZKmvw/ynR2uUCAqw3Kodvr2XKmfqhKogJLwSwLmrLRj92KOiG8jzq12FkTlF9tK
	 BZ4zXcY1TI1vLnvo9c+UHBjtwqNQD19mV8DwgCS0IhRo2oy1kzQ/QogJKqj8DaMrnSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aJF2NBSf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B1560A261C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 23:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aJF2NBSf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0CC61F00A16
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 23:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793316766;
	bh=WQ+R1Wi6/OkFtKp/Hx8pPIEYSzqwbjd3PW+lXZaX1Uc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=aJF2NBSfxF8pcWoOL5/L9kWpf9XVTEXDugwJXfNidUxaXuEIOTBIclc4OrZeBoe47
	 YyPgWp7qGR2aKCbM0vmQaAEFVHYtLZDB6ZH8PaaHKjpTE+qSs+uHZ2lfQ97eLx4/Lu
	 siapPMGdX/QK1xuEigRbf8dDgZAT9wQRHgYWs8yoakKpmXNJkqgJ1PWyoqsXCqbxgh
	 tG4onBrMC1TveojI3Sa/oJAM1epEWw6xMPuBvAiw93dXFnxt/+fffnVojEvo+8C8zs
	 juKcZD9H/d/mCFJljQ6rqyX5St/2qKfi2MspcjU+4ckiJKFNQb/zFwN02lqvB+E9vg
	 1XjUVE99DCBbg==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b1f31c63ebso2104479a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:32:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzuHl2WMfgreGDioAa2koCkU7rwm4nUJ0c4XmGMDZYdczxQn92Q/+zPvtdev1JA7jRbcokfy/a95yVs3e4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJAO9XPwWo6CNuXbvQ3qQFLSE5zgmcHD8Ea8KrXT3uPq9yu7e1U
	JsehgPq1G/PLUjLp/90TIEzeUif1v7OgUZC61kG1pw7Y5hGk55hijRgaa5A8CnEC5HEo02OPk1P
	UUFltZHxKqylw/qLbzawPAm71hOdV+OA=
X-Received: by 2002:a17:907:3faa:b0:c2a:ac35:95fb with SMTP id
 a640c23a62f3a-c49d143133dmr362183566b.24.1793316765640; Thu, 29 Oct 2026
 16:32:45 -0700 (PDT)
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
 <CAO9r8zOY8W6s5U8O_tZ3dERA4h+mnWWjeS2GDgF=gbo+CQDNLg@mail.gmail.com>
 <e5e719ec-7012-413c-a446-86fd35aca33d@intel.com> <CAO9r8zOLCBhWZ5P1BEU24p8++3jVLTPSOdNreBk3RUC10Z79TQ@mail.gmail.com>
 <CALMp9eTOvhiLw7L--DQp_0QaFS=O1TaCQ3q0jPh=70273DA+=w@mail.gmail.com>
In-Reply-To: <CALMp9eTOvhiLw7L--DQp_0QaFS=O1TaCQ3q0jPh=70273DA+=w@mail.gmail.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Thu, 29 Oct 2026 16:32:34 -0700
X-Gmail-Original-Message-ID: <CAO9r8zM0rTuROCTYdMQhdghDcbYBhfK=ezU_wU2GeM_w7FBPDw@mail.gmail.com>
X-Gm-Features: AclHuK_CqRlcCxOt3bEGnIs9tv1L0BiKuCxmnqMGOdWdJV47rykw9eUii-wSjC4
Message-ID: <CAO9r8zM0rTuROCTYdMQhdghDcbYBhfK=ezU_wU2GeM_w7FBPDw@mail.gmail.com>
Subject: Re: [PATCH v9 05/12] KVM: x86/pmu: Support PERF_METRICS MSR in
 mediated vPMU
To: Jim Mattson <jmattson@google.com>
Cc: "Chen, Zide" <zide.chen@intel.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Peter Zijlstra <peterz@infradead.org>, kvm@vger.kernel.org, 
	Andi Kleen <ak@linux.intel.com>, Stephane Eranian <eranian@google.com>, linux-kernel@vger.kernel.org, 
	Mingwei Zhang <mizhang@google.com>, Das Sandipan <Sandipan.Das@amd.com>, 
	Shukla Manali <Manali.Shukla@amd.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	Xudong Hao <xudong.hao@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 4:26=E2=80=AFPM Jim Mattson <jmattson@google.com> w=
rote:
>
> On Thu, Oct 29, 2026 at 4:19=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wr=
ote:
> >
> > On Thu, Oct 29, 2026 at 4:17=E2=80=AFPM Chen, Zide <zide.chen@intel.com=
> wrote:
> > >
> > >
> > >
> > > On 10/29/2026 5:06 PM, Yosry Ahmed wrote:
> > > >> diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
> > > >> index 448044a2b121..f4d3801b97bc 100644
> > > >> --- a/arch/x86/kvm/pmu.c
> > > >> +++ b/arch/x86/kvm/pmu.c
> > > >> @@ -806,9 +806,16 @@ static bool kvm_need_any_pmc_intercept(struct=
 kvm_vcpu *vcpu)
> > > >>                pmu->nr_arch_fixed_counters !=3D kvm_host_pmu.num_c=
ounters_fixed;
> > > >>  }
> > > >>
> > > >> +static bool kvm_need_perf_metrics_intercept(struct kvm_vcpu *vcpu=
)
> > > >
> > > > The name is confusing, this doesn't control the intercept of
> > > > PERF_METRICS (and it wouldn't be correct to use it for that AFAICT)=
.
> > >
> > > Right, these two APIs do not directly determine whether the mentioned
> > > resources need interception:
> > >
> > > kvm_need_any_pmc_intercept()
> > > kvm_need_perf_metrics_intercept()
> >
> > Jim suggested folding kvm_need_perf_metrics_intercept() into
> > kvm_need_any_pmc_intercept(). The name of kvm_need_any_pmc_intercept()
> > might be confusing as well, but at least it's one less interface to
> > worry about?
> >
> > >
> > > This is different from kvm_need_perf_global_ctrl_intercept() and
> > > kvm_need_rdpmc_intercept().
> > >
> > > How about change them to something like these?
> > >
> > > kvm_pmu_has_unexposed_pmcs()
> > > kvm_pmu_has_unexposed_perf_metrics()
> > >
> > > Or merge them into one single API? kvm_pmu_has_unexposed_resources()
> >
> > I don't like this name any better, but I don't have better
> > suggestions. Since we already have kvm_need_any_pmc_intercept(), let's
> > just use it for now?
>
> How about kvm_pmu_incomplete_passthrough()?

Better than kvm_need_any_pmc_intercept() imo.
