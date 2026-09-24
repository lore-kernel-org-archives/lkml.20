Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBEAB486E6D
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251825; cv=none; b=b96vaJqcgYelxmp/uh/BXJTD/19pHfXxqBbkDsrl1Uh6uF53zF9BSL3ECkdwcbm++CZ8qIa69Q73ivqq6S/aulDKYlpzRXDwJpBPMwBOJ3aNGwBvY2RK5HHrpvk98D21KBI8Qbte0gkt8exhACm8ieusbs67XIOYEZbjUU1Fwuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251825; c=relaxed/simple;
	bh=8F/XxqrKuB+k751NiXzuRU5nIX6xdyv/RNAB/2r9o2I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bpSpRxSVRPqeKTvxu6eWvzHksph1p9UX1WVhDkRIQcMyo2JlGOyudKXpzMHclNgKi8v7p4Dfcy2F0EnDkPW6FB1IFR0jU8CL6vueYa45g3Kp2CUBc3kVmVPnckoJEnyDpkXnUeCDfpzowHv5pEj/3eDYWyDw2d5qnvRBC6lPscA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=GibmlyEE; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="GibmlyEE"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A5701570;
	Thu, 24 Sep 2026 05:10:18 -0700 (PDT)
Received: from [10.57.83.110] (unknown [10.57.83.110])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6879B3F86C;
	Thu, 24 Sep 2026 05:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790251821; bh=8F/XxqrKuB+k751NiXzuRU5nIX6xdyv/RNAB/2r9o2I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GibmlyEElxGn2e6TcfAhaVqhvxQpqGyrjZ1QDym07Pk1EslpY2EFnkXK2XfExQG3D
	 at/wPi/pVJ7BJIR+aEM1a8OIH48YW4ltxQMiO/j2YBT4yEGkt1K1/bog1v4O6SK2VS
	 SLwyodbbjVShxrPMWKunTwn8Q4vp70FXIcm2k/6c=
Message-ID: <41151166-ebdd-4c7f-b1a9-95625afd74d1@arm.com>
Date: Thu, 24 Sep 2026 13:10:17 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/4] arm64/mm: Use pudp_get() for PUD accesses
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Lorenzo Stoakes <ljs@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Linu Cherian <linu.cherian@arm.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, kasan-dev@googlegroups.com
References: <20260924062214.1635078-1-anshuman.khandual@arm.com>
 <20260924062214.1635078-3-anshuman.khandual@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
Content-Language: en-GB
In-Reply-To: <20260924062214.1635078-3-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/09/2026 07:22, Anshuman Khandual wrote:
> Replace READ_ONCE() with pudp_get() for PUD accesses in preparation for
> supporting both D64 and D128 translation table formats.
> 
> READ_ONCE() cannot currently be used for 128-bit page table entries on
> arm64 because it does not provide the required 128-bit single-copy
> atomicity, causing builds to fail for accesses wider than 64 bits.
> 
> Although LDP/STP provide the required atomicity when FEAT_LSE is available
> (as required by FEAT_D128), extending READ_ONCE() to support 128-bit
> accesses is undesirable. READ_ONCE() is a general-purpose API, so doing so
> could encourage other 128-bit users that would either fail to build in
> configurations without D128 support or, if D128 becomes a runtime option,
> silently permit tearing on systems without the required hardware support.
> 
> Instead, standardize PUD accesses on the existing page-table helpers. These
> can be overridden on arm64 to provide 128-bit single-copy atomicity when
> required.
> 
> For now override pudp_get() which is same as the generic memory default in
> order to be consistent with similar helpers.
> 
> No functional change intended.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: kasan-dev@googlegroups.com
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>

