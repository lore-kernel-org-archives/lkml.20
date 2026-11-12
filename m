Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794503367;
	b=tbFPVHwvGsUKxInXPnRDTcc3Pm4pNbAyM5hRjUofvQGBrg0NmAlAQTO6mF7qzzv61GYG
	 CzX9rkX40ivr8F81qpWBV+fn71sLnsrkigApdT+wk1jE6k4EG34M/4xzZPwbZH2+mpZd6
	 uCUeMgZUvRniIqUo2yDUKtPhNMgDLeGdZLq5OPpTuaZJQ1vR8zkxe+lK4o4DheUg2PgJ9
	 MkiKC2IrNJ01EX42z135Mv5dH7Z6xQ72KFdT/mQJDLAQYOhZzPqTxps0VM+AuuVwmw6PR
	 gpwpHjJRFXHzVFCC3bvoJtxodh77J/SutVzj9zoREMLcQz7+7GB99uHMR7qCOkZyeVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794503367;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=XgO6TvwkTbETFKtMuKfDtt/v/BUeO0jfQ5e64t9KyAY=;
	b=l+GLx+JOxrg5+xhFflevF8XkT4z0vlVQ1F6ezSitRxYeTtBhZFN+XmczDwNIWNB64K2C
	 cBgzzR1wAQZUv5PV8b+srMZsBJAaFRo730UvAWtdF2xK7Byjhej1b8wkvbIjuK8NxqrEa
	 8vsf5Nc93ZIs2b/PPSVX2Lr2N+IzrIUbhhuY1RByQ8pz62hRgSsMZib2CBZDPqUUh7Ca4
	 h7vy/DcKvmZhF8x38MGzjbvCZ8nE/w3e5yUjyPeJbyPIwLU0geDwpA5aNts2tCEhQnswY
	 omWNEQ1KX2SW1hqy0VoC7JDDu58JTrWeHjNqaHJqCLIohGoGJwdCxs90aC44o3xSqsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Jet4S+gw;
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B51606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:09:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4B51606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Jet4S+gw
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b15e47e57fso2526258a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794503366; x=1795108166; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XgO6TvwkTbETFKtMuKfDtt/v/BUeO0jfQ5e64t9KyAY=;
        b=Jet4S+gwLGLCtxSH/m59uliIMh/vAV2Eb40A8ex8cq5/T7tOyXRa7tMbM2KAmEMLpF
         jl7FGsFUO19SQaX4XdQ6K9U47wsYXh3VyijUjVWMkgL3uEPIYgDMpZJTY3qvFlUp4yf3
         d4qhMZy7/RLBFKooSr2bsOTLaqdNlvwtESMGJit/AmdGxbTmoU44zwUpJjBFrVKTeN1H
         3GcqwKeI29EIsqASDXnHfLcvZB9r7nq8qtZ6bZcfP4TzykCHMEZOBw3j/3dDEgF/1URR
         BkjztNJVWNa8HqwKyDUInlZFx21816iWFbpzl75P9zGLTjFMrjYtZglsT0TdSxl83zUe
         TgLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794503366; x=1795108166;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XgO6TvwkTbETFKtMuKfDtt/v/BUeO0jfQ5e64t9KyAY=;
        b=QS1JedAM6uMuhuYYz31HGWsUNCuJ/WixdPFPpmbrKdfj0lr3Q3KnS6SwrPasS3++vk
         ZeaRrKqgR/hEpA77JMKpBLQS1GfkOeKzxwXqzCAf7EOVhh43JuiszHd1N84S/Pe7dEKY
         yttab5eHA5wxkr4xuWjHXIPQC+iQmT6TIEfjEFpwSWcLvV97e7nwmYkQBHdHyJKRzSjx
         mPW8qYKT0dKjHEsvWw+evz/sK5gdGYCzbsffRrOJ81UnTZYJH/z6z3nbvq4MXwWVZcJy
         WkEQZ/A/XrN36seo2wlu/XeLab7pOROwdbJIGM6+6BwS3Sa4F58bnO6HMfsMOzOyleue
         lpVg==
X-Forwarded-Encrypted: i=1; AL+hErHMmrDkOyEx3jRszgjWg5KmtevkeemPPkAoy8T9ecHZ3sjBw3vdr1Pdx6WdEQ7u1Nsl4Sbzpu/wzT1YahI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/OzyUCXDxsvdtcmF2uXi5N+BVRgz5TmdBC5P8vHj+VMuqwa4Cv
	m/fQLHhLinBEIjxIaEcOIDpEjtKi2bS6QZ8XdgFrypruB1kl6Ro3+vdIaB3swsA650qU3YDhjxX
	5gz7G8w==
