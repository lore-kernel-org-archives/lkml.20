Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811085;
	b=weF0xgJR+fOPwPGxGjLosLo7KTjAmhDyKXAeupKC28O/cKeveqKjeToJB6fidPP7Sfpu
	 6vhZKVLrfqKvopdCQjqj9q4+bKJfmZd5bKADv9P2NCBjhzIAa3ZOzin+nQU2vKbZkKlMB
	 6FxqTQ2Va5T40AS45IDJp5oO4VPdfFGUYz6YZBDshwFG8kfbvjXOisepyOcJAOpUSajwN
	 Tn0uyi9Rm6RGaKo758OUGeU6sIod8UTNjO+24Nq87gxAbMZdEKqMSDscktQF9cO+E2pb5
	 3/A4wiwSqn9JC+wrMcIbkGGJaU35Lv0aIJmbL8N8HRY1/aE1qJdsP52xnlU5toQ9nbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811085;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=zbbi5EB9f5+AApk95dbtohhfxg6/jAjEiec/5/4qBRk=;
	b=bayQoG01D/1Dx5psdWXiBLQjXWtW1d0ZYm74EZcMEUIiGGj9czZTv+oGJAcmiOoqHdJV
	 DnUKO15C++oM2SEq+rT47pDOdP5Slxc2zOwcGqcGrb3mgNtQkhNu986XpA/g7U0sNn3Ln
	 x5UTNlITJri8Zof07qR7eczrtl7DmsaXd9Z7UA6Xb90WZ2913zYCZtTdozS0f+HDLvP5s
	 oOGqgMzsNgTpKylCMpGqYSa2S+cMkww2iLeHEpoRMBChKJrWmiV1uc+LhoLoDA3u3QJ2k
	 /zNbdEX8I2PlEsVFSReTElagT8oFX/b0naURZqpw6LN/q9VxkgPSLda9f2hiTqTVcvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=mzQiPlu0;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FDB3606A332
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:51:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FDB3606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=mzQiPlu0
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 91358169C;
	Wed,  4 Nov 2026 08:51:20 -0800 (PST)
Received: from [10.57.59.2] (unknown [10.57.59.2])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8B0523F632;
	Wed,  4 Nov 2026 08:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793811083; bh=n5h36dxyGLrknPLYVKXGvjTvlGJkL6Dj2TPNHZ50mQI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mzQiPlu0Y8hROYYzXRqRBujYVpprfUFCi9Yvf2gwKlw5RuA9QyU6ly9mitM28MwzY
	 h3WSp82G8DR7lhaSmBGqKEGQULh+0JumSyGFxvf0qgS/Ug6hUU61vSCbk4FS2Khmdb
	 5tYR94Xwa6evlQNAi5yy1Bcj7cgZS0n2xNhiaPNk=
Message-ID: <2b3da819-79c4-4471-baee-19abb56bb30d@arm.com>
Date: Wed, 4 Nov 2026 16:51:19 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/panfrost: Enable cycle counting when perfcnt
 is enabled
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261103-panfrost-reset-races-fixes-v2-0-454207b1d4e3@collabora.com>
 <20261103-panfrost-reset-races-fixes-v2-1-454207b1d4e3@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20261103-panfrost-reset-races-fixes-v2-1-454207b1d4e3@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/11/2026 20:36, Adrián Larumbe wrote:
> From: Boris Brezillon <boris.brezillon@collabora.com>
> 
> If we don't do that, we end up with invalid timestamps in the block
> headers.
> 
> We also need to avoid the warning on the cycle counter reference being
> other than 0 during device reset, because of perfcnt's lingering ref.
> 
> Ideally this would be dealt with by splitting the reset sequence into
> pre and post stages, so that a hypothetical panfrost_perfcnt_pre_reset()
> would release the cycle counter reference. In the absence thereof, we
> just make do.
> 
> Fixes: 7786fd108777 ("drm/panfrost: Expose performance counters through unstable ioctls")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_gpu.c     | 6 +++---
>  drivers/gpu/drm/panfrost/panfrost_perfcnt.c | 3 +++
>  2 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> index 6081b27829e1..7d66b1b50968 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> @@ -94,10 +94,10 @@ int panfrost_gpu_soft_reset(struct panfrost_device *pfdev)
>  		  GPU_IRQ_CLEAN_CACHES_COMPLETED);
>  
>  	/*
> -	 * All in-flight jobs should have released their cycle
> -	 * counter references upon reset, but let us make sure
> +	 * Even though all in-flight jobs should have released their cycle counter
> +	 * references upon reset, perfcnt's might still hang about.
>  	 */
> -	if (drm_WARN_ON(&pfdev->base, atomic_read(&pfdev->cycle_counter.use_count) != 0))
> +	if (atomic_read(&pfdev->cycle_counter.use_count) != 0)
>  		atomic_set(&pfdev->cycle_counter.use_count, 0);

There's no point in doing the read - we might as well just
unconditionally do the atomic_set().

With that fixed:

Reviewed-by: Steven Price <steven.price@arm.com>

>  
>  	return 0;
> diff --git a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
> index a9def452d5ef..b26da057a1a0 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
> @@ -17,6 +17,7 @@
>  #include "panfrost_device.h"
>  #include "panfrost_features.h"
>  #include "panfrost_gem.h"
> +#include "panfrost_gpu.h"
>  #include "panfrost_issues.h"
>  #include "panfrost_job.h"
>  #include "panfrost_mmu.h"
> @@ -52,6 +53,7 @@ static void panfrost_perfcnt_hw_disable(struct panfrost_device *pfdev)
>  	gpu_write(pfdev, GPU_PRFCNT_TILER_EN, 0);
>  
>  	if (perfcnt->owns_as_ref) {
> +		panfrost_cycle_counter_put(pfdev);
>  		panfrost_mmu_as_put(pfdev, perfcnt->mapping->mmu);
>  		perfcnt->owns_as_ref = false;
>  	}
> @@ -84,6 +86,7 @@ static int panfrost_perfcnt_hw_enable(struct panfrost_device *pfdev)
>  		return ret;
>  
>  	perfcnt->owns_as_ref = true;
> +	panfrost_cycle_counter_get(pfdev);
>  
>  	as = ret;
>  	cfg = GPU_PERFCNT_CFG_AS(as) |
> 

