Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DD8287518
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 00:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789950657; cv=none; b=nKb9p32xvp/xzo1YnMToz69OjYqWSGLOrotwOP4L1EsXU/gAzOY5DkyefUyzHbXLwVT3hV2NKavUVfImsNkEGktA0WakViV+E8VQlACOyD6QaM8eH1v9QxiLtTm7mMH2Qee0QhLtysZNfTuYwXsckbhHTrtemsT2SM49HO8fy2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789950657; c=relaxed/simple;
	bh=m3sULRI5UFp0Vrtz1PVlSriadvaJcu4eq0E21z1jQLs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jH11VY93iDVfq7cdXBpsPQoRgZgOzusPftk8LwSF4BGRtfKqb7b57DGz37on8BpVjI5T4r4Q35+/8hHX/vD1kZB/O8IIkDmR321vvWN5wqvv3/UD47bnTQgK6vBmImhpnXbCC0EEIGSyLS6XDJV/GFMHCL6pggAI6QMQCujPqYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=omrBLpRH; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="omrBLpRH"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843378fb37so1075690f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 17:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789950654; x=1790555454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6dpGtqMcJeHhOEzV/bkAAFY9Zr0/SXcgfjA47TvgATw=;
        b=omrBLpRHt2690wyr2OO9+Z3PTwZPmVY8m6MuJjqGcRgPUeGxqfFY+iVg7kjVJtNDlu
         gIVNLgEp/4KRYEGtwZjtpzCy9MD53GHg5uFXBcMnveY5GbhRGgP4PbV1+YqQOFairPhz
         BDTV7jeAAsufz5hlNx6ozpueJULP17osggQlPcCAT6BOYtzcAuD5hiEDak8awcjN8jmH
         YdlgDso9EYNnJlQga4SYHZFbstI+ijxCTQbLZx39W1gvevM4rLc6tlX4jkF8J4cKmnmr
         b3Ku9ZEfeREAgF42LhcJL7haRDSMV9FlZCarL0g2Fzaj+HKbqq2CGrDffxij/L7qsPBf
         i3HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789950654; x=1790555454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6dpGtqMcJeHhOEzV/bkAAFY9Zr0/SXcgfjA47TvgATw=;
        b=X70ecQZUrKEjrzj8RSvm+LyQATk9psGvtlutwZTTEl0pnE4oacnDSezAqEjMriabSZ
         YfOxJctV/yZyr2S6c9G814g+yHT0mK++/ka74noIWkom6bVh+SNS4sAqQWkpPewxxJnX
         AnRKwV8d8YrHDb3FrvIPPRZRGRm+EA4xL+Uv0sdwvHDfHrSSsd3PtF6LkyrYSBQB6EaS
         OSRA0alNlRntcND5XczxYFSZ9Z6dhfMqtUnewZyAL/ZODc2nRhqVh4K1SmlV7+gBTB5U
         dB1Jm/qWtnziDQASKy+P5q3Xcbe6NTVndWUKhQ6gWeUpmZM7YGnJa7ifK3TCHNNJQtoN
         xWeg==
X-Forwarded-Encrypted: i=1; AKwUvByBklmc9mhqKIraVEEKoN9NqDuYNQ4ztEjCpOtDpI6r+P8vOuoqR/0BT6eLYW0b5WXNjGfAze5dHapQWMQ=@vger.kernel.org
X-Gm-Message-State: AFuF++m97aEZyD+Od9D4hATfaT8NspAOSnMoyIQ4cN+S3KDqlILB3z7u
	N2m0rAgldiVWxSdGCOWhZMDaFsuL43CiCkgBNUcRUTgnxfXQqwIrIFH0
X-Gm-Gg: AYBFou3+3DvBhFg0b2UibfErwMCxjF+I+GTCXMI3fX2/NE/uEvyY8GwSM4EQwRfy7Bl
	Css7LwDOYxPMXSCQ90ZKBZ4xivUqAvCWJmp8zCDFvlQ6DJqYQlra3LlfjpcFXjcIhFkxJsRGS0m
	x2/eEDzyRgDNFP4OouDJgZmH/WsHKscyyvxFIjHr6yX7vWgKYAYEZMSerY3mmBDdhVJjgUTlp2u
	gUyfiBN7wcXLOJHb7mqUqio8xGqXVsmzXPCRE/JN5MDWHY3U0+0HpC187WE9X41Ed/aFpHqaSNY
	UzJyZjMcxR/s+dDA5EHd8v/kZbt5g4PIxw6KqC7UMFpLoL72W4YxaZMIiECY5ub/sPa7C0j46pS
	BF2Uj4jp8U31A3GRpfK+pcuTww2FH7dhNbC/0ttApWZlKj5uG1fsouBwXE/Em1R9Uex81CLT1hU
	MAXCsgpHdRACsmOGNqAAUS9FuLME5T6oQeUQh6CEexx0kupvXszmCG0iKohXAko4gkJ+9S1ITGS
	LaX4Braoz7tu4xacKkOoGFB+xyTWBtXHmh85N5GEMBqrrtCiFSLKxG+JXCRDfodBeuxP5lRGSD+
	+gznojth3gKewp2IxC6/Jh1G8ksLIgZgsmmn25ZPUgkoXaKpNGB+fDKbFAF6y/062Udeu28pFSm
	TPg==
