Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B86B2E7396
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 00:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790123173; cv=none; b=mRwU7hf3CSoXExqBCI4a3yPvANiXcPy5A7SLMqeZ3fn8+aI9F/Odf+daEcGGgje4Vf/7m7E37fwiXzztF6T5VbmOKyBp2ti4/PlCyBqa+CrsyPDKCqMyOfCpNktkls5B9BYAyuCEkkFroKsFUlzxUCRb8vK3MFGIE8IB4A+MZ2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790123173; c=relaxed/simple;
	bh=KblCp5Jc0jNWn7Y/dXJ1lznx/zRC/if0zz0c3bQPz54=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rjFcHQF4YeAAjUH35UObLfn/4FJJImB/DeuQfjnvBsUmq6gBtWMG8X3bN/H95pDYfzZ4Atf7pGh6t+vKZz6TlGIBf2LJU0fozT5mIwKXN6qrVEJsBhAUdTHSWqYBK1nzJO4heVUb9YVw/879yMTP65N7srRkkgAMLxE9rT3f3RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NM+5MJI7; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NM+5MJI7"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d91c22d27dso1480815ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 17:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790123171; x=1790727971; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=073LFNHYNcDRZAaaJHUMAvNgAbfdcL8a4X1+nmCa0A8=;
        b=NM+5MJI7bDkDWsdZ5nBV+xteqctAs+v2GP3NLrWRb3SB9HC0oNCc6xuM72z2NiN1eo
         FibvgmWR/yiCz7Ajt/Y8L8MClLTF3/aD6o5l/1u3dKtT8Z8JsvV9ZsAfErz75rO5kxN4
         ZrAs59A3+KbfZgx3yN5OhC4MJPMj6LBgkocE9v2BE+9adz78lHlWMcj0CRxyALUOAdoe
         dJ4QD9qkW33EkWk/X7UCmGzFcp2H3Cop43dbyUFRi9lrV31hgk4+Fw2R6XDibCQsB/Qx
         jjmnXWz/3mlfemDrKRoTWN+c+vN6hT5HdKLKYrCY/QunZs+m6zedPwsmR5ZVATESeZ6Q
         aTgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790123171; x=1790727971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=073LFNHYNcDRZAaaJHUMAvNgAbfdcL8a4X1+nmCa0A8=;
        b=td+LXnRCU9s+F3mFNRLjQvWW+uaT0Tql0rYcoBKxg3lZrBsL49o5ecrfLUua5smvJW
         TQfUGYyjqfSKpBVjUXg2G0Qc1DyI9CFTwwsUtKh041LRblLHLnCJerlc0JcIwMoO5Hep
         AuQBhFsB2Lt1znf6QU4wncfM2s0yFaTf6nqokFCjK4IyCDUch2cj7vts8vBp/HNyOFhO
         r/tYF3eZ5aGYlUp3whKttxXxV1IOG193nQ801jMi8psS2DbXUt+g4h/TjIT1jO6PVIaB
         7gNfsGOOZZZND35vF5jd9l4i4rZJsUEwsyzH5dPgqDp8PAlPhDtuDp4R2J7hW+Cqotp5
         hj6Q==
X-Forwarded-Encrypted: i=1; AKwUvBxqSJGClc8xHqf2os6U9TTz8Ruq6Vva6VuFwhiF2qXEzJfEHWWVlUJdVA339Rthl5U3oM0paXqA+Gqg0KU=@vger.kernel.org
X-Gm-Message-State: AFuF++nEYV4BIVQbOLnNLy7KybF3ZPNrbmqKp87qq3o9jJYk9Wo+Mba7
	BMccOcxVNqTjIygmIaQUXnlTHdQSDVVBJhtC7CoLjDYAdRwQdle95NU=
X-Gm-Gg: AYBFou0Sr7oZj89qtrd+Jvix6ejjsUSPlDv9lD8VwrNExHIEbfczmKh73goECL30RqM
	7xbQFltc6H8f5p947sw/n9sF19xlID3zP3Mb4B192LtMnlrW3ECJZObdhdcNzCoIzzQcZf+Eteg
	SPxRStd7KOujsHe2YvSWYwOp6/FstXwRf9THzbf5mHqBVipByqCS+rB87owMsjcnRrX3Icxat/D
	zzLLUG7jFDCGsWFOUiAarO7Mx2GKBgJ3J85iNZ2Z5P13yHM84o4oCagalglc0f9lNz3jTbhgj9x
	kQIBDomWOB5eC7/qw5yVIYSjMRB31WCNJFIT5xKeGQRmzhXp4u9qpKp+Vq5NjihyspRJECoc+Tf
	SpYF+mrEk5cgFZWcRY1bcq87BiXRyyyI65Loka9/JQBLTVY8wqyk8tP0adba3VrjDe3SM9n6ZNA
	iFd5fMBfnuzj6O1TTSoM2VwG9u3OBrhQcIgZcAu8r9aTPhPK0el4U06MihzoioRWb+hcqaKSimm
	vJSjjpYQzGl4qww8jpew/7+s9j87vIkYmkmN9U=
X-Received: by 2002:a17:902:f683:b0:2df:3872:f266 with SMTP id d9443c01a7336-2df69d0c450mr8862005ad.8.1790123171214;
        Tue, 22 Sep 2026 17:26:11 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f00:8c85:2466:805a:e198:cde8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5a7b76sm2176595ad.20.2026.09.22.17.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 17:26:10 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: sj@kernel.org,
	akpm@linux-foundation.org
Cc: damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: [PATCH v4 2/2] mm/damon/tests/core-kunit: test the temporal tuner's size quota conversion
Date: Wed, 23 Sep 2026 09:25:59 +0900
Message-ID: <20260923002600.1825448-3-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923002600.1825448-1-donggeunyoo.kernel@gmail.com>
References: <20260923002600.1825448-1-donggeunyoo.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

damos_goal_tune_esz_bp_temporal() encodes the size quota in basis
points, so the conversion is exact only up to ULONG_MAX / 10000.  Pin
the three sizes around that boundary: the largest one that fits, the
first one that does not, and ULONG_MAX.

Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
Reviewed-by: SJ Park <sj@kernel.org>
---
 mm/damon/tests/core-kunit.h | 48 +++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/mm/damon/tests/core-kunit.h b/mm/damon/tests/core-kunit.h
index df84d9cc7d204..bb20c6d01b692 100644
--- a/mm/damon/tests/core-kunit.h
+++ b/mm/damon/tests/core-kunit.h
@@ -2242,6 +2242,53 @@ static void damon_test_rand(struct kunit *test)
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
@@ -2281,6 +2328,7 @@ static struct kunit_case damon_test_cases[] = {
 	KUNIT_CASE(damon_test_is_last_region),
 	KUNIT_CASE(damon_test_walk_control_obsolete),
 	KUNIT_CASE(damon_test_rand),
+	KUNIT_CASE(damos_test_esz_goal_temporal),
 	{},
 };
 
-- 
2.53.0

