Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CADFD296BC8
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 02:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791168012; cv=none; b=tqRQyV7jNYyIlpkYUJYOy3Rw6vCKdJgH0HsXqI3c7cz7kM1mk03C4xSbuK6PWOPQlGcL0+ifJkvn/MY5/BJh3eYDzdVWsTfrh86BSMHLrl4sm7I2SYGuOZpYkQPJZzodcWsRgRJ+kZXfcMbTGyms9NDmXHG3VzUZvy+8TuvRPgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791168012; c=relaxed/simple;
	bh=4nKoqMv1Uc1IZmsQ8w941NyDGQ2IHgdv/9GpM2fH8Ss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ctzIGugVydwWdjnLKE//I+RCR5isKhwm0DPp++E9LnnYiB/l1ajvzTuUQhRUfjHTYGcIqIs/7YbWMkTAOfDDuUCcLc1LzvOqyPv4X732UU3TyERCn6t+8rVLOzhemqhMooNQ8HAwrDevBY16RRoNl5Ra8ANP5P0GKfIG5eXNJak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=XMUBUTAR; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="XMUBUTAR"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 939061595;
	Sun,  4 Oct 2026 19:40:06 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3EF083F763;
	Sun,  4 Oct 2026 19:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791168010; bh=4nKoqMv1Uc1IZmsQ8w941NyDGQ2IHgdv/9GpM2fH8Ss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XMUBUTARAG359qBmKsP9jDxEE8bgeYMhPMO6ZFfBn9WWyS11rP7LAl+jhXbO+E/u4
	 am5BFAH1a+yV1q6HEz3iCJiIFkwOP0hxMXYNH0ghYKSLBOCtc6MlR/kmWfKHpyjhBR
	 jhQMx6WFTbeiXefXKOmjaJDLkuNdm8074HpuOPdo=
Date: Mon, 5 Oct 2026 08:10:06 +0530
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, "Jose A . Perez de Azpillaga" <azpijr@gmail.com>, 
	"Liam R. Howlett" <liam@infradead.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>
Subject: Re: [PATCH v2 2/3] mm/memory: remove the mkwrite argument from
 __vm_insert_mixed()
Message-ID: <i64bejs7dhn5bozzphibmoh2ghgzklruvk4evzag7tqkvbq6ez@epb3kdpmcs3b>
References: <20261002160535.661399-1-ekffu200098@gmail.com>
 <20261002160535.661399-3-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002160535.661399-3-ekffu200098@gmail.com>

On Sat, Oct 03, 2026 at 01:05:33AM +0900, Sang-Heon Jeon wrote:
> __vm_insert_mixed() is only called from vmf_insert_mixed() with
> mkwrite == false, so mkwrite is also always false in vm_mixed_ok()
> and insert_pfn().
> 
> So remove the argument and the unreachable code in insert_pfn().
> 
> No functional change.
> 
> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

