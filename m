Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79FB247A88B
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 15:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787844076; cv=none; b=lPneyU44MjU1re0IMFWy6MZjv3RRRJdxY1NjJqYqvOWT7lSWbe6Q5+xwmigfZvdX1alhKHqClhhhy6lMfycBVYrtug3vJEuWZWDiXFIQGAhS4+fARQgENFoC4EvEVvZocdDufX8DauSfQNc9LQ4FyvUG9Q1doeCzS0SCE//lMIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787844076; c=relaxed/simple;
	bh=vFkhu4YoIETy2KopYLS25E7PLiCY5PePdtoT9J6801Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cBnX7bd2hbIhmgmyaWRP8DmMAGet2NwPTQAQNzwI8x7AkkbVFsCHbNdrCuwxeIAJN1YY31Hd6yhi0gJ4nWyBWN7lXjHMubGG90sbSFGdlMeRdPVRwvxxO/Ah58tSVVyjyNXFUy5WW8HZYz46eahTwhvpGrwwiv8+FxsTfJnCHsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=AyxgaV25; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="AyxgaV25"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F2E3B169E
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:21:09 -0700 (PDT)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A14643F66F
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787844073; bh=vFkhu4YoIETy2KopYLS25E7PLiCY5PePdtoT9J6801Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AyxgaV25xD/ahQ+QrthrIEHKV6/gZvD8caKWTD6ip8j/lvHiSopxUE7CY6UiUjUJQ
	 C07aBl7TKVAx5SCBgn24A3pKg9unOIWjZfoxus6I+L0I50s9/uxA2AQNq1xNhOwB9s
	 pruWm1t+zw98MqtICbafAgwSwBKLiP2+OqKhAFLI=
Date: Thu, 27 Aug 2026 16:21:02 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>,
	Chris Diamand <chris.diamand@arm.com>,
	Akash Goel <akash.goel@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 06/18] drm/panthor: Drop unused vm argument passed to
 panthor_vm_prepare_sync_only_op_ctx()
Message-ID: <apBV3tCWWeOl6BTT@e142607>
References: <20260826-panthor-unplug-fixes-v4-0-982cc8f4234b@collabora.com>
 <20260826-panthor-unplug-fixes-v4-6-982cc8f4234b@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260826-panthor-unplug-fixes-v4-6-982cc8f4234b@collabora.com>

On Wed, Aug 26, 2026 at 04:56:05PM +0200, Boris Brezillon wrote:
> No need to pass a panthor_vm around if it's unused.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  drivers/gpu/drm/panthor/panthor_mmu.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index b4e41556247a..44a44602b8ba 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -1462,8 +1462,8 @@ static int panthor_vm_prepare_unmap_op_ctx(struct panthor_vm_op_ctx *op_ctx,
>  	return ret;
>  }
>  
> -static void panthor_vm_prepare_sync_only_op_ctx(struct panthor_vm_op_ctx *op_ctx,
> -						struct panthor_vm *vm)
> +static void
> +panthor_vm_prepare_sync_only_op_ctx(struct panthor_vm_op_ctx *op_ctx)
>  {
>  	memset(op_ctx, 0, sizeof(*op_ctx));
>  	op_ctx->flags = DRM_PANTHOR_VM_BIND_OP_TYPE_SYNC_ONLY;
> @@ -3031,7 +3031,7 @@ panthor_vm_bind_prepare_op_ctx(struct drm_file *file,
>  		if (!op->syncs.count)
>  			return -EINVAL;
>  
> -		panthor_vm_prepare_sync_only_op_ctx(op_ctx, vm);
> +		panthor_vm_prepare_sync_only_op_ctx(op_ctx);
>  		return 0;
>  
>  	default:
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