X-Received: by 2002:a05:6000:610:b0:487:afe:c154 with SMTP id ffacd0b85a97d-4871e36bf11mr15086090f8f.40.1789950653979;
        Sun, 20 Sep 2026 17:30:53 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a012-6c01-e0c2-ccc1-7acc-3570.310.pool.telefonica.de. [2a02:3100:a012:6c01:e0c2:ccc1:7acc:3570])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724583fffsm17515695f8f.23.2026.09.20.17.30.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 20 Sep 2026 17:30:52 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] mm/damon/tests/core-kunit: test preservation of caller quota state
Date: Mon, 21 Sep 2026 02:30:47 +0200
Message-Id: <20260921003047.12041-3-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260921003047.12041-1-kmehltretter@gmail.com>
References: <20260921003047.12041-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check that damon_new_scheme() initializes the new scheme's quota without
changing the caller's quota. Cover all eight fields initialized by
damos_quota_init().

Also check that damon_commit_ctx() preserves those fields in the
destination scheme for both accepted and rejected parameter updates.
Use an invalid min_region_sz for the rejected update and confirm that
returning -EINVAL leaves the running quota state unchanged.

Without the preceding fix, all eight fields are cleared in the
constructor test and in both context update cases.

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Please feel free to take the fix on its own. I can also fold the
context-update checks into damon_test_commit_ctx() if that would fit
better.

 mm/damon/tests/core-kunit.h | 107 ++++++++++++++++++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/mm/damon/tests/core-kunit.h b/mm/damon/tests/core-kunit.h
index 5ff0436c58441..811fd668e2482 100644
--- a/mm/damon/tests/core-kunit.h
+++ b/mm/damon/tests/core-kunit.h
@@ -812,6 +812,48 @@ static void damos_test_new_filter(struct kunit *test)
 	damos_destroy_filter(filter);
 }
 
+static void damos_test_new_scheme_keeps_src_quota(struct kunit *test)
+{
+	struct damos_access_pattern pattern = {};
+	struct damon_target target = {};
+	struct damos_quota quota = {
+		.sz = SZ_64K,
+		.esz = 123,
+		.esz_bp = 456,
+		.total_charged_sz = 789,
+		.total_charged_ns = 1011,
+		.charged_sz = 12,
+		.charged_from = 13,
+		.charge_target_from = &target,
+		.charge_addr_from = 14,
+	};
+	struct damos_watermarks wmarks = {};
+	struct damos *s;
+
+	s = damon_new_scheme(&pattern, DAMOS_STAT, 0, &quota, &wmarks,
+			NUMA_NO_NODE);
+	if (!s)
+		kunit_skip(test, "scheme alloc fail");
+	KUNIT_EXPECT_EQ(test, s->quota.sz, (unsigned long)SZ_64K);
+	KUNIT_EXPECT_EQ(test, s->quota.esz, 0ul);
+	KUNIT_EXPECT_EQ(test, s->quota.esz_bp, 0ul);
+	KUNIT_EXPECT_EQ(test, s->quota.total_charged_sz, 0ul);
+	KUNIT_EXPECT_EQ(test, s->quota.total_charged_ns, 0ul);
+	KUNIT_EXPECT_EQ(test, s->quota.charged_sz, 0ul);
+	KUNIT_EXPECT_EQ(test, s->quota.charged_from, 0ul);
+	KUNIT_EXPECT_PTR_EQ(test, s->quota.charge_target_from, NULL);
+	KUNIT_EXPECT_EQ(test, s->quota.charge_addr_from, 0ul);
+	KUNIT_EXPECT_EQ(test, quota.esz, 123ul);
+	KUNIT_EXPECT_EQ(test, quota.esz_bp, 456ul);
+	KUNIT_EXPECT_EQ(test, quota.total_charged_sz, 789ul);
+	KUNIT_EXPECT_EQ(test, quota.total_charged_ns, 1011ul);
+	KUNIT_EXPECT_EQ(test, quota.charged_sz, 12ul);
+	KUNIT_EXPECT_EQ(test, quota.charged_from, 13ul);
+	KUNIT_EXPECT_PTR_EQ(test, quota.charge_target_from, &target);
+	KUNIT_EXPECT_EQ(test, quota.charge_addr_from, 14ul);
+	damon_destroy_scheme(s);
+}
+
 static void damos_test_commit_quota_goal_for(struct kunit *test,
 		struct damos_quota_goal *dst,
 		struct damos_quota_goal *src)
