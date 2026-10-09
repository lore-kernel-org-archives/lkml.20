Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3994E50A7
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 15:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791558691; cv=none; b=oqLOJr4P6RpI7ZFK3AnTStq0O3Y9QuKbg/cd8twWVd1j2gLQvFPSW6dZQ6KXz9sETOo0N8AIOLr5xJkPwDaOZrfrXX6Py5oKwn2N0UKOa7uRVPOko1XxTfsreHX1RVLk3rVJ2OZ0OEjK/UWkBAXCiUDc1jxArIKBJVNyuxy+ioM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791558691; c=relaxed/simple;
	bh=CWQ8/i2hnWz9mwtHhRbUBlfXDq/qLQBYT+2/sqfdVJE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mTgOfK4dq1qKXrefgKzVjN97XhjCsqnMkuSLEk8BF+qIBH4G8MqvN25VOMjel61wNFXVXzZL3pQUKhZgl3cXlX0Xis//OUxn5KPDjUdZG9WcC7E6YWD1UbzIJtZ3k2azeUCEq7vC4QS3xG5BqgrT+11+imT9ECwQKWAlZIYCEK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ADL/kRLg; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ADL/kRLg"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so3580469a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 08:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791558689; x=1792163489; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tI0FBjJw5y4gdtGFwBDX98lJORYRvSjv3jiqMKoW3vI=;
        b=ADL/kRLgxYvb2vmXo6ektfonSXfo7q/3fQUxvDoRarNQ4Oqmeh8QJOrtr81/+RPgm7
         YbYhy1Hd6+j87jiY/kmVXa10jfutcD92Q2RvNsZRQZysXSRiDVcvwlwB98eqLtkY1y5I
         D8TnLlCop7nowO5BRce68uOb09VVp/GBa1GXpoPccej9QdrqynrqoDSH9geCx+0XB94Z
         fY5hVDWQj0LRxPAxZCm894J2RgirkZUaSSqC6Q2GwUpZBt0zn7JCZ8QFcYfA9N1DO71x
         Qz7BtOranTwMhmGqWzItlsFp7mU6yKCuEhk/nfIQS7+k8Aya7wZC0ltJmc3LFUAABTcz
         46Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791558689; x=1792163489;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tI0FBjJw5y4gdtGFwBDX98lJORYRvSjv3jiqMKoW3vI=;
        b=Z7YgK2xFC0CtirCH4dpLiJt5Utdmx65fEdC8FdgK0ayvcS6qbyaNu13gZxlbBPQSHa
         tURDilQyxSpCM8jnBS3dKWAH3YG7UfGSY8KrlcR3/dCsD3AHJzA7gB35oAy38NpYU3VU
         4vLw8ReL8VMOx+NprZO8UlBtQZhIzbFfeQFXfAb6AcL8yKo9o6ofDlvIHOQzRosNiLDC
         x/63EnliLK3BixRHcrsmZMt1nf3vjIn5rdoD3+uoWE5ZD030oMTSOshcl7aDtcBWIs2M
         lH8i1U/aPcoPqxp/T7TTTanUiKS6wlcul7oh+Vd8D0OcEcapfMMTjr0fIMUJ3TV4ZNsx
         DgAA==
X-Forwarded-Encrypted: i=1; AKwUvBzCW43xz3TDWDH5lJrbn3C0Vff/XuzcjbPcNGAZCPQjpV5opqVJxA9znlgXso3INtXdG3p/QGpgFALlTBo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvQH8x+nHm/uDayrgHjV3WvH4uXKJp9TtZeW38XoXiGZNNwFiV
	q+eX9I46HX0GXv3sM7KJbI8GUrzT3JYT7l7i3gRxigSUpnk5zbH6YQZmaLZ/7fls4lE=
X-Gm-Gg: AYBFou3aCo4LCZL/syKKvuF1NRfNUlEEfCH13dqL8VH+NBj25nn6R/8JZw3sdf6btsm
	9qrPeNRq6v7ktnTKLpM6GxMiG4u9njs24aRrKNqTYJUS/Q3c6le23+PperiU+lNG0OV8v3hkW9Y
	01siYjwe+pH2lzyvd0b3BSRGGC1FXMsrV0wKVOF+bAVi5c60eV6ZbDgsM2TWHH4DgQU2mYdkgNW
	VR5LOuZxexLl0ULD/wBuArHPLVLmCllTmFo0uHbyCm0MsexIlGXv6ZCAA4geUg62/fYGbO59wCV
	CXIqAteseLuK0Vfae+NiGy7kwDKYTW2x1x2wK/YXuuwUDlsNc4LYCOposQYkav42CZrfXmbhJab
	ZAyLlit8OIq1jYrAWkpe2JJov3/PsrRVsZXO6V4sSXnNbBqG9UoisVK7lqBr8a+HhEBct2k18x5
	Auoa5ot0JqR47cXKkh3zXxu8OsrsUZTTwktOxRHJ3N5Yyx6QIxMNejTY5il6Bq7GoNPuNzaqw19
	Q==
