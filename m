Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794485986;
	b=D74Hxd6aUYSi4R0xQCY+jI7yMjIYPUWG95wtAQYhw/OEXiffXis2WBfbj9AgxBcfoc7p
	 ZV8L/8AwRwoUbSsVmXWZy7D9nr/OyZQ6kD33tVystWzgzRAP/l40ecroYD6wugaNR/ioO
	 HIiZ1W9SV8MsUlhK1GN+mcnRcLigVysq184rwskr4UppaxTH/X1/lb/4fRsmByvM67pXK
	 KNf4IxNntTsjXn1NT1eKSz16I3xqLmluxNEgJVjFI4ytv6NVRfvV96eJVqB7S0umF05/j
	 /8Q75KGNaXTuf40ctAbAJ3ycXft/JyBVUMnj/zzjU3F4FM+XfHOJAFBqwmgAQF9PrdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794485986;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=nUSryPc8FOxmi8aSaPQaQCxq9NdA1cPGVMbhIcbhZaQ=;
	b=GRqGhuqA/RVVFuDgWu7YT+/KEKuGYcqlpP9JUmsfzp15whLMR05e/LYaefMVvFgjNInq
	 yvWgv1gwvW35k217C3rJE1r1zM6k+rgWdMZb7nA+slX3whr1wfybu2Qb5qRAE/YkRyzNO
	 A6yjA2Emyhhu9c76pe6Wtl5t9vaqWGPho6vXRht/4Ouup0vh+lhh+lwdzy8sOldVaCKUA
	 VUEVWzPymGEN+L6ihasF+1QkTsJ6/vo0JZULjQn6mI4g5CEXLpdKJWJF5KWvnvc0JR4Pl
	 W2bMQa8UODblLPwcBYISEt1BmErIx5oeojNAUzJQmAkp5OqMf2JQZR4Li+8TUMs2o5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UVcjHurf;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201C9606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:19:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 201C9606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UVcjHurf
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b70192ebceso1575720a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794485984; x=1795090784; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nUSryPc8FOxmi8aSaPQaQCxq9NdA1cPGVMbhIcbhZaQ=;
        b=UVcjHurfehjUayjb4f/msaul80iyss6O5af+WtByKTNAZJa2osJesX8dNdggXaYmnG
         pMhGa0NtYDbnSVZZS6ez8V8irTHazeAuDLG3kYfOFfXyGU/xqp9BrurGH5kT6gj5zOOr
         2uyq3GUy5la9vu0ulUXQdC4502gUfyquPpcI1hlI7aLLWOm4eyuyW8Mvy6WE0KmJZuoh
         CtTkb14kQrbxSMAk0weku/HPtQC5VffLaaXNrXBPckt/gEY7tFC3YlWOY++BhvX2bAvu
         sxPzueuz7BCOVtKqhjGOfleu/lcnLgbONEgvTetK5J0IT2iMJXCDT1z6oreeV+Mx4aG8
         yJ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794485984; x=1795090784;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nUSryPc8FOxmi8aSaPQaQCxq9NdA1cPGVMbhIcbhZaQ=;
        b=gOSl+7kgVtbDm6GD0iCFJZNd7oZmHAJEjKXqxCvliCKVJosbDKqGAdoijX4BGbyQXq
         nSxFl82e59t958u4l81WJFFSm027uZzerQJJe0SAUvn1wEDV6I4RJcdBJ11uLsnlxf2o
         ce1xjYwIX58s603qEWHaOHupNsysQyWsOQ2LayLff49eSidUpll474SZKmzlMZWB/eto
         xUDTX/GdGlSn2IR6i6KFaCP7/LCNr6v7RsIh/oZ3cnp+mXPTfxz4i6/Wkyy6VPwOUbnZ
         A2fsQw+CeXDwko7qKdCfepOm2w0vbmhndnN1ANLG19JydGhE7fj8c0Xk81zCSCEYqp2Y
         BYZQ==
X-Forwarded-Encrypted: i=1; AL+hErHzrVypmeZBUUo8oCLO9ovPkrxllV2Z77Ld/mX1sXUVyjujJMLVmWtH7pqJOU48+C+a8VWSVbvz2DU1ejs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Mfyc00Wogq5iLPXzTEe13gz2AArc12EpB4xd+u2M5z4xoQbEW
	zZocjxPeSkBarAQfTht00PrBnPuyn1cqyf7OKlkzB6KXxYlfORj4SvyN
