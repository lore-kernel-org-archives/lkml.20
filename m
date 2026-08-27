Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AABA47F791
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 15:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787844036; cv=none; b=i2sXedtaC0V5amOak5h65+9J+snvo/2juau8i9HTjD1A750u7gJuXkdLEaqrQSNC3gIEg0Hk1AiNKUxyaAsBpmRKjq5vsb8cfrtpr0v0g3nxZXQH/xcElzLulwU1mDAkhtsVRcSe5kGXV+2vDyzDoFz9WmjGucEujmsQRBwcUoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787844036; c=relaxed/simple;
	bh=guA22aR5n/GaxPCRi65Ve4BEhi6vdqixdPS9r4RVKHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LvfLjcdOMTuRFDjluzTyz9p0iemzlgGarH+BOz9kbzAnbfXNp4ZyosO4hEKt/HRQbAAl4F+75h4H/dC4XQ8MB58hAqSYFotbzJhyM2O4PsWmaigyfggPbLu8gfxwz76zAHzKEi8BJeCIT9DS7ADqI01bHOHZyGmqSJwc3lnAYAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=UdAdUbfI; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="UdAdUbfI"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CD2C31684
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:20:28 -0700 (PDT)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 65F963F66F
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787844032; bh=guA22aR5n/GaxPCRi65Ve4BEhi6vdqixdPS9r4RVKHg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UdAdUbfI1hFTZLAfHWBHe85BHkV7X0+npcoLcqP4RpvTK1eY4l4DVCZ54u/ejAVB8
	 wLZlqC3rsWUSF3LCRACsaKQB5wxao1JMUA74q7dZIblCWr0Lnw9c3OkT2TP+3xigKI
	 +CdDK5x7evRerrHJxm3PYddKbs1aSvtsRqtO6S70=
Date: Thu, 27 Aug 2026 16:20:21 +0100
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
Subject: Re: [PATCH v4 05/18] drm/panthor: Make the page table cache and
 cleanup workqueue device-local
Message-ID: <apBVtYhaFk4cHNTH@e142607>
References: <20260826-panthor-unplug-fixes-v4-0-982cc8f4234b@collabora.com>
 <20260826-panthor-unplug-fixes-v4-5-982cc8f4234b@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260826-panthor-unplug-fixes-v4-5-982cc8f4234b@collabora.com>

