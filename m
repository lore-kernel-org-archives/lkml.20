Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7434F39A4A0
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 10:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788343474; cv=none; b=YPYyJDxVZg7pbKfjRjMDmolYDxLDJqxdRsLrF8F1XLAq8ApQJAhva0SOUQVz9+zCgoYKn9/5WELQzvW76wUhe3y9X0jzx925vrGpKUvyWHAezoB0pK4y9xyJaa+jhtOvydewI5tjHscCuXuD3wjgxnVreSNyjsDdC+MdlQGFKEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788343474; c=relaxed/simple;
	bh=Az4CPQNQynGyTWW83RlUcTvJR0fwehbZRRiMfCSfnA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SrgqhIi1h4vEUi0I6HhmYfMUXJE6hFocQO+qGJo5hu28UNz2GKvCV8TwsPBRoteIL9Sy1c6VIhC3bTZ3AHpCHqoOZelCDS+m3LNZvTcTtfSdNc5lVkGTsLQPPxFG5PWvLtIz4+GUf3KFgbc330AWGw1x4monvrPttS+e/kI7+lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net; spf=pass smtp.mailfrom=ursulin.net; dkim=pass (2048-bit key) header.d=ursulin.net header.i=@ursulin.net header.b=SapNo5hm; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ursulin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ursulin.net header.i=@ursulin.net header.b="SapNo5hm"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c250c6a6a6eso117854266b.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 03:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin.net; s=google; t=1788343470; x=1788948270; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PRfZ86q63IMswZF57GVdHdFrLtck0kAywsbnrKui+Qo=;
        b=SapNo5hmPremzGH7dGVmvhGr7Q1qt8D7ATSkoRowJOOh2WAmQ/ny1ez9zkuev1n2rh
         yXV0qaQvR5Y0HHP5arxH2PqqoVGBCmtF/QEurPiWkORCUlv7MohkX0PAL92SDg9BcLmB
         WdXxfiY8K6rx3q4/Yb25aCDC3mmalPb5bE7+3F4rf1qGvPcgbVxCSO3qGwQP3LWYddb/
         HMGsiMEosTb0cl8YbAwEi34wMA8RR4ns5ubPirSpYy1z6BEdoTuRjganFUf1Qnl5A43b
         L6zgvDfPA1BHihGopJAk3Go/PDpuLnA8RDWXwYq/S8sF+yRJuXNd2YYObryQnZV+9M6X
         U1Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788343470; x=1788948270;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PRfZ86q63IMswZF57GVdHdFrLtck0kAywsbnrKui+Qo=;
        b=SYWFyFD3MiOOUy1NWgujXew/J+E4JqQqHKbtVq2FN1bOl7cdLYvyepvVsWjZzrHGca
         QjTBtVQYO5LBEEfR4vortebiGEXP5mhdAfuvvgY1t9W6E/ylDmWst3ZKtFwyKhCe3zJz
         U4/XDR+M/mlhf1HLXe8NpsuoaRSFtSkQwKhIA8k6OTkF1xzmZC6805vHs5glYW4RARRP
         rMDxUjNYEXMT6hsWwDz2JD0iC97iaxu7rmlKq9WU/L3VQbHOxHetytEBqtifTwFMr35M
         n205sczczRJugiBGHwUtbnTXc5lch6tTIjNIJ11/wj3DjYizRczrQJF1wKRxLntZP4Jz
         t9Lg==
X-Forwarded-Encrypted: i=1; AKwUvBzSO7MM+Gx8c+TZVA3k/CAfHrvnH3a7zviTQRkgDunby4bNDEVDo24T6JVRDlazFQRBWxOzG86+B367OuY=@vger.kernel.org
X-Gm-Message-State: AFuF++mHt2t8g0ggEuuVlcgMvJLc1gXN8t83WKEqwmikOIufAerFG8Ny
	pIn97JfcYu/dFqyl9fGedtbLOL3VDBB0JSoGgURnUr0CtHo/jog0QKodFQBmoFy1bvM=
