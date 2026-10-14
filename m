Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B8B22D0C72
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791974279; cv=none; b=mc6bG9c8ZzNNBU4VtgY7EmWPwVQwYyxzTDu2pXLRBsbV/YKAbR6KuWiqkhzq7+StcUwa7R4pUizZMx9DeL/qESdXykq2RFrDsjCucWc4AciqFaXlpDWH/LXUtXJ0A8yK/To/Z4NzrIL/UTZsXxnXWA3SMzxRxa9ms5hdn8G6Jgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791974279; c=relaxed/simple;
	bh=/MnWgXNTxPKay1llKhn8TqQ5Q2KXZDxnnN/liLDqiSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VGzROc60seCTfLWL2lYMnLxpNc1Wqq1f5H2o/OS36r6GOxBW7YOWyFw0bnTfQrCYm4c1rAJAc43x9X1x3Pk/SXgMhLs/KI2Xk+tE0L7W3iyW8BzpluTRu8VohUI/s6e3iHmkaVfmOx8uIHJJMIeNTsFXx9c1dizNFYfMdYgK3O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=tUx9lWKS; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="tUx9lWKS"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A2FA31595
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:37:54 -0700 (PDT)
Received: from [10.2.11.34] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B76AF3F673
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791974277; bh=/MnWgXNTxPKay1llKhn8TqQ5Q2KXZDxnnN/liLDqiSs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tUx9lWKSpYYeY8E5L2dA+v0rFqE8+jKubOIEz1RDUhz6BUnMXZOvA72xANhtL02dj
	 DbMgA8MvvOiQnATCx8zlFgJRbNhIS8gSB5gUYWiljyr199N6QOAB/zsDXBT069YMQ0
	 ookl/NngjFtMQ879X5UBsVZdX3A/mZj6hSFhcl4k=
Date: Wed, 14 Oct 2026 11:37:53 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Akash Goel <akash.goel@arm.com>
Cc: boris.brezillon@collabora.com, steven.price@arm.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, nd@arm.com
Subject: Re: [PATCH v2 2/2] drm/panthor: Remove redundant
 drm_gem_create_mmap_offset() call from BO_MMAP_OFFSET ioctl
Message-ID: <as9bgUPg8FJh2AR5@e142607>
References: <20261013125433.26432-1-akash.goel@arm.com>
 <20261013125433.26432-2-akash.goel@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261013125433.26432-2-akash.goel@arm.com>

On Tue, Oct 13, 2026 at 01:54:33PM +0100, Akash Goel wrote:
> This commit removes the call to drm_gem_create_mmap_offset() from
> the BO_MMAP_OFFSET ioctl handler. The call was redundant and didn't
> have any effect as file offset range is allocated unconditionally
> at the BO creation time.
> 
> v2:
> - New patch
> 
> Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Akash Goel <akash.goel@arm.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  drivers/gpu/drm/panthor/panthor_drv.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index 1ca8aedd83f4..dc8d0191aef4 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -1081,7 +1081,7 @@ static int panthor_ioctl_bo_mmap_offset(struct drm_device *ddev, void *data,
>  	struct drm_panthor_bo_mmap_offset *args = data;
>  	struct panthor_gem_object *bo;
>  	struct drm_gem_object *obj;
> -	int ret;
> +	int ret = 0;
>  
>  	if (args->pad)
>  		return -EINVAL;
> @@ -1096,10 +1096,6 @@ static int panthor_ioctl_bo_mmap_offset(struct drm_device *ddev, void *data,
>  		goto out;
>  	}
>  
> -	ret = drm_gem_create_mmap_offset(obj);
> -	if (ret)
> -		goto out;
> -
>  	args->offset = drm_vma_node_offset_addr(&obj->vma_node);
>  
>  out:
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
