Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792763937;
	b=JGhZpIlkg7aJXLtws4RtWwhjCEfVLVS9YmXXRjDS2GOW4XkIyrBf8jwvW5bH9SC1Q3Nv
	 BpZVFzLxZnwe2M60Z5yWOyIPsJ90WJl0lKMGnOSqN1+zdF99rZhokQJRvxFLMJzTI3uca
	 +kJFunilqeHEtzd2jOloOKesET+If7Pe48PyVjApMkEjZpMUviUkw0r4WKGsqT813D53s
	 YnYZmqjj0TmEsM2z26fNMu2C1M7J3PlaSIH2Ym9z0YHQwa0xKWLH7QhspqjS0thtdLA2J
	 3dMweS7XapuHuuYBUMhvPurkuel6yrPKYIWSxpH9zIKvpT7qlPlKKK7QOshWB+BjvvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792763937;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=5/8eZ1eqwn207XRdBFRDOCKota9Kt12egLt6yNehc/U=;
	b=SbUnHx89ta+LlPPR/dUQT4Fhf+nH+4d4+P6+3rCrO5MRlrdray1a6Qyuu/PwXVb3GWTf
	 e5YD2YqkxDYkvRES7wSW3hGA4toKptmUXEM4U62sQ0qhMHpFkyIDwujw2kGtsyQLYoQJY
	 iR4myt/rIo3NBt7J8rD0icneUQI0O2htxBDd73dgTJWCqlqXbyd9p0BFIewVJIUpha0kt
	 v/cCfYjFtDzMNkvHL/1XYkH2jNRCadVSYXbof1ZguZYo3LdHLuPQN7RqlsVUYs2oDUeSo
	 JQ9uVM4sQ/2enaBB/AqcMlWbTRz/1lGezaK4mnfhgvvydG/PyYs95G7Q5Gu/TFoSjgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=SXItKpMo;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBEAA606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:58:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBEAA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=SXItKpMo
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E196F1C14
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:58:52 -0700 (PDT)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D661C3F673
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792763936; bh=xKoA97gtYFyGQYoGNvmpRHwPabgsxdqPlSj5YP1vDxQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SXItKpMoM/xpQM+HQUi/yIvjoLeB1yFiEMuu4zUifAXzoLbROdbk/x25ElJbN0rss
	 xNfbd2Uc/393oN90rWUHz463rZo19E1UwIgpO6PtMppXAQCOTFzE9eEYaPjL26Fqxb
	 4aNWHk6MvA0c2/aCZIrYdvOLgdB3RoFtS69TO0g8=
Date: Fri, 23 Oct 2026 14:58:43 +0100
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
Subject: Re: [PATCH v7 4/8] drm/panthor: Add panthor perf initialization and
 termination
Message-ID: <attoEwv8OgZ2-l58@e142607>
References: <20261011-panthor-performance-counters-v7-0-12c32495062f@arm.com>
 <20261011-panthor-performance-counters-v7-4-12c32495062f@arm.com>
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
In-Reply-To: <20261011-panthor-performance-counters-v7-4-12c32495062f@arm.com>

