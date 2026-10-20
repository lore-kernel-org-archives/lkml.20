Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792509745;
	b=lJobkIP8glynOJ2K3nlYCgBXI9kyPen9lL2lsY0lsVW9jqFGtF2i7nAY7N5w/2nNo5xt
	 K8sKM/5nron/0RbArsjZJUYt323950nTzC6wdIas1FoxEKBqsD4QOl610cKKWSqlftdOk
	 O3BdLQ31Wd67pnRTcaHYkERCrEVCnsS9qJqz8732RJVp8gqXgiQXcKfVqsjd58mHzQTn8
	 nBtiWEf6bVUTsadbEvKESR5QCHKHdjlziE9gPr+fkOBTKebN72DnyEc4/DS3mKEQRpaq/
	 /nBSTfnXGgUT9Gl/QY6zIynQBe+fa/MWqSWfgwjG0J38udaHTVVJXaYIFT2xilt1Ivg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792509745;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=1OFWhAnG0uX3M8SO01mnqBorDPvWn0GK7g4t/4Hg8xo=;
	b=wfxyjCsm8OK5g5Curo8Hb9WYkWkbOqhf98BAhYs89gN5Yv3iL9vv/Zc42KzR3puC0g28
	 4B7GNJtf+Vgm+w1nK1nEAyLaY5Q+NfHr1wTi3DM9vSha7CHoe1/rqE31l3s+DN+UbRWP4
	 6rkO+q22Ntcw/wnVV10BL6suZyfLV/dCDtoYNuFtivp6pWKOzWLN8SLtXjUDco2LzH0G2
	 Q2MO2KyaCGXPtKZTZPCdqZQsGPpmdaMQMD2eX1n6z0lUz1Sk8AJRUBQ55CjCE29iWPp3P
	 94uFmCoQxWBSbEApcMC3zuagn3fIScS2WmO8wyfloqy3cnw2AMbbI0iSuv7V/FUTjvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=bfJCTxYE;
	arc=none smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1438D606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:22:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1438D606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=bfJCTxYE
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6ae27f06c2fso5782056a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792509742; x=1793114542; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1OFWhAnG0uX3M8SO01mnqBorDPvWn0GK7g4t/4Hg8xo=;
        b=bfJCTxYEOq9839j1OvJGohqpBOX2kV1z8nWN/s/anteaeEJXo8GCIrah6d8IeCt2Kc
         dI1WujdE50qu59QzskwEuuUgkkazr/UcBFPzf6GNOmTXHVLojhapmI6yDHNmUn776snq
         ILZZBADmpcf40Q7UJeIs2KyP7/Pj5DMqJ3vvU5plkk5BWk4nP4gvZ8LS+2pw+9WfXhJz
         obKMM/GRMdj2/UzwRoulkwlmKvPHWDEmsFmTqu7HloU/zjOilhAkMSI8E5obFuZaKgpv
         rERoPComi2SLDeOExSXdHPxCsQ+c2ZQ+BNCZIOE4cFncLMEFkdt5fXKuOK5s2mpHnjaZ
         WYjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792509742; x=1793114542;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1OFWhAnG0uX3M8SO01mnqBorDPvWn0GK7g4t/4Hg8xo=;
        b=Uk3GdEiJ11PRNIM7O4RPVsQMwsoawVp0c8RUnfpDE+jxgff1h8djBOzq5aMz2T4usE
         snUNAGPNvbr1F/RU++zQHLiUpjRRNn5CdWMTJe1UmJrcYthtGcxBGloi2QQe8cLo5Tyw
         mtO4BH/zIWohuJFG4FfbYt8KouO5E7SzR6hAOwzOoggyjpvQ2xz8+HbRsTGiY5UEO2qw
         pQ6eF3vFDC4Js7I0KAMuhwXnD6x8sEhNJZXHa09ouYuTQnYKDToEGtD4KENLohCQon0z
         alDX6uEa1IJYhNiw3l1N6VYFkdr0f9+h7xtoAqCnCoAwbeuNO9mNRjxyddPpolbJW7LG
         WB2g==
X-Forwarded-Encrypted: i=1; AKwUvBwnMa6az8VvzvhkDxpveAeU9nToutSUkiFcx0Ce/GJ551B8xJCa9k+bDodwRiWNvhHCyPO1wtxhA5Rze+s=@vger.kernel.org
X-Gm-Message-State: AFq9FYKqyHy6hflo7/gY4w2+W9d8zvC4V94XsxLnFRG/jXlgKsI4EcJy
	MJqAq+LYEmusK76FOhdRaTkw5uUo0/Q/7YqUBWvXEK8olvmsv48bZXFqxQ/elhagT2s=
