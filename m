Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794585561;
	b=bDJcK8XS32JwCGMqpymcWCFxjc6yuGZQRT/RQsFUo2OD6uDA+ztBvH9QlvJWBesFHrr9
	 BurnfCKKHvYB51JI9qKMOWA4FaAheKIUpEjBTvtWf/ldwoqc1MsNsGIWFnjSW8mdJHTaW
	 PvWmVsgVgSP5FR9iRU0zuAFgWGmf+J/O+YjfT31za3ZKM9yvx05QoYhEEumwBubW/sB8W
	 1lPVcYPGlCquU4ibnDaAWgklNLLxw/ot55KZtkPeIyluPyoe+l1X3eEzRCdzUlJeWlO7u
	 /0jP/McHLcr8QSrO2TOYuPsC8vNqDdniYPc6UQKeGeLT/R+zKHlT5uwKTSIkoh56Hmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794585561;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=BUQE0kUGDk8M7CIw9MtJvjFLkWAN6uJ898YNqYUmUwc=;
	b=4CHVUo5fiBc+mTO+6K1XRgRN+G9e90dXZVqoLgFe4UjNzkiQmAXia0AL2ooMFW2zH5u+
	 CqwVStBSVJaLm3sxMbHri2GKB+exyqfC1r6DeKLHHpIpqtpc4klUO+d6i4yJjeOLr47uH
	 b5KhxwNj2feZVxOk9objqOLSD79HYfnQS2tlsu9Rs/kuKiUCIlWo6CWDd1P/EE6NQaKem
	 Z9vGu3TYFXUc+wTx0LKsaU3x97LfTtt0SixwMQerqz+bf8QZSnzBB+4yLIuD9IG6iN2fH
	 BStdo/0pF7K7JCzlPiziM2UExRXx3Yx2dw6tivIJ0oZ4ALB+a5ytrCgS0BnvxK8oxVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ucla.edu;
	spf=pass smtp.mailfrom=g.ucla.edu;
	dkim=pass header.d=g-ucla-edu.20260707.gappssmtp.com header.i=@g-ucla-edu.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=M0MsmaQf;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A97606BAA7
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:59:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8A97606BAA7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucla.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.ucla.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=g-ucla-edu.20260707.gappssmtp.com header.i=@g-ucla-edu.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=M0MsmaQf
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b50a4bd2f3so978656c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=g-ucla-edu.20260707.gappssmtp.com; s=20260707; t=1794585560; x=1795190360; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BUQE0kUGDk8M7CIw9MtJvjFLkWAN6uJ898YNqYUmUwc=;
        b=M0MsmaQfXw3SdSpoPe4h9XZ18fSnFZFRBfnciYbJlZ8Z2sT9qqqEsxgy6D1Em8vb/X
         i8bPYhD0lRLuPsmuMG584W1QX194l3camiQjotLmnO9LeRXZ8pjDh20XQOvMOsZR3LnY
         bYbOHpOFbOlOzIGsZ/xd1QlLuzSockK/FE1TWemfVQPqYuQyMWciOebTmeIRZ89oJx4R
         G14UNvtnS7ymyTbN2es1Oa46SHoriheYmi6SAM1Wb0r6fpbiwoMpCqm3dkLvHAAZE8fz
         yB3JN+iOVjlTQZBZDLByWXWWXyJCGyp1DK+9xv/LT+X+lGHpC2aOWCc/CKnenIj/bvRa
         IMsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794585560; x=1795190360;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BUQE0kUGDk8M7CIw9MtJvjFLkWAN6uJ898YNqYUmUwc=;
        b=BQnP+vjITVjgfv1p3q0nSmt7rCWRXFRcdIJHzHD4wum5F+15IPQjRObwGvlAy9cr9Y
         DsbrCDuli2EZatSF/rzS9m1LkNeDgxjdj+ADH9fh9NsAQSzc5BXRqYX7XBnzWWEYntvO
         ZDLpnFGnuIuml2SOc45gU53xzAShjRBB2X8rkjCwjDoM7WBIOYJuPKrQx95NGGj2L679
         K9n+/podGhKfrAFEQ0XOUnYmEyYLv56JICFDmQCuxjFaF0NWkUxUoaERhLcvltmmfVhE
         CedD4Zv9C2NG82/MAa6vR9Pb0j4dwwGFV9p7iyWsx0JhGAYv3uzeT3RVZvh4nybgvwSU
         e+UA==
