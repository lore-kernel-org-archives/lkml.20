Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D0A38E5C4
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 03:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791604755; cv=none; b=E8vhY1/xAYEjZP5d34NLd7/VS7FRQHdyWmGJeMuHOC5s9I+eYL2MFSYWAzMrOs9pg2YX74CSjo4Zb29y0A+96RQ06v9yFKM3beM6WFYWnc1vdBOdRTDS6pItF8AkNpg4v1lG6JgWVCx1fIfBobnYqWPYC8h3rdw0/W+O8eZwzg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791604755; c=relaxed/simple;
	bh=RC9mnkldnLHKLxUGs9e09WBh6qSGgQVe/M8DUOliYNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rMNZEra9zTqPmmqvkM9dcW+MlKHGI7pkhTq3WaVfuHWf4X+xO23wEhxoJmCYfM5J7J7VnuJWiim9DFwEraMvH9DSSX+KftNNy3MWSnFTOnA93Ifd8lo3adqKiWJZT0EncFQ3GMq6601LaULiSvAfWwG72znzJapajxggE+59kpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I8ubehbt; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I8ubehbt"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-398b3c37877so140689a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 20:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791604752; x=1792209552; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C2sBX9RzAUijwlycitpdPIp/C+J3gojjvyNQwGnJMzc=;
        b=I8ubehbtWKh9LMUQGfy7wiPDnvWb+mY85UfhWRJ5tSE5kpXHOi4u3mEXXLWsYbaamZ
         C7HWoFGGTiGRftOPKi+L3+ZOXZiBVbdn/kyJfoiCjHvgPm5A3BlNCtBON6mmAdd+h18v
         4u12keIUgnEloWWjANDKy8RSs5IBegTtHK7gulyNgrxKw7E6hA+wHPWsZuw3OyITn+3X
         df1FYx7rVQEb38jLj55O+FYjXdRcZVrlFcES6mlOKnzvbqCgnCVlkBQS4Y1/39qrlwsD
         2aCtL2ylUcuvWiHgEe8LM1Jywr3c3OIRE+3KdSDVbnv8vg4XDK9BohcUZ8jtAXVmqgU5
         maxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791604752; x=1792209552;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C2sBX9RzAUijwlycitpdPIp/C+J3gojjvyNQwGnJMzc=;
        b=uW6s9Bcguf2gbg+N1DteSkZkaPSX95FT7UW/ZzoQbNzP74dcysEq5Bvba+QBzdHd9r
         J6wl0ARb6bgki/CUZQdYCSvAGImxkriGDPHBR//00XOt10o0iAUQlaOCOxNHbgY5holv
         3gDvkWDPGhAy5auLSyF3RFs8ovC8JXKz1ftylmEATFvP2Ntb4dvs6MGtcT+NUJT/x6ZD
         4vzKrl+EmZ/aUO3IYpGBOBtbAWeSCgaxRVVFfRuNuvypPCIVoB/A88JwFxsMbyh5fQAe
         uXyckHrqACMIV3J5+J9XEWg5jLp9H8gvHOiXLjPKPE7KKEQe2VIS2uLS9X9HLjmCPUwQ
         S5rg==
X-Forwarded-Encrypted: i=1; AKwUvBzrR6td22qYBu8t120+pWCYXPI+fUQG8wq2yOYt0K6o40nGy49h4ZljBnK3SeUqsq7GxGI4LmON49qggZM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLfYdEWhnnoKt47GuYTPxyxgMgU1pYSoQy6HJAA5Tz2zdlimlp+
	IssTguOX5AA8y+RHybUclYDRKVnXD3EkAA9KgOwusTfVo4OM5n/I45RE
X-Gm-Gg: AYBFou1IVKy2FfsTq3cTd4OWmwcg6aDKFTeF4UVEyzKbSCStldx+lR0Q0V/gJfpLdql
	stkSer8UoO4Mg6lzERIRVpd1fWWNXlwiEz3OvnTUH9BBVA6Y1JjmG5hfVe0Mf+2Z6Av3WoAJ2GS
	Pw9LbpH5AgAk8uU5exqQb/KcI+50X9G1M2Wu297bCTMWAbw1qXNpYpYHBQxPMS+5qvRMKbJMgww
	WArQTlMbrMqdib58qKdiXUVlxqWp84yrYQesxcOGrKOoAJHavCJ3tDeOzF4DVbQuTjeJg8Rg82z
	2OK1XeEB1cw3h09wqLR2CawoR+nBwMNEPdYuV0m8TlteqEtwIxibDib13V+ZZLgHTSRPBdPaZJ9
	mxWrkcjR6Cnb08vCMZIOLPXdfZi++GrSbQDLInd/+g28aBA2UFW6NA4QM2dfE+t++n+IGlZJeN5
	dfCDWqH50upApUqvERw/N+rjwBmoNvzP0Tirmuu8dSsNfdTxjGCw6gzz+su5Tu2ki5Y0yUPkvkx
	NoZegkHVxBJkcNyD/U//TuFAb0k/VxrQg==