> ---
> Changes in V3
> 
> - Added platform override for pudp_get()
> 
>  arch/arm64/include/asm/pgtable.h |  9 ++++++++-
>  arch/arm64/mm/fault.c            |  2 +-
>  arch/arm64/mm/fixmap.c           |  2 +-
>  arch/arm64/mm/hugetlbpage.c      |  4 ++--
>  arch/arm64/mm/kasan_init.c       |  4 ++--
>  arch/arm64/mm/mmu.c              | 20 ++++++++++----------
>  arch/arm64/mm/pageattr.c         |  2 +-
>  arch/arm64/mm/trans_pgd.c        |  4 ++--
>  8 files changed, 27 insertions(+), 20 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index 9ad2d03e86ad..b46930f844a2 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -90,6 +90,12 @@ static inline pmd_t pmdp_get(pmd_t *pmdp)
>  	return READ_ONCE(*pmdp);
>  }
>  
> +#define pudp_get pudp_get
> +static inline pud_t pudp_get(pud_t *pudp)
> +{
> +	return READ_ONCE(*pudp);
> +}
> +
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>  #define __HAVE_ARCH_FLUSH_PMD_TLB_RANGE
>  
> @@ -879,7 +885,8 @@ static inline pmd_t *pud_pgtable(pud_t pud)
>  }
>  
>  /* Find an entry in the second-level page table. */
> -#define pmd_offset_phys(dir, addr)	(pud_page_paddr(READ_ONCE(*(dir))) + pmd_index(addr) * sizeof(pmd_t))
> +#define pmd_offset_phys(dir, addr)	(pud_page_paddr(pudp_get(dir)) + \
> +					 pmd_index(addr) * sizeof(pmd_t))
>  
>  #define pmd_set_fixmap(addr)		((pmd_t *)set_fixmap_offset(FIX_PMD, addr))
>  #define pmd_set_fixmap_offset(pud, addr)	pmd_set_fixmap(pmd_offset_phys(pud, addr))
> diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> index 2757ee0c4300..435e2e14c070 100644
> --- a/arch/arm64/mm/fault.c
> +++ b/arch/arm64/mm/fault.c
> @@ -181,7 +181,7 @@ static void show_pte(unsigned long addr)
>  			break;
>  
>  		pudp = pud_offset_lockless(p4dp, p4d, addr);
> -		pud = READ_ONCE(*pudp);
> +		pud = pudp_get(pudp);
>  		ptval_to_str(pxd_str, pud_val(pud));
>  		pr_cont(", pud=%s", pxd_str);
>  		if (pud_none(pud) || pud_bad(pud))
> diff --git a/arch/arm64/mm/fixmap.c b/arch/arm64/mm/fixmap.c
> index 3cdac8021d4f..d9a870836faf 100644
> --- a/arch/arm64/mm/fixmap.c
> +++ b/arch/arm64/mm/fixmap.c
> @@ -56,7 +56,7 @@ static void __init early_fixmap_init_pmd(pud_t *pudp, unsigned long addr,
>  					 unsigned long end)
>  {
>  	unsigned long next;
> -	pud_t pud = READ_ONCE(*pudp);
> +	pud_t pud = pudp_get(pudp);
>  	pmd_t *pmdp;
>  
>  	if (pud_none(pud))
> diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
> index cdaa4500faf9..c9ad5e75b073 100644
> --- a/arch/arm64/mm/hugetlbpage.c
> +++ b/arch/arm64/mm/hugetlbpage.c
> @@ -262,7 +262,7 @@ pte_t *huge_pte_alloc(struct mm_struct *mm, struct vm_area_struct *vma,
>  		WARN_ON(addr & (sz - 1));
>  		ptep = pte_alloc_huge(mm, pmdp, addr);
>  	} else if (sz == PMD_SIZE) {
> -		if (want_pmd_share(vma, addr) && pud_none(READ_ONCE(*pudp)))
> +		if (want_pmd_share(vma, addr) && pud_none(pudp_get(pudp)))
>  			ptep = huge_pmd_share(mm, vma, addr, pudp);
>  		else
>  			ptep = (pte_t *)pmd_alloc(mm, pudp, addr);
> @@ -292,7 +292,7 @@ pte_t *huge_pte_offset(struct mm_struct *mm,
>  		return NULL;
>  
>  	pudp = pud_offset(p4dp, addr);
> -	pud = READ_ONCE(*pudp);
> +	pud = pudp_get(pudp);
>  	if (sz != PUD_SIZE && pud_none(pud))
>  		return NULL;
>  	/* hugepage or swap? */
> diff --git a/arch/arm64/mm/kasan_init.c b/arch/arm64/mm/kasan_init.c
> index 7ca833c5de5e..aad29bcc7622 100644
> --- a/arch/arm64/mm/kasan_init.c
> +++ b/arch/arm64/mm/kasan_init.c
> @@ -76,7 +76,7 @@ static pte_t *__init kasan_pte_offset(pmd_t *pmdp, unsigned long addr, int node,
>  static pmd_t *__init kasan_pmd_offset(pud_t *pudp, unsigned long addr, int node,
>  				      bool early)
>  {
> -	if (pud_none(READ_ONCE(*pudp))) {
> +	if (pud_none(pudp_get(pudp))) {
>  		phys_addr_t pmd_phys = early ?
>  				__pa_symbol(kasan_early_shadow_pmd)
>  					: kasan_alloc_zeroed_page(node);
> @@ -150,7 +150,7 @@ static void __init kasan_pud_populate(p4d_t *p4dp, unsigned long addr,
>  	do {
>  		next = pud_addr_end(addr, end);
>  		kasan_pmd_populate(pudp, addr, next, node, early);
> -	} while (pudp++, addr = next, addr != end && pud_none(READ_ONCE(*pudp)));
> +	} while (pudp++, addr = next, addr != end && pud_none(pudp_get(pudp)));
>  }
>  
>  static void __init kasan_p4d_populate(pgd_t *pgdp, unsigned long addr,
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 95621913679e..22efaee79293 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -309,7 +309,7 @@ static int alloc_init_cont_pmd(pud_t *pudp, unsigned long addr,
>  {
>  	int ret;
>  	unsigned long next;
> -	pud_t pud = READ_ONCE(*pudp);
> +	pud_t pud = pudp_get(pudp);
>  	pmd_t *pmdp;
>  
>  	/*
> @@ -390,7 +390,7 @@ static int alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
>  	}
>  
>  	do {
> -		pud_t old_pud = READ_ONCE(*pudp);
> +		pud_t old_pud = pudp_get(pudp);
>  
>  		next = pud_addr_end(addr, end);
>  
> @@ -408,7 +408,7 @@ static int alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
>  			 * only allow updates to the permission attributes.
>  			 */
>  			BUG_ON(!pgattr_change_is_safe(pud_val(old_pud),
> -						      READ_ONCE(pud_val(*pudp))));
> +						      pud_val(pudp_get(pudp))));
>  		} else {
>  			ret = alloc_init_cont_pmd(pudp, addr, next, phys, prot,
>  						  pgtable_alloc, flags);
> @@ -416,7 +416,7 @@ static int alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
>  				goto out;
>  
>  			VM_WARN_ON_ONCE(pud_val(old_pud) != 0 &&
> -					pud_val(old_pud) != READ_ONCE(pud_val(*pudp)));
> +					pud_val(old_pud) != pud_val(pudp_get(pudp)));
>  		}
>  		phys += next - addr;
>  	} while (pudp++, addr = next, addr != end);
> @@ -1591,7 +1591,7 @@ static void unmap_hotplug_pud_range(p4d_t *p4dp, unsigned long addr,
>  	do {
>  		next = pud_addr_end(addr, end);
>  		pudp = pud_offset(p4dp, addr);
> -		pud = READ_ONCE(*pudp);
> +		pud = pudp_get(pudp);
>  		if (pud_none(pud))
>  			continue;
>  
> @@ -1748,7 +1748,7 @@ static void free_empty_pud_table(p4d_t *p4dp, unsigned long addr,
>  	do {
>  		next = pud_addr_end(addr, end);
>  		pudp = pud_offset(p4dp, addr);
> -		pud = READ_ONCE(*pudp);
> +		pud = pudp_get(pudp);
>  		if (pud_none(pud))
>  			continue;
>  
> @@ -1769,7 +1769,7 @@ static void free_empty_pud_table(p4d_t *p4dp, unsigned long addr,
>  	 */
>  	pudp = pud_offset(p4dp, 0UL);
>  	for (i = 0; i < PTRS_PER_PUD; i++) {
> -		if (!pud_none(READ_ONCE(pudp[i])))
> +		if (!pud_none(pudp_get(pudp + i)))
>  			return;
>  	}
>  
> @@ -1867,7 +1867,7 @@ int pud_set_huge(pud_t *pudp, phys_addr_t phys, pgprot_t prot)
>  	pud_t new_pud = pfn_pud(__phys_to_pfn(phys), mk_pud_sect_prot(prot));
>  
>  	/* Only allow permission changes for now */
> -	if (!pgattr_change_is_safe(READ_ONCE(pud_val(*pudp)),
> +	if (!pgattr_change_is_safe(pud_val(pudp_get(pudp)),
>  				   pud_val(new_pud)))
>  		return 0;
>  
> @@ -1898,7 +1898,7 @@ void p4d_clear_huge(p4d_t *p4dp)
>  
>  int pud_clear_huge(pud_t *pudp)
>  {
> -	if (!pud_leaf(READ_ONCE(*pudp)))
> +	if (!pud_leaf(pudp_get(pudp)))
>  		return 0;
>  	pud_clear(pudp);
>  	return 1;
> @@ -1938,7 +1938,7 @@ int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
>  	pud_t pud;
>  	unsigned long next, end;
>  
> -	pud = READ_ONCE(*pudp);
> +	pud = pudp_get(pudp);
>  
>  	if (!pud_table(pud)) {
>  		VM_WARN_ON(1);
> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> index 0ca07bd5ded9..07b2fa4de57f 100644
> --- a/arch/arm64/mm/pageattr.c
> +++ b/arch/arm64/mm/pageattr.c
> @@ -407,7 +407,7 @@ bool kernel_page_present(struct page *page)
>  		return false;
>  
>  	pudp = pud_offset(p4dp, addr);
> -	pud = READ_ONCE(*pudp);
> +	pud = pudp_get(pudp);
>  	if (pud_none(pud))
>  		return false;
>  	if (pud_leaf(pud))
> diff --git a/arch/arm64/mm/trans_pgd.c b/arch/arm64/mm/trans_pgd.c
> index b27b2d2c20c3..d119119455f1 100644
> --- a/arch/arm64/mm/trans_pgd.c
> +++ b/arch/arm64/mm/trans_pgd.c
> @@ -64,7 +64,7 @@ static int copy_pmd(struct trans_pgd_info *info, pud_t *dst_pudp,
>  	unsigned long next;
>  	unsigned long addr = start;
>  
> -	if (pud_none(READ_ONCE(*dst_pudp))) {
> +	if (pud_none(pudp_get(dst_pudp))) {
>  		dst_pmdp = trans_alloc(info);
>  		if (!dst_pmdp)
>  			return -ENOMEM;
> @@ -109,7 +109,7 @@ static int copy_pud(struct trans_pgd_info *info, p4d_t *dst_p4dp,
>  
>  	src_pudp = pud_offset(src_p4dp, start);
>  	do {
> -		pud_t pud = READ_ONCE(*src_pudp);
> +		pud_t pud = pudp_get(src_pudp);
>  
>  		next = pud_addr_end(addr, end);
>  		if (pud_none(pud))

