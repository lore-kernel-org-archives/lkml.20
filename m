Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D10375F88
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791892191; cv=none; b=nG6ySvenCaZs1S0PZautbBesrMaglid2DTUYuU+lNhRVSniP04yfKwsAmtyalemEoZ/TNkurnkLexRH11ZqhWYf0+Ng2evjK6eXn9hXCDjNmQzjv9DBMqx8kpzFqgsXIrX+db5HaPe6MjZ/Dqr3bKoDiWkPWMA7a72y7vtqF82M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791892191; c=relaxed/simple;
	bh=PS8UojMEQCER6k1Ki2zinAshUpAPhbM5NbHr1vQVg2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=piW4WPNw0aV30l+oQD6/vpB7SD5Ej9iDvxUy18WR5GqOXiq1CNNsubT0aRzD2uT315VcVXQxHPKi58exY+42ghskdCiS0bNZvK8i8FhHJ81fCG8UzilK9hrPBW9Qu+iYxxq9tKTTIuH+6y6HJIt7XYAo8ZXPzuSMJQPMTBeDDRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FXoMtWX+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FXoMtWX+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 473A51F00898;
	Tue, 13 Oct 2026 11:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791892189;
	bh=G78GCGexl4AmpaQPtR/ZnZzU2sTMtYA9Jm+zImCCMg0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FXoMtWX+E0Ns8PGdn2KmS+jJAun6cLyIIFVnKAdLaacvI92ehKO56NFEEM8hx/43G
	 Mdvh6lvy7PAhXlgcQ74kUERl8nUJOocW/dfXpn455qV1cVbPaOmKUCGsCpEKGAanSh
	 C7Awb/wt6k7m+NPUXnAl7YY//5zrOY6E6Ik93oi+7JNTKweJzDyZlzZFlPqyudlSVq
	 pjmacYMfzBYErSUgDV2vSoXIC7snuIMYJUVKUKsMctMcDd1+AjtrMc7GhtSBOITdWS
	 Kfd6YjvwtF32KATyRwEEDWMmMDBW7x8aKzVRleLm0o4zBw/NCi+nnPZFoUd/V/LfbD
	 cFpa8Zqqfg4cw==
Date: Tue, 13 Oct 2026 12:49:47 +0100
From: Harry Yoo <harry@kernel.org>
To: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Roman Gushchin <roman.gushchin@linux.dev>, David Rientjes <rientjes@google.com>, 
	Christoph Lameter <cl@gentwo.org>, Hao Li <hao.li@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Vitaly Vul <vitaly.vul@partner.samsung.com>, Damien Le Moal <dlemoal@kernel.org>, 
	Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v2] mempool: optimize mempool resizing
Message-ID: <as4Xi9hPZldwGdzK@thinkstation>
References: <20261013091408.1231786-1-vitaly.wool@konsulko.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013091408.1231786-1-vitaly.wool@konsulko.se>

I think this has unresolved feedback from Christoph [1] and Damien [2],
so adding them to Cc list.

[1] https://lore.kernel.org/linux-mm/20260626042252.GA7997@lst.de
[2] https://lore.kernel.org/linux-mm/9104ac5d-ed2b-409d-8220-512dd4581966@kernel.org

On Tue, Oct 13, 2026 at 11:14:08AM +0200, Vitaly Wool wrote:
> Resizing mempool to a bigger size currently requires a new allocation and
> a data copy to a new larger elements array which doesn't go well with the
> idea of having a fast and deadlock free memory allocations during exreme
> load.

Please elaborate the problematic scenario more in detail.
Have you obsesrved the problem in practice?

