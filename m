Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3B37255F2C
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789994648; cv=none; b=XccdFV24jwlGFpY3yoAW+Dsu+x5lRVVyVoMCnybc31zJEBQSQ5RKwi8uMHrM38fpEdpcvyrX8e05fPDwbQjxjnQ/mL+R//N8a9xlUWwaOkUBkX6atzrAlZCYdGucgd17pI3cpTpvZpcR1/5R2wXZdz+Yh0+avFo8tfJnTE6KGKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789994648; c=relaxed/simple;
	bh=hSaFlW60GnnapNXxU3t+j2JvEhwluOUUhRrT+x2xCdU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q3cC1UWR7iqqihyOW1QVEE7YJeJagS6K8jL7Zpfio9R6c5gMirYdRz8uGriT7eGiguLEWmXSKWIALhCredKKy4L0J3PA0e8izcs3N/AjevUFpNI3HvBSD/x5i0WlupDlO/g4f1stzx3yTvdGhOMsYxvDux5eVOuxeSxQkOHj5nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=AJ9nusiE; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="AJ9nusiE"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6069B1595;
	Mon, 21 Sep 2026 05:44:01 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F4813F86C;
	Mon, 21 Sep 2026 05:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789994644; bh=hSaFlW60GnnapNXxU3t+j2JvEhwluOUUhRrT+x2xCdU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AJ9nusiEUfrNPUy+OaKbgRuGMZcBd6pQLGPYNott4hUMC5v3bPARPV48ttz17CRKT
	 D8RUsH8zUiaHV690me4YtnY7dC06DxS6toOalCRKEVM9P5ZoZfbMMlTvju3ASB/Wf2
	 WuycFzGE0BqDwxCE9uKLGiSZJkJIvlH4hvf2PElE=
Date: Mon, 21 Sep 2026 18:14:01 +0530
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Linu Cherian <linu.cherian@arm.com>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, Mark Rtland <mark.rtland@arm.com>, 
	linx-arm-kernel@lists.infradead.org, linx-kernel@vger.kernel.org, kasan-dev@googlegrops.com
Subject: Re: [PATCH 1/4] arm64/mm: Convert READ_ONCE() as pmdp_get() while
 accessing PMD
Message-ID: <zh3bxbrsd4trhmhofzy3ndjigkwudwtj77ezrqw5zfvmxiglgq@uyfcgtkasu5x>
References: <20260903060657.2717457-1-anshuman.khandual@arm.com>
 <20260903060657.2717457-2-anshuman.khandual@arm.com>
 <c1ca2256-2516-4f4d-ba08-a2f584fc812b@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c1ca2256-2516-4f4d-ba08-a2f584fc812b@arm.com>

On Mon, Sep 21, 2026 at 11:49:28AM +0100, Ryan Roberts wrote:
> On 03/09/2026 07:06, Anshuman Khandual wrote:
> > Convert all READ_ONCE() based PMD accesses as pmdp_get() instead which will
> > support both D64 and D128 translation regime going forward. That is because
> > READ_ONCE() would need 128 bit single copy atomic guarantees, while reading
> > 128 bit page table entries which is currently not supported on arm64. Build
> > fails for READ_ONCE() while accessing beyond 64 bits.
> > 
> > Load Pair/Store Pair (ldp/stp) are only single copy atomic if FEAT_LSE1
> > is supported (which is required when FEAT_D128 is supported). Currently 128
> > bit pgtables is a compile time decision - so we could have chosen to extend
> > READ_ONCE()/WRITE_ONCE() to allow 128 bit for this configuration. But then
> > it's a general purpose API and we were concerned that other users might
> > eventually creep in that expect 128 and then fail to compile in the other
> > configs.
> > 
> > But worse, we are considering eventually making D128 a boot time option, at
> > which point we'd have to make READ_ONCE() always allow 128 bit at compile
> > time but then it might silently tear at runtime.
> > 
> > So our preference is to standardize on these existing helpers, which we can
> > override in arm64 to give the 128 bit single copy guarantee when required.
> 
> Perhaps something like this conveys the justification a bit more clearly?:
> 
> ---8<---
> arm64/mm: Use pmdp_get() for PMD accesses
> 
> Replace READ_ONCE() with pmdp_get() for PMD accesses in preparation for
> supporting both D64 and D128 translation table formats.
> 
> READ_ONCE() cannot currently be used for 128-bit page table entries on arm64
> because it does not provide the required 128-bit single-copy atomicity, causing
> builds to fail for accesses wider than 64 bits.
> 
> Although LDP/STP provide the required atomicity when FEAT_LSE is available (as
> required by FEAT_D128), extending READ_ONCE() to support 128-bit accesses is
> undesirable. READ_ONCE() is a general-purpose API, so doing so could encourage
> other 128-bit users that would either fail to build in configurations without
> D128 support or, if D128 becomes a runtime option, silently permit tearing on
> systems without the required hardware support.
> 
> Instead, standardize PMD accesses on the existing page-table helpers. These can
> be overridden on arm64 to provide 128-bit single-copy atomicity when required.
> ---8<---

