Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794936204;
	b=sEOdELuUPO2wrMlLkStynR1ZKE9vjGqWq/OxUgv6ecndWYb74YiasAWzdGdvwaH9QVl0
	 hiP42Lo5OcVEt8Vi03d6z9WnbkQJ2sNqQ440M1BibR9g65ZAkxzb+KgCciNoiTlJ3lqUN
	 CNuGbPRLayUpTyjXZihkL/QDRvTgNeuWoA7ZEtxl2fOjDXE2uLWajInuU1WvCSoPEXxyk
	 Hvy0YLztKj1lsEq9odqIew7hBZwdvziIS8tf1N2qi8ZYvQwsFUz6xq2hPZ1YVpRTOtjDe
	 4lcm/0C4yZzp6iMFHSbYs4Mv1PpkHPBy5CGrwn8QWrAxCaNvOyZ03e90V74lhkTBLEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794936204;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=qPbuxogoqNwU/qyRYw+LGXjvF5P4V0NFNB4XBiaBpkA=;
	b=ePhDbGUgVCya8oJTLV4Dw+3jLVoTyvwgOEheJ1D2d4IqIwHpoobpkyiAd8W14czYBpEI
	 Xak7TorzVLM3Qlt6nyXzOgZbdCQTw/wE5Tcw6rnLSyU5h7Ljlz3W8uON2YnY9PODCbt6p
	 VDG+rUy4OnktZMPlUS37JORHu9Obr5hAXS2XuiZqYXN9Q27Wcgrxndsxv7e85VvQZANWN
	 aVSVnrz2mEGrDkIyokg2Yx7D54HfgJSMAtN5IwMfxYeNBZRFD8xOaaZ59A1VWmN65bkIJ
	 GXubRToIyrW/qRMxFshKGBPaPxdhml5AlIslnb3vg/tvKG/C8fTbrVdjfUdkm3oRlkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oPj6c6a0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FBE606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oPj6c6a0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF30A1F000C8
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794936204;
	bh=qPbuxogoqNwU/qyRYw+LGXjvF5P4V0NFNB4XBiaBpkA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=oPj6c6a0mIS9sdaEIQG36xIG1NhQ77AlC9xRI/0B3iw4C1VzrPoad7mLHqSYr0NQS
	 QjKmf+7wI7X9H2SfF8j9IptaYl6ExlXoX5J+epfggrerRPl3jadIPph3gPQd4Mikwm
	 ncG7jgPzELSQe0GbUG7860qCFsANtxIWH1fSj4cjCvETYHxIO44cbMsnM1+gLmpxxS
	 UP3qsWIJVyLAnhTiM470e0pq8lGtmbn7cCJvY5DpKeqQPhnccM+PRO0EkoKYuUd2MB
	 4VNdrZhDFIE/aP/8DqdnWPJ1iZ0SR4I+fVInBZes+O9xkCkNSgfCZaY6ztmKpNfHPT
	 oLTVrxnkZ/Ltw==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c468bd799ecso742879466b.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:23:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEFZ5dl4+wDSu2r1sMR3Sj105X7i6gpDFxg0DhkEaTQf0/WLJ24OSylTeensh6arcYIi3ATLTNlkHJqvww=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rWde61H5UAnR06LBHOk51gF/+ryBP9+akwf3nzjdcpi+T+PlR
	VQlH02Jc8rM4cxXek/s7Yd+oBPNMJJjs6LDQ+2VVAgl++fzWPYKRbNvKpNg5HW9XAkpJtxmEiUH
	YrCTa/cp9CwKbX/P2quolKJNLtCk1smk=
X-Received: by 2002:a17:907:d27:b0:c41:1e13:8891 with SMTP id
 a640c23a62f3a-c50963d46ecmr1184846866b.9.1794936203620; Tue, 17 Nov 2026
 09:23:23 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112203227.289379-1-zide.chen@intel.com> <20261112203227.289379-7-zide.chen@intel.com>
In-Reply-To: <20261112203227.289379-7-zide.chen@intel.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Tue, 17 Nov 2026 09:23:11 -0800
X-Gmail-Original-Message-ID: <CAO9r8zPD_i2aWc3jaKRr-=1Pz0td=6nqBpgBfVVaV3jfzVTAjw@mail.gmail.com>
X-Gm-Features: AclHuK-xecCpEbInyvGGF_p4kfoSNSZz851mSQupLC1L4HsXX_kRXqRMGPskwh8
Message-ID: <CAO9r8zPD_i2aWc3jaKRr-=1Pz0td=6nqBpgBfVVaV3jfzVTAjw@mail.gmail.com>
Subject: Re: [PATCH v4 06/21] KVM: x86/pmu: Drop nr_arch_{gp,fixed}_counters
 from kvm_pmu
To: Zide Chen <zide.chen@intel.com>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, kvm@vger.kernel.org, 
	Jim Mattson <jmattson@google.com>, Andi Kleen <ak@linux.intel.com>, 
	Stephane Eranian <eranian@google.com>, linux-kernel@vger.kernel.org, 
	Mingwei Zhang <mizhang@google.com>, Das Sandipan <Sandipan.Das@amd.com>, 
	Shukla Manali <Manali.Shukla@amd.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	Xudong Hao <xudong.hao@intel.com>
Content-Type: text/plain; charset="UTF-8"

>  static void amd_pmu_init(struct kvm_vcpu *vcpu)
> diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
> index 136069dfcd44..e21abcedea70 100644
> --- a/arch/x86/kvm/svm/svm.c
> +++ b/arch/x86/kvm/svm/svm.c
> @@ -761,24 +761,21 @@ static void svm_recalc_pmu_msr_intercepts(struct kvm_vcpu *vcpu)
>  {
>         bool intercept = !kvm_vcpu_has_mediated_pmu(vcpu);
>         struct kvm_pmu *pmu = vcpu_to_pmu(vcpu);
> +       unsigned long gp_mask = kvm_gp_pmc_mask(pmu);
>         int i;
>
>         if (!enable_mediated_pmu)
>                 return;
>
>         /* Legacy counters are always available for AMD CPUs with a PMU. */
> -       for (i = 0; i < min(pmu->nr_arch_gp_counters, AMD64_NUM_COUNTERS); i++)
> +       for (i = 0; i < AMD64_NUM_COUNTERS; i++)
>                 svm_set_intercept_for_msr(vcpu, MSR_K7_PERFCTR0 + i,
> -                                         MSR_TYPE_RW, intercept);
> +                                         MSR_TYPE_RW, intercept || !test_bit(i, &gp_mask));

This fixes a pre-existing bug that was reported internally, that can
happen if a malicious VMM reduces the number of counters after
initiating KVM_RUN but before VM-entry. The current code would fail to
re-enable the intercept on the counters that become unsupported.

Might be worth splitting this out into a standalone fix.