X-Gm-Gg: AYBFou2TSU3/oopBegZ94Y88DCEiRH/yzYPaR1YWd7wj3myqLOWrdZuUSlfhrYYToaV
	Oxytv2XzXZBv8Dij8nSQmStEBK+izOR3oYNAKrY57G0ycXXq833SHHFy4+VQI+EFa2IQRR09oOD
	ULbG5S8zrAg9/P/1w2Tk+N51VD+9tL7RxEGf37EpsiSYaMOi5VHbQDzzcAp90XMKqIEm+KRjnRS
	wQ3D+zZRN4nrvr4/fzaEcc9t5p9T7O4cEilUCxO0PToFun2+bsEt279MMTyyAi2xURa3ktfjjYS
	mZplxCk59wLXx/cElBRrFWb9QvT5DxC40Rh+790GXiStLZPw0uiZPS7YMBy+XHLuY3l5+Cc/7Rj
	uK01XgsDc48W9LCBzaJSmhsvIjUPqMmcpdG0QNxOeOsffH1zODWXADsMBQddDo7VxIG2xxAIWxq
	JZZ2FtjgqZ7rQ8aCD5u4h2cZsKwFCNNGX3rv8xxr/mwQNaXMBHGiuBrgMpKTO0IorBFLp4C1c+w
	XpyacOaHNKgbB+6oCaDWXMIqBFHNHZfB5c0pITBIbmN5qZ1eqFQpmyqspv8FNxxmJT0bQ==
X-Received: by 2002:a05:6402:54:b0:6b7:834c:ebaf with SMTP id 4fb4d7f45d1cf-6b79e0b5b6fmr1355144a12.12.1794485984373;
        Thu, 12 Nov 2026 04:19:44 -0800 (PST)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7ada54c88sm329841a12.2.2026.11.12.04.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 04:19:43 -0800 (PST)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Thu, 12 Nov 2026 13:19:41 +0100
To: Hao Ge <hao.ge@linux.dev>
Cc: Uladzislau Rezki <urezki@gmail.com>, Dev Jain <dev.jain@arm.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>,
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@gentwo.org>, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
	linux-mm@kvack.org
Subject: Re: [PATCH v4 7/9] mm/vmalloc: undo partial mappings inside the
 mapping functions
Message-ID: <avWu3YUFQHj3FaPs@milan>
References: <20261110112546.261415-1-hao.ge@linux.dev>
 <20261110112546.261415-8-hao.ge@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110112546.261415-8-hao.ge@linux.dev>

