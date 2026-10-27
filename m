Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.230
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793062629;
	b=epIJHxQPaXWNmIS6ydi0t4UFzwPSz1xm0+zELsXsZIZG/1WEVCvFrt31JDz59bsg9uH5
	 gQFzlTgK17QqjdXo0j7STOZHyDAbunaOao03m8Ql1LNLL+XQG0u2ADWHCmwdYTt5O/thM
	 R1Dwsk1pdranfmlpFRq+7WVxJVSgLkxn82LqlKWKuar2WDdkpk3jl1QqfwHu/BPooWwZL
	 s9E4oUBz/mRukqtwHkogzkkL0xoI+5gFPSMQ+Q4S86EHwqgM3ZT08zRN9iCkrFaP614Fe
	 R1pnV/Dz5DX112jkhhDTsVy8tAvDCeeEf+JGSf+iHrMDIAVgFRqHUVhp6/4f+7pHkow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793062629;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=BsJH9SASUNWFflHahFZZJn4h1VTJyinMN4QMIMxAPS4=;
	b=cO9GN/IPlY2XfSwvEb8lNqI+VaK3/uQytLyAdhcDCk8dT2vZkkk+B4BUpJ6qwd2DxiUU
	 8EjE9ZiuxVPBmxOOP0/ot1mryKNavi/P1Y7kJW+M6pFihkXyUKBAkQ3KN0R1NEXhGz+A3
	 ptTcOQafQbtn0ExVz286Pe8WjVr474Cw0AdnPG38AjlGCQPv1ApBUnTsM+EqoxDhYpVuc
	 deEkUj2FEcUGhX0A2Lrxh8nVxgCDNxxmA19c69VZ5lVlz/rKlNX24DinJ8KMG181Zlc6o
	 WQnTpNVduD8i8z+fPHrdqSU+vLWlSdUVA6rc3n2B/KUBz/PBpxsup0LxRWQP/issNeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=dl7ITDEd;
	arc=none smtp.remote-ip=91.218.175.230
Received: from mta0.migadu.com (out-230.mta0.migadu.com [91.218.175.230])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B24606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 00:57:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38B24606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=dl7ITDEd
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=UnoGUuIms3PHdCzo7ZbWAA1oZjGiGwzK/IuTXEdmG6U=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793062626; v=1; x=1793667426;
 b=dl7ITDEdSjFeaQWHmp8RV1B42iesi/IaItGkhIT4yLCiWshkUQrIvWU3g8Uj0lzVwv5z34CK
 SgcgKZSVtuYo1Mr2fOVFjw8QwhJa8BXmrp2fnXv2aEYMwX4TcL5vzGy4yMmm/Rutze+ZgR9hYUI
 cC1zXRCNyle1Qi1jFNNNzQ84=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 12bbfc182f6c0f69;
	Tue, 27 Oct 2026 00:57:06 +0000
X-Mizu-Trace-ID: 12bbfc182f6c0f69
X-Migadu-Flow: FLOW_OUT
Date: Tue, 27 Oct 2026 08:57:02 +0800
From: Baoquan He <baoquan.he@linux.dev>
To: "Uladzislau Rezki (Sony)" <urezki@gmail.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
	LKML <linux-kernel@vger.kernel.org>,
	"David Hildenbrand (Arm)" <david@kernel.org>
Subject: Re: [PATCH] mm/vmalloc: Bail out if in softirq context
Message-ID: <at_23pZ03p93IVpq@fedora>
References: <20261026102503.30860-1-urezki@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026102503.30860-1-urezki@gmail.com>

On 10/26/26 at 11:25am, Uladzislau Rezki (Sony) wrote:
> vmalloc() is not allowed to be invoked from the NMI,
> hard-irq and softirq contexts because doing so may
> deadlock on internal locks.
> 
> Commit 04aa71da5f35 ("mm/vmalloc: do not trigger BUG()
> on BH disabled context") replaced the deprecated in_interrupt()
> macro with explicit in_nmi() and in_hardirq() checks, but
> unintentionally dropped the softirq context check.
> 
> Example:
> 
> <snip>
> vzalloc() in a task
>  spin_lock(&vn->busy.lock)
>   <------ Hard irq
>    irq_exit()
>     process softirq on the same CPU
>      vmalloc()
>       spin_lock(&vn->busy.lock)
>        spins forever
> <snip>
> 
> Restore the check by checking the caller's context with
> the in_serving_softirq() helper. Note that, it is still
> allowed to invoke vmalloc() with disabled bottom halves.
> 
> Replace BUG_ON() with WARN_ON_ONCE() for in_nmi() and
> in_hardirq() case.
> 
> Cc: David Hildenbrand (Arm) <david@kernel.org>
> Fixes: 04aa71da5f35 ("mm/vmalloc: do not trigger BUG() on BH disabled context")
> Signed-off-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
> ---
>  mm/vmalloc.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 7521b9b3bfd2..36e6e3be6ba4 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -3252,7 +3252,13 @@ struct vm_struct *__get_vm_area_node(unsigned long size,
>  	struct vm_struct *area;
>  	unsigned long requested_size = size;
>  
> -	BUG_ON(in_nmi() || in_hardirq());
> +	/* IRQ re-entrancy -> irq_exit() -> process softirq. */
> +	if (in_serving_softirq())
> +		return NULL;
> +
> +	if (WARN_ON_ONCE(in_nmi() || in_hardirq()))
> +		return NULL;
> +

LGTM,
Reviewed-by: Baoquan He <baoquan.he@linux.dev>

>  	size = ALIGN(size, 1ul << shift);
>  	if (unlikely(!size))
>  		return NULL;
> -- 
> 2.47.3
> 
