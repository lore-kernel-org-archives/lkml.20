Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45AE7317164
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790953852; cv=none; b=USvfouj+8JBIKtJh7FIaTqJ53rMo01pI+bsDBqK2fjBhgTd3SbSMvqasvcnJ/9qOK60A8ebaJYD6w3K7ZaBQoNMpdGdaPz/aRB90uuWSNWYXEtK+IksMBf08XMYK5eac6uxdeGfNNbkyx/DlepR1Fh9ThEBiWonuvEJuVDou9NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790953852; c=relaxed/simple;
	bh=1TOs3zrdvcZvl9aOJu5iWNnu5dQVQ/Bo9xc1UCJwysY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ALv3v5qeAUaK7NFCiplr3shvvrryV8bFLA3No5xgciFFcKM45V0H0Zo0s7C9qXpJfaEiqo/bjWtyaNHGc0t4yJT+Eogkn634nhInU6kH0fsgqhS8EYkaWAcMKJDLwBD5pcjPecvlcKZXAkWtt/zAwnD+Wc4qS+UHhZWuy6tW/J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=qJruf9MI; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="qJruf9MI"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 18D2C169C;
	Fri,  2 Oct 2026 08:10:46 -0700 (PDT)
Received: from [10.0.129.26] (e122027.cambridge.arm.com [10.0.129.26])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E3BA73F85F;
	Fri,  2 Oct 2026 08:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790953849; bh=1TOs3zrdvcZvl9aOJu5iWNnu5dQVQ/Bo9xc1UCJwysY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qJruf9MIlnQGbwTRokIQRZDe55e+opyfx3rUu9MlrDxEIF1ckVS2m7PG2OSm1qPU+
	 /YcMyF+Wv1Q8s7LAaE30s7rkpUUziUcF2L0kYE74kukd6cSpwMPUnVDKK7nlwQO1RO
	 xnfAHmnxhEVI28eO7/48GMPJL7hX3P8rDRI9llXc=
Message-ID: <1930451a-97e7-4029-91b4-45989e954d7a@arm.com>
Date: Fri, 2 Oct 2026 16:10:43 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 10/15] drm/panfrost: Add debugfs knob for manually
 triggering a GPU reset
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
References: <20260929-claude-fixes-v12-0-62beb08de207@collabora.com>
 <20260929-claude-fixes-v12-10-62beb08de207@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20260929-claude-fixes-v12-10-62beb08de207@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/09/2026 04:44, Adrián Larumbe wrote:
> This will be of great help when testing potential races between the GPU
> reset sequence and other parts of the code accessing HW registers.
> 
> We must also disable the reset work item rather than simply cancelling
> it, to prevent the knob from triggering another reset when the device
> is being removed.
> 
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_device.c | 42 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/panfrost/panfrost_job.c    |  2 +-
>  2 files changed, 43 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
> index 09a5752a3f40..94d2de341838 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
> @@ -2,6 +2,7 @@
>  /* Copyright 2018 Marty E. Plummer <hanetzer@startmail.com> */
>  /* Copyright 2019 Linaro, Ltd, Rob Herring <robh@kernel.org> */
>  
> +#include <linux/debugfs.h>
>  #include <linux/clk.h>
>  #include <linux/reset.h>
>  #include <linux/platform_device.h>
> @@ -595,9 +596,50 @@ EXPORT_GPL_DEV_PM_OPS(panfrost_pm_ops) = {
>  };
>  
>  #ifdef CONFIG_DEBUG_FS
> +static int reset_get(void *data, u64 *val)
> +{
> +	struct panfrost_device *pfdev =
> +		container_of(data, struct panfrost_device, base);
> +
> +	*val = atomic_read(&pfdev->reset.pending);
> +	return 0;
> +}
> +
> +static int reset_set(void *data, u64 val)
> +{
> +	struct panfrost_device *pfdev =
> +		container_of(data, struct panfrost_device, base);
> +	int ret = pm_runtime_get_if_active(pfdev->base.dev);
> +
> +	if (!ret)
> +		return 0;
> +
> +	panfrost_device_schedule_reset(pfdev);
> +	flush_work(&pfdev->reset.work);
> +
> +	/* ret < 0 means runtime PM for the device is disabled, so we
> +	 * only need to return the PM reference in the opposite case
> +	 */
> +	if (ret > 0)
> +		pm_runtime_put(pfdev->base.dev);
> +
> +	return 0;
> +}

NIT: If this wasn't debugfs I'd be complaining that you're ignoring
'val' and so this isn't very extensible. But hey, it's debugfs... so:

Reviewed-by: Steven Price <steven.price@arm.com>

> +
> +DEFINE_DEBUGFS_ATTRIBUTE(panfrost_reset_debugfs_fops,
> +			 reset_get, reset_set,
> +			 "0x%08llx\n");
> +
> +static void panfrost_reset_debugfs_init(struct drm_minor *minor)
> +{
> +	debugfs_create_file("reset", 0600, minor->debugfs_root,
> +			    minor->dev, &panfrost_reset_debugfs_fops);
> +}
> +
>  void panfrost_device_debugfs_init(struct drm_minor *minor)
>  {
>  	panfrost_gem_debugfs_init(minor);
>  	panfrost_sched_debugfs_init(minor);
> +	panfrost_reset_debugfs_init(minor);
>  }
>  #endif // CONFIG_DEBUG_FS
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index 00fb36c577df..ab65786bf63b 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -932,7 +932,7 @@ void panfrost_jm_fini(struct panfrost_device *pfdev)
>  		drm_sched_fini(&js->queue[j].sched);
>  	}
>  
> -	cancel_work_sync(&pfdev->reset.work);
> +	disable_work_sync(&pfdev->reset.work);
>  	destroy_workqueue(pfdev->reset.wq);
>  }
>  
> 

