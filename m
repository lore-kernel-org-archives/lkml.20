Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.114
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794415573;
	b=QFpDuWIkn60EOK5kmUufUzUAKvxyRsRpPYhyjkwimbtPYjirXO4YCETB6kOKqA0DhH4j
	 yh/V77CWvINe4QDnd7IEJDj4lcLFnX4mwVgTx3ud9ycJnyIKDUKYnIoGHzO0WkPi4ZSWy
	 POWwWHU+uxagTcISr141clJlFI1T36Gizyo0xRTm/USpofT/BAYlJYaFbU153ontvOClS
	 vlP1B4CMWZX07fKXfIhU/HcQsBrpV6hH7ySJ3/Hg7fP1bBvYeen6J+pjeu1uskqQuwUZN
	 9rEU4Esq9g+PyPuhntwgsJaSRTGTThfBMZzAFOHYamsxP4KvUSmOS6Nn16l1b+iBMaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794415573;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=zfYkUkK1FvEiamJkD2w+G92+ZaU+ueOZOEIhISapy8E=;
	b=huXcbwHvb/vezjlrNNl22blPLChHLNw+hvuhsHQYiOUHGGWB/VF15JUAtyDgnVLp2OJF
	 ZL79nn4R9vmcRck0gl/CsrI3Nvaqqe/4uxmDhRdyD9RgNK1+6ZctRdjhNzY4o8L/6ZjCd
	 ZLUIsx7FugOdt+gg74rFcZJGHr5zGfYjVRiDI1KNvmBWkMmpzCMGKgETOF6p8+wqOzwf4
	 7T0CW5z57FRJ5MKwrGTijc+V8PdisN7G6qw5ZNA2wjeQFNBwBm/l3z0jG4xotV+izdDFa
	 DoHlqNK4umMq2CGBS63aSm+tTw/F3zKKZwCxbUjqF3xDdKBynDJduMmYQ5h3xg6KU9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UejACTDM;
	arc=none smtp.remote-ip=91.218.175.114
Received: from mta0.migadu.com (out-114.mta0.migadu.com [91.218.175.114])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B80606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:46:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95B80606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UejACTDM
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=vTOKXuEi2SgorO3quCcM6rXO+IcsXT+k+wyiUNo4CmU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794415569; v=1; x=1795020369;
 b=UejACTDM9Qsq3/MhNcmU2Utg71fqJTzULps2pDQL/6lB09U1zZRx53C5ipp2DnyCJtz8nMRS
 tQi0znxT1OiGbq0Yx67gPzx+ScSc1Dm4wJwlbTrK/nRqfB1AVwwVdrikK/aneM05fJvXHfOMJ1h
 iDFjuoMvlp3ow++if+zW2UyY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5976e7e889082f28;
	Wed, 11 Nov 2026 16:46:09 +0000
X-Mizu-Trace-ID: 5976e7e889082f28
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5be58ad9600so7380e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:46:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFcFv8gNiYm5AKIW/Ob6wt1UGLGs03exkgYHS1L/ZKVYMKFrxMhb7vOWvYVcdN4SGjO3M0brHPAeX94Oy0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6pYlUb8JNuPYh2+43+G6/teXJAlvzZWPUh2c3D0/f3AgWUwa6
	ckDhWNBrr5/x+aXNPVBkqUsScCDNl6gKp3e96SQmTzehkdf/Cl6psRdFshBVg59MifMEOW4KvoJ
	WVxLC1dIgRkclx81BvvkdQCYCr8mA+LFQOKxGK50j
X-Received: by 2002:a05:6512:1281:b0:5c1:488e:a067 with SMTP id
 2adb3069b0e04-5c15e321265mr149685e87.16.1794415563460; Wed, 11 Nov 2026
 08:46:03 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261001135711.1640520-1-fuad.tabba@linux.dev>
 <20261001135711.1640520-10-fuad.tabba@linux.dev> <5fa8a1fb-4e2c-4746-8a70-a47f387ef0d6@arm.com>
