Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792765998;
	b=3T4aVrtJ2QEoLrOaSIf9LWRwjp0vvhBO6G9Dc0Fhgf80PqtXx9NSiWBOnrZXqwF4ts/U
	 C4PDO3V9udicEUmYWg5ClXIkZ9m5hayzXOaIqjRliXkJL/0YNmiZTLA2XcflyTeGlYOq1
	 Unc2R0haZchxEpr/cMQrYS2IZRYjJ+SzND31K3S2RZKg2i9JJd01v4bfYlE1iiCqzaej3
	 UqwzExUdNF6NPya2A5LRdhbGCTtpplW61qDJqWgeQnwpXLoDxVr1npfqtrJcQM8ji/MTC
	 /jtDwAVWRsPDvIfMItHkooQbQdiJ9wPGBdtw3FF5gkBoZWRq9LsJFAGhu099zs6IpgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792765998;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=Nc26iKEo+FAF4zXriteKYpkyX2aYUCNYCCN+BCusaCk=;
	b=MLj0y64nsjzO7e632yPkEvcmewp1dECl8JkH7acMlSYE5mpuyMPxDS/e9BvAzsneo43t
	 B9IHUpQsCB8emgt6FcY3T1/u0vefC5LrL0FIDbAYN7RqlJcyjeb42y5ujyZkzCmP7Jrqz
	 55Ckzw2thyS3lg5KndnirAAO1SeoDKyfpK8KEMd98DIdiQpLm5muilT5Ps8Vw/fBag+Jn
	 I9FcNO1IuMLPWhoai511OXWSU/kP48D4MzF9184WwGw3Z8SbtyfkAtePdDTBToUbi4t2x
	 kGsJKPs4L0TeBL502ROuIwz6EtKrRVfPqlKEpmpRoEK4w/B/Ww3b2Vyd9M5X0WHWTTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=BUU2ij64;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D223C606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 14:33:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D223C606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=BUU2ij64
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A7271C00
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:33:14 -0700 (PDT)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 17E4A3F673
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792765997; bh=Gn5JR1ydvrwm3YaCW1+DyZrrnVAr3G/GKLqMw2kyGeg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BUU2ij64IarKx7jNLDB19S/VSNOBB1JLy5M0txtIry+1hUnJUq5n/a1YJd7b/iVBx
	 oXgHw7pdw7EndvV/Vt0cS4r6Z4uzZLGC/KyES5EGBWeHPMMcSAyz1T0jYgarrqs+xY
	 j8OG4aHCQaN+9dtBNjON6nmxJHfRUVWLXdqUi3Vw=
Date: Fri, 23 Oct 2026 15:33:04 +0100
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
Subject: Re: [PATCH v7 8/8] drm/panthor: Expose the panthor perf ioctls
Message-ID: <attwIGMsvdfAx-j_@e142607>
References: <20261011-panthor-performance-counters-v7-0-12c32495062f@arm.com>
 <20261011-panthor-performance-counters-v7-8-12c32495062f@arm.com>
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
In-Reply-To: <20261011-panthor-performance-counters-v7-8-12c32495062f@arm.com>

