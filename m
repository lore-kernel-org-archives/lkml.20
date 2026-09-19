Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E11639B956
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 07:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789802019; cv=none; b=GXkdhAv+XzM4HX7T+fvHbCKJx9y9DbjeFShElc6DoElFuKvvZTvzsg7ZncUD7dkkTeuc4zo9ibXJTRawsTU5TI+iLdKadzI2F0zaWgWSSTT2yZ/ezhwojM2BwHKzSh4tuPt0aosxBgQLUdB28gqTMzohNy9SBnCCD2OeW0Dx8TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789802019; c=relaxed/simple;
	bh=fYrmY7I61SG7Oq9N8JqryYeMpZkLC3QMjwmM8r1nkNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L10PnIt+9KDNUuiT3KbWwr6Fw3OMulBaYWqTyeTLLLpXOJ6+b+0eJbpTYeqYGJuZx+1qnNeEARIC6f7v1jjSHANrFiL1nWa9mX3aL0VlukuxsN89azaHOfP+usaqzX30K1N3eLQYswuMYI2WP52dlGfbh08CD7KOHK2YszKxfkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nmn7Kc5d; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nmn7Kc5d"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccd4f99cso1576918a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 00:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789802017; x=1790406817; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OlJRvd2rG1Bz2EK/T/fTdnK/hmBMI225GJHFCiKFLUk=;
        b=nmn7Kc5d+sR+CVt+em92rzn0cnu4KRn0sUivcxSQ8gb1ZyWaSiqv4gFrbYhr+2LsPb
         az8tuudsABlnKh77UT1VjgpU9cln7SNE63WvGpiNLWpCq2yf7tBweH5NzRR0YEQqVHMc
         FvhitFhL6fG/7eXDxwr5+WexD9HwMBNUADInUpThRpLvQST7h0aqoJJdmeMqPV/q9pjy
         Q0V6ZnPvlzdDgnhFyiKkUsoktqjkKXEo0pWLhY4mSOpZB+PFQVmmhCgMstXtqOyw1Szj
         wHr1i+fvoo+wDCv+Oc56PmreUS6xGY/QZ+z20KD02rlKvKIMpbNE3Ls1uRZ0+wH3YYQd
         UPHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789802017; x=1790406817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OlJRvd2rG1Bz2EK/T/fTdnK/hmBMI225GJHFCiKFLUk=;
        b=GhJpiV8DUnn/s5dpe3nA4ktGUxi2xftVcyH4ogItZyEQ0M9F9qfVR3woRPkl7S1XAf
         76PhpGaoTftvWYfgOF5gMNyeBTPIIda3t3GQe3QnFpRj/aQvuF2eh+h+84s+5ZZfIAnW
         IZYoe8TBHNMnDWKp2uNzTzKkNSpsZLSsLrqz4vlAqo4zTsPJhsak0iI1M84993f483N5
         ajwyLbU1svSKZni6YLM8f+RhYsKSov3sW51cWbfmOyMU+VhQkR3eeGWJd3s3f8ALB1ZQ
         M+YJjxy82g8zAv89/Rn2g8lgEWmkseSVpYVt4rc6FcnqywGKgeJdt+97he4Aj5G9zaIk
         XedQ==
X-Forwarded-Encrypted: i=1; AKwUvBxppmO2nmqj9A/HcnG9GiaiDEI604q1THY4FYraK7WN5V/e8bHVo0I9CUrbVFOQ8bHGWWvruDvtL34ZuwQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kE+082xDB5xgN3DlHrNL7lD0l/c+ymF/gm21pYQAvUpcz/t0Jj
	Dpb3AGbMbVdQCnEJnUESNBWNbNnJHoZEBNbgmrJBNjOP3twY+FJIPa8=
