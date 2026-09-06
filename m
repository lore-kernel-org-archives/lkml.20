Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37004964F;
	Sun,  6 Sep 2026 19:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788723202; cv=none; b=TFmsKUVbJG02VO09W4K+RCqKKe5Y32GKMgDUeLSOwNM6aHMvP+CyEsbK7A5jDPbnJUlEc6JdbPz86cUKIfGyHo3j9i+fPomQaehzeyH7fQwyUptNaYKDW0Bu0eVJbUCP8wx0JnxNUjr7mgbpqiawb+5LM3XmuHpN0g6UoBcCkMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788723202; c=relaxed/simple;
	bh=Do2CEdD6a5aUwLTxegZNZ7rZH9H8xfi1JGY3Uv4qcvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SJ4jj+ZLw9E5BP8B+bqf4SxBxJJ5P4s6AZGN3g6jmn2aDw8GjQaIW2EvCMbaeZuiGABE8lX4ql9uG3avd8rHsFtJTBvxUl1Sy1pcfKBzTdF92F/bn0osUYjaYIGiXJwRwDpRTrjQoiaZ9fp5K8aCv2lmEEYhZkPKYU2YiWycm9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UOQ+l3C3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UOQ+l3C3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB2B71F00A3A;
	Sun,  6 Sep 2026 19:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788723200;
	bh=0kNqOTPkZp3J7RemsYmMnYNi7t0didLL0edZoqZbuyw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UOQ+l3C3lLujBRXFNmIZbndVsdbScZNJL6O1tqSdqMjmQrjL6ZYziJuWgml1fG0Sf
	 YZjhOpebC9esQLeWBd/jXa9dy1aBOGM9VUfFMdkM1pq8Z2PBJM6ySVz5xzTC6IWHcr
	 hUPG4TiNf0iGjXu2vtdIdxNSmSj85hQyuGO+G/8KJIYORUlSuKuQuG/X9RChqR/x9Y
	 DsHFniEg6Ij/QnQKTcdYooZxqdcI9V1/aRc3LxVfuVuJOyhGvQIWOkfgrAxuFPAZe2
	 vs5e1PdKfZ70Pm/jfgXnCkSDYJMr9D6/FyFbnT3DbR7iuUbU7GjmYCz5kkL2F0VMoz
	 puMLclabJJmcQ==
Date: Sun, 6 Sep 2026 22:33:11 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org,
	sudeep.holla@kernel.org, jenswi@kernel.org, robh@kernel.org,
	mark.rutland@arm.com, sumit.garg@kernel.org, ardb@kernel.org,
	thierry.reding@kernel.org, david@kernel.org, danielmentz@google.com,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 01/10] memblock: Introduce MEMBLOCK_LLMAP
Message-ID: <ap2_926WXr7uAYVX@kernel.org>
References: <20260902104712.2399797-1-vdonnefort@google.com>
 <20260902104712.2399797-2-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902104712.2399797-2-vdonnefort@google.com>

On Wed, Sep 02, 2026 at 11:47:03AM +0100, Vincent Donnefort wrote:
> Keeping last-level mappings is interesting on some architectures as it
> allows mapping/unmapping pages from the kernel direct map without the
> risk of splitting blocks which, under the break-before-make rule, may
> trigger page-faults the kernel can't handle.
> 
> However, mapping the entire direct map at PTE-level is costly. So
> instead, create a new memblock flag MEMBLOCK_LLMAP to enable the system

I believe MEMBLOCK_PTE_MAP sounds more descriptive.