X-Received: from pjgo16.prod.google.com ([2002:a17:90a:4210:b0:3b0:a2c4:246b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2ec3:b0:3a4:b0a1:c7ed
 with SMTP id 98e67ed59e1d1-3b182eebe02mr6104935a91.13.1794503365644; Thu, 12
 Nov 2026 09:09:25 -0800 (PST)
Date: Thu, 12 Nov 2026 09:09:24 -0800
In-Reply-To: <3d4804e9-3e5a-447e-8a54-8fa5d1c28f5b@intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261106013927.166209-14-zide.chen@intel.com> <au491iiV7koeP0t6@google.com>
 <f20b59bb-a3c6-4129-ba61-5cec4d975601@intel.com> <f12bcb27-9c17-4b8c-b48c-c36a17e70ab6@linux.intel.com>
 <5f129d63-10c6-414b-86a9-a604e42038ce@intel.com> <51089074-1be0-47e3-8d53-732ca33f29a2@intel.com>
 <fceb4f61-621a-4d62-a648-a1cdd0de1671@linux.intel.com> <970e231b-c3ce-4159-ab27-ac371426500c@intel.com>
 <avSLss14zigMfUww@seanjc-mac.roam.internal> <3d4804e9-3e5a-447e-8a54-8fa5d1c28f5b@intel.com>
Message-ID: <avXyxMgGzRBGbBN3@google.com>
Subject: Re: [PATCH v3 13/18] KVM: x86/pmu: Populate CPUID.0AH:ECX
 fixed-counter bitmap
From: Sean Christopherson <seanjc@google.com>
To: Zide Chen <zide.chen@intel.com>
Cc: Dapeng Mi <dapeng1.mi@linux.intel.com>, Yosry Ahmed <yosry@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Peter Zijlstra <peterz@infradead.org>, kvm@vger.kernel.org, 
	Jim Mattson <jmattson@google.com>, Andi Kleen <ak@linux.intel.com>, 
	Stephane Eranian <eranian@google.com>, linux-kernel@vger.kernel.org, 
	Mingwei Zhang <mizhang@google.com>, Das Sandipan <Sandipan.Das@amd.com>, 
	Shukla Manali <Manali.Shukla@amd.com>, Xudong Hao <xudong.hao@intel.com>
Content-Type: text/plain; charset="us-ascii"

On Wed, Nov 11, 2026, Zide Chen wrote:
> On 11/11/2026 9:37 AM, Sean Christopherson wrote:
> > On Tue, Nov 10, 2026, Zide Chen wrote:
> >>>>> KVM's principle of "not policing guest CPUID" means KVM allows userspace
> >>>>> to configure an arbitrary guest CPUID without rejecting the ioctl or
> >>>>> mutating the vCPUID entries.

...

> > Just because we *can* do something in KVM doesn't mean we *should* do that thing
> > in KVM.    
> 
> Got it.
> 
> >>>> - Features that actually need host hardware support need to be checked
> >>>> against both guest and host PMU capabilities.
> >>>>
> >>>> I'd propose something like this instead, leaving pmu->version unclamped:
> > 
> > Why?  What real world use case is there for KVM actively supporting a PMU version
> > "greater" than the underlying hardware?  E.g. emulating AnyThread deprecation is
> > (presumably) easy, emulating *all* of v5 on a v3 host, not so much...
> 
> Got it. I can think of a few discrepancies:
> 
> For example, the guest is supposed to handle Freeze_LBRs_On_PMI (legacy
> vs. streamlined) based on the guest PMU version. If KVM emulates the
> legacy behavior, but a v4+ guest expects the streamlined one, it may
> run into issues.

Well, yeah.  Because I'm saying KVM should *NOT* support running guests with a
"greater" vPMU version than is present in underlying hardware.  That's nothing
new; KVM rarely emulates features that don't exist in underlying hardare.

KVM doesn't generally enforce the virtual CPU model presented to the guest though,
because (a) userspace can do all of the same checks KVM can, e.g. by validating
its configuration against KVM_GET_SUPPORTED_CPUID, (b) adding that validation
in KVM would require a ton of code and create all kinds of ABI issues, and (c)
there are legitimate use cases for exposing a virtual CPU model that appears to
be insane/nonsensical.
