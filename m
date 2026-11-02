Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793662659;
	b=UgfddwIYQHYuh8qlPqaxieSKv4fdgnsRaDOkFNl0d2hIMC5tDSFi+hzNFfuiVRv+KI08
	 jyiL73EMx6FvBUm6NgzDFYWScMClnAiJY2XRWTSDTF/SIhP6UB8rP1JePJXfWzgld/qFO
	 BnmVU+LoGeJ9uf73sm9AEPSkg4xFPxuSN4m4gZODjIfoGtz8rtcPG0rR7K8gTl8M8oxPt
	 4YPW9o80buhaSOIRaMptY/oKFSwiPkPlgE7qMoizrBRliETZbE96913GmofAqN1OcuR3p
	 g7NFiM54FawkHAkUdIHw2K4PM+WAoAjsq3+myHAgu57ZOVMph1hGC72xnJKkW6JFr9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793662659;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=oBbOwdv7HQAsh6m0z82QEjFn2nZEMVYTw6CIehV5US8=;
	b=EXq5I+ZNZ+XfcGRHohkpHO0JnT4WIhBpp0oVIjgzhDwtTf+ZmSql5BdaT6lC+o1vbbko
	 qUJyTi+JZEBVc22b6LmQM9aM9xe4oDKdKF+iiJJ0oJLJYFEJP6KeF6R0DBTgzz5XZlsA8
	 d/x+YEr9RVYrBRYct6GJZpH3vDusJECl57K4ptQAS9NWI9oxl4ttqhe1cnM/1+ia94DA1
	 Ab2YtOKy/KqHDCZRoZkRJAVDLWfpyntojKgArOKI8MJMRGu3n0VU2Bp6SmJm4zUjPaxA/
	 gd4Q+IFT5AzaFFOk/9/guY+PeKkdDjGhYpIIgecVkCgQlCrJQv8Hha+OlqDnRiu6Mpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mk1Cjqsd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785ED606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 23:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mk1Cjqsd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 242A61F00A23
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 23:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793662659;
	bh=oBbOwdv7HQAsh6m0z82QEjFn2nZEMVYTw6CIehV5US8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Mk1CjqsdB5MHIBfkvJAnrnLbWPw1mcXNGh18LyKHVNCWARR2ZuM9QifSTS2FL2M1K
	 3gOx+MDAblO6LMyrMmCD5SMsyZ9184ru/m56WKcOC0U+3D4UeMIWSYR/2fPiUCKb2C
	 Y1wbc3nQ84HFQwA1cAHAzKu+cqnr9NoTo1eHzEMMIQVIRdDwq7UoiX9L1uGqDLeErG
	 oP71RYNGLLTe9Xb1uqsf0ZaacqIH3kROq0mfyieMBkylFpQe7qkxVq7FHr4U3l/GxM
	 7PxiRRJwQU4IZXc7QtjhRCdDIDiYv5IEv4PN/ABemcOgVz12UEaxL6U2Mpx1TCo+TM
	 Jw8+NqsxKTayA==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c423b145922so492820366b.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 15:37:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBysogg0mj1tgLyCljtVWQ9ADkHkb9IPC7XK5FhOf9SrYIaOari2/jQ/6LUWWVui4qFZyQmQACjgyQKhL/4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+O/FyKHjoAmTD/uA/vovGxVox9CZPMEl+5DlpQ8LnRyKxaFjJr
	SjbpbHwEidJveF1/yw5PPnc9UDJwp1qPh5LO2OZL+a/AVcUZPkYscR1hKGPThehyY6fo9N2+3IL
	B1e2l2aZEqtra2FzzCan/mzJgK4rWtBQ=
X-Received: by 2002:a17:906:ef0b:b0:c25:91bc:ff55 with SMTP id
 a640c23a62f3a-c4ca7a878bamr1000724766b.23.1793662658028; Mon, 02 Nov 2026
 15:37:38 -0800 (PST)
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
 <CAO9r8zMxQnRLKGrW69rX7703AatWMp6KOXMObL9baHRPs4dW8A@mail.gmail.com>
 <6c9a13c9-e6c1-4540-a8ca-1f0e800f3571@intel.com> <CAO9r8zOWzr61pkkF01AvEp+YSOo6bA1N=L91RYiM=ETtK5+D9w@mail.gmail.com>
 <69c428d7-239a-485e-9494-32b8aa82da05@intel.com> <CALMp9eRsR8xaUmQyVu5QmYx1cZ2qFGGk+31bMymhmN9_iaPuMg@mail.gmail.com>
 <f7213eba-5b61-4514-a315-bce64823fad5@intel.com> <CAO9r8zM4eWD538L3osqSVoB0VHnjgRREtv2k419a1Vvuq+Q9rw@mail.gmail.com>
 <6d84ab57-a702-4ac0-9e29-579449b3d826@intel.com>
In-Reply-To: <6d84ab57-a702-4ac0-9e29-579449b3d826@intel.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Mon, 2 Nov 2026 15:37:26 -0800
X-Gmail-Original-Message-ID: <CAO9r8zMvkGzxUR7jBPVFWK+Fry4wk49J3WdwFqa22bSgGaS4YQ@mail.gmail.com>
X-Gm-Features: AclHuK_Ks2MMA5FQP6XHgCe9LxJ4b9bkprLfwSiy6MqT83PaLeo4sR9HyA3cRUY
Message-ID: <CAO9r8zMvkGzxUR7jBPVFWK+Fry4wk49J3WdwFqa22bSgGaS4YQ@mail.gmail.com>
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

> >> diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
> >> index 38c7a4fa1007..3849b3f5234a 100644
> >> --- a/arch/x86/kvm/pmu.c
> >> +++ b/arch/x86/kvm/pmu.c
> >> @@ -862,6 +862,8 @@ int kvm_pmu_get_msr(struct kvm_vcpu *vcpu, struct
> >> msr_data *msr_info)
> >>         switch (msr) {
> >>         case MSR_CORE_PERF_GLOBAL_STATUS:
> >>         case MSR_AMD64_PERF_CNTR_GLOBAL_STATUS:
> >> +               if (msr_info->host_initiated)
> >> +                       pmu->global_status &= ~pmu->global_status_rsvd;
> >>
> >> The underlying issue still requires proper mutual exclusion between
> >> Intel PT and mediated vPMU, which I think can be addressed separately.
> >
> > Or maybe handle the host PT while the guest is running? Not sure if
> > that would be correct.
>
> Since KVM switches APIC LVTPC in guest context, it seems difficult to
> correctly handle host PT PMIs while the guest is running.

One hacky way to do it is to make perf_guest_handle_mediated_pmi()
handle host PT before calling into KVM. This doesn't completely stop
the guest from seeing the bit tho. Also, I think we may have no way of
finding out if we still need to inject a PMI into the guest for a
different reason or not :/

>
> I guess Intel PT virtualization could be re-enabled sooner or later, and
> addressing the exclusion issue would be a must at that point anyway.
