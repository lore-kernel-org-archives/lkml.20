Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2263A873A
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789545681; cv=none; b=qM4asUZEVAN+S9rqZtAWNCeCLD2XYdW3F3MKUIzZIPHDVfnFKRBt4PwaIMW7Z9C/JLu+rGcvXqNaTpKYCigfCrVtWkBbd+eG/pIzD6Rtq7DisGch5iutfooYrQVkSuqySfZY7o9IfleeL0rYAg7Y15zWZMPGIDB/FLLHJjlVa7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789545681; c=relaxed/simple;
	bh=mGDNwyhzydFgteB71jas/m2hzVBYziCoZ+lPob9LhkY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bHjNi15q94C3a8PaTFe/XUHM5ywDtaY+D1zKDI135ySukDKwmIR1iXuS1udQQ25O+ccF6sMbi3h+QSY3uDYHiBtlSd2v7ItIs7a+DsBgHFNK5N8whjCl0UyzzGeQ1Xltq6QiQbCszyttZTjTJGCxkl4dtGEuqF/083JBwh68XuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nx0v1KU+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nx0v1KU+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A1B81F000FF;
	Wed, 16 Sep 2026 08:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789545664;
	bh=TxBLvbgwX1WMceS3sE7hWk0cNik1JB9FFZdDW/oYcZE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Nx0v1KU+WkfUQhG5xwBQ+CxdkPmeEO48q3BGh8i7iVNJTvq+k1d5dgB0ybE+IcyeD
	 iwhhKI8qIfaIf8ZrpAw13YYQWqsCwCWeTlsO8x4oxoBIXP9qfcj7A4K751EcgT6o0n
	 x+MQxrPuYBT9Ra0l6+gIP+ItlCiYoj3UPBB7QiiuzlxlV+ArMLw6Bkv+IB7P8Lj5gg
	 NRGEZv8XzPuxySP+01Y9cuVeisAADoUqEW5BuiYe15RF4BN8TOYGXLKxT4Oqe/XmOI
	 i3dz2rAGyFbwcvQ8vzE9AIArSo5wCGRfxqPN7xtxI5JC+K5upO5Sj7hTLvKKtZt0Zw
	 jjxcXFXy5e1ZQ==
Message-ID: <23b15032-01c3-43fa-866f-296138228b5a@kernel.org>
Date: Wed, 16 Sep 2026 10:01:00 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] mm/slub: introduce slab parking to reduce
 list_lock contention
To: Hao Li <hao.li@linux.dev>, Pedro Falcato <pfalcato@suse.de>
Cc: harry@kernel.org, akpm@linux-foundation.org, cl@gentwo.org,
 rientjes@google.com, roman.gushchin@linux.dev, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20260824122004.3652-1-hao.li@linux.dev>
 <20260824122513.3829-1-hao.li@linux.dev>
 <20260824122513.3829-2-hao.li@linux.dev>
 <8d73f087-42e2-454c-8e5f-93c1b64cb969@kernel.org> <aqPlMzUIw-4g2iOX@fedora>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Content-Language: en-US
Autocrypt: addr=vbabka@kernel.org; keydata=
 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