> This situation can't be completely avoided but its occurrence can be
> vastly minimized if we track the actual number of slots in the elements
> array. This patch introduces a new member of struct mempool which is set
> when the array is allocated in mempool_init_node() and only changes when
> mempool_resize() replaces the array with a bigger one.  Growing a pool to a
> size that still fits the existing array now just raises min_nr and refills
> the pool.
> 
> A racing resize may enlarge the array while the lock is dropped for the
> allocation, so __elements_size is checked again once the lock is
> retaken, and the unneeded array is freed.  The array being replaced is
> now freed after dropping the lock.
> 
> Signed-off-by: Vitaly Vul <vitaly.vul@partner.samsung.com>
> ---
>  include/linux/mempool.h |  1 +
>  mm/mempool.c            | 43 ++++++++++++++++++++++++++---------------
>  2 files changed, 28 insertions(+), 16 deletions(-)
> 
> Changelog:
> * v2: all the API / behavioral changes are dropped, only the
>   optimization remains
> 
> diff --git a/include/linux/mempool.h b/include/linux/mempool.h
> index 6da502aef2f7..a8a411290bf0 100644
> --- a/include/linux/mempool.h
> +++ b/include/linux/mempool.h
> @@ -20,6 +20,7 @@ typedef struct mempool {
>  	int min_nr;		/* nr of elements at *elements */
>  	int curr_nr;		/* Current nr of elements at *elements */
>  	void **elements;
> +	int __elements_size;	/* nr of slots in *elements, never shrinks */
>  
>  	void *pool_data;
>  	mempool_alloc_t *alloc;
> diff --git a/mm/mempool.c b/mm/mempool.c
> index cb74e718b2c6..1911a696737b 100644
> --- a/mm/mempool.c
> +++ b/mm/mempool.c
> @@ -261,6 +261,7 @@ int mempool_init_node(struct mempool *pool, int min_nr,
>  					    gfp_mask, node_id);
>  	if (!pool->elements)
>  		return -ENOMEM;
> +	pool->__elements_size = max(1, min_nr);
>  
>  	/*
>  	 * First pre-allocate the guaranteed number of buffers,
> @@ -353,6 +354,8 @@ EXPORT_SYMBOL(mempool_create_node_noprof);
>   * This function shrinks/grows the pool. In the case of growing,
>   * it cannot be guaranteed that the pool will be grown to the new
>   * size immediately, but new mempool_free() calls will refill it.
> + * Shrinking keeps the elements array, so growing the pool again up to
> + * the largest size it ever had does not reallocate it.
>   * This function may sleep.
>   *
>   * Note, the caller must guarantee that no mempool_destroy is called
> @@ -364,7 +367,7 @@ EXPORT_SYMBOL(mempool_create_node_noprof);
>  int mempool_resize(struct mempool *pool, int new_min_nr)
>  {
>  	void *element;
> -	void **new_elements;
> +	void **new_elements = NULL;
>  	unsigned long flags;
>  
>  	BUG_ON(new_min_nr <= 0);
> @@ -381,24 +384,31 @@ int mempool_resize(struct mempool *pool, int new_min_nr)
>  		pool->min_nr = new_min_nr;
>  		goto out_unlock;
>  	}
> -	spin_unlock_irqrestore(&pool->lock, flags);
> -
> -	/* Grow the pool */
> -	new_elements = kmalloc_objs(*new_elements, new_min_nr);
> -	if (!new_elements)
> -		return -ENOMEM;
>  
> -	spin_lock_irqsave(&pool->lock, flags);
> -	if (unlikely(new_min_nr <= pool->min_nr)) {
> -		/* Raced, other resize will do our work */
> +	/*
> +	 * Grow the pool.  The elements array is only reallocated if it is too
> +	 * small, it may still be large from before an earlier shrink.
> +	 */
> +	if (new_min_nr > pool->__elements_size) {
>  		spin_unlock_irqrestore(&pool->lock, flags);
> -		kfree(new_elements);
> -		goto out;
> +		new_elements = kmalloc_objs(*new_elements, new_min_nr);
> +		if (!new_elements)
> +			return -ENOMEM;
> +
> +		spin_lock_irqsave(&pool->lock, flags);
> +		if (unlikely(new_min_nr <= pool->min_nr)) {
> +			/* Raced, other resize will do our work */
> +			goto out_unlock;
> +		}
> +		/* A racing resize may have enlarged the array meanwhile */
> +		if (new_min_nr > pool->__elements_size) {
> +			memcpy(new_elements, pool->elements,
> +			       pool->curr_nr * sizeof(*new_elements));
> +			/* The old array is freed below, outside the lock */
> +			swap(pool->elements, new_elements);
> +			pool->__elements_size = new_min_nr;
> +		}
>  	}
> -	memcpy(new_elements, pool->elements,
> -			pool->curr_nr * sizeof(*new_elements));
> -	kfree(pool->elements);
> -	pool->elements = new_elements;
>  	pool->min_nr = new_min_nr;
>  
>  	while (pool->curr_nr < pool->min_nr) {
> @@ -418,6 +428,7 @@ int mempool_resize(struct mempool *pool, int new_min_nr)
>  out_unlock:
>  	spin_unlock_irqrestore(&pool->lock, flags);
>  out:
> +	kfree(new_elements);
>  	return 0;
>  }
>  EXPORT_SYMBOL(mempool_resize);
> -- 
> 2.39.5
> 

-- 
Cheers,
Harry / Hyeonggon
