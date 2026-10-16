Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 796453C553B
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792147063; cv=none; b=EdSHqS85tzsTeZm/2VR3U+CPKeFxlsYs5Ix+21ryFuOiOEeD3VjXnnIaIB7LAGXevnhfMxskrkDRCMZC6FAj1RZ5a6BK3o5TYDY0A8kL8DSqpG5BVn+R6ENyPQKt+eubRsEtNW9o53kehXpbdbYc8A4pyM9Q+LtV2kNoAfhZd6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792147063; c=relaxed/simple;
	bh=H5mKO5Y1gmWntaGySIDF8f2mRTRQxgVPKQrC/XW56zU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZpPPJh4KuCGFTdotaZNKKmKapuVHn2YQWWUaz2NB6iy0+NTGJ7NZ1fR+xdUuHc5rO4bXy4shyqcR4G15aPVSO7V9hOeFZJQ9Y3sVnfVUQlo5Lr8mHHad26nnDJ8rn72HXfTZ/GCkI/VbeUJGH9Gm7Zg5qBhy8jZ5Sop5mMRoCEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=LRYpFZ0j; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="LRYpFZ0j"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 396BC14BF
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:37:37 -0700 (PDT)
Received: from [10.2.11.34] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 453A13F871
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792147060; bh=H5mKO5Y1gmWntaGySIDF8f2mRTRQxgVPKQrC/XW56zU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LRYpFZ0jNSgUfmWOj2RoGRR3rCUFhBpShCdFblr5jHv/RuAe13aLInbCGPu5uuXSF
	 npUD8pYCtaceQ2fftqVT1Zyg0VYM69KWAsYUviAGGNuo1XO/1hLDYItxhl8JkieQGj
	 hc2FEojH2Gxb2oTttt3F8OPtWgNEkqhnDTdflWpw=
Date: Fri, 16 Oct 2026 11:37:29 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Akash Goel <akash.goel@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Chia-I Wu <olvaffe@gmail.com>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] drm/panthor: Don't invalidate OTHER caches
Message-ID: <atH-aR1wVZw8Ppke@e142607>
References: <20260924-panthor-mmu-fixes-v1-0-e25f9b106466@collabora.com>
 <20260924-panthor-mmu-fixes-v1-1-e25f9b106466@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260924-panthor-mmu-fixes-v1-1-e25f9b106466@collabora.com>

On Thu, Sep 24, 2026 at 02:30:43PM +0200, Boris Brezillon wrote:
> Don't invalidate the OTHER caches (AKA L1 read-only caches) since
> this seems to trip out the flush-elimination logic on v13, and it's not
> needed in practice (can't leak other context data because of TLB
> invalidation or corrupt physical pages returned to the system because
> it's a RO cache).
> 
> It's also worth noting that the downstream driver has been avoid
> OTHER caches invalidation from the start, and that we were doing
> the same until atomic page table update was introduced.
> 
> Fixes: 6e2d3b3e8589 ("drm/panthor: Add support for atomic page table updates")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  drivers/gpu/drm/panthor/panthor_mmu.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index 9f63a048df61..7e98084b9a1e 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -634,7 +634,7 @@ static int panthor_mmu_as_disable(struct panthor_device *ptdev, u32 as_nr,
>  
>  	/* Flush+invalidate RW caches, invalidate RO ones. */
>  	ret = panthor_gpu_flush_caches(ptdev, CACHE_CLEAN | CACHE_INV,
> -				       CACHE_CLEAN | CACHE_INV, CACHE_INV);
> +				       CACHE_CLEAN | CACHE_INV, 0);
>  	if (ret)
>  		return ret;
>  
> @@ -1841,8 +1841,7 @@ static void panthor_vm_unlock_region(struct panthor_vm *vm)
>  		 * range is narrow enough and the HW supports it.
>  		 */
>  		ret = panthor_gpu_flush_caches(ptdev, CACHE_CLEAN | CACHE_INV,
> -					       CACHE_CLEAN | CACHE_INV,
> -					       CACHE_INV);
> +					       CACHE_CLEAN | CACHE_INV, 0);
>  
>  		/* Unlock the region if the flush is effective. */
>  		if (!ret)
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
