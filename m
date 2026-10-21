Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792584320;
	b=x9nEJXynjSWiIokWaFGAqXYPC14MpJGjHCQHVjfmyYa1WfbssCFsPW6sBmMbjx4S5DZi
	 SJeDU2TsCwwSNhxiC1gXq2vweIvN+fLO6/CrEMgqVv+2KHTHV+QIhrEsSd5mzAk6E2mk1
	 IEXHr1RPSvtspajHTMG9XkFnW/buPbeFtcOYD11mXIopSaS+JcoXwVEYoPnWJPazp53ZZ
	 F3EZFJGnf0jpGXk0Y2NkhzteR7Dgg4wL2E8emm8eWLdBaUYsYtQCvUX66eLy2tjAd2q03
	 2Dkf+E/41DQedoUoaCqdr4AEd3lg3gEpBN3mFWekvMXr2jBo5anu6GffwQ3MiK5e88g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792584320;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=+s62Nwi08QqpXclEg6GElt8WEM0xJQibTaa69sU+UYk=;
	b=ajuvCw+uBBYjpmHKKX0tcrxlTR90DlFwolF5wvNoxcMdE3BcbFnCscafrx+o5aLq3ie9
	 Tio36G9lgbKNFMib5y9mI7TPnQsqUsJnWMfBPo0a19WRFrxxiHkhOnBNWoiNR18IdOnUE
	 EdJ7JgU6Qq9Vw8SzNKSRPZomHddLaha1fXCTEnuwrdfOU2oo7hsYq9d0mae7FxY0PbXjc
	 8qhyJTRT8bQr8Rq/ruYl2djpp90vuDM5u6mtBIrQTr3rg7lS2cEHmGcVD1+we7dC9ZDj0
	 LX5tYiP7op0gLIwjoyk18XrX6+wWf6CChD6ZrF0QBVZgd0PgrINv6wvc8FZGhEiF9NQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=rqvvk7N+;
	arc=none smtp.remote-ip=209.85.210.198
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567D6606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:05:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 567D6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=rqvvk7N+
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-887c99013edso477718b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792584319; x=1793189119; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+s62Nwi08QqpXclEg6GElt8WEM0xJQibTaa69sU+UYk=;
        b=rqvvk7N+vzmicoIaOSEX3Dgwlnavaum77hFxubYNxlTUgkAZ0mNHWUI2Q4ojn+AJG5
         oGaut4zxT9D87hq0InjuObaBmzaJbSFfocOuNeFGyLHFkiZTKf7tLqm+xFWfi5+a05We
         l7LIdZVLijGqEyAqH2q6vp+sNVQjJoYJq+mGRtIfH5ZqqSch5XcGj9NVjjQBVuQNn8Q+
         jhhi1WcZ044NdALzo9N4gW3T3wxwY9U4jsyMqvEQlDyZbN9ZNsl3EFEsS9KQLpJX5Or2
         Zcwe4WUAgP0HNdg/8IbICkJZNiIu/jjwJcVQXkcV0WT5F4ixOBqzIrLt3WA9G6TOjaTD
         XhEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792584319; x=1793189119;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+s62Nwi08QqpXclEg6GElt8WEM0xJQibTaa69sU+UYk=;
        b=PYTG1ogVq3Y7rHfli3JUT7nZyNEwhrcAEFrZL2BBvUTAnONxkkE2Qju2iwtR+FDzkT
         ld/6TB2+Do3vCqf7CQvlLWc8fYIEZcYakqKlsDN8BlEpyQu0s70fbKq62VNmFF7tLkF3
         c9g/TRXjk9jXkuvrapL/e5EC8UUohkABLvFaUzAusBtvWk2kYFdvI+TN9ySjyYGn+1XT
         5Dc0QwguFC+RnB5vNyUqHzVdWgterD3RTlwLTf0vOj/gDtqB9iJGVebaYLiXbiR2pflx
         qPj4PWAjLkp3HCYp7RTMfqHW+RCVUuzN+gJ3dP1QqV/IpjA36xJzYrmIBebUuKzXSH9D
         a6Ag==
