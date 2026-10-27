Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793109949;
	b=PmiVaT0BE1TPojoxChRynJl2KOcKElG91qQ/KfNCwlWSxu8UJL3XnJTpWeQxk4dxPkQn
	 2I5GbBd6cxug6pau6HRyjQpv6g+a/KPizAMrpL9WdQZnG67nIpwiFabow1MCPkN1kjJUW
	 3PIQROwY0IEDpniXPEwL0qa0jYPd4ZrIwUYc+l4Oaf/pYvyc843WBSvC0y/hnkt6ntasE
	 LXqkyIliUI3c+qjUqT1Lc2xone+r5xNfyQjzVRrgyeliIm934FmQC375x2IUAT12O4iRI
	 DpGQWUj/gPQvvX8VEGSUIgsLw/Ap564OIsOvnM6v/65ACBXyH2FWuXa6sjhyCbOSxLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793109949;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=ScKNcqWNcrrNfUJK36ONgLidCscYb0P1HQayNuGC1DQ=;
	b=QWOevfQJhqVXWcKODNOaF3tOKi5OAbShlo5fsZbPiniFfwbuPbYmfrX/b5Ejzh2KfdB7
	 vLdX6Awf7FHbP2f7QBHgHOAWIx7mxMWdZpYp1HixyiKVviGj6qF34rQK9RC06zwhQbbj2
	 eLhw2+dqETopp8ebmn8Hu58f0JrAQ/Lo9RRiqyaiSTTbvOgxIqXmXxxapTn/p46EvSKDJ
	 1n+9e9FLfDpJq3x07zvQuIc4cLSV+Xa2mjKI18Pt1EnzBovzVUIfRoSqS+ZRkclEehvSl
	 sjov0zakZEsTFyWEkVyV+/iQZg/8J8vjOQyJW6rtm/IE6uWeFUwA71fkiVkqn4Ksg7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=uXbUuRDy;
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBFC2606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:05:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBFC2606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=uXbUuRDy
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3aaf955db5fso6657246a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793109948; x=1793714748; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ScKNcqWNcrrNfUJK36ONgLidCscYb0P1HQayNuGC1DQ=;
        b=uXbUuRDyl16gOXgWVUihpfVQPkghTFvbIh9Pi+wkMzeqmN2MMMrbpVzcU4Pno4oNye
         V3grwk230KSLgDIzQCoaYeuNCF1+hzlit5RyzRQIsREVAI+ftxr/FAk77s21gvyLx9ad
         gCG/HEoNUfv8KSHMBuDFCzgRVyLqsXObRP5h7gRI9PdRieHfsZhYfai9tu7iLknW5kG+
         K3ukDXDq3FeHzsVHG3wt+gNCXllsj18mBxh4mquJonTw/7aP4gT/aynuUep/w56MHo1/
         UfobFuEgxhumii57xnCQbt4kRWhzygBk07QC5AIcs00ekhasbTkfloyiS8/4HRw7eT84
         OqLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793109948; x=1793714748;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ScKNcqWNcrrNfUJK36ONgLidCscYb0P1HQayNuGC1DQ=;
        b=fNoDDCOwn21OV93MF9giigd2nPZ7yOMBlVrTPYeFPbaXn3BwUWvvHZQKccUO4qFYsj
         agSyoUL4CVGabF5A9HgezTbASZTR1R/hZ/kXRsMnLLcOzDQLnWssUNlqRTLIm5Z9IzWc
         hVxESEiRX4uTnMq9dcjd7YEgh63D36lCfR2WH/FKEzed77Tfm2mMbRcKZf8Epw1uThB9
         N7bixWhWnMtWMpWU3x758PBRGTB9KSK7SI2FzjqymVs+exsgCjw8cz4OU0oleh+1D/m4
         uV5tIdom+qEs07Kj4W1enk508NVhUnsIO8bCPfWneRnAV0ux9/mer4QCeDIaeUaVayhZ
         KZQA==
