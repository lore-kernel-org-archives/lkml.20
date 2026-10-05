Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 556B746AA8D
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 10:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791196086; cv=none; b=UUMT7LD3IYv5+yFDcRY6ImTwY1u+a/cfMyoGqB2Bc4qNS5/JPi1a77bWex7bSOGr5LjBNRmldDyzsqkq6ObFAXBaj6waeOzHx85Pvn/VTQLC4A1apKzPFO6Zw7dogxB0IR2jR3LBEtW6Cki8F7nOPFtTls4K/HMft+KN8nWebZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791196086; c=relaxed/simple;
	bh=/9iUHi9Bi1jgQjVEf08XKO/MeZy1Rn9ANGY0DGevM1M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SHWjaVA0/zJWnbZPCvvEPhE5/38T/81nQCY/TurV8IlfrQM1NNgKx3G/oEGs9m7SCZlfzIJxQamyfiW/1O/5ZrBUBmNzAlA/FAUZiVY3un3xNU/Bw0lEikgZulpLfUebw1GuUugG1qtod/jBDE0FruFG1hntfuMroS4W50Twe9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=E9qUpCYf; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="E9qUpCYf"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AB38A152B;
	Mon,  5 Oct 2026 03:27:58 -0700 (PDT)
Received: from [10.57.78.53] (unknown [10.57.78.53])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C78043F763;
	Mon,  5 Oct 2026 03:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791196082; bh=/9iUHi9Bi1jgQjVEf08XKO/MeZy1Rn9ANGY0DGevM1M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=E9qUpCYfFm9WbXY341x/lNERiXeQp/UmmthYuulPGrwNI1Rx3ejKWn6cMsFrPZwjR
	 mMyYOgyrBOavr26arcsL/utYXv1/CQL7IA6L0UH8FIaQWsBxTERvnxKsP7ZkOUcUJ+
	 KLdQg/lOgE1Dixz2mpwq233maYrzM+6aY2TlHio8=
Message-ID: <17c2fbf8-295c-4bca-a488-f101dcadd8ca@arm.com>
Date: Mon, 5 Oct 2026 11:27:57 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] drm/panthor: Avoid false positives in
 iova_mapped_as_huge_page()
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 Akash Goel <akash.goel@arm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260924-panthor-fix-partial-unmap-v2-0-59a68a1f9e14@collabora.com>
 <20260924-panthor-fix-partial-unmap-v2-1-59a68a1f9e14@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20260924-panthor-fix-partial-unmap-v2-1-59a68a1f9e14@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/09/2026 12:04, Boris Brezillon wrote:
> The check on the folio size is actually moot if the BO offset matching
> the VA we're checking huge-mapping for is not 2M aligned as well.
> This means that we are sometimes returning true when we shouldn't, which
> forces an extra unmap+map to deal with block-mapping splits. It's not
> a functional bug per-se, because the unmap+map sequence will restore
> things in the state we expect them to be, but it's better to properly
> optimize those cases.
> 
> Note that we now align the VA on 2M address below it otherwise we can't
> check the bo_offset alignment (both physical and virtual address need
> to be aligned, in addition to the physically contiguous size being 2M,
> which the folio size check ensures).
> 
> These changes force us to pass the drm_gpuva that's being unmapped
> instead of the new mappings that will be created to cover the left/right
> sections we remap. This changes makes the logic a lot easier to reason
> about, because it doesn't make sense to how things were mapped by
> passing the new mappings that are not yet in place.
> 
> Fixes: 8e7460eac786 ("drm/panthor: Support partial unmaps of huge pages")
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> Reviewed-by: Akash Goel <akash.goel@arm.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panthor/panthor_mmu.c | 24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index 9f63a048df61..b0a7033480e6 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -2295,15 +2295,29 @@ static int panthor_gpuva_sm_step_map(struct drm_gpuva_op *op, void *priv)
>  }
>  
>  static bool
> -iova_mapped_as_huge_page(struct drm_gpuva_op_map *op, u64 addr)
> +iova_mapped_as_huge_page(struct drm_gpuva *mapping, u64 va)
>  {
> -	struct panthor_gem_object *bo = to_panthor_bo(op->gem.obj);
> +	struct panthor_gem_object *bo = to_panthor_bo(mapping->gem.obj);
> +	u64 aligned_va = ALIGN_DOWN(va, SZ_2M);
>  	const struct page *pg;
>  	pgoff_t bo_offset;
>  
> -	bo_offset = addr - op->va.addr + op->gem.offset;
> +	/* If the 2M-aligned VA is outside the mapping being tested, we know
> +	 * it's not a huge map.
> +	 */
> +	if (aligned_va < mapping->va.addr)
> +		return false;
> +
> +	bo_offset = aligned_va - mapping->va.addr + mapping->gem.offset;
>  	pg = bo->backing.pages[bo_offset >> PAGE_SHIFT];
>  
> +	/* In case of shmem backing, we know we can only have a huge mapping
> +	 * if the bo_offset is 2M aligned, meaning we can skip the folio size
> +	 * check if it's not the case.
> +	 */
> +	if (!IS_ALIGNED(bo_offset, SZ_2M))
> +		return false;
> +
>  	return folio_size(page_folio(pg)) >= SZ_2M;
>  }
>  
> @@ -2328,7 +2342,7 @@ unmap_hugepage_align(const struct drm_gpuva_op_remap *op,
>  	 */
>  	if (op->prev && aligned_unmap_start < *unmap_start &&
>  	    op->prev->va.addr <= aligned_unmap_start &&
> -	    (is_sparse || iova_mapped_as_huge_page(op->prev, *unmap_start))) {
> +	    (is_sparse || iova_mapped_as_huge_page(op->unmap->va, *unmap_start))) {
>  		*unmap_range += *unmap_start - aligned_unmap_start;
>  		*unmap_start = aligned_unmap_start;
>  	}
> @@ -2338,7 +2352,7 @@ unmap_hugepage_align(const struct drm_gpuva_op_remap *op,
>  	 */
>  	if (op->next && aligned_unmap_end > unmap_end &&
>  	    op->next->va.addr + op->next->va.range >= aligned_unmap_end &&
> -	    (is_sparse || iova_mapped_as_huge_page(op->next, unmap_end - 1))) {
> +	    (is_sparse || iova_mapped_as_huge_page(op->unmap->va, unmap_end - 1))) {
>  		*unmap_range += aligned_unmap_end - unmap_end;
>  	}
>  }
> 

