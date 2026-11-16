Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794826034;
	b=taMhyTRGzfA13XOW9q5wXhrnmZWZJBhoGygLKzqdnn+8OYoEVtkPuB+J1BLDIlkwgCMd
	 lKkcHE3ynxeClu6FdB2Pe0f5BQ/gtBw2sOlv9G3lA3Ekw+2br7CJtNjVug+z/8pyWvGk0
	 XMV0aoaeHfKhJTV/KQ/DAxLKM72iJuwEObPy5OavMFfI3XHe33INCm5RRgtCbZOnMga8Z
	 C5t5lpmT84JoDxqNeavnD/v03xRnIqRgFjoZsWkHWGQ3NPcr3DYqdaMiRPeuQG4BlClGW
	 LUhCjpspKBCzNCmOGA8V5hJDluGoZppr5R/FwKP9COvEFZNvD+FjcIbSkOdT5ByCnUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794826034;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=Ly7V3SrHtZViQ6MtbvivLUpsgPdJPaNMjgihUn8ZpHs=;
	b=IqzmILHxr9jZtsu/QJeO72/RY83fs01oU+qiSdJTaxNB9dozC5P463DwWCVsMJhLv1FT
	 +X97ntIsnwVXx/ITsC284E3E+6d2zNuNtiixhU1Gh9aju2UJy4Futd4+3JHU0Ypc3SvSd
	 BfFNUHEG18Ft70iadKZfqp6STgLFT52F74L0TCCSqflU+ytrfImGIVrb98vkJk8OzAzdo
	 w27v7YXZdAQfD7zlrkuuFNQq3+/wVGvSWj5b2H/JII/ucCFrYD1TZS5ubEgZNsvvulhN8
	 M/etdSWfbp1khMgxZem+0ryUvZOvKlCQOkXUSIuV6HORFxsiAeX0BKadplcmKEyas3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ty4JmrlU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBA8606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ty4JmrlU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CB091F000C4;
	Mon, 16 Nov 2026 10:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794826033;
	bh=Ly7V3SrHtZViQ6MtbvivLUpsgPdJPaNMjgihUn8ZpHs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Ty4JmrlUS5kwJfARWUSFPwalabr4sHyJRVqesfs4h6tVSEVjc1/WUrR6J1XSFypeU
	 grVDLv3OD8lci5/0KOuFX05J0SphuYF8ahf/my2S70VqcyBZS/BLOsFEAsqoqCA7q+
	 ThWJq6jPaRI4nS3i2LlRtoQVq4pCa7LU6A2R8r8Q0Thkn3ZtXD05V7v58i9BcRVWBr
	 r2IFJYB44CmB6c4UGdDc+9cheL9rPDELpsbNHJJ294KBvj6r3d6fR0dxwPEMh9LyH9
	 Q/NYGFbnpoUJunLuRln2tgiHTf9U0+2DzwUsocl2cKjqj/0DaTWJNmRdx6WZAOX/yP
	 yVeKReaiY4Wlw==
Message-ID: <43dde2e9-24a7-4e09-ba07-d1166963e16b@kernel.org>
Date: Mon, 16 Nov 2026 11:47:09 +0100
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
Subject: Re: [PATCH v2] slab: allow sheaves for SLAB_NOLEAKTRACE caches
Content-Language: en-US
To: Breno Leitao <leitao@debian.org>, Harry Yoo <harry@kernel.org>,
 Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>,
 David Rientjes <rientjes@google.com>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com,
 Catalin Marinas <catalin.marinas@arm.com>
References: <20261113-kmemleak_sheaves-v2-1-8c557c66cec2@debian.org>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Autocrypt: addr=vbabka@kernel.org; keydata=
 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
