Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E123DB626
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 23:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790895898; cv=pass; b=bCudaDw7BhKFcWI+RzkJKYhXewE/nqQcGdj+vPKwnyB47KR2XQwUsXqFhJQ8Ruy9t+B6cyHG3BFIzu8U05Hl5YTddDd52tzqzJbNRHTVo9fwl/eR0SwYnYK2QPs6NvBU+NKdgi5BvcggCXUO1+zKUIPGE4sWVOK/6cck+3IbgZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790895898; c=relaxed/simple;
	bh=eCOH1DRZMSp0Nm598yihG40zlThk1oohJCTH8RqEeXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=koMzjZkEXQkO4CtiOCz9pyOytmrQO6dHocqN3t5933zHnbWieBt7ctrbrkUPK4tOY1q1Y4iBl666Pykgx+jRWy9pgh08L4tz4xU6QzkGJJJM+2p7uecmjsLqu4GPAt27cmyixSxqlrNmVYsH5SI2cPZAF1GGd6LvVhkX5jcRrO0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=REtXegLk; arc=pass smtp.client-ip=165.173.180.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="REtXegLk"
ARC-Seal: i=1; a=rsa-sha256; t=1790895877; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PVf2HLg1ppzco9HFPeEnSynuX6vITILzv5oVICwgUWbGsXpG/F32UaWI0RpTXj+8NO5uPkVwnlg1mhfCLnO0HCH89RrOe5jSoB/A1tAn0I8SVKCSNnAe/ThlD+gfnpPJxsYD73TS4iYSHRRm0yCuwPn/zBBvE91+grQm1YiKoVU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790895877; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=HRUyA3XyJE0O4NHAgKtiDP1tEt4UADTu8/iaFt8ts3k=; 
	b=eiX+/AQOINsavu5qxGLxUd0nCbB8NO6qEbFy2kpuM6Asb1iNRHMp9omtUa+OVAYiyARgOvzOFQxXUOzBB9lVNdvAbrYuPx/3Mv/MFuXLOwBcZ+/1qy0Z1NqAO6+VTF6yiqkq2eITVSd2ZscepnTkqPPkPV5HvHV8wPn5K3xfnwU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790895877;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=HRUyA3XyJE0O4NHAgKtiDP1tEt4UADTu8/iaFt8ts3k=;
	b=REtXegLk1ztHpgc4kgN/RkcNm1tbzfmZ/Xmt3tZEo7Dc7+5zPIrDi5zQOU8YlQOm
	pIuTfP1SLWdXqOhldIkr9ctoa9ZyvAfDLHA3FhLr9ym3PDzfYPVUK4hoJksg58n3yeQ
	QOuyHv8y5QGpoGQRo/WTR5lhhTCTRvUtaFkH22PA=
Received: by smtp.zohomail.com with SMTPS id 1790895876377138.7805676014408;
	Thu, 1 Oct 2026 16:04:36 -0700 (PDT)
Date: Fri, 2 Oct 2026 00:04:32 +0100
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Akash Goel <akash.goel@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] drm/panthor: Actually check huge-page mapping on
 sparse regions
Message-ID: <ar7m8n18RJqU0p59@sobremesa>
References: <20260924-panthor-fix-partial-unmap-v2-0-59a68a1f9e14@collabora.com>
 <20260924-panthor-fix-partial-unmap-v2-4-59a68a1f9e14@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260924-panthor-fix-partial-unmap-v2-4-59a68a1f9e14@collabora.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/290.887.26

On 24.09.2026 13:04, Boris Brezillon wrote:
> With the recent changes to iova_mapped_as_huge_page(), the check for
> huge-page mapping of sparse BOs is actually simple:
> 
> - for a sparse mapping, we know the BO offset any VA in this regions is
>   va & (SZ_2M - 1)
> - the VA we're searching the BO offset for is the 2M-aligned
>   aligned_va value
> 
> This guarantees that the BO offset to check is always zero in that case.
> 
> This is simple enough to let the code check if page 0 is a huge page
> and save the unmap+map dance when the dummy BO is not backed by a
> a huge page. So let's do that and kill the comment that says it's too
> complicated.

I've been thinking about the kind of IGT test I could write to validate this series. Other than maybe
expanding igt_panthor_vm_bind_sparse() so that it can take an offset argument, I cannot think of anything
else, because whether the dummy BO's backing pages form a THP or unmapping a subset of a sparse VA causes
unmap boundaries to be expanded is transparent to UM.

Maybe adding a specific module param that the IGT test would trigger to show debug information relevant
to the above? But it seems a bit of an overkill to me.

> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> Reviewed-by: Akash Goel <akash.goel@arm.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_mmu.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index d2897099763e..01564d250adf 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -2337,18 +2337,18 @@ iova_mapped_as_huge_page(struct drm_gpuva *mapping, u64 va)
>  
>  		return false;
>  	} else {
> -		const struct page *pg = bo->backing.pages[bo_offset >> PAGE_SHIFT];
>  		struct panthor_vma *vma = container_of(mapping, struct panthor_vma, base);
>  		bool is_sparse = vma->flags & DRM_PANTHOR_VM_BIND_OP_MAP_SPARSE;
> +		const struct page *pg;
>  
> -		/* If the unmapped VMA stands for a sparse mapping, always
> -		 * assume the backing storage is a THP, since the overhead of
> -		 * unmapping 2MiB worth of 4KiB pages and remapping some of
> -		 * them is offset by the logic of working out whether it's
> -		 * the opposite case right below.
> +		/* BO offset on a sparse mapping is chosen so that 2M-aligned
> +		 * VAs point to the start of the BO. Since aligned_va (the
> +		 * address we check huge-page against) is 2M-aligned, the BO
> +		 * offset is guaranteed to be zero.
> +		 * Check panthor_fix_sparse_map_offset() for more details.
>  		 */
>  		if (is_sparse)
> -			return true;
> +			bo_offset = 0;
>  
>  		/* In case of shmem backing, we know we can only have a huge
>  		 * mapping if the bo_offset is 2M aligned, meaning we can skip
> @@ -2357,6 +2357,7 @@ iova_mapped_as_huge_page(struct drm_gpuva *mapping, u64 va)
>  		if (!IS_ALIGNED(bo_offset, SZ_2M))
>  			return false;
>  
> +		pg = bo->backing.pages[bo_offset >> PAGE_SHIFT];
>  		return folio_size(page_folio(pg)) >= SZ_2M;
>  	}
>  }
> 
> -- 
> 2.55.0


Adrian Larumbe