On Sun, Oct 11, 2026 at 06:36:51PM +0100, Lukas Zapolskas wrote:
> Added the panthor_perf system initialization and unplug code for
> subsystem-level handling in subsequent patches. Userspace session
> handling is done at the pfile level, via a pool of sessions.
> 
> Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
> ---
>  drivers/gpu/drm/panthor/panthor_device.c |  2 +
>  drivers/gpu/drm/panthor/panthor_device.h |  9 +++-
>  drivers/gpu/drm/panthor/panthor_drv.c    |  9 ++++
>  drivers/gpu/drm/panthor/panthor_perf.c   | 85 ++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_perf.h   |  6 +++
>  5 files changed, 110 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> index 2877d47c6717..535383ef629f 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -95,6 +95,7 @@ void panthor_device_unplug(struct panthor_device *ptdev)
>  	/* Now, try to cleanly shutdown the GPU before the device resources
>  	 * get reclaimed.
>  	 */
> +	panthor_perf_unplug(ptdev);
>  	panthor_sched_unplug(ptdev);
>  	panthor_fw_unplug(ptdev);
>  	panthor_mmu_unplug(ptdev);
> @@ -310,6 +311,7 @@ int panthor_device_init(struct panthor_device *ptdev)
>  
>  err_disable_autosuspend:
>  	pm_runtime_dont_use_autosuspend(ptdev->base.dev);
> +	panthor_perf_unplug(ptdev);
>  
>  err_unplug_sched:
>  	panthor_sched_unplug(ptdev);
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> index d93b182a3d9b..085254a60fc4 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -29,10 +29,11 @@ struct panthor_hw;
>  struct panthor_job;
>  struct panthor_mmu;
>  struct panthor_fw;
> -struct panthor_perfcnt;
>  struct panthor_pwr;
> +struct panthor_perf;
>  struct panthor_vm;
>  struct panthor_vm_pool;
> +struct panthor_perf_pool;
>  
>  /**
>   * struct panthor_soc_data - Panthor SoC Data
> @@ -323,6 +324,9 @@ struct panthor_device {
>  		atomic_t recovery_needed;
>  	} pm;
>  
> +	/** @perf: Performance counter management data. */
> +	struct panthor_perf *perf;
> +
>  	/** @profile_mask: User-set profiling flags for job accounting. */
>  	u32 profile_mask;
>  
> @@ -377,6 +381,9 @@ struct panthor_file {
>  	/** @groups: Scheduling group pool attached to this file. */
>  	struct panthor_group_pool *groups;
>  
> +	/** @sessions: Perf session pool attached to this file. */
> +	struct panthor_perf_pool *sessions;
> +
>  	/** @stats: cycle and timestamp measures for job execution. */
>  	struct panthor_gpu_usage stats;
>  };
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index b6b55b0f2ff5..3e62142d7ebd 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -37,6 +37,7 @@
>  #include "panthor_gpu.h"
>  #include "panthor_heap.h"
>  #include "panthor_mmu.h"
> +#include "panthor_perf.h"
>  #include "panthor_sched.h"
>  
>  /**
> @@ -1635,9 +1636,16 @@ panthor_open(struct drm_device *ddev, struct drm_file *file)
>  	if (ret)
>  		goto err_destroy_vm_pool;
>  
> +	ret = panthor_perf_pool_create(pfile);
> +	if (ret)
> +		goto err_destroy_group_pool;
> +
>  	file->driver_priv = pfile;
>  	return 0;
>  
> +err_destroy_group_pool:
> +	panthor_group_pool_destroy(pfile);
> +
>  err_destroy_vm_pool:
>  	panthor_vm_pool_destroy(pfile);
>  
> @@ -1651,6 +1659,7 @@ panthor_postclose(struct drm_device *ddev, struct drm_file *file)
>  {
>  	struct panthor_file *pfile = file->driver_priv;
>  
> +	panthor_perf_pool_destroy(pfile);
>  	panthor_group_pool_destroy(pfile);
>  	panthor_vm_pool_destroy(pfile);
>  
> diff --git a/drivers/gpu/drm/panthor/panthor_perf.c b/drivers/gpu/drm/panthor/panthor_perf.c
> index cbfe1ca5872d..ba466e22c50d 100644
> --- a/drivers/gpu/drm/panthor/panthor_perf.c
> +++ b/drivers/gpu/drm/panthor/panthor_perf.c
> @@ -3,7 +3,9 @@
>  /* Copyright 2025 Arm ltd. */
>  
>  #include <linux/bitops.h>
> +#include <drm/drm_managed.h>
>  #include <drm/panthor_drm.h>
> +#include <drm/drm_print.h>
>  
>  #include "panthor_device.h"
>  #include "panthor_fw.h"
> @@ -23,11 +25,26 @@
>   */
>  #define PANTHOR_HW_COUNTER_SIZE (sizeof(u32))
>  
> +#define MAX_SESSIONS_PER_FILE 1
> +
>  struct panthor_perf_counter_block {
>  	struct drm_panthor_perf_block_header header;
>  	u64 counters[];
>  };
>  
> +struct panthor_perf {
> +	/** @info: Pointer to the previously initialized perf info. */
> +	struct drm_panthor_perf_info *info;
> +};
> +
> +struct panthor_perf_pool {
> +	/** @session_range: The number of sessions supported at a time. */
> +	struct xa_limit session_range;
> +
> +	/** @xa: Xarray used to manage session handles. */
> +	struct xarray xa;
> +};
> +
>  static size_t get_annotated_block_size(size_t counters_per_block)
>  {
>  	return struct_size_t(struct panthor_perf_counter_block, counters, counters_per_block);
> @@ -74,14 +91,82 @@ static void panthor_perf_info_init(struct panthor_device *const ptdev)
>   * panthor_perf_init - Initialize the performance counter subsystem.
>   * @ptdev: Panthor device
>   *
> + * The performance counters require the FW interface to be available to setup the
> + * sampling ringbuffers, so this must be called only after FW is initialized.
> + *
>   * Return: 0 on success, negative error code on failure.
>   */
>  int panthor_perf_init(struct panthor_device *ptdev)
>  {
> +	struct panthor_perf *perf;
> +	int ret = 0;
> +
>  	if (!ptdev)
>  		return -EINVAL;
>  
>  	panthor_perf_info_init(ptdev);
>  
> +	perf = drmm_kzalloc(&ptdev->base, sizeof(*perf), GFP_KERNEL);
> +	if (!perf)
> +		return -ENOMEM;
> +
> +	drm_info(&ptdev->base, "Performance counter subsystem initialized");
> +
> +	perf->info = &ptdev->perf_info;
> +	ptdev->perf = perf;
> +
> +	return ret;
> +}
> +
> +/**
> + * panthor_perf_unplug - Terminate the performance counter subsystem.
> + * @ptdev: Panthor device.
> + *
> + * Release the performance counter hardware resources. The control structure is
> + * released with the DRM device.
> + */
> +void panthor_perf_unplug(struct panthor_device *ptdev)
> +{
> +	struct panthor_perf *perf = ptdev->perf;
> +
> +	if (!perf)
> +		return;
> +
> +	ptdev->perf = NULL;
> +}
> +
> +int panthor_perf_pool_create(struct panthor_file *pfile)
> +{
> +	struct panthor_perf_pool *pool;
> +
> +	pool = kzalloc_obj(*pool);
> +	if (!pool)
> +		return -ENOMEM;
> +
> +	xa_init_flags(&pool->xa, XA_FLAGS_ALLOC);
> +
> +	pool->session_range.min = 0;
> +	pool->session_range.max = MAX_SESSIONS_PER_FILE - 1;
> +
> +	pfile->sessions = pool;
> +
>  	return 0;
>  }
> +
> +void panthor_perf_pool_destroy(struct panthor_file *pfile)
> +{
> +	struct panthor_perf_pool *pool = pfile->sessions;
> +
> +	if (IS_ERR_OR_NULL(pool))
> +		return;
> +
> +	if (!xa_empty(&pool->xa)) {
> +		drm_err(&pfile->ptdev->base,
> +			"Performance counter sessions active when unplugging the driver!");
> +	}
> +
> +	xa_destroy(&pool->xa);
> +	kfree(pool);
> +
> +	pfile->sessions = NULL;
> +}
> diff --git a/drivers/gpu/drm/panthor/panthor_perf.h b/drivers/gpu/drm/panthor/panthor_perf.h
> index 3c32c24c164c..ad01fc88f18f 100644
> --- a/drivers/gpu/drm/panthor/panthor_perf.h
> +++ b/drivers/gpu/drm/panthor/panthor_perf.h
> @@ -8,8 +8,14 @@
>  #include <linux/types.h>
>  
>  struct panthor_device;
> +struct panthor_file;
> +struct panthor_perf_pool;
> +
> +int panthor_perf_pool_create(struct panthor_file *pfile);
> +void panthor_perf_pool_destroy(struct panthor_file *pfile);
>  
>  int panthor_perf_init(struct panthor_device *ptdev);
> +void panthor_perf_unplug(struct panthor_device *ptdev);
>  
>  #endif /* __PANTHOR_PERF_H__ */

Now the panthor_perf.h file is sizeable enough to merit its existence. Maybe
we should have 1/8 + 3/8 + 4/8 together in one big happy patch?

Code looks good to me, so:

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

>  
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
