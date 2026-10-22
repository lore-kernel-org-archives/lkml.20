Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792675532;
	b=OGm2Uj4jEc+PHQ1wT24b9KkIm+/gax5991JAcPOl6uQT93TZI9FUeHbrLWaU0GBhZZK1
	 vi6wG3KHbSqllG5joAHe0Cbx34T5e4MmZ46PWiFFbak1G9pizvP/oGKPiLeQPZJjD6pOT
	 N2hZaWqkPdrhaImGGK0Bqehl4FONtvrFgXIHovaF/IF2odC5a0Uph8Bbs+Su5r1mgLEYb
	 59WODoWB3vb8QRoFuYqpDcQ4lq56jujj+5t2GbjhlgsO6fpuvVCULhLCJIgBw71Q53Zfr
	 5DpEyx/oXbt8kHZkf8LpykMa8hO4gn1++Y4mq9ZDwSb6tUwDewgF+gsbZ9uzqBRtJBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792675532;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=hZOHOOIePIsNvH6UKplfplXR1KT1tHkILWL/yR0j53w=;
	b=dW9vIXhARJB6/EY/GnwVplccu6UOPjVNnmFaLWA4s7mFkkkLNz1tJKAQx1ATejOyJytG
	 vaux57ykrUXWEIvEcqGO1rr602OWqaE6Pf6WtPV+Ta5C7kgMyXaUfHx4lSLCeKr1FmyAI
	 4tUxW2BJ1NcdozXnhoLXXYTZb0MA53NshiQymG8Kt69GqCS7gbNgLxng+16WVyOyDUyi8
	 pC8ItEJ+Zvyq8N5vLcr36KHj0FASBcjIZlfODtUiLJK6oWC6vuUKv9T0iWKophBKf97O9
	 L4Kv8MOkyDGCRrUc65bQvsYZWsLTA29CARIEx90it+sIaU7nipMge6IEHpW7fTeulbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Gk1GhX5Z;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41518606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:25:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41518606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Gk1GhX5Z
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e8dd9b9743so21341755ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 06:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792675530; x=1793280330; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hZOHOOIePIsNvH6UKplfplXR1KT1tHkILWL/yR0j53w=;
        b=Gk1GhX5ZSDd0+yBhurUR6Pv6dvQdiMe4V9FVZNL+dbtFCJQS8rKjBfrPlkQpMgoO3E
         4JSbSguBiaIh4FgX5NvqHFXNkd2EMvc7xuf6koeLcacJvAvxbgS48piPT94z8mhABd7N
         eZODzelYY1pAp9KLpCi11SpDdV4LCVas31IQsysy27iP/5romV5o1JweEcdhB3Ml4hs3
         3Kgv/5Jlbzal7/YAxzE5UOMjh0pI0y6N5g3tVSCj9xuW1T7IbeG3xC+qad18sx99Erw6
         8pWWQko7r+8wYsPBSB36JMeng2a3pv/Mgz08GZ/NKtOqW5rr7Y9DgzUlO6xO4tkgIzd1
         OZ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792675530; x=1793280330;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hZOHOOIePIsNvH6UKplfplXR1KT1tHkILWL/yR0j53w=;
        b=tYBERb3eyDvLPftBRJ0aIZr1e6CRvSKdImg4pHgtg8maJUpHU1DyqFw1Jq6SmDBKOz
         r+D0ZSCOE1ScVG1+hMLG1Dq7JaGAFFS/j3HALInuF9MHnEnGN1jW0gXfwlTIUHukPcYv
         gQonCqoubkALJc2u3WmMs/HzAjrAX9jG0pmRegegR0vvNk55aG6pfLDOyfXKWndV2pwo
         NPAJUjHpot8Dzju5IHFu2+sqfJecb3/i4LUKuhh9iF4rqkzoOwTSlTShRco/e6iYUQcG
         ZCoqOTUn6shYZRtYxlQxppYGk6mVu+8shGcjijJAUFyE9LVmhcg3AK80/JeNMGC6Cn12
         znpg==
X-Forwarded-Encrypted: i=1; AKwUvBy3YqyTu0TK5rfIAUDTmbMc0B/phciFjVDL2rGMV+KRvwi3g7koIdrK90k3i/+2FMZCX0tKqy0ivFTZ23g=@vger.kernel.org
X-Gm-Message-State: AFq9FYIpxMpL7n/Pe+I/pm4dK7CbKdxBHvdyGaXGcWuXjuU3ELf2wJUr
	mkg3iE/f64k+ITGKOD/k6wG9jQPnFsFbNhfvSHOD3Ve4JH5l19wlGk68DfMj1yaUqRgK8O7gZEY
	onZqsEQ==
