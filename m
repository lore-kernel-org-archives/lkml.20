Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7D638B125
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 08:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.242.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789289339; cv=none; b=W2mty6+eGrEsWl8qqg8sxaqm6tzBXF71gIg/ie5gr7lCI6ico7WkkjApY+3K5BpvW8A8oVZV+sf0oi5nQ/MCeae6hCFBcltrK6FiIp+PT96SIYc7irwhUzgEZt7WeYFdnriMp4lB5HAQNIJE4rZU0eSeG1NoX5N3JQaHhmvvirY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789289339; c=relaxed/simple;
	bh=zwV8oql13j89d6eiGuYvTed4aS4jSLVMLZEjL6mhJ+c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e9tb2zh4NbR7QCI8G8VJ2pbF22FAZDknSsh6NOpbmntQ25wh2eVBVqbmlVb+eUokr0u7abAB5HV5dSk8zQwrb6QbYZx3oK665+gkvs/Zzio4cV37fY6jZGDcROYMHZXoxhEpANF2JmTJ7YlpA+6Kdbs9HxJYYLNL8KoEEhee8Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; arc=none smtp.client-ip=203.29.242.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id CD6BF1EAB32; Sun, 13 Sep 2026 16:48:54 +0800 (AWST)
X-Spam-Level: 
Received: from shelley.lan (unknown [IPv6:2001:8003:8802:7000::41b])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id 0CEB01EA3A1;
	Sun, 13 Sep 2026 16:48:53 +0800 (AWST)
From: David Gow <david@davidgow.net>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: David Gow <david@davidgow.net>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Matthew Brost <matthew.brost@intel.com>,
	Philipp Stanner <phasta@kernel.org>,
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	kernel-dev@igalia.com,
	kunit-dev@googlegroups.com
Subject: [PATCH] drm/sched: Increase drm_mock_sched_job_wait_finished timeout when CONFIG_HZ=100
Date: Sun, 13 Sep 2026 16:41:53 +0800
Message-ID: <20260913084155.520015-2-david@davidgow.net>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The drm_sched_scheduler_overhead_tests tests hardcode a timeout of 5x
total_us, and fail if it's exceeded. However, on systems with
CONFIG_HZ < 250, this tends to fail.

As it's possible to configure many architectures to use 100 Hz (and some,
such as UML, hardcode CONFIG_HZ=100), increase the timeout so that the test
doesn't fail on these configurations.

Fixes: 97ef806a5314 ("drm/sched: Add some scheduling quality unit tests")
Signed-off-by: David Gow <david@davidgow.net>
---

This failure showed up on UML when testing the addition of CONFIG_DRM to
the KUnit 'alltests' config[1]. Ideally, I'd like to see this test fixed
(or at least skipped/disabled) on these broken configurations so that the
alltests run is clean. (I don't actually run any CONFIG_HZ=100 configs
other than UML, but fixing them all is ideal if we can manage it.)

If you'd rather a different implementation / magic number, let me know.
I picked 15 here as it gave me plenty of leeway: 10 worked most, but not
all, of the time under i386 qemu w/ CONFIG_HZ_100, and was fine with UML
on this machine.

Thanks,
-- David

[1]: https://lore.kernel.org/all/20260911-kunit-drm-v1-1-c5c0f18fc7b0@kernel.org/
---
 drivers/gpu/drm/scheduler/tests/tests_scheduler.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/tests/tests_scheduler.c b/drivers/gpu/drm/scheduler/tests/tests_scheduler.c
index 285546a2218f..02c83b5c2189 100644
--- a/drivers/gpu/drm/scheduler/tests/tests_scheduler.c
+++ b/drivers/gpu/drm/scheduler/tests/tests_scheduler.c
@@ -13,6 +13,13 @@
  * logic.
  */
 
+/* We need a more generous timeout when CONFIG_HZ=100. */
+#if CONFIG_HZ < 250
+#define TIMEOUT_MULTIPLIER 15
+#else
+#define TIMEOUT_MULTIPLIER 5
+#endif
+
 static int drm_sched_scheduler_init(struct kunit *test)
 {
 	struct drm_mock_scheduler *sched;
@@ -88,7 +95,7 @@ static void drm_sched_scheduler_queue_overhead(struct kunit *test)
 
 	/* Wait with a safe margin to avoid every failing. */
 	done = drm_mock_sched_job_wait_finished(job,
-						usecs_to_jiffies(total_us) * 5);
+						usecs_to_jiffies(total_us) * TIMEOUT_MULTIPLIER);
 	end = ktime_get();
 	KUNIT_ASSERT_TRUE(test, done);
 
@@ -149,7 +156,7 @@ static void drm_sched_scheduler_ping_pong(struct kunit *test)
 
 	/* Wait with a safe margin to avoid every failing. */
 	done = drm_mock_sched_job_wait_finished(job,
-						usecs_to_jiffies(total_us) * 5);
+						usecs_to_jiffies(total_us) * TIMEOUT_MULTIPLIER);
 	end = ktime_get();
 	KUNIT_ASSERT_TRUE(test, done);
 
-- 
2.55.0

