Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69947448B97
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789387918; cv=none; b=ECy9c4xCQXBGQh4cvVXe4kf+qoNGb2wC28xZiJ28y+qr/o87MwolROxwtBRitV3DqQsJRnn4JedmhuFiGk2pH+78oHTQLRhSFpNnoUsQZrjAdqHwq3WFjszke9hNnA3mYWpvreYimMHCNc+Hutf3hh3LLIPk70zXlFVOAsz2LNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789387918; c=relaxed/simple;
	bh=XcRZ+HXCGfmJFSSJAo0/BNZ03CINgEvURIk204Re7n0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q80oUQC4hFzeCKdGa4+6dIw91LTm9YLrdpZP6laSwGZZlK021RbLvBibOxuKIWf39T9NUFhglONSI160XRzkDRm8RsKvjMkv2WT+pTkbOSz5mdVoV300an/3vuN82AHE43F+G+UsrmK/vRpP7N+bx0kMsk4uWRoMwZnIsBnnH5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=mvUKThE+; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="mvUKThE+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=S5ARf8UjwoiiC9BKHeLJlozUNC5PG8wxA6yusSaYoUY=; b=mvUKThE+Tv7K0OxXl27By2TqwJ
	7cSkvvAR/tBbe6RXtQi1VMuRntZ0KoQjm6GKwBAE9f6TQq0RNEijYzbH5B6ppjJqc907rlkOVvaVB
	cDmkJtxS55Gn2IHpTWbfLW0IjWk14/7U1Jcxl45FxpzoPsNbkQg0M7kul1MDO1e6kpsKDXC9TMOnT
	BEHRo8gGpGrlycgt2HIQNzHcB6Gc4vB1jCkS2aKm6XzZs+2SGknSYHqQ0w4vVzlEkZiVVzohpgKvp
	3ifnD+XrF45EzDGtxacgLTq4LwmIeSMuzlH8QyfMM09p1YRk9TFMJA/KDgk7N3IyW2kbg8cyq8JE5
	ffarSbfQ==;
Received: from [81.79.79.1] (helo=[192.168.0.116])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1x65X6-001sHx-DZ; Mon, 14 Sep 2026 14:11:36 +0200
Message-ID: <f8ddff14-7800-451d-92c4-3f63ebba275d@igalia.com>
Date: Mon, 14 Sep 2026 13:11:35 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Free the run queues at the end of
 drm_sched_fini()
To: Donggeun Yoo <donggeunyoo.kernel@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Philipp Stanner <phasta@kernel.org>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Luben Tuikov <ltuikov89@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260910121601.805032-1-donggeunyoo.kernel@gmail.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20260910121601.805032-1-donggeunyoo.kernel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/09/2026 13:16, Donggeun Yoo wrote:
> drm_sched_fini() frees the run queues at the top of teardown but the array
> holding them at the bottom. The early half is on the wrong side of
> cancel_delayed_work_sync(&sched->work_tdr), which waits for a timeout
> handler that can still walk sched->sched_rq[i] through
> drm_sched_increase_karma().
> 
> No correct driver can be there, since every fence returned from run_job()
> must be signaled before drm_sched_fini() is called. Free the entries next
> to the array anyway, so run-queue teardown happens in one place.
> 
> Link: https://lore.kernel.org/dri-devel/20260910054605.634135-1-donggeunyoo.kernel@gmail.com/
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
> ---
> Targets drm-misc-next (0878e6053d01).
> 
> A cleanup - no Fixes:, no Cc: stable.
> 
> The KUnit case and how to run it:
> https://github.com/donggeunyoo/drm-sched-fini-uaf-repro
> 
> x86_64 under QEMU, KUNIT + KASAN + lockdep, whole drm_sched suite, three
> runs per arm:
> 
>    before  38-41 KASAN slab-use-after-free reports, all from
>            drm_sched_increase_karma() on the timeout worker
>    after   0
> 
>   drivers/gpu/drm/scheduler/sched_main.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 6cb6f9546493..fec04c944c5e 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1210,9 +1210,6 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
>   
>   	drm_sched_wqueue_stop(sched);
>   
> -	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++)
> -		kfree(sched->sched_rq[i]);
> -
>   	/* Wakeup everyone stuck in drm_sched_entity_flush for this scheduler */
>   	wake_up_all(&sched->job_scheduled);
>   
> @@ -1226,6 +1223,9 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
>   	if (sched->own_submit_wq)
>   		destroy_workqueue(sched->submit_wq);
>   	sched->ready = false;
> +
> +	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++)
> +		kfree(sched->sched_rq[i]);
>   	kfree(sched->sched_rq);
>   	sched->sched_rq = NULL;
>   

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