X-Received: from plbmp3.prod.google.com ([2002:a17:902:fd03:b0:2df:8ce6:d461])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:cecb:b0:2e6:1715:e48d
 with SMTP id d9443c01a7336-2ea43e179eemr44515925ad.35.1792675530321; Thu, 22
 Oct 2026 06:25:30 -0700 (PDT)
Date: Thu, 22 Oct 2026 06:25:29 -0700
In-Reply-To: <kuptsmerymy.fsf@vkuznets-thinkpadx1carbongen12.rmtcz.csb>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261022021227.295495-1-seanjc@google.com> <kuptsmerymy.fsf@vkuznets-thinkpadx1carbongen12.rmtcz.csb>
Message-ID: <atoOyY2g68N7R9s8@google.com>
Subject: Re: [PATCH] KVM: x86/hyperv: Explicitly reject VP Assist Page reads
 if cache was clobbered
From: Sean Christopherson <seanjc@google.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Amirmohammad Eftekhar <amirmohammad.eftekhar@cispa.de>
Content-Type: text/plain; charset="us-ascii"

On Thu, Oct 22, 2026, Vitaly Kuznetsov wrote:
> Sean Christopherson <seanjc@google.com> writes:
> 
> > Don't try to read the VP Assist Page if the shared PV EOI cache has been
> > reconfigured via KVM's actual PV EOI MSR, as trying to read 624 bytes of
> > info when the cache is setup for only 1 byte will trip the sanity check
> > WARN in kvm_read_guest_offset_cached().  Ideally, KVM wouldn't use shared
> > state to track the VP Assist Page, but in practice no sane guest enables
> > both KVM's PV EOI and Hyper-V's Assist Page at different addresses, i.e.
> > not allowing both to co-exist independently is "fine".
> >
> > Fixes: b63cf42fd1d8 ("kvm/x86: implement hv EOI assist")
> > Cc: stable@vger.kernel.org
> > Reported-by: Amirmohammad Eftekhar <amirmohammad.eftekhar@cispa.de>
> > Closes: https://lore.kernel.org/all/20261017093016.32348-7-amirmohammad.eftekhar@cispa.de
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> 
> Reviewed-by: Vitaly Kuznetsov <vkuznets@redhat.com>
> 
> (I am, however, thinking it would be better in the long term to either
> separate KVM PV / Hyper-V PV state here or even consider a 'big
> hammer' and make these two (+Xen?) mutually exclusive for all PV
> features.)

I generally agree, the problem is that any changes could break guests.  For
whatever reason, kvm_lapic_set_pv_eoi() very deliberately allows the two features
to overlay.  I.e. while it seems absurd, in theory a guest could rely on being to
use the two features simultaneously.

OMG, it's your fault!  LOL.  (Obviously not actually your fault since you were
just trying to clean up the mess created by the initial implementation).

  Author:     Vitaly Kuznetsov <vkuznets@redhat.com>
  AuthorDate: Tue Oct 16 18:50:06 2018 +0200
  Commit:     Paolo Bonzini <pbonzini@redhat.com>
  CommitDate: Wed Oct 17 00:30:17 2018 +0200

    x86/kvm/lapic: preserve gfn_to_hva_cache len on cache reinit
    
    vcpu->arch.pv_eoi is accessible through both HV_X64_MSR_VP_ASSIST_PAGE and
    MSR_KVM_PV_EOI_EN so on migration userspace may try to restore them in any
    order. Values match, however, kvm_lapic_enable_pv_eoi() uses different
    length: for Hyper-V case it's the whole struct hv_vp_assist_page, for KVM
    native case it is 8. In case we restore KVM-native MSR last cache will
    be reinitialized with len=8 so trying to access VP assist page beyond
    8 bytes with kvm_read_guest_cached() will fail.
    
    Check if we re-initializing cache for the same address and preserve length
    in case it was greater.
    
    Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
    Cc: stable@vger.kernel.org
    Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

So yeah, it definitely seems like we can separate the two since odds are very good
the only reason they "co-exist" is pbecause KVM tricked userspace into effectively
saving/restoring garbage via MSR_KVM_PV_EOI_EN.
