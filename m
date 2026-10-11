Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E748045D90C
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 14:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791729002; cv=none; b=XVDlyNKyuGPiA1TxyQmpM+tg4yR6htV+V6YRmTtijKhKmVwNy1EbUxetFvdCJsR2MUFwGt1CRg1ZGE8gBFC6dKvMRAufeojWqL0/H6jsp7+sUAUJLEkBhIxSd/bAyykWuJ0DFIbW4cR330j8KLTQ8YQeFEuIOij/y61FZNrE25w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791729002; c=relaxed/simple;
	bh=HXkBe2M2PgGhAhRE1NamJlfqWFcxrmOhZsX5xIB6NZU=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bV3A74/PQ26uwRn35dEAWe+Shaw5go6tnMb5ZvpZf8/bhq0tyrf32Z+4dFAw71CecNN7KSdpY8YRkut8vBLgMvdIMzdEFsMY+1vG3U6TZyA4wsgWNivi3PV3TcPcqU2E4WhF6HwWhpPeiVGtXjaO3byMaTxMLZI8lBSOhAGeTEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VFAeZGDC; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VFAeZGDC"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c2e5d08214dso149438166b.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 07:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791728998; x=1792333798; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tDlRoiYs+oXn7JVOx13TUze+GLTM7H/QsH7PUCzNbOI=;
        b=VFAeZGDCfMS8w+dDxDIma4ZUK9X9tf1noLBZP1eXNuGKd5xligP9JBwVA9mHFB+NKg
         8abfgI5B/hVZJmuRjk2wWK8R2bQZgzX8Pwg9tqWFBOYv1BxLOB4F3Vlwd+Gj9KAONa5K
         JHAX9SdaJhFLXjw1byw4DJvRYRvewAYPpDi1MSNppAJsYKK+qLtAGhcmNXwr+9rBAQu4
         jJQ8rlzW6pfXKun1irXRN+FGQrbG41d1SrWU3SX246TteOcsTitbqAH45rQk4/zN6vvD
         tdMWdcrLeFW+r3Bk93YzIjMQFqs43u7n3dxKcwKuwtUfLp+NowTkcrCugNHNLZ4S8cqE
         XTig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791728998; x=1792333798;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tDlRoiYs+oXn7JVOx13TUze+GLTM7H/QsH7PUCzNbOI=;
        b=HhUyk08lBfFdneZxXBSmxU5wJC5r3RkboEGCtcG7eIZX4LBIBG31OvnIqWQOBY5LS9
         3CCNn7iEbYCxgVDSrXlM3WWT1OnpIBcA9M/jHz+E0XRnwXPbd5Bo2JYH3z98gufUkgx8
         ybU4hPFJYBNg00HaYTvnGw0HiXlGeHT2WAzpfpbgquqiSuxKjhJaNhWgdVdg0+Qes0ZP
         OuxkB3GkKeJTC14r5Eby6knsn4r5yUg3HOPC/YzTvmrSFYDYBehIRaA+mYmwLvfyvy3/
         84D7UgKh4d52I8SXrCV1YPyiZqGu5YrBAVyOGpGaxo8rssa2zqL343f3EwcWSgo9069d
         2V1A==
X-Forwarded-Encrypted: i=1; AKwUvBz61HDfOy5yv/Tw8+jMRzCz3xetl2Dg35kucyAEMsDMhivy1qV/ZuVjTPu840OTL67jgYV27aWemGubtl4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKGkcqdYKtCDhsNvXgKL2ucWQJRW4GP4DxuTqfzXCuua4/vFvmI
	z8MaBynrnOqqpV5NE4C2DJulkj8zaUE7qm20HtFYN/uZVHIZ7yFl84kD
X-Gm-Gg: AYBFou1Cre1uIlLijxGFl8VbJbrOXArfeAuXbnSvnnzCHnvCr6aV3KHZzNVZCAyOefS
	TVND0/HOnlDxFZdbgMnYHDLUEb3MZB5tIqGKkOe6eNkI9qDCtGiQpAOfj+Lll8iQ/o6d6r4V2pn
	VrDUeS8DxA0LTks741w1EsDp7eK5JFdCuGn1xr+R99MGz8WhePW9DUwtsuFtwj6hodVdXwDgoU8
	ju4LvbSs1Y+cbq8haHyj89wSjo7kX/bMwZiHzR8WS0943e3odvqaL6ZEFV7stF97F8UUNIKyjPG
	UMdtyPTjbKUEVsy/BLQ+5mUBpG+KR9OqNjEedjB+zfTu+CX/sTS/h2ePXa+iqYVEhCbOp9i0jPr
	tJZpLWcecESAhmTZa0NFKI+YGlYeortc8g0Z2/dBz3yZeODWikEiRBvndD+ZE/KdxSvAMGjfig1
	SjEjhSpi/uOL53TFLexw8DuVYBNwa2JRx6LbKy
