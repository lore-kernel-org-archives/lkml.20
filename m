Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793825139;
	b=jgdTRxwltEvMW7MVl9nkWZa9fzygl4RcCbhyPULnNLMbWnWFPM1CjyJyY97N6PsDe1Vy
	 nQqYmzKxCCpkdQGG7b87Ivu0LwvNUGOqNbG/GL8CFtkG9s+QeW9FYdjIXdK2PRO7xZCvg
	 odEq6Rk+pcErvmt+2+EdGDp4tBHx7a1ui3rHbNjBwONmDI7vwTvzgqsKcGoAGR6PQMCg2
	 gCIYp0Ti4cI9ohYYGxLFYOspq/lDLgm71kt+kUDMkOO7dc3Nmu0RP8C6SO6nio4lqcvPT
	 GjqaqF4FQAkJzWVgCGYDOWaOJjM+ydJ0Iy6ABvso0wx0QCPzC0jvVT+Cl2taZKo82Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793825139;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=m6RxhV28tVDd3IWEmU/52xEW4Trn9GkOrvqtd0+keQs=;
	b=Ew10GDq4YRrgDm1EFdYkb38cpAz+a8TdrpYewsfJ6dr5lLa70ALP+MRH2m2OEFXPgQeY
	 MEpOpDoOejyy/gxTSJLoDnxilBzvZw0jjx/ysfJgF4rWnVWNhxjWkojBCY/hCJ0d28DB5
	 BmS7/l1FzIfyzrK8kDqMIgiPGDH9JbfaYDOrnkZkml0Vdc3NkvurG4tN9JU4tc1GlDBKd
	 5UPFC9sJHagaaKL8XTCMy/9hrWhBA/PJML+GjV+TtCd05UOT7CNBGHvp7U+C9nsnZaPZ0
	 Dikz7H7tTd45r6KNVP7JEzikgstiUdec/PSiM5YloQZ2vzMKr8nfstL/AyLKTF5hIlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Kqm1ta0z;
	arc=none smtp.remote-ip=209.85.216.70
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6D260952B3
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 20:45:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF6D260952B3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Kqm1ta0z
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b0a7cbf164so571456a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 12:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793825138; x=1794429938; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m6RxhV28tVDd3IWEmU/52xEW4Trn9GkOrvqtd0+keQs=;
        b=Kqm1ta0zK7vn0YdeoBJpPK/M2kcB3iQP8Oyy+Aq5LPlVpfU3OXb2Kxp4F0rQ04uHBR
         o2yUc06bDe28XDMBcHUk0g8+Z1hAXrlbc4ZFp80HURRCxKu/suNRPZsLQ3z7QuQujaZE
         slCGGXPxf4zV/34kkmlUFZ4IikeoD8kX0mM7dBQymluM6ulD+Xg/QiOuvo/+qtT+onLF
         CSgRQ6gHN70dBIdLMWND+DkHrVUR8hmNh6d3GhCQEJSI3l9Nb0SHO3qTCXdvXYrdj2qU
         PqZZYPOkELGcQG3wnPxAxxuvMCpShuz8odIg+7WtpxSJZ+mm4qq6jCs2uhN4sjx8YfMO
         aR2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793825138; x=1794429938;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m6RxhV28tVDd3IWEmU/52xEW4Trn9GkOrvqtd0+keQs=;
        b=q8eJARjGeRSFvkIzuvAE+Oz18szorkU2MbohSl4p6pjsF88xfxJfMrY86VfwmEjQKS
         TIh8ETcTbZ0Y/7IVlfJHMmakvb0if7Fusnz4In9scMTMyXO+8INbjqzdsOq0tWnO7C/E
         C/i9c1IJFk8fOuCCtJVwqlE03r+CbO/3x0Q9ChgtO+h+AhdUZ2dgR4V3I3NhRS1telrX
         wnxMBwrlZSeb6TfP5mXBo5EKoj/1XRj+WmUeFZiCzTlzhaqnceBq721I4FGjIzjaiVxq
         xdKY4cTKsfKZPdwKnyNZzlaEpycBVnwX3+WlTzvg3J6FjhCgfk2HjEiFpqdXKbDZbSgn
         UjWg==
X-Forwarded-Encrypted: i=1; AKwUvBzLivC9rU1eTuq/brIigvN8Couc+OWbLZZDB+trle94db+gwm+6Ht6pUHlOo37YMAKGShjm7K279rt4O6Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/EuVeKyTXRirxZudoinc3scRdBqSwr6fIo4PrDT7+Z2P3kzjFm
	0+CgzRjJFElJcCJuz6Q/Ug9a+pdiXKId7WUdpwutTvPTyZ3LVMcwFkvqAxIXg7QbysBIMY0TELR
	L5lXJUw==
