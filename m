Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6566E222580
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 14:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792245966; cv=none; b=TYJhzXWAWk80wUBUY9lFizFkBRWQUT1m89ZQGQxslQYN7A0rSewcCdAYN9ZcJpN3FzMZptwl+N+Kry4/IFTYjUHfOJ4NVlJlAVjP/eCkUQmDyAPrIIwS3ro6y83u4kyLABs63T0dZ20dwYBBQeMOITISp7tXTD4nsZ9bjhbb9w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792245966; c=relaxed/simple;
	bh=I2SzU/X0UsUkDnk+7F4P+NF2JrYj+zJ90hjnCQGIqZk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mKS0Fkq5qeHA2CXn7wM3n4Flm/RPTWDIvPhw0Pbc1hOwEA6/ie/Js/RP8/O1hRgEyFe33ANMszLRSEnw2eFQ34cjnKFoNRYpNHoPMkUOOEOdt4waYIKwBhOE0x3ueXQ9evaraAi5q/njLQIRjdee8+bMsGfiiHW4MkTIfx6GqPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WsoQ9dkM; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WsoQ9dkM"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cfc52ddc55so8342265ad.3
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 07:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792245962; x=1792850762; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZVdY7DMl2n2rpVG1smOAYr0lCvQQYHVvm5gpWtCLbZs=;
        b=WsoQ9dkMnVCJTWolM3ANxfdibVWPx1oengEa5jD6lliFp+qC94/FBuS3+hFmqXnEp8
         pW02kcOG/pxpG3bIwLZYkM8UxemAztCSs4YQ3D/Xi/4tfZsJDOv5ui6CRLX0lG98mIWY
         /cSsg1eAIojzdDOzN1gQ3aMXUMZS92GqFaQ4184M/nTU+FcvqyWtFjyd/4bVMTTs/Lg1
         KVNLexHfFdyUWA2xDv6WiLHMlFLi4i7J1IE3cGxb8Fs918GUlwv4WRiKua598/qvHy+3
         eDoZHbGVS8zAUNIqB2yI3Qn/z0gMcXTz+VdkL30XOqOyDvHvK/7XRiA/adbuYhjCBwfB
         6XHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792245962; x=1792850762;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZVdY7DMl2n2rpVG1smOAYr0lCvQQYHVvm5gpWtCLbZs=;
        b=mQtCiJoOSb+eOnYu4/NWezHIJk+JVnT6aIVCw7AO7apPEgIQiCe2IsT1clCWaEE2rc
         jT/FGJMAUlIRKzo0rscqx5Bmqmf5bCfCN1KGkk3579nRb3uHWaORbehmpKGaOoGPJ8bx
         wczS4u4OSpf6QeImFdZbvwmTgNRA2nGL8sOEW4MlRjRUICLRMMhno56eWvSiLIm96wF7
         20uHoOyO/tvriVk5+1JsyCuh/ixWV51YS3u/tjlPCY9NnzOYUKSTq6TjIGR7Ry5mdSBs
         cLVofX2a8ZOJTegyNsryQ2SzUxlGN/Qlo35oTeP1GnuofFm2JL9H/yCrAHXf56DVmivz
         DfQQ==
X-Forwarded-Encrypted: i=1; AKwUvBwjeW7fQ6qBRfcanHcf413bayLFudOoQcJjhjQ8Hh35XBlFsBEc2IcHWRzYonzk1gGZhOXbODHFavvYavI=@vger.kernel.org
X-Gm-Message-State: AFq9FYI2zvWzMPwu9XMptX1UlWLNY8jr51z5VweVUE3wajzE3PaVO1qf
	DyOkVAhJK7yHLhJP04RkqMXDdeyTwOgcUTz9hCVXo9j2H3P0Mq6IDdwQqSvl4Cjz0VWQ6ZplEjs
	6yMBnGQ==
X-Received: from plble14.prod.google.com ([2002:a17:902:fb0e:b0:2e1:326b:da73])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1111:b0:2e8:965c:aedf
 with SMTP id d9443c01a7336-2e9a6c206b7mr23610075ad.42.1792245962200; Sat, 17
 Oct 2026 07:06:02 -0700 (PDT)
