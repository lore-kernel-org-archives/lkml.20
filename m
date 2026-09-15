Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38943440636
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 06:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789452592; cv=none; b=WRe0O0LWnLNYqefPFKnfgPOi6Mty9JG/DpaqeEH/I9KyYwdBoUlh9VBtEhHGrm95nHKblLJKMZApNa4jyKi0izG/IyBRiKP2P7fKLN4fBFiPcJaANasGgQNZnNztjLp50Ved02Qi9KzLNDpI2r4t1IlWyOkLCNZOCaAU6gBCuOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789452592; c=relaxed/simple;
	bh=FaG65pZ6DeseFsP335fpFfB3OsL20xr26Do9BjzVW4g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=K0n1ziYdLbEIlrxmdW+47BaBSsKBrrxSdRNGnAhIt4Y+cbe4i2Y3H30WDviV28+iy0xMpm8Hmy5YZw9Z5wJ22/rmR8vrjrHosm/+eH1X9kWviN8SBF/iYVYhrH4+hRWQlBUIo5kpYiV3AFDtuacItXVyTAdtMpjTgACUDP/LZcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XgAqPGM8; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XgAqPGM8"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso22450485e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 23:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789452588; x=1790057388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=17npcWfNhvbB0tYfjU0bxEFrefgovxZItMHI62tmYzU=;
        b=XgAqPGM8Pto0Nh4ppLVQtP1Ww4+7BDt6HqAsD6myhg8s4qYB8++MVLuSVt1ORSR8WJ
         LAlk6OGf5oLczW2+vpx4MwP5YjQHz/eiWiIfJ0aWm8GLGufVZ7onfV6Czi30uRqOFq8e
         Ue5jbNlOSUQiToXo1J/Bk6wjRLi06wVxk8adpWAWehn9xEe0HzOIfqo6z4obvu4JYNZI
         4dGbraaURUEPiw6lBFOyjzDYUzzmOZ5ilMBeW+WyaPIKNurdXjzjHypUyRsiuz7CGTfv
         x8igF5O3zXrGQRA0HGCcCVU/Bwqvll9KYnxANZ1EIr2CnwA6BSdYSZQlzHVSzYreW3Mh
         Xr9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789452588; x=1790057388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=17npcWfNhvbB0tYfjU0bxEFrefgovxZItMHI62tmYzU=;
        b=cdcMFW+LnL77KLv4srHWrEIRwyN8WB8ZiV/9ewOOyiokQwDyMvleGWz1W6+ZcOXvyA
         vXKnWuWJC4y6FM2BUM2Cd6u0ZPTraCSE/OqkRCBcMsz81RdkEfMiBbTzUNgb1bYxXtPj
         +wl5S/3LItKXf0b8vf3fGGrbkA3esyot6fJv1XFNzJmOUiZDQBLDFWGZ2sOhM3FDYr2z
         zQl/0Zg8lQbQwA9aCQ0mSFQ3FsoSCML6BaHU1am7tOs6p3oVg86jKebR4/SDHYkYhwHY
         j8o1agSjTt4b+JD3VOyPgBOyLi5Ho+4kQwariTAWZke15tvjHymr+iJb49Ulef4NzYoB
         TWsg==
X-Forwarded-Encrypted: i=1; AKwUvBxx2fQI15lyyZ2aV+wSxGUz7CdmOGhL5EaDYOXVBnelAtyUhys17CVui4xAB3ptWSBNFsAZtKFWdIlekO4=@vger.kernel.org
X-Gm-Message-State: AFuF++kI2kaYCrsXK/rTTIW46B7JyFoMdsNvcmfmtYGIcJZHlJjmEles
	QPrxc9Fob04cdz4M2D656ROLa1Ip4zU5/xv/T8arF69Rt1fiuaghs9ES
X-Gm-Gg: AYBFou1fXuZVIOT2nSq0f4Oh46MZWLho/qP7h2ePlDJjT9lZHAnU0jDO+z7Bwt3WD1P
	DJV60rDehcUOGqHyATYBdmI88X+ZoNdUOusMmmdbF/U7vFr6HS5OzSBR5uD3nmlyjIxdw+fnzFV
	i1fadgp6FJ0C7Ox3yoDWC+q1JmasthqMkqF6Ou8t+gQNts4t4IHRShCec8vZgrHZzPj4O4PcgH9
	vYXs0x0/GXaFJV5NPludEINQl61zi2fZ/jcrpN84hdvxKcWREWj2HKJPolFkLrqBwfcJc/bjH4y
	TaGXFihU8bJY8Gx5XRR6hjOlbTHAg3c4dppQZeUpsPqBpyZKc8Jr7K12vDa2ZPOxHfUkg/8DzmA
	8mInHVhA7KG94B2WyqNcIuzCSYH67fyaSu2QRFhBgw03nSU36g24+5Fr/inhuNM9KVTKG1XqhdT
	SN6wlqmQlJPj4+lqIyHCG4/4CnK6J945Qm8KSv94cMqKOQTj4mq1zDNqe1wm8T2vuUz38hOVhZm
	u35hFGLpTjeIzxTt+uwf+wB4pVRbjiQR9oNiHbKzuHuCqBe0g6jDtsAMM+t8H0EvbE/OZAc+XEw
	tV6p+VoQXi5ZZs1Dk+S61WKHszI352NUzZkcWOdETaYVW8qtfZchfAGu6UJ4BEg+980ypHtHw3L
	yK8v3AxXgTuqHmVlY