X-Gm-Gg: AYBFou2Om9JWCXvqFcDCUC2nYGuRwGZA2cbtk1SnNgX5S2p2W6DYYZbe8lISS90yQf8
	RAKdOHdswcfT0nb0AeSe7xTPsWgdw6ReUVkK3ywXahHFvzMHR0+K6cg0OQ41tpJtYEYkq8R109a
	oXUT3mjykbgOUk/SEa0LT53kbibR2YQ1810cJPjFSFiHu3yxuAXQUuX981FV9xm72PneM7pHiJo
	RI5H+6lTxTRWshJG1IY66S9B/vTrFYAmkmLkOlAWs7OHTMb/BKL2hjaCTTl/Io3FF71cIAvyJR6
	2LyurGojuNo151HveYojp2OGRgVwlP8X1H3HmDR8kbzzRTf3/pYdWtsz8eQullt3Bsafgick7G1
	4SJvARDOYXRc0SHPhevj+AJ29yRjueP42LxwasQyzZztfBUpdvqurOdPLwdawnAlT624NmaCjdC
	2hFNFYUx0dxfnkGIxX7eWB1LAark3basTdnRd7r+dH4PhD5r2YCwQFsUXnFTZg4ftQop/j380t2
	J74
X-Received: by 2002:a17:907:1c92:b0:c25:2fb9:b897 with SMTP id a640c23a62f3a-c25d5470752mr261560666b.18.1788343470268;
        Wed, 02 Sep 2026 03:04:30 -0700 (PDT)
