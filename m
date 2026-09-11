Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBE8404BC5
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 19:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789154287; cv=pass; b=pOwYJs5DalojTMO7YPYMu7HMJeh+qR4ZpwxV5Z3ThJTWe7SVJ9DSu1eFbemvele5pUiUO9bpo6uu5W8kAYfJGlLbPbLNMArZ2GImJeIISH32XV05p2ScYjo3JDkv8kXStXYKd4khQRrNqBhsPclEQNzJjoI2ntFvCjSLB09mPms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789154287; c=relaxed/simple;
	bh=kwltqhx97mlprgU69UcuoraV6zJ1xmeUaDk4qRNts9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kGsykuQnt6sABSzZYMogOqXZgw+733YF99NR5H0a+a4/Hn5jmvaSXZGJawPLDcH8I71KBtvQt+pYVEsx3kiCcB2++6HjQY4X6qCHgFXc5yMbNYt3RZJyjABAs1sfFMnsNHbifFxJp1oRcoL8mmJTu0raOD8zsffXU5giFqsM/cE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=Qt/7DDRa; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="Qt/7DDRa"
ARC-Seal: i=1; a=rsa-sha256; t=1789154253; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XjooYV5kEFQGV08qpZQEhBipdgBbz/vEGnSRQZqowJMzP7SB4FyWxPn0jElB3nBk72epw5NwXrK3n3+YoWk0on93imdmjYlnLheCyAdWCfZjH7pfHpj+oclk9Cdj7vObuPfVgAgE7Pa2PLmGz67Acefzv5pxraBu5szCWAWbZUY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789154253; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=eUEZD4gf1dPTyyjb0g6E88Kf3E9DOxokbw0BzzvUr6k=; 
	b=Dse7BrjV76DsFGxZO1Wv30tI6k0N2znV+R7tRVwcXc/3ZcTSFRzWUQNH5LtgUyJmw3uIs9CsjOQJW6tmIrsoZJ/ddnsmsczqg+kpUnbPSPgkyaVLS6j+oY4dtkCIoMS+ypHcWa6mJ2f859TOoJxBoMR6KsmJk/Gb8eUQw7a+qv0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789154253;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
	bh=eUEZD4gf1dPTyyjb0g6E88Kf3E9DOxokbw0BzzvUr6k=;
	b=Qt/7DDRaaAFHS/2MXSvPtUt/zU8W5U57hAPzU4LYFa5E1H3pbGwQeYH4oUDWjZhh
	PQbG434RMMNu1lSw9idMQSj4T2dHP4gGkz3CJk2gkWwJmb/yno/oWudNqoynZzuIYyD
	g6c3ZetmzypJsQrW5Wfsf9utgK6jHKczW6PRffhg=
Received: by mx.zohomail.com with SMTPS id 1789154251343908.8885510094409;
	Fri, 11 Sep 2026 12:17:31 -0700 (PDT)
Date: Fri, 11 Sep 2026 20:17:27 +0100
From: Adrian Larumbe <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Chris Diamand <chris.diamand@arm.com>, Akash Goel <akash.goel@arm.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 16/18] drm/panthor: Track user owned groups
Message-ID: <aqQLUfxvROh3soX_@sobremesa>
References: <20260826-panthor-unplug-fixes-v4-0-982cc8f4234b@collabora.com>
 <20260826-panthor-unplug-fixes-v4-16-982cc8f4234b@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260826-panthor-unplug-fixes-v4-16-982cc8f4234b@collabora.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/289.144.59

Reviewed-by: Adrián Larumbe <adrian.larumbe@collabora.com>

