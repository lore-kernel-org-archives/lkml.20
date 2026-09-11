Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D023CA487
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789114662; cv=none; b=b8+UDfXMIA6Ntt1rVDeuT0JTw3XGijfkQSw5xJwPCd3gmDWIBdv4m0ZefxiOzhXTmBX5nqbMaZVLiblZggsx1x9J4CwXRoDAMk3YPwyHeRyQjfK+w/tK77FcEAmHLaCbiNs3OkiSess3zlNh8Kwx5+UTKnHW5jviT/XojHhuEVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789114662; c=relaxed/simple;
	bh=vrG7w898neHIion3SrAQpePKw8Db83j3Yo7alE3br4A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fa6Yz2AEnK0pMfz1ZogkTjfor/34Dh5ypl5GdmtvUtRjc2aB6at/6VyiiHwcYpPz9nJckS8iewYktsU385Mpfl7TEatM1w5btGEEjETHBMW4+ZfZnNnkb0PnFK2nHZgXg1MYiiL2HA3tD0L/2E/B7Mq5h6m9EqMB/XTn8rVkrmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net; spf=pass smtp.mailfrom=ursulin.net; dkim=pass (2048-bit key) header.d=ursulin.net header.i=@ursulin.net header.b=uJ+e2ZWE; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ursulin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ursulin.net header.i=@ursulin.net header.b="uJ+e2ZWE"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49d05d51553so6048285e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 01:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin.net; s=google; t=1789114658; x=1789719458; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gpMO1e/RcSP1LoDsgyM/yn6wtLOUfvFeuo8LdPbJ/08=;
        b=uJ+e2ZWExFafNKvbVHvqRjGLmbLz+XuFH1A0mlipAK1lKgqpnXOoxhsjask7kva7NZ
         Y7RLXzNVF3LJXS30h2UcMfyC11eJcxWKPJwfFq6itrVqNVcdJNR9FCYFHJ2Eo+LzojnI
         sJ5dzwLaTIlu/bmAk3J9H8/v3CeBpeW9qZXg36pCXZVlUSoJeB+3GRzdurAABNxEA8m3
         hJ1nwc5I6IzNnS9I+XoABWuDuP+SRR6nBzAkqDnzsnkonLeY2BhURqhIG7iZ+IsvJYzN
         D6z5MwsBmmTiZg6z68VLUfTQRqGuKnLmRLZy3N54nQs4hJY5KA16cItBRPjOdptNOcXU
         e3Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789114658; x=1789719458;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gpMO1e/RcSP1LoDsgyM/yn6wtLOUfvFeuo8LdPbJ/08=;
        b=LWoFtPu9EoEQ3Fi4Qxm1JBTdtP5V35a0hmvJQEgmeazNoTmLcXRtfDdsOTRwSElwv7
         8c7onoTzKTcGPB8JbqtGeu8wEnkWyn8aAHDiWoOZVvny/eUmUCPKxiFoSxiy9SQzhKA2
         KpwsZsFRFPxMKiODKaZhG921v47W2szKs+Gu7CWgfau68HjWcWk+2BYfYefkxJmNPaFk
         V2+CMEK3iCMB6malXjQ7FNZbkM55G7y319rm3yC+kexOrhNC08BLRSn/wqJ3sdQPp/+O
         9W/e7lQOHVv64bx9REvq5YFfl6DxU7O/0Ys+EWmhGigOFwh6K7DrvgCTNv/qQ4R8vMZw
         bGwQ==
X-Forwarded-Encrypted: i=1; AKwUvBwhfRut1bDdv+wXIyuPerPW5KaKi7G05oxeyVzOGktEBa+kAOyfLHtvo9CGLxl4GJUk9prmQpMpeTu7iCc=@vger.kernel.org
X-Gm-Message-State: AFuF++mX2ZA9iCBECh9+JSY4HjNnf6jyh+syJFVjmVBSYTzw85O+cBIW
	9qgSUbU19yF6EtcIKNi+IhoHPwP3Mf0NH8ZCsJQoLVWrKwhstVgtdNkJCJdg5i3zSao=
X-Gm-Gg: AYBFou10EoL6/LXPwvNYmd9txnPR3AvdHlgwU0kkNlqz2tsmd9WBWxnDkQk+7UYAgJ8
	AXNr+3WNY/iRlREFDxPhJfQBqVNcijrE3LfEBZuGtvyygqhDH4w7xtM/jjsfAO3DzJnyyI7AOG0
	K917mX4ptex1LwRQ9/akpkU02cMXIgIkU1Xr/KPLZD5UKiqU0J2gxU29cDvDxLw0L3QMxEs4ufV
	UYgEHpsp0SY1mSArmidhM5slWLUk9goDRNUdjTwT1pCQQxqWGJxtS0F/LS26BA01GN0MJZkfpFp
	me/eCEmVCXq9Xm/KG57fi69cdmLkRsHVnrBxhyKE6XKni9MO6LzDGX8+uEaKQIbF2Jo4UOdtoWD
	cU3UdoMzarxxBFVKlRJbzuJpQI+stx1hWAlsjDfD2MwbUqwKIfFIO4Y3qZGepUWkVT7ITm6kkws
	UsuKnpbeMoO+xc20RuZ3JvZHucRHD/oP9ckQ3lIMESQd7xxreJsERYB2jzydMJA7mfp2olFM8UX
	SfIIs8Tv6Dx/UA=
