Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793204799;
	b=gOi5vhwOGv+jh8CPGjViTsji2AT6mgeoeavR8g1vorgPeMt1zG4Onhnzc724ttVBVjgS
	 vbKNxGyAxULZdptaunkh3hiAu2VwBhKZE/ewGlXVg21Ju5mTooapW41sr19EVtJjeWtn1
	 zO7AEdZlXlr1xzo2T7ARS8NMt5CrRM7dyP0YJgQ+pekESw18+9DXm0HDvK9fwlwhW8BbH
	 Zle4pSOjFUY/wz1KSg7DA2LxGVqV5Lo9Vn/Soz0oirvC49DudUYe7abSDum4Y8TXKuweL
	 FKfxV+yPaVLHb0twQgkhRefldtXpbmSdO4vRIaKMpkJCZAbafQfUsvU1keqtc1CCcmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793204799;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=NXzKuhwm4cRDFux95gmBv0bT4qNdveBcrf7yJCzkiUI=;
	b=BpXPXa1dMdWdipte/zRgRHc4dXeAISeCkw74sKSWSZ/EVxHiDSzh+SX8TMbvM3gzZbGq
	 xC1Fs1fkI8XMkXzAVY98hpapNar2t8b2UnfwMUobBQNqCylxjW6vsiZOajsr3D5W+7bcz
	 fZ6DzV9lIf3LtfWQo9R7gTceaAXDzPJPwesPjCT9ulyiLWpPDY+eHuc9pivLo8PBoCr9I
	 HqVh0N783zJ6n8LJYenRqjVRMFrgLTWiaaNK0rPr2Y1VOQuF+KbI1mdyQ8loHbnvMD8bQ
	 J33jHhF4NkOboq4MLyh7ZLMREdUU2RKbBWbSLefD8LDxfTSEQpa+FoAN3YDwnYp2izg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=sQbPTln9;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 123AB606A321
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:26:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 123AB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=sQbPTln9
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2C17C175D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:26:35 -0700 (PDT)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1D6B63F59E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793204798; bh=PExIaZTAjhGQMicvNikfB9CMe3bBt0uH+ireCrymzdQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sQbPTln9MA/E0H8wMCl4lr3aiyrhl5PX6r+xZFEVEXGun9L4kOX4MTMC2+EzlyieT
	 QBYgrHOyyTEdSmtGeCKfVjEcCUtKxOcdBXmDoTiTI7n2AsQGuqogRWjPb6hK03loMh
	 0/QNRbi11EZrwlfvOtlDud6+Tt+9dlrvienarvug=
Date: Wed, 28 Oct 2026 16:26:33 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Karunika Choo <karunika.choo@arm.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>, linux-kernel@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v1 09/27] drm/panthor: Skip devfreq when no OPP table is
 present
Message-ID: <auIiOVi13v0U8fIp@e142607>
References: <20260922204535.2850094-1-karunika.choo@arm.com>
 <20260922204535.2850094-10-karunika.choo@arm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260922204535.2850094-10-karunika.choo@arm.com>

