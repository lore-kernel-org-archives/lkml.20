Received: from mail-yx2-f6.google.com (mail-yx2-f6.google.com [74.125.224.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B843A75B1
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 21:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791061729; cv=none; b=X2HMlTd5aaoohX92UqF8A49SsLMcTzHtGQatwPAOeARfInlLeX/5vcgAYNG6PorwlYPfDGQoONktqtfWaBWbrJNUNIjfTMdW6LYY7lbFiVLZw2vgb6m+Z66GtkzG8n7vB79uPewDUrTYUr7XzWMUifbPeSghTqmr6v8ov8Ut5Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791061729; c=relaxed/simple;
	bh=tAIEaZy66MiqjyAhvBIqHObw90APe1vijRLdD1hBJLI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z6Yci+1SnNDQqlXFxfHV+RmB4FaTlgaSTJ0doxMbmOCys3ytJpHFRM0nNDqOJG+6KtTdpAsltIHCVhqlumUuecDvKvd3FGqr/mItoV5FAcNLY6+Qy+rUxTR42Bni5FQNIyYGqPspgfnE6gyDqawxFW0so0ljAXxyxsBXzW8Ce3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iidzS+no; arc=none smtp.client-ip=74.125.224.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iidzS+no"
Received: by mail-yx2-f6.google.com with SMTP id 956f58d0204a3-66e61475fa7so255017d50.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 14:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791061725; x=1791666525; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7T2njtLf+tsG9r8toysyAJNfleUrJXsFeeqkEldERK0=;
        b=iidzS+noFLziagIpFdpHMgOfRhq7MRE2y3qSgCF7UXIVbMZubUuN8zIN52X/wS1hTd
         w14t+aD1l0XfpTc5pv4gfigZp8As5lBLepHpk4aFamVw60XDR341OciN36sd0xSk1C3X
         ScOoJmupoepsoJ7BfN9a1EOOOo0mzn7vJY7DzfJLg5EdDTXGNpfkRvc+s6F+i5QG/JJI
         0wbZ7FtdfSw/QfKFJzywA8+ReEs2Nm8eQwL1s+t84JTI8NM0VX5XVOo6QBEWt4s9ZdtG
         znFbScMTVsW/jItRPfdkUip6MKVz4dl1BChPb7Kd21i129FiTajHvLVR7GgamqSowzwx
         5qBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791061725; x=1791666525;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7T2njtLf+tsG9r8toysyAJNfleUrJXsFeeqkEldERK0=;
        b=tcNs4R5KQ5alK8Mji5+Sbod2UQWZakAl1WhjFOXqR8pJtF6Mg+ovXt/X6wIihUmti8
         zYZr6gNDHTB/zuw1QL5m7aSXM5njFy0OXhpLQfC8/Z3LJ7GknIhHAyDUVBQuNukx2uVd
         JUcgw9nNQTuiPFXHt2DWmb1aL7lVxmqvUdjAgW8EG+Iw5M5ujHfj51MrK0ZyPvPHoas4
         C7RFDQjgJPCIz/SlSqsRoEpbh0n+GrF9kEFZvCbXLJRza7q4yTY1E531ayGgxcsyb4d9
         X/wK9evSArGQfGly1Ia4rbxmAVe/bH5pgdhh2jtFVeFydy9YMGeUMmXaXVL5HI8DniF3
         n1Iw==
X-Forwarded-Encrypted: i=1; AKwUvBzEbcSpdVBFmLuDbD5KkxQHH9FxQQlC5XtCNZoznvaoZnVKxwofFLlWKd+P6+SUBvADWIHbvC+qAlaM1KA=@vger.kernel.org
X-Gm-Message-State: AFq9FYK0UDDZYq1yi34SuDZvEjcu0Ith1hI1oz4njnrp2S/cuTI54tMQ
	2IDFGUp5dsXT/YIGJUR7OLL0GalCznV1v2qZoWdYRGMFZVmjcND49Og=
X-Gm-Gg: AYBFou1NVe8MaaIvmbhWu/QjWCxTcgRKutYltBaIhqYQxoAFAU3Umk1etg6yY5Li1oa
	4saCBvFf5IC15a55lsinrOBWH4hPaJajmR2Ii3AyQEBF5BHkO0frnkwFI457YjU0zXJ6V3WuNxg
	fUtwcKqdTRyFYanN/hzAbnBNaKtfWWEUuOffHvn6XSTKjp3LZAFPY3t9sOsEEbScIOcqNyNntIr
	wOHen/X4vvXuDjAJ0hG/unqrghTyE2Oq4LhGOGNhHwZoq/Bg8h9vVXRKsgx+XyXtoxzgewEZGXs
	bW8dfhZuXE+0o065rbdfP+7YHBNK1e6OTfkCyxLlpe52U5AVMAxZcqFQXlTp86WYjJWye+cRTfb
	VsuUNRiE38LomvYK7FefjwZBATDpluZ+/PGVNIdPRkOzWFp/wSJK/Gtp1sJDGVQZK2e/n+Z9d5d
	+L2p1YzEwkilRHA66Fnz00yfjui09Ttz08qgkPYdMlpIm+rLV+gCjtI6rzBzr8HZ9yPsQFivvrg
	TVzf1LbEqUSKKF7kO0m5ZUTJaOuNYf8QepsDc8Ix4wRdkm0NvWXRBQ9t3PGvNpxjlPJEZ74I0wq
	CCDVCNNx00MHxLHmu07AKIm2LuHD4tRCgw==
X-Received: by 2002:a05:690c:e3ec:b0:8a4:b0dd:c849 with SMTP id 00721157ae682-8ae3a5e66b0mr30220037b3.52.1791061724836;
        Sat, 03 Oct 2026 14:08:44 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2600:1700:4577:1050:550f:9551:5468:60f1])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8af0d179d3bsm743537b3.40.2026.10.03.14.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 14:08:43 -0700 (PDT)
