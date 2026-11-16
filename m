Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794827215;
	b=q3py3veFsKU5cZvMvLL5kxtcIFeTIBVl/YmyBLYlH2FR+08mp8m7JHsjug6WHj5Uq1qq
	 5PmTce7VuVJYCIAVlzJ+sPiPMCZ2hlrRJIBAo7YjzmAiK43WtbTdY5mS6PBNTE2G0brUD
	 mHU3usHwHeht20kmrT2CFFkvTthzdJXqC/t05NKLmszSnop2AwmKucaUP2Yuww0D1sQ0y
	 UcvXC5YHmxVc/qDV4Fa40w0GmF5w8XSzT7U1HOAjjjz7QbLltSZIlJ4Xfv5fi8Wb6oKrt
	 1701wwAMNvVSkh9W2LWqdUvbDRmrBZFozm8LDmue2mBD6BumGq114mnvKcYwcPo/FLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827215;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=++HRlb3lmLPEyFHs8o+X0oq76Kzwdkq3LTMbh5HSJ6Y=;
	b=0foFjhIJtN4G+M3tph6P/lYtRZsPR77t4qC51NDqONJ06hROSaKrdSdQCnOC6YPc9V1v
	 l9QzOUoQBFiijmP0tPt4tuoC8XyG58K7UtEY7+u2DyTdTums/+ouVAwMV6BUgwWKXlKNH
	 gi0BDP4bgAw31YYEFF4ZAl0vnfsa7Qjr+9lfyv/1NlimztY44VW69OlQ/n/9K9hus2tBi
	 nfIQHJB1cSV/bVEWX0CiAY384Kt1cUzSlzfgOVN0boWTomyCvLXO06KD/YQ/PT6Dr0tTa
	 ahtQL6PyVaTqUF4ym6UBp9cGg/mrl+A7KVNvXYnXt89KsFIO/JlAUWPRCdlwSZWa3Og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ucla.edu;
	spf=pass smtp.mailfrom=g.ucla.edu;
	dkim=pass header.d=g-ucla-edu.20260707.gappssmtp.com header.i=@g-ucla-edu.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=e6mNj4mJ;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFBD606FE97
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:06:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AFBD606FE97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucla.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.ucla.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=g-ucla-edu.20260707.gappssmtp.com header.i=@g-ucla-edu.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=e6mNj4mJ
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1a3c08d6928so4432657c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=g-ucla-edu.20260707.gappssmtp.com; s=20260707; t=1794827214; x=1795432014; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=++HRlb3lmLPEyFHs8o+X0oq76Kzwdkq3LTMbh5HSJ6Y=;
        b=e6mNj4mJici56avfXZfhlv6eNoVl6PMv8hAmphTA18VocVXc0PnirbN4hCrHuHvJYs
         HRqBR59acg4TbikjwkeDCaL/B+bdEIUjc7T3XGpGJkF7PpK03FOZnGQrICMxxBWxHvd4
         g5ecBn+rmVlYnf/3qDTE0Rkn+t9OGzUlrNx9tI6kcIn1DJAqPriP01qR0JcadHNvLINL
         5iGtXvqOiBwg+9gqXXEtuH7ynhuyjrKosdmllV4igxBYn1IT6YEgERx5P1L0YFuEg4/5
         GSIgC9SfvhyVz4xmMwAurAXUb0L6gBSC+c0VaxkFWs/gEGYpdTbbrH4L0Ozh0d5XRJ/e
         HN/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794827214; x=1795432014;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=++HRlb3lmLPEyFHs8o+X0oq76Kzwdkq3LTMbh5HSJ6Y=;
        b=bNnUHkFQHS8zcDaz7GB5zz/ltStBSGOeYE8N7lozMgW6f9aGBdCf+xLbnTM5N6hzOT
         XksbBy17JKaRX6F6leR1xfhVUPtj4RbP49L2X1SUPL7V5imX0PMsAgpqYYKiGxvEGeVO
         oQA0A+XhgvCZjDmjZ/aaOz5DaZgvhxRUK1bFq5Jd4s52lW8sA1dHT8STBRU6UAbXcJLA
         1jURYstbrH2VZeWWPGIVp2hSDRrZMCRt615hZXrYpGKsfrvP3r/uJ9RHpkMCl4+sM7me
         X8gMVMrHxkJz+KMFE0IQ8p9w6hGMT1l6KpNqsKWye8MdXnqc2FOKTjNjMcJGRtyv/g0Y
         WhyA==
