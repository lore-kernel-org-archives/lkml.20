Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81B443ACEF9
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 10:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790419477; cv=none; b=kgUECH6/4z5qRUic8Nuca4b5YjlKZtOGqGc3hxf7EnmZUr+5R4Y6Fht5MYWyDoQk90cRVDikg+JwqArQgtZ96uelzQKx+3OcpRlO7b1oJvqwvorBqM5+L+HRgXhr9/BnYLM5cvZSR7ZkhElQDC95BNTgdKxf7rQBdo7Er+Ovmpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790419477; c=relaxed/simple;
	bh=tdcDb7EMI5MXWG2z6HDtUpPG9NMnbPPbqLSL0Wmwbus=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fl2bfSoEOhH9ZneUFf7icWHgf6uj4xZRlkWn3jTgugcu9GqXp719mPRLjhqtjPIatFcwAu9EzzdGkd/rglSCMYjH/bc4nkqI3e365GhtfHo9bTUV191CTZlK9u4ypu5/YT4Mw/IKwPuclVlKI6X1ob+mpo0HB5pPSn3kvYlspsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=GDW48iZa; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="GDW48iZa"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B4CE31596;
	Sat, 26 Sep 2026 03:44:07 -0700 (PDT)
Received: from [10.164.11.10] (unknown [10.164.11.10])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9193C3F632;
	Sat, 26 Sep 2026 03:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790419451; bh=tdcDb7EMI5MXWG2z6HDtUpPG9NMnbPPbqLSL0Wmwbus=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GDW48iZarz1IDGWNkaFpOCVJkeWVdPlytnKkrMZ96NZl5ztLfc7ze3i6YbNCQ01l2
	 EzJc5uaLXjC9xSpXDLmu/HhUNq5Xrx6tPgBvWNVl4ijNYCiABuSQ6svYKBFKxRG5/E
	 iQaixhGKnBdce6wkr0My14Gj6yYbZK6pT3Muy+TE=
Message-ID: <14e54610-ab62-472a-801f-d929171cde01@arm.com>
Date: Sat, 26 Sep 2026 16:14:05 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/vmalloc: do not warn on -ENOMEM from va_clip() in
 pcpu_get_vm_areas()
To: Palla Raghunath <raghunathpalla.0209@gmail.com>,
 linux-kernel@vger.kernel.org
Cc: Shuah Khan <shuah@kernel.org>, Brigham Campbell <me@brighamcampbell.com>,
 linux-kernel-mentees@lists.linux.dev,
 syzbot+442828bb356b10813a47@syzkaller.appspotmail.com,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, Baoquan He <baoquan.he@linux.dev>,
 linux-mm@kvack.org
References: <20260925205450.21262-1-raghunathpalla.0209@gmail.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20260925205450.21262-1-raghunathpalla.0209@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 26/09/26 2:24 am, Palla Raghunath wrote:
> When pcpu_get_vm_areas() has to split a free vmap_area in the middle
> (NE_FIT_TYPE), va_clip() needs an extra vmap_area object. It takes the
> per-cpu ne_fit_preload_node if one is there, and otherwise falls back
> to kmem_cache_alloc(GFP_NOWAIT), which may fail and return -ENOMEM.
> pcpu_get_vm_areas() never preloads, and a single call can do more than
> one such split: on a NUMA system it places one area per node group, so
> the first split consumes the preloaded object and the next one depends
> on the GFP_NOWAIT allocation.
> 
> That failure is expected and already handled: the recovery path returns
> the areas clipped so far to the free tree, purges lazily freed areas and
> retries. But the error is checked with WARN_ON_ONCE(), so a transient
> allocation failure under memory pressure or fault injection triggers a
> kernel warning, and a panic with panic_on_warn. syzbot hit this on a
> two-node VM while creating a per-cpu BPF array map.
> 
> Keep the WARN_ON_ONCE() for errors other than -ENOMEM, which do indicate
> a bug, and take the recovery path either way. This matches what commit
> b9183788a2de ("mm/vmalloc: do not warn on -ENOMEM from va_alloc()") did
> for the other va_clip() caller.
> 
> Fixes: 1b23ff80b399 ("mm/vmalloc: invoke classify_va_fit_type() in adjust_va_to_fit_type()")
> Reported-by: syzbot+442828bb356b10813a47@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=442828bb356b10813a47
> Signed-off-by: Palla Raghunath <raghunathpalla.0209@gmail.com>
> ---

Makes sense:

Reviewed-by: Dev Jain <dev.jain@arm.com>

>  mm/vmalloc.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index bea9f76ed7e7..24c7d0a5472e 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -5107,9 +5107,14 @@ struct vm_struct **pcpu_get_vm_areas(const unsigned long *offsets,
>  
>  		ret = va_clip(&free_vmap_area_root,
>  			&free_vmap_area_list, va, start, size);
> -		if (WARN_ON_ONCE(unlikely(ret)))
> -			/* It is a BUG(), but trigger recovery instead. */
> +		if (unlikely(ret)) {
> +			/*
> +			 * -ENOMEM from the GFP_NOWAIT fallback is expected.
> +			 * Anything else is a BUG(), but trigger recovery instead.
> +			 */
> +			WARN_ON_ONCE(ret != -ENOMEM);
>  			goto recovery;
> +		}
>  
>  		/* Allocated area. */
>  		va = vas[area];