X-Forwarded-Encrypted: i=1; AKwUvBzLpYUIcfyil3w86kS5qHgEAaiqXbvj24fOyDAwh+v1jWe6KfV2PeX/MfJYCwF6JmqfDTQZNgSC6kXuvrA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJX8PDXa4ojSonpa/Ena0IhDTgIWXmZULpSoixL9HTOV+8sduEN
	09d28rYpWH7/F+kFJuK7c90Uk8rsCRKb5F1kYs+AVIM/DdxBh/4QE4FZrPD1FSgneGm27GrZXEH
	KnAt44A==
X-Received: from pfst24.prod.google.com ([2002:aa7:8f98:0:b0:8a0:7acb:abae])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3ccc:b0:89f:feb6:5d5d
 with SMTP id d2e1a72fcca58-8a089d465bemr1396796b3a.33.1792584319027; Wed, 21
 Oct 2026 05:05:19 -0700 (PDT)
Date: Wed, 21 Oct 2026 05:05:18 -0700
In-Reply-To: <17ae73e9-c460-4ffc-9fc0-5fe2e8e1a08a@tum.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <f1f39118-2e1b-476b-9a84-ef7d56412bdc@tum.de> <atfxm7Tj7nYB_6Kr@google.com>
 <17ae73e9-c460-4ffc-9fc0-5fe2e8e1a08a@tum.de>
Message-ID: <atiqfqmzRhrlLGHc@google.com>
Subject: Re: [PATCH] x86/hyper-v: Don't WARN on VM-Enter if eVMCS sees
 VMFUNC[63:32] != 0
From: Sean Christopherson <seanjc@google.com>
To: Manuel Andreas <manuel.andreas@tum.de>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, pbonzini@redhat.com, 
	Vitaly Kuznetsov <vkuznets@redhat.com>
Content-Type: text/plain; charset="us-ascii"

On Wed, Oct 21, 2026, Manuel Andreas wrote:
> On 10/21/26 00:56, Sean Christopherson wrote:
> > I think the WARN is correct, this code is broken.  Unless I'm missing some eVMCS
> > magic/quirk, this, and the secondary controls check, should be conditioned on the
> > field actually being used.
> > 
> > This, over two patches?
> > 
> > diff --git a/arch/x86/kvm/vmx/hyperv.c b/arch/x86/kvm/vmx/hyperv.c
> > index fa41d036acd4..a1daf8f2ec5a 100644
> > --- a/arch/x86/kvm/vmx/hyperv.c
> > +++ b/arch/x86/kvm/vmx/hyperv.c
> > @@ -169,7 +169,8 @@ int nested_evmcs_check_controls(struct vmcs12 *vmcs12)
> >  					       vmcs12->cpu_based_vm_exec_control)))
> >  		return -EINVAL;
> >  
> > -	if (CC(!nested_evmcs_is_valid_controls(EVMCS_2NDEXEC,
> > +	if (nested_cpu_has(vmcs12, CPU_BASED_ACTIVATE_SECONDARY_CONTROLS) &&
> > +	    CC(!nested_evmcs_is_valid_controls(EVMCS_2NDEXEC,
> >  					       vmcs12->secondary_vm_exec_control)))
> >  		return -EINVAL;
> >  
> > @@ -186,11 +187,10 @@ int nested_evmcs_check_controls(struct vmcs12 *vmcs12)
> >  	 * controls in bits 63:32, i.e. dropping those bits on the consistency
> >  	 * check is intentional.
> >  	 */
> > -	if (WARN_ON_ONCE(vmcs12->vm_function_control >> 32))
> > -		return -EINVAL;
> > -
> > -	if (CC(!nested_evmcs_is_valid_controls(EVMCS_VMFUNC,
> > -					       vmcs12->vm_function_control)))
> > +	if (nested_cpu_has_vmfunc(vmcs12) &&
> > +	    (WARN_ON_ONCE(vmcs12->vm_function_control >> 32) ||
> > +	     CC(!nested_evmcs_is_valid_controls(EVMCS_VMFUNC,
> > +						vmcs12->vm_function_control))))
> >  		return -EINVAL;
> >  
> >  	return 0;
> > 
> > 
> Looks sane to me. However, I still don't see a reason for this being a
> WARN at all, what exactly is the intended signal here?

That normal, non-eVMCS VMX added support for a VMFUNC operation that lives in
bits 63:32 and thus nested_evmcs_is_valid_controls() needs to be updated to play
nice with 64-bit values.