X-Forwarded-Encrypted: i=1; AL+hErEf6yvciFwnrpZeZS4SzrRz3ZMZUKqSZL29dH77OhGQXZha3mZhOiQ7D2tUF+HfvtYTqkymwdOawtyzGKE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9spa7ZWl46wKgZ0ddB4jbVg2hYNSx+7jsc69LMCmURD9OtkmvX
	yj+AwS0snJubwvPxej7kWbV/aRDWvuUfGnUnUqqQine35ExYgHl4JmoZ5F5Z/olkKSxAs63HJCq
	wrbRYLBQ=
X-Gm-Gg: AYBFou03V6cmPqK5fbb74Ri1iuQX+NgEd6VO32aDgc0zbXaCLConeK3SmIgPfnn2S0Y
	MxTv2dFtigBnLQD3jluu4AQTb00Nm6Qbg3yHAKtb8hR/uyx5NVcxsrzv3cmgFS+jeIVsGMc8PnS
	BpSvAuO3dBLVSzxGTlnpS59xncAGHt3dqcUR3oIqxZmgwx0KLSnqBaQhEgegNhXf6pzKTMNO2Zu
	6CFgBAa6HyFw9eyg5ceO1yN041JOJvkqHRJ3yGQ2dos8gFiTgrJQWYuu9jNWkTD6Imz5jq/xvbc
	3yqMjNfx6w2yC8nFdhH2aUqhBLLEYhAsGw2uqLkOH7MbSlofOk8aiZi4eav78xtYc/cM0t/FI/V
	q5CFZ6RnIx7ZvaPNsxqJRj9sZCxfwwV/RjP7fYkyi3XTOT6DGdynCcqIghsVbp/6l161lRHVQ77
	LYE87t3e7e2D611EB+FBs2q60psQcRQRNqJjAtOdn5On6KhTeh6Oj9LVSQNy4PhNr+5d52KOIFv
	vRtAnXt9vNXLqerbOz2m1RiTtS++GicqQtmL8u5OJnflS/cOwnGQLBG8NzlfTKZImZDQ0CBLZYA
	PGj3TBBBjviuXy32r0FpgeYgPh1PrxpSEsorNWA7tQmCPP4y4NU=
X-Received: by 2002:a05:7022:ea8b:b0:15e:9126:c60f with SMTP id a92af1059eb24-1b5030e2ef6mr9036471c88.29.1794827214001;
        Mon, 16 Nov 2026 03:06:54 -0800 (PST)
Received: from [127.0.1.1] ([131.179.95.34])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b524049e0asm12522103c88.4.2026.11.16.03.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:06:52 -0800 (PST)
From: Jason Angelov <jasonangelov@ucla.edu>
Date: Mon, 16 Nov 2026 03:06:23 -0800
Subject: [PATCH v2 3/3] mm/damon/tests/core-kunit: test
 DAMOS_FILTER_TYPE_AGE_MS interval changes
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-test-age-ms-filter-v2-3-3b265d59ec98@ucla.edu>
References: <20261116-test-age-ms-filter-v2-0-3b265d59ec98@ucla.edu>
In-Reply-To: <20261116-test-age-ms-filter-v2-0-3b265d59ec98@ucla.edu>
To: SJ Park <sj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: damon@lists.linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Jason Angelov <jasonangelov@ucla.edu>
X-Mailer: b4 0.14.3

DAMOS_FILTER_TYPE_AGE_MS defines an inclusive range for age in
milliseconds to filter for target regions. Aggregation interval can be
changed by users or intervals auto-tuning features.

Add a kunit test for each:

- convert region age to milliseconds, correct behavior at boundaries
  for defined filter range
