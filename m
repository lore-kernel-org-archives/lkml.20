Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BC03D47DA
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 17:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791565239; cv=none; b=b4XeKlpkJgMydk1qaKPqxq+ijjtxBFiWXJBLErAmcHZG0f5DCc3YL2u5PfQDbwO5oBiHhXbrgfCEbOJa276Ys3UiE5z2hIHELVizmZJpOMiFCiL9aPpDyucELmlCrZXfxAY+F70yM4BLLzuOoIh35vYZkKYvT07axI9bIYdTY50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791565239; c=relaxed/simple;
	bh=LHZz44B4lwN/5kwrtwcR/vyuLsXNfg0nh+v7zZ7R8Kc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=px9UJt+kniLHTjtsAhkyNcQA+H4XSeB8MADNBXbAMBZqFxm/+tg0UpfBB9c2BHfnflt1/jHWw10W1rEY5L7tD26f2CddhvrhV5qzSW78aOk8UbjBNX4vCH2/0ZaxaerVWpDM0X0CIIKuwcEShSw1aS/ny6v1P+IXXZs+wdvvugk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PPBVQNEj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PPBVQNEj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8111C1F000FF;
	Fri,  9 Oct 2026 17:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791565232;
	bh=ztyPoTsXQl2erL+nCDtIS3iAw5yK7s2FnhInIimetvY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PPBVQNEjP1rpUk9athtUmv4P1WtB+86fpqSx6AnywR1TtsvYSJIFmJNxilRtHzu6e
	 fgQGXdRphhqRFLklVel6bYh6mpHunUliifxVYCBs+HAUBYHYMjbeas8wPR7ZsqJ/3V
	 7eFLqmJrb3o9bIyTjWzS5gtRj6YMUZSvkE1FTp1cIJPG7/2eAxipl58T6kYTuHqYw2
	 2aBWnqsCTriH0YTTyg9I5ATGBuVPFuG24npRcRxXy98EkvFS1hFqVdgoAMTbL1XWu1
	 ovV5WYF1EZtOHQLIlkOfsX/4VWk9KildRnDpshHtld1h/Kh1TJND71W4Folv/iGj2x
	 isfpdlTkTKlyQ==
Date: Fri, 9 Oct 2026 19:00:26 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Tarun Sahu <tarunsahu@google.com>
Cc: dmatlack@google.com, Pasha Tatashin <pasha.tatashin@soleen.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Pratyush Yadav <pratyush@kernel.org>, kexec@lists.infradead.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] memblock: use binary search to locate candidate
 regions
Message-ID: <askdqgzm2Cbeo3SB@kernel.org>
References: <20261008190828.3221718-1-tarunsahu@google.com>
 <20261008190828.3221718-2-tarunsahu@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008190828.3221718-2-tarunsahu@google.com>

On Thu, Oct 08, 2026 at 07:08:28PM +0000, Tarun Sahu wrote:
> Use binary search (memblock_bsearch_start) in memblock_add_range() and

The function name is __memblock_search now and I think you can drop it
altogether :)

> memblock_isolate_range() to locate candidate regions instead of linearly
> scanning from index 0.
> 
> Under heavy memory fragmentation (such as KHO page preservation registering

Comma instead of open parenthesis feels better to me.

> hundreds of thousands of disjoint folios), scanning from index 0 on every
> insertion and isolation results in O(N^2) complexity, causing boot-time
> memory retrieval to take several minutes (~268s for 393k pages).
> 
> Using binary search reduces the candidate search complexity to O(log N)
> (from O(N)), cutting KHO memory retrieval time from ~268s to ~50ms.
> 
> memblock_search() open codes the same binary search, so reimplement it on
> top of the new helper.
> 
> Signed-off-by: Tarun Sahu <tarunsahu@google.com>
> Reviewed-by: Pratyush Yadav <pratyush@kernel.org>
> ---
>  mm/memblock.c | 45 +++++++++++++++++++++++++++++++--------------
>  1 file changed, 31 insertions(+), 14 deletions(-)
> 
> diff --git a/mm/memblock.c b/mm/memblock.c
> index 59dda7d085f3..614d0a55dd70 100644
> --- a/mm/memblock.c
> +++ b/mm/memblock.c
> @@ -586,6 +586,29 @@ static void __init_memblock memblock_insert_region(struct memblock_type *type,
>  	type->total_size += size;
>  }
>  
> +/**
> + * __memblock_search - Find the first region index where rend > base
> + * @type: memblock type to search
> + * @base: base physical address of the candidate range
> + *
> + * Returns the first region index that could potentially overlap @base.

Return: for proper kernel-doc format AFAIR

> + */
> +static int __init_memblock __memblock_search(struct memblock_type *type,
> +						  phys_addr_t base)
> +{
> +	int mid, low = 0;
> +	int high = type->cnt;
> +
> +	while (low < high) {
> +		mid = (low + high) / 2;
> +		if (type->regions[mid].base + type->regions[mid].size <= base)
> +			low = mid + 1;
> +		else
> +			high = mid;
> +	}
> +	return low;
> +}
> +
>  /**
>   * memblock_add_range - add new memblock region
>   * @type: memblock type to add new region into
> @@ -644,8 +667,9 @@ static int __init_memblock memblock_add_range(struct memblock_type *type,
>  	 */
>  	base = obase;
>  	nr_new = 0;
> +	idx = __memblock_search(type, base);
>  
> -	for (idx = 0; idx < type->cnt; idx++) {
> +	for (; idx < type->cnt; idx++) {


	for (idx = __memblock_search(type, base); ...

>  		struct memblock_region *rgn = &type->regions[idx];
>  		phys_addr_t rbase = rgn->base;
>  		phys_addr_t rend = rbase + rgn->size;
> @@ -821,7 +845,9 @@ static int __init_memblock memblock_isolate_range(struct memblock_type *type,
>  		if (memblock_double_array(type, base, size) < 0)
>  			return -ENOMEM;
>  
> -	for (idx = 0; idx < type->cnt; idx++) {
> +	idx = __memblock_search(type, base);
> +
> +	for (; idx < type->cnt; idx++) {

Same here or even

	for (int idx = __memblock_search(type, base); ...

>  		struct memblock_region *rgn = &type->regions[idx];
>  		phys_addr_t rbase = rgn->base;
>  		phys_addr_t rend = rbase + rgn->size;
> @@ -2062,19 +2088,10 @@ void __init memblock_mem_limit_remove_map(phys_addr_t limit)
>  
>  static int __init_memblock memblock_search(struct memblock_type *type, phys_addr_t addr)
>  {
> -	unsigned int left = 0, right = type->cnt;
> -
> -	do {
> -		unsigned int mid = (right + left) / 2;
> +	int idx = __memblock_search(type, addr);
>  
> -		if (addr < type->regions[mid].base)
> -			right = mid;
> -		else if (addr >= (type->regions[mid].base +
> -				  type->regions[mid].size))
> -			left = mid + 1;
> -		else
> -			return mid;
> -	} while (left < right);
> +	if (idx < type->cnt && addr >= type->regions[idx].base)
> +		return idx;
>  	return -1;
>  }
>  
> -- 
> 2.56.0.385.gd3acb90ef8-goog
> 

-- 
Sincerely yours,
Mike.