In-Reply-To: <20261113-kmemleak_sheaves-v2-1-8c557c66cec2@debian.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/13/26 15:36, Breno Leitao wrote:
> This is a patch that makes kmemleak cheaper to run, by letting
> kmemleak's own metadata cache use a _new_ sheaves type. The flag only
> makes that possible without recursion.
> 
> The cost today:
>   * every allocation kmemleak tracks needs one kmemleak_object from
>     object_cache. An RCU callback frees it later.
> 
> Why that's slow:
>   * object_cache has no sheaves, so each of those allocations and frees
>     goes to the shared slab lists under n->list_lock.
>      - On meta's fleet kmemleak kernels, list_lock is the second most
>        contended lock, after kmemleak_lock.
>      - About 88% of that wait is RCU callbacks freeing kmemleak objects.
> 
> Why sheaves aren't allowed:
>   * a sheaf is a kmalloc object. Tracking it makes kmemleak allocate
>     another kmemleak_object, which needs a sheaf, and so on.
> 
> When I reported the recursion in [1], I suggested keeping
> SLAB_NOLEAKTRACE caches away from sheaves, and commit e47c897a2949
> ("slab: add sheaves to most caches") did that. It stopped the
> recursion, but it took the sheaves away from the whole cache, although
> only the kmemleak tracking of the sheaf itself recursed.
> 
> Commit 17c38c88294d ("slab: remove cpu (partial) slabs usage from
> allocation paths"), from the same series, then left these caches with
> no per-CPU caching at all.
> 
> In hindsight, skipping kmemleak only for the
> sheaf itself, as the new SLAB_ALLOC_NO_LEAKTRACE does, would have been
> the better fix.
> 
> The sheaf is allocated with SLAB_ALLOC_NO_RECURSE as well, like kmalloc
> sheaves. Without it, a backing kmalloc cache that needs a new sheaf of
> its own allocates it with SLAB_ALLOC_NO_LEAKTRACE too. kmemleak then
> does not track that sheaf, and can report objects queued in it by
> kfree_rcu() as leaks.
> 
> SLAB_ALLOC_NO_RECURSE also skips allocation tagging, so mark the codetag
> of these sheaves empty on free, as is done for kmalloc sheaves.
> 
> Link: https://lore.kernel.org/all/aW_NK2NXVgtuzCVH@gmail.com/ [1]
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Breno Leitao <leitao@debian.org>

Applied to slab/for-next, thanks!

> ---
> Changes in v2:
> - Fix sashiko findings:
>   - Set SLAB_ALLOC_NO_RECURSE along with SLAB_ALLOC_NO_LEAKTRACE, so the
>     flag stays off the kmalloc cache's own sheaf allocation, per Catalin
>     Marinas.
>   - Mark the codetag of SLAB_NOLEAKTRACE sheaves empty on free, per
>     Catalin Marinas.
> - Link to v1: https://patch.msgid.link/20261112-kmemleak_sheaves-v1-1-e40e3d73b253@debian.org
> ---
>  mm/slab.h |  1 +
>  mm/slub.c | 22 +++++++++++++---------
>  2 files changed, 14 insertions(+), 9 deletions(-)
> 
> diff --git a/mm/slab.h b/mm/slab.h
> index e94ac63d10dc03..7b20f10aa46a2e 100644
> --- a/mm/slab.h
> +++ b/mm/slab.h
> @@ -23,6 +23,7 @@
>  #define SLAB_ALLOC_NEW_SLAB	0x02 /* a flag for alloc_slab_obj_exts() */
>  #define SLAB_ALLOC_NO_RECURSE	0x04 /* prevent kmalloc() recursion */
>  #define SLAB_ALLOC_NO_OBJ_EXT	0x08 /* prevent obj_exts array allocation */
> +#define SLAB_ALLOC_NO_LEAKTRACE	0x10 /* skip kmemleak tracking */
>  
>  #define SLAB_FREE_DEFAULT	0x00 /* no flags */
>  #define SLAB_FREE_NOLOCK	0x01 /* spinning not allowed */
> diff --git a/mm/slub.c b/mm/slub.c
> index 8369853ddca721..b927cd684ec656 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -2850,6 +2850,14 @@ static struct slab_sheaf *__alloc_empty_sheaf(struct kmem_cache *s, gfp_t gfp,
>  	if (s->flags & SLAB_KMALLOC)
>  		alloc_flags |= SLAB_ALLOC_NO_RECURSE;
>  
> +	/*
> +	 * kmemleak allocates its metadata from SLAB_NOLEAKTRACE caches, so
> +	 * tracking their sheaves would recurse into kmemleak. NO_RECURSE stops
> +	 * NO_LEAKTRACE from reaching the kmalloc cache's own sheaf allocation.
> +	 */
> +	if (s->flags & SLAB_NOLEAKTRACE)
> +		alloc_flags |= SLAB_ALLOC_NO_LEAKTRACE | SLAB_ALLOC_NO_RECURSE;
> +
>  	sheaf_size = struct_size(sheaf, objects, capacity);
>  	sheaf = kmalloc_flags(sheaf_size, gfp | __GFP_ZERO, alloc_flags, NUMA_NO_NODE);
>  
> @@ -2883,7 +2891,7 @@ static void __free_empty_sheaf(struct kmem_cache *s, struct slab_sheaf *sheaf,
>  	 * warning, therefore replace NULL with CODETAG_EMPTY to indicate
>  	 * that the extension for this sheaf is expected to be NULL.
>  	 */
> -	if (s->flags & SLAB_KMALLOC)
> +	if (s->flags & (SLAB_KMALLOC | SLAB_NOLEAKTRACE))
>  		mark_obj_codetag_empty(sheaf);
>  
>  	VM_WARN_ON_ONCE(sheaf->size > 0);
> @@ -4727,7 +4735,8 @@ bool slab_post_alloc_hook(struct kmem_cache *s, gfp_t flags, size_t size,
>  		if (init && p[i] && !is_kfence_address(p[i]))
>  			memset(p[i], 0, zero_size);
>  
> -		if (alloc_flags_allow_spinning(ac->alloc_flags))
> +		if (alloc_flags_allow_spinning(ac->alloc_flags) &&
> +		    !(ac->alloc_flags & SLAB_ALLOC_NO_LEAKTRACE))
>  			kmemleak_alloc_recursive(p[i], s->object_size, 1,
>  						 s->flags, init_flags);
>  		kmsan_slab_alloc(s, p[i], init_flags);
> @@ -7987,13 +7996,8 @@ static unsigned int calculate_sheaf_capacity(struct kmem_cache *s,
>  	if (IS_ENABLED(CONFIG_SLUB_TINY) || s->flags & SLAB_DEBUG_FLAGS)
>  		return 0;
>  
> -	/*
> -	 * Bootstrap caches can't have sheaves for now (SLAB_NO_SHEAVES).
> -	 * SLAB_NOLEAKTRACE caches (e.g., kmemleak's object_cache) must not
> -	 * have sheaves to avoid recursion when sheaf allocation triggers
> -	 * kmemleak tracking.
> -	 */
> -	if (s->flags & (SLAB_NO_SHEAVES | SLAB_NOLEAKTRACE))
> +	/* Bootstrap caches can't have sheaves for now (SLAB_NO_SHEAVES). */
> +	if (s->flags & SLAB_NO_SHEAVES)
>  		return 0;
>  
>  	/*
> 
> ---
> base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
> change-id: 20261110-kmemleak_sheaves-b3531591ad21
> 
> Best regards,
> --  
> Breno Leitao <leitao@debian.org>
> 

