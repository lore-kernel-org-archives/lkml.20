Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726FD1FDA61
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791976421; cv=none; b=u2c9qhw9fLylxdqUM2Or0gJKq8JWTlp2kymkvoY0XtWsjMqFmvem0UJ3DtofMudc8Fb4wtOShEftTzXxTPTifNZU5VTZQA3/Hp9ojo6ttTeEO4Q/c7nHgD3zHXLXeLriVUcRaAIwSHGN/Q5+GpALzy0lYRKgoqEJGGRXaBoj8Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791976421; c=relaxed/simple;
	bh=eFjYtNXcvVYkY04diiIB+AwUoE0aJwOhOqjIMm950cA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lj+PhY5a81STCFOA9b8deps7ymzMsJfVUozh7isiaWFeMADClS/N2V2SlCd2WZRVqcRPZL8PX9lUcMZSdjLW0OXE7tIsDGjOtccv+Vw0LnYjYKT89iuGrfxQ1YEGHunph4AmLax6Cy0ICSTa7yd7QGiOLUH2quOQQYllrlTA9Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=LITRskbT; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="LITRskbT"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a19cba5c14so33640665e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791976418; x=1792581218; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NXlUIURbYu6APktqXqLBKzg8bDGva6jksAa9GUaz5Wg=;
        b=LITRskbT6dvQqUQfdy4hZAgcEvn6eL2HIAXlNuHLg4fEHcdERoC094VBhOs57e/ECJ
         02LxgtWLncDpxFab4Czefs3xI/O2FenE+W+RU7g/RT0+T3TxyhAACMo/4bv+6W4FlE0k
         Sbr8oYB2CDD8I5MaigXE1Ajg2ZVG/euMxZuZTlhAI7oPwoTaZ/T/sDwQCVsq3YZON2Rw
         OnSThWJuBGd9ao3AAJQw7lbo+tF+9lcUvSVPM1RR+C4xeklPUjFg73na1By5wihON2JY
         0ZVbSJjSa2fls54uSO6hob6i+E5AOfIswes17lz5NZN9iz0RZlcUBmk9nwSRj/e02Kdr
         j/NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791976418; x=1792581218;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NXlUIURbYu6APktqXqLBKzg8bDGva6jksAa9GUaz5Wg=;
        b=iUesTMP9bctLCA2xofNBobCHdRjUVDvMt9fwqIQmLnrX9RrZ45Q1x7w1GPO5oypx+F
         oxVhXzYuVIIYtsXrTOIjGmaVbal76srGOK5G0+6cndnBY4Zcl2LciMOYZeTZDNu/9WGo
         9vLK6NgqyjtRGlqRLo2nHl7WA4IZ6m3bTwvABtXLsUmyfQMTqD6PaPNovcJ8MxT4aRdI
         1/qZjhZ3gkS6n52K/6g3HbzcOtg5tUnLUuCXR5TVsn2liHMahAHDSZo4fHOiB8+sHWit
         9dB9ILD97mFHsraERs4eSly2AQlhYOBp56D/nUqVn7sWaPm1MZQv+r0NnbSTonxHMbF+
         9Kkg==
X-Forwarded-Encrypted: i=1; AKwUvBz+pbS9uXRsaIi5iVscp4H8OF/jZyZcoahl+wGq0zUxxgRTrntvfxd2CFWDCiQUD3mVjXbXQAFYSx1KcX8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+gcEPBD0puB9lgFF7Ej0vfUNwYv6j+IeY6scSkvAklAI76NJq
	sDXyPd97nXU5nVXVvdqAcaFma6VwNQi1rzzUrfwllsLsHfYFfaYQZMEcnIV9990b5VM=
