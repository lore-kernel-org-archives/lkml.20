Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69624D9566
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 15:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790780877; cv=none; b=FHmX5ymJBvkjsFjOW4RyOm/PB3KuF65OZrpKsdDfpOJG0yhsuOqENbW9lX2wTqOVOqVzPVQTf3KeNpifSIDSJ4PqNP80l1Qtfcf3gUhentJlDKfdhbSIMqtNDf4In83gJutlD53DdbnwawGjQhC4vYBBssTMHxeW/IhqS7rd2+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790780877; c=relaxed/simple;
	bh=q8cCBm3pazBE/9+1p6k+VgCGqmHdDxdTeBk7Sj2qv1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lgpI35OucSZXkctMq1j8Spo+nA9OROMCHT2sK4Zrg69wvZDnLytA/FW8YZXHGQ8KM405biDdO0TxX/VpIMvlBLNYJEVIlun/tcjo9j0A8uT2T1WFu4iAW2jexF1LKFMuSGFr+mHM0QW1dL4gx4UBj6CYHUmvtxJXZXk+71/s3AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P2jYInEC; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P2jYInEC"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6c8f6a53fabso1543419eaf.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790780866; x=1791385666; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CON0N6NONpyLMBENg2JzFAKGu3VQSsJRc7S3/nKioTU=;
        b=P2jYInECOOLtuE4hSpciMtuqFPExypjnf5iynqXs1xNUj6rpbT9B99Qfgi8WtN87pl
         BtzEkyzYphrxF0n01qX/QbghJI4P9P6mee2l7B7G6RfDAosLAiRwfJNjr2G5+L6J0XnE
         xam+auqvN1MTE0KlsLaFeoKXiQzoJ0XUQSvfmZRUo+iFo9gLzjrwMJ7SCIa+gq1y4I9I
         WBwWLTRArHKRU7/JXiVpn8AmgVgdhG8KpiXsG3LYXm04C0QTkoL6OqJ2GmYU4/q8Mkhq
         xu2lhIGTDwPye4g3z/q5wceVl3vnYQpRDXI8vqNj8utU2+n48QEYrfnXgJaJ8KancMXL
         fNMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790780866; x=1791385666;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CON0N6NONpyLMBENg2JzFAKGu3VQSsJRc7S3/nKioTU=;
        b=Mb4pyn2D9HtTNu9pySHImYKV06Fr9wwEUidJrOyYZc4+dL2PFB4/X6S8P26xVQiQwM
         LcJFTzwPJd5CbPnCi9zvcesKj0LcjgADDKd0w/08qSAXxHG+PQKrAXtTynEtGWK/HKrt
         M3fdbKr76jxVvQZGtj5JgQOuA2wCSSr7z8RvFHcdzrfGb5azMPgB9SsnXQyFHP+/eVJE
         7zuuClc/JILZOtdsUZnMCnIo+Bxrb5r4JQq3bFTW0VqOoyKJqbbEedenvxScKMGk1U6T
         DCz5GkFNHFuCaFsDCdw94bfdPebswXhJDIKPtWv1x91HolztprCf+l7HuNXMZn/hOc9h
         iZPw==
X-Forwarded-Encrypted: i=1; AKwUvBy/HbGBk0R2BC3xlS9p3kjch9mChXXhMStFNai3Q2EyrEQJuurEPOYjyaNhHRgizk2KMpgAoqOQC9BfimE=@vger.kernel.org
X-Gm-Message-State: AFuF++leZ9gmRqhiiCyzqkXIhE2ljj2jh/tzkADfqM7dQ1Vn/nRVEBnl
	LRHSJDTECXAT7jtBpLZHGW4e08evvnmxvcnBcv1NVSlnhNCaJ34i76IV6JJrV4htF7GV2kMiEnX
	lTBGB
X-Gm-Gg: AYBFou24cxxgHJadYmN1KqpTSrAGHy9CxrrEWFLT+t2qA0m/fq7lXFSDFI/HpQZ92JJ
	DRwA8jqS5weYkJoG+UlP93ELDlY+cxgRNZ7gJAD6kZrDbFmXgKYcEEjPtcCo4dnSFzYJVHAVOSw
	dzi2mDURLA6NIV2Oq/AZcuDESoeBZpl0QzF7Erfk/kiDIUxAP6/WYMJ+X/ic8GeQ+EXvH+Nwfkz
	LJfwQVC/Mef8UQVSe4OA48OP7esGKgv87Ap7JB9VkwY87j9rbBnDKLmE16zAApaFGN0/VDuFzHL
	T3Al9/ToYrVXJwzKHVzyZhy7dwhpkwqLx+p8cXJQD77oJmRI1gMo7YB/FP9Ct23IQD2YlThWB+f
	bsmS+iuvx+nNHarcSAOyjn1Qk63lO6zLemF/agTokl9U9g++Gl+sfQicDPCDWbX3RxkNIqG3XI1
	tFb7BCmz4f0bCmIfO/z3/MLyVnJW9OUXk0p1j8xh6IClVRgxCd3HVj+XihspGkPnCHT9v/do60
