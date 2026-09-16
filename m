Received: from mail-wr2-f41.google.com (mail-wr2-f41.google.com [74.125.225.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42854E56FD
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789561992; cv=none; b=m1lnLAQAJHRCgDUt31w/+3v5Agn6IQxIafq1RLmRmJ3J6iWAKLPlZfu3VLpaz7VnuQKSBZIkCEauCgxNXq3pI/F5dskpNC81vz/9MIHq9odU0u2OaPNS487QqmFRuBFiV+GoRAwsq2mCapkuShooPrsie3PNr/+rC675V4zz0gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789561992; c=relaxed/simple;
	bh=p9tn4IA80i+CfdXp34CRz3OImCrsrDPrIG7NqQ9MOfY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jWyijf3zl09ky6JU1g21pa70vfW1dFUi8JxRZNJ8HzTrktKHepNoJowV0rjeVepI1WuTsrQF4GNTWYw8onSH3SieCdApn3INi/K0a7v4lk+BsIwrpyp2SfRU4EwnryoEnrdKH+1xCVKqEEY/vw0VUQWlrucvrloSHcSM6HktJnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rDAx4dqN; arc=none smtp.client-ip=74.125.225.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rDAx4dqN"
Received: by mail-wr2-f41.google.com with SMTP id ffacd0b85a97d-4834977ae75so428270f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789561988; x=1790166788; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a1EN2OK8k7gYm/WXEqB2cKw6sRlIVrueaJhwh5lRhr4=;
        b=rDAx4dqNKGJp8HL+Zktrz2gkrGVtjHXrDa+WKMcIcw5FmJlEOziJh33Q62uKHBdcEC
         oxBduxV7nb+pwnQ9DDOSmGA0jmciMtQEuKQS9nLhmyP/S9G9VYY0L5E4hr65SPrsQx4d
         esNrKtD2mjqL8kNBUNSjb7ZarPPkM1ts0vy+DoDuViQFXM4Gh1aLlIS0qr5v9pqtO7mG
         bPmCc7xzff9fd7YYtckJLnQEMR1FeZURNg6Hox4ll3tctijxjfZG354nqXZvCZ18MyJU
         3Qyaok5geUmGfK2Duy24p5AX4caicH5LwAX4rV/UQTz+LNFFwFKUqiOEZF9vsIb9Xcf2
         ePhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789561988; x=1790166788;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a1EN2OK8k7gYm/WXEqB2cKw6sRlIVrueaJhwh5lRhr4=;
        b=fu7MAHmQDdpJ21ikvh0Q2haimKdzSWrp6jdYO7UahhaCXK9VKttnFwsLaGsWnsQ1IQ
         96jgjuet2uV0O59JzVrzr6xKAzddo/skKEcLT8K9cybGZ3asFpeGAY53vGZNv+e6kl/N
         f9gcSm6woFqQKrzdUMNqUtA1lbXzZ0uQf+WYln0NZmCQed7THlZAlJTPBrHAh4CIAwiU
         G/4MTbrGwvlxGjzUI92Hqhw1GchDIYuu1KHTGDjpiigvI0XAUDHV26v6Da0jrm28X9AU
         0NMJQqM4MZqz9ZklaRPE4KENYlOrhJSHxgu7PuDlEp5PJ4IubmDcYWF7kdjHdmnCbG67
         YjsA==
X-Forwarded-Encrypted: i=1; AKwUvBylciuVLopKs7dnwvLBxUd6lMuiauureP36oq7RM2FGeagF+ssmiBZMyei6KPoiLn/7Das4+CkkbzzuuPs=@vger.kernel.org
X-Gm-Message-State: AFuF++mcc+mI6l98Vu08gILpw6qA7PYjrFUTZIePucc6Lm1aP9FGVAyf
	EwcYxCT6L9TJhJcFEiaKg3rNcbMEpxnPdBVv7KvhMDT7P6nKTpooGpOO
X-Gm-Gg: AYBFou1ojkcakK2ZkdS0dE5kMP0a9oNzyfJ3qpEl+0Uj/wZ9ilwSQ36TPUCDgR12ugo
	OMlUOrRSr9vKK+JkXf8yNaHPkZatduOlyKv3NzvDOVPmKBqx2OuM+GYhkzRLcIRk7WcQBiSeRjS
	Fe0d0XAEGHuvCuNKQrEpWOegLy1ryu/r88WRa3WodljvJBkalvAk4qaWj22lVeVDglS8Mw1TsMl
	eQb9/JL9seU2Vo1vMTJgpRwKlXrICaA34iMeuJzi86Z1stwYiN4EzkJky8/WqLXCP4V890l/F6L
	m51Eeau5LQ9k1rEdR8qa7KeWZ2tQhwv8VDuk+YX2xJtdElGny/ZUG7hD0oeIoyihmXtiCHUctHP
	wX36Az2UwiHkJeOzjFUpApI2ec44+vycvltu1kZxWN+sf+hm20l7YMje6lG4s25NmVZuAHBHPNL
	K+GQCunSK1xAAplo1Fd8fajOg/PbqjK8GTNoj9vz8VpZkLMjhlv+AXk7rD9X7JHxGvjCXK3pQ9e
	UsWy2BxnjvitMixB2QYD00waT8PF3Qeta6VULM=
X-Received: by 2002:a05:600c:46ce:b0:49c:dca4:94c with SMTP id 5b1f17b1804b1-49eb7339895mr52752455e9.13.1789561987513;
        Wed, 16 Sep 2026 05:33:07 -0700 (PDT)
Received: from [10.254.153.228] (munvpn.amd.com. [165.204.72.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e847ecf52sm51623765e9.2.2026.09.16.05.33.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Sep 2026 05:33:06 -0700 (PDT)
Message-ID: <14ad8ea7-c65c-48b0-94c5-bc881d7aaddd@gmail.com>
Date: Wed, 16 Sep 2026 14:33:05 +0200
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
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260910075942.2000338-2-phasta@kernel.org>
 <20260910075942.2000338-5-phasta@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20260910075942.2000338-5-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 9/10/26 09:59, Philipp Stanner wrote:
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
> 
> Improve robustness, readability and maintainability by replacing RCU and
> barriers with the lock.
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/scheduler/sched_entity.c | 50 ++++++++++--------------
>  include/drm/gpu_scheduler.h              | 10 ++---
>  2 files changed, 24 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index e168f445f2ab..fa4a9388e5c9 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -136,7 +136,6 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>  			      DRM_SCHED_PRIORITY_KERNEL : priority;
>  	entity->num_sched_list = num_sched_list;
>  	entity->sched_list = num_sched_list > 1 ? sched_list : NULL;
> -	RCU_INIT_POINTER(entity->last_scheduled, NULL);
>  	RB_CLEAR_NODE(&entity->rb_tree_node);
>  
>  	if (!sched_list[0]->sched_rq) {
> @@ -233,10 +232,10 @@ int drm_sched_entity_error(struct drm_sched_entity *entity)
>  	struct dma_fence *fence;
>  	int r;
>  
> -	rcu_read_lock();
> -	fence = rcu_dereference(entity->last_scheduled);
> +	spin_lock(&entity->lock);
> +	fence = entity->last_scheduled;
>  	r = fence ? fence->error : 0;
> -	rcu_read_unlock();
> +	spin_unlock(&entity->lock);
>  
>  	return r;
>  }
> @@ -319,9 +318,10 @@ void drm_sched_entity_kill(struct drm_sched_entity *entity)
>  	/* Make sure this entity is not used by the scheduler at the moment */
>  	wait_for_completion(&entity->entity_idle);
>  
> -	/* The entity is guaranteed to not be used by the scheduler */
> -	prev = rcu_dereference_check(entity->last_scheduled, true);
> +	spin_lock(&entity->lock);
> +	prev = entity->last_scheduled;
>  	dma_fence_get(prev);
> +	spin_unlock(&entity->lock);
>  	while ((job = drm_sched_entity_queue_pop(entity))) {
>  		struct drm_sched_fence *s_fence = job->s_fence;
>  
> @@ -413,8 +413,7 @@ void drm_sched_entity_fini(struct drm_sched_entity *entity)
>  		entity->dependency = NULL;
>  	}
>  
> -	dma_fence_put(rcu_dereference_check(entity->last_scheduled, true));
> -	RCU_INIT_POINTER(entity->last_scheduled, NULL);
> +	dma_fence_put(entity->last_scheduled);
>  	drm_sched_entity_stats_put(entity->stats);
>  }
>  EXPORT_SYMBOL(drm_sched_entity_fini);
> @@ -536,6 +535,10 @@ drm_sched_job_dependency(struct drm_sched_job *job,
>  
>  struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>  {
> +	/* Helper to avoid dropping the reference while the entity lock is held,
> +	 * just to have some more robustness.
> +	 */
> +	struct dma_fence *prev_last_scheduled;
>  	struct drm_sched_job *sched_job;
>  
>  	sched_job = drm_sched_entity_queue_peek(entity);
> @@ -552,22 +555,15 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>  	if (entity->guilty && atomic_read(entity->guilty))
>  		dma_fence_set_error(&sched_job->s_fence->finished, -ECANCELED);
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
>  	spin_lock(&entity->lock);
> +	prev_last_scheduled = entity->last_scheduled;
> +	entity->last_scheduled = dma_fence_get(&sched_job->s_fence->finished);
>  	spsc_queue_pop(&entity->job_queue);
>  	drm_sched_rq_pop_entity(entity);
>  	spin_unlock(&entity->lock);
>  
> +	dma_fence_put(prev_last_scheduled);
> +
>  	/* Jobs and entities might have different lifecycles. Since we're
>  	 * removing the job from the entities queue, set the jobs entity pointer
>  	 * to NULL to prevent any future access of the entity through this job.
> @@ -591,21 +587,15 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
>  	if (spsc_queue_count(&entity->job_queue))
>  		return;
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
>  	/* stay on the same engine if the previous job hasn't finished */
> -	if (fence && !dma_fence_is_signaled(fence))
> +	if (fence && !dma_fence_is_signaled(fence)) {
> +		spin_unlock(&entity->lock);
>  		return;
> +	}
>  
> -	spin_lock(&entity->lock);
>  	sched = drm_sched_pick_best(entity->sched_list, entity->num_sched_list);
>  	rq = sched ? sched->sched_rq[entity->rq_priority] : NULL;
>  	if (rq != entity->rq) {
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 7a64cc11de08..aeeea6efc623 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -100,8 +100,8 @@ struct drm_sched_entity {
>  	 * @lock:
>  	 *
>  	 * Lock protecting the run-queue (@rq) to which this entity belongs,
> -	 * @priority, the list of schedulers (@sched_list, @num_sched_list) and
> -	 * the @rr_ts field.
> +	 * @priority, @last_scheduled and the list of schedulers (@sched_list,
> +	 * @num_sched_list).
>  	 */
>  	spinlock_t			lock;
>  
> @@ -215,11 +215,9 @@ struct drm_sched_entity {
>  	/**
>  	 * @last_scheduled:
>  	 *
> -	 * Points to the finished fence of the last scheduled job. Only written
> -	 * by drm_sched_entity_pop_job(). Can be accessed locklessly from
> -	 * drm_sched_job_arm() if the queue is empty.
> +	 * Points to the finished fence of the last scheduled job.
>  	 */
> -	struct dma_fence __rcu		*last_scheduled;
> +	struct dma_fence		*last_scheduled;
>  
>  	/**
>  	 * @last_user: last group leader pushing a job into the entity.

