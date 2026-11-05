Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793870546;
	b=UJD5mQRsBUJfTOZyt5c7JZbN1b9nnq99xfuiZiiSpsY0/JtmGzmGyQcebGe0Ra/pE8dc
	 4s9idJUyLw7yEOvPTo9Wwt7dLmJO54fwgbsv8ey46xWdLxNBw29CW6w1uIJ9ZSkiCLZ9I
	 As3tdv3V8Khp6sJ026KRvPmShBePkQSmlBMVJiu9aFREJ++x1bpoGz9xUESUc5ZOl+a/f
	 aJ3gE5gt+EyQGPOpgNdspVxU8QoIEZwKQvSOqf53UfelJTM08nWnpdetRFusyfmZJ0hs9
	 tvXXZiY5mQqHG2KwdADfV1gCWiTuWFBRUdoGUE/8Qq8Ui8qCxhqrCdzja6pIWPLjmGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793870546;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=0Kd7lcxkbZIwUjBS8lUhNN+9PpJV88FFRkU7HIQmzBg=;
	b=glTOrElsuKr8I/b9IEu+Dx7lmevzB/rmDmduHrYxSWfDyqmf8X/yJJyqSvQ/dOLCvNRj
	 IrsjBPMJ5JoXmETvXWF2UVu7z/He010XVYmuOanLusrjSf1LqZdIfLrORf0Mh0nNb++R7
	 1kjNLt/3sEYx/hGfgcX/S+lRwCLbD4YEZ1WzigM+MxngBtb28OR//Tkd/Lu+8e1T7u/iV
	 GNPwQDSS8Hs2MCzqyuoiXxorn31HByQyVgujabiAq9ZP8KgQgASOav+R6DTfBW7OM/tVF
	 DzIqfV4lsTjyo8/NylbUOxkiCnh4CTZRUGzEop8eAbQu5ldxSK8MWtWH3nHIM8aBSOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ursulin.net;
	spf=pass smtp.mailfrom=ursulin.net;
	dkim=pass header.d=ursulin.net header.i=@ursulin.net header.a=rsa-sha256 header.s=google header.b=CPFYjzjL;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B7D606A337
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:22:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1B7D606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ursulin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ursulin.net header.i=@ursulin.net header.a=rsa-sha256 header.s=google header.b=CPFYjzjL
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so1444821f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 01:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin.net; s=google; t=1793870544; x=1794475344; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Kd7lcxkbZIwUjBS8lUhNN+9PpJV88FFRkU7HIQmzBg=;
        b=CPFYjzjLYeHebGAbv1L68vLvsHyT+d28TzbRhzm+cwW0vWL91576cU/ZAnEIL7k2HQ
         0xpmVRqxlhrU6qY+OP/OlGYekLYyyqis3zXUknKmVJFj5WplPitoSvuTM5fJJkZzOgMM
         gjbbfreZPEQ3o7Wq6dzO5VhXdAEWj7kIwewu+4w0B+R3SApF33UN47M0SZZL2ihhUXWX
         qTPdc0gNc63ciYxk3Jssf560MnOkhBSo9+izWgSR4aTrToUPSfMM+U/8FuxZWwgH06Uj
         1rwJhIzkfIkAddJxZaiPGRzO7Ny78us9kUm733MP5xZU8+o2H87RBJt9Ce+UuapUWPa0
         t7jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793870544; x=1794475344;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Kd7lcxkbZIwUjBS8lUhNN+9PpJV88FFRkU7HIQmzBg=;
        b=hD75PuHdnDz3mBwo48jUejKH4lmu8yVbsY40Df/KhE8p3z1v6TuZrqllBTUr/yCfoQ
         GdzUhQMfrxYDuJqT/qPSZfETODTvaW3qzv/je0RIsO1aXAD7DA7RXyt9OPMP9Kwi6fdM
         dcgRwF2l/kWhY60ZjoKQLXWuQIJToFGqEIMcTLD61erQJWZhk8b0RmuBHxoJfTRnBvf+
         TYuRRUnzktL3aAI34gqkAuvkO+sFR224noI1/oOlQHryRseZ4kI2rhITWx5UmwCYGT2m
         67QL4j/1q7sOtyHmGEP49AVFzpM1fLGsnBwDQBR5zf8DmdqHbhLRdhz87xJwA1o0fjLd
         h+kg==
