Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF3E722FDE6
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 15:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787843069; cv=none; b=S/GB0dei9kw/F016fPJla3AvKahNG/LJkx9QTSTVIoNhSOcxL2x7Y+6vfJQcgAszBBFBcza3ymIsF6y2957zUSZa+IXqHfDNCondf6KE6+kKk5OgGTYTh+mePpXtMRwtKPiFG0KscvFVXvLR+kD6RKYF0N+husGS5vzlAGXKwas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787843069; c=relaxed/simple;
	bh=bxC37lvaz4/0Z9c/u7R7FG/15uLvlqrBQIyoFjZtV9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d9NxVWmNEWiteeN+LQm7XYTDMGy/H3/TFH+eyOso/VqTFQADsy9Px5+qB0IjS5Wkw+r3Jx0Bbshi01sMm/62PWyGaOw5wtQqxrsYPPNNS9WT8c1TwZYghphWKOa/tT3lEzvUW0XaZ4u4X/vtM2HRHwvnjNWz5ekrFWMPwcxNYpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Y6pOwIhP; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Y6pOwIhP"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D7FA1BCA
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:04:22 -0700 (PDT)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D28843F66F
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787843066; bh=bxC37lvaz4/0Z9c/u7R7FG/15uLvlqrBQIyoFjZtV9s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y6pOwIhPfuywaQWPEC9NeDk6iO67NtcbOH5IAYqxtp0/0JsFZ/LNVIas1kpEP/XFo
	 7S1Dj/3E31Em82X7Y7vW8UQwXwU5Y/H936+3atx6gEyqA0sqRo5DR443M9Vhoziy0p
	 71C1N5hWE/GvYcX0dKNrQpCeyM45FMkxIloCvQwc=
Date: Thu, 27 Aug 2026 16:04:15 +0100
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
Subject: Re: [PATCH v4 02/18] drm/panthor: Revisit the reset logic to avoid
 reset request loss
Message-ID: <apBR7_3pBINYd-gZ@e142607>
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

On Wed, Aug 26, 2026 at 04:56:01PM +0200, Boris Brezillon wrote:
> disable/enable_work() provide a ready to use mechanism to temporarily
> disable a work item, so use that instead of the complex state machinery
> based on the PM state.
> 
> This also allows us to automate the reset resubmission in case a reset
> was received while the work item was disabled.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

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
>  
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
