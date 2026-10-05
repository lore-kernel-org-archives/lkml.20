Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5954D09FB
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 15:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791215315; cv=none; b=Voylu60C3G0I/HDkhm58gnlNYr0ZbafutDRla5EzqZJBgiMyt3twpZYhYyqTiNshLZjVAyM2tqr9BwqMasjhuGNiUMTJ+UW/CcKFtkhlia6kRwc4OMp1qLZEAZjdWfeoc7MovdRb67jdbmCzZxEETzBVxw+S+VE1A2DHrpfIkVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791215315; c=relaxed/simple;
	bh=s9oZ2zVxhNcUAC1WPQkD6zpHTkJ3iYRAqKqgEgNsA98=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HMFiK25L8dq2f8mbp9rCFiFlJGuOMws9rPrxKU5BtJ3tPHh3Eb1xp3khLu5RfbcvQ9ycuJ7Glo5hXKDbFp2AfcItaf2RrcFgMXS/v8xmFwdSDP4b6sEpYSCXK0MsumBy9N5+RMYRcErta3jW0y+0Ik2G3B0YnfMCqYd9z9L8qr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=SyU2QJaY; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="SyU2QJaY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1791215311;
	bh=s9oZ2zVxhNcUAC1WPQkD6zpHTkJ3iYRAqKqgEgNsA98=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=SyU2QJaY5ctWOGIpsxSJ0srXy/lznwOxng9YzETQ+yGldPAjWnBj2w0+eNaAfHHDU
	 7Y5m3FCX96jsFz8n7UkoQn5coIo8D9nOcZJQReX9jdnQ510Lj8onFfNIq+RoLAkad6
	 sG1jKm2KqZq4NzuKkhtMM0kgKXHpezI5I4kNTawIytgBBLQagmjz1ZNfs/l7w9X6As
	 HKpLpOVsOR/L6xdO4YXq2UPprZ5Plc6uqvjrezMsgyE/S38s54YBdh/XwaytYtaAy+
	 4QcUhASfQpF6dShs0/WDFBM7+orrHLITkUFv7VeCBLC1jR2iX3a6fnP+1tQCa38MyU
	 RtKCPNc3Yc1GQ==
Received: from fedora-61.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 07DD817E043C;
	Mon, 05 Oct 2026 17:48:30 +0200 (CEST)
Date: Mon, 5 Oct 2026 17:48:27 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRyacOhbg==?= Larumbe
 <adrian.larumbe@collabora.com>, Akash Goel <akash.goel@arm.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] drm/panthor: Actually check huge-page mapping on
 sparse regions
Message-ID: <20261005174827.4541b816@fedora-61.home>
In-Reply-To: <5b0254d0-1be2-4dad-b6ce-368d341dd319@arm.com>
References: <20260924-panthor-fix-partial-unmap-v2-0-59a68a1f9e14@collabora.com>
	<20260924-panthor-fix-partial-unmap-v2-4-59a68a1f9e14@collabora.com>
	<678b9346-a53d-49bd-9c90-fa63e6c81169@arm.com>
	<20261005135312.43d132cf@fedora-61.home>
	<5b0254d0-1be2-4dad-b6ce-368d341dd319@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 5 Oct 2026 16:31:09 +0100
Steven Price <steven.price@arm.com> wrote:

