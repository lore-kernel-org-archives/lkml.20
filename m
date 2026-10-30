Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793377705;
	b=qLNz+bM22AgsrBfguRFdplsgQJ04yyZn4uBsq8bTbbNOehM4756npKszSi/P5txojmah
	 1pHJGg2fyJtyAHzLoMdHDAxobi4Ax2iJd/etL6ji1AsNsfQvDgWcXTIt6+li+DSZOlGzY
	 KkfSnh08XbiTID6FvaPn0bUhQRZZEnwpuI0Wpq2GoQDHfOsNwjDTtQ9bhXkuumEMsRMlN
	 1F30f23qczKRh2O8NkfIXkn/tBKsabPGrW16p9JH8ehl3NnXr9bCh5+b2wkBN3cMwdmGy
	 zWpA0ieqgQ8lcVxPlNUiFB7xuEgH0hU06mHVAH6QP7RBcKqdYv/oWQhP6qT6zdPRlrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793377705;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-version:Content-type:Content-Transfer-Encoding;
	bh=zK67Y4b2DOq0P3AA25tQ78azoXocIOXbPIU+g9MOBt8=;
	b=GQ/Fa3B6iVeQb3++w/5NC5COgKkpRxSGcIETkKGkWpzcjsgNtzpmkZQkmEsI46UK9sGT
	 hKwV1KRT1mTGEYULOFtzN2QHVHUXmbseJr0TUIa5RJjS6WzE2SKfDy/fNVJr/hDey/kVi
	 OaWSexPDi6GLT+gZWWjxrrhYxDJT0Agr5tFF+Q6nTJ1ITjUTGxJsqnpnczPAfwkn9Oh2j
	 5zhI7mHSuifw2zzwJxpLKPD+df7B0HcZGnUQRdd/BqHKsCiqyaVee2iK3QZ17hpStPzCw
	 Mcs3BV5N12tqwoBCa7xIxWzC0fthh+l28NP3CbkQ2C0fmjgjFQOUAt4R9FBvxYrO4vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r0N+p4Od;
	arc=none smtp.remote-ip=209.85.167.172
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91014606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:28:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91014606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r0N+p4Od
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-4f699fe49b3so547843b6e.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793377704; x=1793982504; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :message-id:date:in-reply-to:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zK67Y4b2DOq0P3AA25tQ78azoXocIOXbPIU+g9MOBt8=;
        b=r0N+p4OdMNKfJ+dsyf7PmtuOCwCNLk7J7g3YfW2VBMZHgAR5VqcLuhp94yqCPAU/fn
         hU77ti9klEu1+z94Mqe8oNCRsZnB+OAvPesyU7U58Cso3VaEt70HYi2OUNKa5KhR0+cy
         FXMyjPux9MmpxOIHgUhl1whquFTYSOaMBMnT93pC6nCRFu2zaHH/+5y0y5M7E4ysebjQ
         TkOLIA2OyLPYnZ5P9vKNlWgGy9WW7LvAaO4/1VVhzItp8LUUP4RY4AtSV6xmY8j4PfOw
         NXWmGhpHbvEHrHlxLymEoDeqd8S/OmksLEjoLNliuNS2DQQyrCbMjbKTD9oKGBAuex6I
         3cbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793377704; x=1793982504;
        h=content-transfer-encoding:content-type:mime-version:references
         :message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zK67Y4b2DOq0P3AA25tQ78azoXocIOXbPIU+g9MOBt8=;
        b=Kt2d399pXV6AU0vjHiDqZj3F3pRIjBLvuThbjrCieDT3nBOLwjDwLYzRVgzvK3pdNQ
         kT0Z9J7oXMW6oCVybPk/2Ctz/+Dq3uqgg2cnUzSDosARvE2IDRWIZYoSIXOhyq4PRa0V
         yqp6JAgrNqkMsOVRwGS/SJiepF9gHc3BIS9HVEEJebaNNQShjfwmDn67P/Fq5tTEFAMt
         yptGDgNlMMJxFg1yJqvuPsCbBp+Lj94g2c9H+7xruORgpxQsNqaS3xEYE0RzOgVAs39B
         O1kK0IrZKFgKkLhP0OQFHp6u7X+MRnVuS98SwJxRxCZA/dpkvum6iy0eS4Fyj2uRDBxZ
         5oSQ==
X-Forwarded-Encrypted: i=1; AKwUvBy+xzACdIvAqOFRuzrmgDQNGdgmlA/rydGpWx/OP62Iv8WuxUvwghRJ00jGSIfGBBw+ucq+Hi6OF+9aHXY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJIr/09pa1rl0L7yUzD0Py05uzJ2tUW5DwUi+ApGtzt0bJ7mbQS
	P+KT0/7DxkF5DFGtPi8/NuKVqO6fi+IzpYAGMcEZfYw3vMmEv8W9qmie