X-Forwarded-Encrypted: i=1; AKwUvBwFPrGX76KaOWNoBqCFbwddMGmWPiQMWPsPHMXzLKCL23XTaZM2CVz6jAAIdgyd3kIzd500M4cIgP5KjRY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9f6qZBEIHJUI3LUZKHO0sLYEnmM+NgqX+4/4wrxmry5RgtC89v
	SXOo1suRsnEZ+9YvWxts5t9bRVnSWWH6NNDj2J7d38Q5/uyrJBblLJqr5NtIp8CsiBI=
X-Gm-Gg: AYBFou0k/hKFCL3LjAygGyuJWO3YQJYKds9jJ3d0BeCteQmpCKAkRgD+Hy6BmDM8UlS
	/kL8zbhPjs84uLG2YfKJjhyH0mh27o2L8cgpqLlJKMEbEqG9vs7OPajlvNh1oeqVpY5vAZBZSjk
	vrVNfgY4UetEL292sTngI3e3rbV3TzfXEDfjcDyCsuFwtjT2U2blK0LrF7/5OsXyFndtN+0xKIy
	gJzwfS6XcjNNcnJ2J1UO076ezlRCayLSvLqHUQOIwIwmj77kEQa1pdFwnUe67/P+N0v+2nKivkv
	iR9lDrCh2EUAHLORtx8UqaCYAqDAChRuSllcoP4cyjcKV3UINtfwSBSBMgo9/eWed3tr0tDyoL6
	lT6c1bqXaMmYcRnwHI8hkB2O1bsubhwEkhqZxzhwZQ38HDbvxqDtDn1UfJriTHlNRYyW5ZBLhVB
	YcvgoxT0qtiQAL4cgMwKFZuFSEq+qvM6/8I/9/uN/7xdNYoTkmp84dWsAUdwdMc00kIt0F0P5l5
	Xv/ymU9977ipSvFZu6pzJRq7f0u1BQXN5gdYzhgjKPj5bHfeEOQ/9UyuVsGV9f3hPCyaS2pcnL2
	X/vclaCZfHkgBz5Wyox9LTm6nInJjyMFvHPDyZGbhJaq
X-Received: by 2002:a05:6000:4b0b:b0:48d:db77:d124 with SMTP id ffacd0b85a97d-48e6e2db9e1mr40274489f8f.6.1793870543797;
        Thu, 05 Nov 2026 01:22:23 -0800 (PST)
