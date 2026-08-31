Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C733E2AA1
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788176254; cv=none; b=choNZEzgKAtW4SjJul2Dp8b1Xj8L2hyN2cHxVU0h41An4S2iPHAz/oVWRsqejAiKqMF++qhIZdbkhH0eUgST7Oe3JRFbIqfGWsPz+IYOohmed4JVdViaJWBTYOxuVm1XTdHSSbJUzwui5NFx+oGLSZ34xbDuwgqgy4xWmOffLFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788176254; c=relaxed/simple;
	bh=I7TaQ0V7AXmZ1+0wiHwiAdHeD0et7WeNJ7OkyHsHQOY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z0bGiIS3yLd15JH1NQqmH3Ng5aTr7p21/zYgUlolwodxYmqla4Zrjwh5cJ56phX5xyyDKTabxeflKQvoH6F9X1vTfcFxpFRf26xodyrfieNJvGpBY+FM4i7zWJn3h86gd3xxCZzzXJU8x3AfnFTtg/TcFKpfBxx1kyz+koyQtEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E0+Yz/z/; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E0+Yz/z/"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38e58034d05so2733406a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 04:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788176253; x=1788781053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FAhbWor4DKGsX3doFWg/6nm52AV3PsoJHNom3kwfce8=;
        b=E0+Yz/z//MYT8Mx6oiUTTAMTuv3JFAUHoID+/OvdZmZb4UviFv4BDV935cPCtH5kiy
         6iPqZqj/qUB9nhc0ZL4EHalWLZ6L3uLnM/aaIzwH6lPuObdRKNmbyE0TuHYaEAfTvj1X
         mnQyN2TgZdjYqwUbRRUE++uZSIG5psoxvY/CXS4+pQvlwLCKk+z14O1ahDc4B4PWO+4X
         sitU3eVZef3RdDThvfPJio1gfSf3lTx7w02kdystsfSPLfpvSin4KSy4OJh4rLYKd0hG
         hBZkicIr4gU8eVPliwyavt4fKaJwAO5iUbwHOR0x5XDk0kVnGTDluwlBB6j20cizA2VO
         gzzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788176253; x=1788781053;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FAhbWor4DKGsX3doFWg/6nm52AV3PsoJHNom3kwfce8=;
        b=ktMfGvRswGOCotyxXwUBDoTsI9yAGB0AXJrJRbXea6i0ToDVUx9WP5FEoU6UZYkaDH
         /B1YwMG49QQ82tMn4QsMuSFpvFbCWw4NW35QOwnSmErPII1zTIbd33STLng1zcEK4Mi6
         1S4bEx+P4ABEaxE/hJ1E6Fj5hkim53Ib93k6fBt4tHdVO4Be4xgPlX1vaFVs9ZgQZ1xr
         LdgNoD3N7a81x4RZ155SdP3hsUIxwl8IvmWonJw10QP34WmI/t19sGQbOSS7QW0CT5vo
         UBQ2LR8DhrS1VNTQWrvTy90kueZJxHUjpxrrLBxTknmiqRarMp5NWCaHDSOuDlQzzCPd
         4/bQ==
X-Forwarded-Encrypted: i=1; AKwUvBw+MiWBIteH3ZRS8nBoJnfCtBflq00IkZqJqeRbAcFtuleTn6lHlEBouwLMOHnxEzmt+VWSrpP3r9Ois8g=@vger.kernel.org
X-Gm-Message-State: AFuF++l6oysi6e0tdj8Httfhz4QG9NUpGzJcruP0sAzGYfTJGwbpRpNv
	vPlJ6HiCbeQ/65AEDXi3KbDYmyAwqaskgSBD2nkXCTEjh6aROujwUkON
X-Gm-Gg: AYBFou01XOUExzbteyQrK+Y0pTFl864EainyGSjUho+mG/k5MNIeSR++HbJiJn2d0lo
	gEw68dhM5WsLcsAy5tABXZaXGvzxyyzfd0EHT3ajgAh+zvpAOEObQpk8RTWSTZMvCSTyWVIbpLF
	+csV25Jnm5280KMR9oDExyXlcwBl2ioLloZIvpFb+wXng35phrhgmBLMmvpeubYsNsaegx9zNBa
	093RTlAjsTZJO3yFfdZkclXD8daHRdDs1eXcwYYoM7Dz6a6wrnskYeX6WVFfF+sr81m0KCtViCo
	zrAJIqyiYvBVN8Nk7vxrERCDGlveH2rn2tgVvgykCX9Zw2gYGK/NTrCLbdizjtwGZG9u/FaL9jG
	EzmE30rRx8aSBMUo0Ie/DyOvoAJa3trpCpfKNWd5p/Stv9K3f/6GWY6BkbETB71cQNHq3TPCdp+
	/co2d/DTttmLu+m7FMiKOEwTwZQLG4cEXR69sSXN1nkawYLjN4qB0i9WqC4aeFufxNdSQg8dg8q
	3UrMilBsnL9Cckh