From: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
Date: Sat, 03 Oct 2026 14:08:02 -0700
Subject: [RFC PATCH v3 9/9] mm/damon/core: allow both primitives disabled
 when a perf probe is present
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-damon-perf-rfc-v3-send-2026-10-03-v3-9-0f00417b41bc@gmail.com>
References: <20261003-damon-perf-rfc-v3-send-2026-10-03-v3-0-0f00417b41bc@gmail.com>
In-Reply-To: <20261003-damon-perf-rfc-v3-send-2026-10-03-v3-0-0f00417b41bc@gmail.com>
To: SJ Park <sj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: damon@lists.linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Gregory Price <gourry@gourry.net>, David Rientjes <rientjes@google.com>, 
 Wei Xu <weixugc@google.com>, Jonathan Corbet <corbet@lwn.net>, 
 Bijan Tabatabai <bijan311@gmail.com>, Ajay Joshi <ajayjoshi@micron.com>, 
 Honggyu Kim <honggyu.kim@sk.com>, Yunjeong Mun <yunjeong.mun@sk.com>, 
 Akinobu Mita <akinobu.mita@gmail.com>, Lian Wang <lianux.mm@gmail.com>, 
 Kunwu Chan <kunwu.chan@linux.dev>, 
 Ravi Jonnalagadda <ravis.opensrc@gmail.com>, 
 Jonathan Cameron <jic23@kernel.org>
X-Mailer: b4 0.16.0

The sample control validation requires exactly one software access check
primitive, page_table or page_fault, to be enabled.  A context carrying a
perf-event probe needs neither: the probe drives the access signal
through its report ring and the drain, so region access rates and ages
update with both primitives off.

That check runs in damon_commit_sample_control(), which sees only the
sample control and cannot tell whether the context has such a probe.
Move it to __damon_commit_ctx(), skip it for a context with event-driven
probes, and run it with the other validation of @src before anything is
committed to @dst, so a rejected configuration cannot leave a live commit
with its PMU events already armed.