X-Forwarded-Encrypted: i=1; AKwUvBwDOjT2Lr4zPmlLgZ+osxDdFQMkmWSnVwx9NXTM/h9ZL7oLznK8JA/nmvsQL2uSm76FO1O7ScsOg135LHc=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5z6JLMZZ1+couVbF8KP6NWJGCvZ/BSwpMBwl9uj6NIJ+uQNH+
	+SAKVu7RKFGrt96ZCOyGLlnMAY8GrR1YNFCJLqV7BMBQeLFIVx8gRtNVzR2+ShmIB2QCjhPp64g
	ASco0dQ==
X-Received: from pjbsb7.prod.google.com ([2002:a17:90b:50c7:b0:3ac:6795:2cbd])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1cc4:b0:3ab:c80:9370
 with SMTP id 98e67ed59e1d1-3adead57e85mr7634057a91.20.1793109947891; Tue, 27
 Oct 2026 07:05:47 -0700 (PDT)
Date: Tue, 27 Oct 2026 07:05:47 -0700
In-Reply-To: <741bfe7c-5d21-4c6b-98c0-95b01a2a21f3@intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261022210134.612848-1-seanjc@google.com> <20261022210134.612848-3-seanjc@google.com>
 <741bfe7c-5d21-4c6b-98c0-95b01a2a21f3@intel.com>
Message-ID: <auCvuyY7tTg7ISwR@google.com>
Subject: Re: [PATCH v2 2/3] KVM: TDX: Set SIGNIFCANT_INDEX flag as appropriate
 when filling CPUID entries
From: Sean Christopherson <seanjc@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, Binbin Wu <binbin.wu@linux.intel.com>, 
	Changyuan Lyu <changyuanl@google.com>, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Tue, Oct 27, 2026, Xiaoyao Li wrote:
> On 10/23/2026 5:01 AM, Sean Christopherson wrote:
> > diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
> > index 271c2f94b8dd..37d088f6f7a8 100644
> > --- a/arch/x86/kvm/vmx/tdx.c
> > +++ b/arch/x86/kvm/vmx/tdx.c
> > @@ -2,6 +2,7 @@
> >  #include <linux/cleanup.h>
> >  #include <linux/cpu.h>
> >  #include <asm/cpufeature.h>
> > +#include <asm/cpuid/api.h>
> >  #include <asm/fpu/xcr.h>
> >  #include <linux/misc_cgroup.h>
> >  #include <linux/mmu_context.h>
> > @@ -163,12 +164,23 @@ static void td_init_cpuid_entry2(struct kvm_cpuid_entry2 *entry, unsigned char i
> >  
> >  	entry->function = (u32)td_conf->cpuid_config_leaves[idx];
> >  	entry->index = td_conf->cpuid_config_leaves[idx] >> 32;
> > +	entry->flags = 0;
> >  	entry->eax = (u32)td_conf->cpuid_config_values[idx][0];
> >  	entry->ebx = td_conf->cpuid_config_values[idx][0] >> 32;
> >  	entry->ecx = (u32)td_conf->cpuid_config_values[idx][1];
> >  	entry->edx = td_conf->cpuid_config_values[idx][1] >> 32;
> >  
> > -	if (entry->index == KVM_TDX_CPUID_NO_SUBLEAF)
> > +	WARN_ON_ONCE(cpuid_function_is_indexed(entry->function) !=
> > +		     (entry->index != KVM_TDX_CPUID_NO_SUBLEAF));
> 
> I think the WARN_ON_ONCE() is very likely to be triggered in the future when
> people run old kernel with new TDX modules.

Then upstream patches to make that not happen.  Intel insists on treating the TDX
Module like hardware.  So, treat new TDX Modules like new hardware.  Upstream
support for the new "hardware" before it ships, cc'd to stable@vger.kernel.org
if necessary.

Because IMO, the WARN is doing exactly what it's intended to do: alerting the
admin that they are running a potentially dangerous setup.

> > +	/*
> > +	 * Explicitly zero the index when it's not significant, even though it
> > +	 * _should_ be meaningless.  Userspace relies on the index being zero
> > +	 * (the ABI was inherited from KVM_GET_SUPPORTED_CPUID).
> > +	 */
> > +	if (cpuid_function_is_indexed(entry->function))
> > +		entry->flags |= KVM_CPUID_FLAG_SIGNIFCANT_INDEX;
> > +	else
> >  		entry->index = 0;
> >  
> >  	/*
> 
> 
