Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29823556B92
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790088619; cv=none; b=E2ZTjPjSUg4ndLk2ujnqYz/fvB78naa+oiO/eGnpAqjTkGVureWcD33X/nMPhPgG0KBYLxkK9hvaow0H/OcqAW617bb3CHZvM6oj/d+EfliXo25mA3dJ6KBsgmZ61GmCJV4vXb5m15TxIENxV7YtOu2if0W6i2QFcy8YHRN1dEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790088619; c=relaxed/simple;
	bh=psyvy7+izG3d0GE/Mm0MZMY+HAxJkalnhHOIOMRhjJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r6BrTapFesbwYjmjiTnmGCIQ82X21EoLfVb8jH3BnB0LM40PJxcjR5jAYeWCmoO9ZqJA6UYgtQgbS1wRjmp4QOny6FLhMgicE+I9/EQti3bnSjXgfFyLOrH0nBWF0g4JRtJ5uIKF/9p0CHL/XL2obV7iNkWO+SnwzJel3UtvcWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=GlR5Y0a+; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="GlR5Y0a+"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1BF001576
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:50:13 -0700 (PDT)
Received: from [10.2.11.34] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 675F63F632
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790088616; bh=psyvy7+izG3d0GE/Mm0MZMY+HAxJkalnhHOIOMRhjJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GlR5Y0a+NaiUcSHHDdOadgpxzpKSyZXhcQQRtxgtRNrQajxYDwQ3yxWeKYB6gsruP
	 MZuRoAK/kusnLMYcFIVWQP/cVyMfncJXkYx6OdsbpiYwKGTIyeypM0foWmD4E6VAS3
	 5+BFtPvQQfAYW/Nyjai0Q6Fc3ATxd5m8nfw2kV6o=
Date: Tue, 22 Sep 2026 15:50:12 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Akash Goel <akash.goel@arm.com>
Cc: boris.brezillon@collabora.com, steven.price@arm.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, nd@arm.com
Subject: Re: [PATCH] drm/panthor: Fix handling of NO_MMAP BOs
Message-ID: <arKVpL1tog7KyZTZ@e142607>
References: <20260922100743.447700-1-akash.goel@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260922100743.447700-1-akash.goel@arm.com>

On Tue, Sep 22, 2026 at 11:07:43AM +0100, Akash Goel wrote:
> The BOs created with DRM_PANTHOR_BO_NO_MMAP flag are not supposed to be
> mmappable by the Userspace. But after the rework to support shrinker,
> it became possible to mmap NO_MMAP BOs. Userspace could second guess
> the file offset range, allocated unconditionally at the BO creation
> time, and create a CPU mapping. There may not be any adverse effect of
> such a CPU mapping though.
> This commit removes the unconditional allocation of file offset range
> when a user/kernel BO is created. For user BOs, allocation of file
> offset range would be done from BO_MMAP_OFFSET ioctl handler which has
> a check for NO_MMAP flag. For kernel BOs, there is no need to allocate
> file offset range.
> 
> Fixes: 68cbf96b1e9b ("drm/panthor: Part ways with drm_gem_shmem_object")
> Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Akash Goel <akash.goel@arm.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  drivers/gpu/drm/panthor/panthor_gem.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
> index c07a44057e42..5cfe66537e87 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.c
> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> @@ -1021,10 +1021,6 @@ panthor_gem_create(struct drm_device *dev, size_t size, uint32_t flags,
>  	mapping_set_gfp_mask(bo->base.filp->f_mapping,
>  			     GFP_HIGHUSER | __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
>  
> -	ret = drm_gem_create_mmap_offset(&bo->base);
> -	if (ret)
> -		goto err_put;
> -
>  	if (exclusive_vm) {
>  		bo->exclusive_vm_root_gem = panthor_vm_root_gem(exclusive_vm);
>  		drm_gem_object_get(bo->exclusive_vm_root_gem);
> -- 
> 2.25.1
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