On Sun, Oct 11, 2026 at 06:36:55PM +0100, Lukas Zapolskas wrote:
> This patch implements the PANTHOR_PERF_SESSION ioctl series.
> 
> The minor version is bumped to indicate that the feature is now
> supported.
> 
> Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  drivers/gpu/drm/panthor/panthor_drv.c | 117 +++++++++++++++++++++++++++++++++-
>  1 file changed, 115 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index 3e62142d7ebd..5ca41cb9c1ba 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -184,7 +184,12 @@ panthor_get_uobj_array(const struct drm_panthor_obj_array *in, u32 min_stride,
>  		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_create, ringbuf_size), \
>  		 PANTHOR_UOBJ_DECL(struct drm_panthor_vm_bind_op, syncs), \
>  		 PANTHOR_UOBJ_DECL(struct drm_panthor_bo_sync_op, size), \
> -		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_info, shader_blocks))
> +		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_info, shader_blocks), \
> +		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_session_create, shader_enable_mask), \
> +		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_session_start, user_data), \
> +		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_session_stop, user_data), \
> +		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_session_sample, user_data), \
> +		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_session_destroy, handle))
>  
>  /**
>   * PANTHOR_UOBJ_SET() - Copy a kernel object to a user object.
> @@ -1603,6 +1608,103 @@ static int panthor_ioctl_bo_query_info(struct drm_device *ddev, void *data,
>  	return 0;
>  }
>  
> +static int panthor_ioctl_perf_session_create(struct drm_device *ddev, void *data,
> +					     struct drm_file *file)
> +{
> +	int ret, cookie;
> +	unsigned long sid = 0;
> +	struct drm_panthor_perf_session_create *args = data;
> +
> +	if (!drm_dev_enter(file->minor->dev, &cookie))
> +		return -ENODEV;
> +
> +	if (!mem_is_zero(args->pad, sizeof(args->pad)))
> +		return -EINVAL;
> +
> +	ret = panthor_perf_session_create(file, args, &sid);
> +	if (ret)
> +		return ret;
> +
> +	drm_dev_exit(cookie);
> +	return sid;
> +}
> +
> +static int panthor_ioctl_perf_session_start(struct drm_device *ddev, void *data,
> +					    struct drm_file *file)
> +{
> +	int cookie, ret;
> +	struct panthor_file *pfile = file->driver_priv;
> +	struct drm_panthor_perf_session_start *args = data;
> +
> +	if (!drm_dev_enter(file->minor->dev, &cookie))
> +		return -ENODEV;
> +
> +	if (args->pad0)
> +		return -EINVAL;
> +
> +	ret = panthor_perf_session_start(pfile, args->handle, args->user_data);
> +
> +	drm_dev_exit(cookie);
> +	return ret;
> +}
> +
> +static int panthor_ioctl_perf_session_sample(struct drm_device *ddev, void *data,
> +					     struct drm_file *file)
> +{
> +	int cookie, ret;
> +	struct panthor_file *pfile = file->driver_priv;
> +	struct drm_panthor_perf_session_sample *args = data;
> +
> +	if (!drm_dev_enter(file->minor->dev, &cookie))
> +		return -ENODEV;
> +
> +	if (args->pad0)
> +		return -EINVAL;
> +
> +	ret =  panthor_perf_session_sample(pfile, args->handle, args->user_data);
> +
> +	drm_dev_exit(cookie);
> +	return ret;
> +}
> +
> +static int panthor_ioctl_perf_session_stop(struct drm_device *ddev, void *data,
> +					   struct drm_file *file)
> +{
> +	int cookie, ret;
> +	struct panthor_file *pfile = file->driver_priv;
> +	struct drm_panthor_perf_session_stop *args = data;
> +
> +	if (!drm_dev_enter(file->minor->dev, &cookie))
> +		return -ENODEV;
> +
> +	if (args->pad0)
> +		return -EINVAL;
> +
> +	ret = panthor_perf_session_stop(pfile, args->handle, args->user_data);
> +
> +	drm_dev_exit(cookie);
> +	return ret;
> +}
> +
> +static int panthor_ioctl_perf_session_destroy(struct drm_device *ddev, void *data,
> +					      struct drm_file *file)
> +{
> +	int cookie, ret;
> +	struct panthor_file *pfile = file->driver_priv;
> +	struct drm_panthor_perf_session_destroy *args = data;
> +
> +	if (!drm_dev_enter(file->minor->dev, &cookie))
> +		return -ENODEV;
> +
> +	if (args->pad0)
> +		return -EINVAL;
> +
> +	ret = panthor_perf_session_destroy(pfile, args->handle);
> +
> +	drm_dev_exit(cookie);
> +	return ret;
> +}
> +
>  static int
>  panthor_open(struct drm_device *ddev, struct drm_file *file)
>  {
> @@ -1687,6 +1789,11 @@ static const struct drm_ioctl_desc panthor_drm_driver_ioctls[] = {
>  	PANTHOR_IOCTL(SET_USER_MMIO_OFFSET, set_user_mmio_offset, DRM_RENDER_ALLOW),
>  	PANTHOR_IOCTL(BO_SYNC, bo_sync, DRM_RENDER_ALLOW),
>  	PANTHOR_IOCTL(BO_QUERY_INFO, bo_query_info, DRM_RENDER_ALLOW),
> +	PANTHOR_IOCTL(PERF_SESSION_CREATE, perf_session_create, DRM_RENDER_ALLOW),
> +	PANTHOR_IOCTL(PERF_SESSION_START, perf_session_start, DRM_RENDER_ALLOW),
> +	PANTHOR_IOCTL(PERF_SESSION_SAMPLE, perf_session_sample, DRM_RENDER_ALLOW),
> +	PANTHOR_IOCTL(PERF_SESSION_STOP, perf_session_stop, DRM_RENDER_ALLOW),
> +	PANTHOR_IOCTL(PERF_SESSION_DESTROY, perf_session_destroy, DRM_RENDER_ALLOW),
>  };
>  
>  static int panthor_mmap(struct file *filp, struct vm_area_struct *vma)
> @@ -1807,6 +1914,12 @@ static void panthor_debugfs_init(struct drm_minor *minor)
>   * - 1.8 - extends DEV_QUERY_TIMESTAMP_INFO with flags
>   * - 1.9 - adds DRM_PANTHOR_DEV_QUERY_MMU_INFO query
>   *       - adds DRM_PANTHOR_VM_BIND_OP_MAP_SPARSE flag
> + * - 1.10 - adds DEV_QUERY_PERF_INFO query
> + *        - adds PERF_SESSION_CREATE ioctl
> + *        - adds PERF_SESSION_START ioctl
> + *        - adds PERF_SESSION_SAMPLE ioctl
> + *        - adds PERF_SESSION_STOP ioctl
> + *        - adds PERF_SESSION_DESTROY ioctl
>   */
>  static const struct drm_driver panthor_drm_driver = {
>  	.driver_features = DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ |
> @@ -1820,7 +1933,7 @@ static const struct drm_driver panthor_drm_driver = {
>  	.name = "panthor",
>  	.desc = "Panthor DRM driver",
>  	.major = 1,
> -	.minor = 9,
> +	.minor = 10,
>  
>  	.gem_prime_import_sg_table = panthor_gem_prime_import_sg_table,
>  	.gem_prime_import = panthor_gem_prime_import,
> 
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