@@ -1572,6 +1614,69 @@ static void damon_test_commit_ctx(struct kunit *test)
 	damon_destroy_ctx(dst);
 }
 
+static void damon_test_commit_ctx_keeps_quota_for(struct kunit *test,
+		unsigned long min_region_sz, int expected_err)
+{
+	struct damos_access_pattern pattern = {};
+	struct damos_quota quota = {.sz = SZ_64K};
+	struct damos_watermarks wmarks = {};
+	struct damon_ctx *src, *dst;
+	struct damon_target *target;
+	struct damos *s;
+
+	dst = damon_new_ctx();
+	if (!dst)
+		kunit_skip(test, "dst alloc fail");
+	target = damon_new_target();
+	if (!target) {
+		damon_destroy_ctx(dst);
+		kunit_skip(test, "target alloc fail");
+	}
+	damon_add_target(dst, target);
+	s = damon_new_scheme(&pattern, DAMOS_STAT, 0, &quota, &wmarks,
+			NUMA_NO_NODE);
+	if (!s) {
+		damon_destroy_ctx(dst);
+		kunit_skip(test, "scheme alloc fail");
+	}
+	damon_add_scheme(dst, s);
+
+	/* Copy the parameters before populating dst's runtime quota state. */
+	src = damon_new_test_ctx(dst);
+	if (!src) {
+		damon_destroy_ctx(dst);
+		kunit_skip(test, "src alloc fail");
+	}
+	src->min_region_sz = min_region_sz;
+	s->quota.esz = 123;
+	s->quota.esz_bp = 456;
+	s->quota.total_charged_sz = 789;
+	s->quota.total_charged_ns = 1011;
+	s->quota.charged_sz = 12;
+	s->quota.charged_from = 13;
+	s->quota.charge_target_from = target;
+	s->quota.charge_addr_from = 14;
+
+	KUNIT_EXPECT_EQ(test, damon_commit_ctx(dst, src), expected_err);
+	KUNIT_EXPECT_EQ(test, s->quota.esz, 123ul);
+	KUNIT_EXPECT_EQ(test, s->quota.esz_bp, 456ul);
+	KUNIT_EXPECT_EQ(test, s->quota.total_charged_sz, 789ul);
+	KUNIT_EXPECT_EQ(test, s->quota.total_charged_ns, 1011ul);
+	KUNIT_EXPECT_EQ(test, s->quota.charged_sz, 12ul);
+	KUNIT_EXPECT_EQ(test, s->quota.charged_from, 13ul);
+	KUNIT_EXPECT_PTR_EQ(test, s->quota.charge_target_from, target);
+	KUNIT_EXPECT_EQ(test, s->quota.charge_addr_from, 14ul);
+	damon_destroy_ctx(src);
+	damon_destroy_ctx(dst);
+}
+
+static void damon_test_commit_ctx_keeps_quota(struct kunit *test)
+{
+	/* Only power of two min_region_sz is allowed. */
+	damon_test_commit_ctx_keeps_quota_for(test, 4096, 0);
+	damon_test_commit_ctx_keeps_quota_for(test, 4095, -EINVAL);
+}
+
 static void damon_test_valid_probe_params(struct kunit *test)
 {
 	struct damon_ctx *ctx;
@@ -1946,6 +2051,7 @@ static struct kunit_case damon_test_cases[] = {
 	KUNIT_CASE(damon_test_mvsum),
 	KUNIT_CASE(damon_test_nr_accesses_mvsum),
 	KUNIT_CASE(damos_test_new_filter),
+	KUNIT_CASE(damos_test_new_scheme_keeps_src_quota),
 	KUNIT_CASE(damos_test_commit_quota_goal),
 	KUNIT_CASE(damos_test_commit_quota_goals),
 	KUNIT_CASE(damos_test_commit_quota),
@@ -1957,6 +2063,7 @@ static struct kunit_case damon_test_cases[] = {
 	KUNIT_CASE(damon_test_commit_filter),
 	KUNIT_CASE(damon_test_commit_probes),
 	KUNIT_CASE(damon_test_commit_ctx),
+	KUNIT_CASE(damon_test_commit_ctx_keeps_quota),
 	KUNIT_CASE(damon_test_valid_probe_params),
 	KUNIT_CASE(damos_test_filter_out),
 	KUNIT_CASE(damon_test_feed_loop_next_input),
-- 
2.53.0