X-Forwarded-Encrypted: i=1; AL+hErGHMpHcwKU5wdTdbZR1cS/VvTDnM9bVsyI7aFjzUHcjspx+E/3IfCcAtv5srw0cSg3NeqhluODaVdukEfI=@vger.kernel.org
X-Gm-Message-State: APuU4Z96A6wX5PsFBTsgPwimFCaV4gXhojIsWNjPAViLBEA2r5S2CLhC
	jEOWJTNmf5LRU2NkJxTcd6JnEAN6XZyE6pDqM2lJ3qKuf9x9GJYRoHDwlYhyXiqZ7XI=
X-Gm-Gg: AYBFou3YzqrOCmoqiujR1ImFMfM+P2mj+IWsdhSzxSYtqwUIju79lKzkVHEYtFtVreI
	shtRscpTDl2XnfMGeLBbpI1rTh8Z7a5OAkucps+nNgQs8aJjQNQt7Qi0KOZ9330blI/GGTczhz/
	dFPwYLRLyxMRFfYAvEerMAI/yLJu2dVdNuoXuNx+1+VWa3yQwNfPQZYZYDuNsBIqsfX0kbTj85p
	ov0c6UR3OjhZfb/SrKHQe1gRnqk5TqQHAKl+3xEAK12gypeXGJ/Br4oa9pJO2MuAlk7q8/kx26F
	6YCTyxLuwsRfHF8um28iZ6TfPeovqs3W9uJNbrQrEiVP84kHtIGiDhicICuZCbt7mr/VlOb0dAQ
	x0P87IfmAVra5ZGjsTeWgRU8kZXCEWyuW89xYmgHgsaHSnvoCVii3yBwQJ1JwDnxUwwl89p2BUa
	dH5G3GSQ/KD75/YljXvubS47a+rdaS+xlXYg4Lb1FOKDzRN1Q2iEmjwmdDw7i3CUUJ8zP6Pc/Q4
	OOkQ3g/4QMLQ46cT5zRtmm1dVFO8MNmk1NQ1XTvQ/+7SwzpDIlYHTWIiV/11uxrmKLu6RUNulW5
	qu6to4YW7nGk8TPpI8jclYvd7WqPCQ==
X-Received: by 2002:a05:701b:4590:20b0:1b3:b53e:b4c5 with SMTP id a92af1059eb24-1b503137aafmr2631085c88.38.1794585559658;
        Fri, 13 Nov 2026 07:59:19 -0800 (PST)
Received: from [127.0.1.1] ([131.179.95.34])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031bc518sm7868383c88.15.2026.11.13.07.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:59:18 -0800 (PST)
From: Jason Angelov <jasonangelov@ucla.edu>
Date: Fri, 13 Nov 2026 07:58:57 -0800
Subject: [PATCH 3/3] mm/damon/tests/core-kunit: test
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
Message-Id: <20261113-test-age-ms-filter-v1-3-b99eab2f71bb@ucla.edu>
References: <20261113-test-age-ms-filter-v1-0-b99eab2f71bb@ucla.edu>
In-Reply-To: <20261113-test-age-ms-filter-v1-0-b99eab2f71bb@ucla.edu>
To: SJ Park <sj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: damon@lists.linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Jason Angelov <jasonangelov@ucla.edu>
X-Mailer: b4 0.14.3

DAMOS_FILTER_TYPE_AGE_MS defines an inclusive range for age in
milliseconds to filter for target regions.
Aggregation interval can be changed by users or intervals
auto-tuning features.

Add a kunit test for each:

- convert region age to milliseconds, correct behavior at boundaries
for defined filter range
- DAMOS_FILTER_TYPE_AGE_MS filter keeps correct behavior even when
aggregation interval changes

Signed-off-by: Jason Angelov <jasonangelov@ucla.edu>
---
 mm/damon/tests/core-kunit.h | 81 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/mm/damon/tests/core-kunit.h b/mm/damon/tests/core-kunit.h
index fb84d30a712d..6de7c2531702 100644
--- a/mm/damon/tests/core-kunit.h
+++ b/mm/damon/tests/core-kunit.h
@@ -1837,6 +1837,86 @@ static void damos_test_age_ms_filter_is_core(struct kunit *test)
 	KUNIT_EXPECT_FALSE(test, damos_filter_for_ops(DAMOS_FILTER_TYPE_AGE_MS));
 }
 
+static void damos_test_age_ms_filter_interval_changes(struct kunit *test)
+{
+	/* Filter window: 200-400 ms.  Start: 100 ms interval, age 0. */
+	struct damos_filter filter = {
+		.type = DAMOS_FILTER_TYPE_AGE_MS,
+		.matching = true,
+		.range_min = 200,
+		.range_max = 400,
+	};
+	struct damon_attrs attrs = {
+		.sample_interval = 5000,
+		.aggr_interval = 100000,
+		.min_nr_regions = 3,
+		.max_nr_regions = 3,
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
+	KUNIT_EXPECT_EQ(test, damon_set_attrs(ctx, &attrs), 0);
+
+	/* below window: age 1 = 100 ms */
+	r->age = 1;
+	KUNIT_EXPECT_FALSE(test, damos_filter_match(ctx, t, r, &filter,
+			ctx->min_region_sz, &err));
+
+	/* inside window: age 2 = 200 ms */
+	r->age = 2;
+	KUNIT_EXPECT_TRUE(test, damos_filter_match(ctx, t, r, &filter,
+			ctx->min_region_sz, &err));
+
+	/*
+	 * change aggregation interval 100 -> 200 ms:
+	 * inside window: age rescaled 2 -> 1, still 200 ms
+	 */
+	attrs.aggr_interval = 200000;
+	KUNIT_EXPECT_EQ(test, damon_set_attrs(ctx, &attrs), 0);
+	KUNIT_EXPECT_EQ(test, r->age, 1u);
+	KUNIT_EXPECT_TRUE(test, damos_filter_match(ctx, t, r, &filter,
+			ctx->min_region_sz, &err));
+
+	/* inside window: age 2 = 400 ms. */
+	r->age = 2;
+	KUNIT_EXPECT_TRUE(test, damos_filter_match(ctx, t, r, &filter,
+			ctx->min_region_sz, &err));
+
+	/*
+	 * change aggregation interval 200 -> 50 ms:
+	 * inside window: age rescaled 2 -> 8, still 400 ms.
+	 */
+	attrs.aggr_interval = 50000;
+	KUNIT_EXPECT_EQ(test, damon_set_attrs(ctx, &attrs), 0);
+	KUNIT_EXPECT_EQ(test, r->age, 8u);
+	KUNIT_EXPECT_TRUE(test, damos_filter_match(ctx, t, r, &filter,
+			ctx->min_region_sz, &err));
+
+	/* above window: age 9 = 450 ms. */
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
@@ -2599,6 +2679,7 @@ static struct kunit_case damon_test_cases[] = {
 	KUNIT_CASE(damon_test_commit_ctx_keeps_quota),
 	KUNIT_CASE(damon_test_valid_probe_params),
 	KUNIT_CASE(damos_test_age_ms_filter_is_core),
+	KUNIT_CASE(damos_test_age_ms_filter_interval_changes),
 	KUNIT_CASE(damos_test_filter_out),
 	KUNIT_CASE(damos_test_apply_scheme_filtered_sz),
 	KUNIT_CASE(damos_test_apply_scheme_filter_sz_unchanged),

-- 
2.53.0

