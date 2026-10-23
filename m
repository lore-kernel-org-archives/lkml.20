Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792761992;
	b=UkEsqebfh4ytpWyJ2RC3cERIfkHopJq0nETixIM1hdC5R+A9NyC96BaeqrS9A9N2GFmB
	 bD78kximA4mRbLicSgjPmPYdv2JP0HF8A+/I80QONzKDDUNcEsiQgT75URzj2ngY8uWFA
	 YMw3uUrJx3D5vYOP3yTdyHZH+LOruqxCCon4U0qSyPZP3Kjh72la43yjxRv4ZLH4Z0+yE
	 xBd6/cJTb0C7hO70PAy0sUtE4FOE8dtLbUigGwsvk8pYQxRhr43q21p5+UvxnsSufPIio
	 OfF/cjTD7X0nTiqdcv99i1yPQt02znaP9mDwt0iTPHiABPpt+/GETejC7aRReoS7ymw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792761992;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=+Twk6q8ntuna0tr4TsvaF3fL8LKiHf7k9KE0IdiL4SA=;
	b=G86KeknKeUUgW9pepE0SyNVzUY3Eh4IoeOraJ7wCblDR2dNeFeatI+dTY/rTKdI3Buyq
	 uvAmvquGumZoOg2FTbs9qYzGE3wOs6/gJuDrupBUrX/Ew17xuWbu95K0us24lWYUXEqaB
	 //Ecl+C4hTnK6YMXUTHkinlh8e/cgfHVY2ZN2VzdFq/aIJ5rbc5oedzaOVlI1nGrOSRGj
	 79KVqjxpGKWH4XFoxz+KUOolBgEzYwSKpd+IS89MKl8/qTIqlfYONO634NU8sNermdJOI
	 b8SqWi0EkEo2vcIlgHUXi7q3l1GYKJfN2CVpsxPz18pJKD01HOBl+dW72iEnz/T2IXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=GhWg4JUu;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF567606A320
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:26:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF567606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=GhWg4JUu
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C9EFF328E
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:26:27 -0700 (PDT)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BE2663F673
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792761991; bh=gU1JPvbbsp+xB9jfFMJRFjxnS4cNlvn1cEM4iP4V4xM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GhWg4JUu3NvY8GJUGASGRGBKnRrbTptm/ucpEdb0f/JiH/uMAxW6mlktWtqi8tI5X
	 T76CTlGrw9u58MpLhOoq3bOG9RcQvlJ0pp7VuRl+SMs2sK1NXPaPCoVvOxGG3KQHpd
	 2SR5qcWtD5Kq9G8s8TDyg2ThFBOFwjl46EunRgKY=
Date: Fri, 23 Oct 2026 14:26:28 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	kernel-dev@igalia.com,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Chia-I Wu <olv@google.com>, Matthew Brost <matthew.brost@intel.com>,
	Steven Price <steven.price@arm.com>, Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH v7 4/4] drm/panthor: Create per queue priority workqueues
Message-ID: <attghL9iz3-PGUiT@e142607>
References: <20261022093848.5727-1-tvrtko.ursulin@igalia.com>
 <20261022093848.5727-5-tvrtko.ursulin@igalia.com>
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
In-Reply-To: <20261022093848.5727-5-tvrtko.ursulin@igalia.com>

