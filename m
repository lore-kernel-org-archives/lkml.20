Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793112921;
	b=0cmfD8+Mj7q1AEiSkdhAFBOxwZao/zmzULS2+M7VwN7w92JFhJ4JNuH8Gp5sA4U3DpQG
	 PTnMeUFt3p1yInY/eXNlw0nV+Ap2zOG65ZTYs9XvZQIwOkuHDaDG93DF2mFZxjhH7OZtz
	 9dVekj0ba8zCDBGiRz+D92hrlvCwY0LkmxgrKmmJbpTpFDiqY1rewYOMAV557RdhTHOyI
	 nYOTwR/VD+0vVl0qmpECDrH9GUD8zE9dzdmsLESq6wflh/dy6a2EOAqFfwbpPWogBJeNW
	 vpXnSkOeFrlfK6GzDzHNVIVN5GwnfPKssJH2y7ub61b462qPsrNnbZqNS9+9b9GPtEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793112921;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=1DehjZ5BL8d0YnBEeJuu65Ld1wB1OE7I+m9Hy0VoO3I=;
	b=t73ZHSDeF5yPE6mWGKhUavT9Smx7qkT6avez5Z6SE6pDEctzNwqE/Mr6NyWwH66hBOsV
	 J4NGe9ORYATGhr5pRlC8r7QYX/xge0U5Tyn+6ZEqc+2LM+wZvsaz0sDKyia2kvZ7m4q1G
	 BdR6Q8/1APYMvy9tPh0RFRjGwKvSECDSN95WmdNBA8vtIT5U48a6if6Iydu8mXIHKas/V
	 G+yNEayXgHswdMWNFhLzU4cXOVfKD0KX011xgHSbTScDPo1kaHWObpYEmmed7bcMo+NlH
	 a2Ayj/liqRngtvlUIuw4D8VvsrPqWg8tbGVQkEIEK5sC/pyWQOf0/vviiHCzpLQwP+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gO8jXOfi;
	arc=none smtp.remote-ip=209.85.216.72
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCDD606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:55:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FCDD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gO8jXOfi
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3adbc9a47fbso4169088a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793112920; x=1793717720; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1DehjZ5BL8d0YnBEeJuu65Ld1wB1OE7I+m9Hy0VoO3I=;
        b=gO8jXOfiP+TwEFj4a7G3XZMsl9Jf9enBFTAin8mpQQGJxAfRLf/BpCTqgSDYDLEP2a
         GwMZnfrfppp7Vj2BHI9qnhNHgFRtvJ+ikqI5mbhD+8bzGy6l7KF7a3rpOATQRj5/hKIS
         59p06nk156+E+gwg8H/JmahwIxSE7ybCXTjVCsY8qNRhYAmlbRd88KBbLU0zTxhjQaZe
         oHdSGHT6odYbRzVzp6sTylTqckfRhNl3FPoTA8pe847tCe9EWWzI0QAqNj3Olyl4K3OI
         jBPAhRcq3jmhfnk/J+Zs1sG/OtgxAat3ZVkxjsnWCRQFjl87lazytSjyWvScXS45L1F1
         9voQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793112920; x=1793717720;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1DehjZ5BL8d0YnBEeJuu65Ld1wB1OE7I+m9Hy0VoO3I=;
        b=n4hwFqWvBlcK2Elc0shjgKhe8Hi8Fa11C8casBIIBNQ4UDKVR68X7OTqokMq4Hf57L
         mgCqCJa3s/CG+5ZX10sUlLfMLV2DxF+G/ZZ+RUbutcUKACDfWkZievdHGS9MabfWtOUW
         daicVQiNbkJ4sjDrpkgrHzIylH35ZjrWHavxzRQBqldBbw8Kf3pnu+9kzFzDQOWdhPDW
         JjcQ51rci7JBM8LvTi6C8bOKM316twvJSX1QqbZpODLhoZBEQkZLWLNmb7RuaM15LR3Y
         mUbO/sq86gDiDWzC10w8XNEraN+I1jHPCOBlgmb7ofZ4enAFvvi+fC3pIMhktBCCIz3N
         5oYg==
