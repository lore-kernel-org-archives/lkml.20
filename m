Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0397F175A6C
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792115259; cv=none; b=S4HupOzgVi9KhR6YvN19HLKhS58Tru5rSRNtA6I9zZnxmbj0UeUtthjJbWktTEaAv2/Sz/MBHlGyCN/2jTgHPl6VXkXQPs7HiBIVa5e69Mcijb04c0ZaLvaUGZIeFGyEdv3V+s4EoIHul/W9FCPKYv8VGSsa9JwpVryk4ScpH8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792115259; c=relaxed/simple;
	bh=5M2peoG8jXom4XHhqR1eJ4sUTNnWk2VuvSwruGiSMXg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XqVKSOMQNfVwkoCDwHIgfI8Z5AKgWyGjuv0j9lFsUlL3xr954yex9cv8vFrlT3dKs7pJdOIgSpCpi6piSVQlP2huoMUNhqFbB5WxqR1cIMyC62FBgjP2Jm0iL2kRDAPEodPNcpZXFaYsaiuDez15GYg5r5oHqeMMO6h61lUF3Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oGnKLMAA; arc=none smtp.client-ip=209.85.214.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oGnKLMAA"
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e8e16d22d8so39505935ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 18:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792115256; x=1792720056; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+I0hVQqHR1ieM6ZT8DAxKDUM+QaSKzLxn8i4OPlAHWM=;
        b=oGnKLMAAJja4jXVbwkx5jcH3MVwudW1w4nQ3BvTUmYd/9qkLdaBm6+vrUC86wHv353
         4SRZtmGKsry/kGiqJpo+SQGk03LuB1c6xmkwymxH5+gkgvaA3SrZ4vn3dqZD1Z2RfOr5
         AeF2hcxe+B/wCzmDP2rUUgweLXIdpLMy+mbIttLD+SFjUZgLJZTLTQl5EAADJDe96zMd
         nuEp3Km+7hH0+ClebfskJrFO2zX7dv48NeWAHcrPN5bhvdK4v0zKosmLWR3htu1nkRBm
         FE1O3XaUJnznFwwcKLUrHId+zANPHUhHwABoLZpva0hXkTK20s+rU+BKl94vyFXuefWz
         xVJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792115256; x=1792720056;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+I0hVQqHR1ieM6ZT8DAxKDUM+QaSKzLxn8i4OPlAHWM=;
        b=WqR50JxK8nUL1Kvvp9XLPAuOYTau3AmFdYixYXxvwm2fUOUo9daTon2bQNAJvY9xOB
         vR8tGVRZ446ZZZomdMaPNUbYbQe0gBZhTTXWQv5p5tsDjSqgwzqwEBlF+g7OZYNKV1PM
         5jFUZb4N5lnH6WRIeuQRpVyOmsW30Jw5bbZveop7Z34RMTIagdH7Q3eC/nxkBBBbPu4z
         +EY+gYu/djT/gxjbF/KPvxTjHqP1hdFWCCVuc0ggrmS3fNdiV/wgmN3H5b8wookjKSS7
         PmNDDGIRJ4PQ2dh2+QZr8rcoMLQA6Bkk947SSSR86zNGITV80rM6XYJ9tnoesNGzqwA5
         D5LA==
X-Forwarded-Encrypted: i=1; AKwUvBwRrNJIYv1PxghCOpu4B2QzXHX2FB732BTorFGiQPjHiHCFaENvYKxvUuQ+cKq+tCFBQ+nXZXbCv05Qso4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJlXp1FU1wjhR06QEbWtQenlA9XsyJABkXQ7VBxoxUso2c9JG8m
	Y8JxsKqsEadVmAXpku4IAuUhV49PApAzzl7Jbt0IvdxjwuNn+ttttTjJCPw1LzEqstoeEMMJ73O
	cntlQSA==