In-Reply-To: <aqPlMzUIw-4g2iOX@fedora>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/11/26 15:06, Hao Li wrote:
> --- >8 ---
> mm/slub: refill prefilled sheaves from the barn
> 
> For evaluation.
> 
> ---
>  mm/slub.c | 118 +++++++++++++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 112 insertions(+), 6 deletions(-)
> 
> diff --git a/mm/slub.c b/mm/slub.c
> index 27a78d63f537..7d337dbe26a5 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -427,6 +427,8 @@ struct node_barn {
>  	spinlock_t lock;
>  	struct list_head sheaves_full;
>  	struct list_head sheaves_empty;
> +	/* leftovers of prefill or refill, protected by barn->lock */

All the fields are protected by the lock so I don't think it's worth
pointing out specifically.
"prefill or refill" sounds like it may include also internal sheaf refill,
which is not the case (but maybe something worth exploring later)

> +	struct slab_sheaf *sheaf_partial;
>  	unsigned int nr_full;
>  	unsigned int nr_empty;
>  };
> @@ -3183,6 +3185,69 @@ static struct slab_sheaf *barn_get_empty_sheaf(struct node_barn *barn,
>  	return empty;
>  }
>  
> +/*
> + * Exchange @sheaf, which holds fewer objects than requested, for a full sheaf
> + * from the barn. The objects of @sheaf stay in the barn: it becomes the barn's
> + * partial sheaf, or its objects are merged into the existing one, which becomes
> + * a full sheaf when it reaches capacity. That way the leftovers neither occupy
> + * a full-sheaf count nor have to be flushed.
> + *
> + * Returns NULL if the barn has no full sheaf.
> + */
> +static struct slab_sheaf *barn_replace_partial_sheaf(struct kmem_cache *s,
> +						     struct node_barn *barn,
> +						     struct slab_sheaf *sheaf)
> +{
> +	struct slab_sheaf *full, *partial;
> +	unsigned int to_move;
> +	unsigned long flags;
> +
> +	if (!data_race(barn->nr_full))
> +		return NULL;
> +
> +	spin_lock_irqsave(&barn->lock, flags);
> +
> +	if (unlikely(!barn->nr_full)) {
> +		spin_unlock_irqrestore(&barn->lock, flags);
> +		return NULL;

Hmm what if there's no full, but there's sheaf_partial with enough objects
to make a full sheaf together with @sheaf?

> +	}
> +
> +	full = list_first_entry(&barn->sheaves_full, struct slab_sheaf,
> +				barn_list);
> +	list_del(&full->barn_list);
> +	barn->nr_full--;
> +
> +	partial = barn->sheaf_partial;
> +	if (partial) {
> +		to_move = min(sheaf->size, s->sheaf_capacity - partial->size);
> +		sheaf->size -= to_move;
> +		memcpy(&partial->objects[partial->size],
> +		       &sheaf->objects[sheaf->size], to_move * sizeof(void *));
> +		partial->size += to_move;
> +
> +		if (partial->size == s->sheaf_capacity) {
> +			list_add(&partial->barn_list, &barn->sheaves_full);
> +			barn->nr_full++;
> +			barn->sheaf_partial = NULL;
> +		}
> +	}
> +
> +	if (sheaf->size) {
> +		/* no partial sheaf, or it just became full */
> +		barn->sheaf_partial = sheaf;
> +	} else {
> +		list_add(&sheaf->barn_list, &barn->sheaves_empty);
> +		barn->nr_empty++;
> +	}
> +
> +	spin_unlock_irqrestore(&barn->lock, flags);
> +
> +	full->capacity = s->sheaf_capacity;
> +	full->pfmemalloc = false;

I think this belongs more to the caller which deals with the prefilled
sheaves specifically, and this helper is more low level.

Otherwise LGTM!

> +
> +	return full;
> +}
> +
>  /*
>   * The following two functions are used mainly in cases where we have to undo an
>   * intended action due to a race or cpu migration. Thus they do not check the
> @@ -3317,6 +3382,7 @@ static void barn_init(struct node_barn *barn)
>  	spin_lock_init(&barn->lock);
>  	INIT_LIST_HEAD(&barn->sheaves_full);
>  	INIT_LIST_HEAD(&barn->sheaves_empty);
> +	barn->sheaf_partial = NULL;
>  	barn->nr_full = 0;
>  	barn->nr_empty = 0;
>  }
> @@ -3334,6 +3400,10 @@ static void barn_shrink(struct kmem_cache *s, struct node_barn *barn)
>  	barn->nr_full = 0;
>  	list_splice_init(&barn->sheaves_empty, &empty_list);
>  	barn->nr_empty = 0;
> +	if (barn->sheaf_partial) {
> +		list_add(&barn->sheaf_partial->barn_list, &full_list);
> +		barn->sheaf_partial = NULL;
> +	}
>  
>  	spin_unlock_irqrestore(&barn->lock, flags);
>  
> @@ -5233,12 +5303,49 @@ void *kmem_cache_alloc_node_noprof(struct kmem_cache *s, gfp_t gfpflags, int nod
>  }
>  EXPORT_SYMBOL(kmem_cache_alloc_node_noprof);
>  
> +/*
> + * Refill by swapping *@sheafp for a full sheaf from the barn. The old sheaf and
> + * its objects stay in the barn. Returns true when the new sheaf is full.
> + */
> +static bool refill_sheaf_from_barn(struct kmem_cache *s,
> +				   struct slab_sheaf **sheafp)
> +{
> +	struct node_barn *barn = get_barn(s);
> +	struct slab_sheaf *sheaf = *sheafp;
> +	struct slab_sheaf *full;
> +
> +	/* objects from pfmemalloc slabs must not enter the barn */
> +	if (!barn || sheaf->pfmemalloc)
> +		return false;
> +
> +	full = barn_replace_partial_sheaf(s, barn, sheaf);
> +	if (!full)
> +		return false;
> +
> +	stat(s, BARN_GET);
> +	*sheafp = full;
> +
> +	/*
> +	 * The sheaf may hold fewer than capacity objects: rcu_free_sheaf()
> +	 * puts it in the barn as full even when slab_free_hook() has taken
> +	 * some out (KFENCE, KASAN). __prefill_sheaf_pfmemalloc() then
> +	 * continues to refill it.
> +	 */
> +	return full->size == s->sheaf_capacity;
> +}
> +
>  static int __prefill_sheaf_pfmemalloc(struct kmem_cache *s,
> -				      struct slab_sheaf *sheaf, gfp_t gfp)
> +				      struct slab_sheaf **sheafp, gfp_t gfp)
>  {
> +	struct slab_sheaf *sheaf;
>  	gfp_t gfp_nomemalloc;
>  	int ret;
>  
> +	if (refill_sheaf_from_barn(s, sheafp))
> +		return 0;
> +
> +	sheaf = *sheafp;
> +
>  	gfp_nomemalloc = gfp | __GFP_NOMEMALLOC;
>  	if (gfp_pfmemalloc_allowed(gfp))
>  		gfp_nomemalloc |= __GFP_NOWARN;
> @@ -5331,7 +5438,7 @@ kmem_cache_prefill_sheaf(struct kmem_cache *s, gfp_t gfp, unsigned int size)
>  		sheaf->pfmemalloc = false;
>  
>  		if (sheaf->size < size &&
> -		    __prefill_sheaf_pfmemalloc(s, sheaf, gfp)) {
> +		    __prefill_sheaf_pfmemalloc(s, &sheaf, gfp)) {
>  			sheaf_flush_unused(s, sheaf);
>  			free_empty_sheaf(s, sheaf);
>  			sheaf = NULL;
> @@ -5401,11 +5508,10 @@ void kmem_cache_return_sheaf(struct kmem_cache *s, gfp_t gfp,
>   * the given size.
>   *
>   * Return: 0 on success. The sheaf will contain at least @size objects.
> - * The sheaf might have been replaced with a new one if more than
> - * sheaf->capacity objects are requested.
> + * The sheaf might have been replaced with a new one.
>   *
>   * Return: -ENOMEM on failure. Some objects might have been added to the sheaf
> - * but the sheaf will not be replaced.
> + * and the sheaf might have been replaced.
>   *
>   * In practice we always refill to full sheaf's capacity.
>   */
> @@ -5427,7 +5533,7 @@ int kmem_cache_refill_sheaf(struct kmem_cache *s, gfp_t gfp,
>  
>  	if (likely(sheaf->capacity >= size)) {
>  		if (likely(sheaf->capacity == s->sheaf_capacity))
> -			return __prefill_sheaf_pfmemalloc(s, sheaf, gfp);
> +			return __prefill_sheaf_pfmemalloc(s, sheafp, gfp);
>  
>  		if (!__kmem_cache_alloc_bulk(s, gfp, sheaf->capacity - sheaf->size,
>  					     &sheaf->objects[sheaf->size]))
> 

