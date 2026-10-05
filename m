Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B90A8442373
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 10:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791196130; cv=none; b=sj74Sa2U63eL1P+3n140VHJnacfJVliGz2S+iLPBPmmOGl3Gb8GqEoVnXH59/D9RRoIT27fZ0HT7jjAgA34P72boDxI64oTxev9OXMnqT2q2c2kL60+yEbgK2EbhDu/s2ueatUAPX+oHk+YwZZHSGSOmcPwZy8zDJs91QxRXPIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791196130; c=relaxed/simple;
	bh=jqBaTdsRXXBrqPONRaqWHQAHkAN07+rGQmUfu0cXl/I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tm6ZChqMV5WN2jaR8UNBABCIi3GgUTiiIdJ6zJcbZzkCm2g4dw/IZwKcdVDhNvJj6MxlzzHPF5r9JTtrJmv7masfgB2pGWrw9c4P6jhtZBqNel8Hv8h0NEBr3E8PPZ97ICJ5LweD+1xdKLtXKPiKHwqqtzFXW2TbbQXQDb5OJ5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=qFi7xoCH; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="qFi7xoCH"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 57A44152B;
	Mon,  5 Oct 2026 03:28:44 -0700 (PDT)
Received: from [10.57.78.53] (unknown [10.57.78.53])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 767153F763;
	Mon,  5 Oct 2026 03:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791196127; bh=jqBaTdsRXXBrqPONRaqWHQAHkAN07+rGQmUfu0cXl/I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qFi7xoCHQRHnbCuXP9wgcNVxKA8nC35QY5AXahLKLLe6yf/Lk35029x7mFE2Fr5+f
	 QD3qOSLB/ZyDmjhVpNURfbStumsTFbPfsPUG3OjO+a+ZL9oGxZYALkvjiJGVu/kO2t
	 ECo/c/mFZnN78XPx6k0b5h3ZjXgmDExo2NfxJnGk=
Message-ID: <043e60c3-bf24-479b-9b87-1a6682a7f576@arm.com>
Date: Mon, 5 Oct 2026 11:28:43 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] drm/panthor: Fix iova_mapped_as_huge_page() for
 imported BOs
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 Akash Goel <akash.goel@arm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260924-panthor-fix-partial-unmap-v2-0-59a68a1f9e14@collabora.com>
 <20260924-panthor-fix-partial-unmap-v2-2-59a68a1f9e14@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20260924-panthor-fix-partial-unmap-v2-2-59a68a1f9e14@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/09/2026 12:04, Boris Brezillon wrote:
> Imported BOs have no backing.pages array allocated, leading to a NULL
> deref when iova_mapped_as_huge_page() gets called on them.
> 
> Implement this check through and sgt walk to reach the position of the
NIT:                           ^^^
s/and/an/

> sgt targeted by a VA, and check that the DMA address is properly aligned
> and the size remaining in the SG entry is bigger than a huge page.
> This is basically matching the logic in vm_map_pages(), with get_pgsize()
> being replaced by a simpler test, because we don't care about the pgcount
> info.
> 
> Reported-by: Akash Goel <akash.goel@arm.com>
> Fixes: 8e7460eac786 ("drm/panthor: Support partial unmaps of huge pages")
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> Reviewed-by: Akash Goel <akash.goel@arm.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Steven Price <stevne.price@arm.com>

Although there's a minor style issue below if you do respin (see below).

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

This 'else' branch isn't needed - since the above branch returns early.
Dropping the below back out of the braces would make the diff easier to
read - effectively the drm_gem_is_imported() branch is just added and
the rest of the code is left as is.

Thanks,
Steve

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

