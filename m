Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4077D55D897
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 14:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789653611; cv=none; b=fPNNNtDL3mLm+600ymafu6JMlsDWd8Vb9tMPH4zRu7NRdGQefJDwI1QKgq0rVFHtOhfzuf+Z1L7gyqvSgJ0C+hS8rUuvmzthG/nG8r5FeP/Zv29NJHfRLjpqkabpD5q3d7VWQZp9yHbp1mBdBPvSRZKMOCNJD4IjY8zg6G7r6GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789653611; c=relaxed/simple;
	bh=6D8PFnjRu6MnBhpiKrtUW6+ACupt8QMrpZ8U3orf9AU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EMQr9YrIsnJMyT5aESxx0hYO9RTZ3QIjqJW3C7S6HDQ+xjXxOtrLQi7Peou8+jz/4xySIGIeaLuk7W8YTZ/o2yjOxT0zkrYTlYwV1fh3dNCSv2jvrFR2WIxzqEdXzj3/oYbu3WVo2mJPH6aEJhJRXqMRCI3iypzhV9szrTKY01A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V5zw2bKn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V5zw2bKn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F2351F000FF;
	Thu, 17 Sep 2026 14:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789653609;
	bh=rF0BtYMFWD7pbUoewLZT8mBNaLMLep6fnG7M6eFSgew=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=V5zw2bKn13/jSs5oYoBaVSxDvVGNH5RAFypAh0bqZw5RVdBazKjorZGSozYJi0rKR
	 qrdBhf5YWC9rDRmzz0bTjcnXOH0CZrAYY8VRSqierzDIf04pI6MBlHJKlLpkPJj+UC
	 nDwhjPVTlRNWwld+zl03AF+e0uBDLKdcrOm3+KRSRq6omTdsOlcsPBngKo8TtXxeTd
	 JlrwIqe3ielkYtrwB8L8P53XLDPu4aCUv22o/hwzZvUmLcq1kJr5MUUjcTupngwM+Q
	 Y5ZLpMsUJn2tIFiQoKXR/3PjxO8yUmnFLk046Qu4tSIGQrLGr6mZN59Tn5kliAmrQm
	 d+k0M8EebydDw==
Message-ID: <27072d94-13bf-4bea-948a-d8a67976601e@kernel.org>
Date: Thu, 17 Sep 2026 16:00:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 03/10] mm/vmalloc: use pte_set_huge()/pte_clear_huge()
 for PTE-level block mappings
To: Wen Jiang <jiangwenxiaomi@gmail.com>, akpm@linux-foundation.org,
 catalin.marinas@arm.com, linux-mm@kvack.org, urezki@gmail.com,
 will@kernel.org
Cc: Xueyuan.chen21@gmail.com, ajd@linux.ibm.com, anshuman.khandual@arm.com,
 baohua@kernel.org, david@kernel.org, dev.jain@arm.com, jiangwen6@xiaomi.com,
 leo.yan@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, rppt@kernel.org,
 ryan.roberts@arm.com
References: <20260917052933.188679-1-jiangwenxiaomi@gmail.com>
 <20260917052933.188679-4-jiangwenxiaomi@gmail.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260917052933.188679-4-jiangwenxiaomi@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 17/09/2026 à 07:29, Wen Jiang a écrit :
> From: Wen Jiang <jiangwen6@xiaomi.com>
> 
> vmap installs PTE-level block mappings by reusing set_huge_pte_at() and
> huge_ptep_get_and_clear() under #ifdef CONFIG_HUGETLB_PAGE. This makes
> the feature silently unavailable on CONFIG_HUGETLB_PAGE=n kernels and
> couples mm/vmalloc.c to HugeTLB internals it does not otherwise need.
> 
> Now that arm64 and powerpc/8xx provide pte_set_huge() and
> pte_clear_huge(), add the generic fallbacks next to the existing
> pmd/pud_set_huge() family and convert vmap_pte_range() and
> vunmap_pte_range() to the new helpers. The CONFIG_HUGETLB_PAGE guards
> around the block-mapping paths are dropped, so PTE-level block mappings
> now also work on CONFIG_HUGETLB_PAGE=n kernels, and mm/vmalloc.c no
> longer includes <linux/hugetlb.h>.
> 
> The fallbacks exist only to keep the build working on architectures
> without PTE-level block mapping support. They are unreachable there:
> the callers only run when arch_vmap_pte_range_map_size() or
> arch_vmap_pte_range_unmap_size() return a size other than PAGE_SIZE,
> which requires an arch implementation. WARN_ON_ONCE() makes that
> explicit rather than silently doing nothing.
> 
> Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> ---
>   include/linux/pgtable.h | 29 +++++++++++++++++++++++++++++
>   mm/vmalloc.c            | 19 ++++++-------------
>   2 files changed, 35 insertions(+), 13 deletions(-)
> 
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index cdd68ed3ae1a9..349ced999f959 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -2134,6 +2134,35 @@ static inline int pmd_free_pte_page(pmd_t *pmd, unsigned long addr)
>   }
>   #endif	/* CONFIG_HAVE_ARCH_HUGE_VMAP */
>   
> +/*
> + * PTE-level block mappings for vmap.
> + *
> + * pte_set_huge() only has to be implemented by architectures whose
> + * arch_vmap_pte_range_map_size() can return a size other than PAGE_SIZE.
> + */
> +#ifndef __HAVE_ARCH_PTE_SET_HUGE
> +static inline void pte_set_huge(pte_t *ptep, unsigned long addr,
> +				phys_addr_t phys, pgprot_t prot,
> +				unsigned long size)
> +{
> +	WARN_ON_ONCE(1);

BUILD_BUG_ON() would be better here.

It should be possible because fallback arch_vmap_pte_range_map_size() 
will constant-fold PAGE_SIZE so pte_set_huge() will never be called.

> +}
> +#endif
> +
> +/*
> + * Likewise, pte_clear_huge() only has to be implemented by architectures
> + * whose arch_vmap_pte_range_unmap_size() can return a size other than
> + * PAGE_SIZE.
> + */
> +#ifndef __HAVE_ARCH_PTE_CLEAR_HUGE
> +static inline pte_t pte_clear_huge(pte_t *ptep, unsigned long addr,
> +				   unsigned long size)
> +{
> +	WARN_ON_ONCE(1);
> +	return __pte(0);

Same I guess.

> +}
> +#endif
> +
>   #ifndef __HAVE_ARCH_FLUSH_PMD_TLB_RANGE
>   #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>   /*
