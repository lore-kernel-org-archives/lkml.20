Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2DB2BE034
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 02:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789871495; cv=none; b=V/vPMYeULBdeiXOymOUBU4yajYmRQXIqlasY7h0Gcwdmo9e2y+vQnWaMEnt1tlPnDvA1kYeYA8pR1gfJv/OHMX4ec1qB0o/6RkcF8UR+VDj5U2h1vlAaraiwStpmOVzOELOTcHtPGpBTGLAGasQsG3+cEHNrRLqTL0ELLx1WMh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789871495; c=relaxed/simple;
	bh=gCSp4fLALR9AlO+8Sxd7XKtxyIR4PXe+RtMvtM/vFr0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DnEfMmNRwnLPIV9lRD86DtYZu10L3VKOtZpPdizv34cwEFbcGDQJscWeLRao+UyOWcz+M/vGQDyE5EVuvGhayqLdvTskA8MsiXXqeWJ2zmHBNKVzsUeTLQIqeJfxI/ZmcO0wdBmtiL1TRcEAn3ViuKBoccw1Chp7kzAccivCrV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W3dx+KfN; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W3dx+KfN"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469f20513so1618869b3a.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 19:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789871482; x=1790476282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MCQCwXtMyVG3gFC0VFWbPq0+zT3uX69pml+4GH4Kjjo=;
        b=W3dx+KfNoV9HzjMMop57Z+A7Ptm2AOwMtBeRB9NhHpEEX1B57bF1RJDMgE22kbeWJw
         J1wmiOO7h6yPMrwp5OwaQyPS2Ed0qducg/uAlfxg6HPw8AcUnaDv5igLIy+Xe7xJ2U3q
         XJFNehZwwgq5WqyQYM7OCmGBw1zEKILhXTIcC9A6o1rzRcjgAmLjw2MmmpdoDlpKZpSp
         VGmvocnS6Vdtzn/hoYr7NwCpHbyoDL/pSUihgjOHUY+RKvTr+h8zionI7NGPF5gkkfh5
         /9umqbfnxdCUeTLaKDy6ZKBiJAPUEiij3EAfO93T18w6NHWJxbTSm+Lu8A1l5k6r8SM3
         NGKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789871482; x=1790476282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MCQCwXtMyVG3gFC0VFWbPq0+zT3uX69pml+4GH4Kjjo=;
        b=B7XERtXdYqHvJOE2BzZHADmiuP8Gcnc27Has3WHaJaXaktzT9XqTNR5g76lvpcrj0/
         rqLgl07S+TMITeQxPD5PGAWAGhju+QqeiuceqpH3uLB0zln+23Xq3RyjNW9ahpqQthxC
         7wRB9vzsTvw2SRLNJQs8MAQ563RZTGsH9fSgIPPy90FLMWWjy9qAwplwvWoVk30i85C7
         NvADHIZi9iifzhaudi6vA9CbIm1AQpywBEwYov+xM5J+Km99sSmS6dPjte78mrjQIJAS
         +RPOQu4guHdx/walA/D8YmFVF2mzT7aZaht71bagVlvEijPE2oSYcQMcpnKetbQYtID3
         TF5w==
X-Forwarded-Encrypted: i=1; AKwUvBxgSA8rBxoCtRkr/sWCoKYCnqFYkr2o6SgQqrG3+/E6H1SYE2FD4XMTAs4ewMUPMZOvPyQ4sE2EvO59anA=@vger.kernel.org
X-Gm-Message-State: AFuF++lQzV1l/SvweaCPijcunSYxVA/RXLjXkewy3mFxr8sNa4GhukyB
	XOjMmAVDrEFAsl4oMZ/Mj9aZy8wLl4XVWfljGSyb+6CrhctMMnF0pGc=
X-Gm-Gg: AYBFou2bRxH0I4TFjzdNAZ2ruwpdFDDbrLooygkywXTqebDxdm8so4iCiV/0Lxm7N/F
	lX2kLopLwWIj0eO/X0tpyWxoTo9FdraE/ZD9VifpFEDyAXDMLOIgOW+Rqj9gMXvIdfoTIRTe8qc
	mWe0VKWJQwoIv+BpU67Xy6F/JZSa9sH5nOSDijQ4l9ZbFK1zZjDLXiqyCiMWdM3zkJnAUDvqj94
	cwTHK8x2M4TDClzme7p2Z9dca/WKZrg+8C7HeO7zYnQBbYeP1s5D/+jij1cc6Ilc+87AHROnP48
	a656onYAmXqeW6jDowf94CECqm2w7e4fDmKXs8ZiFAdAR/pBrLo091IrdaZHKfestpjqUpFe7tz
	iyWR/Y+KHqpffTUW4w7AQMk6x24m4kpk/O7eSRii2fxe4xQqq4nSxjx0ekwFc8J4t3XYU8K09e8
	70qSABll9t2gGYR6ccfr0fvq6mblZXys65BRWRaG7ol/jIPtE1Vu+rvuna7mzObHNkEkVhxUqwV
	pBnjkjGJDZ+TAfDmEB+sMgqhw==
