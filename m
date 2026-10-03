Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2585038E5C8
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 07:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791014174; cv=none; b=jPaouMC1aZ0BTGFpx6sJ9CFHCEgn4xZ8dH/4ghe7+Im32sxQK4ZslSvrClW0jOGzubWzhXayMHQMzbuGef+brnTGbWlkiYPKVlzUN85kvQKaewckOuCBIi9oToX93J4VrVz1fcecSaKkjX4B0CpAVC0N/EJPsM+Ir5FYFbWB9+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791014174; c=relaxed/simple;
	bh=k0J6W1MsAzAFB4BTPOdrFa7JvTaIBlAmVwyzoKYbEK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gpkWX+N8th4dWrlkJxD5XIjN+B7GviHopMXM53+3QyBEjmvqTGAQAvRG96I9sXYpSyKNcZZFKlH/uZSB0CkyJ9nRtRF85pVawVNXWGnyc9AljiYbO6Nbeii1LjlLSCifN7i2UMxAdvlw6YzVJH8cys0tp1QQh5pGIWV+AkLEqB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VRLJc7Hy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VRLJc7Hy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67E6A1F0089B;
	Sat,  3 Oct 2026 07:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791014172;
	bh=UPO4RM0i7SP/IETP8H+05lmtRukMrZzOkuL7g4aF8U4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VRLJc7HyEynjBACssz2mmFo30gjCyNt5Q471QjoAwHeXP5o4nCvfFp9iyqR2qwIYy
	 rdqKYt47RndMm6y1XcQ1FG8JEyO/28b1E10zVwA4k4cSfHfXz9a3q0FS4/ISdbLKOC
	 75jgXrEMNeuWwhSa8lOgEgKFM1e1ytwEe/cQK0NnbQgVRgoSaIE+nx/ug084XIddZN
	 yOIMS7FjC7SBakdQIeX3JIw7XCAE8j2vFG8jjmOCrjuhh2/LjnWS55aGmORTvWuvbJ
	 HE7kIH1M+QqWOfDYzLHCKurMsqEw4mKRNR1LmeCrzdw0+Lxe3xXPkdJgRE0FZ79p/q
	 JgL18ukxU0ciQ==
Date: Sat, 3 Oct 2026 09:56:07 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Tarun Sahu <tarunsahu@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, dmatlack@google.com,
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
	dev.jain@arm.com, Pratyush Yadav <pratyush@kernel.org>,
	linux-mm@kvack.org
Subject: Re: [PATCH v3 2/2] memblock: use binary search to locate candidate
 regions
Message-ID: <asC1FwHVHOhBHDGK@kernel.org>
References: <20260926092448.4090401-1-tarunsahu@google.com>
 <20260926092448.4090401-2-tarunsahu@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260926092448.4090401-2-tarunsahu@google.com>

On Sat, Sep 26, 2026 at 09:24:48AM +0000, Tarun Sahu wrote:
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
> memblock_search() open codes the same binary search, so reimplement it on
> top of the new helper.
> 
> Signed-off-by: Tarun Sahu <tarunsahu@google.com>
> 
>  mm/memblock.c | 53 +++++++++++++++++++++++++++++++++++----------------
>  1 file changed, 37 insertions(+), 16 deletions(-)
> 
> diff --git a/mm/memblock.c b/mm/memblock.c
> index 59dda7d085f3..87c71435c80c 100644
> --- a/mm/memblock.c
> +++ b/mm/memblock.c
> @@ -586,6 +586,33 @@ static void __init_memblock memblock_insert_region(struct memblock_type *type,
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

I'd call it __memblock_search()

> +{
> +	int mid, low = 0;
> +	int high = type->cnt;
> +
> +	if (type->cnt && base >= type->regions[type->cnt - 1].base +
> +				 type->regions[type->cnt - 1].size)
> +		return type->cnt;

Using local variables would make it more readable IMHO.

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
> @@ -609,7 +636,7 @@ static int __init_memblock memblock_add_range(struct memblock_type *type,
>  	bool insert = false;
>  	phys_addr_t obase = base;
>  	phys_addr_t end = base + memblock_cap_size(base, &size);
> -	int idx, nr_new, start_rgn = -1, end_rgn;
> +	int idx, start_idx, nr_new, start_rgn = -1, end_rgn;
>  
>  	if (!size)
>  		return 0;
> @@ -644,8 +671,9 @@ static int __init_memblock memblock_add_range(struct memblock_type *type,
>  	 */
>  	base = obase;
>  	nr_new = 0;
> +	start_idx = memblock_bsearch_start(type, base);
>  
> -	for (idx = 0; idx < type->cnt; idx++) {
> +	for (idx = start_idx; idx < type->cnt; idx++) {
>  		struct memblock_region *rgn = &type->regions[idx];
>  		phys_addr_t rbase = rgn->base;
>  		phys_addr_t rend = rbase + rgn->size;
> @@ -809,7 +837,7 @@ static int __init_memblock memblock_isolate_range(struct memblock_type *type,
>  					int *start_rgn, int *end_rgn)
>  {
>  	phys_addr_t end = base + memblock_cap_size(base, &size);
> -	int idx;
> +	int idx, start_idx;
>  
>  	*start_rgn = *end_rgn = 0;
>  
> @@ -821,7 +849,9 @@ static int __init_memblock memblock_isolate_range(struct memblock_type *type,
>  		if (memblock_double_array(type, base, size) < 0)
>  			return -ENOMEM;
>  
> -	for (idx = 0; idx < type->cnt; idx++) {
> +	start_idx = memblock_bsearch_start(type, base);
> +
> +	for (idx = start_idx; idx < type->cnt; idx++) {
>  		struct memblock_region *rgn = &type->regions[idx];
>  		phys_addr_t rbase = rgn->base;
>  		phys_addr_t rend = rbase + rgn->size;
> @@ -2062,19 +2092,10 @@ void __init memblock_mem_limit_remove_map(phys_addr_t limit)
>  
>  static int __init_memblock memblock_search(struct memblock_type *type, phys_addr_t addr)
>  {
> -	unsigned int left = 0, right = type->cnt;
> +	int idx = memblock_bsearch_start(type, addr);
>  
> -	do {
> -		unsigned int mid = (right + left) / 2;
> -
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
> base-commit: 1f18d740165163910df64d3063e1ad31648bc5e0
> -- 
> 2.56.0.rc1.315.gc6ed9934b7-goog
> 

-- 
Sincerely yours,
Mike.
