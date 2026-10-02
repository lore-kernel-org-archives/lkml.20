Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B9640F731
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 19:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790969455; cv=none; b=llrq9s7Sp/uohJp9J65UEWvIv+b9oenfwTaXRKpjL46+WINRzKTUuWeAbe3iiv5IC38opcaop/i+b6XxThpq+gx6H2oO1eWMvrOySDw1U6kJY1gMZW1F1suAPH0qepYv8hWOLXK0Hsc6Rx/E/XZ43d43pBuNK2Nhrb3lgjFdXQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790969455; c=relaxed/simple;
	bh=cTsbqS99y1u7iLjBA+VfXtmju8qg6iLiFjyI3HdgUMI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References; b=kDarxjgjh45m/yxw5trQV8rkJzlOhcl4pxC6tyVqhpSsHUeMn1r44LHjCqWCpLLmk4xrQSg+yI4f+LnLhKlY/2syG/GcQ7wYU/2p4VJ/daQ7jSozDEtKx3Zq6XInL9DZuUKV9wodvkuMuIw+noLuXaL+6XA3+m0lXH6KhGU2KVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Prs3EKtt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Prs3EKtt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 955771F000FF;
	Fri,  2 Oct 2026 19:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790969453;
	bh=wt4fTL7p+Vc1IjQ+IbjHI6805rx0OSYSPxM75F1kboM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Prs3EKtt9RARa5VcyZAa1+Md+jaHJ7XD+faJPazhqRCJ44Whfu8HoNSOKgm0LoAoY
	 kK8EFqzJzg/lIQhypP487a7Hj2Vnt4GzkdmMYv7to/+2M84WT5RnYex5CYxlLGmucj
	 4ElHnsti4nuRv5e8DeBYxAbyRwHAIukSNj9EJfKl/n3oWdrISw/H8fuAtV+8qEr3TB
	 0pGcpPi+pSOF533ANeGmGL89YnbaBNWWKTqtUzEaDNfG1UGAAt6Uockpshm0dnDCg9
	 J2WeOCzqzV0I/asp7rJ5jwHzgpUU+twRI2PRLP+JP3Bxx3n9HEl9FZqDHnta7oljB9
	 EyFmKM9Sdsw7Q==
Date: Fri, 02 Oct 2026 09:30:53 -1000
Message-ID: <64d59ed5538c6af257058533c880740e@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	kernel-dev@igalia.com, Boris Brezillon <boris.brezillon@collabora.com>,
	Chia-I Wu <olv@google.com>, Liviu Dudau <liviu.dudau@arm.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Steven Price <steven.price@arm.com>
Subject: Re: [RFC v6 3/3] drm/panthor: Create per queue priority workqueues
In-Reply-To: <20261001160711.59888-4-tvrtko.ursulin@igalia.com>
References: <20261001160711.59888-1-tvrtko.ursulin@igalia.com>
	<20261001160711.59888-4-tvrtko.ursulin@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hello,

The following is a Claude-generated review.

On Thu, Oct 01, 2026 at 05:07:11PM +0100, Tvrtko Ursulin wrote:
> Low and medium GPU priority are served by a normal workqueue,
> high is server by a WQ_HIGHPRI instance, while realtime GPU priority is
> using the newly added WQ_RTPRI flag for lowest possible latency.

s/server/served/ and the flag is WQ_RT now.

> +	if (group->priority >= ARRAY_SIZE(group->ptdev->scheduler->submit_wq) ||
> +	    !group->ptdev->scheduler->submit_wq[group->priority]) {
> +		ret = -EINVAL;
> +		goto err_free_queue;
> +	}

panthor_group_create() already rejects priorities >=
PANTHOR_CSG_PRIORITY_COUNT and all slots are populated once
panthor_sched_init() succeeded, so this can't fire.

> +	sched_args.submit_wq = group->ptdev->scheduler->submit_wq[group->priority];

The .submit_wq = sched->wq initializer at the top of the function is still
there and gets overwritten here.

> +	if (sched->submit_wq[PANTHOR_CSG_PRIORITY_RT])
> +		destroy_workqueue(sched->submit_wq[PANTHOR_CSG_PRIORITY_RT]);
> +
>  	if (sched->wq)
>  		destroy_workqueue(sched->wq);

Work on sched->wq signals job fences whose callbacks queue onto the submit
wqs, so destroying sched->wq first would be the safer order.

> +	sched->submit_wq[PANTHOR_CSG_PRIORITY_MEDIUM] = alloc_workqueue("panthor-drm", WQ_MEM_RECLAIM | WQ_UNBOUND, 2);
> +	sched->submit_wq[PANTHOR_CSG_PRIORITY_LOW] = sched->submit_wq[PANTHOR_CSG_PRIORITY_MEDIUM];
> +	sched->submit_wq[PANTHOR_CSG_PRIORITY_HIGH] = alloc_workqueue("panthor-drm-high", WQ_HIGHPRI | WQ_MEM_RECLAIM | WQ_UNBOUND, 2);
> +	sched->submit_wq[PANTHOR_CSG_PRIORITY_RT] = alloc_workqueue("panthor-drm-rt", WQ_RT | WQ_MEM_RECLAIM | WQ_UNBOUND, 2);

For an unbound wq max_active applies to the whole wq, so this is two
in-flight items per priority level across all the queues on the device,
where the shared wq before had no effective limit. queue_run_job() blocks
on sched->lock which tick_work() holds across FW round trips, so two
blocked run_jobs would stall every other queue's run and free work at that
level. What's the reason for 2? Also, these lines are over 100 columns.

Thanks.

--
tejun