X-Received: from plbmg15.prod.google.com ([2002:a17:903:348f:b0:2e9:3e55:fe6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f688:b0:2dd:ad74:ac22
 with SMTP id d9443c01a7336-2e842cfcd6emr190938585ad.29.1792115256038; Thu, 15
 Oct 2026 18:47:36 -0700 (PDT)
Date: Thu, 15 Oct 2026 18:47:35 -0700
In-Reply-To: <a578b2ff-52a4-4959-832d-a84b24ccb80e@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <213d614fe73e183a230c8f4e0c8fa1cc3d45df39.camel@intel.com>
 <20260224212939.2081828-1-changyuanl@google.com> <a578b2ff-52a4-4959-832d-a84b24ccb80e@linux.intel.com>
Message-ID: <atGCN656hpWzSuci@google.com>
Subject: Re: [PATCH] KVM: TDX: Set SIGNIFCANT_INDEX flag for supported CPUIDs
From: Sean Christopherson <seanjc@google.com>
To: Binbin Wu <binbin.wu@linux.intel.com>
Cc: Changyuan Lyu <changyuanl@google.com>, rick.p.edgecombe@intel.com, binbin.wu@intel.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	isaku.yamahata@intel.com, kas@kernel.org, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, mingo@redhat.com, 
	pbonzini@redhat.com, tglx@kernel.org, x86@kernel.org, xiaoyao.li@intel.com
Content-Type: text/plain; charset="us-ascii"

On Tue, Oct 13, 2026, Binbin Wu wrote:
> On 2/25/2026 5:29 AM, Changyuan Lyu wrote:
> 
> [...]
> 
> > -----------------------
> > 
> >>From 18b967b718911c09872c3717d8ab083fa59c4a70 Mon Sep 17 00:00:00 2001
> > From: Changyuan Lyu <changyuanl@google.com>
> > Date: Fri, 20 Feb 2026 09:55:28 -0800
> > Subject: [PATCH] KVM: TDX: Set SIGNIFCANT_INDEX flag for supported CPUIDs
> > 
> > Set the KVM_CPUID_FLAG_SIGNIFCANT_INDEX flag in the kvm_cpuid_entry2
> > structures returned by KVM_TDX_CAPABILITIES if the CPUID is indexed.
> > This ensures consistency with the CPUID entries returned by
> > KVM_GET_SUPPORTED_CPUID.
> > 
> > Suggested-by: Sean Christopherson <seanjc@google.com>
> > Signed-off-by: Changyuan Lyu <changyuanl@google.com>
> 
> 
> Hi Sean,
> 
> When I was preparing the v5 of the TDX CPUID patch series, the internal sashiko
> reported a issue:
>   > @@ -2359,6 +2359,15 @@ static int setup_tdparams_cpuids(struct kvm_cpuid2 *cpuid,
>   >  		if (!entry)
>   >  			continue;
>   >  
>   > +		/*
>   > +		 * Reject entries whose index doesn't match the expected one.
>   > +		 * This catches userspace passing a CPUID entry with the
>   > +		 * KVM_CPUID_FLAG_SIGNIFCANT_INDEX flag cleared when the index
>   > +		 * is significant.
>   > +		 */
>   > +		if (entry->index != tmp.index)
>   > +			return -EINVAL;
>   
>   [Severity: Medium]
>   Does this unconditional check inadvertently break userspace VMMs that provide
>   valid CPUID entries but leave the index field uninitialized for
>   non-significant leaves?
>   
>   Since kvm_find_cpuid_entry2() ignores the index field when
>   KVM_CPUID_FLAG_SIGNIFCANT_INDEX is cleared, VMMs are not architecturally
>   required to zero the index for non-significant leaves. This check forces
>   the index to be exactly 0 (since tmp.index is normalized to 0) even for
>   leaves that do not have architecturally significant subleaves.
> 
> 
> I think the issue is valid,

Yeah, requiring the index to be a specific value without SIGNIFCANT_INDEX set
could break usrspace.

> so it needs to know whether the entry is a subleaf or not. I think it's more

By "it", I assume you mean userspace?

> reliable to do it via the information reported by the TDX module. i.e. my
> patch set will rely on this patch to set KVM_CPUID_FLAG_SIGNIFCANT_INDEX for
> entries that are indexed.
> 
> Will you apply this patch?
> Or I can include this patch in my patch set. Also, 0x23 is still missing in
> cpuid_function_is_indexed(), I can add a patch to add 0x23 as well.
>
> > ---
> >  arch/x86/kvm/vmx/tdx.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
> > index 2d7a4d52ccfb4..1c039eab2f3d8 100644
> > --- a/arch/x86/kvm/vmx/tdx.c
> > +++ b/arch/x86/kvm/vmx/tdx.c
> > @@ -167,6 +167,7 @@ static void td_init_cpuid_entry2(struct kvm_cpuid_entry2 *entry, unsigned char i
> > 
> >  	entry->function = (u32)td_conf->cpuid_config_leaves[idx];
> >  	entry->index = td_conf->cpuid_config_leaves[idx] >> 32;
> > +	entry->flags = 0;
> >  	entry->eax = (u32)td_conf->cpuid_config_values[idx][0];
> >  	entry->ebx = td_conf->cpuid_config_values[idx][0] >> 32;
> >  	entry->ecx = (u32)td_conf->cpuid_config_values[idx][1];
> > @@ -174,6 +175,9 @@ static void td_init_cpuid_entry2(struct kvm_cpuid_entry2 *entry, unsigned char i
> > 
> >  	if (entry->index == KVM_TDX_CPUID_NO_SUBLEAF)
> >  		entry->index = 0;
> > +	else
> > +		entry->flags |= KVM_CPUID_FLAG_SIGNIFCANT_INDEX;

Hrm, I'm getting deja vu.  Oh, this is an old thread.  *sigh*  I was expecting
a new patch/thread, but it got "posted" inline.

I'll send a small v2.
