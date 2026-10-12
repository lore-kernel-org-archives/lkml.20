Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AE86417D99
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791804562; cv=none; b=FyG0C5gGuwDe/CCWF7Bb3Q2EI4H8SjvAFP/zooOaOO9/WB312PwqJ1jKVZXAwv/wyn3b5huV4Rmqk6UUeAoYjM4GpBzShl1bI0cR68H9aVLIGYUOeVxSRgCKxfRc6HSR9UUqoqEghCSD9LZEoyq2HSX8dowwwG2i3kT8Yoqr6OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791804562; c=relaxed/simple;
	bh=8gHMNFXU5ZfAf5WRCsgcrgApTYYHBogVGayJxjoixHw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AjBdw34K7b5MXHvitzFZXP+3rnhBdXhdDJ7Cs1lT5uCxk/inrDNK934KenV6vVCnw+skMlm70Uq1VP1i6tVkbWB/wvdbO2hmdJXwKknZuZQ+E5LkHzx/ICo+cfv6ebznRj+ngnqqWlk/ZSQadBkSi0DrgKjvgHMx7fn2eYNtvMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=gCqP3YCV; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="gCqP3YCV"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9986E1655;
	Mon, 12 Oct 2026 04:29:17 -0700 (PDT)
Received: from [10.57.78.107] (unknown [10.57.78.107])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EA3E53F882;
	Mon, 12 Oct 2026 04:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791804560; bh=8gHMNFXU5ZfAf5WRCsgcrgApTYYHBogVGayJxjoixHw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gCqP3YCVW+pjWZ3XD5u3ZEeujHuaxP98nmSy8SVxX7jCXFc6jUSx4szgvegxmSfxC
	 tyzHLxQt8pm2bIxIOF9Qi8xQerR11Hw1SS4rmwGerGlTwwoobhtzuzS0dXOTyMB001
	 8jIzPArlZR0sB1VYvBgmeCRU+IokxRiWHPYzwQ4w=
Message-ID: <100ff535-2361-4717-b302-b4a662f19fa3@arm.com>
Date: Mon, 12 Oct 2026 12:29:12 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 09/15] drm/panfrost: Warn of RPM get failure at device
 remove time
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 "Marty E. Plummer" <hanetzer@startmail.com>,
 Tomeu Vizoso <tomeu@tomeuvizoso.net>, Eric Anholt <eric@anholt.net>,
 Robin Murphy <robin.murphy@arm.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Collabora Kernel Team <kernel@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20261009-claude-fixes-v14-0-cb743b3b973b@collabora.com>
 <20261009-claude-fixes-v14-9-cb743b3b973b@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20261009-claude-fixes-v14-9-cb743b3b973b@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/10/2026 13:33, Adrián Larumbe wrote:
> Rather than just failing silently, let's warn the user of device removal
> not being able to take a PM reference, because it should be seen as fatal.
> 
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_device.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
> index a6deabb39fd2..687230225743 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
> @@ -9,6 +9,7 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/regulator/consumer.h>
>  #include <drm/drm_drv.h>
> +#include <drm/drm_print.h>
>  
>  #include "panfrost_device.h"
>  #include "panfrost_devfreq.h"
> @@ -385,7 +386,7 @@ int panfrost_device_init(struct panfrost_device *pfdev)
>  
>  void panfrost_device_fini(struct panfrost_device *pfdev)
>  {
> -	pm_runtime_get_sync(pfdev->base.dev);
> +	drm_WARN_ON(&pfdev->base, pm_runtime_get_sync(pfdev->base.dev) < 0);
>  
>  	pm_runtime_dont_use_autosuspend(pfdev->base.dev);
>  	pm_runtime_disable(pfdev->base.dev);
> 