X-Received: by 2002:a17:90b:3145:b0:3a8:86d6:aab2 with SMTP id 98e67ed59e1d1-3ab3a99b883mr2053681a91.63.1791558689150;
        Fri, 09 Oct 2026 08:11:29 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:9f78:f82f:d05e:99a4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da05caaesm1117345a12.32.2026.10.09.08.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 08:11:28 -0700 (PDT)
Date: Fri, 9 Oct 2026 09:11:26 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Yonghao Zhang <hyz3367@gmail.com>
Cc: andersson@kernel.org, linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v3] remoteproc: core: Fetch the auto-boot firmware only
 once
Message-ID: <askEHoKkTrrmG46N@p14s>
References: <ar0lvsu80miGJdGS@p14s>
 <20261001081056.38293-1-hyz3367@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001081056.38293-1-hyz3367@gmail.com>

On Thu, Oct 01, 2026 at 04:10:56PM +0800, Yonghao Zhang wrote:
> Auto-boot for an always-on remote processor registers an asynchronous
> request_firmware_nowait() whose callback, rproc_auto_boot_callback(),
> calls rproc_boot() first and only releases the fetched image at the
> very end of the callback.  rproc_boot() does not take this image as an
> argument: it fetches the very same image again with a synchronous
> request_firmware(), so every auto-boot reads the firmware image twice
> and allocates the buffer twice; on kernels with the sysfs fallback
> enabled, the uevent round-trip is repeated as well.
> 
> The asynchronous request exists only so that rproc_add() does not
> block on the filesystem read; the image it fetches is never used.
> The core already defers rproc_boot() to a worker for detached
> processors (attach_work).  Reuse that worker for offline processors
> too and drop the asynchronous firmware request: rproc_boot() fetches
> the image exactly once and dispatches between a firmware boot and
> an attach based on the processor state.  The work is renamed to
> boot_work to match its widened role.
> 
> commit 400e64df6b23 ("remoteproc: add framework for controlling remote
> processors") noted back in 2011 that "we must wait until it completes
> before we try to unregister the device".  rproc_del() now does exactly
> that: it waits for the boot work with cancel_work_sync(), which also
> closes the theoretical window in which a pending attach work could
> outlive the rproc instance.
> 
> The changed fallback behaviour only matters for legacy
> configurations.  udev dropped its userspace firmware loader back in
> 2014, as recorded in
> Documentation/driver-api/firmware/fallback-mechanisms.rst, and the
> kernel has documented since commit 02c399306826 ("firmware_loader:
> enhance Kconfig documentation over FW_LOADER") that "Linux no longer
> relies on or uses a fallback mechanism in userspace".  Auto-boot now
> uses the same synchronous fallback semantics as every other explicit
> boot source (sysfs, cdev).
> 
> Signed-off-by: Yonghao Zhang <hyz3367@gmail.com>
> ---
> Changes in v3:
> - Drop rproc_trigger_auto_boot() wrapper and schedule boot_work
>   directly in rproc_add() (Mathieu).
> 
> Changes in v2:
> - Fix the order described in the changelog: the callback calls
>   rproc_boot() first and releases the asynchronously fetched image at
>   the end of the callback (Mathieu).
> - Fix typo "proccessor".
> 
>  drivers/remoteproc/remoteproc_core.c | 66 +++++++---------------------
>  include/linux/remoteproc.h           |  4 +-
>  2 files changed, 19 insertions(+), 51 deletions(-)
>

Applied.

Thanks,
Mathieu
 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 263e12f022ea..b88bf179507d 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1662,51 +1662,23 @@ static int rproc_attach(struct rproc *rproc)
>  }
>  
>  /*
> - * take a firmware and boot it up.
> - *
> - * Note: this function is called asynchronously upon registration of the
> - * remote processor (so we must wait until it completes before we try
> - * to unregister the device. one other option is just to use kref here,
> - * that might be cleaner).
> + * Boot or attach the remote processor in the background: rproc_add()
> + * runs in probe context and must not block while the firmware image is
> + * read from storage.  rproc_boot() dispatches on the processor state,
> + * so this covers both a firmware boot and an attach to a processor
> + * started by another entity.
> + *
> + * Note: rproc_del() waits for this work to complete with
> + * cancel_work_sync(), so the rproc instance remains valid for the
> + * entire lifetime of this function.
>   */
> -static void rproc_auto_boot_callback(const struct firmware *fw, void *context)
> -{
> -	struct rproc *rproc = context;
> -
> -	rproc_boot(rproc);
> -
> -	release_firmware(fw);
> -}
> -
> -static void rproc_attach_work(struct work_struct *work)
> +static void rproc_boot_work(struct work_struct *work)
>  {
> -	struct rproc *rproc = container_of(work, struct rproc, attach_work);
> +	struct rproc *rproc = container_of(work, struct rproc, boot_work);
>  
>  	rproc_boot(rproc);
>  }
>  
> -static int rproc_trigger_auto_boot(struct rproc *rproc)
> -{
> -	int ret;
> -
> -	if (rproc->state == RPROC_DETACHED) {
> -		schedule_work(&rproc->attach_work);
> -		return 0;
> -	}
> -
> -	/*
> -	 * We're initiating an asynchronous firmware loading, so we can
> -	 * be built-in kernel code, without hanging the boot process.
> -	 */
> -	ret = request_firmware_nowait(THIS_MODULE, FW_ACTION_UEVENT,
> -				      rproc->firmware, &rproc->dev, GFP_KERNEL,
> -				      rproc, rproc_auto_boot_callback);
> -	if (ret < 0)
> -		dev_err(&rproc->dev, "request_firmware_nowait err: %d\n", ret);
> -
> -	return ret;
> -}
> -
>  static int rproc_stop(struct rproc *rproc, bool crashed)
>  {
>  	struct device *dev = &rproc->dev;
> @@ -2348,11 +2320,8 @@ int rproc_add(struct rproc *rproc)
>  	rproc_create_debug_dir(rproc);
>  
>  	/* if rproc is marked always-on, request it to boot */
> -	if (rproc->auto_boot) {
> -		ret = rproc_trigger_auto_boot(rproc);
> -		if (ret < 0)
> -			goto rproc_remove_dev;
> -	}
> +	if (rproc->auto_boot)
> +		schedule_work(&rproc->boot_work);
>  
>  	/* expose to rproc_get_by_phandle users */
>  	mutex_lock(&rproc_list_mutex);
> @@ -2361,10 +2330,6 @@ int rproc_add(struct rproc *rproc)
>  
>  	return 0;
>  
> -rproc_remove_dev:
> -	cancel_work_sync(&rproc->crash_handler);
> -	rproc_delete_debug_dir(rproc);
> -	device_del(dev);
>  rproc_remove_cdev:
>  	rproc_char_device_remove(rproc);
>  	return ret;
> @@ -2552,7 +2517,7 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>  	INIT_LIST_HEAD(&rproc->subdevs);
>  	INIT_LIST_HEAD(&rproc->dump_segments);
>  
> -	INIT_WORK(&rproc->attach_work, rproc_attach_work);
> +	INIT_WORK(&rproc->boot_work, rproc_boot_work);
>  	INIT_WORK(&rproc->crash_handler, rproc_crash_handler_work);
>  	spin_lock_init(&rproc->crash_handler_lock);
>  
> @@ -2630,6 +2595,9 @@ int rproc_del(struct rproc *rproc)
>  	if (cancel_work_sync(&rproc->crash_handler))
>  		pm_relax(rproc->dev.parent);
>  
> +	/* auto-boot may still be fetching firmware: wait for it here */
> +	cancel_work_sync(&rproc->boot_work);
> +
>  	__rproc_shutdown(rproc, true);
>  
>  	rproc_delete_debug_dir(rproc);
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index a44368737b39..d77e24539133 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -231,7 +231,7 @@ enum rproc_features {
>   * @subdevs: list of subdevices, to following the running state
>   * @notifyids: idr for dynamically assigning rproc-wide unique notify ids
>   * @index: index of this rproc device
> - * @attach_work: workqueue for attaching rproc
> + * @boot_work: workqueue for booting rproc
>   * @crash_handler: workqueue for handling a crash
>   * @crash_handler_lock: serializes crash handler queueing and deletion
>   * @deleting: remoteproc deletion has begun
> @@ -277,7 +277,7 @@ struct rproc {
>  	struct list_head subdevs;
>  	struct idr notifyids;
>  	int index;
> -	struct work_struct attach_work;
> +	struct work_struct boot_work;
>  	struct work_struct crash_handler;
>  	spinlock_t crash_handler_lock;
>  	bool deleting;
> -- 
> 2.34.1
> 