- DAMOS_FILTER_TYPE_AGE_MS filter keeps correct behavior even when
  aggregation interval changes

Signed-off-by: Jason Angelov <jasonangelov@ucla.edu>
---
 mm/damon/tests/core-kunit.h | 66 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/mm/damon/tests/core-kunit.h b/mm/damon/tests/core-kunit.h
index 156f74832c40..3b2b745b8546 100644
--- a/mm/damon/tests/core-kunit.h
+++ b/mm/damon/tests/core-kunit.h
@@ -1838,6 +1838,71 @@ static void damos_test_age_ms_filter_is_core(struct kunit *test)
 			damos_filter_for_ops(DAMOS_FILTER_TYPE_AGE_MS));
 }
 
+static void damos_test_age_ms_filter_interval_changes(struct kunit *test)
+{
+	struct damos_filter filter = {
+		.type = DAMOS_FILTER_TYPE_AGE_MS,
+		.matching = true,
+		.range_min = 200,
+		.range_max = 400,
+	};
+	struct damon_ctx *ctx;
+	struct damon_target *t;
+	struct damon_region *r;
+	int err;
+
+	ctx = damon_new_ctx();
+	if (!ctx)
+		kunit_skip(test, "ctx alloc fail");
+	t = damon_new_target();
+	if (!t) {
+		damon_destroy_ctx(ctx);
+		kunit_skip(test, "target alloc fail");
+	}
+	damon_add_target(ctx, t);
+	r = damon_new_region(0, DAMON_MIN_REGION_SZ);
+	if (!r) {
+		damon_destroy_ctx(ctx);
+		kunit_skip(test, "region alloc fail");
+	}
+	damon_add_region(r, t);
+	ctx->attrs.aggr_interval = 100000;
+
+	/* An age of 100 ms is below the 200 ms lower bound. */
+	r->age = 1;
+	KUNIT_EXPECT_FALSE(test, damos_filter_match(ctx, t, r, &filter,
+			ctx->min_region_sz, &err));
+
+	/* An age of 200 ms matches the inclusive lower bound. */
+	r->age = 2;
+	KUNIT_EXPECT_TRUE(test, damos_filter_match(ctx, t, r, &filter,
+			ctx->min_region_sz, &err));
+
+	/* At a 200 ms interval, age 1 matches the lower bound. */
+	ctx->attrs.aggr_interval = 200000;
+	r->age = 1;
+	KUNIT_EXPECT_TRUE(test, damos_filter_match(ctx, t, r, &filter,
+			ctx->min_region_sz, &err));
+
+	/* An age of 400 ms matches the inclusive upper bound. */
+	r->age = 2;
+	KUNIT_EXPECT_TRUE(test, damos_filter_match(ctx, t, r, &filter,
+			ctx->min_region_sz, &err));
+
+	/* At a 50 ms interval, age 8 matches the upper bound. */
+	ctx->attrs.aggr_interval = 50000;
+	r->age = 8;
+	KUNIT_EXPECT_TRUE(test, damos_filter_match(ctx, t, r, &filter,
+			ctx->min_region_sz, &err));
+
+	/* An age of 450 ms exceeds the 400 ms upper bound. */
+	r->age = 9;
+	KUNIT_EXPECT_FALSE(test, damos_filter_match(ctx, t, r, &filter,
+			ctx->min_region_sz, &err));
+
+	damon_destroy_ctx(ctx);
+}
+
 static void damos_test_filter_out(struct kunit *test)
 {
 	struct damon_target *t;
@@ -2600,6 +2665,7 @@ static struct kunit_case damon_test_cases[] = {
 	KUNIT_CASE(damon_test_commit_ctx_keeps_quota),
 	KUNIT_CASE(damon_test_valid_probe_params),
 	KUNIT_CASE(damos_test_age_ms_filter_is_core),
+	KUNIT_CASE(damos_test_age_ms_filter_interval_changes),
 	KUNIT_CASE(damos_test_filter_out),
 	KUNIT_CASE(damos_test_apply_scheme_filtered_sz),
 	KUNIT_CASE(damos_test_apply_scheme_filter_sz_unchanged),

-- 
2.53.0

