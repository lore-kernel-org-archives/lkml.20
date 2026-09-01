Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D5C333BBCD
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788253969; cv=none; b=Zk02m8+t41lfHWXD9F9uPeoj77bPUibW8PGJmrZGHfcoCtrmZppcX2C+vfRtXURmEuEQ07qZAn899RC+vXMat6ZMuufvpGCYVbuHEoH9CdX8dOED+3FhKwqpwNajHMGREb9uipFqZVtS9xkTI9kxuoL3BoV4tzW6zb5SRphfhts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788253969; c=relaxed/simple;
	bh=enREb1hLGIClDSI+lR+nr45S0v/YM3qCIAqmJ+ULnY8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wh7/ISklm39Zb1eRT50yt7uswIozmWd8K2haNu7qKortZiAKYRhCJaZ29mpI7DJtQr1ImUrnXRhqQZCwJuGz/uCSV2Rhf7Mk5dHYjDysWvQDOBFpnhEBX7zcio/Z7UWlhLUlfVhkUX7uIfWmmaNHs9ZZorLL9BLlb0s68AmG9ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=XH8iJLfv; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="XH8iJLfv"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6CCA51692;
	Tue,  1 Sep 2026 02:12:41 -0700 (PDT)
Received: from [10.57.7.38] (unknown [10.57.7.38])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9B0C83F882;
	Tue,  1 Sep 2026 02:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788253965; bh=enREb1hLGIClDSI+lR+nr45S0v/YM3qCIAqmJ+ULnY8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XH8iJLfvsMXeORfFTF89ERe9JUlZvJARNBcZWwfUQE2T9861yn/HMZogx9C4fIj3V
	 j7WfImyT5SkqS6Kxbi3g9xjYmkE/Wz2rbhh4orvh/nNpxbcjemwTfuBiPG5aYmfDwF
	 tsR3YlHncQ5sUPZO2Ei8CisvSYKyxf3IS2ErD+SA=
Message-ID: <9f7e0bc4-2825-4ef9-abb1-41e0ffea8e2d@arm.com>
Date: Tue, 1 Sep 2026 11:12:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 2/4] arm64: mm: Use fault handler to permit
 swapper_pg_dir updates
To: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>
References: <20260827164409.3421848-6-ardb+git@google.com>
 <20260827164409.3421848-8-ardb+git@google.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20260827164409.3421848-8-ardb+git@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/08/2026 18:44, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
