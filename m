Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA87047ECED
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 11:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791198267; cv=none; b=INe/2+SFhEfSYlWLYXpL7yRLt1JsM7hJjmaGruqV49OTYqw/db9ZSIR3PP34arZ0R5KkVQjo9c1cHXq9vVsk8CbB2v9Vg4lyiZ/cCcZxzGFvhYjfNNmtCWJ2snTyMQAZtwFOep0OA2fYc04sv0T6CavTQ1ODyY+sPj2Wbj7xSvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791198267; c=relaxed/simple;
	bh=e4dNFIIBwW2SBYgRBr6LP1nUNRfmiCEqpc3qgBS8R64=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f/sTDc0eV6OdVbnSD6EZwiaVK20/KKe5lTkwSqTXcRHZj8Xl5EyHHSTDTVISpKfvdUcNv6/kvlF5h4LMg2v1tdqKTSVErLYLqDeMPr/J0wC3sRulmNfFgrY471v6/RfmoErWJLfuMsWvFeTEkbAyuY7lYnPnOcjsHby+R6fSmgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=OVPLN6mm; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="OVPLN6mm"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 851D2152B;
	Mon,  5 Oct 2026 04:04:20 -0700 (PDT)
Received: from [10.57.78.53] (unknown [10.57.78.53])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EC99C3F86F;
	Mon,  5 Oct 2026 04:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791198263; bh=e4dNFIIBwW2SBYgRBr6LP1nUNRfmiCEqpc3qgBS8R64=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OVPLN6mmqOmadMBjO8ux8PZGnbIDuJNoxPQESwPIShR+iIGKy5/cxy4aCb0xloUa0
	 QP1ct2/mDKSaZtC97b1C/NorqZSMaQhPhD2+zoasrVrg1XfS9Kk3NDc+w7rxxKJcEu
	 1Em+bPodTTZIU7i1ax6RNuCVYUh6hVawXa+q8Drc=
Message-ID: <90a8627d-a5d4-4c8e-bf64-433f86cea370@arm.com>
Date: Mon, 5 Oct 2026 11:50:00 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] drm/panthor: Consolidate the is-huge-page-mapping
 test
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 Akash Goel <akash.goel@arm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260924-panthor-fix-partial-unmap-v2-0-59a68a1f9e14@collabora.com>
 <20260924-panthor-fix-partial-unmap-v2-3-59a68a1f9e14@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20260924-panthor-fix-partial-unmap-v2-3-59a68a1f9e14@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/09/2026 12:04, Boris Brezillon wrote:
> Right now the logic to determine whether a given VA in the drm_gpuva
> being unmapped is a huge page mapping or not is scattered
> in two functions: unmap_hugepage_align() and
> iova_mapped_as_huge_page(). This makes it harder to reason about the
> logic being implemented for very little gain (some simple checks being
> done twice), so let's consolidate all the checks related to huge page
> mapping testing in iova_mapped_as_huge_page() and leave
> unmap_hugepage_align() as a simple user of this helper that aligns the
> area to unmap based on the return of iova_mapped_as_huge_page().
> 
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> Reviewed-by: Akash Goel <akash.goel@arm.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panthor/panthor_mmu.c | 57 +++++++++++++++++------------------
>  1 file changed, 28 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index 6cef954e2cba..d2897099763e 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -2301,10 +2301,11 @@ iova_mapped_as_huge_page(struct drm_gpuva *mapping, u64 va)
>  	u64 aligned_va = ALIGN_DOWN(va, SZ_2M);
>  	pgoff_t bo_offset;
>  
> -	/* If the 2M-aligned VA is outside the mapping being tested, we know
> -	 * it's not a huge map.
> +	/* If the 2M section being tested is crossing the mapping boundary
> +	 * we know it's not a huge map.
>  	 */
> -	if (aligned_va < mapping->va.addr)
> +	if (aligned_va < mapping->va.addr ||
> +	    aligned_va + SZ_2M > mapping->va.addr + mapping->va.range)
>  		return false;
>  
>  	bo_offset = aligned_va - mapping->va.addr + mapping->gem.offset;
> @@ -2337,10 +2338,21 @@ iova_mapped_as_huge_page(struct drm_gpuva *mapping, u64 va)
>  		return false;
>  	} else {
>  		const struct page *pg = bo->backing.pages[bo_offset >> PAGE_SHIFT];
> +		struct panthor_vma *vma = container_of(mapping, struct panthor_vma, base);
> +		bool is_sparse = vma->flags & DRM_PANTHOR_VM_BIND_OP_MAP_SPARSE;
>  
> -		/* In case of shmem backing, we know we can only have a huge mapping
> -		 * if the bo_offset is 2M aligned, meaning we can skip the folio size
> -		 * check if it's not the case.
> +		/* If the unmapped VMA stands for a sparse mapping, always
> +		 * assume the backing storage is a THP, since the overhead of
> +		 * unmapping 2MiB worth of 4KiB pages and remapping some of
> +		 * them is offset by the logic of working out whether it's
> +		 * the opposite case right below.
> +		 */
> +		if (is_sparse)
> +			return true;
> +
> +		/* In case of shmem backing, we know we can only have a huge
> +		 * mapping if the bo_offset is 2M aligned, meaning we can skip
> +		 * the folio size check if it's not the case.
>  		 */
>  		if (!IS_ALIGNED(bo_offset, SZ_2M))
>  			return false;
> @@ -2353,36 +2365,23 @@ static void
>  unmap_hugepage_align(const struct drm_gpuva_op_remap *op,
>  		     u64 *unmap_start, u64 *unmap_range)
>  {
> -	struct panthor_vma *unmap_vma = container_of(op->unmap->va, struct panthor_vma, base);
> -	bool is_sparse = unmap_vma->flags & DRM_PANTHOR_VM_BIND_OP_MAP_SPARSE;
> -	u64 aligned_unmap_start, aligned_unmap_end, unmap_end;
> -
> -	unmap_end = *unmap_start + *unmap_range;
> -	aligned_unmap_start = ALIGN_DOWN(*unmap_start, SZ_2M);
> -	aligned_unmap_end = ALIGN(unmap_end, SZ_2M);
> +	u64 unmap_end = *unmap_start + *unmap_range;
>  
>  	/* If we're dealing with a huge page, make sure the unmap region is
> -	 * aligned on the start of the page. If the unmapped VMA stands for
> -	 * a sparse mapping, always assume the backing storage is a THP, since
> -	 * the overhead of unmapping 2MiB worth of 4KiB pages and remapping
> -	 * some of them is offset by the logic of working out whether it's
> -	 * the opposite case right below. This also holds true for op->next.
> +	 * aligned on the start of the page.
>  	 */
> -	if (op->prev && aligned_unmap_start < *unmap_start &&
> -	    op->prev->va.addr <= aligned_unmap_start &&
> -	    (is_sparse || iova_mapped_as_huge_page(op->unmap->va, *unmap_start))) {
> -		*unmap_range += *unmap_start - aligned_unmap_start;
> -		*unmap_start = aligned_unmap_start;
> -	}
> +	if (op->prev && !IS_ALIGNED(*unmap_start, SZ_2M) &&
> +	    iova_mapped_as_huge_page(op->unmap->va, *unmap_start))
> +		*unmap_start = ALIGN_DOWN(*unmap_start, SZ_2M);
>  
>  	/* If we're dealing with a huge page, make sure the unmap region is
>  	 * aligned on the end of the page.
>  	 */
> -	if (op->next && aligned_unmap_end > unmap_end &&
> -	    op->next->va.addr + op->next->va.range >= aligned_unmap_end &&
> -	    (is_sparse || iova_mapped_as_huge_page(op->unmap->va, unmap_end - 1))) {
> -		*unmap_range += aligned_unmap_end - unmap_end;
> -	}
> +	if (op->next && !IS_ALIGNED(unmap_end, SZ_2M) &&
> +	    iova_mapped_as_huge_page(op->unmap->va, unmap_end - 1))
> +		unmap_end = ALIGN(unmap_end, SZ_2M);
> +
> +	*unmap_range = unmap_end - *unmap_start;
>  }
>  
>  static int panthor_gpuva_sm_step_remap(struct drm_gpuva_op *op,
> 

