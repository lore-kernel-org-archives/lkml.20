Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F8618DB2A
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 09:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788342390; cv=none; b=mcYV4x0H94g9Yh76v1bls7iDFoGPtcBSJBLL1Ac5f13dnpN6EQsPQUbjwiDv7sBREvhzjU4Uo44fWN+GZjJWY0B6oDQ/ZVgQ/XnmpFxRF2/LDYO2DPF3jRzo/GjlqZatOXWBzwDcI6N4jUzccHSJkrTu9ZkcS9TdDG/6VW69Ed4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788342390; c=relaxed/simple;
	bh=CjlUES91iDa+QPDmfLhfxeAOimFl7F4K58XqeCHDHYk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UVsS6rRBnMlLBy907uflkY8Dhp4x+oHzpJ5k9+zXVSlJpcjOFtn/0uzEFmkE2HlWF9DD1uvuPYeApkwrM9XFHa9BLbUUnB4dUu4gk144vtLuKkTEEwpBK1hd6tzM9MEZPIWthUmbcgWlTSvpQj+Y6S+MLre2rswyVCVDceX3Y4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net; spf=pass smtp.mailfrom=ursulin.net; dkim=pass (2048-bit key) header.d=ursulin.net header.i=@ursulin.net header.b=ctAQAnBt; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ursulin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ursulin.net header.i=@ursulin.net header.b="ctAQAnBt"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a156627e22so3708345a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 02:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin.net; s=google; t=1788342387; x=1788947187; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GUxXRAsScbasjh7s3OWikJdhIfzJpIqvpE5QFbde7vc=;
        b=ctAQAnBtWOVW5NiXTD9LY34ah9ShQVHCUwXgXWeDUPM6z+lPJ6cmX2DiIi3keKnRpK
         hmQSC3aDAMGx3vgHwTP0lw0N7hEgbjSY25PrPe+A53BReUE4pjhRbbAPfnQWbbmHhRJG
         AIZZAbnI/Kab8sKu7ALmrODKrKVuWH9q+ezrt+edgWDjJX3/x3+dv+dvsG5J1giqDOjm
         6zm9/jTr/dWzzB+/iQNnw5luDYEiNThgROQIyIkqO6+l5I1x5HuGM+2Ay/bGaZaagdTb
         vg7ful+40+NKsW7sbd5NkflnPLNLaTmOtbX+3Kp1rsZhN58W+PfIj2wxYEsl5AbpfyBQ
         Wtpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788342387; x=1788947187;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GUxXRAsScbasjh7s3OWikJdhIfzJpIqvpE5QFbde7vc=;
        b=E18Q//lhs6AZ9SgGnwscQOdKyDJEz6EMaapxt9axQeFe2PLNpb9JrYR2/rctvGp6Cg
         6y2Y0Y/lQqLka4LQahUiDQHDdG+fDOMndNy7by+g1CkXgudY2TBGFOQFSjUCJ9H8xFYe
         1lvCiGOLBfARZ+iRKm1LuUmukq9xXpwojdjCYL0b/ehi60MtOcV6xjqr44MVDdisfvgb
         RWi/sej3VrJDMr9AiRefzgQcfRgLwDx9knmreXHxJ40GD8jzUQGNzCzmoblD2B0w2CMG
         pu5fr7g3SiKz0fhmng5rgT+6QnbWBd6E3gVdSSkumkNed0dg0zw34HzEQMFxIhIgLcGo
         IUJw==
X-Forwarded-Encrypted: i=1; AKwUvBwJdgwGMeXPESs2JMBnC8kCkrcjD8wCCmVd2NFLIJ0+U+an6uCC9xTe1j0kg4IPzb8p+sFGEyhWM8nx95A=@vger.kernel.org
X-Gm-Message-State: AFuF++kGyZwgtJypOX2JwqgnwGe+Al1qSpKHDHyqGntYf7rwjZyqCDqL
	uXx8OD8e+YLI7poKxAklqKyi9lK9vD6EW9M3ImV3jqJNpoZf4wW+P7/KzZNwEl3a7DoLAXEKrd3
	Adf199o4=
