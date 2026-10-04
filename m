Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A242566F7
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 13:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791121630; cv=none; b=cDo6AQWtpcFcwBjABkNxG9nd8CdF5ew6dxmJWZrHqqOsG445PDvmNrh4UqKulTtIPh3V0SiyIhcln+hOhWP3P0vXEe5IFxCZGOHtVB6oGRwishpQhPtieAVUX+MhjZ/0O1PPyOHlyluB4cYCS/cSU/+6p5/iW1vurZFt+nONn3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791121630; c=relaxed/simple;
	bh=+H/LK9pldSq75Vnp9Wpnv4t7kL1lHeZdHpTieZtFgX8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=V43O9/j82MpfFaVO8AyzIW6guEPVBy14XDxkiUOroWPNvtNDpTSurQ8vLVdHXy3yX9xUxgc0zRX2HND8S9rVNhruqin2tnCi7xP0HxBuoFo4nJ+W28HM6aAamaAywVMzR7UJnCBDGh8uJWoMieMIQl2K2hQT1vbGgDvcaD3Iaes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VxhHcyw1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VxhHcyw1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 915591F000FF;
	Sun,  4 Oct 2026 13:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791121629;
	bh=2Anbtm+pdahgrR9ZC/t4cu36UZjvdx8AEA18HRuyx4U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=VxhHcyw17121mWewQWnFBlYu36WeLuxLz3s760/ygRpHOFWiW8bTFngobR3fAy91w
	 F1s4OP2siQlEdbeom+A0c7ukrdAI2zTErw1X22qTFMh7SIi7eE7iw4loPqsHFBobAu
	 68ewnymwJZ6caC1aE7V/FpxHLPVuPSJLcVQZ+xWsuEMefzBeD9b5Hx+ibfJgVHy5Md
	 dy/CqZy0oru33VHC2txLf1g9Wd5aS+/axHyLERZhV1qTikLOp6/f0mzSrNb8wT8VJc
	 S1XnWjiYpj1LRD3+fhTfaWIqZWUtBCe2ufRB0UoVE0z+MQ5gRpnb0kaEAhyKicwLYl
	 kvo/Uswz0DQbg==
From: Pratyush Yadav <pratyush@kernel.org>
To: Tarun Sahu <tarunsahu@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,  Pasha Tatashin
 <pasha.tatashin@soleen.com>,  dmatlack@google.com,  Mike Rapoport
 <rppt@kernel.org>,  kexec@lists.infradead.org,
  linux-kernel@vger.kernel.org,  dev.jain@arm.com,  Pratyush Yadav
 <pratyush@kernel.org>,  linux-mm@kvack.org
Subject: Re: [PATCH v3 2/2] memblock: use binary search to locate candidate
 regions
In-Reply-To: <20260926092448.4090401-2-tarunsahu@google.com> (Tarun Sahu's
	message of "Sat, 26 Sep 2026 09:24:48 +0000")
References: <20260926092448.4090401-1-tarunsahu@google.com>
	<20260926092448.4090401-2-tarunsahu@google.com>
Date: Sun, 04 Oct 2026 15:47:05 +0200
Message-ID: <2vxz8q4dlgrq.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sat, Sep 26 2026, Tarun Sahu wrote:

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
> +{
> +	int mid, low = 0;
> +	int high = type->cnt;
> +
> +	if (type->cnt && base >= type->regions[type->cnt - 1].base +
> +				 type->regions[type->cnt - 1].size)
> +		return type->cnt;

In some testing I did of this patch some time ago, I recall that this
check didn't have much of a difference on performance. The binary search
is the real optimization.

Do you think this check is worth keeping?

Other than this, I only have a couple minor nitpicks below.

Regardless of these small comments, this patch LGTM so feel free to add

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

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

Nit: why have start_idx as a separate variable? Why not assign idx to
the result of memblock_bsearch_start() directly?

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

Same here.

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

-- 
Regards,
Pratyush Yadav