Add damon_test_both_primitives_disabled_with_probe(), which commits a
context with both primitives off and an event-driven probe and asserts the
commit succeeds.

Signed-off-by: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
---
 mm/damon/core.c              | 11 ++++++++---
 mm/damon/tests/drain-kunit.h | 37 +++++++++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+), 3 deletions(-)

diff --git a/mm/damon/core.c b/mm/damon/core.c
index c2c74d0daf95..04a1cccbc2f5 100644
--- a/mm/damon/core.c
+++ b/mm/damon/core.c
@@ -2357,9 +2357,6 @@ static int damon_commit_sample_control(
 		struct damon_sample_control *dst,
 		struct damon_sample_control *src)
 {
-	if (damon_primitives_enabled_invalid(&src->primitives_enabled))
-		return -EINVAL;
-
 	dst->primitives_enabled = src->primitives_enabled;
 	return damon_commit_sample_filters(dst, src);
 }
@@ -2390,6 +2387,14 @@ static int __damon_commit_ctx(struct damon_ctx *dst, struct damon_ctx *src,
 
 	if (!damon_valid_probe_params(src))
 		return -EINVAL;
+	/*
+	 * A probe-driven context needs no software primitive.  Validate this
+	 * before anything is committed to @dst, so a rejected configuration
+	 * cannot leave a live commit with its PMU events already armed.
+	 */
+	if (!damon_has_event_driven_probes(src) &&
+	    damon_primitives_enabled_invalid(&src->sample_control.primitives_enabled))
+		return -EINVAL;
 
 	err = damon_commit_schemes(dst, src);
 	if (err)
diff --git a/mm/damon/tests/drain-kunit.h b/mm/damon/tests/drain-kunit.h
index 8e5023ebf6df..be44311617fc 100644
--- a/mm/damon/tests/drain-kunit.h
+++ b/mm/damon/tests/drain-kunit.h
@@ -722,6 +722,42 @@ static void damon_test_bsearch_unsorted_regions(struct kunit *test)
 	damon_destroy_ctx(ctx);
 }
 
+/*
+ * Test that damon_primitives_enabled_invalid() accepts the both-disabled
+ * configuration when an event-driven probe is present (this commit's
+ * relaxation).
+ *
+ * Before this commit this configuration was rejected (-EINVAL).  After it,
+ * it is valid: the probe drives access-rate updates directly via the report
+ * ring, so neither software primitive is required.
+ */
+static void damon_test_both_primitives_disabled_with_probe(struct kunit *test)
+{
+	struct damon_ctx *ctx;
+	int ret;
+
+	ctx = damon_new_ctx();
+	if (!ctx)
+		kunit_skip(test, "ctx alloc failed");
+
+	if (damon_test_attach_perf_probe(ctx)) {
+		damon_destroy_ctx(ctx);
+		kunit_skip(test, "perf probe alloc failed");
+	}
+
+	/*
+	 * Explicitly disable both primitives.  With an event-driven probe
+	 * present, damon_commit_ctx() must now succeed outright.
+	 */
+	ctx->sample_control.primitives_enabled.page_table = false;
+	ctx->sample_control.primitives_enabled.page_fault  = false;
+
+	ret = damon_commit_ctx(ctx, ctx);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+
+	damon_destroy_ctx(ctx);
+}
+
 static struct kunit_case damon_drain_test_cases[] = {
 	KUNIT_CASE(damon_test_unified_vaddr_match),
 	KUNIT_CASE(damon_test_unified_vaddr_tgid_mismatch),
@@ -733,6 +769,7 @@ static struct kunit_case damon_drain_test_cases[] = {
 	KUNIT_CASE(damon_test_report_addr_space_keyed),
 	KUNIT_CASE(damon_test_ring_full_counter_increments),
 	KUNIT_CASE(damon_test_bsearch_unsorted_regions),
+	KUNIT_CASE(damon_test_both_primitives_disabled_with_probe),
 	{}
 };
 

-- 
Git-157)