On Thu, Oct 22, 2026 at 10:38:48AM +0100, Tvrtko Ursulin wrote:
> Split the single workqueue shared between the driver internal logic and
> DRM scheduler use into separate ones, where the DRM scheduler one is
> created per GPU priority level using the appropriate mapping to
> workqueue priorities.
> 
> Low and medium GPU priority are served by a normal workqueue,
> high is server by a WQ_HIGHPRI instance, while realtime GPU priority is
> using the newly added WQ_RTPRI flag for lowest possible latency.
> 
> These workqueues are device global and for all three we set the maximum
> concurrency to two in order to keep the GPU optimally fed with work.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Chia-I Wu <olv@google.com>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Tejun Heo <tj@kernel.org>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 37 ++++++++++++++++++++++---
>  1 file changed, 33 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 5b34032deff8..257895e5e48b 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -152,11 +152,18 @@ struct panthor_scheduler {
>  	 *
>  	 * Used for the scheduler tick, group update or other kind of FW
>  	 * event processing that can't be handled in the threaded interrupt
> -	 * path. Also passed to the drm_gpu_scheduler instances embedded
> -	 * in panthor_queue.
> +	 * path.
>  	 */
>  	struct workqueue_struct *wq;
>  
> +	/**
> +	 * @submit_wq: Per priority workqueues for the DRM scheduler
> +	 *
> +	 * Passed to the drm_gpu_scheduler instances embedded
> +	 * in panthor_queue based on the queue priority.
> +	 */
> +	struct workqueue_struct *submit_wq[PANTHOR_CSG_PRIORITY_COUNT];
> +
>  	/**
>  	 * @heap_alloc_wq: Workqueue used to schedule tiler_oom works.
>  	 *
> @@ -3582,8 +3589,14 @@ group_create_queue(struct panthor_group *group,
>  		goto err_free_queue;
>  	}
>  
> +	if (group->priority >= ARRAY_SIZE(group->ptdev->scheduler->submit_wq) ||
> +	    !group->ptdev->scheduler->submit_wq[group->priority]) {
> +		ret = -EINVAL;
> +		goto err_free_queue;
> +	}
> +
>  	sched_args.name = queue->name;
> -
> +	sched_args.submit_wq = group->ptdev->scheduler->submit_wq[group->priority];
>  	ret = drm_sched_init(&queue->scheduler, &sched_args);
>  	if (ret)
>  		goto err_free_queue;
> @@ -4073,6 +4086,15 @@ static void panthor_sched_fini(struct drm_device *ddev, void *res)
>  	if (!sched || !sched->csg_slot_count)
>  		return;
>  
> +	if (sched->submit_wq[PANTHOR_CSG_PRIORITY_MEDIUM])
> +		destroy_workqueue(sched->submit_wq[PANTHOR_CSG_PRIORITY_MEDIUM]);
> +
> +	if (sched->submit_wq[PANTHOR_CSG_PRIORITY_HIGH])
> +		destroy_workqueue(sched->submit_wq[PANTHOR_CSG_PRIORITY_HIGH]);
> +
> +	if (sched->submit_wq[PANTHOR_CSG_PRIORITY_RT])
> +		destroy_workqueue(sched->submit_wq[PANTHOR_CSG_PRIORITY_RT]);
> +
>  	if (sched->wq)
>  		destroy_workqueue(sched->wq);
>  
> @@ -4174,7 +4196,14 @@ int panthor_sched_init(struct panthor_device *ptdev)
>  	 */
>  	sched->heap_alloc_wq = alloc_workqueue("panthor-heap-alloc", WQ_UNBOUND, 0);
>  	sched->wq = alloc_workqueue("panthor-csf-sched", WQ_MEM_RECLAIM | WQ_UNBOUND, 0);
> -	if (!sched->wq || !sched->heap_alloc_wq) {
> +	sched->submit_wq[PANTHOR_CSG_PRIORITY_MEDIUM] = alloc_workqueue("panthor-drm", WQ_MEM_RECLAIM | WQ_UNBOUND, 2);
> +	sched->submit_wq[PANTHOR_CSG_PRIORITY_LOW] = sched->submit_wq[PANTHOR_CSG_PRIORITY_MEDIUM];
> +	sched->submit_wq[PANTHOR_CSG_PRIORITY_HIGH] = alloc_workqueue("panthor-drm-high", WQ_HIGHPRI | WQ_MEM_RECLAIM | WQ_UNBOUND, 2);
> +	sched->submit_wq[PANTHOR_CSG_PRIORITY_RT] = alloc_workqueue("panthor-drm-rt", WQ_RT | WQ_MEM_RECLAIM | WQ_UNBOUND, 2);
> +	if (!sched->wq || !sched->heap_alloc_wq ||
> +	    !sched->submit_wq[PANTHOR_CSG_PRIORITY_MEDIUM] ||
> +	    !sched->submit_wq[PANTHOR_CSG_PRIORITY_HIGH] ||
> +	    !sched->submit_wq[PANTHOR_CSG_PRIORITY_RT]) {
>  		panthor_sched_fini(&ptdev->base, sched);
>  		drm_err(&ptdev->base, "Failed to allocate the workqueues");
>  		return -ENOMEM;
> -- 
> 2.56.0
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