On Tue, Sep 22, 2026 at 09:45:03PM +0100, Karunika Choo wrote:
> On Mali v15 AM systems, frequency scaling is handled outside panthor by
> the AM_GOVERNOR block, so the GPU DT node may not provide an OPP table.
> 
> Make panthor_devfreq_init() return early when dev_pm_opp_get_opp_table()
> returns -ENODEV, and guard the devfreq helper paths against a missing
> devfreq instance. Also make it so that frequency can be queried even if
> the devfreq instance is missing.
> 
> This keeps devfreq enabled for existing platforms while allowing v15 AM
> systems to probe without a local devfreq setup.
> 
> Signed-off-by: Karunika Choo <karunika.choo@arm.com>
> ---
> v1:
> - Only skip panthor_devfreq init when OPP lookup returns -ENODEV instead
>   of direct DT-property check.
> - Support frequency query without devfreq.
> 
>  drivers/gpu/drm/panthor/panthor_devfreq.c | 31 ++++++++++++++++++-----
>  drivers/gpu/drm/panthor/panthor_hw.h      |  6 +++++
>  2 files changed, 30 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/panthor/panthor_devfreq.c
> index 2249b41ca4afe..18c1a7e56ca08 100644
> --- a/drivers/gpu/drm/panthor/panthor_devfreq.c
> +++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
> @@ -12,6 +12,7 @@
>  
>  #include "panthor_devfreq.h"
>  #include "panthor_device.h"
> +#include "panthor_hw.h"
>  
>  /**
>   * struct panthor_devfreq - Device frequency management
> @@ -164,6 +165,19 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
>  	 */
>  	table = dev_pm_opp_get_opp_table(dev);
>  	if (IS_ERR_OR_NULL(table)) {
> +		/*
> +		 * On v15 GPUs, frequency scaling is handled outside of panthor
> +		 * by the AM_GOVERNOR block, so the GPU DT node may not provide
> +		 * an OPP table. In such cases, do not initialize devfreq for
> +		 * panthor.
> +		 */
> +		if (panthor_hw_is_gen5_am(ptdev->base.dev) &&
> +		    PTR_ERR(table) == -ENODEV) {
> +			drmm_kfree(&ptdev->base, pdevfreq);
> +			ptdev->devfreq = NULL;
> +			return 0;
> +		}
> +
>  		ret = devm_pm_opp_set_regulators(dev, reg_names);
>  		if (ret && ret != -ENODEV) {
>  			if (ret != -EPROBE_DEFER)
> @@ -267,7 +281,7 @@ void panthor_devfreq_resume(struct panthor_device *ptdev)
>  {
>  	struct panthor_devfreq *pdevfreq = ptdev->devfreq;
>  
> -	if (!pdevfreq->devfreq)
> +	if (!pdevfreq || !pdevfreq->devfreq)
>  		return;
>  
>  	panthor_devfreq_reset(pdevfreq);
> @@ -279,7 +293,7 @@ void panthor_devfreq_suspend(struct panthor_device *ptdev)
>  {
>  	struct panthor_devfreq *pdevfreq = ptdev->devfreq;
>  
> -	if (!pdevfreq->devfreq)
> +	if (!pdevfreq || !pdevfreq->devfreq)
>  		return;
>  
>  	drm_WARN_ON(&ptdev->base, devfreq_suspend_device(pdevfreq->devfreq));
> @@ -290,7 +304,7 @@ void panthor_devfreq_record_busy(struct panthor_device *ptdev)
>  	struct panthor_devfreq *pdevfreq = ptdev->devfreq;
>  	unsigned long irqflags;
>  
> -	if (!pdevfreq->devfreq)
> +	if (!pdevfreq || !pdevfreq->devfreq)
>  		return;
>  
>  	spin_lock_irqsave(&pdevfreq->lock, irqflags);
> @@ -306,7 +320,7 @@ void panthor_devfreq_record_idle(struct panthor_device *ptdev)
>  	struct panthor_devfreq *pdevfreq = ptdev->devfreq;
>  	unsigned long irqflags;
>  
> -	if (!pdevfreq->devfreq)
> +	if (!pdevfreq || !pdevfreq->devfreq)
>  		return;
>  
>  	spin_lock_irqsave(&pdevfreq->lock, irqflags);
> @@ -319,14 +333,17 @@ void panthor_devfreq_record_idle(struct panthor_device *ptdev)
>  
>  unsigned long panthor_devfreq_get_freq(struct panthor_device *ptdev)
>  {
> +	int (*get_cur_freq)(struct device *dev, unsigned long *freq);
>  	struct panthor_devfreq *pdevfreq = ptdev->devfreq;
>  	unsigned long freq = 0;
>  	int ret;
>  
> -	if (!pdevfreq->devfreq)
> -		return 0;
> +	if (!pdevfreq || !pdevfreq->devfreq)
> +		get_cur_freq = panthor_devfreq_get_cur_freq;
> +	else
> +		get_cur_freq = pdevfreq->devfreq->profile->get_cur_freq;

You don't need the whole pointer to a function dance. You can just do:

--8<-------------------------------------------
+	if (!pdevfreq || !pdevfreq->devfreq)
+		ret = panthor_devfreq_get_cur_freq(ptdev->base.dev, &freq);
+	else
+		ret = pdevfreq->devfreq->profile->get_cur_freq(ptdev->base.dev, &freq);
  	if (ret)
  		return 0;
-->8-------------------------------------------

With that,

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

>  
> -	ret = pdevfreq->devfreq->profile->get_cur_freq(ptdev->base.dev, &freq);
> +	ret = get_cur_freq(ptdev->base.dev, &freq);
> diff --git a/drivers/gpu/drm/panthor/panthor_hw.h b/drivers/gpu/drm/panthor/panthor_hw.h
> index 48232254fef97..e5bcb908068cb 100644
> --- a/drivers/gpu/drm/panthor/panthor_hw.h
> +++ b/drivers/gpu/drm/panthor/panthor_hw.h
> @@ -101,4 +101,10 @@ static inline u64 panthor_hw_get_l2_features(struct panthor_device *ptdev)
>  	return ptdev->gpu_info.l2_features;
>  }
>  
> +static inline bool panthor_hw_is_gen5_am(struct device *dev)
> +{
> +	return device_property_match_string(dev, "compatible",
> +					    "arm,mali-gen5-am") >= 0;
> +}
> +
>  #endif /* __PANTHOR_HW_H__ */
> -- 
> 2.43.0
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
