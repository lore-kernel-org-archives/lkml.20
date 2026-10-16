Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3BC419B3CB
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792147297; cv=none; b=eAL/KsPNJNgh0OnrRSvmwltvKafeJaagm1w8Yt1bqs2lbOJMojBuuiDcoDmpDtW5f3c6FXSU0NlgaNPlV7DUUzElIpUkTJao3MHMXtYJlN+v3zjrRjalgvZY+tWromuhDxUjXzyncIBEXf+IdGZzJbfru5iIN0RIChlS/SWHGYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792147297; c=relaxed/simple;
	bh=ZXdlfSSPCJTMIh+glpoDkaZxKHJM2I43BiERY+VLHGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xi/eL7tMs/DLnx4OMjd73fxHUjNlfee0O+oDcmroCm3WSB5lskCdhrEmTuCNGGQCdz2JlgNzmsATJ/mZkW9r2drDmhqmLIBr5NBWQVIfgv1r+h6r389rmpBtFBzt99rpbx7hHGCIqAMR49UvXmnyNBSuEQd3p/m8XMzwJ0/cH9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=n9OENrt5; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="n9OENrt5"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 033B71516
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:41:32 -0700 (PDT)
Received: from [10.2.11.34] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 03F4C3F871
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792147295; bh=ZXdlfSSPCJTMIh+glpoDkaZxKHJM2I43BiERY+VLHGY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n9OENrt5XLCq8szpnpDjD5KdqGU8cwl88w23cDGDVDBHyx9zb5AaYyICkgfx/5IXo
	 Dt6mWlHTwbfwtC3v3ry8JTbotkYkg0cqrMx7ixWLgU+SumCTXcB+g0Ak7Dikm8noXy
	 BSsdQGy+Uv6as8N9hU6mMKeVGNep7yCbKIfm1nTU=
Date: Fri, 16 Oct 2026 11:41:23 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Akash Goel <akash.goel@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Chia-I Wu <olvaffe@gmail.com>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] drm/panthor: Move cache-flush after UPDATE(UNMAPPED)
Message-ID: <atH_UwhLuO5len3n@e142607>
References: <20260924-panthor-mmu-fixes-v1-0-e25f9b106466@collabora.com>
 <20260924-panthor-mmu-fixes-v1-3-e25f9b106466@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260924-panthor-mmu-fixes-v1-3-e25f9b106466@collabora.com>

On Thu, Sep 24, 2026 at 02:30:45PM +0200, Boris Brezillon wrote:
> Right now, there's a theoretical window during which the GPU can populate
> the cache with data from a VM that's about to be evicted through the
> UPDATE(UNMAPPED) command.
> In practice this won't happen (hence the absence of Fixes tag) because
> when panthor_mmu_as_disable() is called, the VM is guaranteed to be idle
> (no active CSG pointing to this VM), but as we say, better safe than
> sorry.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  drivers/gpu/drm/panthor/panthor_mmu.c | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index 038a092fd08c..bb71274aa36b 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -631,12 +631,6 @@ static int panthor_mmu_as_disable(struct panthor_device *ptdev, u32 as_nr)
>  	panthor_mmu_irq_disable_events(&ptdev->mmu->irq,
>  				       panthor_mmu_as_fault_mask(ptdev, as_nr));
>  
> -	/* Flush+invalidate RW caches, invalidate RO ones. */
> -	ret = panthor_gpu_flush_caches(ptdev, CACHE_CLEAN | CACHE_INV,
> -				       CACHE_CLEAN | CACHE_INV, 0);
> -	if (ret)
> -		return ret;
> -
>  	if (vm && vm->locked_region.size) {
>  		/* Unlock the region if there's a lock pending. */
>  		ret = as_send_cmd_and_wait(ptdev, vm->as.id, AS_COMMAND_UNLOCK);
> @@ -648,7 +642,18 @@ static int panthor_mmu_as_disable(struct panthor_device *ptdev, u32 as_nr)
>  	gpu_write64(mmu->iomem, AS_MEMATTR(as_nr), 0);
>  	gpu_write64(mmu->iomem, AS_TRANSCFG(as_nr), AS_TRANSCFG_ADRMODE_UNMAPPED);
>  
> -	return as_send_cmd_and_wait(ptdev, as_nr, AS_COMMAND_UPDATE);
> +	ret = as_send_cmd_and_wait(ptdev, as_nr, AS_COMMAND_UPDATE);
> +	if (ret)
> +		return ret;
> +
> +	/* Flush+invalidate RW caches after we've unmapped, to make sure any
> +	 * cacheline eviction is effective before we potentially return
> +	 * memory pointed by this VM to the system. This needs to be done
> +	 * after the UPDATE(UNMAPPED) operation to guarantee that not further
> +	 * PT-walk can pull VM data into the cache.
> +	 */
> +	return panthor_gpu_flush_caches(ptdev, CACHE_CLEAN | CACHE_INV,
> +					CACHE_CLEAN | CACHE_INV, 0);
>  }
>  
>  static u32 panthor_mmu_fault_mask(struct panthor_device *ptdev, u32 value)
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
