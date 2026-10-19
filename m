Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B11490C1E
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792399729; cv=none; b=EF8sfdK63DOE+CIcefcvpqF6LViqy7M94wUoGUrkECCOJXIeCeKE4fXMyVZlWfmSaxeEN5G1yh5hv38SYAWwKAjvP0URMPMnejfe+e070GCWVEB5azmBDOl33lpPIK6eSY6i4bOvzRsGzWsUxs0cBURnR5VYBYBQed7qbwzx4ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792399729; c=relaxed/simple;
	bh=sb5OAQk035axqsNZnHTPq/79awUPyZHiyt1IlMeqiqE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SGs2YBP7fh2l0VMgQwtDt8+FLMxB8T3MwyLVYTj1/TKhks7xFrm2Zy15D9YDma25GxeVkMY2J+5W4pREQj9nvU1Sy4eRUoMeZCm1IQNW7cM5ogeGIZZ3ntW4yQBGU0MBjbDkHfcKlhlesJQHhLjObRq+ihWuytechyppOlJxxMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=IYsXIGaH; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="IYsXIGaH"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e0d1c095dso865313f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 01:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792399725; x=1793004525; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zhb9KBNNDc70nbYUzj5CK3HSxDzK6SdhdJzDzxQ8m7c=;
        b=IYsXIGaH2F5+rg4bt3QE/fMAGI9Ny8oevFctZStJ4WwzfUOtwpoSuIPspBmTWCZvdH
         aDzbfIa/BMfRjm1OhdtPKUfwAkuXv48lFuTnRNemSoGIZh1nLycuUUNxuv6kgqXuc80Y
         FaaMJOyBif6xfUod/zUx+AJdSx2l6iPJDzaBJR7y2AFgvSOc6g4oykbuLXWNcksyBGeR
         yUXPaM1nWdR73gK6gJJleEajfYZMFb4e4PrdI7/b+jQKne5QMUcHMiWSqiBnXHc/hOf5
         jaEV0n28J3ohTM0Z6ywx4PFB7bqLKcAMHNy4XDoKZiFHCwULVqP3RKtwm27ZmXd06Xqq
         qnVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792399725; x=1793004525;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zhb9KBNNDc70nbYUzj5CK3HSxDzK6SdhdJzDzxQ8m7c=;
        b=1/RFNts/F6a+gVCjsK7SHrX6yVmcJ4vKBU8xwP6D8Ez7E7S0AmnBs80qVI3KNMKnq6
         CcBsoVX0T4NZC6DOsQu/imK2ANn+Khk2MGAZ/GrG/utd0KS0j/4+s2GFZch58fs/GIRq
         P59hwvkBLiOhDuHe6HJ+j48WuGXdVlrKmorObkFjigKXCgNt9CHrk/3S5/drBOlETOsK
         +PEgDS5ij6wJgeGhTtY22LwPY4IPplLyj5ctUzpBIIKwKROyTtfoLBEwLnPfBxfkZXQQ
         vjMvCFv250HUEMsrAJne4ZTtB2sPkS5Ry+Bn5Nk/bF/WzgBxuRM33nXTKm8urMV1zvb8
         oI3A==
X-Forwarded-Encrypted: i=1; AKwUvBzRDp8fyKNJ5PAL6E/yx0++5LNhfjGdWoEiZxLPLM/S+rcSahuFYXAx0IHDIyrqF1neISGoaI3W9uAijiQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6SPdjY36lpuOmXMg69Joza/Y3mm5p6LIrPJiWNYVr8f2/yE1r
	s14D+vcHGNG27hdEc9k6EnG6BLYdFPM6tm3R+zXsQ1JkzUDwkWe1xucHJgizkrqEfQo=
X-Gm-Gg: AYBFou3JKMgwqjNshMLjoOVevyZbvgmCm7h0g4x/GAfLOt6agifImxc5weYQ2chjcGm
	1TVAlSlr5qRCbXJYLi7j2V7zHQ74VejvlThHZf9t/lOGFXqnOxCJrpLWA46KwQzItYHLrkQOPFg
	SnerCsurr7q4ty3CSr1na40osAUFRz+rvasEPi35wJe7k8CNQWIAjCX161qGDlEYVtrx/tBHrWy
	hUL1BLzb2kt0gcSbIMFOiGmJ9xYF5apJ9MIbL2VCWGeopFaMXAU03NeifZvu7qelbzY1obB6ISU
	c3EueWpJ5uf0YicR2+0pdhS9I/3Z0jwP7f34Ic552BoZFrc0hwX9cgYfUPgipdtUmNpg5eEtTXu
	hGGW8WBIcB8cSjvQp8GqJWFOQ5zlfj71SzVsFDDjdIIQKtPvkpWhT5jYUddjndVqIvphbN6bQlq
	zImEx+V2mTDRncdgXLqombgkfO7cFQh2YZrNkssHYx3bj+OuRtH32KwNcFtZx6xthTdy+biBqy2
	/YR/7xNfk9nMsl5Ifo4FbORhQ4aTYaDur0=
