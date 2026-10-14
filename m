Received: from mta0.migadu.com (out-136.mta0.migadu.com [91.218.175.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9E75304DA
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791991295; cv=none; b=UV6IJ4dxptJ+/+MXAtTMM/2B6Y02h5EBgXc2X7qZvml+1PQg1MEVYtCveZBMls7ZEOA2U5LsTOKVSasoH+uCFUPWenTQbxTV8GqELG5akoMFlgVQG2WJhyXvejODdGo0Bb+p9Wt13Iq4eADZTjtHQsmamigs/S9KqbsV0DXgItM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791991295; c=relaxed/simple;
	bh=quvfgFJ++znBLejNnQxBzynex0w2Jk0eO461131buU4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fgl5YTKIZm9mABarft/gVUC4HQazTIsowcP2dh3YpJYjhJLkNr+5GJQIy/BJcCySn6G76xUUz9DVCNTvgHuCNNIKMDBZvUUQ9j0W77jh56NXVit1VW33yRYIyO2+f6xrkAsXt1U5bRNjkTpxIHCATLfNLZDnkkVb/3BgAAMTKz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=hzuqfIM/; arc=none smtp.client-ip=91.218.175.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="hzuqfIM/"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=quvfgFJ++znBLejNnQxBzynex0w2Jk0eO461131buU4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791991291; v=1; x=1792596091;
 b=hzuqfIM/pDlSoh84pUKlQsf7XYXJjuSJGC8CU72RVTJen1q2agN0TW1uE23H09CH/Z0QukD2
 fa4Nt2j1ddqYwpTUaREmwjFM/it6K+SKtS2722vikEoWAaKblieD8VEg9Hf5Kdc6O/S+8CG00mM
 C/Lxc9BW/hae4BM2ruva3Vfs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id caea9e5f8628b52a;
	Wed, 14 Oct 2026 15:21:30 +0000
X-Mizu-Trace-ID: caea9e5f8628b52a
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5ba429b64c5so33344e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:21:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwTgMcUhkAXXYhna6pQmiuR138bTie88hp7sigOtyyYkimMyLCd+h0mpFx4bIQktQn3myBRY8zxfRVWN7o=@vger.kernel.org
X-Gm-Message-State: AFq9FYKiJ1bWDw/ARchgI6GwQnypm1HT0zfUmsTNSvBhvNPsGIeMkxjE
	rsx35kP3Er6zBB4vgPbm7lhvQEwxEULELeSDUm0wNVp1uVRTOF8PD5XZbFdgNCkJsL2RyGWhU2G
	eR0+bNE9dmmM/CyDx21b1dty0FcLhVDYQKMVcZjt0
X-Received: by 2002:ac2:568c:0:b0:5bc:b2ec:eaee with SMTP id
 2adb3069b0e04-5be35cac1c5mr118716e87.11.1791991289793; Wed, 14 Oct 2026
 08:21:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <86tsmp20ne.wl-maz@kernel.org> <20261013143338.815377-1-fuad.tabba@linux.dev>
 <86se281k4u.wl-maz@kernel.org>
In-Reply-To: <86se281k4u.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 14 Oct 2026 16:20:53 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwnO-G8jx+1RvSUcFyKtGB2vbASzHDjTLeZCPY90dhzJg@mail.gmail.com>
X-Gm-Features: AclHuK-B5G1xDGXPQoX5Vm0txWNpcPBVZK84TOsBPDslRqCcUXPB_JGF6FjQ5oU
Message-ID: <CA+EHjTwnO-G8jx+1RvSUcFyKtGB2vbASzHDjTLeZCPY90dhzJg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] KVM: arm64: vgic-its: Fix LPI double mapping and DISCARD
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Andre Przywara <andre.przywara@arm.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marc,

On Wed, 14 Oct 2026 14:34:09 +0100, Marc Zyngier <maz@kernel.org> wrote:
[...]
> I don't think this is right. Yes, it probably does enough request
> checks that we end-up with not getting it completely wrong, but the
> issues are that:
>
> - we have state change before we evaluate the requests
>
> - we mix request generation and state change in a single helper
>
> and we should be able to fix that so that there is only a single
> request checking point in the whole entry sequence.

Agreed, this is cleaner. With the flush after the single request
check, your run loop is what the second litmus test in my last email
[1] models (discard+halt+check), which comes out Never under the LKMM.
On QEMU, with your diff on top of v2, the guest doesn't take the
discarded LPI in any of 20 runs with the debug hooks forcing the race.
With NV, vgic_lpi_stress and my DISCARD test pass with the guest at
vEL2, but I don't have any tests that run an L2 guest.

[...]
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
[...]
> @@ -1334,18 +1330,19 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>                  smp_store_mb(vcpu->mode, IN_GUEST_MODE);
>
>                  if (ret <= 0 || kvm_vcpu_exit_request(vcpu, &ret)) {
> -                        vcpu->mode = OUTSIDE_GUEST_MODE;
>                          isb(); /* Ensure work in x_flush_hwstate is committed */

I think you can drop this isb() too. It was added so that the early
exit's vgic sync would read back consistent GIC state after the flush
had written it (771621b0e2f8).

[...]
> diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
[...]
> @@ -2054,6 +2057,11 @@ void kvm_nested_flush_hwstate(struct kvm_vcpu *vcpu)
>
>          if (unlikely(vcpu_test_and_clear_flag(vcpu, NESTED_SERROR_PENDING)))
>                  kvm_inject_serror_esr(vcpu, vcpu_get_vsesr(vcpu));
> +
> +        vgic_v3_nested_update_mi(vcpu);
> +
> +        if (vgic_state_is_nested(vcpu) && kvm_vgic_vcpu_pending_irq(vcpu))
> +                kvm_make_request(KVM_REQ_GUEST_HYP_IRQ_PENDING, vcpu);

This now runs before kvm_pmu_flush_hwstate(), so a PMU overflow raised
there isn't queued yet when the pending check runs, and the vCPU goes
round the loop once more (the injection's KVM_REQ_IRQ_PENDING still
stops the entry). Would it make sense to call
kvm_nested_flush_hwstate() after kvm_pmu_flush_hwstate() instead?

Patch 2 depends on your run-loop change, so I'll wait for it and for
your series with the pauses and the LPI-disabling fix, and rebase both
patches on top for v3.

Cheers,
/fuad

[1] https://lore.kernel.org/all/20261013143338.815377-1-fuad.tabba@linux.dev/
