Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A614747DD43
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789462025; cv=none; b=QNO10OTMSQAxgC77ToC3pgcv1LnM4SFA02TSjQaZJfmylU2EeKacumMYjWMix4L7xPSWMD/pwHE1IYzTtLHdJ8WHLF4rN/7v8jNtkIhHdJrGcWcXW6agYPTiwLg7QX+2L8WemOuL8Bk4NSzbYfN+zGxmUpWSh4cCPV+4bOwjzFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789462025; c=relaxed/simple;
	bh=hy+b+gcELjslnoH4ZJSHjXE6Z4kki4G4RkxDwkEviiI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IcKUmjb+vM42goAxBQ54olvF8kHDXs95YIhmEuDro9DjcuqCSQLo3WWeqdtQVIVemnblPiSD1/PtwtJ/tgRoV8eo1dNm78Oi2g2ldkJMinxD8K+h4ZbJ8ylqSCXpjRc7m7aParDHZebx/5DdX3gzukFZoaZjdfo8JUJ7YksFZ4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L6RIYB4t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L6RIYB4t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D4A91F000FF;
	Tue, 15 Sep 2026 08:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789462024;
	bh=wK2W2uongp7wJVjy1t0+DLgCG6nyVaTFIPWkinS9neo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=L6RIYB4texZzX1ZlecKG1L7F0lnZLSfxBR8u1qDQiw//ny+5kmvpADTbQdQjgzLzx
	 xy507JtPyIXGrPhNV6FUzmKHApBnbzfj187VPQ+HF4bvttEby3CskFbaFHeW+gD0cW
	 MWtyeTmRr+AJw90AFI6KKVTgXOIENOGrRgyJ/JZx5Oo48qRwHtN5a/xlVSzdHtrzlZ
	 /nkn/JCrT3gX0g7j3rLkQ/BPejg7dwL/UAI4GMpVNs46aTZMBVFsSFx1aP8arO+RE+
	 W62J32O5vH4w3Zqz9HxXXr0r4ixe6fUc+1k4T3rNPR5vRCARNo+07JQt3TWjt9GJzm
	 K3O/oq+zYtJIg==
Date: Tue, 15 Sep 2026 09:46:58 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Kaitao Cheng <kaitao.cheng@linux.dev>
Cc: Mike Rapoport <rppt@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	"Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Muchun Song <muchun.song@linux.dev>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Kaitao Cheng <chengkaitao@kylinos.cn>
Subject: Re: [PATCH] mm: Remove unused exact_nid parameter from memmap_alloc()
Message-ID: <aqkE4DhNFWIzgHHo@gremlin>
References: <20260914055130.44543-1-kaitao.cheng@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914055130.44543-1-kaitao.cheng@linux.dev>

