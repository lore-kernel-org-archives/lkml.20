Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B17361972
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 01:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789003100; cv=pass; b=heDBbtOxeZZtdQ0ZyPaonUyS1lOk08MtVkdjvJq68jMx9srCdfMFbmRWPS6RBt3RL702sETfQB28FaaoUjkEf8uBD0YzrY34CCYcOKlzfOK/EmW6Gte8HB2WYzvjw1l+qYIqByIxM90V3tZC1euwHjcaI+w63/spnODpsSC/1uc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789003100; c=relaxed/simple;
	bh=vazWJ3e7j2iHXDsFWDbk/i+VLNr8PdjNT7Bn9fqXyIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rVo2+0XOqQNGlX8q/Pz3geTJ28o6oPGmAnN2rO4+jf2v11g4XMxnCvKLAQM0qS+49bXlF4eH2pMW1/DvXdLcJ5+GXt165clPrpLv7Gist2tM/KolpXdZpjSerjXBxFlCmhhEv6uqrWKg546vj2WEVij03F3IZ5u8mDv0cVTSyug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=iWP/fydg; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="iWP/fydg"
ARC-Seal: i=1; a=rsa-sha256; t=1789003089; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XpdOgEsHpqu+6bGsivuueqBn69BgmpM9kdBWWUFQ+GGjZoQwXOCmjRDed2cTIwSphGNcihskB5IfarT+KyNmvzQGOu4kNdVNP1o9YEVDOdEj3hri4nRaTQWDQpNZPNp3j8GsBh6NZ3XEFc5Ku6qrltUanmMNwfnibde1q92OcLQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789003089; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=swfvw6E9LPj82OdV2+5HH1jNWXs8rY8qpluiG1Z8Mfg=; 
	b=PJCaCMXpteGcpSWNWrGCFlJw2riMIjnqVZYjBxoL0gsW4DrPU9rbKfqvUHCa6T0GztH2gKFUqOd6QIbp1jiAoHMvKHS/ORhJ3qxKiTYHsuhhF+j/2RFjtfqy9BLxMK3+Gj6P4slsFjngwkbYTEULw08Bg1pp/YXmU30KvdS1TvU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789003089;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
	bh=swfvw6E9LPj82OdV2+5HH1jNWXs8rY8qpluiG1Z8Mfg=;
	b=iWP/fydgfutZeLcR2wg/qcZe78EXl4krWWv/fISM5Cm7ZCzhGrY2V5t4ZV1k9akh
	4eB7cznE4WyT0b371DJ4U8J9359hfoJkdku2i1VXFhFIpIgtz+ebMkNIjs8o1FKmBsg
	v6N3kfEiaCvtGdNQWqkXU8IqV8KkMWWxkKiQ+1eE=
Received: by mx.zohomail.com with SMTPS id 1789003088803668.7289213837038;
	Wed, 9 Sep 2026 18:18:08 -0700 (PDT)
Date: Thu, 10 Sep 2026 02:18:04 +0100
From: Adrian Larumbe <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Chris Diamand <chris.diamand@arm.com>, Akash Goel <akash.goel@arm.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 07/18] drm/panthor: Move the debugfs initialization to
 panthor_device.c
Message-ID: <aqIFMFY-jBIZZr9X@sobremesa>
References: <20260826-panthor-unplug-fixes-v4-0-982cc8f4234b@collabora.com>
 <20260826-panthor-unplug-fixes-v4-7-982cc8f4234b@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260826-panthor-unplug-fixes-v4-7-982cc8f4234b@collabora.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/288.982.46

Reviewed-by: Adrián Larumbe <adrian.larumbe@collabora.com>

On 26.08.2026 16:56, Boris Brezillon wrote:
> Those are per-device debugfs-files, so it makes sense to have the
> initialization logic in panthor_device.c.
> 
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_device.c |  9 +++++++++
>  drivers/gpu/drm/panthor/panthor_device.h |  4 ++++
>  drivers/gpu/drm/panthor/panthor_drv.c    | 10 +---------
>  3 files changed, 14 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> index 08bb4d410941..19d3669f5ec7 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -13,6 +13,7 @@
>  #include <linux/reset.h>
>  
>  #include <drm/drm_drv.h>
> +#include <drm/drm_file.h>
>  #include <drm/drm_managed.h>
>  #include <drm/drm_print.h>
>  
> @@ -661,3 +662,11 @@ int panthor_device_suspend(struct device *dev)
>  
>  	return 0;
>  }
> +
> +#ifdef CONFIG_DEBUG_FS
> +void panthor_device_debugfs_init(struct drm_minor *minor)
> +{
> +	panthor_mmu_debugfs_init(minor);
> +	panthor_gem_debugfs_init(minor);
> +}
> +#endif
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> index a7ea475fb407..e12049961912 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -421,6 +421,10 @@ int panthor_device_mmap_io(struct panthor_device *ptdev,
>  int panthor_device_resume(struct device *dev);
>  int panthor_device_suspend(struct device *dev);
>  
> +#ifdef CONFIG_DEBUG_FS
> +void panthor_device_debugfs_init(struct drm_minor *minor);
> +#endif
> +
>  static inline int panthor_device_resume_and_get(struct panthor_device *ptdev)
>  {
>  	int ret = pm_runtime_resume_and_get(ptdev->base.dev);
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index 67db6701699b..3993e1a81495 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -1764,14 +1764,6 @@ static const struct file_operations panthor_drm_driver_fops = {
>  	.fop_flags = FOP_UNSIGNED_OFFSET,
>  };
>  
> -#ifdef CONFIG_DEBUG_FS
> -static void panthor_debugfs_init(struct drm_minor *minor)
> -{
> -	panthor_mmu_debugfs_init(minor);
> -	panthor_gem_debugfs_init(minor);
> -}
> -#endif
> -
>  /*
>   * PanCSF driver version:
>   * - 1.0 - initial interface
> @@ -1807,7 +1799,7 @@ static const struct drm_driver panthor_drm_driver = {
>  	.gem_prime_import_sg_table = panthor_gem_prime_import_sg_table,
>  	.gem_prime_import = panthor_gem_prime_import,
>  #ifdef CONFIG_DEBUG_FS
> -	.debugfs_init = panthor_debugfs_init,
> +	.debugfs_init = panthor_device_debugfs_init,
>  #endif
>  };
>  
> 
> -- 
> 2.55.0

Adrian Larumbe