X-Gm-Gg: AYBFou1QuwAs30FpbRvPD6po9vZx2Ojxn2XYO+Cly4lVb2d6ixYuO/qarNn9I43Om0v
	qe0ETo77fK5mMW4fTUXiGUkqSmXOg1SqZ0ZU2Munmfg7RhlEOUmYq8qiH6k/fg90AivlVfZgiA5
	XpUfBzK5qqWUIqqMoceCnTSuXE7uRteJ7FojUp1dt1p2oqX8zv39x0Piq7zp3NTTpKtzUR/rZ8X
	yWcXiLAgLqiA6HLCFs11EMoeg3vMctTlMdzp4Ye+ppTXU2mGDdlUUPmBCZ/hJ4zjthBm4vWZQpH
	ZJxysrZz2q3K+nnyxZkZhKm9DjgPiMg3iOkEo65DOC/MX7CSMCiJZSTeMlrhdoPuUpXN3jTGgOJ
	rc0k/wIxeIY6CIdQomaNVFEnpXaJiX3ip+fWYfzBF46rdPqK08M5+vkU+Ia13hNpt+/hletnMSi
	x0EJDyE2HOSEyQ7goRKFBIrPnpE9axTmYhkG5MW+Y5th4GTDBDWAVS8ouxPM1Qyn6vdCYYOIZaA
	sFk
X-Received: by 2002:a17:907:7b85:b0:c1c:49d9:4c34 with SMTP id a640c23a62f3a-c25dcc4c76dmr115853966b.11.1788342386564;
        Wed, 02 Sep 2026 02:46:26 -0700 (PDT)
