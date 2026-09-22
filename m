Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D258B43DEA9
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 16:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790095190; cv=none; b=C4Pf3NsTowP3q/0HnHkUSASb8aDDa/W8f+bn149rS9qUFlNyaU/78hd56ZqjS4d0cTqhtW+Q3rsrayBEUl8dVcAgd3sLpA1hEAOq7jBpOM8tvFOFQRhquqYywi5xQ4erz8PHAzIhGYi6zo981l6K/I7CeFSrKPcUYomvWmGEOuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790095190; c=relaxed/simple;
	bh=yIc20XTKjSYtSYQlthv6zKQMH2Zh6PUdQGaXjgVvTIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jz8kZLS2sxGT/lB90yIVGaaoAeCgO8JGRyuWryvzvvjVnMKoDxoLdGPOvO8dfiE/0uQE/mzx4MNBk80Qb6xs/qzkwsZ08TkVzKZh+aHgqcnfM+wOWv4o1Pp65HeVzHEbS/FYjAttIovmaLkSTIOkFGxB+LUC9p9p4FPKKyRjnAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=FHgxv7EY; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="FHgxv7EY"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 604511576
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:39:43 -0700 (PDT)
Received: from [10.2.11.34] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AF3683F632
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790095186; bh=yIc20XTKjSYtSYQlthv6zKQMH2Zh6PUdQGaXjgVvTIA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FHgxv7EYJN4QH1QY1so4N83yh3+sfunEfTXDDb0VbdJZyPWTzrKuz2wNmrtigiFiT
	 00kcnzo0nDzUL6GViwECnB3jFODtfJc0hz2W/KhcnijNpWVjQA39BCfMp9iahIywxd
	 /YFDrxvTRN6KdmpWg7LYGr6qNxzFQF//7N1f7eNc=
Date: Tue, 22 Sep 2026 17:39:36 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>,
	=?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
	Akash Goel <akash.goel@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] drm/panthor: Fix iova_mapped_as_huge_page() for
 imported BOs
Message-ID: <arKvSFVr19yW5469@e142607>
References: <20260917-panthor-fix-partial-unmap-v1-0-c7008f15fea3@collabora.com>
 <20260917-panthor-fix-partial-unmap-v1-2-c7008f15fea3@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260917-panthor-fix-partial-unmap-v1-2-c7008f15fea3@collabora.com>

On Thu, Sep 17, 2026 at 02:33:44PM +0200, Boris Brezillon wrote:
> Imported BOs have no backing.pages array allocated, leading to a NULL
> deref when iova_mapped_as_huge_page() gets called on them.
> 
> Implement this check through and sgt walk to reach the position of the
> sgt targeted by a VA, and check that the DMA address is properly aligned
> and the size remaining in the SG entry is bigger than a huge page.
> This is basically matching the logic in vm_map_pages(), with get_pgsize()
> being replaced by a simpler test, because we don't care about the pgcount
> info.
> 
> Reported-by: Akash Goel <akash.goel@arm.com>
> Fixes: 8e7460eac786 ("drm/panthor: Support partial unmaps of huge pages")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  drivers/gpu/drm/panthor/panthor_mmu.c | 44 ++++++++++++++++++++++++++++-------
>  1 file changed, 36 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index b0a7033480e6..6cef954e2cba 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -2299,7 +2299,6 @@ iova_mapped_as_huge_page(struct drm_gpuva *mapping, u64 va)
>  {
>  	struct panthor_gem_object *bo = to_panthor_bo(mapping->gem.obj);
>  	u64 aligned_va = ALIGN_DOWN(va, SZ_2M);
> -	const struct page *pg;
>  	pgoff_t bo_offset;
>  
>  	/* If the 2M-aligned VA is outside the mapping being tested, we know
> @@ -2309,16 +2308,45 @@ iova_mapped_as_huge_page(struct drm_gpuva *mapping, u64 va)
>  		return false;
>  
>  	bo_offset = aligned_va - mapping->va.addr + mapping->gem.offset;
> -	pg = bo->backing.pages[bo_offset >> PAGE_SHIFT];
>  
> -	/* In case of shmem backing, we know we can only have a huge mapping
> -	 * if the bo_offset is 2M aligned, meaning we can skip the folio size
> -	 * check if it's not the case.
> -	 */
> -	if (!IS_ALIGNED(bo_offset, SZ_2M))
> +	if (drm_gem_is_imported(&bo->base)) {
> +		struct sg_table *sgt = bo->dmap.sgt;
> +		struct scatterlist *sgl;
> +		unsigned int count;
> +
> +		/* If this is an imported BO, we have to walk the SGT and
> +		 * check the dma address/size alignment to determine if it's
> +		 * a huge map or not.
> +		 */
> +		for_each_sgtable_dma_sg(sgt, sgl, count) {
> +			size_t len = sg_dma_len(sgl);
> +			dma_addr_t daddr;
> +
> +			if (len <= bo_offset) {
> +				bo_offset -= len;
> +				continue;
> +			}
> +
> +			len -= bo_offset;
> +			daddr = sg_dma_address(sgl) + bo_offset;
> +
> +			return IS_ALIGNED(daddr, SZ_2M) &&
> +			       len >= SZ_2M;
> +		}
> +
>  		return false;
> +	} else {
> +		const struct page *pg = bo->backing.pages[bo_offset >> PAGE_SHIFT];
>  
> -	return folio_size(page_folio(pg)) >= SZ_2M;
> +		/* In case of shmem backing, we know we can only have a huge mapping
> +		 * if the bo_offset is 2M aligned, meaning we can skip the folio size
> +		 * check if it's not the case.
> +		 */
> +		if (!IS_ALIGNED(bo_offset, SZ_2M))
> +			return false;
> +
> +		return folio_size(page_folio(pg)) >= SZ_2M;
> +	}
>  }
>  
>  static void
> 
> -- 
> 2.55.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
