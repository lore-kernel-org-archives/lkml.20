Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077D43E0234
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 10:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788690335; cv=none; b=lrNEIi10vHKHNgTGUZHuSJXg/1CHGj66Enw4nJ2moaKNP3Xr5WE1zDmphQ3xXlCGQm3C4MfSbJuiisQP0sexIH74jTkvaCfWqy4LgOvbUlm2cIjR6024gG8rXCu+tG1WbWuBPZFteUAawu0gIsVOZJ9qcUm3MfzKwvionVrT0wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788690335; c=relaxed/simple;
	bh=f/K93XfnCe4oB5F0XkA4i4OrBScfOrs8uaKROs6hPOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lZ9ukHwjnv+vH8GBI7Qd1f1nkQEDSW0hUYyj0QV1aDQNSVOjJJz5+phcsnquFQb/x1CNc2/0miOxzJxR0mIv6DRbV02pWTo17pzxCddp+zzQwlJnwUID9epgtUGevARCmBt0ooHjkhxpl7s7RleP6stBMw+TnCbuJactKUggsY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aT+A71hJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aT+A71hJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C4E71F00A3A;
	Sun,  6 Sep 2026 10:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788690332;
	bh=2XPq6jBsWxzSGkLN5JMNAqBj9VumCx6phCWWl2LqB4Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aT+A71hJ8NCIRzwZvUAlmCF2acDHq2xysOzGVgGT3iPsEhswJ4mdi3jeaJj0iN+1f
	 HJ8Wr8RRz4il12phVpTJYqK7TZm6HBoFHc23BkPlzoVI5sOLzIcKxRJuafbti3zxqq
	 bBXfVWqy+KEdv6XsvE4Qy0digyusQeELvEYWRpU8teA74oWoYP3Zt0fHRT4wrmKt5g
	 0m94g72F2kB5Tbe47F6EGnNZHQc88m1JsxF1TNvzE9iMJY45iWStpPyPTxmO6fgjcY
	 wZ3IdvyxptArEnj1FQAsXDPHZTNWBFUPdAkGExdGbWnfmejDhiw5BQZPl6GBlhefSg
	 0tHqpXaRiaZLg==
Date: Sun, 6 Sep 2026 13:25:25 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Tarun Sahu <tarunsahu@google.com>
Cc: dmatlack@google.com, Pasha Tatashin <pasha.tatashin@soleen.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Pratyush Yadav <pratyush@kernel.org>, linux-kernel@vger.kernel.org,
	kexec@lists.infradead.org, linux-mm@kvack.org
Subject: Re: [PATCH] memblock: use binary search to locate candidate regions
Message-ID: <ap0_lSVF43FP3PPb@kernel.org>
References: <20260903155907.1065681-1-tarunsahu@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903155907.1065681-1-tarunsahu@google.com>

Hi Tarun,

On Thu, Sep 03, 2026 at 03:59:06PM +0000, Tarun Sahu wrote:
> Use binary search (memblock_bsearch_start) in memblock_add_range() and
> memblock_isolate_range() to locate candidate regions instead of linearly
> scanning from index 0.
> 
> Under heavy memory fragmentation (such as KHO page preservation registering
> hundreds of thousands of disjoint folios), scanning from index 0 on every
> insertion and isolation results in O(N^2) complexity, causing boot-time
> memory retrieval to take several minutes (~268s for 393k pages).
> 
> Using binary search reduces the worst-case complexity to O(N log N)
> (and O(N) for sequential appends), cutting KHO memory retrieval time
> from ~268s to ~50ms.
> 
> Signed-off-by: Tarun Sahu <tarunsahu@google.com>
> ---
>  mm/memblock.c | 38 ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 36 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/memblock.c b/mm/memblock.c
> index 9ce86349a29f..88940474b020 100644
> --- a/mm/memblock.c
> +++ b/mm/memblock.c
> @@ -160,6 +160,11 @@ static __refdata struct memblock_type *memblock_memory = &memblock.memory;
>  	     i < memblock_type->cnt;					\
>  	     i++, rgn = &memblock_type->regions[i])
>  
> +#define for_each_memblock_type_from(i, memblock_type, rgn, start)	\
> +	for (i = (start), rgn = &memblock_type->regions[i];		\
> +	     i < memblock_type->cnt;					\
> +	     i++, rgn = &memblock_type->regions[i])
> +
>  #define memblock_dbg(fmt, ...)						\
>  	do {								\
>  		if (memblock_debug)					\
> @@ -591,6 +596,33 @@ static void __init_memblock memblock_insert_region(struct memblock_type *type,
>  	type->total_size += size;
>  }
>  
> +/**
> + * memblock_bsearch_start - Find the first region index where rend > base
> + * @type: memblock type to search
> + * @base: base physical address of the candidate range
> + *
> + * Returns the first region index that could potentially overlap @base.
> + */
> +static int __init_memblock memblock_bsearch_start(struct memblock_type *type,
> +						  phys_addr_t base)
> +{

We already have memblock_search() ;-)

> +	int mid, low = 0;
> +	int high = type->cnt;
> +
> +	if (type->cnt && base >= type->regions[type->cnt - 1].base +
> +				 type->regions[type->cnt - 1].size)
> +		return type->cnt;
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
> @@ -651,7 +683,8 @@ static int __init_memblock memblock_add_range(struct memblock_type *type,
>  	base = obase;
>  	nr_new = 0;
>  
> -	for_each_memblock_type(idx, type, rgn) {
> +	for_each_memblock_type_from(idx, type, rgn,
> +				    memblock_bsearch_start(type, base)) {

I think we can just kill for_each_memblock_type() and open code all loops
that use it and make memblock_add_range() and memblock_isolate_range() use
binary search.

>  		phys_addr_t rbase = rgn->base;
>  		phys_addr_t rend = rbase + rgn->size;
>  
> @@ -827,7 +860,8 @@ static int __init_memblock memblock_isolate_range(struct memblock_type *type,
>  		if (memblock_double_array(type, base, size) < 0)
>  			return -ENOMEM;
>  
> -	for_each_memblock_type(idx, type, rgn) {
> +	for_each_memblock_type_from(idx, type, rgn,
> +				    memblock_bsearch_start(type, base)) {
>  		phys_addr_t rbase = rgn->base;
>  		phys_addr_t rend = rbase + rgn->size;
>  
> -- 
> 2.55.0.970.g62bdec98f9-goog
> 

-- 
Sincerely yours,
Mike.