> On 05/10/2026 12:53, Boris Brezillon wrote:
> > On Mon, 5 Oct 2026 12:03:26 +0100
> > Steven Price <steven.price@arm.com> wrote:
> >   
> >> On 24/09/2026 12:04, Boris Brezillon wrote:  
> >>> With the recent changes to iova_mapped_as_huge_page(), the check for
> >>> huge-page mapping of sparse BOs is actually simple:
> >>>
> >>> - for a sparse mapping, we know the BO offset any VA in this regions is
> >>>   va & (SZ_2M - 1)
> >>> - the VA we're searching the BO offset for is the 2M-aligned
> >>>   aligned_va value
> >>>
> >>> This guarantees that the BO offset to check is always zero in that case.
> >>>
> >>> This is simple enough to let the code check if page 0 is a huge page
> >>> and save the unmap+map dance when the dummy BO is not backed by a
> >>> a huge page. So let's do that and kill the comment that says it's too
> >>> complicated.
> >>>
> >>> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> >>> Reviewed-by: Akash Goel <akash.goel@arm.com>
> >>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>    
> >>
> >> In itself I can't see anything wrong with this change, so:
> >>
> >> Reviewed-by: Steven Price <steven.price@arm.com>
> >>
> >> However...
> >>  
> >>> ---
> >>>  drivers/gpu/drm/panthor/panthor_mmu.c | 15 ++++++++-------
> >>>  1 file changed, 8 insertions(+), 7 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> >>> index d2897099763e..01564d250adf 100644
> >>> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> >>> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> >>> @@ -2337,18 +2337,18 @@ iova_mapped_as_huge_page(struct drm_gpuva *mapping, u64 va)
> >>>  
> >>>  		return false;
> >>>  	} else {
> >>> -		const struct page *pg = bo->backing.pages[bo_offset >> PAGE_SHIFT];
> >>>  		struct panthor_vma *vma = container_of(mapping, struct panthor_vma, base);
> >>>  		bool is_sparse = vma->flags & DRM_PANTHOR_VM_BIND_OP_MAP_SPARSE;
> >>> +		const struct page *pg;
> >>>  
> >>> -		/* If the unmapped VMA stands for a sparse mapping, always
> >>> -		 * assume the backing storage is a THP, since the overhead of
> >>> -		 * unmapping 2MiB worth of 4KiB pages and remapping some of
> >>> -		 * them is offset by the logic of working out whether it's
> >>> -		 * the opposite case right below.
> >>> +		/* BO offset on a sparse mapping is chosen so that 2M-aligned
> >>> +		 * VAs point to the start of the BO. Since aligned_va (the
> >>> +		 * address we check huge-page against) is 2M-aligned, the BO
> >>> +		 * offset is guaranteed to be zero.
> >>> +		 * Check panthor_fix_sparse_map_offset() for more details.
> >>>  		 */
> >>>  		if (is_sparse)
> >>> -			return true;
> >>> +			bo_offset = 0;
> >>>  
> >>>  		/* In case of shmem backing, we know we can only have a huge
> >>>  		 * mapping if the bo_offset is 2M aligned, meaning we can skip
> >>> @@ -2357,6 +2357,7 @@ iova_mapped_as_huge_page(struct drm_gpuva *mapping, u64 va)
> >>>  		if (!IS_ALIGNED(bo_offset, SZ_2M))
> >>>  			return false;
> >>>  
> >>> +		pg = bo->backing.pages[bo_offset >> PAGE_SHIFT];
> >>>  		return folio_size(page_folio(pg)) >= SZ_2M;    
> >>
> >> ... this seems like it could be problematic. On the mapping side we use
> >> the scatter list to decide whether the region is huge page mapped or
> >> not. The scatter list code can merge segments that are contiguous (see
> >> pages_are_mergeable()), so if we have a region which has small folios we
> >> fail this check even though the pages might have been mapped as huge pages.
> >>
> >> This is a problem on the non-sparse path as well (hence not really
> >> related to this patch). I'm not really sure how to test this though - I
> >> may well have overlooked something here.  
> > 
> > So, this is based on the assumption that shmem backing is allocated
> > with the buddy allocator, and because of how this allocator splits
> > bigger order blocks to service smaller allocations, it's my
> > understanding that two consecutive folios of the same size/order can't
> > be physically contiguous.  
> 
> Yes, you'd expect the buddy allocator to combine the folios back into a
> larger one if they were contiguous. I guess we should be safe, at least
> for now. I still feel it's unnecessarily fragile and complex trying to
> work out whether we've mapped as a huge page or not. But I don't
> actually have a better solution at the moment, and this series is at
> least improving things. I'll put it on my todo list to look at later.

One way to make that consistent would be to have the same logic on the
map_pages() side, where we'd use the pages array to check for physical
contiguity in addition to the dma_addr/size-based checks we already
have. This being said, this might be moot if we consider moving to
our own PT implementation with full sub-tree updates (see how [1]
doesn't have a get_pgsize() anymore). In the meantime, I can add a
comment explaining the assumptions at play here.

[1]https://gitlab.freedesktop.org/bbrezillon/linux/-/commits/b4/panthor-part-ways-with-iopgtbl?ref_type=heads