Sure will update, assume similar format being applicable all patches here.

> 
> With that:
> 
> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
> 
> 
> > 
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Ryan Roberts <ryan.roberts@arm.com>
> > Cc: Mark Rtland <mark.rtland@arm.com>
> > Cc: linx-arm-kernel@lists.infradead.org
> > Cc: linx-kernel@vger.kernel.org
> > Cc: kasan-dev@googlegrops.com
> > Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> > ---
> >  arch/arm64/include/asm/pgtable.h |  3 ++-
> >  arch/arm64/mm/fault.c            |  2 +-
> >  arch/arm64/mm/fixmap.c           |  2 +-
> >  arch/arm64/mm/hugetlbpage.c      |  2 +-
> >  arch/arm64/mm/kasan_init.c       |  4 ++--
> >  arch/arm64/mm/mmu.c              | 22 +++++++++++-----------
> >  arch/arm64/mm/pageattr.c         |  2 +-
> >  arch/arm64/mm/trans_pgd.c        |  2 +-
> >  8 files changed, 20 insertions(+), 19 deletions(-)
> > 
> > diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> > index 61fbfab3e06e..51f55498d43d 100644
> > --- a/arch/arm64/include/asm/pgtable.h
> > +++ b/arch/arm64/include/asm/pgtable.h
> > @@ -805,7 +805,8 @@ static inline unsigned long pmd_page_vaddr(pmd_t pmd)
> >  }
> >  
> >  /* Find an entry in the third-level page table. */
> > -#define pte_offset_phys(dir,addr)	(pmd_page_paddr(READ_ONCE(*(dir))) + pte_index(addr) * sizeof(pte_t))
> > +#define pte_offset_phys(dir, addr)	(pmd_page_paddr(pmdp_get(dir)) + \
> > +					 pte_index(addr) * sizeof(pte_t))
> >  
> >  #define pte_set_fixmap(addr)		((pte_t *)set_fixmap_offset(FIX_PTE, addr))
> >  #define pte_set_fixmap_offset(pmd, addr)	pte_set_fixmap(pte_offset_phys(pmd, addr))
> > diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> > index c75bab3c2f4b..cb25cb130e83 100644
> > --- a/arch/arm64/mm/fault.c
> > +++ b/arch/arm64/mm/fault.c
> > @@ -188,7 +188,7 @@ static void show_pte(unsigned long addr)
> >  			break;
> >  
> >  		pmdp = pmd_offset(pudp, addr);
> > -		pmd = READ_ONCE(*pmdp);
> > +		pmd = pmdp_get(pmdp);
> >  		ptval_to_str(pmd_str, pmd_val(pmd));
> >  		pr_cont(", pmd=%s", pmd_str);
> >  		if (pmd_none(pmd) || pmd_bad(pmd))
> > diff --git a/arch/arm64/mm/fixmap.c b/arch/arm64/mm/fixmap.c
> > index f66a0016dd02..3cdac8021d4f 100644
> > --- a/arch/arm64/mm/fixmap.c
> > +++ b/arch/arm64/mm/fixmap.c
> > @@ -42,7 +42,7 @@ static inline pte_t *fixmap_pte(unsigned long addr)
> >  
> >  static void __init early_fixmap_init_pte(pmd_t *pmdp, unsigned long addr)
> >  {
> > -	pmd_t pmd = READ_ONCE(*pmdp);
> > +	pmd_t pmd = pmdp_get(pmdp);
> >  	pte_t *ptep;
> >  
> >  	if (pmd_none(pmd)) {
> > diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
> > index 8e799c1fe0aa..cdaa4500faf9 100644
> > --- a/arch/arm64/mm/hugetlbpage.c
> > +++ b/arch/arm64/mm/hugetlbpage.c
> > @@ -304,7 +304,7 @@ pte_t *huge_pte_offset(struct mm_struct *mm,
> >  		addr &= CONT_PMD_MASK;
> >  
> >  	pmdp = pmd_offset(pudp, addr);
> > -	pmd = READ_ONCE(*pmdp);
> > +	pmd = pmdp_get(pmdp);
> >  	if (!(sz == PMD_SIZE || sz == CONT_PMD_SIZE) &&
> >  	    pmd_none(pmd))
> >  		return NULL;
> > diff --git a/arch/arm64/mm/kasan_init.c b/arch/arm64/mm/kasan_init.c
> > index 45fbdce684c8..7ca833c5de5e 100644
> > --- a/arch/arm64/mm/kasan_init.c
> > +++ b/arch/arm64/mm/kasan_init.c
> > @@ -62,7 +62,7 @@ static phys_addr_t __init kasan_alloc_raw_page(int node)
> >  static pte_t *__init kasan_pte_offset(pmd_t *pmdp, unsigned long addr, int node,
> >  				      bool early)
> >  {
> > -	if (pmd_none(READ_ONCE(*pmdp))) {
> > +	if (pmd_none(pmdp_get(pmdp))) {
> >  		phys_addr_t pte_phys = early ?
> >  				__pa_symbol(kasan_early_shadow_pte)
> >  					: kasan_alloc_zeroed_page(node);
> > @@ -138,7 +138,7 @@ static void __init kasan_pmd_populate(pud_t *pudp, unsigned long addr,
> >  	do {
> >  		next = pmd_addr_end(addr, end);
> >  		kasan_pte_populate(pmdp, addr, next, node, early);
> > -	} while (pmdp++, addr = next, addr != end && pmd_none(READ_ONCE(*pmdp)));
> > +	} while (pmdp++, addr = next, addr != end && pmd_none(pmdp_get(pmdp)));
> >  }
> >  
> >  static void __init kasan_pud_populate(p4d_t *p4dp, unsigned long addr,
> > diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> > index b5de4095d650..32daaa547d09 100644
> > --- a/arch/arm64/mm/mmu.c
> > +++ b/arch/arm64/mm/mmu.c
> > @@ -200,7 +200,7 @@ static int alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
> >  			       int flags)
> >  {
> >  	unsigned long next;
> > -	pmd_t pmd = READ_ONCE(*pmdp);
> > +	pmd_t pmd = pmdp_get(pmdp);
> >  	pte_t *ptep;
> >  
> >  	BUG_ON(pmd_leaf(pmd));
> > @@ -257,7 +257,7 @@ static int init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
> >  	unsigned long next;
> >  
> >  	do {
> > -		pmd_t old_pmd = READ_ONCE(*pmdp);
> > +		pmd_t old_pmd = pmdp_get(pmdp);
> >  
> >  		next = pmd_addr_end(addr, end);
> >  
> > @@ -272,7 +272,7 @@ static int init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
> >  			 * only allow updates to the permission attributes.
> >  			 */
> >  			BUG_ON(!pgattr_change_is_safe(pmd_val(old_pmd),
> > -						      READ_ONCE(pmd_val(*pmdp))));
> > +						      pmd_val(pmdp_get(pmdp))));
> >  		} else {
> >  			int ret;
> >  
> > @@ -282,7 +282,7 @@ static int init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
> >  				return ret;
> >  
> >  			VM_WARN_ON_ONCE(pmd_val(old_pmd) != 0 &&
> > -					pmd_val(old_pmd) != READ_ONCE(pmd_val(*pmdp)));
> > +					pmd_val(old_pmd) != pmd_val(pmdp_get(pmdp)));
> >  		}
> >  		phys += next - addr;
> >  	} while (pmdp++, addr = next, addr != end);
> > @@ -293,7 +293,7 @@ static int init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
> >  static bool pmd_range_has_valid_noncont(pmd_t *pmdp)
> >  {
> >  	for (int i = 0; i < CONT_PMDS; i++) {
> > -		pte_t pte = pmd_pte(READ_ONCE(pmdp[i]));
> > +		pte_t pte = pmd_pte(pmdp_get(pmdp + i));
> >  
> >  		if (pte_valid(pte) && !pte_cont(pte))
> >  			return true;
> > @@ -1553,7 +1553,7 @@ static void unmap_hotplug_pmd_range(pud_t *pudp, unsigned long addr,
> >  	do {
> >  		next = pmd_addr_end(addr, end);
> >  		pmdp = pmd_offset(pudp, addr);
> > -		pmd = READ_ONCE(*pmdp);
> > +		pmd = pmdp_get(pmdp);
> >  		if (pmd_none(pmd))
> >  			continue;
> >  
> > @@ -1708,7 +1708,7 @@ static void free_empty_pmd_table(pud_t *pudp, unsigned long addr,
> >  	do {
> >  		next = pmd_addr_end(addr, end);
> >  		pmdp = pmd_offset(pudp, addr);
> > -		pmd = READ_ONCE(*pmdp);
> > +		pmd = pmdp_get(pmdp);
> >  		if (pmd_none(pmd))
> >  			continue;
> >  
> > @@ -1729,7 +1729,7 @@ static void free_empty_pmd_table(pud_t *pudp, unsigned long addr,
> >  	 */
> >  	pmdp = pmd_offset(pudp, 0UL);
> >  	for (i = 0; i < PTRS_PER_PMD; i++) {
> > -		if (!pmd_none(READ_ONCE(pmdp[i])))
> > +		if (!pmd_none(pmdp_get(pmdp + i)))
> >  			return;
> >  	}
> >  
> > @@ -1881,7 +1881,7 @@ int pmd_set_huge(pmd_t *pmdp, phys_addr_t phys, pgprot_t prot)
> >  	pmd_t new_pmd = pfn_pmd(__phys_to_pfn(phys), mk_pmd_sect_prot(prot));
> >  
> >  	/* Only allow permission changes for now */
> > -	if (!pgattr_change_is_safe(READ_ONCE(pmd_val(*pmdp)),
> > +	if (!pgattr_change_is_safe(pmd_val(pmdp_get(pmdp)),
> >  				   pmd_val(new_pmd)))
> >  		return 0;
> >  
> > @@ -1906,7 +1906,7 @@ int pud_clear_huge(pud_t *pudp)
> >  
> >  int pmd_clear_huge(pmd_t *pmdp)
> >  {
> > -	if (!pmd_leaf(READ_ONCE(*pmdp)))
> > +	if (!pmd_leaf(pmdp_get(pmdp)))
> >  		return 0;
> >  	pmd_clear(pmdp);
> >  	return 1;
> > @@ -1917,7 +1917,7 @@ int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
> >  	pte_t *table;
> >  	pmd_t pmd;
> >  
> > -	pmd = READ_ONCE(*pmdp);
> > +	pmd = pmdp_get(pmdp);
> >  
> >  	if (!pmd_table(pmd)) {
> >  		VM_WARN_ON(1);
> > diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> > index bbe98ac9ad8c..0ca07bd5ded9 100644
> > --- a/arch/arm64/mm/pageattr.c
> > +++ b/arch/arm64/mm/pageattr.c
> > @@ -414,7 +414,7 @@ bool kernel_page_present(struct page *page)
> >  		return pud_valid(pud);
> >  
> >  	pmdp = pmd_offset(pudp, addr);
> > -	pmd = READ_ONCE(*pmdp);
> > +	pmd = pmdp_get(pmdp);
> >  	if (pmd_none(pmd))
> >  		return false;
> >  	if (pmd_leaf(pmd))
> > diff --git a/arch/arm64/mm/trans_pgd.c b/arch/arm64/mm/trans_pgd.c
> > index cca9706a875c..b27b2d2c20c3 100644
> > --- a/arch/arm64/mm/trans_pgd.c
> > +++ b/arch/arm64/mm/trans_pgd.c
> > @@ -74,7 +74,7 @@ static int copy_pmd(struct trans_pgd_info *info, pud_t *dst_pudp,
> >  
> >  	src_pmdp = pmd_offset(src_pudp, start);
> >  	do {
> > -		pmd_t pmd = READ_ONCE(*src_pmdp);
> > +		pmd_t pmd = pmdp_get(src_pmdp);
> >  
> >  		next = pmd_addr_end(addr, end);
> >  		if (pmd_none(pmd))
> 
