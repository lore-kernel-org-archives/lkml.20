Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793745885;
	b=1vSUO1VHVx+H84fcbiexdi/kHVStRod5VRCdS4a8z0hG8L/e2OhAlNTclzi9NZHGeLPU
	 MKqcR36XUkE8rslA151lCE856XK9djFmzeylmRUEzOVFrUa0Rx8GkLKDhr8tBdeLGvLHz
	 u14ICxoa3t9zZWZsts5La4mJfC9zd6vhJPYfnjEVubWEHNhPULqBA87vZRfWGTmu4w0d9
	 Xtfa1qre8LtFOIwwvh9QUoF9XZw/NZN6mKxDWyF/3NeCnLCmOw2sfKBn/4n5RGEAI73vQ
	 EU1bidGRFqJfsfDSdOlrybBZvtdyhvpHo4kf7GxEMsKSGzYC57racsdQ8h9WgpA1q2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793745885;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=iQtzjbe3O02H3OFthMIsjdIhhqpewpQBZ0rdLPfNrL4=;
	b=wfdFlNoydqNIf6wLUqXRuPogVDQOexhvtu8TvjDRBFynA/97bVuJ6N1CghzGS0duPZwU
	 vubdTFsGNEAYjEtlcxFJFlLAJP5HgtR7sqiNnmbYc2suJYzeTAc3LY067QMrnllvV96Vh
	 XPnZ6LHscABB3ICtYpyqE/W86GkRVEb81YsZNcZm21r/UPyqP0ANYOAs9DKaXbiDqzRch
	 Oth+xCcwKW6zhYlgcHIRsTP0w5oqqfpQNtoj4BV3H4puv57mfQJDjF8yFxHFVIIrFH2zs
	 coPTRSph0tms5qUs1g/wDWjUNtFqIEpfqzNpDq25i5eFw7dhv4ykIbGOrG94MlZ8fEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=E0ftTbsO;
	arc=none smtp.remote-ip=91.218.175.3
Received: from mta0.migadu.com (out-3.mta0.migadu.com [91.218.175.3])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539F7606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 22:44:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 539F7606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=E0ftTbsO
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=73Uz4+FoggH8ABnZoandSEx4s7s1y/hPxpGeh/WKurQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793745881; v=1; x=1794350681;
 b=E0ftTbsO+O8fexgcVgZERklZ8+p6E3xW6VH3LWINcPNibIgoeEPbVnDxuxP268/P1c4BuR7m
 wqHlDtmcb0LW6LeFGe7QXg9t/3uz5TUAV/SldSYjAYtGlI8OIoRWMntsMx35b/bdmK9TqgtvvVL
 JDYwMEGxI4wtt5f1sp1bsaew=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0aaa0554efb7325b;
	Tue, 03 Nov 2026 22:44:40 +0000
X-Mizu-Trace-ID: 0aaa0554efb7325b
X-Migadu-Flow: FLOW_OUT
Message-ID: <5027b93f-e6a8-4324-b96c-5ed6f941ca99@linux.dev>
Date: Tue, 3 Nov 2026 22:44:34 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/lib: Use REP MOVSB for large memcpy() on ERMS CPUs
 without FSRM
To: David Laight <david.laight.linux@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Kiryl Shutsemau <kas@kernel.org>, bp@alien8.de, dave.hansen@linux.intel.com,
 dsterba@suse.com, hpa@zytor.com, linux-kernel@vger.kernel.org,
 mingo@redhat.com, terrelln@fb.com, tglx@kernel.org, x86@kernel.org,
 hannes@cmpxchg.org, riel@surriel.com, shakeel.butt@linux.dev,
 kernel-team@meta.com
References: <atCpTMcAALymqADw@thinkstation>
 <20261017192727.2760919-1-usama.arif@linux.dev>
 <atiKeB-76nOj-ztU@thinkstation>
 <CAHk-=wh+dyDPs2kp=KoUiCYdk2MBBqzTKYbrkAyOMV9Z1XNu0w@mail.gmail.com>
 <20261022094958.13aeb5c0@pumpkin>
 <5f6fa235-55bc-45c6-90a8-20f75152e9f2@linux.dev>
 <20261103083238.672cdfa5@pumpkin>
 <77b8befb-e3dc-4a3f-ab30-b6c85bb90f94@linux.dev>
 <20261103221325.789ff51a@pumpkin>
Content-Language: en-US
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <20261103221325.789ff51a@pumpkin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



[...]

>>>> diff --git a/arch/x86/lib/memcpy_64.S b/arch/x86/lib/memcpy_64.S
>>>> index 12a23fa7c44c5..407b226d4de2f 100644
>>>> --- a/arch/x86/lib/memcpy_64.S
>>>> +++ b/arch/x86/lib/memcpy_64.S
>>>> @@ -31,24 +31,27 @@
>>>>   * which the compiler could/should do much better anyway.
>>>>   */
>>>>  SYM_TYPED_FUNC_START(__memcpy)
>>>> -	ALTERNATIVE "jmp memcpy_orig", "", X86_FEATURE_FSRM
>>>> -
>>>>  	movq %rdi, %rax
>>>>  	movq %rdx, %rcx
>>>> -	rep movsb
>>>> -	RET
>>>> -SYM_FUNC_END(__memcpy)
>>>> -EXPORT_SYMBOL(__memcpy)
>>>> -
>>>> -SYM_FUNC_ALIAS_MEMFUNC(memcpy, __memcpy)
>>>> -SYM_PIC_ALIAS(memcpy)
>>>> -EXPORT_SYMBOL(memcpy)
>>>>  
>>>> -SYM_FUNC_START_LOCAL(memcpy_orig)
>>>> -	movq %rdi, %rax
>>>> +#ifdef CONFIG_MITIGATION_ITS
>>>> +	/*
>>>> +	 * Returns are patched before alternatives. Keep the replacement
>>>> +	 * return in the first half of a cache line so ITS retains its thunk
>>>> +	 * when the instruction is copied to its final address.  
>>>
>>> I'm not 100% sure what that is about, but does it mean that the cache line
>>> alignment of the code here also matters?  
>>
>> Not the alignment of __memcpy() itself, only that of the replacement in
>> .altinstr_replacement.
>>
>> On ITS affected CPUs, a RET in the lower 32 bytes of a 64-byte cache
>> line needs mitigation, so apply_returns() leaves such sites as a jump to
>> its_return_thunk, whose own RET is in the upper half, and turns the rest
>> into a plain RET. It runs before apply_alternatives(), so for the RET in
>> the FSRM replacement it decides from the replacement's address, not from
>> where the code is copied to. A plain RET could then end up in the lower
>> half of a line in __memcpy().
> 
> So the RET in the replacement is in the first half a cache line- so becomes a ret.
> But, unless __memcpy() is aligned, the relocated RET might be in the second
> half so would need mitigating - but you copy in a mitigation-free ret.

It's the other way round: a RET in the first half keeps the jump to
its_return_thunk, see cpu_wants_rethunk_at():

        return !((unsigned long)addr & 0x20);

So the copy is the thunk jump, which is safe in either half.

> 
> If that is the only mitigation then wouldn't aligning memcpy mean you could
> just use a ret (possibly followed by an 'int 3' - or whatever is the 'flavour
> of the month' instruction for stopping SLS).

It isn't the only one: with the retbleed, SRSO or call depth tracking
thunk every return needs it, so the code has to use RET and let
apply_returns() pick. For ITS alone, aligning __memcpy() would save one
direct jump on FSRM CPUs with ITS (Ice Lake to Rocket Lake), which I
don't think is worth it.

[...]