X-Received: by 2002:a17:907:3f25:b0:c31:82aa:dd4c with SMTP id a640c23a62f3a-c31a9d15f06mr712746366b.24.1791728997857;
        Sun, 11 Oct 2026 07:29:57 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c34f8bd471dsm13420566b.9.2026.10.11.07.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 07:29:57 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Sun, 11 Oct 2026 16:29:55 +0200
To: Wen Jiang <jiangwenxiaomi@gmail.com>
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, linux-mm@kvack.org,
	urezki@gmail.com, will@kernel.org, Xueyuan.chen21@gmail.com,
	ajd@linux.ibm.com, anshuman.khandual@arm.com, baohua@kernel.org,
	chleroy@kernel.org, david@kernel.org, dev.jain@arm.com,
	jiangwen6@xiaomi.com, leo.yan@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com,
	mpe@ellerman.id.au, npiggin@gmail.com, rppt@kernel.org,
	ryan.roberts@arm.com
Subject: Re: [PATCH v10 03/10] mm/vmalloc: use
 pte_set_huge()/pte_clear_huge() for PTE-level block mappings
Message-ID: <asudY_EhrT5fZGmZ@milan>
References: <20261002090947.869220-1-jiangwen6@xiaomi.com>
 <20261002090947.869220-4-jiangwen6@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002090947.869220-4-jiangwen6@xiaomi.com>

On Fri, Oct 02, 2026 at 05:09:40PM +0800, Wen Jiang wrote:
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
> which requires an arch implementation. BUILD_BUG() makes that
> explicit rather than silently doing nothing.
> 
> Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> Reviewed-by: Barry Song <baohua@kernel.org>
> ---
>  include/linux/pgtable.h | 29 +++++++++++++++++++++++++++++
>  mm/vmalloc.c            | 19 ++++++-------------
>  2 files changed, 35 insertions(+), 13 deletions(-)
> 
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index 8c093c119e5a8..a7fd51fec8a17 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -2204,6 +2204,35 @@ static inline int pmd_free_pte_page(pmd_t *pmd, unsigned long addr)
>  }
>  #endif	/* CONFIG_HAVE_ARCH_HUGE_VMAP */
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
> +	BUILD_BUG();
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
> +	BUILD_BUG();
> +	return __pte(0);
> +}
> +#endif
> +
>  #ifndef __HAVE_ARCH_FLUSH_PMD_TLB_RANGE
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>  /*
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index bea9f76ed7e74..fb757d95bde25 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -38,7 +38,6 @@
>  #include <linux/rbtree_augmented.h>
>  #include <linux/overflow.h>
>  #include <linux/pgtable.h>
> -#include <linux/hugetlb.h>
>  #include <linux/sched/mm.h>
>  #include <asm/tlbflush.h>
>  #include <asm/shmparam.h>
> @@ -100,7 +99,7 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>  	pte_t *pte;
>  	u64 pfn;
>  	struct page *page;
> -	unsigned long size = PAGE_SIZE;
> +	unsigned long size;
>  
>  	if (WARN_ON_ONCE(!PAGE_ALIGNED(end - addr)))
>  		return -EINVAL;
> @@ -121,17 +120,12 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>  			BUG();
>  		}
>  
> -#ifdef CONFIG_HUGETLB_PAGE
>  		size = arch_vmap_pte_range_map_size(addr, end, pfn, max_page_shift);
>  		if (size != PAGE_SIZE) {
> -			pte_t entry = pfn_pte(pfn, prot);
> -
> -			entry = arch_make_huge_pte(entry, ilog2(size), 0);
> -			set_huge_pte_at(&init_mm, addr, pte, entry, size);
> +			pte_set_huge(pte, addr, PFN_PHYS(pfn), prot, size);
>
As far as i understand, X86_64 arches do not use this path. This
specifically is only for ARM64 or powerpc. pte_set_huge() makes me
thinking about huge-page mappings(PMD/PUD/hugetlb). This helper is
about mutli page mapping on the PTE level.

Better naming? pte_set_large()?

Any thoughts?

Other then that:

Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>

--
Uladzislau Rezki