X-Received: from pjhw22.prod.google.com ([2002:a17:90a:5296:b0:3ab:54fb:2a3d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2e52:b0:3ab:24b2:9016
 with SMTP id 98e67ed59e1d1-3ae897ec759mr14634100a91.25.1793825137869; Wed, 04
 Nov 2026 12:45:37 -0800 (PST)
Date: Wed, 4 Nov 2026 12:45:37 -0800
In-Reply-To: <20261020234535.3182385-3-jmattson@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261020234535.3182385-1-jmattson@google.com> <20261020234535.3182385-3-jmattson@google.com>
Message-ID: <auuZcZhBhrkZd9qM@google.com>
Subject: Re: [PATCH 2/4] KVM: VMX: Refresh LBR MSR intercepts on full MSR
 intercept recalc
From: Sean Christopherson <seanjc@google.com>
To: Jim Mattson <jmattson@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Yosry Ahmed <yosry@kernel.org>, Like Xu <likexu@tencent.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Tue, Oct 20, 2026, Jim Mattson wrote:
> Re-apply the LBR MSR intercepts in vmx_recalc_msr_intercepts() if the
> LBRs are currently passed through, so that changes to userspace MSR
> filters are reflected in the MSR bitmap.  Unlike SVM, which can simply
> rewrite the intercepts in either direction, leave the bitmap alone if
> the LBRs aren't passed through, as a filter can only force interception,
> never prevent it, i.e. the bitmap is already correct.  Note, clearing
> msr_passthrough to force vmx_passthrough_lbr_msrs() to re-apply the
> intercepts on the next VM-Enter isn't an option, as doing so would
> leave stale passthrough bits behind if the guest LBR event is no longer
> active.
> 
> vmx_recalc_msr_intercepts() is invoked in response to
> KVM_REQ_RECALC_INTERCEPTS, which is raised on MSR filter updates, but it
> skips the LBR MSRs, and vmx_enable_lbr_msrs_passthrough() does nothing
> if lbr_desc->msr_passthrough is already set.  If the LBR MSRs are passed
> through when userspace installs a filter that denies them, they remain
> passed through, and the guest can access them without exiting to
> userspace.  Conversely, if a filter forced interception when the guest
> LBR event became active, relaxing the filter leaves the MSRs needlessly
> intercepted.  Either way, the bitmap remains stale until the guest LBR
> event is torn down and recreated.
> 
> Only x2APIC MSRs are exempt from userspace filtering (see
> kvm_msr_allowed() and the KVM_X86_SET_MSR_FILTER documentation), and the
> filter is honored when LBR passthrough is first enabled, so KVM's
> behavior shouldn't depend on whether the filter is set before or after
> the guest enables LBRs.  Drop the LBR MSRs from the comment claiming
> that they can't be filtered by userspace, and clarify that
> lbr_desc.msr_passthrough tracks KVM's desired interception, which may
> not match the MSR bitmap when userspace filters are in play.
> 
> Fixes: 9254beaafd12 ("KVM: vmx/pmu: Reduce the overhead of LBR pass-through or cancellation")
> Cc: stable@vger.kernel.org

Meh, this isn't stable material.  Unlike SVM, where LBR virtualization is tied
to a pile of other crud, if userspace wants to filter LBRs on Intel it should
just not expose LBRs in the first place.

If it weren't for SVM, and the fact that avoiding the filters is actually more
work, I probably would vote to fix the docs.

> Signed-off-by: Jim Mattson <jmattson@google.com>
> ---
>  arch/x86/kvm/vmx/pmu_intel.c | 20 +++++++++++++++++++-
>  arch/x86/kvm/vmx/pmu_intel.h |  7 ++++++-
>  arch/x86/kvm/vmx/vmx.c       |  6 ++++--
>  arch/x86/kvm/vmx/vmx.h       |  1 +
>  4 files changed, 30 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/x86/kvm/vmx/pmu_intel.c b/arch/x86/kvm/vmx/pmu_intel.c
> index 70a8c4816135..b945213f0b68 100644
> --- a/arch/x86/kvm/vmx/pmu_intel.c
> +++ b/arch/x86/kvm/vmx/pmu_intel.c
> @@ -517,7 +517,8 @@ static void intel_pmu_refresh(struct kvm_vcpu *vcpu)
>  	memset(&lbr_desc->records, 0, sizeof(lbr_desc->records));
>  
>  	/*
> -	 * Setting passthrough of LBR MSRs is done only in the VM-Entry loop,
> +	 * LBR MSRs are initially passed through only in the VM-Entry loop (a
> +	 * full MSR intercept recalc merely refreshes an existing passthrough),
>  	 * and PMU refresh is disallowed after the vCPU has run, i.e. this code
>  	 * should never be reached while KVM is passing through MSRs.
>  	 */
> @@ -704,6 +705,23 @@ static inline void vmx_enable_lbr_msrs_passthrough(struct kvm_vcpu *vcpu)
>  	lbr_desc->msr_passthrough = true;
>  }
>  
> +/*
> + * Refresh the LBR MSR intercepts if the LBRs are passed through, so that
> + * changes to userspace MSR filters are reflected in the MSR bitmap.  There's
> + * nothing to do if the LBRs are intercepted, as a filter can only force
> + * interception, never prevent it.

Hmm, I don't love assuming that recalcs are only done for filter updates.  On the
other hand, taking action if lbr_desc->msr_passthrough=false is nonsensical.
Rather than immediately refresh the updates, what if we just disable passthrough
and let vmx_passthrough_lbr_msrs() do the actual update?

void vmx_recalc_lbr_msr_intercepts(struct kvm_vcpu *vcpu)
{
	if (WARN_ON_ONCE(!vcpu_to_lbr_desc(vcpu)))
		return;

	/* Disable passthrough to force a recalc on the next VM-Entry. */
	vmx_disable_lbr_msrs_passthrough(vcpu);
}

