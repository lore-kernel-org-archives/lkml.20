Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A943396D15
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 09:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788427386; cv=none; b=OWMXDvdlSE3wTEfpboJRQuCw+tXVySKTq8M1lHpOaBMPVBlR5pGkpE2Dt8A7Ia5TmvUtCMUfGfAlxT0kvCv/pdUd3z5yahiivHOaHTcTmBLZ9+9VR1UqPz303W9SdskY+7FHHtn43mgETkhDhAT9RGYjEJ1SH6FLOhelGGPL7V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788427386; c=relaxed/simple;
	bh=QJzTl9mpfbcR/ern5So2dPo/+BdDFUSyA8/TbaT21bI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FzK+aXxKLfoUb65Sxa6F9Bw1hwj2Q4K4TyuxWc0BeRtC/XbP/F5twLL+PNZEQCeb0WoIs2gdQf8SrdgzSjpVhy4V2fMLKZRRvPagoRnRyjNI781R7kDNEgA3sQiNPrCjZFv7eEZ8kbTBVc2AFecMOvh13bAzRU9l6sf9QqF+hxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CsLTmwDY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CsLTmwDY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 969871F000E9;
	Thu,  3 Sep 2026 09:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788427376;
	bh=CVH46s0TiBnSL1nhlyLYQT7Nebe0o5BJiT5/S7ZnuZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CsLTmwDYUQuPdEGJ2URh4YYrVQjku/PYtQd8szB9HFBHKuxNiHG8jlkrL7gi1baJv
	 baOlP721yc+Gapvn+co/bsCE+vzOe7wj38uGpYqZPkxomRAwIz0bQTUhRLhTAuqqra
	 dcAYfgKFIupV+om73sgPaweqXIGMwkg5fWtKJMpvY7FG1n04OkQOJYThS8OWkrXRF/
	 6d+zCI/PEFFnvI3TBktpF/UQ7XAfs6aQrSu5o0XLNpvLlz/KIh0d4q4F8mng6kmC35
	 gHgYzeK4HV1Zw3Tpumbe8aupeoEBK6jboDtDlQeHq19XetZJxR/N2esfUJW+ShNiZf
	 qTij8AvQ7COkA==
Date: Thu, 3 Sep 2026 12:22:45 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Xueyuan Chen <xueyuan.chen21@gmail.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
	usama.arif@linux.dev, ziy@nvidia.com, baolin.wang@linux.alibaba.com,
	liam@infradead.org, nico.pache@linux.dev, ryan.roberts@arm.com,
	dev.jain@arm.com, baohua@kernel.org, lance.yang@linux.dev,
	kas@kernel.org, catalin.marinas@arm.com, will@kernel.org,
	mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
	tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	luto@kernel.org, peterz@infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/3] mm: make persistent huge zero folio read-only
Message-ID: <apk8ZRr6do_YAlzf@kernel.org>
References: <20260901151818.3191443-1-xueyuan.chen21@gmail.com>
 <20260901151818.3191443-2-xueyuan.chen21@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901151818.3191443-2-xueyuan.chen21@gmail.com>

On Tue, Sep 01, 2026 at 11:18:16PM +0800, Xueyuan Chen wrote:
> The persistent huge zero folio is shared globally and should stay zero
> after initialization. As Jann Horn pointed out [1], kernel bugs have
> ended up writing to pages that were meant to be read-only, including in
> security-sensitive cases. Making the folio read-only in the direct map
> turns such writes into faults instead of silent zero-page corruption.
> 
> Add a page-based helper consistent with the existing direct-map interfaces.
> Handle TLB invalidation in the architecture implementation; unsupported
> architectures retain their current behavior.
> 
> Protect the folio after initialization. Skip highmem folios, which have no
> permanent direct-map mapping.
> 
> Inspired by Jann Horn's read-only zero page work [1] and follow-up
> discussion [3] with Yang Shi.
> 
> Link: https://lore.kernel.org/r/20260508-ro-zeropage-v1-1-9808abc20b49@google.com [1]
> Link: https://lore.kernel.org/r/0e5b23a6-4895-454a-9dfa-6dc21adc2991@kernel.org [2]
> Link: https://lore.kernel.org/r/CAHbLzkrXXe7r3n3jXgDKtwZhRqj=jDx9E6dLOULohnhBguvi9A@mail.gmail.com [3]
> 
> Suggested-by: David Hildenbrand <david@kernel.org>
> Suggested-by: Usama Arif <usama.arif@linux.dev>
> Co-developed-by: Lance Yang <lance.yang@linux.dev>
> Signed-off-by: Lance Yang <lance.yang@linux.dev>
> Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> ---
>  include/linux/set_memory.h | 17 +++++++++++++++++
>  mm/huge_memory.c           | 13 ++++++++++---
>  2 files changed, 27 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/set_memory.h b/include/linux/set_memory.h
> index 3fe293cfed8c..ed9ce04b18a1 100644
> --- a/include/linux/set_memory.h
> +++ b/include/linux/set_memory.h
> @@ -54,6 +54,23 @@ static inline bool can_set_direct_map(void)
>  #endif
>  #endif /* CONFIG_ARCH_HAS_SET_DIRECT_MAP */
>  
> +#ifndef set_direct_map_ro
> +/**
> + * set_direct_map_ro - make a direct-map range read-only
> + * @page: first page in the direct-map range
> + * @nr: number of pages in the range
> + *
> + * Make the direct-map range starting at @page read-only and invalidate stale
> + * writable translations before returning.
> + *
> + * Return: 0 on success, or a negative error code on failure.
> + */
> +static inline int set_direct_map_ro(struct page *page, unsigned int nr)
> +{
> +	return 0;
> +}
> +#endif
> +
>  #ifdef CONFIG_X86_64
>  int set_mce_nospec(unsigned long pfn);
>  int clear_mce_nospec(unsigned long pfn);
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 54494c3fa983..742283b36d74 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -42,6 +42,7 @@
>  #include <linux/pgalloc_tag.h>
>  #include <linux/pagewalk.h>
>  #include <linux/cleanup.h>
> +#include <linux/set_memory.h>
>  
>  #include <asm/tlb.h>
>  #include "internal.h"
> @@ -291,10 +292,16 @@ static int __init huge_zero_init(void)
>  	huge_zero_folio = alloc_huge_zero_folio();
>  	if (!huge_zero_folio) {
>  		pr_warn("Allocating persistent huge zero folio failed\n");
> -	} else {
> -		huge_zero_pfn = folio_pfn(huge_zero_folio);
> -		count_vm_event(THP_ZERO_PAGE_ALLOC);
> +		return 0;
>  	}
> +
> +	huge_zero_pfn = folio_pfn(huge_zero_folio);
> +	count_vm_event(THP_ZERO_PAGE_ALLOC);
> +
> +	/* Highmem folios have no permanent direct-map mapping to protect. */
> +	if (!folio_test_highmem(huge_zero_folio))
> +		set_direct_map_ro(folio_page(huge_zero_folio, 0), HPAGE_PMD_NR);

Sorry, I don't remember if it was discussed previously, but why can't we
use the existing set_memory_ro() here?

> +
>  	return 0;
>  }
>  
> -- 
> 2.47.3
> 

-- 
Sincerely yours,
Mike.