Received: from [192.168.0.116] ([81.79.79.1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25cffc5d85sm104365766b.1.2026.09.02.03.04.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 03:04:29 -0700 (PDT)
Message-ID: <b9fb4967-0fbd-4abb-8244-1b80c46fb1e0@ursulin.net>
Date: Wed, 2 Sep 2026 11:04:29 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] drm/sched/tests: add a UAF regression test for
 get_timeline_name()
To: "Jonghyuk Kim(MalHyuk)" <malhyuk97@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Philipp Stanner <phasta@kernel.org>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <cover.1787928528.git.malhyuk97@gmail.com>
 <83d1cde658ad4c34080398ea89fc17dc1e87d5ae.1787928528.git.malhyuk97@gmail.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <83d1cde658ad4c34080398ea89fc17dc1e87d5ae.1787928528.git.malhyuk97@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 28/08/2026 15:57, Jonghyuk Kim(MalHyuk) wrote:
> Add a KUnit test that reproduces the use-after-free fixed by the previous
> patch. It holds a reference on a job's finished drm_sched_fence (standing
> in for a userspace sync_file), frees the mock scheduler, then calls
> get_timeline_name(). Before the fix this triggers a KASAN
> slab-use-after-free read of the freed scheduler; after it the test passes.
> 
> The test needs no hardware - it exercises the drm_sched core through the
> existing mock scheduler under KASAN.
> 
> Signed-off-by: Jonghyuk Kim(MalHyuk) <malhyuk97@gmail.com>
> ---
>   drivers/gpu/drm/scheduler/tests/tests_basic.c | 65 ++++++++++++++++++-
>   1 file changed, 64 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/tests/tests_basic.c b/drivers/gpu/drm/scheduler/tests/tests_basic.c
> index a5a5a35a87b0..2c6744b58f04 100644
> --- a/drivers/gpu/drm/scheduler/tests/tests_basic.c
> +++ b/drivers/gpu/drm/scheduler/tests/tests_basic.c
> @@ -555,9 +555,72 @@ static struct kunit_suite drm_sched_credits = {
>   	.test_cases = drm_sched_credits_tests,
>   };
>   
> +/*
> + * Reproduce the drm_sched_fence get_timeline_name() lifetime bug.
> + *
> + * drm_sched_fence_get_timeline_name() dereferences fence->sched->name, and the
> + * drm_sched_fence ops keep .release set, so the fence is NOT ops-detached on
> + * signal (unlike stub fences). A driver that frees a per-context
> + * drm_gpu_scheduler while userspace still holds the exported ->finished fence
> + * (via sync_file / drm_syncobj) leaves fence->sched dangling; reading the
> + * timeline name then touches freed slab memory (arbitrary-read once the slab is
> + * re-sprayed). Confirmed instances: amdxdna, nouveau, msm. Same class as
> + * CVE-2025-38703 (xe) and CVE-2025-71302 (panthor). KASAN reports a
> + * slab-use-after-free READ in drm_sched_fence_get_timeline_name.
> + */
> +static void drm_sched_fence_get_timeline_name_uaf(struct kunit *test)
> +{
> +	struct drm_mock_sched_entity *entity;
> +	struct drm_mock_scheduler *sched;
> +	struct drm_mock_sched_job *job;
> +	struct dma_fence *finished;
> +	const char *name;
> +	bool done;
> +
> +	sched = drm_mock_sched_new(test, MAX_SCHEDULE_TIMEOUT);
> +	entity = drm_mock_sched_entity_new(test, DRM_SCHED_PRIORITY_NORMAL,
> +					   sched);
> +	job = drm_mock_sched_job_new(test, entity);
> +
> +	/* Arm + submit first; the s_fence is only created by drm_sched_job_arm(). */
> +	drm_mock_sched_job_submit(job);
> +
> +	/* Independent reference on the finished fence == userspace sync_file. */
> +	finished = dma_fence_get(&job->base.s_fence->finished);
> +
> +	/* Let the job get picked up (hw_fence created), then signal + finish. */
> +	done = drm_mock_sched_job_wait_scheduled(job, HZ);
> +	KUNIT_ASSERT_TRUE(test, done);
> +	drm_mock_sched_advance(sched, 1);
> +	done = drm_mock_sched_job_wait_finished(job, HZ);
> +	KUNIT_ASSERT_TRUE(test, done);
> +
> +	/* Free the per-context scheduler while the finished fence is held. */
> +	drm_mock_sched_entity_free(entity);
> +	drm_mock_sched_fini(sched);
> +	kunit_kfree(test, sched);
> +
> +	/* UAF read: fence->sched->name is read from the freed scheduler. */
> +	name = finished->ops->get_timeline_name(finished);

It would be better to use the API (dma_fence_timeline_name()). It should 
still reproduce, no?

Bigger question is does this belong in the scheduler unit tests. 
Strictly no, there is no requirement scheduler fences have to be 
exported to userspace. De facto yes, most (all?) DRM scheduler users do 
it so I guess pragmatic thing would be to allow it.

Perhaps not in tests_basic.c but chuck it to a new tests_integration.c 
and call it drm-sched-dma-fence-uaf or something?

Regards,

Tvrtko

> +	kunit_info(test, "get_timeline_name() on stale fence returned %p\n", name);
> +
> +	dma_fence_put(finished);
> +}
> +
> +static struct kunit_case drm_sched_fence_uaf_tests[] = {
> +	KUNIT_CASE(drm_sched_fence_get_timeline_name_uaf),
> +	{}
> +};
> +
> +static struct kunit_suite drm_sched_fence_uaf = {
> +	.name = "drm_sched_fence_uaf_tests",
> +	.test_cases = drm_sched_fence_uaf_tests,
> +};
> +
>   kunit_test_suites(&drm_sched_basic,
>   		  &drm_sched_timeout,
>   		  &drm_sched_cancel,
>   		  &drm_sched_priority,
>   		  &drm_sched_modify_sched,
> -		  &drm_sched_credits);
> +		  &drm_sched_credits,
> +		  &drm_sched_fence_uaf);