X-Received: by 2002:a05:600c:6297:b0:498:943:ccc0 with SMTP id 5b1f17b1804b1-49e7a654dfemr129105045e9.6.1789452588005;
        Mon, 14 Sep 2026 23:09:48 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-afd5-c801-cc65-9ba1-765b-bff6.310.pool.telefonica.de. [2a02:3100:afd5:c801:cc65:9ba1:765b:bff6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d27c88fsm44282905e9.2.2026.09.14.23.09.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Sep 2026 23:09:47 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lian Wang <lianux.mm@gmail.com>,
	Kunwu Chan <kunwu.chan@gmail.com>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] mm/damon/tests/core-kunit: test PSI goal rounds under the temporal tuner
Date: Tue, 15 Sep 2026 08:09:37 +0200
Message-Id: <20260915060937.3423-3-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260915060937.3423-1-kmehltretter@gmail.com>
References: <20260915060937.3423-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Exercise a PSI quota goal under the temporal tuner on its first
round, its next measured round, and after a goal commit. Use
ULONG_MAX as the target so the goal is not reached during the test.
Then check that a measured round which does reach the target sets
the quota to zero, and that the consist tuner keeps its quota over
an unmeasured round.

Without the previous patch, the first and the post-commit checks see
a zero quota.

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 mm/damon/tests/core-kunit.h | 69 +++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/mm/damon/tests/core-kunit.h b/mm/damon/tests/core-kunit.h
index c01e6a75cadc..2b9b24ce7dad 100644
--- a/mm/damon/tests/core-kunit.h
+++ b/mm/damon/tests/core-kunit.h
@@ -889,6 +889,74 @@ static void damos_test_commit_quota_goal(struct kunit *test)
 			});
 }
 
+/*
+ * Unmeasured PSI goals must not disable the temporal quota.
+ * Keep sz * 10000 within a 32-bit unsigned long.
+ */
+static void damos_test_set_effective_quota_temporal_psi(struct kunit *test)
+{
+	struct damon_ctx *c = damon_new_ctx();
+	struct damos_access_pattern pattern = {};
+	struct damos_quota quota = {
+		.sz = SZ_64K,
+		.goal_tuner = DAMOS_QUOTA_GOAL_TUNER_TEMPORAL,
+	};
+	struct damos_watermarks wmarks = {};
+	struct damos_quota_goal src = {
+		.metric = DAMOS_QUOTA_SOME_MEM_PSI_US,
+		.target_value = ULONG_MAX,
+	};
+	struct damos_quota_goal *goal;
+	struct damos *s;
+
+	if (!c)
+		kunit_skip(test, "ctx alloc fail");
+	s = damon_new_scheme(&pattern, DAMOS_STAT, 0, &quota, &wmarks,
+			NUMA_NO_NODE);
+	if (!s) {
+		damon_destroy_ctx(c);
+		kunit_skip(test, "scheme alloc fail");
+	}
+	damon_add_scheme(c, s);
+	goal = damos_new_quota_goal(DAMOS_QUOTA_SOME_MEM_PSI_US, ULONG_MAX);
+	if (!goal) {
+		damon_destroy_ctx(c);
+		kunit_skip(test, "goal alloc fail");
+	}
+	damos_add_quota_goal(&s->quota, goal);
+
+	/* fresh goal, first tuning round */
+	damos_set_effective_quota(c, s);
+	KUNIT_EXPECT_EQ(test, s->quota.esz, (unsigned long)SZ_64K);
+
+	/* second round: last_psi_total is initialised now */
+	damos_set_effective_quota(c, s);
+	KUNIT_EXPECT_EQ(test, s->quota.esz, (unsigned long)SZ_64K);
+
+	/* commit a PSI goal onto the initialised PSI goal */
+	damos_commit_quota_goal(goal, &src);
+	damos_set_effective_quota(c, s);
+	KUNIT_EXPECT_EQ(test, s->quota.esz, (unsigned long)SZ_64K);
+
+	/* a measured round that reaches the target disables the quota */
+	goal->target_value = 10;
+	goal->last_psi_total = damos_get_some_mem_psi_total() - 10;
+	/* U64_MAX marks an unmeasured goal, keep the sample away from it */
+	if (goal->last_psi_total == U64_MAX)
+		goal->last_psi_total--;
+	damos_set_effective_quota(c, s);
+	KUNIT_EXPECT_EQ(test, s->quota.esz, 0ul);
+
+	/* the consist tuner keeps its quota over an unmeasured round */
+	s->quota.goal_tuner = DAMOS_QUOTA_GOAL_TUNER_CONSIST;
+	s->quota.esz_bp = SZ_32K * 10000;
+	damos_commit_quota_goal(goal, &src);
+	damos_set_effective_quota(c, s);
+	KUNIT_EXPECT_EQ(test, s->quota.esz, (unsigned long)SZ_32K);
+
+	damon_destroy_ctx(c);
+}
+
 static void damos_test_commit_quota_goals_for(struct kunit *test,
 		struct damos_quota_goal *dst_goals, int nr_dst_goals,
 		struct damos_quota_goal *src_goals, int nr_src_goals)
@@ -1887,6 +1955,7 @@ static struct kunit_case damon_test_cases[] = {
 	KUNIT_CASE(damos_test_new_filter),
 	KUNIT_CASE(damos_test_commit_quota_goal),
 	KUNIT_CASE(damos_test_commit_quota_goals),
+	KUNIT_CASE(damos_test_set_effective_quota_temporal_psi),
 	KUNIT_CASE(damos_test_commit_quota),
 	KUNIT_CASE(damos_test_commit_dests),
 	KUNIT_CASE(damos_test_commit_filter),
-- 
2.53.0