> ---
>  mm/memory.c | 57 +++++++++++++++++------------------------------------
>  1 file changed, 18 insertions(+), 39 deletions(-)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index 4b2e4be28031..6c1d38eba7b2 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -2453,7 +2453,14 @@ static int insert_page_into_pte_locked(struct vm_area_struct *vma, pte_t *pte,
>  		if (!mkwrite)
>  			return -EBUSY;
>  
> -		/* see insert_pfn(). */
> +		/*
> +		 * For read faults on private mappings the PFN passed in may
> +		 * not match the PFN we have mapped if the mapped PFN is a
> +		 * writeable COW page.  In the mkwrite case we are creating a
> +		 * writable PTE for a shared mapping and we expect the PFNs to
> +		 * match. If they don't match, we are likely racing with block
> +		 * allocation and mapping invalidation.
> +		 */
>  		if (pte_pfn(pteval) != page_to_pfn(page)) {
>  			WARN_ON_ONCE(!is_zero_pfn(pte_pfn(pteval)));
>  			return -EFAULT;
> @@ -2858,7 +2865,7 @@ int vm_map_pages_zero(struct vm_area_struct *vma, struct page **pages,
>  EXPORT_SYMBOL(vm_map_pages_zero);
>  
>  static vm_fault_t insert_pfn(struct vm_area_struct *vma, unsigned long addr,
> -			unsigned long pfn, pgprot_t prot, bool mkwrite)
> +			unsigned long pfn, pgprot_t prot)
>  {
>  	struct mm_struct *mm = vma->vm_mm;
>  	pte_t *pte, entry;
> @@ -2868,38 +2875,12 @@ static vm_fault_t insert_pfn(struct vm_area_struct *vma, unsigned long addr,
>  	if (!pte)
>  		return VM_FAULT_OOM;
>  	entry = ptep_get(pte);
> -	if (!pte_none(entry)) {
> -		if (mkwrite) {
> -			/*
> -			 * For read faults on private mappings the PFN passed
> -			 * in may not match the PFN we have mapped if the
> -			 * mapped PFN is a writeable COW page.  In the mkwrite
> -			 * case we are creating a writable PTE for a shared
> -			 * mapping and we expect the PFNs to match. If they
> -			 * don't match, we are likely racing with block
> -			 * allocation and mapping invalidation so just skip the
> -			 * update.
> -			 */
> -			if (pte_pfn(entry) != pfn) {
> -				WARN_ON_ONCE(!is_zero_pfn(pte_pfn(entry)));
> -				goto out_unlock;
> -			}
> -			entry = pte_mkyoung(entry);
> -			entry = maybe_mkwrite(pte_mkdirty(entry), vma);
> -			if (ptep_set_access_flags(vma, addr, pte, entry, 1))
> -				update_mmu_cache(vma, addr, pte);
> -		}
> +	if (!pte_none(entry))
>  		goto out_unlock;
> -	}
>  
>  	/* Ok, finally just insert the thing.. */
>  	entry = pte_mkspecial(pfn_pte(pfn, prot));
>  
> -	if (mkwrite) {
> -		entry = pte_mkyoung(entry);
> -		entry = maybe_mkwrite(pte_mkdirty(entry), vma);
> -	}
> -
>  	set_pte_at(mm, addr, pte, entry);
>  	update_mmu_cache(vma, addr, pte); /* XXX: why not for insert_page? */
>  
> @@ -2967,7 +2948,7 @@ vm_fault_t vmf_insert_pfn_prot(struct vm_area_struct *vma, unsigned long addr,
>  
>  	pfnmap_setup_cachemode_pfn(pfn, &pgprot);
>  
> -	return insert_pfn(vma, addr, pfn, pgprot, false);
> +	return insert_pfn(vma, addr, pfn, pgprot);
>  }
>  EXPORT_SYMBOL(vmf_insert_pfn_prot);
>  
> @@ -2998,11 +2979,9 @@ vm_fault_t vmf_insert_pfn(struct vm_area_struct *vma, unsigned long addr,
>  }
>  EXPORT_SYMBOL(vmf_insert_pfn);
>  
> -static bool vm_mixed_ok(struct vm_area_struct *vma, unsigned long pfn,
> -			bool mkwrite)
> +static bool vm_mixed_ok(struct vm_area_struct *vma, unsigned long pfn)
>  {
> -	if (unlikely(is_zero_pfn(pfn)) &&
> -	    (mkwrite || !vm_mixed_zeropage_allowed(vma)))
> +	if (unlikely(is_zero_pfn(pfn)) && !vm_mixed_zeropage_allowed(vma))
>  		return false;
>  	/* these checks mirror the abort conditions in vm_normal_page */
>  	if (vma->vm_flags & VM_MIXEDMAP)
> @@ -3013,12 +2992,12 @@ static bool vm_mixed_ok(struct vm_area_struct *vma, unsigned long pfn,
>  }
>  
>  static vm_fault_t __vm_insert_mixed(struct vm_area_struct *vma,
> -		unsigned long addr, unsigned long pfn, bool mkwrite)
> +		unsigned long addr, unsigned long pfn)
>  {
>  	pgprot_t pgprot = vma->vm_page_prot;
>  	int err;
>  
> -	if (!vm_mixed_ok(vma, pfn, mkwrite))
> +	if (!vm_mixed_ok(vma, pfn))
>  		return VM_FAULT_SIGBUS;
>  
>  	if (addr < vma->vm_start || addr >= vma->vm_end)
> @@ -3045,9 +3024,9 @@ static vm_fault_t __vm_insert_mixed(struct vm_area_struct *vma,
>  		 * result in pfn_t_has_page() == false.
>  		 */
>  		page = pfn_to_page(pfn);
> -		err = insert_page(vma, addr, page, pgprot, mkwrite);
> +		err = insert_page(vma, addr, page, pgprot, false);
>  	} else {
> -		return insert_pfn(vma, addr, pfn, pgprot, mkwrite);
> +		return insert_pfn(vma, addr, pfn, pgprot);
>  	}
>  
>  	if (err == -ENOMEM)
> @@ -3086,7 +3065,7 @@ EXPORT_SYMBOL_GPL(vmf_insert_page_mkwrite);
>  vm_fault_t vmf_insert_mixed(struct vm_area_struct *vma, unsigned long addr,
>  		unsigned long pfn)
>  {
> -	return __vm_insert_mixed(vma, addr, pfn, false);
> +	return __vm_insert_mixed(vma, addr, pfn);
>  }
>  EXPORT_SYMBOL(vmf_insert_mixed);
>  
> -- 
> 2.43.0
> 