Received: from [192.168.0.116] ([81.79.79.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec9cd43bsm8686341f8f.14.2026.11.05.01.22.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:22:23 -0800 (PST)
Message-ID: <a9f016ce-f086-412d-9ca6-6608a41840e5@ursulin.net>
Date: Thu, 5 Nov 2026 09:22:22 +0000
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
Subject: Re: [PATCH v4] accel/rocket: Report NPU usage through fdinfo
To: Sidong Yang <sidong.yang@furiosa.ai>, Tomeu Vizoso
 <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>
Cc: Gyeyoung Baek <gye976@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261103155338.1949294-1-sidong.yang@furiosa.ai>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20261103155338.1949294-1-sidong.yang@furiosa.ai>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 03/11/2026 15:53, Sidong Yang wrote:
> There is no way to tell how much of the NPU a client uses. Implement the
> DRM usage stats: account the time each job occupies a core and report
> it per client as drm-engine-npu, along with drm_show_memory_stats() for
> the BOs.
> 
> The cores are identical, so they are reported as a single engine with
> drm-engine-capacity-npu set to rdev->max_cores, the number of core
> slots. The time is summed over all cores, with an atomic counter as the
> cores complete jobs concurrently.
> 
> Jobs can outlive the file that submitted them, so the counter is
> refcounted and each job holds a reference. The time covers the whole
> period a job owns a core, so it also includes handling the completion
> interrupt and the gaps between the tasks of a multi-task job.
> 
> Document the keys in the rocket driver documentation.
> 
> Signed-off-by: Sidong Yang <sidong.yang@furiosa.ai>
> ---
> v4: Report a single drm-engine-npu key with drm-engine-capacity-npu,
>      instead of drm-engine-npu0..2, as drm-usage-stats.rst specifies for
>      a group of identical engines, and document the keys (Tomeu Vizoso).
>      The subject no longer says per-core. Gyeyoung's tags are dropped as
>      the accounting changed.
> 
>      Still depends on commit 6eff1d69dae8 ("accel/rocket: search every
>      core slot when a core is removed") for rdev->max_cores.
> 
> v3: Add a rocket_engine_usage_create() helper for the counter
>      allocation in rocket_open(), to pair with
>      rocket_engine_usage_destroy() (Gyeyoung Baek).
> 
> v2: Size the per-core counters by rdev->max_cores, the number of core
>      slots, instead of the number of cores bound when the file is opened.
>      Sashiko reported the out-of-bounds read and Gyeyoung Baek reproduced
>      it with KASAN.
> 
> Link to v3: https://lore.kernel.org/all/20261103104804.1887489-1-sidong.yang@furiosa.ai/
> Link to v2: https://lore.kernel.org/all/20261101152723.1430312-1-sidong.yang@furiosa.ai/
> Link to v1: https://lore.kernel.org/all/20261031083642.1076356-1-sidong.yang@furiosa.ai/
> 
>   Documentation/accel/rocket/index.rst  | 28 +++++++++++
>   Documentation/gpu/drm-usage-stats.rst |  1 +
>   drivers/accel/rocket/rocket_drv.c     | 70 ++++++++++++++++++++++++++-
>   drivers/accel/rocket/rocket_drv.h     | 15 ++++++
>   drivers/accel/rocket/rocket_job.c     |  7 +++
>   drivers/accel/rocket/rocket_job.h     |  4 ++
>   6 files changed, 123 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/accel/rocket/index.rst b/Documentation/accel/rocket/index.rst
> index 70f97bccf100..53c9aa7e2229 100644
> --- a/Documentation/accel/rocket/index.rst
> +++ b/Documentation/accel/rocket/index.rst
> @@ -17,3 +17,31 @@ project.
>   Hardware currently supported:
>   
>   * RK3588
> +
> +.. _rocket-usage-stats:
> +
> +Rocket DRM client usage stats implementation
> +============================================
> +
> +The accel/rocket driver implements the DRM client usage stats specification as
> +documented in :ref:`drm-client-usage-stats`.
> +
> +The NPU cores are reported as a single engine, npu, with a capacity equal to the
> +number of cores. The time is summed over all cores, and covers the whole period
> +a job occupies a core.
> +
> +Example of the output showing the implemented key value pairs:
> +
> +::
> +
> +        pos:	0
> +        flags:	02400002
> +        mnt_id:	33
> +        ino:	749
> +        drm-driver:	rocket
> +        drm-client-id:	246
> +        drm-engine-npu:	2296549300 ns
> +        drm-engine-capacity-npu:	3
> +        drm-total-memory:	24216 KiB
> +        drm-shared-memory:	0
> +        drm-active-memory:	1920 KiB
> diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
> index 70b7cfcc194f..288764730d23 100644
> --- a/Documentation/gpu/drm-usage-stats.rst
> +++ b/Documentation/gpu/drm-usage-stats.rst
> @@ -218,3 +218,4 @@ Driver specific implementations
>   * :ref:`panthor-usage-stats`
>   * :ref:`xe-usage-stats`
>   * :ref:`amdxdna-usage-stats`
> +* :ref:`rocket-usage-stats`
> diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/rocket_drv.c
> index 2bcfe4ab3c68..e22e8623db64 100644
> --- a/drivers/accel/rocket/rocket_drv.c
> +++ b/drivers/accel/rocket/rocket_drv.c
> @@ -3,8 +3,10 @@
>   
>   #include <drm/drm_accel.h>
>   #include <drm/drm_drv.h>
> +#include <drm/drm_file.h>
>   #include <drm/drm_gem.h>
>   #include <drm/drm_ioctl.h>
> +#include <drm/drm_print.h>
>   #include <drm/rocket_accel.h>
>   #include <linux/clk.h>
>   #include <linux/err.h>
> @@ -68,6 +70,38 @@ rocket_iommu_domain_put(struct rocket_iommu_domain *domain)
>   	kref_put(&domain->kref, rocket_iommu_domain_destroy);
>   }
>   
> +static struct rocket_engine_usage *
> +rocket_engine_usage_create(void)
> +{
> +	struct rocket_engine_usage *usage;
> +
> +	usage = kzalloc_obj(*usage);
> +	if (!usage)
> +		return NULL;
> +	kref_init(&usage->kref);
> +
> +	return usage;
> +}
> +
> +static void
> +rocket_engine_usage_destroy(struct kref *kref)
> +{
> +	kfree(container_of(kref, struct rocket_engine_usage, kref));
> +}
> +
> +struct rocket_engine_usage *
> +rocket_engine_usage_get(struct rocket_file_priv *rocket_priv)
> +{
> +	kref_get(&rocket_priv->engine_usage->kref);
> +	return rocket_priv->engine_usage;
> +}
> +
> +void
> +rocket_engine_usage_put(struct rocket_engine_usage *usage)
> +{
> +	kref_put(&usage->kref, rocket_engine_usage_destroy);
> +}
> +
>   static int
>   rocket_open(struct drm_device *dev, struct drm_file *file)
>   {
> @@ -86,10 +120,17 @@ rocket_open(struct drm_device *dev, struct drm_file *file)
>   	}
>   
>   	rocket_priv->rdev = rdev;
> +
> +	rocket_priv->engine_usage = rocket_engine_usage_create();
> +	if (!rocket_priv->engine_usage) {
> +		ret = -ENOMEM;
> +		goto err_free;
> +	}

Glanced over this patch by chance and it very reminded me of 
drm_sched_entity_stats tracking. That object is reference counted by the 
entity so I think it would satisfy your requirements. We would only need 
to add an accessor like drm_sched_entity_get_runtime() and just call it 
from rocket. Thoughts?

Regards,

Tvrtko

> +
>   	rocket_priv->domain = rocket_iommu_domain_create(rdev->cores[0].dev);
>   	if (IS_ERR(rocket_priv->domain)) {
>   		ret = PTR_ERR(rocket_priv->domain);
> -		goto err_free;
> +		goto err_put_engine_usage;
>   	}
>   
>   	file->driver_priv = rocket_priv;
> @@ -109,6 +150,8 @@ rocket_open(struct drm_device *dev, struct drm_file *file)
>   	mutex_destroy(&rocket_priv->mm_lock);
>   	drm_mm_takedown(&rocket_priv->mm);
>   	rocket_iommu_domain_put(rocket_priv->domain);
> +err_put_engine_usage:
> +	rocket_engine_usage_put(rocket_priv->engine_usage);
>   err_free:
>   	kfree(rocket_priv);
>   err_put_mod:
> @@ -125,6 +168,7 @@ rocket_postclose(struct drm_device *dev, struct drm_file *file)
>   	mutex_destroy(&rocket_priv->mm_lock);
>   	drm_mm_takedown(&rocket_priv->mm);
>   	rocket_iommu_domain_put(rocket_priv->domain);
> +	rocket_engine_usage_put(rocket_priv->engine_usage);
>   	kfree(rocket_priv);
>   	module_put(THIS_MODULE);
>   }
> @@ -139,7 +183,28 @@ static const struct drm_ioctl_desc rocket_drm_driver_ioctls[] = {
>   	ROCKET_IOCTL(FINI_BO, fini_bo),
>   };
>   
> -DEFINE_DRM_ACCEL_FOPS(rocket_accel_driver_fops);
> +static void rocket_show_fdinfo(struct drm_printer *p, struct drm_file *file)
> +{
> +	struct rocket_device *rdev = to_rocket_device(file->minor->dev);
> +	struct rocket_file_priv *rocket_priv = file->driver_priv;
> +
> +	/*
> +	 * This is an estimate: the time is taken around the whole period a job
> +	 * occupies a core, so it also covers handling the completion interrupt
> +	 * and, for a job made of several tasks, the gaps between them.
> +	 */
> +	drm_printf(p, "drm-engine-npu:\t%lld ns\n",
> +		   atomic64_read(&rocket_priv->engine_usage->elapsed_ns));
> +	drm_printf(p, "drm-engine-capacity-npu:\t%u\n", rdev->max_cores);
> +
> +	drm_show_memory_stats(p, file);
> +}
> +
> +static const struct file_operations rocket_accel_driver_fops = {
> +	.owner = THIS_MODULE,
> +	DRM_ACCEL_FOPS,
> +	.show_fdinfo = drm_show_fdinfo,
> +};
>   
>   /*
>    * Rocket driver version:
> @@ -150,6 +215,7 @@ static const struct drm_driver rocket_drm_driver = {
>   	.open			= rocket_open,
>   	.postclose		= rocket_postclose,
>   	.gem_create_object	= rocket_gem_create_object,
> +	.show_fdinfo		= rocket_show_fdinfo,
>   	.ioctls			= rocket_drm_driver_ioctls,
>   	.num_ioctls		= ARRAY_SIZE(rocket_drm_driver_ioctls),
>   	.fops			= &rocket_accel_driver_fops,
> diff --git a/drivers/accel/rocket/rocket_drv.h b/drivers/accel/rocket/rocket_drv.h
> index 2c673bb99ccc..495d8b4a4d43 100644
> --- a/drivers/accel/rocket/rocket_drv.h
> +++ b/drivers/accel/rocket/rocket_drv.h
> @@ -16,6 +16,16 @@ struct rocket_iommu_domain {
>   	struct kref kref;
>   };
>   
> +/*
> + * Time the cores have spent running a client's jobs, in nanoseconds, summed over
> + * all cores. Jobs hold a reference, as they can outlive the file that submitted
> + * them.
> + */
> +struct rocket_engine_usage {
> +	struct kref kref;
> +	atomic64_t elapsed_ns;
> +};
> +
>   struct rocket_file_priv {
>   	struct rocket_device *rdev;
>   
> @@ -24,9 +34,14 @@ struct rocket_file_priv {
>   	struct mutex mm_lock;
>   
>   	struct drm_sched_entity sched_entity;
> +
> +	struct rocket_engine_usage *engine_usage;
>   };
>   
>   struct rocket_iommu_domain *rocket_iommu_domain_get(struct rocket_file_priv *rocket_priv);
>   void rocket_iommu_domain_put(struct rocket_iommu_domain *domain);
>   
> +struct rocket_engine_usage *rocket_engine_usage_get(struct rocket_file_priv *rocket_priv);
> +void rocket_engine_usage_put(struct rocket_engine_usage *usage);
> +
>   #endif
> diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/rocket_job.c
> index ce994748dd5d..e613fae133e4 100644
> --- a/drivers/accel/rocket/rocket_job.c
> +++ b/drivers/accel/rocket/rocket_job.c
> @@ -13,6 +13,7 @@
>   #include <linux/iommu.h>
>   #include <linux/platform_device.h>
>   #include <linux/pm_runtime.h>
> +#include <linux/sched/clock.h>
>   
>   #include "rocket_core.h"
>   #include "rocket_device.h"
> @@ -265,6 +266,7 @@ static void rocket_job_cleanup(struct kref *ref)
>   	unsigned int i;
>   
>   	rocket_iommu_domain_put(job->domain);
> +	rocket_engine_usage_put(job->engine_usage);
>   
>   	dma_fence_put(job->done_fence);
>   	dma_fence_put(job->inference_done_fence);
> @@ -351,6 +353,7 @@ static struct dma_fence *rocket_job_run(struct drm_sched_job *sched_job)
>   
>   	scoped_guard(mutex, &core->job_lock) {
>   		core->in_flight_job = job;
> +		job->start_ns = local_clock();
>   		rocket_job_hw_submit(core, job);
>   	}
>   
> @@ -379,6 +382,9 @@ static void rocket_job_handle_irq(struct rocket_core *core)
>   				return;
>   			}
>   
> +			atomic64_add(local_clock() - core->in_flight_job->start_ns,
> +				     &core->in_flight_job->engine_usage->elapsed_ns);
> +
>   			iommu_detach_group(NULL, iommu_group_get(core->dev));
>   			dma_fence_signal(core->in_flight_job->done_fence);
>   			pm_runtime_put_autosuspend(core->dev);
> @@ -587,6 +593,7 @@ static int rocket_ioctl_submit_job(struct drm_device *dev, struct drm_file *file
>   
>   	rjob->rdev = rdev;
>   	rjob->domain = rocket_iommu_domain_get(file_priv);
> +	rjob->engine_usage = rocket_engine_usage_get(file_priv);
>   
>   	ret = drm_sched_job_init(&rjob->base,
>   				 &file_priv->sched_entity,
> diff --git a/drivers/accel/rocket/rocket_job.h b/drivers/accel/rocket/rocket_job.h
> index 4ae00feec3b9..14aa78aebc99 100644
> --- a/drivers/accel/rocket/rocket_job.h
> +++ b/drivers/accel/rocket/rocket_job.h
> @@ -38,6 +38,10 @@ struct rocket_job {
>   
>   	struct rocket_iommu_domain *domain;
>   
> +	/* When the job was handed to a core, and where to account the time */
> +	u64 start_ns;
> +	struct rocket_engine_usage *engine_usage;
> +
>   	struct kref refcount;
>   };
>   
> 
> base-commit: a1e63ab695ad76850ab9787b9eb6aab695dc2965
> prerequisite-patch-id: 519bcdfdde80d902309c8346f749ebc4bb6b29c0