Received: from [192.168.0.116] ([81.79.79.1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25d0426726sm101629066b.58.2026.09.02.02.46.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 02:46:26 -0700 (PDT)
Message-ID: <8c2a4df5-37a4-414e-81e2-cd97218e5355@ursulin.net>
Date: Wed, 2 Sep 2026 10:46:25 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] drm/sched: cache the timeline name to fix a
 use-after-free
To: "Jonghyuk Kim(MalHyuk)" <malhyuk97@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Philipp Stanner <phasta@kernel.org>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <cover.1787928528.git.malhyuk97@gmail.com>
 <b191f55e53492f95d965407f891fd93b0e74958d.1787928528.git.malhyuk97@gmail.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <b191f55e53492f95d965407f891fd93b0e74958d.1787928528.git.malhyuk97@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


+ Christian's AMD email

On 28/08/2026 15:57, Jonghyuk Kim(MalHyuk) wrote:
> drm_sched_fence_get_timeline_name() returns fence->sched->name, and the
> drm_sched_fence ops keep a .release callback, so the fence is not
> ops-detached on signalling (dma_fence_signal_timestamp_locked() only
> clears ->ops for fences without .release/.wait). The callback therefore
> stays reachable on a long-signalled, userspace-held finished fence and
> unconditionally dereferences fence->sched.
> 
> A driver that allocates a drm_gpu_scheduler at per-context/per-queue/
> per-VM granularity and frees it on an unprivileged context/fd close, while
> exporting the resulting finished fence to userspace (drm_syncobj /
> sync_file / dma_resv), leaves fence->sched dangling after the free. A
> subsequent SYNC_IOC_FILE_INFO ioctl (which calls get_timeline_name())
> then reads the freed scheduler:
> 
>    BUG: KASAN: slab-use-after-free in drm_sched_fence_get_timeline_name
> 
> This is the same class as CVE-2025-38703 (drm/xe) and CVE-2025-71302
> (drm/panthor), which were fixed per-driver. amdxdna, nouveau and msm
> (VM_BIND) are still affected in mainline, so fix it in the core to cover
> any per-context-scheduler driver at once.
> 
> Scheduler names are persistent strings (string literals passed to
> drm_sched_init()), so cache the name pointer in the fence at init time,
> while the scheduler is guaranteed alive, and return the cached value from
> get_timeline_name() without dereferencing fence->sched.

It is not guaranteed in the documented contract that the name passed to 
drm_sched_init has to outlive the scheduler.

Case in point is asking "would have this patch fixed CVE-2025-38703" - 
to which I think answer is no. Until recent 299bc6d50b1b ("drm/xe/guc: 
Keep scheduler timeline name alive") my attempt in 6bd90e700b42 
("drm/xe: Make dma-fences compliant with the safe access rules") only 
half fixed it by adding a RCU grace to the sched object itself, while 
missing the fact timeline name gets freed instantly. I haven't gotten 
round trying to understand why KASAN did not catch this back when I was 
upstreaming 6bd90e700b42.

Anyway, I think the fix will have to be to either add the full RCU grace 
around names in the scheduler object owning modules, or your patch plus 
documenting that the name passed to drm_sched_init must follow the 
dma-fence safe access rules (with kernel-doc cross-link and an 
explanation of the connection between scheduler name and dma-fence 
timeline name).

Hm, that might be overkill.. how about we just keep a copy of the name 
in the scheduler object? If we document that in gpu_scheduler.h it would 
fix the drivers still vulnerable, while the ones which were fixed could 
be simplified.

Regards,

Tvrtko

> Signed-off-by: Jonghyuk Kim(MalHyuk) <malhyuk97@gmail.com>
> ---
>   drivers/gpu/drm/scheduler/sched_fence.c | 16 +++++++++++++++-
>   include/drm/gpu_scheduler.h             | 11 +++++++++++
>   2 files changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
> index 85ee3d694dc9..280a2d036ffd 100644
> --- a/drivers/gpu/drm/scheduler/sched_fence.c
> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> @@ -92,7 +92,13 @@ static const char *drm_sched_fence_get_driver_name(struct dma_fence *fence)
>   static const char *drm_sched_fence_get_timeline_name(struct dma_fence *f)
>   {
>   	struct drm_sched_fence *fence = to_drm_sched_fence(f);
> -	return (const char *)fence->sched->name;
> +
> +	/*
> +	 * Do not dereference fence->sched here: a userspace-held finished
> +	 * fence can outlive a per-context scheduler. Return the name cached
> +	 * in drm_sched_fence_init() instead.
> +	 */
> +	return fence->sched_name;
>   }
>   
>   static void drm_sched_fence_free_rcu(struct rcu_head *rcu)
> @@ -228,6 +234,14 @@ void drm_sched_fence_init(struct drm_sched_fence *fence,
>   	unsigned seq;
>   
>   	fence->sched = container_of(entity->rq, typeof(*fence->sched), rq);
> +	/*
> +	 * Cache the scheduler's timeline name: the finished fence may be
> +	 * exported to userspace and outlive @sched (per-context schedulers
> +	 * are freed on context teardown), so get_timeline_name() must not
> +	 * dereference @sched. Scheduler names are persistent (string
> +	 * literals passed to drm_sched_init()).
> +	 */
> +	fence->sched_name = fence->sched->name;
>   	seq = atomic_inc_return(&entity->fence_seq);
>   	dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
>   		       &fence->lock, entity->fence_context, seq);
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index d61c19e78182..4f780d70acb6 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -305,6 +305,17 @@ struct drm_sched_fence {
>            * belongs to.
>            */
>   	struct drm_gpu_scheduler	*sched;
> +	/**
> +	 * @sched_name: the timeline name of @sched, cached at init time.
> +	 *
> +	 * &drm_sched_fence.finished may be exported to userspace (via a
> +	 * sync_file or drm_syncobj) and can outlive @sched: a driver using a
> +	 * per-context scheduler frees it on context teardown while a
> +	 * userspace-held finished fence still references it. The
> +	 * get_timeline_name() callback must therefore not dereference @sched;
> +	 * it returns this cached name instead.
> +	 */
> +	const char			*sched_name;
>           /**
>            * @lock: the lock used by the scheduled and the finished fences.
>            */

