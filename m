Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F04842124F
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.242.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789380445; cv=none; b=p01dLIPeBaDqi1qNbQ7WzK2YC+wopPxcwOGurA7RTxWOcQR6qpkx+LMbHtflydQ8UCeHbzy0m39x4Un4PFjKZM34qOdsgrd9oJiwFNAMQ7V67AV0bB19Niwg9L+716assKKTJDryj6YpGFejU4TGyz8SW9YUQ561tYVQIB/mgUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789380445; c=relaxed/simple;
	bh=hr07YaU6PFVHxAwCI6L4ceySbzfzdgQYT4svOeTD7jU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=boAwkeBTDaUeoOfW/BmVIyT5esLHdxx/nVwOTZxklaPFmcBmc4oVpLGF2ld1FERbknAcfQclggKOPMxuj3Y1VDoYZ+oJoPDBvqaUG/MrAarbcIjS/wJJabKoAIRVuQAtV59cI8PrLFWsGSbiN6ar8tRiQfutmzuzXB9uJrZQ9Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; arc=none smtp.client-ip=203.29.242.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id D6D2F1EAB58; Mon, 14 Sep 2026 18:07:20 +0800 (AWST)
X-Spam-Level: 
Received: from [IPV6:2001:8003:8802:7000::9c4] (unknown [IPv6:2001:8003:8802:7000::9c4])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id A3E3B1EAB52;
	Mon, 14 Sep 2026 18:07:18 +0800 (AWST)
Message-ID: <a03d4e21-71df-432f-b707-3c7e16a37578@davidgow.net>
Date: Mon, 14 Sep 2026 18:07:16 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Increase drm_mock_sched_job_wait_finished
 timeout when CONFIG_HZ=100
To: phasta@kernel.org, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, kunit-dev@googlegroups.com,
 Marco Pagani <marpagan@redhat.com>
References: <20260913084155.520015-2-david@davidgow.net>
 <4357c0bd2a78e88b49b7375bc18d1116df3275b6.camel@mailbox.org>
From: David Gow <david@davidgow.net>
Content-Language: fr
In-Reply-To: <4357c0bd2a78e88b49b7375bc18d1116df3275b6.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 14/09/2026 à 5:03 PM, Philipp Stanner a écrit :
> +Cc Marco
> 
> On Sun, 2026-09-13 at 16:41 +0800, David Gow wrote:
>> The drm_sched_scheduler_overhead_tests tests hardcode a timeout of 5x
>> total_us, and fail if it's exceeded. However, on systems with
>> CONFIG_HZ < 250, this tends to fail.
>>
>> As it's possible to configure many architectures to use 100 Hz (and some,
>> such as UML, hardcode CONFIG_HZ=100), increase the timeout so that the test
>> doesn't fail on these configurations.
>>
>> Fixes: 97ef806a5314 ("drm/sched: Add some scheduling quality unit tests")
>> Signed-off-by: David Gow <david@davidgow.net>
>> ---
>>
>> This failure showed up on UML when testing the addition of CONFIG_DRM to
>> the KUnit 'alltests' config[1]. Ideally, I'd like to see this test fixed
>> (or at least skipped/disabled) on these broken configurations so that the
>> alltests run is clean. (I don't actually run any CONFIG_HZ=100 configs
>> other than UML, but fixing them all is ideal if we can manage it.)
>>
>> If you'd rather a different implementation / magic number, let me know.
>> I picked 15 here as it gave me plenty of leeway: 10 worked most, but not
>> all, of the time under i386 qemu w/ CONFIG_HZ_100, and was fine with UML
>> on this machine.
>>
>> Thanks,
>> -- David
> 
> Thx for the patch. Where are you running the tests and what for, is it
> a CI or other test system?
> 

