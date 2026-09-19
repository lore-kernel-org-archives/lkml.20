Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD05D357A3E
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 08:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789805092; cv=none; b=ZcGVEH4mUqQkLRxTD1i86w0iHF2ZYQXTU14Q5TQVHLt8HpO2s9oODtTvujne2HGMaydsxrx34eBY9l3aOMxL2DIjDafHwGSyalxvMhD9jako4jTZLhyGIQBmJR1wexwhS4pwLGLi+QkOw3E9AkB10hkrn9rEw4whpQLCWLgsWPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789805092; c=relaxed/simple;
	bh=KaDOABN88LHq1gFxG1tEAi60S42z1VNhpezrBbGF930=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n2Uu/IlFRm3WOuwaiOt/C8hFFfih7odzhA9YsNtrpAqiORnyG4VZDzCKb8N5SPBee10eyV3Wo4Q5vZL880E3Efg/TCm80Xu/7jfW7+ow/tyj62zCxbRV93sDq7b2hHxTghzXhAKDsNwcqB7EoZ3oKxt1foeqx1ajihmYcS5gYts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dxdsy+A3; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dxdsy+A3"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469d249c4so1403247b3a.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 01:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789805090; x=1790409890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M+BRVhkKKFrAm9F4me8SFnldKmWn3El7IJQUQ2no8Zc=;
        b=dxdsy+A3RpaFD+kq1euNM2QqU4BmrmtT4lfbnHTL64nTk4quYZMXu9TWXtDmOBO3+y
         dG5X5sn09LnC9mHFyGHVd6Rf7z078oMvR/jw/pF+sgUYSoqUsQ9ImISon0TPEywkBQSA
         SPrrmp7uZoDrJnI702gme3azYsH+nc6ZtesOz10yVRI/YqoboJy+JOgIK2nnXgMkpbwi
         c1gia/FXFj0osGp8FNk8o6sCbvETkFKPSOUtbuF3brcUmBGOeUWTRKGXO4XpggnwLRDC
         UrVhOEzFi2jdd4FQuaR8GfEJmEKp0n9ikuh0ixoAPR3Dz8iiyR1PImxP9FGMQ6NOtvBZ
         piSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789805090; x=1790409890;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M+BRVhkKKFrAm9F4me8SFnldKmWn3El7IJQUQ2no8Zc=;
        b=o2PqgshA9MhRBzNCfepNT1wgyvPQwdWOEcHh56zYLNTALhLajpeqO94NW45MV2iav1
         uifh2bsjSw6tnaYssHPm2y6u/AN6gWDuw6dgA3s+MLRJYdLOvcJT7XAnqzoKdXm5NQc4
         83QDL2KnN+lyvWQ9RA/JKkV2aOyYjK5g3d2rYJ+RAKP+LXbg5ZaO8hBvjtabDA8u/j72
         4aabCZi5yjYVnYTqn2GCwQveKwVDfBhAtec5O6/oU9ZUoOBF9ToCYeRILvfJ13LUYRTC
         Na6bMsmC+L2oRx08y4AHKihu0KO9thspXnfsH3CFIL9WaITFRpo+99zpuW59sojV6dtb
         EEyA==
X-Forwarded-Encrypted: i=1; AKwUvBx/W2KSLVum3knH1ll3GCLycpk9nuiN0ni/j9101GS565ZjrOyqgSYwXNFUBKuX7q3wv9BwfPwaX227VlI=@vger.kernel.org
X-Gm-Message-State: AFuF++kJIFVGjniEGnr1tBn0G59ItswEf7Pkx1Xzce3U2KELq79duaWg
	YYS2A+DZ66Ig1oCGaPUhagCsEkD/oLhrK63CH+oYW6A5Qj7LQKxoBpw6
X-Gm-Gg: AYBFou1s4Ho83cerEXErPq8cMqzXqLhXS0z8s+PTE2/QdidHmlpSQnwG+fW2D2x0b14
	iut14rjFZfK8s21zmPIybB/44UefKYRHVoqL8yltKf5jGz2VpQAUKWe7YJWxGxggXKGYxc81xVg
	tw8qjTtGjEPYruFJpfqZOX6O7H5x5LBMgWKPtpHo/ntzH5ktUP/5wG9irmETb/vDP7v+lv/NEcO
	Ni0zDXaKyb5EAiVGNUB4fnP0M2d3JpB/Ck9CnHyXrq1esJPr+8xURrEWJpdQlcJ700rQdcaWJM3
	+vRUJ7i/7t391QVE1kePMSclIJOVE5ZlF7+S8W+YBn9wZq0YXd4J3/B0QMknMpGJ4EeWAylRcWW
	o1t8WO8SZdYpb4/FiF43GD8EQIYa8BRpxVHJCIU+6GPTjA4ucMv/MvYRCGRAxcKgu/aFA18OZoJ
	wpMZbaIkSH3J+7t06WRsbDn0qzJanFL22vXsLwCmF213Y5FVEXrcxB4DrNlwr0adK8S8WSpZTz1
	XJwFt9MEili
X-Received: by 2002:a05:6a00:4655:b0:852:38ff:b4b6 with SMTP id d2e1a72fcca58-874dd6ff304mr8942695b3a.17.1789805090087;
        Sat, 19 Sep 2026 01:04:50 -0700 (PDT)
Received: from celestia ([2402:1980:c3f:8e4f:9945:ef6a:453a:80bc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877aa11153dsm782402b3a.51.2026.09.19.01.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 01:04:49 -0700 (PDT)
From: Liew Rui Yan <aethernet65535@gmail.com>
To: SJ Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Liew Rui Yan <aethernet65535@gmail.com>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] mm/damon/tests/core-kunit: add test for unconditionally skipping the last region
Date: Sat, 19 Sep 2026 16:01:58 +0800
Message-ID: <20260919080453.628679-1-aethernet65535@gmail.com>
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

Changes from v1:
- v1: https://lore.kernel.org/damon/20260831113735.3349-1-aethernet65535@gmail.com
- Resend since the dependent patch is merged into mm-new, that would
  help us getting AI review help.

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