X-Received: by 2002:a05:6820:618:b0:6d3:abd1:9b90 with SMTP id 006d021491bc7-6dcf63278b7mr1172797eaf.54.1790780865875;
        Wed, 30 Sep 2026 08:07:45 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:f5b4:4d0e:70d:9fba])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-49ded1b53c0sm256295fac.8.2026.09.30.08.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 08:07:45 -0700 (PDT)
Date: Wed, 30 Sep 2026 09:07:42 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Yonghao Zhang <hyz3367@gmail.com>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] remoteproc: core: Fetch the auto-boot firmware only
 once
Message-ID: <ar0lvsu80miGJdGS@p14s>
References: <CANLsYkx5VVWsmhaYfMe_gj7nO-8YpOknMvM7gKZ-xFEbGg_zMg@mail.gmail.com.mbx>
 <20260930064144.645211-1-hyz3367@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930064144.645211-1-hyz3367@gmail.com>

On Wed, Sep 30, 2026 at 02:41:44PM +0800, Yonghao Zhang wrote:
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
> Changes in v2:
> - Fix the order described in the changelog: the callback calls
>   rproc_boot() first and releases the asynchronously fetched image at
>   the end of the callback (Mathieu).
> - Fix typo "proccessor".
> 
>  drivers/remoteproc/remoteproc_core.c | 65 ++++++++--------------------
>  include/linux/remoteproc.h           |  4 +-
>  2 files changed, 21 insertions(+), 48 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 263e12f022ea..f329dc478170 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1662,49 +1662,26 @@ static int rproc_attach(struct rproc *rproc)
>  }
>  
>  /*
> - * take a firmware and boot it up.
> - *
> - * Note: this function is called asynchronously upon registration of the
> - * remote processor (so we must wait until it completes before we try
> - * to unregister the device. one other option is just to use kref here,
> - * that might be cleaner).
> + * Boot or attach the remote processor in the background, on behalf of
> + * rproc_trigger_auto_boot(): rproc_add() runs in probe context and must
> + * not block while the firmware image is read from storage.  rproc_boot()
> + * dispatches on the processor state, so this covers both a firmware boot
> + * and an attach to a processor started by another entity.
> + *
> + * Note: rproc_del() waits for this work to complete with
> + * cancel_work_sync(), so the rproc instance remains valid for the
> + * entire lifetime of this function.
>   */
> -static void rproc_auto_boot_callback(const struct firmware *fw, void *context)
> +static void rproc_boot_work(struct work_struct *work)
>  {
> -	struct rproc *rproc = context;
> +	struct rproc *rproc = container_of(work, struct rproc, boot_work);
>  
>  	rproc_boot(rproc);
> -
> -	release_firmware(fw);
>  }
>  
> -static void rproc_attach_work(struct work_struct *work)
> +static void rproc_trigger_auto_boot(struct rproc *rproc)
>  {
> -	struct rproc *rproc = container_of(work, struct rproc, attach_work);
> -
> -	rproc_boot(rproc);
> -}
> -
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
> +	schedule_work(&rproc->boot_work);
>  }
>  
>  static int rproc_stop(struct rproc *rproc, bool crashed)
> @@ -2348,11 +2325,8 @@ int rproc_add(struct rproc *rproc)
>  	rproc_create_debug_dir(rproc);
>  
>  	/* if rproc is marked always-on, request it to boot */
> -	if (rproc->auto_boot) {
> -		ret = rproc_trigger_auto_boot(rproc);
> -		if (ret < 0)
> -			goto rproc_remove_dev;
> -	}
> +	if (rproc->auto_boot)
> +		rproc_trigger_auto_boot(rproc);

Please get rid of rproc_trigger_auto_boot() and call schedule_work() here.

Thanks,
Mathieu

>  
>  	/* expose to rproc_get_by_phandle users */
>  	mutex_lock(&rproc_list_mutex);
> @@ -2361,10 +2335,6 @@ int rproc_add(struct rproc *rproc)
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
> @@ -2552,7 +2522,7 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>  	INIT_LIST_HEAD(&rproc->subdevs);
>  	INIT_LIST_HEAD(&rproc->dump_segments);
>  
> -	INIT_WORK(&rproc->attach_work, rproc_attach_work);
> +	INIT_WORK(&rproc->boot_work, rproc_boot_work);
>  	INIT_WORK(&rproc->crash_handler, rproc_crash_handler_work);
>  	spin_lock_init(&rproc->crash_handler_lock);
>  
> @@ -2630,6 +2600,9 @@ int rproc_del(struct rproc *rproc)
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