X-Forwarded-Encrypted: i=1; AKwUvBzMtaUv1m+LQ+YwQubAAN0jTBtXh+7QKEXgKwtiBJ8qC/cZJgV4rlbGoLEOxj3eoFfWY9Y9FRkHUFX1pIQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIucSf6Ui/sYr15Inb8n8hgJgWurQofEHng14IAakAIQQQi1xlh
	c87CDQi4Ewj5IN9/xcU39mkVZY+5ueWnpmXu4p4coWy8C0APGHubhxDknjjoN0Z+IjEiq66/i2a
	yhb3Cfg==
X-Received: from pjtn20.prod.google.com ([2002:a17:90a:c694:b0:3ae:1810:840c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:590f:b0:39e:4c81:6c5f
 with SMTP id 98e67ed59e1d1-3adeaae86acmr7469745a91.26.1793112919756; Tue, 27
 Oct 2026 07:55:19 -0700 (PDT)
Date: Tue, 27 Oct 2026 07:55:18 -0700
In-Reply-To: <6c156bb3-a04f-4d4e-8611-b1e93359e8ad@intel.com>
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
 <741bfe7c-5d21-4c6b-98c0-95b01a2a21f3@intel.com> <auCvuyY7tTg7ISwR@google.com>
 <6c156bb3-a04f-4d4e-8611-b1e93359e8ad@intel.com>
Message-ID: <auC7VoynSWStxCg3@google.com>
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
> On 10/27/2026 10:05 PM, Sean Christopherson wrote:
> > On Tue, Oct 27, 2026, Xiaoyao Li wrote:
> >> On 10/23/2026 5:01 AM, Sean Christopherson wrote:
> >>> diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
> >>> index 271c2f94b8dd..37d088f6f7a8 100644
> >>> --- a/arch/x86/kvm/vmx/tdx.c
> >>> +++ b/arch/x86/kvm/vmx/tdx.c
> >>> @@ -2,6 +2,7 @@
> >>>  #include <linux/cleanup.h>
> >>>  #include <linux/cpu.h>
> >>>  #include <asm/cpufeature.h>
> >>> +#include <asm/cpuid/api.h>
> >>>  #include <asm/fpu/xcr.h>
> >>>  #include <linux/misc_cgroup.h>
> >>>  #include <linux/mmu_context.h>
> >>> @@ -163,12 +164,23 @@ static void td_init_cpuid_entry2(struct kvm_cpuid_entry2 *entry, unsigned char i
> >>>  
> >>>  	entry->function = (u32)td_conf->cpuid_config_leaves[idx];
> >>>  	entry->index = td_conf->cpuid_config_leaves[idx] >> 32;
> >>> +	entry->flags = 0;
> >>>  	entry->eax = (u32)td_conf->cpuid_config_values[idx][0];
> >>>  	entry->ebx = td_conf->cpuid_config_values[idx][0] >> 32;
> >>>  	entry->ecx = (u32)td_conf->cpuid_config_values[idx][1];
> >>>  	entry->edx = td_conf->cpuid_config_values[idx][1] >> 32;
> >>>  
> >>> -	if (entry->index == KVM_TDX_CPUID_NO_SUBLEAF)
> >>> +	WARN_ON_ONCE(cpuid_function_is_indexed(entry->function) !=
> >>> +		     (entry->index != KVM_TDX_CPUID_NO_SUBLEAF));
> >>
> >> I think the WARN_ON_ONCE() is very likely to be triggered in the future when
> >> people run old kernel with new TDX modules.
> > 
> > Then upstream patches to make that not happen.  Intel insists on treating the TDX
> > Module like hardware.  So, treat new TDX Modules like new hardware.  Upstream
> > support for the new "hardware" before it ships, cc'd to stable@vger.kernel.org
> > if necessary.
> > 
> > Because IMO, the WARN is doing exactly what it's intended to do: alerting the
> > admin that they are running a potentially dangerous setup.
> 
> For this specific case, does it mean every later patch to add a new leaf in
> cpuid_function_is_indexed() needs to be backported to stable?

If you want to ship a new TDX Module that enumerates features in those leaves and
works as-is on older kernels, yes.  Again, this isn't really any different than
enabling new hardware.  E.g. a kernel from 2024 generally doesn't work flawlessly
on a CPU being released in 2026.
