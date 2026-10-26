Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793057568;
	b=oFh4v9k9DdSAZ0G7adtaJBw3H5+RyrijeJhSQhBXDYLzarB+duowFZF7m5hTffmeH/L2
	 ltm/sjmNyjSmNC9Bf4kcsb5oDFXytGTiKYCzXkK0hnnMq6CG9TR1lZUl4v9pgPKMFcmwL
	 R2hMrQr7jhxv0AaHhxrgBxX6bEqU5MA46EatIYlYf9kNpj4uPjafUFOwNWwD+bkyw4IOq
	 R76u66lJJFkbI/GPq0u2Mb858FAU4XSEh2uuo7PqJtoigHP9Ai5qDcpVqcDhM6BPqp3mm
	 m6VY3bz1fPsVdNPtGYQE6Vlj0fc/HKckrjQAZsng0geN+FdGOUVPAkQYZ/dhKjk0TCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793057568;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=x7HHO0v9fPP+8RgZN7T/BVMm6ZAqykivq5IYKeesvfc=;
	b=ts3H1gIvCfEf+56pL30V/DD+me1dj0eXjk1SdH7DdmZFt2pK5FxEjlh6R+vXmCRqF9mt
	 CSzfZPKWaBCzJD/o7Lf4GgCmsfPmsrt2yLp2/rflIRdDQ9G8gM2BvjEzDejw/VZX0lC1Z
	 HIjGB4LNZCJ6hxeJ0xcDZuiDIMSQuFpNcDDUQcsHAO9ffCRkDkHW3b5XLkPg1S//5uffc
	 4PeZvF6K+p2BIk/qLRL21FK2ubrPOHFO+2A6U0h4VXJl7PCg+0GkO/BlJrzt4qvSq7UVV
	 wB4ScerICjmZxer9WK65oxpj2FjZRt/jKRcnrPxuPPgidMw9g+5+DvJgOStm1q9FTpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TPXtUoD4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE7E606A330
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 23:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TPXtUoD4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6B091F01825;
	Mon, 26 Oct 2026 23:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793057567;
	bh=x7HHO0v9fPP+8RgZN7T/BVMm6ZAqykivq5IYKeesvfc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=TPXtUoD4P+eTyLp9q6ccF2vo+DslvvjGuOZfx2cuXM1ei5AyS1Z8n7txcLjLZz2IE
	 MQ8d8cylLXowvXtt/h36vp1rsqByNUlI7eWSME4LifYbpRyeqpyU8oEcdoerANECcF
	 IsoEdBbMrKSs1dCFBgAGbSTvda+3iCXuEGvyE+AM2eTmZDVz0fGkkLWwG5TtMnVmPy
	 kbyNI6RCn5z1FSdxBHWq79g4sF38uV3szAFCmnPMCDawGg3v+VyFiomw3MyWCNKHi4
	 uCgslZSBP7r6LPVDu/GU10lzygEVSrvHjRfmEGZLZcXGMszVDKA+CDHelXVoIJ9jJ5
	 kDfuJ3rAJ1GKQ==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 26 Oct 2026 23:32:08 +0000
Subject: [PATCH 2/2] regcache: Add test for bounds checking of regcache
 drop requests
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
Message-Id: <20261026-regmap-drop-region-min-max-v1-2-2c28637ede23@kernel.org>
References: <20261026-regmap-drop-region-min-max-v1-0-2c28637ede23@kernel.org>
In-Reply-To: <20261026-regmap-drop-region-min-max-v1-0-2c28637ede23@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1950; i=broonie@kernel.org;
 h=from:subject:message-id; bh=nk3+fDeFvksQF+VzRTg065ylL3ZyHOf1a1Z2k8XP4jk=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLuP5bk2BZzVOl6XNaD5q8yN2dHSn49lhl35bhi4ZFAH
 51yvWCFjlIWBjEuBlkxRZa4LO6X9SWv1/AdXNgGM4eVCWQIAxenAEzEbDnDP9WWfVLWaafmxGf5
 94nmnXL7rVa4doXZ4mkC03kfc1pk3WFk2Blce03e1PXkhRsxuocDkoyfnJ2z0PXBokQVhbrA0zu
 XMAEA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

Validate that regcache_drop_region() rejects regions with a minimum
greater than the maximum.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/base/regmap/regmap-kunit.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/base/regmap/regmap-kunit.c b/drivers/base/regmap/regmap-kunit.c
index c78772b660d6..c948219f46a3 100644
--- a/drivers/base/regmap/regmap-kunit.c
+++ b/drivers/base/regmap/regmap-kunit.c
@@ -1347,6 +1347,26 @@ static void cache_drop(struct kunit *test)
 	KUNIT_EXPECT_MEMEQ(test, &data->vals[param->from_reg], rval, sizeof(rval));
 }
 
+static void cache_drop_min_max(struct kunit *test)
+{
+	const struct regmap_test_param *param = test->param_value;
+	struct regmap *map;
+	struct regmap_config config;
+	struct regmap_ram_data *data;
+
+	config = test_regmap_config;
+	config.num_reg_defaults = BLOCK_TEST_SIZE;
+
+	map = gen_regmap(test, &config, &data);
+	KUNIT_ASSERT_FALSE(test, IS_ERR(map));
+	if (IS_ERR(map))
+		return;
+
+	/* Drop some registers */
+	KUNIT_EXPECT_EQ(test, -EINVAL, regcache_drop_region(map, param->from_reg + 5,
+							    param->from_reg + 3));
+}
+
 static void cache_drop_with_non_contiguous_ranges(struct kunit *test)
 {
 	const struct regmap_test_param *param = test->param_value;
@@ -2253,6 +2273,7 @@ static struct kunit_case regmap_test_cases[] = {
 	KUNIT_CASE_PARAM(cache_sync_readonly, real_cache_types_gen_params),
 	KUNIT_CASE_PARAM(cache_sync_patch, real_cache_types_gen_params),
 	KUNIT_CASE_PARAM(cache_drop, sparse_cache_types_gen_params),
+	KUNIT_CASE_PARAM(cache_drop_min_max, sparse_cache_types_gen_params),
 	KUNIT_CASE_PARAM(cache_drop_with_non_contiguous_ranges, sparse_cache_types_gen_params),
 	KUNIT_CASE_PARAM(cache_drop_all_and_sync_marked_dirty, sparse_cache_types_gen_params),
 	KUNIT_CASE_PARAM(cache_drop_all_and_sync_no_defaults, sparse_cache_types_gen_params),

-- 
2.47.3