X-Gm-Gg: AYBFou1kiZEqoh7HDGxBzUNrpS3TBG5+KHQSVwkp/srv5rybgQT5asPXpqSnVXF0wpm
	RkJXHZTZdeCyKmCCcD1CXADsgPrXwHVvTUzTxB2FZfzHsvwFFE1/mLRFULWLT2ptQfNxlTd+qd9
	aFg5PJBnlTPuQ61PQhSKTwR8TyeiKGdBK9WAZXmed9C0u92CE4EECMvFniC1m1Vn0NFRPT+MEbE
	f6heaPxoWjB3rX30KsW9FsK6FUUnH1QdOHmJY/M20rjsJc7d3osg7pcTgZaDyTOuJb1RfdLTPht
	54XH+BoIqjByM4d9rkXWfNmtTFW+b3hKZW2mI8CCEr1WvXJjXvZDnoInSYfEIidOg36z/BvNogs
	U7ALOGGE56HRaplSJWVITnKjNPeVzzg/UqfskGpt+wi5MoSkEhoFRN2Q3zjGmA6gAazjYw76CLS
	ve2cHidUKbYsA/6wTNgfG5d96fCz+ce9QAmoYxgLvBgDjQHt+LV4nepkmoRSCJQ82sMuEUqeUtI
	YCRZsVQ0+pFlhNqa5VTXINuiB5WDvOjytFu5v3iRO7bgy1nPDl9WWEFF4D2JWLXc1LygOnViV/o
	S+XmDblcAA4ZYO7bg1eDjXfaOH1AoO+ltMKsO+OmUn5prF53FQ==
X-Received: by 2002:a05:6808:f13:b0:4f4:813c:6a21 with SMTP id 5614622812f47-5640dcb87admr1936746b6e.20.1793377704392;
        Fri, 30 Oct 2026 09:28:24 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fe0d46dsm1916622b6e.11.2026.10.30.09.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:28:23 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>, Narayana Murty N <nnmlinux@linux.ibm.com>, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, chzigotzky@xenosoft.de
Cc: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org, msuchanek@suse.de, harshpb@linux.ibm.com, gautam@linux.ibm.com, amachhiw@linux.ibm.com, venkat88@linux.ibm.com
Subject: Re: [PATCH 1/2] KVM: PPC: BookE: Disable preemption before loading guest FP and Altivec
In-Reply-To: <2a75097f-6b49-456a-bfef-d5e559ce719a@linux.ibm.com>
Date: Fri, 30 Oct 2026 21:51:41 +0530
Message-ID: <33tnw44q.ritesh.list@gmail.com>
References: <20260928110411.844582-1-sshegde@linux.ibm.com> <20260928110411.844582-2-sshegde@linux.ibm.com> <9d83e196-4d6b-4be1-811c-eb72527d3cdd@linux.ibm.com> <2a75097f-6b49-456a-bfef-d5e559ce719a@linux.ibm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Shrikanth Hegde <sshegde@linux.ibm.com> writes:

> Hi Narayana.
>
> On 10/1/26 4:56 PM, Narayana Murty N wrote:
>> Hi Shrikanth,
>> Thanks for the fixes. I had one question on patch 1.
>
> See response below.
>
>> 
>>> diff --git a/arch/powerpc/kvm/booke.c b/arch/powerpc/kvm/booke.c
>>> index 13ad4cf5fa71..5b9118eefe1d 100644
>>> --- a/arch/powerpc/kvm/booke.c
>>> +++ b/arch/powerpc/kvm/booke.c
>>> @@ -1404,10 +1404,17 @@ int kvmppc_handle_exit(struct kvm_vcpu *vcpu, unsigned int exit_nr)
>>>           if (s <= 0)
>>>               r = (s << 2) | RESUME_HOST | (r & RESUME_FLAG_NV);
>>>           else {
>>> -            /* interrupts now hard-disabled */
>>> +            /*
>>> +             * kvmppc_fix_ee_before_entry() marks the software
>>> +             * IRQ state enabled while interrupts are still
>>> +             * hard-disabled. So disable preemption while loading
>>> +             * guest FP and Altivec.
>>> +             */
>>>               kvmppc_fix_ee_before_entry();
>>> +            preempt_disable();
>>>               kvmppc_load_guest_fp(vcpu);
>>>               kvmppc_load_guest_altivec(vcpu);
>>> +            preempt_enable_no_resched();
>> Would it be simpler to move kvmppc_fix_ee_before_entry() after the
>> FP/Altivec loads instead?
>> 
>> The normal kvmppc_vcpu_run() entry path already loads the guest
>> FP/Altivec state while interrupts are still disabled and calls
>> kvmppc_fix_ee_before_entry() immediately before entering the guest.
>> 
>> So could this path follow the same ordering:
>> 
>> kvmppc_load_guest_fp(vcpu);
>> kvmppc_load_guest_altivec(vcpu);
>> kvmppc_fix_ee_before_entry();
>> 

Thanks Narayana, that actually make more sense to me.


>> That would avoid making the software IRQ state enabled before loading
>> the guest FP/Altivec state, and also avoid the additional
>> preempt_disable()/preempt_enable_no_resched() pair.
>> 
>> Thanks,
>> Narayana Murty.
>>>           }
>>>       }
>> 
>
> I thought I had put that for discussion after ---, but looks like I forgot.
>
> I don't mind the above too.  but I didn't have a way to test it.

Actually I agree with Narayan's reasoning here. 

Sorry for being so late to the game. As you know we have been occupied
with other things internally.

> So kept it as is based on what Christian said works for him.
> If you have a way to test the patches, please let me know.
> We can try that too.

Let's ask Christian directly :)
@Christian - Once we have v2, would you kindly help us test that
please?

We think the other approach which Narayana suggested might be a better
fix for this and it can avoid preempt_enable/disable() dance. However,
looks like we may not have the board where we can reproduce this.


-ritesh

