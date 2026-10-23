Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792765946;
	b=gidqms27BDcLu9EZ4gzKXMtK+STRpgxCsF7pu3nsfGDSoWoOJ3p0av8vpL9OZCmKFmB3
	 5fCxddnwuV7dggrShv8IV5hK7MCFf4IvUGO2UiZQx4EWrks6twOFR6ex27WFXukTuu4Zq
	 R3G4SFs0T5GQwfYAX6ziruqtamvknss6qgWCqohLlc5mncFZXT2XTMYZ96uixyQwiWDjx
	 V1eC9FlEjzhRg2j/XwnwZpem190ulKZVF8JXUHNareC3C2r7pnNczXsOj5oKJs+3LJqIa
	 zp9jhubBtBA61DdbA56WmZw1xsPJl+jEt0iIe4G+utKQqcC3pEcSn4d14l7M+ExcHBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792765946;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=ht9Z3A55YoMb47m5RlECsRw+4QcVTY9so4ELYIsdPQo=;
	b=ei0h9IdVL5NZ5Kp+QVPN4zhPDgPzKOlmuDofk6bDZ++u2xUkYgxiboK46kU11iHKMIj5
	 sPwpkG3MzIhZMYZ81+o7TSSO+MiLBu1e9Ma+afZMY5UD4+2oNe1lzvJVrJyvUO0RoAC8L
	 YB3y0BjjcUl1/HMpY2XH3Yr6TNQO9TBn0Rg/wWQcY8xt+E09r0aoDhs5M8pyk+60lBUZm
	 0mFhdLPS2YVID7FUdkVlTyH5fivQKH/rShifHeW+ifHXoajPxo2HyZv4mw2fFm3IomGrQ
	 PzWBamSwyaw8dfNZ8hAEM2nz/3HhlPObNdDEdFM5mf78cXdNFBhSCtUUESmbIcSfs5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="aWKGjCs/";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3725A606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 14:32:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3725A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=aWKGjCs/
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2897D1C00
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:32:21 -0700 (PDT)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2114D3F673
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792765944; bh=anSElN5yBjJkYZBOkU/8sr3NncGEwgUdXZ2Ow2+bIdw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aWKGjCs/nNp1wHufGyhvLlY+Thv30W0iS/6PfH/0HCAKZ/jObqCz/aUb7X1O03GiA
	 ImcythXUWVWCvIvMK3v97+FULarkfDFTwtyqcp3XfUt6yWt5HmEeoLDiGd9GMvmArX
	 8PBT7sZFAsXtWjAVbZmi33h86o8NkENADQtn7QMU=
Date: Fri, 23 Oct 2026 15:32:11 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Lukas Zapolskas <lukas.zapolskas@arm.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	nd@arm.com
Subject: Re: [PATCH v7 7/8] drm/panthor: Add suspend, resume and reset
 handling
Message-ID: <attv60kGpPPpKfJG@e142607>
References: <20261011-panthor-performance-counters-v7-0-12c32495062f@arm.com>
 <20261011-panthor-performance-counters-v7-7-12c32495062f@arm.com>
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
In-Reply-To: <20261011-panthor-performance-counters-v7-7-12c32495062f@arm.com>

Minor nit: subject line gives the wrong idea about the patch.