In-Reply-To: <5fa8a1fb-4e2c-4746-8a70-a47f387ef0d6@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 11 Nov 2026 16:45:27 +0000
X-Gmail-Original-Message-ID: <CA+EHjTyCcGPMte9=HuqyvCS7CCCt80Lc_JQuA+1e3ZE+3A0zqQ@mail.gmail.com>
X-Gm-Features: AclHuK_8e85qNvEPUChw2hXq-xwQhB1Rl-UgkdF_cZM8i8KqhVquzOK3Y1yl4BA
Message-ID: <CA+EHjTyCcGPMte9=HuqyvCS7CCCt80Lc_JQuA+1e3ZE+3A0zqQ@mail.gmail.com>
Subject: Re: [PATCH v4 09/18] KVM: arm64: Implement HVC handling for protected
 guests at EL2
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, steven.price@arm.com, vdonnefort@google.com, 
	qperret@google.com
Content-Type: text/plain; charset="UTF-8"

Hi Ryan,

On Wed, 11 Nov 2026 13:59:17 +0000, Ryan Roberts <ryan.roberts@arm.com> wrote:
[...]
> > diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
[...]
> > @@ -2622,6 +2622,10 @@ static void kvm_hyp_init_symbols(void)
> >          kvm_nvhe_sym(__icache_flags) = __icache_flags;
> >          kvm_nvhe_sym(kvm_arm_vmid_bits) = kvm_arm_vmid_bits;
> >
> > +        kvm_nvhe_sym(spectre_v2_state) = arm64_get_spectre_v2_state();
> > +        kvm_nvhe_sym(spectre_v4_state) = arm64_get_spectre_v4_state();
> > +        kvm_nvhe_sym(spectre_bhb_state) = arm64_get_spectre_bhb_state();
>
> Is it really correct to snapshot this state then use it at runtime assuming its
> still accurate? See below...

These can't change after this point: update_mitigation_state() doesn't
update a state once system_capabilities_finalized() is true, and
kvm_arm_init() runs after that.

[...]
> > diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
[...]
> > @@ -1181,8 +1187,70 @@ bool kvm_handle_pvm_hvc64(struct kvm_vcpu *vcpu, u64 *exit_code)
[...]
> > +        case ARM_SMCCC_ARCH_FEATURES_FUNC_ID:
> > +                /* The workaround calls themselves are handled on hyp entry. */
> > +                val[0] = SMCCC_RET_NOT_SUPPORTED;
[...]
> > +                case ARM_SMCCC_ARCH_WORKAROUND_2:
> > +                        switch (spectre_v4_state) {
> > +                        case SPECTRE_VULNERABLE:
> > +                                break;
> > +                        case SPECTRE_MITIGATED:
> > +                                /* With SSBS advertised the guest's default is safe. */
> > +                                if (kvm_has_feat(vcpu->kvm, ID_AA64PFR1_EL1, SSBS, IMP))
> > +                                        break;
>
> For this case (and the break immediately above) you return val[0] =
> SMCCC_RET_INVALID_PARAMETER (from init at top of this function). But the
> kernel's kvm_smccc_call_handler() returns val[0] = SMCCC_RET_NOT_SUPPORTED in
> these cases (which seems more likely to be correct). Does this violate the ABI?

Both return NOT_SUPPORTED. val[0] is set to it at the top of the
ARM_SMCCC_ARCH_FEATURES_FUNC_ID case.

>
> > +                                fallthrough;
> > +                        case SPECTRE_UNAFFECTED:
> > +                                val[0] = SMCCC_RET_NOT_REQUIRED;
>
> Is it possible that the (compromised) kernel could have disabled the mitigation
> after the state snapshot was taken? I.e. spectre_v4_state == SPECTRE_MITIGATED
> and the VM doesn't advertise SSBS so it returns SMCCC_RET_NOT_REQUIRED here. But
> the kernel has since turned off the mitigation?

Yes, where the mitigation is the firmware one. The host can disable it
with an ARM_SMCCC_ARCH_WORKAROUND_2 call, which EL2 forwards, and EL2
doesn't enable it again before running the guest. With TF-A that's
only on a Cortex-A76 without SSBS, the only CPU it implements the
dynamic workaround for.

I'll send out a fix. Thanks for spotting this!

Cheers,
/fuad