X-Received: by 2002:a05:6a21:3510:b0:3cc:c7cf:5a44 with SMTP id adf61e73a8af0-3dd8c3fbf58mr12345243637.2.1789871482415;
        Sat, 19 Sep 2026 19:31:22 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f00:8c85:36d8:54a:e0bc:3e5e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc72aee03efsm1481341a12.24.2026.09.19.19.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 19:31:21 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: SJ Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: [PATCH v2 2/3] mm/damon/tests/core-kunit: test the temporal tuner's size quota conversion
Date: Sun, 20 Sep 2026 11:31:10 +0900
Message-ID: <20260920023111.2466265-3-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260920023111.2466265-1-donggeunyoo.kernel@gmail.com>
References: <20260920023111.2466265-1-donggeunyoo.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

damos_goal_tune_esz_bp_temporal() encodes the size quota in basis points,
so the conversion is exact only up to ULONG_MAX / 10000.  Pin the three
sizes around that boundary: the largest one that fits, the first one that
does not, and ULONG_MAX.

Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
---
 mm/damon/tests/core-kunit.h | 48 +++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/mm/damon/tests/core-kunit.h b/mm/damon/tests/core-kunit.h
index 5ff0436c58441..a0604788bc638 100644
--- a/mm/damon/tests/core-kunit.h
+++ b/mm/damon/tests/core-kunit.h
@@ -1929,6 +1929,53 @@ static void damon_test_rand(struct kunit *test)
 	}
 }
 
+static void damos_test_esz_goal_temporal(struct kunit *test)
+{
+	struct damos_access_pattern pattern = {};
+	struct damos_watermarks wmarks = {};
+	struct damos_quota quota = {
+		.goal_tuner = DAMOS_QUOTA_GOAL_TUNER_TEMPORAL,
+	};
+	struct damos_quota_goal *goal;
+	struct damon_ctx *ctx;
+	struct damos *s;
+
+	ctx = damon_new_ctx();
+	KUNIT_ASSERT_NOT_NULL(test, ctx);
+
+	s = damon_new_scheme(&pattern, DAMOS_STAT, 0, &quota, &wmarks,
+			NUMA_NO_NODE);
+	if (!s) {
+		damon_destroy_ctx(ctx);
+		kunit_skip(test, "scheme alloc fail");
+	}
+	damon_add_scheme(ctx, s);
+
+	goal = damos_new_quota_goal(DAMOS_QUOTA_USER_INPUT, 10000);
+	if (!goal) {
+		damon_destroy_ctx(ctx);
+		kunit_skip(test, "quota goal alloc fail");
+	}
+	goal->current_value = 0;
+	damos_add_quota_goal(&s->quota, goal);
+
+	/* The largest size quota the basis-point conversion can hold. */
+	s->quota.sz = ULONG_MAX / 10000;
+	damos_set_effective_quota(ctx, s);
+	KUNIT_EXPECT_EQ(test, s->quota.esz, ULONG_MAX / 10000);
+
+	/* Any larger one saturates instead of wrapping. */
+	s->quota.sz = ULONG_MAX / 10000 + 1;
+	damos_set_effective_quota(ctx, s);
+	KUNIT_EXPECT_EQ(test, s->quota.esz, ULONG_MAX / 10000);
+
+	s->quota.sz = ULONG_MAX;
+	damos_set_effective_quota(ctx, s);
+	KUNIT_EXPECT_EQ(test, s->quota.esz, ULONG_MAX / 10000);
+
+	damon_destroy_ctx(ctx);
+}
+
 static struct kunit_case damon_test_cases[] = {
 	KUNIT_CASE(damon_test_target),
 	KUNIT_CASE(damon_test_regions),
@@ -1965,6 +2012,7 @@ static struct kunit_case damon_test_cases[] = {
 	KUNIT_CASE(damon_test_is_last_region),
 	KUNIT_CASE(damon_test_walk_control_obsolete),
 	KUNIT_CASE(damon_test_rand),
+	KUNIT_CASE(damos_test_esz_goal_temporal),
 	{},
 };
 
-- 
2.53.0