X-Gm-Gg: AYBFou3Sbpy30J3OeYJ4svqyZgRl305k9ZakwnS+EkLL+WjEeSG+epxjYwCyBjU1c1+
	JLrKCYs11+kta+iEQQguQKjS+cDJz6OJeGLAcgXG+sKpNyAU2f8mccUr0xiBmp/bjgTN/Hh2YMQ
	4JGO+uO94bZ57UvVY8s0h6VMyZh3k++NBsqo+orJ6b+Bg9FOGP9ADh1mvm1Pr/pv/Y2j8+LjJFF
	1JiofbxtAKK/TzgjjRejK7W4ry96jg/USzsf43PT1y3lZRbLw7xUxNmuHcTrHLqnv3IMCO7TFEQ
	a+8p0Vb8iSP0AjJNHMdG5ZB6k4L9p6cafe5+GQ83MpKQ/9q1xAaf7VrNil3RBGpsmATJOolU+df
	uh5DheiLwYOXZJhmL0wywLj6jhyCV0c1riEA5xLrfiBJuBDqaRGPfg7/RwWN37jGRX0GKYv80VU
	K6cjd2g4hKp1aQJGVk5qmzCx6XCoNa2ey8co1BT36a2WUGM5VPP4AwRfqdEXtecr47CkQ1mnhj6
	RAkA4/NxYdD
X-Received: by 2002:a05:600c:4ecd:b0:4a1:96cd:2f60 with SMTP id 5b1f17b1804b1-4a19ecf4c20mr181213675e9.3.1791976417794;
        Wed, 14 Oct 2026 04:13:37 -0700 (PDT)