X-Received: by 2002:a17:90b:1dcb:b0:398:dcf6:d40e with SMTP id 98e67ed59e1d1-39907db4f46mr132089a91.17.1788176252810;
        Mon, 31 Aug 2026 04:37:32 -0700 (PDT)
Received: from celestia.taila51cc2.ts.net ([2402:1980:9c5:2de5:8b4e:3f3c:b637:4ca5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396ddc08266sm17197591a91.11.2026.08.31.04.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 04:37:32 -0700 (PDT)
From: Liew Rui Yan <aethernet65535@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	shu17az@gmail.com,
	jiayuan.chen@shopee.com,
	Liew Rui Yan <aethernet65535@gmail.com>
Subject: [PATCH] mm/damon/tests/core-kunit: add test for unconditionally skipping the last region
Date: Mon, 31 Aug 2026 19:37:35 +0800
Message-ID: <20260831113735.3349-1-aethernet65535@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 50585192bc2e ("mm/damon/schemes: skip already charged targets and
regions") introduced a minor issue that causes the last region to be
skipped before it is processed.

Example:

    1. Target has 2 regions: R1 (0-100 bytes) and R2 (100-200 bytes).
    2. Quota is configured to process only 100 bytes per window.
    3. Window 1: Processes R1 (0-100).  Quota is full.  charge_{target,
       addr}_from is saved at (Target, 100).
    4. Window 2: The loop reaches R2.  Because R2 is
       damon_last_region(t), the old code unconditionally returns true,
       skipping R2 entirely and resetting the charge_{target,addr}_from.

    Result: R2 is permanently skipped even though it has never been
    processed.

Add a test to prevent this regression in the future.

Signed-off-by: Liew Rui Yan <aethernet65535@gmail.com>
---
 mm/damon/tests/core-kunit.h | 43 +++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/mm/damon/tests/core-kunit.h b/mm/damon/tests/core-kunit.h
index 4a536d41cdb2..90b0fda34fba 100644
--- a/mm/damon/tests/core-kunit.h
+++ b/mm/damon/tests/core-kunit.h
@@ -1632,6 +1632,48 @@ static void damon_test_rand(struct kunit *test)
 	}
 }
 
+static void damon_test_last_region_quota_reset(struct kunit *test)
+{
+	struct damos s = {0};
+	struct damon_target *t;
+	struct damon_region *r1, *r2;
+	unsigned long min_region_sz = 10;
+	bool skipped;
+
+	t = damon_new_target();
+	if (!t) {
+		kunit_skip(test, "target alloc fail");
+	}
+
+	r1 = damon_new_region(0, 100);
+	if (!r1) {
+		damon_free_target(t);
+		kunit_skip(test, "region 1 alloc fail");
+	}
+	damon_add_region(r1, t);
+
+	r2 = damon_new_region(100, 200);
+	if (!r2) {
+		damon_free_target(t);
+		kunit_skip(test, "region 2 alloc fail");
+	}
+	damon_add_region(r2, t);
+
+	s.quota.charge_target_from = t;
+	s.quota.charge_addr_from = r1->ar.end;
+
+	skipped = damos_skip_charged_region(t, r2, &s, min_region_sz);
+
+	/* 'r2' is not processed, it should not skip */
+	KUNIT_EXPECT_EQ(test, skipped, false);
+
+	/* 'r2' is last region, it should reset charge_{target,addr}_from */
+	KUNIT_EXPECT_PTR_EQ(test, s.quota.charge_target_from, NULL);
+	KUNIT_EXPECT_EQ(test, s.quota.charge_addr_from, 0);
+
+	damon_free_target(t);
+}
+
 static struct kunit_case damon_test_cases[] = {
 	KUNIT_CASE(damon_test_target),
 	KUNIT_CASE(damon_test_regions),
@@ -1664,6 +1706,7 @@ static struct kunit_case damon_test_cases[] = {
 	KUNIT_CASE(damon_test_is_last_region),
 	KUNIT_CASE(damon_test_walk_control_obsolete),
 	KUNIT_CASE(damon_test_rand),
+	KUNIT_CASE(damon_test_last_region_quota_reset),
 	{},
 };
 
-- 
2.55.0