X-Gm-Gg: AYBFou0WdeGDXApF1YrFoLWteO6rNZd3RB7cIfTg3xBybQSLBJH3Zrz5Gn8FgrtbaWq
	eN2lfw+aDC5TXggBHGe7AyemaFB0kfMySRIVo3bpc1elg6kqd/SM5yD/JWmzG1lg9tRVJCrW0ss
	q5JOEElxeOjlKdh1E7mPHwiC/Rm7JGa0Zm2P+Y0k6lELZKFMFZfHi8gLVGCh8SrGTpRE2B5s2jU
	IgMwEwS4A3qtZyaWqHgv0UrWN7cPm5boyBYmthyrPULG9IjZlk8Tzy3H424skwgvlx5+FBa97sO
	mItw/oMQkiN4znJvYGrK+wVtTmfNAhPcSGu/rGubxy3Sz0HQuhel4Pypss/Fr0tuhaSJbOf8lcI
	VAtx/uXgcMRH460+VVZPKqByPNh1u5Yjg6v/gmo8o7jqW+xzmFvNBvMRrhTRJ9vRPq0WB8FraAn
	WLZKmwOtvk1VHW3EGhR0ySAouuULB3kkSjnJzPKyIUYwl9VByAolFTauJJb4MWzR58LaHlkYHEc
	SDUk1rcV2mc8iVudUHzMHNzoLKBZ2ydXtH1Bh+XlYbuFw==
X-Received: by 2002:a05:6402:3216:b0:6ac:9a44:d412 with SMTP id 4fb4d7f45d1cf-6b3a81a52e1mr7204114a12.7.1792509742360;
        Tue, 20 Oct 2026 08:22:22 -0700 (PDT)
Received: from ?IPV6:2a07:de40:8100:0:89a9:fd0e:583d:4a53? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d80feb1sm7129919f8f.12.2026.10.20.08.22.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 08:22:20 -0700 (PDT)
Message-ID: <f7fe0439-d123-416d-b6fa-27a6dcf25d39@suse.com>
Date: Tue, 20 Oct 2026 17:22:18 +0200
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
Subject: Re: [PATCH] module: Fix use-after-free in module_put() tracepoint
To: Aaron Tomlin <atomlin@atomlin.com>
Cc: mcgrof@kernel.org, da.gomez@kernel.org, samitolvanen@google.com,
 linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261019034857.654569-1-atomlin@atomlin.com>
 <a5e66dc8-155d-4eb1-add5-8c182879cefb@suse.com>
 <4ex7fuogdtmtxil4i2bzx3yqnkqgb2x5wxysqpwapauohmcok7@jvaytjn5fo62>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <4ex7fuogdtmtxil4i2bzx3yqnkqgb2x5wxysqpwapauohmcok7@jvaytjn5fo62>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/19/26 1:27 PM, Aaron Tomlin wrote:
> On Mon, Oct 19, 2026 at 10:48:44AM +0200, Petr Pavlu wrote:
>> On 10/19/26 5:48 AM, Aaron Tomlin wrote:
>>> A use-after-free condition can arise in module_put() should a thread be
>>> preempted immediately after decrementing the module's reference count
>>> while the module is concurrently being unloaded.
>>>
>>> In module_put(), the module's reference count is decremented via
>>> atomic_dec_if_positive() before the module pointer is passed to
>>> trace_module_put(). Consider a scenario where CPU 0 decrements the
>>> reference count without reaching the baseline MODULE_REF_BASE level and
>>> is immediately preempted: it relinquishes its reference while still
>>> retaining a local pointer to the module. If a concurrent CPU 1
>>> subsequently drops the final active reference, the module's reference
>>> count reaches MODULE_REF_BASE. This permits the module unload sequence
>>> (via delete_module() or the initialisation-failure tear-down path) to
>>> proceed and invoke free_module().
>>>
>>> Function free_module() invokes synchronize_rcu() and subsequently
>>> releases the memory backing struct module via free_mod_mem(). Because
>>> CPU 0 was preempted outside an RCU read-side critical section,
>>> synchronize_rcu() does not await CPU 0. When CPU 0 eventually resumes
>>> execution, it passes the dangling module pointer to trace_module_put(),
>>> which dereferences mod->name and mod->refcnt, culminating in a
>>> use-after-free. This sequence of events is illustrated below:
>>>
>>>     CPU 0                                       CPU 1
>>>     -----                                       -----
>>>
>>>     module_put(module)
>>>       atomic_dec_if_positive()
>>>       [preempted]
>>>                                         module_put(module)
>>>                                           atomic_dec_if_positive()
>>>                                           // drops final reference
>>>                                         free_module(module)
>>>                                           synchronize_rcu()
>>>                                           free_mod_mem(module)
>>>       trace_module_put(module, ...)
>>>         mod->name
>>>
>>> Resolve this by acquiring an RCU read-side critical section via
>>> guard(rcu)() in module_put(). This ensures that synchronize_rcu() in
>>> free_module() blocks until trace_module_put() has run to completion, even
>>> across preemption under PREEMPT_RCU configurations, while avoiding the need
>>> to disable preemption and preserving the post-decrement reference count
>>> tracing semantics.
>>>
>>> Fixes: cb0b50b813f6 ("module: Remove preempt_disable() from module reference counting.")
>>> Cc: stable@vger.kernel.org
>>> Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
>>> ---
>>>  kernel/module/main.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/kernel/module/main.c b/kernel/module/main.c
>>> index d0e1e0bd2ad0..8e2d0ab96e6e 100644
>>> --- a/kernel/module/main.c
>>> +++ b/kernel/module/main.c
>>> @@ -953,6 +953,7 @@ void module_put(struct module *module)
>>>  	int ret;
>>>  
>>>  	if (module) {
>>> +		guard(rcu)();
>>>  		ret = atomic_dec_if_positive(&module->refcnt);
>>>  		WARN_ON(ret < 0);	/* Failed to put refcount */
>>>  		trace_module_put(module, _RET_IP_);
> 
> Hi Petr,
> 
> Thank you for your feedback.
> 
> Moving the tracepoint prior to the decrement is certainly a more concise
> delta and resolves the use-after-free, but I opted for guard(rcu)() for a
> couple of reasons.
> 
> Firstly, symmetry in the tracepoints: trace_module_get() records the
> resulting reference count post-increment. Moving trace_module_put() would
> introduce an asymmetry where puts record the pre-decrement value. When
> relinquishing the final active reference, trace_module_put() would log
> refcnt=2 rather than refcnt=1 (MODULE_REF_BASE). For scripts or tooling
> monitoring reference transitions, this off-by-one difference can be
> confusing.

The trace_module_put() tracepoint is used only for debugging. What
tooling are you referring to that could be confused by changing the
recorded refcnt value?

> 
> Secondly, keeping the tracepoint after the atomic operation ensures we do
> not emit a trace event or dereference mod->name should an unbalanced or
> erroneous put occur when refcnt is already non-positive (which triggers
> WARN_ON(ret < 0)).

I'm not sure I follow. Unless panic_on_warn=1 is set, trace_module_put()
is still invoked after WARN_ON().

> 
>>
>> I think a simpler fix is to move the trace_module_put() call before
>> atomic_dec_if_positive(). It would change the refcnt recorded in the
>> trace from the post-decrement count to the pre-decrement value, but that
>> isn't particularly important. For instance, xfs_group_put() and
>> objagg_obj_put() take the same approach.
> 
> In the case of objagg_obj_put(), the caller invokes the destructor
> synchronously within that very same thread once the count hits zero
> (i.e. __objagg_obj_put() -> objagg_obj_destroy()), without an RCU grace
> period. Placing the tracepoint prior to the decrement is therefore
> mandatory there.
> 
> As we know, with modules, destruction is asynchronous: module_put() never
> frees the module directly. Instead, free_module() already executes
> synchronize_rcu() specifically to ensure in-flight operations conclude
> before releasing module memory. Prior to commit cb0b50b813f6,
> preempt_disable() served as that RCU critical section; guard(rcu)() merely
> restores this intended synchronisation contract without disabling
> preemption, incurring negligible overhead and fitting naturally with
> existing patterns in kernel/module/main.c.

Normally, module_put() is not invoked concurrently with free_module()
and doesn't need to synchronize with it, so an RCU read-side critical
section only adds overhead.

The preempt_disable() call in module_put() was previously needed because
of the complex module_ref scheme, but that was replaced in commit
2f35c41f58a9 ("module: Replace module_ref with atomic_t refcnt"). Commit
cb0b50b813f6 ("module: Remove preempt_disable() from module reference
counting.") subsequently removed the no longer needed synchronization.

> 
> That said, if you feel strongly that avoiding guard(rcu)() and keeping the
> diff strictly to a reordering is preferable notwithstanding the tracepoint
> asymmetry, I am happy to adapt the patch accordingly.

The fix is valid, but I don't see a strong argument to introduce an RCU
read-side critical section in module_put(), especially just for
a tracepoint that will be disabled 99% of the time.

-- 
Thanks,
Petr