X-Received: by 2002:a05:6000:240d:b0:48e:e28:ada8 with SMTP id ffacd0b85a97d-48e0e28ae03mr9960593f8f.52.1792399725638;
        Mon, 19 Oct 2026 01:48:45 -0700 (PDT)
Received: from ?IPV6:2a07:de40:8100:0:89a9:fd0e:583d:4a53? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd510201sm22585242f8f.55.2026.10.19.01.48.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 01:48:45 -0700 (PDT)
Message-ID: <a5e66dc8-155d-4eb1-add5-8c182879cefb@suse.com>
Date: Mon, 19 Oct 2026 10:48:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] module: Fix use-after-free in module_put() tracepoint
To: Aaron Tomlin <atomlin@atomlin.com>
Cc: mcgrof@kernel.org, da.gomez@kernel.org, samitolvanen@google.com,
 linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261019034857.654569-1-atomlin@atomlin.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20261019034857.654569-1-atomlin@atomlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/19/26 5:48 AM, Aaron Tomlin wrote:
> A use-after-free condition can arise in module_put() should a thread be
> preempted immediately after decrementing the module's reference count
> while the module is concurrently being unloaded.
> 
> In module_put(), the module's reference count is decremented via
> atomic_dec_if_positive() before the module pointer is passed to
> trace_module_put(). Consider a scenario where CPU 0 decrements the
> reference count without reaching the baseline MODULE_REF_BASE level and
> is immediately preempted: it relinquishes its reference while still
> retaining a local pointer to the module. If a concurrent CPU 1
> subsequently drops the final active reference, the module's reference
> count reaches MODULE_REF_BASE. This permits the module unload sequence
> (via delete_module() or the initialisation-failure tear-down path) to
> proceed and invoke free_module().
> 
> Function free_module() invokes synchronize_rcu() and subsequently
> releases the memory backing struct module via free_mod_mem(). Because
> CPU 0 was preempted outside an RCU read-side critical section,
> synchronize_rcu() does not await CPU 0. When CPU 0 eventually resumes
> execution, it passes the dangling module pointer to trace_module_put(),
> which dereferences mod->name and mod->refcnt, culminating in a
> use-after-free. This sequence of events is illustrated below:
> 
>     CPU 0                                       CPU 1
>     -----                                       -----
> 
>     module_put(module)
>       atomic_dec_if_positive()
>       [preempted]
>                                         module_put(module)
>                                           atomic_dec_if_positive()
>                                           // drops final reference
>                                         free_module(module)
>                                           synchronize_rcu()
>                                           free_mod_mem(module)
>       trace_module_put(module, ...)
>         mod->name
> 
> Resolve this by acquiring an RCU read-side critical section via
> guard(rcu)() in module_put(). This ensures that synchronize_rcu() in
> free_module() blocks until trace_module_put() has run to completion, even
> across preemption under PREEMPT_RCU configurations, while avoiding the need
> to disable preemption and preserving the post-decrement reference count
> tracing semantics.
> 
> Fixes: cb0b50b813f6 ("module: Remove preempt_disable() from module reference counting.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
> ---
>  kernel/module/main.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/kernel/module/main.c b/kernel/module/main.c
> index d0e1e0bd2ad0..8e2d0ab96e6e 100644
> --- a/kernel/module/main.c
> +++ b/kernel/module/main.c
> @@ -953,6 +953,7 @@ void module_put(struct module *module)
>  	int ret;
>  
>  	if (module) {
> +		guard(rcu)();
>  		ret = atomic_dec_if_positive(&module->refcnt);
>  		WARN_ON(ret < 0);	/* Failed to put refcount */
>  		trace_module_put(module, _RET_IP_);

I think a simpler fix is to move the trace_module_put() call before
atomic_dec_if_positive(). It would change the refcnt recorded in the
trace from the post-decrement count to the pre-decrement value, but that
isn't particularly important. For instance, xfs_group_put() and
objagg_obj_put() take the same approach.

-- 
Thanks,
Petr