On Tue, Nov 10, 2026 at 07:25:44PM +0800, Hao Ge wrote:
> The vmap entry points may install some PTEs and then fail, leaving a
> partial mapping behind.
> 
> The callers do not agree on who cleans it up. pcpu_map_pages() and
> kmsan_ioremap_page_range() roll back what they mapped, while
> vm_module_tags_populate() and the __GFP_NOFAIL retry loop in
> __vmalloc_area_node() expect a clean range from the mapping function.
> For them the leftovers stay mapped, and the next attempt to map the
> same range trips the WARN_ON(!pte_none()) in vmap_pages_pte_range().
> A leftover huge pmd is even worse. During the retry, vmap_try_huge_pmd()
> calls pmd_free_pte_page() on it, and the x86 implementation cannot
> tell a leaf entry from a page table and frees the mapped page.
> 
> After discussing with Suren and Ulad, we decided to put the rollback
> into the entry points of the vmap API rather than into every
> low-level helper. __vmap_pages_range_noflush() undoes the whole range
> it was asked to map when it fails, and vmap_page_range() undoes its
> range for the ioremap-style mappings.
> 
> The rollback is __vunmap_range_noflush(), which only clears the PTEs.
> No TLB flush is needed, nothing has touched the mapping yet.
> vmap_pages_range_noflush() also drops the KMSAN metadata of the
> failed mapping.
> 
> The undo walk skips its cond_resched() when the caller's gfp mask
> cannot block. __vmalloc() with GFP_ATOMIC or GFP_NOWAIT can run in
> atomic context, where cond_resched() cannot schedule.
> __vunmap_range_noflush() takes a can_resched argument for that, which
> the sleepable callers pass as true.
> 
> Suggested-by: Uladyslau Rezki <urezki@gmail.com>
> Signed-off-by: Hao Ge <hao.ge@linux.dev>
> ---
>  include/linux/kmsan.h |  8 ++++--
>  mm/kmsan/hooks.c      | 18 ++++++++-----
>  mm/kmsan/shadow.c     |  7 ++---
>  mm/vmalloc.c          | 61 +++++++++++++++++++++++++++++++++----------
>  mm/vmalloc.h          |  6 +++--
>  5 files changed, 72 insertions(+), 28 deletions(-)
> 
> diff --git a/include/linux/kmsan.h b/include/linux/kmsan.h
> index 7da9fd506b39..0016c032d1e7 100644
> --- a/include/linux/kmsan.h
> +++ b/include/linux/kmsan.h
> @@ -150,11 +150,14 @@ int __must_check kmsan_vmap_pages_range_noflush(unsigned long start,
>   * kmsan_vunmap_kernel_range_noflush() - Notify KMSAN about a vunmap.
>   * @start: start of vunmapped range.
>   * @end:   end of vunmapped range.
> + * @can_resched: whether the unmap walk may call cond_resched(); pass
> + * false from atomic context.
>   *
>   * KMSAN unmaps the contiguous metadata ranges created by
>   * kmsan_map_kernel_range_noflush().
>   */
> -void kmsan_vunmap_range_noflush(unsigned long start, unsigned long end);
> +void kmsan_vunmap_range_noflush(unsigned long start, unsigned long end,
> +				bool can_resched);
>  
>  /**
>   * kmsan_ioremap_page_range() - Notify KMSAN about a ioremap_page_range() call.
> @@ -355,7 +358,8 @@ static inline int __must_check kmsan_vmap_pages_range_noflush(
>  }
>  
>  static inline void kmsan_vunmap_range_noflush(unsigned long start,
> -					      unsigned long end)
> +					      unsigned long end,
> +					      bool can_resched)
>  {
>  }
>  
> diff --git a/mm/kmsan/hooks.c b/mm/kmsan/hooks.c
> index 107f66841274..0cd1edaa1120 100644
> --- a/mm/kmsan/hooks.c
> +++ b/mm/kmsan/hooks.c
> @@ -136,13 +136,16 @@ static unsigned long vmalloc_origin(unsigned long addr)
>  						 KMSAN_META_ORIGIN);
>  }
>  
> -void kmsan_vunmap_range_noflush(unsigned long start, unsigned long end)
> +void kmsan_vunmap_range_noflush(unsigned long start, unsigned long end,
> +				bool can_resched)
>  {
>  	if (!kmsan_enabled)
>  		return;
>  
> -	__vunmap_range_noflush(vmalloc_shadow(start), vmalloc_shadow(end));
> -	__vunmap_range_noflush(vmalloc_origin(start), vmalloc_origin(end));
> +	__vunmap_range_noflush(vmalloc_shadow(start), vmalloc_shadow(end),
> +			       can_resched);
> +	__vunmap_range_noflush(vmalloc_origin(start), vmalloc_origin(end),
> +			       can_resched);
>  	flush_cache_vmap(vmalloc_shadow(start), vmalloc_shadow(end));
>  	flush_cache_vmap(vmalloc_origin(start), vmalloc_origin(end));
>  }
> @@ -171,8 +174,9 @@ static void kmsan_iounmap_pages(unsigned long start, unsigned long end)
>  		if (origin)
>  			__free_pages(origin, KMSAN_IOREMAP_META_ORDER);
>  	}
> -	__vunmap_range_noflush(shadow_start, shadow_end);
> -	__vunmap_range_noflush(origin_start, origin_end);
> +	/* ioremap metadata mappings are always GFP_KERNEL, so resched is safe. */
> +	__vunmap_range_noflush(shadow_start, shadow_end, true);
> +	__vunmap_range_noflush(origin_start, origin_end, true);
>  	flush_tlb_kernel_range(shadow_start, shadow_end);
>  	flush_tlb_kernel_range(origin_start, origin_end);
>  }
> @@ -207,7 +211,7 @@ int kmsan_ioremap_page_range(unsigned long start, unsigned long end,
>  		mapped = __vmap_pages_range_noflush(
>  			vmalloc_shadow(start + off),
>  			vmalloc_shadow(start + off + PAGE_SIZE), prot, &shadow,
> -			PAGE_SHIFT);
> +			PAGE_SHIFT, gfp_mask);
>  		if (mapped) {
>  			err = mapped;
>  			goto ret;
> @@ -217,7 +221,7 @@ int kmsan_ioremap_page_range(unsigned long start, unsigned long end,
>  		mapped = __vmap_pages_range_noflush(
>  			vmalloc_origin(start + off),
>  			vmalloc_origin(start + off + PAGE_SIZE), prot, &origin,
> -			PAGE_SHIFT);
> +			PAGE_SHIFT, gfp_mask);
>  		if (mapped) {
>  			err = mapped;
>  			goto ret;
> diff --git a/mm/kmsan/shadow.c b/mm/kmsan/shadow.c
> index 2166086d3dc3..452760a333e4 100644
> --- a/mm/kmsan/shadow.c
> +++ b/mm/kmsan/shadow.c
> @@ -247,7 +247,7 @@ int kmsan_vmap_pages_range_noflush(unsigned long start, unsigned long end,
>  	origin_end = vmalloc_meta((void *)end, KMSAN_META_ORIGIN);
>  	kmsan_enter_runtime();
>  	mapped = __vmap_pages_range_noflush(shadow_start, shadow_end, prot,
> -					    s_pages, page_shift);
> +					    s_pages, page_shift, gfp_mask);
>  	kmsan_leave_runtime();
>  	if (mapped) {
>  		err = mapped;
> @@ -255,12 +255,13 @@ int kmsan_vmap_pages_range_noflush(unsigned long start, unsigned long end,
>  	}
>  	kmsan_enter_runtime();
>  	mapped = __vmap_pages_range_noflush(origin_start, origin_end, prot,
> -					    o_pages, page_shift);
> +					    o_pages, page_shift, gfp_mask);
>  	kmsan_leave_runtime();
>  	if (mapped) {
>  		/* Undo the shadow mapping set up above. */
>  		kmsan_enter_runtime();
> -		__vunmap_range_noflush(shadow_start, shadow_end);
> +		__vunmap_range_noflush(shadow_start, shadow_end,
> +				       gfpflags_allow_blocking(gfp_mask));
>  		kmsan_leave_runtime();
>  		err = mapped;
>  		goto ret;
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 3f98056f8c7e..d1986f68eab4 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -372,8 +372,12 @@ int vmap_page_range(unsigned long addr, unsigned long end,
>  	if (!err)
>  		err = kmsan_ioremap_page_range(addr, end, phys_addr, prot,
>  					       ioremap_max_page_shift);
> -	if (!err)
> +	if (err) {
> +		/* Callers are ioremap and arch setup code, always sleepable. */
> +		__vunmap_range_noflush(addr, end, true);
> +	} else {
>  		flush_cache_vmap(addr, end);
> +	}
>  
>  	return err;
>  }
> @@ -429,7 +433,7 @@ static void vunmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>  }
>  
>  static void vunmap_pmd_range(pud_t *pud, unsigned long addr, unsigned long end,
> -			     pgtbl_mod_mask *mask)
> +			     pgtbl_mod_mask *mask, bool can_resched)
>  {
>  	pmd_t *pmd;
>  	unsigned long next;
> @@ -451,12 +455,14 @@ static void vunmap_pmd_range(pud_t *pud, unsigned long addr, unsigned long end,
>  			continue;
>  		vunmap_pte_range(pmd, addr, next, mask);
>  
> -		cond_resched();
> +		/* The undo path may run in atomic context. */
> +		if (can_resched)
> +			cond_resched();
>  	} while (pmd++, addr = next, addr != end);
>  }
>  
>  static void vunmap_pud_range(p4d_t *p4d, unsigned long addr, unsigned long end,
> -			     pgtbl_mod_mask *mask)
> +			     pgtbl_mod_mask *mask, bool can_resched)
>  {
>  	pud_t *pud;
>  	unsigned long next;
> @@ -476,12 +482,12 @@ static void vunmap_pud_range(p4d_t *p4d, unsigned long addr, unsigned long end,
>  		}
>  		if (pud_none_or_clear_bad(pud))
>  			continue;
> -		vunmap_pmd_range(pud, addr, next, mask);
> +		vunmap_pmd_range(pud, addr, next, mask, can_resched);
>  	} while (pud++, addr = next, addr != end);
>  }
>  
>  static void vunmap_p4d_range(pgd_t *pgd, unsigned long addr, unsigned long end,
> -			     pgtbl_mod_mask *mask)
> +			     pgtbl_mod_mask *mask, bool can_resched)
>  {
>  	p4d_t *p4d;
>  	unsigned long next;
> @@ -496,7 +502,7 @@ static void vunmap_p4d_range(pgd_t *pgd, unsigned long addr, unsigned long end,
>  
>  		if (p4d_none_or_clear_bad(p4d))
>  			continue;
> -		vunmap_pud_range(p4d, addr, next, mask);
> +		vunmap_pud_range(p4d, addr, next, mask, can_resched);
>  	} while (p4d++, addr = next, addr != end);
>  }
>  
> @@ -512,7 +518,8 @@ static void vunmap_p4d_range(pgd_t *pgd, unsigned long addr, unsigned long end,
>   *
>   * This is an internal function only. Do not use outside mm/.
>   */
> -void __vunmap_range_noflush(unsigned long start, unsigned long end)
> +void __vunmap_range_noflush(unsigned long start, unsigned long end,
> +			    bool can_resched)
>  {
>  	unsigned long next;
>  	pgd_t *pgd;
> @@ -529,7 +536,7 @@ void __vunmap_range_noflush(unsigned long start, unsigned long end)
>  			mask |= PGTBL_PGD_MODIFIED;
>  		if (pgd_none_or_clear_bad(pgd))
>  			continue;
> -		vunmap_p4d_range(pgd, addr, next, &mask);
> +		vunmap_p4d_range(pgd, addr, next, &mask, can_resched);
>  	} while (pgd++, addr = next, addr != end);
>  
>  	if (mask & ARCH_PAGE_TABLE_SYNC_MASK)
> @@ -538,8 +545,9 @@ void __vunmap_range_noflush(unsigned long start, unsigned long end)
>  
>  void vunmap_range_noflush(unsigned long start, unsigned long end)
>  {
> -	kmsan_vunmap_range_noflush(start, end);
> -	__vunmap_range_noflush(start, end);
> +	/* The unmap paths are sleepable, keep the resched point. */
> +	kmsan_vunmap_range_noflush(start, end, true);
> +	__vunmap_range_noflush(start, end, true);
>  }
>  
>  /**
> @@ -727,18 +735,32 @@ static int vmap_pages_range_noflush_walk(unsigned long addr, unsigned long end,
>   * The caller is responsible for calling flush_cache_vmap() after this
>   * function returns successfully and before the addresses are accessed.
>   *
> + * On failure the mapping is torn down before returning, so a retry
> + * sees a clean range. When @gfp_mask cannot block, the teardown
> + * skips cond_resched(), it may run in atomic context.
> + *
>   * This is an internal function only. Do not use outside mm/.
>   */
>  int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
> -		pgprot_t prot, struct page **pages, unsigned int page_shift)
> +		pgprot_t prot, struct page **pages, unsigned int page_shift,
> +		gfp_t gfp_mask)
>  {
> +	int err;
> +
>  	if (WARN_ON_ONCE(page_shift < PAGE_SHIFT))
>  		return -EINVAL;
>  
>  	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC))
>  		page_shift = PAGE_SHIFT;
>  
> -	return vmap_pages_range_noflush_walk(addr, end, prot, pages, page_shift);
> +	err = vmap_pages_range_noflush_walk(addr, end, prot, pages, page_shift);
> +
> +	/* Undo the PTEs installed before the failure. */
> +	if (err)
> +		__vunmap_range_noflush(addr, end,
> +				       gfpflags_allow_blocking(gfp_mask));
> +
> +	return err;
>  }
>  
>  int vmap_pages_range_noflush(unsigned long addr, unsigned long end,
> @@ -750,7 +772,18 @@ int vmap_pages_range_noflush(unsigned long addr, unsigned long end,
>  
>  	if (ret)
>  		return ret;
> -	return __vmap_pages_range_noflush(addr, end, prot, pages, page_shift);
> +
> +	ret = __vmap_pages_range_noflush(addr, end, prot, pages, page_shift,
> +					 gfp_mask);
> +	/*
> +	 * The page tables undo themselves on failure. Tear down the
> +	 * metadata that was fully set up before the mapping failed.
> +	 */
> +	if (ret)
> +		kmsan_vunmap_range_noflush(addr, end,
> +					   gfpflags_allow_blocking(gfp_mask));
> +
> +	return ret;
>  }
>  
>  static int __vmap_pages_range(unsigned long addr, unsigned long end,
> diff --git a/mm/vmalloc.h b/mm/vmalloc.h
> index d8372a4f65c4..9ea28845f713 100644
> --- a/mm/vmalloc.h
> +++ b/mm/vmalloc.h
> @@ -40,10 +40,12 @@ void clear_vm_uninitialized_flag(struct vm_struct *vm);
>  
>  int __must_check __vmap_pages_range_noflush(unsigned long addr,
>  		unsigned long end, pgprot_t prot,
> -		struct page **pages, unsigned int page_shift);
> +		struct page **pages, unsigned int page_shift,
> +		gfp_t gfp_mask);
>  
>  void vunmap_range_noflush(unsigned long start, unsigned long end);
>  
> -void __vunmap_range_noflush(unsigned long start, unsigned long end);
> +void __vunmap_range_noflush(unsigned long start, unsigned long end,
> +			    bool can_resched);
>  
>  #endif /* __MM_VMALLOC_H */
> -- 
> 2.25.1
> 
OK. Waiting for v5.

--
Uladzislau Rezki