>
> Instead of checking the destination of a page table descriptor update
> against the virtual address of swapper_pg_dir in the kernel image, and
> taking a dedicated path to perform such updates via a fixmap alias,
> rely on a fault handler to do so if the plain store faulted.
>
> This is more efficient for the general case, and makes it more
> straight-forward to extend this logic to other page tables that may have
> been allocated statically in the .rodata region of the kernel image.
>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/arm64/include/asm/fixmap.h  |  1 +
>  arch/arm64/include/asm/pgtable.h | 49 +++++++++-----------
>  arch/arm64/mm/mmu.c              | 18 +++----
>  3 files changed, 32 insertions(+), 36 deletions(-)
>
> diff --git a/arch/arm64/include/asm/fixmap.h b/arch/arm64/include/asm/fixmap.h
> index 9191125738e9..8db791dcb4cb 100644
> --- a/arch/arm64/include/asm/fixmap.h
> +++ b/arch/arm64/include/asm/fixmap.h
> @@ -99,6 +99,7 @@ enum fixed_addresses {
>  	FIX_PUD,
>  	FIX_P4D,
>  	FIX_PGD,

Doesn't FIX_PTVAL replace FIX_PGD (i.e. we can remove it)?

> +	FIX_PTVAL,
>  
>  	__end_of_fixed_addresses
>  };
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index 6000905a2e86..799cd9d52c28 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -35,6 +35,7 @@
>  #include <asm/cmpxchg.h>
>  #include <asm/fixmap.h>
>  #include <asm/por.h>
> +#include <asm/uaccess.h>
>  #include <linux/mmdebug.h>
>  #include <linux/mm_types.h>
>  #include <linux/sched.h>
> @@ -814,7 +815,7 @@ extern pgd_t idmap_pg_dir[];
>  extern pgd_t tramp_pg_dir[];
>  extern pgd_t reserved_pg_dir[];
>  
> -extern void set_swapper_pgd(pgd_t *pgdp, pgd_t pgd);
> +void try_set_readonly_ptval(ptval_t *ptvalp, ptval_t ptval);
>  
>  static inline bool in_swapper_pgdir(void *addr)
>  {
> @@ -824,17 +825,14 @@ static inline bool in_swapper_pgdir(void *addr)
>  
>  static inline void set_pmd(pmd_t *pmdp, pmd_t pmd)
>  {
> -#ifdef __PAGETABLE_PMD_FOLDED
> -	if (in_swapper_pgdir(pmdp)) {
> -		set_swapper_pgd((pgd_t *)pmdp, __pgd(pmd_val(pmd)));
> -		return;
> -	}
> -#endif /* __PAGETABLE_PMD_FOLDED */
> -
> -	WRITE_ONCE(*pmdp, pmd);
> +	__put_kernel_nofault(pmdp, &pmd, pmd_t, fault);
>  
>  	if (pmd_valid(pmd))
>  		queue_pte_barriers();
> +	return;
> +
> +fault:
> +	try_set_readonly_ptval(&pmd_val(*pmdp), pmd_val(pmd));
>  }
>  
>  static inline void pmd_clear(pmd_t *pmdp)
> @@ -890,15 +888,14 @@ static inline bool pgtable_l4_enabled(void);
>  
>  static inline void set_pud(pud_t *pudp, pud_t pud)
>  {
> -	if (!pgtable_l4_enabled() && in_swapper_pgdir(pudp)) {
> -		set_swapper_pgd((pgd_t *)pudp, __pgd(pud_val(pud)));
> -		return;
> -	}
> -
> -	WRITE_ONCE(*pudp, pud);
> +	__put_kernel_nofault(pudp, &pud, pud_t, fault);
>  
>  	if (pud_valid(pud))
>  		queue_pte_barriers();
> +	return;
> +
> +fault:
> +	try_set_readonly_ptval(&pud_val(*pudp), pud_val(pud));
>  }
>  
>  static inline void pud_clear(pud_t *pudp)
> @@ -971,13 +968,12 @@ static inline bool mm_pud_folded(const struct mm_struct *mm)
>  
>  static inline void set_p4d(p4d_t *p4dp, p4d_t p4d)
>  {
> -	if (in_swapper_pgdir(p4dp)) {
> -		set_swapper_pgd((pgd_t *)p4dp, __pgd(p4d_val(p4d)));
> -		return;
> -	}
> -
> -	WRITE_ONCE(*p4dp, p4d);
> +	__put_kernel_nofault(p4dp, &p4d, p4d_t, fault);
>  	queue_pte_barriers();
> +	return;
> +
> +fault:
> +	try_set_readonly_ptval(&p4d_val(*p4dp), p4d_val(p4d));
>  }
>  
>  static inline void p4d_clear(p4d_t *p4dp)
> @@ -1099,13 +1095,12 @@ static inline bool mm_p4d_folded(const struct mm_struct *mm)
>  
>  static inline void set_pgd(pgd_t *pgdp, pgd_t pgd)
>  {
> -	if (in_swapper_pgdir(pgdp)) {
> -		set_swapper_pgd(pgdp, __pgd(pgd_val(pgd)));
> -		return;
> -	}
> -
> -	WRITE_ONCE(*pgdp, pgd);
> +	__put_kernel_nofault(pgdp, &pgd, pgd_t, fault);
>  	queue_pte_barriers();
> +	return;
> +
> +fault:
> +	try_set_readonly_ptval(&pgd_val(*pgdp), pgd_val(pgd));
>  }
>  
>  static inline void pgd_clear(pgd_t *pgdp)
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 9c1aa838e9d5..b97e4bf99ca5 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -63,34 +63,34 @@ static bool rodata_is_rw __ro_after_init = true;
>   */
>  long __section(".mmuoff.data.write") __early_cpu_boot_status;
>  
> -static DEFINE_SPINLOCK(swapper_pgdir_lock);

Might be nicer to change this in a separate patch as AFAICT it's not
related/required for this patch.

>  static DEFINE_MUTEX(fixmap_lock);
>  
> -void noinstr set_swapper_pgd(pgd_t *pgdp, pgd_t pgd)
> +void noinstr try_set_readonly_ptval(ptval_t *ptvalp, ptval_t ptval)
>  {
> -	pgd_t *fixmap_pgdp;
> +	static DEFINE_SPINLOCK(lock);
> +
> +	BUG_ON(!in_swapper_pgdir(ptvalp));
>  
>  	/*
>  	 * Don't bother with the fixmap if swapper_pg_dir is still mapped
>  	 * writable in the kernel mapping.
>  	 */
>  	if (rodata_is_rw) {

Is that ever a valid situation? If rodata_is_rw, then we shouldn't be
here in the first place and that deserves a BUG_ON(), no?

- Kevin

> -		WRITE_ONCE(*pgdp, pgd);
> +		WRITE_ONCE(*ptvalp, ptval);
>  		dsb(ishst);
>  		isb();
>  		return;
>  	}
>  
> -	spin_lock(&swapper_pgdir_lock);
> -	fixmap_pgdp = pgd_set_fixmap(__pa_symbol(pgdp));
> -	WRITE_ONCE(*fixmap_pgdp, pgd);
> +	guard(spinlock)(&lock);
> +	ptvalp = (ptval_t *)set_fixmap_offset(FIX_PTVAL, __pa_symbol(ptvalp));
> +	WRITE_ONCE(*ptvalp, ptval);
>  	/*
>  	 * We need dsb(ishst) here to ensure the page-table-walker sees
>  	 * our new entry before set_p?d() returns. The fixmap's
>  	 * flush_tlb_kernel_range() via clear_fixmap() does this for us.
>  	 */
> -	pgd_clear_fixmap();
> -	spin_unlock(&swapper_pgdir_lock);
> +	clear_fixmap(FIX_PTVAL);
>  }
>  
>  pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