On 26.08.2026 16:56, Boris Brezillon wrote:
> A group can outlive its user handle because of internal refs. In order
> to fix the unplug logic, we need to keep track of groups that have a
> valid user handle so we can release the references that were owned by
> the user processes in the unplug path.
> 
> This is the prep work to keep track of user owned groups. Note that
> the destroyed attribute is dropped because it's equivalent to checking
> whether the group is inserted in the user_owned list now.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 43 ++++++++++++++++++++++++---------
>  1 file changed, 31 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 4ea16b40d6b9..bd5dcf4cb580 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -235,6 +235,15 @@ struct panthor_scheduler {
>  		 * This list is evaluated in the @sync_upd_work work.
>  		 */
>  		struct list_head waiting;
> +
> +		/**
> +		 * @user_owned: List of groups that have a valid user handle.
> +		 *
> +		 * All groups are inserted in this list at creation time through their
> +		 * panthor_group;:user_node, and evicted from this list when

                  Nit: :: instead of ;:

> +		 * panthor_group_destroy() is called.
> +		 */
> +		struct list_head user_owned;
>  	} groups;
>  
>  	/**
> @@ -586,15 +595,6 @@ struct panthor_group {
>  	 */
>  	int csg_id;
>  
> -	/**
> -	 * @destroyed: True when the group has been destroyed.
> -	 *
> -	 * If a group is destroyed it becomes useless: no further jobs can be submitted
> -	 * to its queues. We simply wait for all references to be dropped so we can
> -	 * release the group object.
> -	 */
> -	bool destroyed;
> -
>  	/**
>  	 * @timedout: True when a timeout occurred on any of the queues owned by
>  	 * this group.
> @@ -707,6 +707,17 @@ struct panthor_group {
>  	 * panthor_group::groups::waiting list.
>  	 */
>  	struct list_head wait_node;
> +
> +	/**
> +	 * @user_node: Used to insert the group in the panthor_scheduler::groups::user_owned list.
> +	 *
> +	 * When the group is created, it's inserted in panthor_scheduler::groups::user_owned,
> +	 * and when panthor_group_destroy, the group is remove from this list.
> +	 *
> +	 * When the device is unplugged, all groups that remain in this list must have an extra
> +	 * put_group() called on them to release the reference owned by the per-file group pool.
> +	 */
> +	struct list_head user_node;
>  };
>  
>  struct panthor_job_profiling_data {
> @@ -969,6 +980,7 @@ static void group_release(struct kref *kref)
>  	struct panthor_device *ptdev = group->ptdev;
>  
>  	drm_WARN_ON(&ptdev->base, group->csg_id >= 0);
> +	drm_WARN_ON(&ptdev->base, !list_empty(&group->user_node));
>  	drm_WARN_ON(&ptdev->base, !list_empty(&group->run_node));
>  	drm_WARN_ON(&ptdev->base, !list_empty(&group->wait_node));
>  
> @@ -1003,7 +1015,7 @@ group_can_run(struct panthor_group *group)
>  {
>  	return group->state != PANTHOR_CS_GROUP_TERMINATED &&
>  	       group->state != PANTHOR_CS_GROUP_UNKNOWN_STATE &&
> -	       !group->destroyed &&
> +	       !list_empty(&group->user_node) &&
>  	       !atomic_read(&group->fatal_queues) &&
>  	       !atomic_read(&group->timedout);
>  }
> @@ -2472,7 +2484,7 @@ tick_ctx_apply(struct panthor_scheduler *sched, struct panthor_sched_tick_ctx *c
>  			 * re-evaluate as soon as possible and get rid of
>  			 * this dangling group.
>  			 */
> -			if (group->destroyed)
> +			if (list_empty(&group->user_node))
>  				ctx->immediate_tick = true;
>  			group_put(group);
>  		}
> @@ -3667,6 +3679,7 @@ int panthor_group_create(struct panthor_file *pfile,
>  	group->tiler_core_mask = group_args->tiler_core_mask;
>  	group->priority = group_args->priority;
>  
> +	INIT_LIST_HEAD(&group->user_node);
>  	INIT_LIST_HEAD(&group->wait_node);
>  	INIT_LIST_HEAD(&group->run_node);
>  	INIT_WORK(&group->term_work, group_term_work);
> @@ -3735,8 +3748,13 @@ int panthor_group_create(struct panthor_file *pfile,
>  	mutex_lock(&sched->reset.lock);
>  	if (atomic_read(&sched->reset.in_progress)) {
>  		panthor_group_stop(group);
> +
> +		mutex_lock(&sched->lock);
> +		list_add_tail(&group->user_node, &sched->groups.user_owned);
> +		mutex_unlock(&sched->lock);
>  	} else {
>  		mutex_lock(&sched->lock);
> +		list_add_tail(&group->user_node, &sched->groups.user_owned);
>  		list_add_tail(&group->run_node,
>  			      &sched->groups.idle[group->priority]);
>  		mutex_unlock(&sched->lock);
> @@ -3776,7 +3794,7 @@ int panthor_group_destroy(struct panthor_file *pfile, u32 group_handle)
>  
>  	mutex_lock(&sched->reset.lock);
>  	mutex_lock(&sched->lock);
> -	group->destroyed = true;
> +	list_del_init(&group->user_node);
>  	if (group->csg_id >= 0) {
>  		sched_queue_delayed_work(sched, tick, 0);
>  	} else if (!atomic_read(&sched->reset.in_progress)) {
> @@ -4143,6 +4161,7 @@ int panthor_sched_init(struct panthor_device *ptdev)
>  		INIT_LIST_HEAD(&sched->groups.idle[prio]);
>  	}
>  	INIT_LIST_HEAD(&sched->groups.waiting);
> +	INIT_LIST_HEAD(&sched->groups.user_owned);
>  
>  	ret = drmm_mutex_init(&ptdev->base, &sched->reset.lock);
>  	if (ret)
> 
> -- 
> 2.55.0


Adrian Larumbe