> to decide which region must be covered by mappings up to the last-level.
> 
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> 
> diff --git a/include/linux/memblock.h b/include/linux/memblock.h
> index d62db9e776cf..d40a5ded188d 100644
> --- a/include/linux/memblock.h
> +++ b/include/linux/memblock.h
> @@ -52,6 +52,7 @@ extern unsigned long long max_possible_pfn;
>   * kernel that we know is good to use. It is the only memory that
>   * allocations may happen from in this phase.
>   * @MEMBLOCK_RSRV_HUGETLB: memory is reserved for hugetlb pages
> + * @MEMBLOCK_LLMAP: memory region to be mapped using last-level mapping
>   */
>  enum memblock_flags {
>  	MEMBLOCK_NONE		= 0x0,	/* No special request */
> @@ -63,6 +64,7 @@ enum memblock_flags {
>  	MEMBLOCK_RSRV_KERN	= 0x20,	/* memory reserved for kernel use */
>  	MEMBLOCK_KHO_SCRATCH	= 0x40,	/* scratch memory for kexec handover */
>  	MEMBLOCK_RSRV_HUGETLB	= 0x80, /* memory reserved for hugetlb pages */
> +	MEMBLOCK_LLMAP		= 0x100,/* last-level mapping */
>  };
>  
>  /**
> @@ -160,6 +162,8 @@ int memblock_reserved_mark_noinit(phys_addr_t base, phys_addr_t size);
>  int memblock_reserved_mark_kern(phys_addr_t base, phys_addr_t size);
>  int memblock_mark_kho_scratch(phys_addr_t base, phys_addr_t size);
>  int memblock_clear_kho_scratch(phys_addr_t base, phys_addr_t size);
> +int memblock_mark_llmap(phys_addr_t base, phys_addr_t size);
> +int memblock_clear_llmap(phys_addr_t base, phys_addr_t size);
>  
>  void memblock_free(void *ptr, size_t size);
>  void reset_all_zones_managed_pages(void);
> @@ -306,6 +310,11 @@ static inline bool memblock_is_kho_scratch(struct memblock_region *m)
>  	return m->flags & MEMBLOCK_KHO_SCRATCH;
>  }
>  
> +static inline bool memblock_is_llmap(struct memblock_region *m)
> +{
> +	return m->flags & MEMBLOCK_LLMAP;
> +}
> +
>  int memblock_search_pfn_nid(unsigned long pfn, unsigned long *start_pfn,
>  			    unsigned long  *end_pfn);
>  void __next_mem_pfn_range(int *idx, int nid, unsigned long *out_start_pfn,
> diff --git a/mm/memblock.c b/mm/memblock.c
> index 9ce86349a29f..1591b50503ed 100644
> --- a/mm/memblock.c
> +++ b/mm/memblock.c
> @@ -1119,6 +1119,16 @@ int __init_memblock memblock_mark_mirror(phys_addr_t base, phys_addr_t size)
>   */
>  int __init_memblock memblock_mark_nomap(phys_addr_t base, phys_addr_t size)
>  {
> +	struct memblock_region *r;
> +
> +	memblock_cap_size(base, &size);
> +
> +	for_each_mem_region(r) {
> +		if (memblock_is_llmap(r) &&
> +		    memblock_addrs_overlap(base, size, r->base, r->size))
> +			return -EINVAL;
> +	}

I'm not very fond of implicit skips here. memblock has no idea what's the
caller intention, maybe it actually wants to change the memory from nomap
to pte-mapped.

I'd rather warn in memblock_is_nomap() and memblock_is_llmap() if they both
are set and let the caller deal with making sure they are not.

> +
>  	return memblock_setclr_flag(&memblock.memory, base, size, 1, MEMBLOCK_NOMAP);
>  }
>  
> @@ -1204,6 +1214,45 @@ __init int memblock_clear_kho_scratch(phys_addr_t base, phys_addr_t size)
>  				    MEMBLOCK_KHO_SCRATCH);
>  }
>  
> +/**
> + * memblock_mark_llmap - Mark a memory region with flag MEMBLOCK_LLMAP.
> + * @base: the base phys addr of the region
> + * @size: the size of the region
> + *
> + * If supported by the architecture, such region is mapped at the last-level in
> + * the kernel direct map.
> + *
> + * Return: 0 on success, -errno on failure.
> + */
> +int __init_memblock memblock_mark_llmap(phys_addr_t base, phys_addr_t size)
> +{
> +	struct memblock_region *r;
> +
> +	memblock_cap_size(base, &size);
> +
> +	for_each_mem_region(r) {
> +		if (memblock_is_nomap(r) &&
> +		    memblock_addrs_overlap(base, size, r->base, r->size))
> +			return -EINVAL;
> +	}

same here

> +
> +	return memblock_setclr_flag(&memblock.memory, base, size, 1,
> +				    MEMBLOCK_LLMAP);
> +}
> +
> +/**
> + * memblock_clear_llmap - Clear flag MEMBLOCK_LLMAP for a specified region.
> + * @base: the base phys addr of the region
> + * @size: the size of the region
> + *
> + * Return: 0 on success, -errno on failure.
> + */
> +int __init_memblock memblock_clear_llmap(phys_addr_t base, phys_addr_t size)
> +{
> +	return memblock_setclr_flag(&memblock.memory, base, size, 0,
> +				    MEMBLOCK_LLMAP);
> +}
> +
>  static bool should_skip_region(struct memblock_type *type,
>  			       struct memblock_region *m,
>  			       int nid, int flags)
> @@ -2886,6 +2935,7 @@ static const char * const flagname[] = {
>  	[ilog2(MEMBLOCK_RSRV_NOINIT)] = "RSV_NIT",
>  	[ilog2(MEMBLOCK_RSRV_KERN)] = "RSV_KERN",
>  	[ilog2(MEMBLOCK_KHO_SCRATCH)] = "KHO_SCRATCH",
> +	[ilog2(MEMBLOCK_LLMAP)] = "LLMAP",
>  };
>  
>  static int memblock_debug_show(struct seq_file *m, void *private)
> -- 
> 2.55.0.970.g62bdec98f9-goog
> 

-- 
Sincerely yours,
Mike.
