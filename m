Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44050416841
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789375811; cv=none; b=ZhVqBwTNzSuyjbA7iVvc8PaJdz6ZPvL7A9RI7Q68O+gi4KKdMe03Q6aRo1nF7ANo0nRz07p0otgJRH4VsuhrIpmAYNf2aOifFVJLR690FcdpQz895qHzDqzIq6/PM8Y5K1NPE0fYkdBh0pwRP/2dNMi280DcHZh9eit6yUfJoc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789375811; c=relaxed/simple;
	bh=nX7xohuQ6ZoALF+2vBNmFTEDfYMLb3I5AgTRB506B/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZKzKhOyw44fVqygKC13S2hyp2eD6a+FqngHX2rgmvPsGV3LRMI3+Y6RKvGTUbH3H1ziyqsvFZf68N8+k4PfXk2G+BaXVP40HopSUze3RPJR5A/tNpSQ6icOLiMfZnuUHUAxkoUnC3KNWC8yvvNMspuoDHWFmAiZpzdh+Pcg7RDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=eRW76e9t; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="eRW76e9t"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=yo1GY2MmHk7QkRRi3OS89hQv0DuDbZf77cOD7Bv/K5Y=; b=eRW76e9t/pKTx1me4kK1FgrslX
	FcOydG2QkjPDCEl3kafNg4I7hgGm0N3GKptacHZxPUYXZkpd3o/CXrGlg9WeS6re2TIbRkzT4HgHz
	aPNYo/EVl2lhq9SiK3W4+WeFrDx9fRyAD4ImuQRB2FEaB5aSffL5b/dLTFy8vlNuhZg62oIPGuzoB
	SLhrBxXdmKtuAwWYiIT81QpsXke97GE40qeODzAwT85KHUqo6VaTTerzZFp0vhdb3518+XJpxXzEU
	EzSvQKOyfJfBkjp5BZZKKc4aH7t73ptr6o87zl5NTBtLTsyvhyaf6UcG7ndPdgaapLHjpL2HbyMmw
	PM3xk9Jg==;
Received: from [81.79.79.1] (helo=[192.168.0.116])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1x62NY-001mqE-SS; Mon, 14 Sep 2026 10:49:32 +0200
Message-ID: <b4f017cc-3dbf-416c-b456-0c19d2f0647a@igalia.com>
Date: Mon, 14 Sep 2026 09:49:31 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Increase drm_mock_sched_job_wait_finished
 timeout when CONFIG_HZ=100
To: David Gow <david@davidgow.net>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, kunit-dev@googlegroups.com
References: <20260913084155.520015-2-david@davidgow.net>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20260913084155.520015-2-david@davidgow.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 13/09/2026 09:41, David Gow wrote:
> The drm_sched_scheduler_overhead_tests tests hardcode a timeout of 5x
> total_us, and fail if it's exceeded. However, on systems with
> CONFIG_HZ < 250, this tends to fail.

Systems plural or just UML? I suppose if no hrtimer support and low HZ 
it is plausible since executing the tests needs 1000 x 1ms hrtimer 
callbacks to fire.

Anyway, increasing the tolerance is okay-ish, with the -ish part being 
that it would be even better to skip if test could know before hand on a 
particular system it would be uselessly slow. Hence I am curious whether 
it is just UML or you could point me to other specific platforms/kconfig 
combinations where you saw it fail. In which case maybe we can come up 
with a skip criteria.

Regards,

Tvrtko

> As it's possible to configure many architectures to use 100 Hz (and some,
> such as UML, hardcode CONFIG_HZ=100), increase the timeout so that the test
> doesn't fail on these configurations.
> 
> Fixes: 97ef806a5314 ("drm/sched: Add some scheduling quality unit tests")
> Signed-off-by: David Gow <david@davidgow.net>
> ---
> 
> This failure showed up on UML when testing the addition of CONFIG_DRM to
> the KUnit 'alltests' config[1]. Ideally, I'd like to see this test fixed
> (or at least skipped/disabled) on these broken configurations so that the
> alltests run is clean. (I don't actually run any CONFIG_HZ=100 configs
> other than UML, but fixing them all is ideal if we can manage it.)
> 
> If you'd rather a different implementation / magic number, let me know.
> I picked 15 here as it gave me plenty of leeway: 10 worked most, but not
> all, of the time under i386 qemu w/ CONFIG_HZ_100, and was fine with UML
> on this machine.
> 
> Thanks,
> -- David
> 
> [1]: https://lore.kernel.org/all/20260911-kunit-drm-v1-1-c5c0f18fc7b0@kernel.org/
> ---
>   drivers/gpu/drm/scheduler/tests/tests_scheduler.c | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/tests/tests_scheduler.c b/drivers/gpu/drm/scheduler/tests/tests_scheduler.c
> index 285546a2218f..02c83b5c2189 100644
> --- a/drivers/gpu/drm/scheduler/tests/tests_scheduler.c
> +++ b/drivers/gpu/drm/scheduler/tests/tests_scheduler.c
> @@ -13,6 +13,13 @@
>    * logic.
>    */
>   
> +/* We need a more generous timeout when CONFIG_HZ=100. */
> +#if CONFIG_HZ < 250
> +#define TIMEOUT_MULTIPLIER 15
> +#else
> +#define TIMEOUT_MULTIPLIER 5
> +#endif
> +
>   static int drm_sched_scheduler_init(struct kunit *test)
>   {
>   	struct drm_mock_scheduler *sched;
> @@ -88,7 +95,7 @@ static void drm_sched_scheduler_queue_overhead(struct kunit *test)
>   
>   	/* Wait with a safe margin to avoid every failing. */
>   	done = drm_mock_sched_job_wait_finished(job,
> -						usecs_to_jiffies(total_us) * 5);
> +						usecs_to_jiffies(total_us) * TIMEOUT_MULTIPLIER);
>   	end = ktime_get();
>   	KUNIT_ASSERT_TRUE(test, done);
>   
> @@ -149,7 +156,7 @@ static void drm_sched_scheduler_ping_pong(struct kunit *test)
>   
>   	/* Wait with a safe margin to avoid every failing. */
>   	done = drm_mock_sched_job_wait_finished(job,
> -						usecs_to_jiffies(total_us) * 5);
> +						usecs_to_jiffies(total_us) * TIMEOUT_MULTIPLIER);
>   	end = ktime_get();
>   	KUNIT_ASSERT_TRUE(test, done);
>   