Date: Sat, 17 Oct 2026 07:06:01 -0700
In-Reply-To: <20261017093016.32348-7-amirmohammad.eftekhar@cispa.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261017093016.32348-7-amirmohammad.eftekhar@cispa.de>
Message-ID: <atOAyUIiGLBsgsWI@google.com>
Subject: Re: [BUG] KVM: x86: Hyper-V VP-assist page reuses the KVM PV-EOI
 gfn_to_hva_cache, so enabling both WARNs and fails KVM_RUN
From: Sean Christopherson <seanjc@google.com>
To: Amirmohammad Eftekhar <amirmohammad.eftekhar@cispa.de>
Cc: pbonzini@redhat.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Sat, Oct 17, 2026, Amirmohammad Eftekhar wrote:
> Hi,
> 
> Reporting a guest self-DoS (correctness/robustness; not memory-safety, not
> guest->host).

And a KVM WARN, that's the only reason I care about "fixing" this.

> The Hyper-V VP-assist page and KVM's PV-EOI feature share a single
> gfn_to_hva_cache, vcpu->arch.pv_eoi.data:

I'm still flabbergasted that this is the case (I recently learned about this thanks
to another AI-found bug).

>  - Writing HV_X64_MSR_VP_ASSIST_PAGE arms the cache for the VP-assist page via
>    kvm_lapic_set_pv_eoi(vcpu, gfn_to_gpa(gfn) | KVM_MSR_ENABLED,
>    sizeof(struct hv_vp_assist_page))   /* hyperv.c ~1600 */
>  - kvm_hv_get_assist_page() then reads it back with that same cache and the
>    VP-assist length:
>    kvm_read_guest_cached(kvm, &vcpu->arch.pv_eoi.data,
>                          &hv_vcpu->vp_assist_page,
>                          sizeof(struct hv_vp_assist_page))  /* hyperv.c ~952 */
> 
> pv_eoi.data is the one gfn_to_hva_cache shared between the two features. A guest
> that has VP-assist enabled and then writes MSR_KVM_PV_EOI_EN (a different GPA,
> len 1) re-initializes pv_eoi.data for the 1-byte PV-EOI object while VP-assist
> stays enabled. The next kvm_hv_get_assist_page() then does a cached read of
> sizeof(struct hv_vp_assist_page) against a cache set up for len 1 -> the
> length/GPA mismatch trips the cache and KVM fails the read, surfacing as a WARN
> and a failed KVM_RUN for a guest that did nothing architecturally illegal (the
> two features are independent and both legitimately enableable).

Eh, given that no one has ever complained, and that enabling both at different
locations would probably break the guest anyways, I don't see any reason to go
out of our way to make this work.  If someone wants to clean up the Hyper-V mess,
they're more than welcome to, but for an immediate fix, I just want to prevent
KVM from tripping the WARN.

So as a stopgap (which will probably become the long-term behavior...), this?

diff --git a/arch/x86/kvm/hyperv.c b/arch/x86/kvm/hyperv.c
index c18f45f66c24..88cc5a6ce170 100644
--- a/arch/x86/kvm/hyperv.c
+++ b/arch/x86/kvm/hyperv.c
@@ -947,6 +947,15 @@ int kvm_hv_get_assist_page(struct kvm_vcpu *vcpu)
 	if (!hv_vcpu || !kvm_hv_assist_page_enabled(vcpu))
 		return -EFAULT;
 
+	/*
+	 * KVM reuses its own PV EOI feature to emulate Hyper-V's EOI Assist,
+	 * and rather stupidly reuses the same MSR and cache storage.  Treat
+	 * the assist page as inaccessible if the shared state is configured
+	 * only for PV EOI's single byte of data.
+	 */
+	if (vcpu->arch.pv_eoi.data.len < sizeof(struct hv_vp_assist_page))
+		return -EFAULT;
+
 	return kvm_read_guest_cached(vcpu->kvm, &vcpu->arch.pv_eoi.data,
 				     &hv_vcpu->vp_assist_page, sizeof(struct hv_vp_assist_page));
 }
