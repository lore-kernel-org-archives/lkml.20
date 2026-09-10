Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3021C35C19B
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 01:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789002818; cv=pass; b=smVDocNnrCIbZPwrC+XVB/K5ixqQuJehpG2GmfYDyrU9Y5L5XlU6oXYQ3mlEADdIxiG2pINdEpDi8TvnV9J0Vwabi/00c6Wwpo4lBCk351mipO6JZTJ1s9SABT1bs9JH2JstkqFVpWTOc78ojopETs9v8jObFbaAO47jtq1cmmw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789002818; c=relaxed/simple;
	bh=QQhd+ByTtP4bod2cnHiMJhpEI2mt0dO3OX+rMEAZ9c0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kQWrnKtk9U6OwdT8qu61gBNLC1zFjzouxlhyoNJ1fTa3rO+LrLfHf56UjjBGr+yI/GtPOvIZwguSmR0bUWkRtZL3g+vDOuhHN7BLD7Oe93wgMTg/xGvMB68vqOitYcyXoV9tcxJ1nmgKMZVULXNOsNANsEqzvfJwrFKyMltX77Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=YyEwYHUT; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="YyEwYHUT"
ARC-Seal: i=1; a=rsa-sha256; t=1789002802; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=IgOasajRXC7S876IzU8aHX2nSXRwXl3Mrq9l+p2eXmEARdyCMlkRqvuGP0gpl4Az4QnGFgFFP6a22QtupZX3Z2ml8ViSwRDT/iNgpsHGWAm2hf14xZp8+Vhv7ZhofIfWOZs2nV9a1Z5eRm05Li+vW3I8imLOx3hLPjG2u39ncSI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789002802; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=F44zXM3XMhPpROQfydQq0ZCBPHEa2Thb+xLBsai0i60=; 
	b=kdhY4hR7vKSitxci5pswgW246UBiOOoK3OS1GjBieXjiT239nyh3tKCiw5zgWB09fdAsBC6d20/utFIlHH/66s1Hpv6iHn3f4/3dCOmHgfP6N3d9ourTGjkmJOfZdF/MRO/O+w2gMH37iDOEPGxYugU9JACm3CEKpwaunTDzC2Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789002802;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
	bh=F44zXM3XMhPpROQfydQq0ZCBPHEa2Thb+xLBsai0i60=;
	b=YyEwYHUTIVebZ4s7aICEGI+YMoQqt4dZGRnq9YmBUo43P/pr0TcWkcsJMsLZExWr
	4Yn13M6gAOErXQyz5GH761Bg7tP9OjLEVtwpRZVOFzBVUexIF+tiN86ktN7UaBT0Yv5
	FLVdY6kofwgVsfdJpD1qi6fVEp2aKKNOwi142YAs=
Received: by mx.zohomail.com with SMTPS id 1789002802340736.1430009098463;
	Wed, 9 Sep 2026 18:13:22 -0700 (PDT)
Date: Thu, 10 Sep 2026 02:13:17 +0100
From: Adrian Larumbe <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Chris Diamand <chris.diamand@arm.com>, Akash Goel <akash.goel@arm.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 02/18] drm/panthor: Revisit the reset logic to avoid
 reset request loss
Message-ID: <aqFE7ugtbRwufjHv@sobremesa>
References: <20260826-panthor-unplug-fixes-v4-0-982cc8f4234b@collabora.com>
 <20260826-panthor-unplug-fixes-v4-2-982cc8f4234b@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260826-panthor-unplug-fixes-v4-2-982cc8f4234b@collabora.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/288.982.46

Reviewed-by: Adrián Larumbe <adrian.larumbe@collabora.com>