Received: from localhost (109-81-25-183.rct.o2.cz. [109.81.25.183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b3615f2esm43732895e9.1.2026.10.14.04.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:13:37 -0700 (PDT)
Date: Wed, 14 Oct 2026 13:13:34 +0200
From: Michal Hocko <mhocko@suse.com>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>, Tejun Heo <tj@kernel.org>,
	Meta kernel team <kernel-team@meta.com>, cgroups@vger.kernel.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH for-7.5 1/5] memcg: move memory.high enforcement out of
 try_charge_memcg()
Message-ID: <as9j3rH3qRtFO0-7@tiehlicka>
References: <20261010210957.1350874-1-shakeel.butt@linux.dev>
 <20261010210957.1350874-2-shakeel.butt@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261010210957.1350874-2-shakeel.butt@linux.dev>

On Sat 10-10-26 14:09:53, Shakeel Butt wrote:
> try_charge_memcg() does a lot. It charges the page counters, reclaims
> when a limit is hit, may call the OOM killer, and at the end it checks
> and enforces memory.high. Move the memory.high part into a new function,
> memcg_enforce_high(), so that try_charge_memcg() is shorter and the
> memory.high code is easier to read and change.
> 
> The code and its comments move as they are. The only difference is that
> the new function gets allow_spinning from gfp_mask itself.
> 
> No functional change.

Acked-by: Michal Hocko <mhocko@suse.com>
Thanks!

> ---
>  mm/memcontrol.c | 125 ++++++++++++++++++++++++++----------------------
>  1 file changed, 69 insertions(+), 56 deletions(-)
> 
> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> index aad0498a7bd6..20c5dfe1a894 100644
> --- a/mm/memcontrol.c
> +++ b/mm/memcontrol.c
> @@ -2696,6 +2696,74 @@ void __mem_cgroup_handle_over_high(gfp_t gfp_mask)
>  	css_put(&memcg->css);
>  }
>  
> +/*
> + * Called after @nr_pages were charged to @memcg. If @memcg or one of its
> + * ancestors is over memory.high or memory.swap.high, start reclaim or slow
> + * down the task.
> + */
> +static void memcg_enforce_high(struct mem_cgroup *memcg, unsigned int nr_pages,
> +			       gfp_t gfp_mask)
> +{
> +	bool allow_spinning = gfpflags_allow_spinning(gfp_mask);
> +
> +	/*
> +	 * If the hierarchy is above the normal consumption range, schedule
> +	 * reclaim on returning to userland.  We can perform reclaim here
> +	 * if __GFP_RECLAIM but let's always punt for simplicity and so that
> +	 * GFP_KERNEL can consistently be used during reclaim.  @memcg is
> +	 * not recorded as it most likely matches current's and won't
> +	 * change in the meantime.  As high limit is checked again before
> +	 * reclaim, the cost of mismatch is negligible.
> +	 */
> +	do {
> +		bool mem_high, swap_high;
> +
> +		mem_high = page_counter_read(&memcg->memory) >
> +			READ_ONCE(memcg->memory.high);
> +		swap_high = page_counter_read(&memcg->swap) >
> +			READ_ONCE(memcg->swap.high);
> +
> +		/* Don't bother a random interrupted task */
> +		if (!in_task()) {
> +			if (mem_high) {
> +				if (allow_spinning)
> +					schedule_work(&memcg->high_work);
> +				else
> +					irq_work_queue(&memcg->high_irq_work);
> +				break;
> +			}
> +			continue;
> +		}
> +
> +		if (mem_high || swap_high) {
> +			/*
> +			 * The allocating tasks in this cgroup will need to do
> +			 * reclaim or be throttled to prevent further growth
> +			 * of the memory or swap footprints.
> +			 *
> +			 * Target some best-effort fairness between the tasks,
> +			 * and distribute reclaim work and delay penalties
> +			 * based on how much each task is actually allocating.
> +			 */
> +			current->memcg_nr_pages_over_high += nr_pages;
> +			set_notify_resume(current);
> +			break;
> +		}
> +	} while ((memcg = parent_mem_cgroup(memcg)));
> +
> +	/*
> +	 * Reclaim is set up above to be called from the userland
> +	 * return path. But also attempt synchronous reclaim to avoid
> +	 * excessive overrun while the task is still inside the
> +	 * kernel. If this is successful, the return path will see it
> +	 * when it rechecks the overage and simply bail out.
> +	 */
> +	if (current->memcg_nr_pages_over_high > MEMCG_CHARGE_BATCH &&
> +	    !(current->flags & PF_MEMALLOC) &&
> +	    gfpflags_allow_blocking(gfp_mask))
> +		__mem_cgroup_handle_over_high(gfp_mask);
> +}
> +
>  static int try_charge_memcg(struct mem_cgroup *memcg, gfp_t gfp_mask,
>  			    unsigned int nr_pages)
>  {
> @@ -2853,62 +2921,7 @@ static int try_charge_memcg(struct mem_cgroup *memcg, gfp_t gfp_mask,
>  	if (batch > nr_pages)
>  		refill_stock(memcg, batch - nr_pages);
>  
> -	/*
> -	 * If the hierarchy is above the normal consumption range, schedule
> -	 * reclaim on returning to userland.  We can perform reclaim here
> -	 * if __GFP_RECLAIM but let's always punt for simplicity and so that
> -	 * GFP_KERNEL can consistently be used during reclaim.  @memcg is
> -	 * not recorded as it most likely matches current's and won't
> -	 * change in the meantime.  As high limit is checked again before
> -	 * reclaim, the cost of mismatch is negligible.
> -	 */
> -	do {
> -		bool mem_high, swap_high;
> -
> -		mem_high = page_counter_read(&memcg->memory) >
> -			READ_ONCE(memcg->memory.high);
> -		swap_high = page_counter_read(&memcg->swap) >
> -			READ_ONCE(memcg->swap.high);
> -
> -		/* Don't bother a random interrupted task */
> -		if (!in_task()) {
> -			if (mem_high) {
> -				if (allow_spinning)
> -					schedule_work(&memcg->high_work);
> -				else
> -					irq_work_queue(&memcg->high_irq_work);
> -				break;
> -			}
> -			continue;
> -		}
> -
> -		if (mem_high || swap_high) {
> -			/*
> -			 * The allocating tasks in this cgroup will need to do
> -			 * reclaim or be throttled to prevent further growth
> -			 * of the memory or swap footprints.
> -			 *
> -			 * Target some best-effort fairness between the tasks,
> -			 * and distribute reclaim work and delay penalties
> -			 * based on how much each task is actually allocating.
> -			 */
> -			current->memcg_nr_pages_over_high += batch;
> -			set_notify_resume(current);
> -			break;
> -		}
> -	} while ((memcg = parent_mem_cgroup(memcg)));
> -
> -	/*
> -	 * Reclaim is set up above to be called from the userland
> -	 * return path. But also attempt synchronous reclaim to avoid
> -	 * excessive overrun while the task is still inside the
> -	 * kernel. If this is successful, the return path will see it
> -	 * when it rechecks the overage and simply bail out.
> -	 */
> -	if (current->memcg_nr_pages_over_high > MEMCG_CHARGE_BATCH &&
> -	    !(current->flags & PF_MEMALLOC) &&
> -	    gfpflags_allow_blocking(gfp_mask))
> -		__mem_cgroup_handle_over_high(gfp_mask);
> +	memcg_enforce_high(memcg, batch, gfp_mask);
>  	return ret;
>  }
>  
> -- 
> 2.53.0-Meta

-- 
Michal Hocko
SUSE Labs