X-Gm-Gg: AYBFou1R66ztSwsY0l6W7eFPjnSFY3B1OWqdpU+IRoAPNNJNWN0x3unvZruwAvu9HLp
	AwQLp0T8MascWfR3cbwEtr2YVFoN4+R+xh9vayYeuTGJbjIXt+mEVhp2Y3axuHOlxP8JuGpyO6N
	N4t4NJgx82uCQvEaVSi0LatuudZzmYWVIuEMe9iH+gqXarG6JpDepSwenfm+9dS1sQbwp/RC4KN
	jyFIzQT8S7mpVU8bUeYMEo+cNyjdy1OcwFnuyoHmXGyPEtZ+PYv46bNvwAbukCKL/m1Uc+zBsFK
	gAWS+cfhWKAGVrIVl/0R0XTYuqOpxsuAV9EnWv2AxetbQnpxSzhkZVRNDM4cqezo67MvXlVkV9R
	gAnOALdBkQ9+iqtSJALyxpndDD5Up8itXjylsk1WTrLaz0d26xVlhVEAeOH7AmwIZbZvdfz/zkM
	JmjtPPRMbwWK5uQq7hzmYsoPinyIkIbZQv1wRBNGgBeF6vSBXhnHSDTlN086ohvbULNl4YEXRRA
	q3Bg7PjgtADisXkoGbTYS8S038=
X-Received: by 2002:a17:90a:e7cd:b0:395:7fff:a08f with SMTP id 98e67ed59e1d1-39e549bd704mr9273357a91.0.1789802016898;
        Sat, 19 Sep 2026 00:13:36 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f00:8c85:45e5:9e39:6356:6164])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a02738654csm1050170a91.3.2026.09.19.00.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 00:13:36 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: sj@kernel.org,
	akpm@linux-foundation.org
Cc: damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: [PATCH v1 2/2] mm/damon/tests/core-kunit: test the temporal tuner's size quota conversion
Date: Sat, 19 Sep 2026 16:13:24 +0900
Message-ID: <20260919071324.1583280-3-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260919071324.1583280-1-donggeunyoo.kernel@gmail.com>
References: <20260919071324.1583280-1-donggeunyoo.kernel@gmail.com>
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
 mm/damon/tests/core-kunit.h | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/mm/damon/tests/core-kunit.h b/mm/damon/tests/core-kunit.h
index 5ff0436c5844..4460dce0352c 100644
--- a/mm/damon/tests/core-kunit.h
+++ b/mm/damon/tests/core-kunit.h
@@ -1929,6 +1929,40 @@ static void damon_test_rand(struct kunit *test)
 	}
 }
 
+static void damos_test_esz_goal_temporal(struct kunit *test)
+{
+	unsigned long max_sz = ULONG_MAX / 10000;
+	struct damos_quota_goal goal = {
+		.metric = DAMOS_QUOTA_USER_INPUT,
+		.target_value = 10000,
+		.current_value = 0,
+	};
+	struct damon_ctx *ctx;
+	struct damos s;
+
+	ctx = damon_new_ctx();
+	KUNIT_ASSERT_NOT_NULL(test, ctx);
+
+	memset(&s, 0, sizeof(s));
+	INIT_LIST_HEAD(&s.quota.goals);
+	list_add(&goal.list, &s.quota.goals);
+	s.quota.goal_tuner = DAMOS_QUOTA_GOAL_TUNER_TEMPORAL;
+
+	s.quota.sz = max_sz;
+	damos_set_effective_quota(ctx, &s);
+	KUNIT_EXPECT_EQ(test, s.quota.esz, max_sz);
+
+	s.quota.sz = max_sz + 1;
+	damos_set_effective_quota(ctx, &s);
+	KUNIT_EXPECT_EQ(test, s.quota.esz, max_sz);
+
+	s.quota.sz = ULONG_MAX;
+	damos_set_effective_quota(ctx, &s);
+	KUNIT_EXPECT_EQ(test, s.quota.esz, max_sz);
+
+	damon_destroy_ctx(ctx);
+}
+
 static struct kunit_case damon_test_cases[] = {
 	KUNIT_CASE(damon_test_target),
 	KUNIT_CASE(damon_test_regions),
@@ -1965,6 +1999,7 @@ static struct kunit_case damon_test_cases[] = {
 	KUNIT_CASE(damon_test_is_last_region),
 	KUNIT_CASE(damon_test_walk_control_obsolete),
 	KUNIT_CASE(damon_test_rand),
+	KUNIT_CASE(damos_test_esz_goal_temporal),
 	{},
 };
 
-- 
2.53.0