X-Received: by 2002:a05:600c:46cc:b0:49c:fc6e:a3d9 with SMTP id 5b1f17b1804b1-49e619cc71bmr30851555e9.24.1789114657614;
        Fri, 11 Sep 2026 01:17:37 -0700 (PDT)
Received: from [192.168.0.116] ([81.79.79.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb357288sm4421336f8f.29.2026.09.11.01.17.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 01:17:36 -0700 (PDT)
Message-ID: <f186f871-064a-4f45-8987-fe9f2fb3fa1c@ursulin.net>
Date: Fri, 11 Sep 2026 09:17:35 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] drm/sched: Protect entity->last_scheduled with
 spinlock
To: Philipp Stanner <phasta@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260910075942.2000338-2-phasta@kernel.org>
 <20260910075942.2000338-5-phasta@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20260910075942.2000338-5-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



+ Christian's e-mail which he reads :)

On 10/09/2026 08:59, Philipp Stanner wrote:
> The entity->last_scheduled field has always been set and read with
> special RCU functions in addition to memory barriers.
> 
> This was added in
> 
> commit 70102d77ff22 ("drm/scheduler: add drm_sched_entity_error and use rcu for last_scheduled")
> 
> however, no proper justification for that mechanism was provided. There
> seems to be no obvious reason, since the entity lock is available and
> taken at all places that evaluate the last_scheduled field. The only
> exception is drm_sched_entity_error(), which is not performance critical
> in any way.

FWIW the entry paths that I found from the amdgpu side are from the job 
submission side where it is called a few times for each job via 
amdgpu_ctx_get_entity(), amdgpu_job_prepare_job() and 
amdgpu_vm_generation(). Last one being both in amdgpu_job_alloc() and 
amdgpu_job_run(). If I did not miss any, the change effectively adds 
four lock-unlock cycles to the job submission path. Plus one more for 
schedulers which use load balancing in some cases.

I don't know if avoiding that was the reason RCU was chosen, perhaps 
Christian remembers.

Also, to repeat what I said before, I benchmarked this a bit under 
extreme circumstances (4x non vsynced vkgears) and did not find a 
regression in fps.

> Improve robustness, readability and maintainability by replacing RCU and
> barriers with the lock.
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
>   drivers/gpu/drm/scheduler/sched_entity.c | 50 ++++++++++--------------
>   include/drm/gpu_scheduler.h              | 10 ++---
>   2 files changed, 24 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index e168f445f2ab..fa4a9388e5c9 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -136,7 +136,6 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>   			      DRM_SCHED_PRIORITY_KERNEL : priority;
>   	entity->num_sched_list = num_sched_list;
>   	entity->sched_list = num_sched_list > 1 ? sched_list : NULL;
> -	RCU_INIT_POINTER(entity->last_scheduled, NULL);
>   	RB_CLEAR_NODE(&entity->rb_tree_node);
>   
>   	if (!sched_list[0]->sched_rq) {
> @@ -233,10 +232,10 @@ int drm_sched_entity_error(struct drm_sched_entity *entity)
>   	struct dma_fence *fence;
>   	int r;
>   
> -	rcu_read_lock();
> -	fence = rcu_dereference(entity->last_scheduled);
> +	spin_lock(&entity->lock);
> +	fence = entity->last_scheduled;
>   	r = fence ? fence->error : 0;
> -	rcu_read_unlock();
> +	spin_unlock(&entity->lock);
>   
>   	return r;
>   }
> @@ -319,9 +318,10 @@ void drm_sched_entity_kill(struct drm_sched_entity *entity)
>   	/* Make sure this entity is not used by the scheduler at the moment */
>   	wait_for_completion(&entity->entity_idle);
>   
> -	/* The entity is guaranteed to not be used by the scheduler */
> -	prev = rcu_dereference_check(entity->last_scheduled, true);
> +	spin_lock(&entity->lock);
> +	prev = entity->last_scheduled;
>   	dma_fence_get(prev);

Here you can compact with the idiomatic:

  prev = dma_fence_get(entity->last_scheduled);

Otherwise looks plausible to me. Lets see what sashiko will have to say 
this time round.

Regards,

Tvrtko

> +	spin_unlock(&entity->lock);
>   	while ((job = drm_sched_entity_queue_pop(entity))) {
>   		struct drm_sched_fence *s_fence = job->s_fence;
>   
> @@ -413,8 +413,7 @@ void drm_sched_entity_fini(struct drm_sched_entity *entity)
>   		entity->dependency = NULL;
>   	}
>   
> -	dma_fence_put(rcu_dereference_check(entity->last_scheduled, true));
> -	RCU_INIT_POINTER(entity->last_scheduled, NULL);
> +	dma_fence_put(entity->last_scheduled);
>   	drm_sched_entity_stats_put(entity->stats);
>   }
>   EXPORT_SYMBOL(drm_sched_entity_fini);
> @@ -536,6 +535,10 @@ drm_sched_job_dependency(struct drm_sched_job *job,
>   
>   struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>   {
> +	/* Helper to avoid dropping the reference while the entity lock is held,
> +	 * just to have some more robustness.
> +	 */
> +	struct dma_fence *prev_last_scheduled;
>   	struct drm_sched_job *sched_job;
>   
>   	sched_job = drm_sched_entity_queue_peek(entity);
> @@ -552,22 +555,15 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>   	if (entity->guilty && atomic_read(entity->guilty))
>   		dma_fence_set_error(&sched_job->s_fence->finished, -ECANCELED);
>   
> -	dma_fence_put(rcu_dereference_check(entity->last_scheduled, true));
> -	rcu_assign_pointer(entity->last_scheduled,
> -			   dma_fence_get(&sched_job->s_fence->finished));
> -
> -	/*
> -	 * If the queue is empty we allow drm_sched_entity_select_rq() to
> -	 * locklessly access ->last_scheduled. This only works if we set the
> -	 * pointer before we dequeue and if we a write barrier here.
> -	 */
> -	smp_wmb();
> -
>   	spin_lock(&entity->lock);
> +	prev_last_scheduled = entity->last_scheduled;
> +	entity->last_scheduled = dma_fence_get(&sched_job->s_fence->finished);
>   	spsc_queue_pop(&entity->job_queue);
>   	drm_sched_rq_pop_entity(entity);
>   	spin_unlock(&entity->lock);
>   
> +	dma_fence_put(prev_last_scheduled);
> +
>   	/* Jobs and entities might have different lifecycles. Since we're
>   	 * removing the job from the entities queue, set the jobs entity pointer
>   	 * to NULL to prevent any future access of the entity through this job.
> @@ -591,21 +587,15 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
>   	if (spsc_queue_count(&entity->job_queue))
>   		return;
>   
> -	/*
> -	 * Only when the queue is empty are we guaranteed that
> -	 * drm_sched_run_job_work() cannot change entity->last_scheduled. To
> -	 * enforce ordering we need a read barrier here. See
> -	 * drm_sched_entity_pop_job() for the other side.
> -	 */
> -	smp_rmb();
> -
> -	fence = rcu_dereference_check(entity->last_scheduled, true);
> +	spin_lock(&entity->lock);
> +	fence = entity->last_scheduled;
>   
>   	/* stay on the same engine if the previous job hasn't finished */
> -	if (fence && !dma_fence_is_signaled(fence))
> +	if (fence && !dma_fence_is_signaled(fence)) {
> +		spin_unlock(&entity->lock);
>   		return;
> +	}
>   
> -	spin_lock(&entity->lock);
>   	sched = drm_sched_pick_best(entity->sched_list, entity->num_sched_list);
>   	rq = sched ? sched->sched_rq[entity->rq_priority] : NULL;
>   	if (rq != entity->rq) {
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 7a64cc11de08..aeeea6efc623 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -100,8 +100,8 @@ struct drm_sched_entity {
>   	 * @lock:
>   	 *
>   	 * Lock protecting the run-queue (@rq) to which this entity belongs,
> -	 * @priority, the list of schedulers (@sched_list, @num_sched_list) and
> -	 * the @rr_ts field.
> +	 * @priority, @last_scheduled and the list of schedulers (@sched_list,
> +	 * @num_sched_list).
>   	 */
>   	spinlock_t			lock;
>   
> @@ -215,11 +215,9 @@ struct drm_sched_entity {
>   	/**
>   	 * @last_scheduled:
>   	 *
> -	 * Points to the finished fence of the last scheduled job. Only written
> -	 * by drm_sched_entity_pop_job(). Can be accessed locklessly from
> -	 * drm_sched_job_arm() if the queue is empty.
> +	 * Points to the finished fence of the last scheduled job.
>   	 */
> -	struct dma_fence __rcu		*last_scheduled;
> +	struct dma_fence		*last_scheduled;
>   
>   	/**
>   	 * @last_user: last group leader pushing a job into the entity.