Yeah, this is generally for KUnit in CI (and, in my case, to make sure
changes to KUnit itself don't regress other tests). But KUnit tests are
also run in several different CI systems, and now on linux-next as well.

In particular, this has been caught up whilst testing adding
CONFIG_DRM=y to the KUnit 'alltests' config, which is used to get a
config which includes as many tests as possible. This is finding some
real issues, so I think it is worthwhile in general.

> 
> So one thing about the unit tests is that they were originally not so
> much intended for being run on all sorts of CIs, but as a development
> tool for the drm_sched devs to have something to move forward with.
> That's in part why they contain "scheduling quality tests".
> 
> That caused some raised eyebrows already because people run these
> lengthy tests in CIs.

Yeah, finding the distinction between KUnit as a useful tool/framework
for writing tests and KUnit as a suite of tests that should be run
automatically is a bit tricky.

Ultimately, it's a judgement call if the benefit of having the test run
more widely (potentially uncovering real issues, or discovering issues
earlier in, e.g, linux-next merges) is worth the effort of making the
test suitably robust against all of the different environments it runs in.

> Maybe what we actually should have is a split of the test suite into
> two parts, where one part covers basic sanity, and the other measures
> scheduling behavior. The former could then be run by CI folks, the
> latter explicitly be discouraged from being run by anyone who is not a
> drm_sched-developer.
> 

That definitely can be done. As-is, the way this is currently handled is
though CONFIG_KUNIT_ALL_TESTS, and through .kunitconfig files.

If you don't want tests to be caught up in automatic systems (other, I
guess, than your own), then removing the 'default KUNIT_ALL_TESTS' (and
'if !KUNIT_ALL_TESTS' from the DRM_SCHED_KUNIT_TEST Kconfig entry is the
simplest way to do it. You could then set CONFIG_DRM_SCHED_KUNIT_TEST=y
(either via a .kunitconfig file or some other means) to run them whilst
doing drm scheduler development in particular.

And, of course, splitting suites up or skipping tests if certain
prerequisites aren't met are both options for keeping tests in the more
general CI pool if you'd like.

Cheers,
-- David

> 
> P.
> 
>>
>> [1]: https://lore.kernel.org/all/20260911-kunit-drm-v1-1-c5c0f18fc7b0@kernel.org/
>> ---
>>  drivers/gpu/drm/scheduler/tests/tests_scheduler.c | 11 +++++++++--
>>  1 file changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/tests/tests_scheduler.c b/drivers/gpu/drm/scheduler/tests/tests_scheduler.c
>> index 285546a2218f..02c83b5c2189 100644
>> --- a/drivers/gpu/drm/scheduler/tests/tests_scheduler.c
>> +++ b/drivers/gpu/drm/scheduler/tests/tests_scheduler.c
>> @@ -13,6 +13,13 @@
>>   * logic.
>>   */
>>  
>> +/* We need a more generous timeout when CONFIG_HZ=100. */
>> +#if CONFIG_HZ < 250
>> +#define TIMEOUT_MULTIPLIER 15
>> +#else
>> +#define TIMEOUT_MULTIPLIER 5
>> +#endif
>> +
>>  static int drm_sched_scheduler_init(struct kunit *test)
>>  {
>>  	struct drm_mock_scheduler *sched;
>> @@ -88,7 +95,7 @@ static void drm_sched_scheduler_queue_overhead(struct kunit *test)
>>  
>>  	/* Wait with a safe margin to avoid every failing. */
>>  	done = drm_mock_sched_job_wait_finished(job,
>> -						usecs_to_jiffies(total_us) * 5);
>> +						usecs_to_jiffies(total_us) * TIMEOUT_MULTIPLIER);
>>  	end = ktime_get();
>>  	KUNIT_ASSERT_TRUE(test, done);
>>  
>> @@ -149,7 +156,7 @@ static void drm_sched_scheduler_ping_pong(struct kunit *test)
>>  
>>  	/* Wait with a safe margin to avoid every failing. */
>>  	done = drm_mock_sched_job_wait_finished(job,
>> -						usecs_to_jiffies(total_us) * 5);
>> +						usecs_to_jiffies(total_us) * TIMEOUT_MULTIPLIER);
>>  	end = ktime_get();
>>  	KUNIT_ASSERT_TRUE(test, done);
>>  
> 		

