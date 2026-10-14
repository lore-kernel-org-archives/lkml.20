Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC5773DD86F
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791958468; cv=none; b=ZiDe/cyJ2PENixRmFf8nNZQMtbrfmdaPmyQ0eOxovA1/l9W5Yg2eTlHuVpy449Ru1rziUSg7OcLCJm9lhooD0rklwHebaevBJoHi/37ftmjKc4D1rlUKs9Ys+tPBHymgFkTYKj2FODDDBfjOLIh16sC3EmQG1TQdD427Q96VOIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791958468; c=relaxed/simple;
	bh=a7qhbNgmdcPYQ6buXTv8OGPWO0Grnhy1fDX5AmFWNhU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jLOgtnxYA5/ldcWc1I3nTH8lBQtQKPOiVz6P3IujtfA5FegWzfxzBfsKs3vHlOn3yXSSq9O2uXvZNKX4dPZg9tBxswye6+kdo19UWjMNZczEn6d2kaAXHPXWlh1kfa2JZcUcUltLm2dnOhvzNxmC8oFyEV7bTZP3+kovzuCCYtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=iVZjLtZt; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="iVZjLtZt"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 59978152B;
	Tue, 13 Oct 2026 23:14:20 -0700 (PDT)
Received: from [10.164.19.62] (unknown [10.164.19.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0671C3F7B4;
	Tue, 13 Oct 2026 23:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791958463; bh=a7qhbNgmdcPYQ6buXTv8OGPWO0Grnhy1fDX5AmFWNhU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iVZjLtZtTnUpq+MWM8i1fufHT2ECWkrV3HWNj3WcG/hN9gP+H6H1v93xpCesC3iXX
	 CQi/6xszKB9Zt761+SEqTqssh9cXgTWtdj2H2ozmWZiK6LvgOQCLvIdI0bH8dhgof8
	 tc467R1T/ulRHWldWSPWBQMRzgRPRXiY+auEPDBE=
Message-ID: <c1849f90-58a4-404a-aa01-97b53bd92650@arm.com>
Date: Wed, 14 Oct 2026 11:44:15 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 03/10] mm/vmalloc: use pte_set_huge()/pte_clear_huge()
 for PTE-level block mappings
To: Uladzislau Rezki <urezki@gmail.com>, Wen Jiang <jiangwenxiaomi@gmail.com>
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, linux-mm@kvack.org,
 will@kernel.org, Xueyuan.chen21@gmail.com, ajd@linux.ibm.com,
 anshuman.khandual@arm.com, baohua@kernel.org, chleroy@kernel.org,
 david@kernel.org, jiangwen6@xiaomi.com, leo.yan@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
 npiggin@gmail.com, rppt@kernel.org, ryan.roberts@arm.com
References: <20261002090947.869220-1-jiangwen6@xiaomi.com>
 <20261002090947.869220-4-jiangwen6@xiaomi.com> <asudY_EhrT5fZGmZ@milan>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <asudY_EhrT5fZGmZ@milan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/10/26 7:59 pm, Uladzislau Rezki wrote:
> On Fri, Oct 02, 2026 at 05:09:40PM +0800, Wen Jiang wrote:
>> vmap installs PTE-level block mappings by reusing set_huge_pte_at() and
>> huge_ptep_get_and_clear() under #ifdef CONFIG_HUGETLB_PAGE. This makes
>> the feature silently unavailable on CONFIG_HUGETLB_PAGE=n kernels and
>> couples mm/vmalloc.c to HugeTLB internals it does not otherwise need.
>>
>> Now that arm64 and powerpc/8xx provide pte_set_huge() and
>> pte_clear_huge(), add the generic fallbacks next to the existing
>> pmd/pud_set_huge() family and convert vmap_pte_range() and
>> vunmap_pte_range() to the new helpers. The CONFIG_HUGETLB_PAGE guards
>> around the block-mapping paths are dropped, so PTE-level block mappings
>> now also work on CONFIG_HUGETLB_PAGE=n kernels, and mm/vmalloc.c no
>> longer includes <linux/hugetlb.h>.
>>
>> The fallbacks exist only to keep the build working on architectures
>> without PTE-level block mapping support. They are unreachable there:
>> the callers only run when arch_vmap_pte_range_map_size() or
>> arch_vmap_pte_range_unmap_size() return a size other than PAGE_SIZE,
>> which requires an arch implementation. BUILD_BUG() makes that
>> explicit rather than silently doing nothing.
>>
>> Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
>> Reviewed-by: Barry Song <baohua@kernel.org>
>> ---
>>  include/linux/pgtable.h | 29 +++++++++++++++++++++++++++++
>>  mm/vmalloc.c            | 19 ++++++-------------
>>  2 files changed, 35 insertions(+), 13 deletions(-)
>>
>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
>> index 8c093c119e5a8..a7fd51fec8a17 100644
>> --- a/include/linux/pgtable.h
>> +++ b/include/linux/pgtable.h
>> @@ -2204,6 +2204,35 @@ static inline int pmd_free_pte_page(pmd_t *pmd, unsigned long addr)
>>  }
>>  #endif	/* CONFIG_HAVE_ARCH_HUGE_VMAP */
>>  
>> +/*
>> + * PTE-level block mappings for vmap.
>> + *
>> + * pte_set_huge() only has to be implemented by architectures whose
>> + * arch_vmap_pte_range_map_size() can return a size other than PAGE_SIZE.
>> + */
>> +#ifndef __HAVE_ARCH_PTE_SET_HUGE
>> +static inline void pte_set_huge(pte_t *ptep, unsigned long addr,
>> +				phys_addr_t phys, pgprot_t prot,
>> +				unsigned long size)
>> +{
>> +	BUILD_BUG();
>> +}
>> +#endif
>> +
>> +/*
>> + * Likewise, pte_clear_huge() only has to be implemented by architectures
>> + * whose arch_vmap_pte_range_unmap_size() can return a size other than
>> + * PAGE_SIZE.
>> + */
>> +#ifndef __HAVE_ARCH_PTE_CLEAR_HUGE
>> +static inline pte_t pte_clear_huge(pte_t *ptep, unsigned long addr,
>> +				   unsigned long size)
>> +{
>> +	BUILD_BUG();
>> +	return __pte(0);
>> +}
>> +#endif
>> +
>>  #ifndef __HAVE_ARCH_FLUSH_PMD_TLB_RANGE
>>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>>  /*
>> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
>> index bea9f76ed7e74..fb757d95bde25 100644
>> --- a/mm/vmalloc.c
>> +++ b/mm/vmalloc.c
>> @@ -38,7 +38,6 @@
>>  #include <linux/rbtree_augmented.h>
>>  #include <linux/overflow.h>
>>  #include <linux/pgtable.h>
>> -#include <linux/hugetlb.h>
>>  #include <linux/sched/mm.h>
>>  #include <asm/tlbflush.h>
>>  #include <asm/shmparam.h>
>> @@ -100,7 +99,7 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>>  	pte_t *pte;
>>  	u64 pfn;
>>  	struct page *page;
>> -	unsigned long size = PAGE_SIZE;
>> +	unsigned long size;
>>  
>>  	if (WARN_ON_ONCE(!PAGE_ALIGNED(end - addr)))
>>  		return -EINVAL;
>> @@ -121,17 +120,12 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>>  			BUG();
>>  		}
>>  
>> -#ifdef CONFIG_HUGETLB_PAGE
>>  		size = arch_vmap_pte_range_map_size(addr, end, pfn, max_page_shift);
>>  		if (size != PAGE_SIZE) {
>> -			pte_t entry = pfn_pte(pfn, prot);
>> -
>> -			entry = arch_make_huge_pte(entry, ilog2(size), 0);
>> -			set_huge_pte_at(&init_mm, addr, pte, entry, size);
>> +			pte_set_huge(pte, addr, PFN_PHYS(pfn), prot, size);
>>
> As far as i understand, X86_64 arches do not use this path. This
> specifically is only for ARM64 or powerpc. pte_set_huge() makes me
> thinking about huge-page mappings(PMD/PUD/hugetlb). This helper is

I disagree. All the helpers in hugetlb.c are all "huge" helpers but
the arch overrides.

It has been a long time since huge mappings have been supported at the PTE
level, setting it by setting multiple ptes is just an implementation detail.

Similarly, there are CONT-PMD mappings on arm64, we still call them huge mappings,
it is a matter of implementation that the huge mapping is expressed by setting
multiple PMDs.

 > about mutli page mapping on the PTE level.
> 
> Better naming? pte_set_large()?
> 
> Any thoughts?
> 
> Other then that:
> 
> Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
> 
> --
> Uladzislau Rezki