On Wed, Aug 26, 2026 at 04:56:04PM +0200, Boris Brezillon wrote:
> There's no clue that we'll ever have an SoC with multiple Mali GPUs,
> and even then, the gains of sharing the PT caches and cleanup workqueue
> remains unclear.
> 
> On the other hand, binding those resources to the device allows us to
> detect leaks or UAF at drm_device removal time instead of when the
> module is removed.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  drivers/gpu/drm/panthor/panthor_device.c | 17 ++++---
>  drivers/gpu/drm/panthor/panthor_device.h |  8 ++++
>  drivers/gpu/drm/panthor/panthor_drv.c    | 47 +------------------
>  drivers/gpu/drm/panthor/panthor_mmu.c    | 78 +++++++++++++++-----------------
>  drivers/gpu/drm/panthor/panthor_mmu.h    |  3 --
>  drivers/gpu/drm/panthor/panthor_sched.c  |  4 +-
>  6 files changed, 58 insertions(+), 99 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> index 133e3895cd0a..08bb4d410941 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -131,12 +131,9 @@ static void panthor_device_unplug_work(struct work_struct *work)
>  	panthor_device_unplug(ptdev);
>  }
>  
> -static void panthor_device_reset_cleanup(struct drm_device *ddev, void *data)
> +static void destroy_wq(struct drm_device *ddev, void *wq)
>  {
> -	struct panthor_device *ptdev = container_of(ddev, struct panthor_device, base);
> -
> -	disable_work_sync(&ptdev->reset.work);
> -	destroy_workqueue(ptdev->reset.wq);
> +	destroy_workqueue(wq);
>  }
>  
>  static void panthor_device_reset_work(struct work_struct *work)
> @@ -242,7 +239,15 @@ int panthor_device_init(struct panthor_device *ptdev)
>  	if (!ptdev->reset.wq)
>  		return -ENOMEM;
>  
> -	ret = drmm_add_action_or_reset(&ptdev->base, panthor_device_reset_cleanup, NULL);
> +	ret = drmm_add_action_or_reset(&ptdev->base, destroy_wq, ptdev->reset.wq);
> +	if (ret)
> +		return ret;
> +
> +	ptdev->cleanup_wq =  alloc_workqueue("panthor-cleanup", WQ_UNBOUND, 0);
> +	if (!ptdev->cleanup_wq)
> +		return -ENOMEM;
> +
> +	ret = drmm_add_action_or_reset(&ptdev->base, destroy_wq, ptdev->cleanup_wq);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> index 217eec811bdb..a7ea475fb407 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -327,6 +327,14 @@ struct panthor_device {
>  		atomic_t recovery_needed;
>  	} pm;
>  
> +	/**
> +	 * @cleanup_wq: Workqueue used for cleanup operations.
> +	 *
> +	 * We create a dedicated workqueue so we can flush on unplug and
> +	 * make sure all resources are freed before we finish the unplug.
> +	 */
> +	struct workqueue_struct *cleanup_wq;
> +
>  	/** @profile_mask: User-set profiling flags for job accounting. */
>  	u32 profile_mask;
>  
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index 46a3080b0b20..67db6701699b 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -1904,52 +1904,7 @@ static struct platform_driver panthor_driver = {
>  		.dev_groups = panthor_groups,
>  	},
>  };
> -
> -/*
> - * Workqueue used to cleanup stuff.
> - *
> - * We create a dedicated workqueue so we can drain on unplug and
> - * make sure all resources are freed before the module is unloaded.
> - */
> -struct workqueue_struct *panthor_cleanup_wq;
> -
> -static int __init panthor_init(void)
> -{
> -	int ret;
> -
> -	ret = panthor_mmu_pt_cache_init();
> -	if (ret)
> -		return ret;
> -
> -	panthor_cleanup_wq = alloc_workqueue("panthor-cleanup", WQ_UNBOUND, 0);
> -	if (!panthor_cleanup_wq) {
> -		pr_err("panthor: Failed to allocate the workqueues");
> -		ret = -ENOMEM;
> -		goto err_mmu_pt_cache_fini;
> -	}
> -
> -	ret = platform_driver_register(&panthor_driver);
> -	if (ret)
> -		goto err_destroy_cleanup_wq;
> -
> -	return 0;
> -
> -err_destroy_cleanup_wq:
> -	destroy_workqueue(panthor_cleanup_wq);
> -
> -err_mmu_pt_cache_fini:
> -	panthor_mmu_pt_cache_fini();
> -	return ret;
> -}
> -module_init(panthor_init);
> -
> -static void __exit panthor_exit(void)
> -{
> -	platform_driver_unregister(&panthor_driver);
> -	destroy_workqueue(panthor_cleanup_wq);
> -	panthor_mmu_pt_cache_fini();
> -}
> -module_exit(panthor_exit);
> +module_platform_driver(panthor_driver);
>  
>  MODULE_AUTHOR("Panthor Project Developers");
>  MODULE_DESCRIPTION("Panthor DRM Driver");
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index 1385ee28bee5..b4e41556247a 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -61,6 +61,16 @@ struct panthor_mmu {
>  	/** @irq: The MMU irq. */
>  	struct panthor_irq irq;
>  
> +	/**
> +	 * @pt_cache: Cache used to allocate MMU page tables.
> +	 *
> +	 * The pre-allocation pattern forces us to over-allocate to plan for
> +	 * the worst case scenario, and return the pages we didn't use.
> +	 *
> +	 * Having a kmem_cache allows us to speed allocations.
> +	 */
> +	struct kmem_cache *pt_cache;
> +
>  	/**
>  	 * @as: Address space related fields.
>  	 *
> @@ -440,16 +450,6 @@ struct panthor_vm_bind_job {
>  	struct panthor_vm_op_ctx ctx;
>  };
>  
> -/*
> - * @pt_cache: Cache used to allocate MMU page tables.
> - *
> - * The pre-allocation pattern forces us to over-allocate to plan for
> - * the worst case scenario, and return the pages we didn't use.
> - *
> - * Having a kmem_cache allows us to speed allocations.
> - */
> -static struct kmem_cache *pt_cache;
> -
>  /**
>   * alloc_pt() - Custom page table allocator
>   * @cookie: Cookie passed at page table allocation time.
> @@ -530,7 +530,7 @@ static void free_pt(void *cookie, void *data, size_t size)
>  		return;
>  
>  	/* Return the page to the pt_cache. */
> -	kmem_cache_free(pt_cache, data);
> +	kmem_cache_free(vm->ptdev->mmu->pt_cache, data);
>  }
>  
>  static int wait_ready(struct panthor_device *ptdev, u32 as_nr)
> @@ -1179,7 +1179,8 @@ static void panthor_vm_cleanup_op_ctx(struct panthor_vm_op_ctx *op_ctx,
>  				     !op_ctx->map.bo;
>  
>  	if (remaining_pt_count) {
> -		kmem_cache_free_bulk(pt_cache, remaining_pt_count,
> +		kmem_cache_free_bulk(vm->ptdev->mmu->pt_cache,
> +				     remaining_pt_count,
>  				     op_ctx->rsvd_page_tables.pages +
>  				     op_ctx->rsvd_page_tables.ptr);
>  	}
> @@ -1279,7 +1280,8 @@ static void panthor_vm_init_op_ctx(struct panthor_vm_op_ctx *op_ctx,
>  	op_ctx->va.addr = va;
>  }
>  
> -static int panthor_vm_op_ctx_prealloc_pts(struct panthor_vm_op_ctx *op_ctx)
> +static int panthor_vm_op_ctx_prealloc_pts(struct panthor_device *ptdev,
> +					  struct panthor_vm_op_ctx *op_ctx)
>  {
>  	u64 size = op_ctx->va.range;
>  	u64 va = op_ctx->va.addr;
> @@ -1298,7 +1300,7 @@ static int panthor_vm_op_ctx_prealloc_pts(struct panthor_vm_op_ctx *op_ctx)
>  	if (!op_ctx->rsvd_page_tables.pages)
>  		return -ENOMEM;
>  
> -	if (!kmem_cache_alloc_bulk(pt_cache, GFP_KERNEL, pt_count,
> +	if (!kmem_cache_alloc_bulk(ptdev->mmu->pt_cache, GFP_KERNEL, pt_count,
>  				   op_ctx->rsvd_page_tables.pages)) {
>  		op_ctx->rsvd_page_tables.count = 0;
>  		return -ENOMEM;
> @@ -1385,7 +1387,7 @@ static int panthor_vm_prepare_map_op_ctx(struct panthor_vm_op_ctx *op_ctx,
>  	op_ctx->map.vm_bo = drm_gpuvm_bo_obtain_prealloc(preallocated_vm_bo);
>  	op_ctx->map.bo_offset = op->bo_offset;
>  
> -	ret = panthor_vm_op_ctx_prealloc_pts(op_ctx);
> +	ret = panthor_vm_op_ctx_prealloc_pts(vm->ptdev, op_ctx);
>  	if (ret)
>  		goto err_cleanup;
>  
> @@ -1444,8 +1446,9 @@ static int panthor_vm_prepare_unmap_op_ctx(struct panthor_vm_op_ctx *op_ctx,
>  			goto err_cleanup;
>  		}
>  
> -		if (!kmem_cache_alloc_bulk(pt_cache, GFP_KERNEL, pt_count,
> -				op_ctx->rsvd_page_tables.pages)) {
> +		if (!kmem_cache_alloc_bulk(vm->ptdev->mmu->pt_cache,
> +					   GFP_KERNEL, pt_count,
> +					   op_ctx->rsvd_page_tables.pages)) {
>  			ret = -ENOMEM;
>  			goto err_cleanup;
>  		}
> @@ -2580,7 +2583,7 @@ static int remap_evicted_vma(struct drm_gpuvm_bo *vm_bo,
>  	bool found = false;
>  	int ret;
>  
> -	ret = panthor_vm_op_ctx_prealloc_pts(op_ctx);
> +	ret = panthor_vm_op_ctx_prealloc_pts(vm->ptdev, op_ctx);
>  	if (ret)
>  		goto out_cleanup;
>  
> @@ -2821,7 +2824,7 @@ panthor_vm_bind_free_job(struct drm_sched_job *sched_job)
>  	/* Do the heavy cleanups asynchronously, so we're out of the
>  	 * dma-signaling path and can acquire dma-resv locks safely.
>  	 */
> -	queue_work(panthor_cleanup_wq, &job->cleanup_op_ctx_work);
> +	queue_work(job->vm->ptdev->cleanup_wq, &job->cleanup_op_ctx_work);
>  }
>  
>  static enum drm_gpu_sched_stat
> @@ -3372,7 +3375,7 @@ void panthor_mmu_unplug(struct panthor_device *ptdev)
>  	 * otherwise those might access objects that are gone if the work is
>  	 * executed after other components are unplugged.
>  	 */
> -	flush_workqueue(panthor_cleanup_wq);
> +	flush_workqueue(ptdev->cleanup_wq);
>  }
>  
>  static void panthor_mmu_release_wq(struct drm_device *ddev, void *res)
> @@ -3385,6 +3388,11 @@ static void panthor_mmu_info_init(struct panthor_device *ptdev)
>  	ptdev->mmu_info.page_size_bitmap = SZ_4K | SZ_2M;
>  }
>  
> +static void free_pt_cache(struct drm_device *, void *pt_cache)
> +{
> +	kmem_cache_destroy(pt_cache);
> +}
> +
>  /**
>   * panthor_mmu_init() - Initialize the MMU logic.
>   * @ptdev: Device.
> @@ -3414,6 +3422,14 @@ int panthor_mmu_init(struct panthor_device *ptdev)
>  	if (ret)
>  		return ret;
>  
> +	mmu->pt_cache = kmem_cache_create("panthor-mmu-pt", SZ_4K, SZ_4K, 0, NULL);
> +	if (!mmu->pt_cache)
> +		return -ENOMEM;
> +
> +	ret = drmm_add_action_or_reset(&ptdev->base, free_pt_cache, mmu->pt_cache);
> +	if (ret)
> +		return ret;
> +
>  	mmu->iomem = ptdev->iomem + MMU_AS_BASE;
>  	ptdev->mmu = mmu;
>  
> @@ -3498,25 +3514,3 @@ void panthor_mmu_debugfs_init(struct drm_minor *minor)
>  				 minor->debugfs_root, minor);
>  }
>  #endif /* CONFIG_DEBUG_FS */
> -
> -/**
> - * panthor_mmu_pt_cache_init() - Initialize the page table cache.
> - *
> - * Return: 0 on success, a negative error code otherwise.
> - */
> -int panthor_mmu_pt_cache_init(void)
> -{
> -	pt_cache = kmem_cache_create("panthor-mmu-pt", SZ_4K, SZ_4K, 0, NULL);
> -	if (!pt_cache)
> -		return -ENOMEM;
> -
> -	return 0;
> -}
> -
> -/**
> - * panthor_mmu_pt_cache_fini() - Destroy the page table cache.
> - */
> -void panthor_mmu_pt_cache_fini(void)
> -{
> -	kmem_cache_destroy(pt_cache);
> -}
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.h b/drivers/gpu/drm/panthor/panthor_mmu.h
> index 3522fbbce369..de6b4ee4e41a 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.h
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.h
> @@ -104,9 +104,6 @@ void panthor_vm_update_resvs(struct panthor_vm *vm, struct drm_exec *exec,
>  			     enum dma_resv_usage private_usage,
>  			     enum dma_resv_usage extobj_usage);
>  
> -int panthor_mmu_pt_cache_init(void);
> -void panthor_mmu_pt_cache_fini(void);
> -
>  #ifdef CONFIG_DEBUG_FS
>  void panthor_mmu_debugfs_init(struct drm_minor *minor);
>  #endif
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index a6d57dc1b43e..4ea16b40d6b9 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -972,7 +972,7 @@ static void group_release(struct kref *kref)
>  	drm_WARN_ON(&ptdev->base, !list_empty(&group->run_node));
>  	drm_WARN_ON(&ptdev->base, !list_empty(&group->wait_node));
>  
> -	queue_work(panthor_cleanup_wq, &group->release_work);
> +	queue_work(ptdev->cleanup_wq, &group->release_work);
>  }
>  
>  static void group_put(struct panthor_group *group)
> @@ -4054,7 +4054,7 @@ void panthor_sched_unplug(struct panthor_device *ptdev)
>  	 * otherwise those might access objects that are gone if the work is
>  	 * executed after other components are unplugged.
>  	 */
> -	flush_workqueue(panthor_cleanup_wq);
> +	flush_workqueue(ptdev->cleanup_wq);
>  }
>  
>  static void panthor_sched_fini(struct drm_device *ddev, void *res)
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