On 26.08.2026 16:56, Boris Brezillon wrote:
> disable/enable_work() provide a ready to use mechanism to temporarily
> disable a work item, so use that instead of the complex state machinery
> based on the PM state.
> 
> This also allows us to automate the reset resubmission in case a reset
> was received while the work item was disabled.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_device.c | 36 +++++++++++++++++++++++++-------
>  drivers/gpu/drm/panthor/panthor_device.h |  3 +--
>  2 files changed, 29 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> index 7c55d0c45cfd..2974f4bc0bb1 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -181,6 +181,15 @@ static void panthor_device_free_page(struct drm_device *ddev, void *data)
>  	__free_page(data);
>  }
>  
> +static void enable_resets(struct panthor_device *ptdev)
> +{
> +	/* If a reset has been queued while the work was
> +	 * disabled, reschedule it.
> +	 */
> +	if (enable_work(&ptdev->reset.work) && atomic_read(&ptdev->reset.pending))
> +		queue_work(ptdev->reset.wq, &ptdev->reset.work);
> +}
> +
>  int panthor_device_init(struct panthor_device *ptdev)
>  {
>  	u32 *dummy_page_virt;
> @@ -256,6 +265,13 @@ int panthor_device_init(struct panthor_device *ptdev)
>  
>  	ptdev->phys_addr = res->start;
>  
> +	/* panthor_device_resume() calls enable_resets(), so we need to disable
> +	 * the reset.work manually before this gets called to keep things
> +	 * balanced. We don't bother re-enabling the work if the resume fails,
> +	 * because the whole initialization will fail in that case, and the work
> +	 * will vanish.
> +	 */
> +	disable_work(&ptdev->reset.work);
>  	ret = devm_pm_runtime_enable(ptdev->base.dev);
>  	if (ret)
>  		return ret;
> @@ -305,9 +321,6 @@ int panthor_device_init(struct panthor_device *ptdev)
>  
>  	panthor_gem_init(ptdev);
>  
> -	/* Now that everything is initialized, we can enable the reset work. */
> -	enable_work(&ptdev->reset.work);
> -
>  	/* ~3 frames */
>  	pm_runtime_set_autosuspend_delay(ptdev->base.dev, 50);
>  	pm_runtime_use_autosuspend(ptdev->base.dev);
> @@ -316,6 +329,9 @@ int panthor_device_init(struct panthor_device *ptdev)
>  	if (ret)
>  		goto err_disable_autosuspend;
> +	/* Now that everything is initialized, we can enable the reset work. */
> +	enable_resets(ptdev);
> +
>  	pm_runtime_put_autosuspend(ptdev->base.dev);
>  	return 0;
>  
> @@ -534,10 +550,8 @@ int panthor_device_resume(struct device *dev)
>  		/* If there was a reset pending at the time we suspended the
>  		 * device, we force a slow reset.
>  		 */
> -		if (atomic_read(&ptdev->reset.pending)) {
> +		if (atomic_cmpxchg(&ptdev->reset.pending, 1, 0))
>  			ptdev->reset.fast = false;
> -			atomic_set(&ptdev->reset.pending, 0);
> -		}
>  
>  		ret = panthor_device_resume_hw_components(ptdev);
>  		if (ret && ptdev->reset.fast) {
> @@ -565,6 +579,9 @@ int panthor_device_resume(struct device *dev)
>  			    DRM_PANTHOR_USER_MMIO_OFFSET, 0, 1);
>  	atomic_set(&ptdev->pm.state, PANTHOR_DEVICE_PM_STATE_ACTIVE);
>  	mutex_unlock(&ptdev->pm.mmio_lock);
> +
> +	/* Now that everything is resumed, we can re-enable the reset work. */
> +	enable_resets(ptdev);

This makes me wonder, what could've recorded a reset request when the device was powered off?
I can only think of an IRQ handler or maybe the tick thread running into some trouble when the
device was in the middle of an RPM suspend.

>  	return 0;
>  
>  err_suspend_devfreq:
> @@ -604,10 +621,13 @@ int panthor_device_suspend(struct device *dev)
>  			    DRM_PANTHOR_USER_MMIO_OFFSET, 0, 1);
>  	mutex_unlock(&ptdev->pm.mmio_lock);
>  
> +	/* Make sure we're not interrupted by resets after that point
> +	 * until the GPU is resumed.
> +	 */
> +	disable_work_sync(&ptdev->reset.work);
> +
>  	if (panthor_device_is_initialized(ptdev) &&
>  	    drm_dev_enter(&ptdev->base, &cookie)) {
> -		cancel_work_sync(&ptdev->reset.work);
> -
>  		/* We prepare everything as if we were resetting the GPU.
>  		 * The end of the reset will happen in the resume path though.
>  		 */
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> index 6529e01e838d..f55baa21b25e 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -389,8 +389,7 @@ void panthor_device_unplug(struct panthor_device *ptdev);
>   */
>  static inline void panthor_device_schedule_reset(struct panthor_device *ptdev)
>  {
> -	if (!atomic_cmpxchg(&ptdev->reset.pending, 0, 1) &&
> -	    atomic_read(&ptdev->pm.state) == PANTHOR_DEVICE_PM_STATE_ACTIVE)
> +	if (!atomic_cmpxchg(&ptdev->reset.pending, 0, 1))
>  		queue_work(ptdev->reset.wq, &ptdev->reset.work);
>  }
>  
> 
> -- 
> 2.55.0


Adrian Larumbe