On Sun, Oct 11, 2026 at 06:36:54PM +0100, Lukas Zapolskas wrote:
> The sampler must disable and re-enable counter sampling around
> suspends, and must re-program the FW interface after a reset to
> avoid losing data. Additionally, if a request was pending before the
> reset and it was not acked, the reset will have cleared it, so we toggle
> the flag and re-request a sample.
> 
> Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
> ---
>  drivers/gpu/drm/panthor/panthor_device.c |  8 ++-
>  drivers/gpu/drm/panthor/panthor_perf.c   | 83 ++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_perf.h   |  6 +++
>  3 files changed, 96 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> index 535383ef629f..c842480472ac 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -138,6 +138,7 @@ static void panthor_device_reset_work(struct work_struct *work)
>  	if (!drm_dev_enter(&ptdev->base, &cookie))
>  		return;
>  
> +	panthor_perf_pre_reset(ptdev);
>  	panthor_sched_pre_reset(ptdev);
>  	panthor_fw_pre_reset(ptdev, true);
>  	panthor_mmu_pre_reset(ptdev);
> @@ -147,6 +148,8 @@ static void panthor_device_reset_work(struct work_struct *work)
>  	ret = panthor_fw_post_reset(ptdev);
>  	atomic_set(&ptdev->reset.pending, 0);
>  	panthor_sched_post_reset(ptdev, ret != 0);
> +	if (!ret)
> +		panthor_perf_post_reset(ptdev);
>  	drm_dev_exit(cookie);
>  
>  	if (ret) {
> @@ -539,8 +542,10 @@ int panthor_device_resume(struct device *dev)
>  			ret = panthor_device_resume_hw_components(ptdev);
>  		}
>  
> -		if (!ret)
> +		if (!ret) {
>  			panthor_sched_resume(ptdev);
> +			panthor_perf_resume(ptdev);
> +		}
>  
>  		drm_dev_exit(cookie);
>  
> @@ -604,6 +609,7 @@ int panthor_device_suspend(struct device *dev)
>  		/* We prepare everything as if we were resetting the GPU.
>  		 * The end of the reset will happen in the resume path though.
>  		 */
> +		panthor_perf_suspend(ptdev);
>  		panthor_sched_suspend(ptdev);
>  		panthor_fw_suspend(ptdev);
>  		panthor_mmu_suspend(ptdev);
> diff --git a/drivers/gpu/drm/panthor/panthor_perf.c b/drivers/gpu/drm/panthor/panthor_perf.c
> index c66ad658a95d..28b02003f9f9 100644
> --- a/drivers/gpu/drm/panthor/panthor_perf.c
> +++ b/drivers/gpu/drm/panthor/panthor_perf.c
> @@ -1798,6 +1798,57 @@ int panthor_perf_session_sample(struct panthor_file *pfile, u32 handle, u64 user
>  	return err;
>  }
>  
> +/**
> + * panthor_perf_suspend - Prepare the performance counter subsystem for system suspend.
> + * @ptdev: Panthor device.
> + *
> + * Indicate to the performance counters that the system is suspending.
> + *
> + * This function must not be used to handle MCU power state transitions: just before MCU goes
> + * from on to any inactive state, an automatic sample will be performed by the firmware, and
> + * the performance counter firmware state will be restored on warm boot.
> + *
> + */
> +void panthor_perf_suspend(struct panthor_device *ptdev)
> +{
> +	struct panthor_perf *perf = ptdev->perf;
> +	int ret;
> +
> +	if (!perf)
> +		return;
> +
> +	guard(mutex)(&perf->op_lock);
> +
> +	ret = perf_disable(perf);
> +
> +	if (ret)
> +		drm_warn(&ptdev->base, "Could not stop sampling before suspend, err = %d", ret);
> +}
> +
> +/**
> + * panthor_perf_resume - Resume the performance counter subsystem after system resumption.
> + * @ptdev: Panthor device.
> + *
> + * Indicate to the performance counters that the system has resumed. This must not be used
> + * to handle MCU state transitions, for the same reasons as detailed in the kerneldoc for
> + * @panthor_perf_suspend.
> + */
> +void panthor_perf_resume(struct panthor_device *ptdev)
> +{
> +	struct panthor_perf *perf = ptdev->perf;
> +	int ret;
> +
> +	if (!perf)
> +		return;
> +
> +	guard(mutex)(&perf->op_lock);
> +
> +	ret = perf_enable(perf);
> +
> +	if (ret)
> +		drm_warn(&ptdev->base, "Could not resume sampling, err = %d", ret);
> +}
> +
>  /**
>   * panthor_perf_unplug - Terminate the performance counter subsystem.
>   * @ptdev: Panthor device.
> @@ -1868,3 +1919,35 @@ void panthor_perf_pool_destroy(struct panthor_file *pfile)
>  
>  	pfile->sessions = NULL;
>  }
> +
> +void panthor_perf_pre_reset(struct panthor_device *ptdev)
> +{
> +	if (!ptdev->perf)
> +		return;
> +
> +	guard(mutex)(&ptdev->perf->op_lock);
> +
> +	perf_disable(ptdev->perf);
> +}
> +
> +void panthor_perf_post_reset(struct panthor_device *ptdev)
> +{
> +	bool rerequest = false;
> +
> +	if (!ptdev->perf)
> +		return;
> +
> +	guard(mutex)(&ptdev->perf->op_lock);
> +
> +	perf_enable(ptdev->perf);
> +
> +	scoped_guard(spinlock_irqsave, &ptdev->perf->pend_lock) {
> +		rerequest = ptdev->perf->fw_sample_requested;
> +
> +		if (rerequest)
> +			ptdev->perf->fw_sample_requested = false;
> +	}
> +
> +	if (rerequest)
> +		perf_fw_request_sample(ptdev->perf);
> +}
> diff --git a/drivers/gpu/drm/panthor/panthor_perf.h b/drivers/gpu/drm/panthor/panthor_perf.h
> index 0e1172dbae39..e4a323fe6f0d 100644
> --- a/drivers/gpu/drm/panthor/panthor_perf.h
> +++ b/drivers/gpu/drm/panthor/panthor_perf.h
> @@ -18,6 +18,8 @@ int panthor_perf_pool_create(struct panthor_file *pfile);
>  void panthor_perf_pool_destroy(struct panthor_file *pfile);
>  
>  int panthor_perf_init(struct panthor_device *ptdev);
> +void panthor_perf_suspend(struct panthor_device *ptdev);
> +void panthor_perf_resume(struct panthor_device *ptdev);
>  void panthor_perf_unplug(struct panthor_device *ptdev);
>  
>  int panthor_perf_session_create(struct drm_file *file,
> @@ -30,5 +32,9 @@ int panthor_perf_session_sample(struct panthor_file *pfile, unsigned int handle,
>  
>  void panthor_perf_report_irq(struct panthor_device *ptdev, u32 status);
>  
> +void panthor_perf_pre_reset(struct panthor_device *ptdev);
> +
> +void panthor_perf_post_reset(struct panthor_device *ptdev);
> +
>  #endif /* __PANTHOR_PERF_H__ */
>  
> 
> -- 
> 2.43.0
> 

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
