Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D91CC2DF12F
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791957840; cv=none; b=gBDi8IjCeyqwxuxP0B5pVmf0+TBkmWfktMr3Tg8rTjXmuDTw2KfH+F4zo3dC0eZHk4iUrFOUOHMQeUYlAeY7mIHCiO3sEFN2d51WL/atSiN6+FV8DQKUZLZHn4NSWorF0n4YbRseoY3pdLJIJTljWcteNu3V7pqJLGSSFa3caN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791957840; c=relaxed/simple;
	bh=a+ePuoScWznFCdZL7kuuIwctTxuRzsdaAnI868FjqvY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hsKAmdBdL3QfnulPy6t7G9c87aiCvgK+TSEOhk/7lFfAyb5ngveaqcr1bP5V8jVfSYIiAR3egtfACV/guOervAeepEWH6XCLEglKBuEioQwbNbMhUw7nt4CsvrQa7DHJRCLGe2mWnMv237jRReR+4f8MgmjPn6MH0SkH5GkShf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=NGFOsBqQ; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="NGFOsBqQ"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 98CEA15A1;
	Tue, 13 Oct 2026 23:03:52 -0700 (PDT)
Received: from [10.164.19.62] (unknown [10.164.19.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6D3F03F7B4;
	Tue, 13 Oct 2026 23:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791957835; bh=a+ePuoScWznFCdZL7kuuIwctTxuRzsdaAnI868FjqvY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NGFOsBqQlkYzYRc6c9oeI62OwONXctPXAWs1X+w9O0ZGSX08mzBFLCRloqvuXoEcs
	 l+RKSocjuhfxG9ajTVLYRvJo74qsxS3Fa4vk2551oznUYNciNmnhrtaKCzGd4OvWLE
	 xxJq6dznjLsg4ngtYlAUgjw44+L1Kvxk1pfNNxrY=
Message-ID: <7b3c3a39-4cf3-430d-9fd3-ba83e5175e72@arm.com>
Date: Wed, 14 Oct 2026 11:33:47 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 01/10] arm64/mm: add pte_set_huge() and
 pte_clear_huge()
To: Wen Jiang <jiangwenxiaomi@gmail.com>, akpm@linux-foundation.org,
 catalin.marinas@arm.com, linux-mm@kvack.org, urezki@gmail.com,
 will@kernel.org
Cc: Xueyuan.chen21@gmail.com, ajd@linux.ibm.com, anshuman.khandual@arm.com,
 baohua@kernel.org, chleroy@kernel.org, david@kernel.org,
 jiangwen6@xiaomi.com, leo.yan@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, rppt@kernel.org,
 ryan.roberts@arm.com
References: <20261002090947.869220-1-jiangwen6@xiaomi.com>
 <20261002090947.869220-2-jiangwen6@xiaomi.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20261002090947.869220-2-jiangwen6@xiaomi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 02/10/26 2:39 pm, Wen Jiang wrote:
> vmap installs PTE-level block mappings (PTE_CONT on arm64) by reusing
> set_huge_pte_at() and huge_ptep_get_and_clear(), which are HugeTLB
> helpers gated by CONFIG_HUGETLB_PAGE. This makes the feature silently
> unavailable on CONFIG_HUGETLB_PAGE=n kernels and couples mm/vmalloc.c to
> HugeTLB internals it does not otherwise need.
> 
> Add pte_set_huge()/pte_clear_huge() to arm64, joining the existing
> pmd_set_huge()/pud_set_huge() family in mm/mmu.c. They build on
> __set_ptes() and __get_and_clear_full_ptes() directly, so they do not
> depend on CONFIG_HUGETLB_PAGE.
> 
> There is no caller yet: mm/vmalloc.c is converted later in this series,
> once the generic fallbacks are in place.
> 
> Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> Reviewed-by: Barry Song <baohua@kernel.org>
> ---
>  arch/arm64/include/asm/pgtable.h |  6 ++++++
>  arch/arm64/mm/mmu.c              | 23 +++++++++++++++++++++++
>  2 files changed, 29 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index 6000905a2e865..9b762eb68cff0 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -1978,6 +1978,12 @@ static inline void clear_young_dirty_ptes(struct vm_area_struct *vma,
>  
>  #endif /* CONFIG_ARM64_CONTPTE */
>  
> +#define __HAVE_ARCH_PTE_SET_HUGE
> +void pte_set_huge(pte_t *ptep, unsigned long addr, phys_addr_t phys,
> +		  pgprot_t prot, unsigned long size);
> +#define __HAVE_ARCH_PTE_CLEAR_HUGE
> +pte_t pte_clear_huge(pte_t *ptep, unsigned long addr, unsigned long size);
> +
>  #endif /* !__ASSEMBLER__ */
>  
>  #endif /* __ASM_PGTABLE_H */
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 79d90226fd5dc..ae2f15618c97d 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -1912,6 +1912,29 @@ int pmd_clear_huge(pmd_t *pmdp)
>  	return 1;
>  }
>  
> +void pte_set_huge(pte_t *ptep, unsigned long addr, phys_addr_t phys,
> +		  pgprot_t prot, unsigned long size)
> +{
> +	unsigned long pfn = __phys_to_pfn(phys);
> +	pte_t pte = pte_mkcont(pfn_pte(pfn, prot));
> +	unsigned int nr = size >> PAGE_SHIFT;
> +
> +	VM_WARN_ON(!IS_ALIGNED(size, CONT_PTE_SIZE));
> +	VM_WARN_ON(!IS_ALIGNED(addr, CONT_PTE_SIZE));
> +	VM_WARN_ON(!IS_ALIGNED(pfn, CONT_PTES));
> +
> +	/* For vmap, there is no valid -> valid transition */
> +	VM_WARN_ON(pte_valid(__ptep_get(ptep)));
> +
> +	__set_ptes(&init_mm, addr, ptep, pte, nr);
> +}
> +
> +pte_t pte_clear_huge(pte_t *ptep, unsigned long addr, unsigned long size)
> +{
> +	return __get_and_clear_full_ptes(&init_mm, addr, ptep,
> +					 size >> PAGE_SHIFT, 0);
> +}

I think we should have the same VM_WARN_ON() checks here, as for
pte_clear_huge(), in addition to also warning for
current->mm != &init_mm.

We should make it clear that pte_clear_huge() gets called only for
kernel mappings, and the range we operate on is definitely an aligned
CONT range - which is why we do not go through get_and_clear_full_ptes ->
contpte_get_and_clear_full_ptes, and possibly contpte_try_unfold(), but
directly use __get_and_clear_full_ptes.


> +
>  int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
>  {
>  	pte_t *table;