X-Received: by 2002:a17:90b:134c:b0:3a0:cbe2:9e0c with SMTP id 98e67ed59e1d1-3ab3b0285d5mr2844887a91.63.1791604752082;
        Fri, 09 Oct 2026 20:59:12 -0700 (PDT)
Received: from localhost (softbank126159121187.bbtec.net. [126.159.121.187])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab338676besm3793206a91.1.2026.10.09.20.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 20:59:11 -0700 (PDT)
Date: Sat, 10 Oct 2026 12:59:09 +0900
From: Zhenyu Wang <zhenyuw.linux@gmail.com>
To: Yuho Choi <oss.patchbox@gmail.com>
Cc: Zhi Wang <zhi.wang.linux@gmail.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Xiaolin Zhang <xiaolin.zhang@intel.com>,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	zhiw@nvidia.com
Subject: Re: [PATCH v1] drm/i915/gvt: Don't replace a DMA mapping that is
 still in use
Message-ID: <asm4DV84UitLCbve@dell-wzy>
References: <20261004212403.208681-1-oss.patchbox@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261004212403.208681-1-oss.patchbox@gmail.com>

On Sun, Oct 04, 2026 at 05:22:39PM -0400, Yuho Choi wrote:
> intel_gvt_dma_map_guest_page() unmaps and frees the cache entry of a
> gfn when it is requested with a different size, and maps the page again.
> The entry is still referenced: shadow GTT entries and dma-bufs keep
> using its DMA address after the page is unpinned and the DMA mapping is
> torn down.

I don't think this is *real*, as code would simply destroy entry in
that case, and there won't be on-the-fly dma operation on that, as
guest mem setup is totally before execlist submission, if guest driver
changed mapping by ignoring gvt emulated execlist status, that's just bad...

> When the new mapping gets the same DMA address, their later
> intel_gvt_dma_unmap_guest_page() calls also drop the references of the
> new entry.
> 
> Keep the existing entry instead. A 2M mapping covers a 4K request for
> its first page, so take a reference on it. If the entry is smaller than
> the request, fail and let the caller split the 2M entry into 4K pages,
> as it already does when a 2M mapping cannot be set up.
>

So this change would always force 2M to split into 4K? why?

> Fixes: 7366aeb77cd8 ("drm/i915/gvt: fix incorrect cache entry for guest page mapping")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
> ---
> Compile-tested only (x86_64 defconfig + DRM_I915_GVT_KVMGT, W=1, sparse).
> 
>  drivers/gpu/drm/i915/gvt/kvmgt.c | 20 ++++++++------------
>  1 file changed, 8 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
> index ec62db5cc3675..9a3e305253469 100644
> --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> @@ -1626,19 +1626,15 @@ int intel_gvt_dma_map_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
>  		ret = __gvt_cache_add(vgpu, gfn, *dma_addr, size);
>  		if (ret)
>  			goto err_unmap;
> -	} else if (entry->size != size) {
> -		/* the same gfn with different size: unmap and re-map */
> -		gvt_dma_unmap_page(vgpu, gfn, entry->dma_addr, entry->size);
> -		__gvt_cache_remove_entry(vgpu, entry);
> -
> -		ret = gvt_dma_map_page(vgpu, gfn, dma_addr, size);
> -		if (ret)
> -			goto err_unlock;
> -
> -		ret = __gvt_cache_add(vgpu, gfn, *dma_addr, size);
> -		if (ret)
> -			goto err_unmap;
> +	} else if (entry->size < size) {
> +		/*
> +		 * The smaller mapping may still be in use, so don't replace
> +		 * it. Fail and let the caller map the range in smaller pages.
> +		 */
> +		ret = -EBUSY;
> +		goto err_unlock;
>  	} else {
> +		/* A mapping of the same or a larger size covers the request */
>  		kref_get(&entry->ref);
>  		*dma_addr = entry->dma_addr;
>  	}
> 
> base-commit: 7704c4c5bb127673b4f0ead839919db573559e38
> -- 
> 2.43.0
