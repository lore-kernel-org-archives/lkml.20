Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE8C2372ED5
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791974249; cv=none; b=rblD3aCTy1yNWIRu8i14c23hkQlE0T46rEDytYNV8d9Z3qjUauK9mdr4kdxm6Q7/y48GiKqyWwqE+MxgGNa9WyHXo9OeWGXYBEnxcJjzCfXe3X3dfP4GLk47ZE/yrTJHojSE939UtOJd0APCME6djhqOQ4w4SprNdQGw9UWl+gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791974249; c=relaxed/simple;
	bh=E4FuIFpG0Ldy23+HCBMivr4cxIVowgp1/4u8zL4NImQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dPeuAqJC0Prdvyya3v0JuRpgzusIqAHt7urvys5ndTmGwc3pR5HObNzHF0LGLGWGd/6o/0/b69knBVo3gMtWrofCbnEciC3QCTOP0YKueJucO7ATalm5yZkaBNB/OYY/M/wCf8DX5kL//Hd+nLo73pMi+YlMM5qL1pWoLi/EYMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=jL+bsRWe; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="jL+bsRWe"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 439911570
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:37:21 -0700 (PDT)
Received: from [10.2.11.34] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5C0733F673
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791974244; bh=E4FuIFpG0Ldy23+HCBMivr4cxIVowgp1/4u8zL4NImQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jL+bsRWexG6n/fxE29mrwScmkKdk9GIoOcHJcAA6FJ5erqEhHQmcv42mg7M+4Uexf
	 XGDYG3M/pzqJ95MKJxrqjb2M4MQIeVGCfik8Dn2Mod+TzbCmapEXmC4VAYCCwNW+rv
	 OJL/ldnX61eLaL59F6TLipwnS5fugBZUgl1CLeE0=
Date: Wed, 14 Oct 2026 11:37:20 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Akash Goel <akash.goel@arm.com>
Cc: boris.brezillon@collabora.com, steven.price@arm.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, nd@arm.com
Subject: Re: [PATCH v2 1/2] drm/panthor: Fix handling of NO_MMAP BOs
Message-ID: <as9bYAAGjs_CKOo0@e142607>
References: <20261013125433.26432-1-akash.goel@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261013125433.26432-1-akash.goel@arm.com>

On Tue, Oct 13, 2026 at 01:54:32PM +0100, Akash Goel wrote:
> The BOs created with DRM_PANTHOR_BO_NO_MMAP flag are not supposed to be
> mmappable by the Userspace. But after the rework to support shrinker,
> it became possible to mmap NO_MMAP BOs. Userspace could second guess
> the file offset range, allocated unconditionally at the BO creation
> time, and create a CPU mapping. There may not be any adverse effect of
> such a CPU mapping though.
> This commit adds a check in the mmap callback of Panthor driver to
> fail the mmap() attempts on BOs created with NO_MMAP flag. The check
> covers private BOs as well as the prime exported BOs that are mmapped
> using prime fd.
> 
> v2:
>  - Fix breakage of mmap() on exported BOs that didn't have
>    BO_MMAP_OFFSET ioctl invoked for them.
> 
> Fixes: 68cbf96b1e9b ("drm/panthor: Part ways with drm_gem_shmem_object")
> Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Akash Goel <akash.goel@arm.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  drivers/gpu/drm/panthor/panthor_gem.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
> index c07a44057e42..22b57ab6f929 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.c
> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> @@ -744,6 +744,9 @@ static int panthor_gem_mmap(struct drm_gem_object *obj, struct vm_area_struct *v
>  	struct panthor_gem_object *bo = to_panthor_bo(obj);
>  	int ret;
>  
> +	if (bo->flags & DRM_PANTHOR_BO_NO_MMAP)
> +		return -EINVAL;
> +
>  	if (drm_gem_is_imported(obj)) {
>  		/* Reset both vm_ops and vm_private_data, so we don't end up with
>  		 * vm_ops pointing to our implementation if the dma-buf backend
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