On Mon, Sep 14, 2026 at 01:51:30PM +0800, Kaitao Cheng wrote:
> From: Kaitao Cheng <chengkaitao@kylinos.cn>
>
> Commit ffe55393137c ("mm/sparse: remove sparse buffer pre-allocation
> mechanism") removed sparse_buffer_init(), which was the only caller of
> memmap_alloc() that passed true for exact_nid.
>
> All remaining callers pass false, leaving the exact-node allocation
> branch unreachable. Remove the exact_nid parameter and unconditionally
> use memblock_alloc_try_nid_raw().
>
> This has no functional impact.
>
> Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
> ---
>  mm/mm_init.c        | 14 ++++----------
>  mm/mm_init.h        |  4 ++--
>  mm/sparse-vmemmap.c |  2 +-
>  mm/sparse.c         |  2 +-
>  4 files changed, 8 insertions(+), 14 deletions(-)
>
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> index beeeed4688c1..6af5cabf3e75 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -1601,7 +1601,7 @@ static void __init free_area_init_core(struct pglist_data *pgdat)
>  }
>
>  void __init *memmap_alloc(phys_addr_t size, phys_addr_t align,
> -			  phys_addr_t min_addr, int nid, bool exact_nid)
> +			  phys_addr_t min_addr, int nid)
>  {
>  	void *ptr;
>
> @@ -1609,14 +1609,8 @@ void __init *memmap_alloc(phys_addr_t size, phys_addr_t align,
>  	 * Kmemleak will explicitly scan mem_map by traversing all valid
>  	 * `struct *page`,so memblock does not need to be added to the scan list.
>  	 */
> -	if (exact_nid)
> -		ptr = memblock_alloc_exact_nid_raw(size, align, min_addr,
> -						   MEMBLOCK_ALLOC_NOLEAKTRACE,
> -						   nid);

I don't see anything else _in the kernel_ reference
memblock_alloc_exact_nid_raw(), though I do see some stuff in
tools/testing/memblock/tests/alloc_exact_nid_api.c.

So I suggest removing memblock_alloc_exact_nid_raw() and
tools/testing/memblock/tests/alloc_exact_nid_api.c (and updating the testing to
account for it as necessary) too.

Also I see both memblock_alloc_try_nid_raw(), memblock_alloc_exact_nid_raw() and
memblock_alloc_try_nid() call memblock_alloc_internal() with an exact_nid last
parameter too.

Only memblock_alloc_exact_nid_raw(), which you should delete, passes this
parameter as true, so you should drop this parameter too.

AND THEN :) it passes exact_nid to memblock_alloc_range_nid() and... I leave it
to you to go investigate if that ever has exact_nid=true passed there.

Let's clean this up all the way please!

> -	else
> -		ptr = memblock_alloc_try_nid_raw(size, align, min_addr,
> -						 MEMBLOCK_ALLOC_NOLEAKTRACE,
> -						 nid);
> +	ptr = memblock_alloc_try_nid_raw(size, align, min_addr,
> +					 MEMBLOCK_ALLOC_NOLEAKTRACE, nid);
>
>  	if (ptr && size > 0)
>  		page_init_poison(ptr, size);
> @@ -1644,7 +1638,7 @@ static void __init alloc_node_mem_map(struct pglist_data *pgdat)
>  	end = ALIGN(pgdat_end_pfn(pgdat), MAX_ORDER_NR_PAGES);
>  	size =  (end - start) * sizeof(struct page);
>  	map = memmap_alloc(size, SMP_CACHE_BYTES, MEMBLOCK_LOW_LIMIT,
> -			   pgdat->node_id, false);
> +			   pgdat->node_id);
>  	if (!map)
>  		panic("Failed to allocate %ld bytes for node %d memory map\n",
>  		      size, pgdat->node_id);
> diff --git a/mm/mm_init.h b/mm/mm_init.h
> index c9fc35e7e9f1..a8ed5c20851b 100644
> --- a/mm/mm_init.h
> +++ b/mm/mm_init.h
> @@ -31,8 +31,8 @@ static inline void clear_zone_contiguous(struct zone *zone)
>
>  void memblock_free_pages(unsigned long pfn, unsigned int order);
>
> -void *memmap_alloc(phys_addr_t size, phys_addr_t align, phys_addr_t min_addr,
> -		int nid, bool exact_nid);
> +void *memmap_alloc(phys_addr_t size, phys_addr_t align,
> +		   phys_addr_t min_addr, int nid);
>
>  void memmap_init_range(unsigned long size, int nid, unsigned long zone,
>  		unsigned long start_pfn, unsigned long zone_end_pfn,
> diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
> index f22d815d7af0..c2fa5fbf0972 100644
> --- a/mm/sparse-vmemmap.c
> +++ b/mm/sparse-vmemmap.c
> @@ -53,7 +53,7 @@ static void * __ref __earlyonly_bootmem_alloc(int node,
>  				unsigned long align,
>  				unsigned long goal)
>  {
> -	return memmap_alloc(size, align, goal, node, false);
> +	return memmap_alloc(size, align, goal, node);
>  }
>
>  void * __meminit vmemmap_alloc_block(unsigned long size, int node)
> diff --git a/mm/sparse.c b/mm/sparse.c
> index cc28bb41fdb1..f032c98b92d9 100644
> --- a/mm/sparse.c
> +++ b/mm/sparse.c
> @@ -215,7 +215,7 @@ struct page __init *__populate_section_memmap(unsigned long pfn,
>  {
>  	const unsigned long size = PAGE_ALIGN(sizeof(struct page) * PAGES_PER_SECTION);
>
> -	return memmap_alloc(size, size, __pa(MAX_DMA_ADDRESS), nid, false);
> +	return memmap_alloc(size, size, __pa(MAX_DMA_ADDRESS), nid);
>  }
>  #endif /* !CONFIG_SPARSEMEM_VMEMMAP */
>
> --
> 2.54.0 (Apple Git-157)
>

--
Cheers, Lorenzo
