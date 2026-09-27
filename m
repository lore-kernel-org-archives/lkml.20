Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431D942467C
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 17:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790531517; cv=none; b=jt98HGU044P0ZoAjcg7qH18RwDAws/Ti2H8U8XW5zFufxclsvbrJWp5bPKHbW9tA3z3ilISnI36umck3x4/iLHnR72Ie0267FHr7ijcQtr/m3bYMSPHrJflrTImE3VcDYWXRQAO15rEbfCQ+r7bZw/F3mhXrmb2rbCcR5K2D7Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790531517; c=relaxed/simple;
	bh=Cf8NIJkWVY8TWvFnYDbn8a8mY24SXis/B6SkCoozzm0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ouf0USQA8OFixdWOSlkHNn7rJZWQb4aTd2uiG0bZd+n9AL6k8nSBXCK2gKnwk0t9ziWgsZmgFXR68/LCPFNXhHtfIiHOddrKlZdCp5MNXdbfxzorajBqJytL/krb9+hyEoU5VbgcGFooV1OjKOlxk3kkDY4wlFaM+VY3sQ/rbTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JcyH570j; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JcyH570j"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-39dacf053eeso1158175a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 10:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790531515; x=1791136315; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kwmzHbcrjIY/XcCe6sCdMKV/UzCFAPbJtQGnBjUsEZY=;
        b=JcyH570jH+xEeFFraOE1BtumEhawirZuvYoTPFX30PSG1de+du+ZDgfUTJJNZblFEd
         lkrrFfdWL+odRidCdJCvgPKKvh8oUQ0HEWuIFj1LYwwFQoeB52B1PHWcg8Rw52eC8QPR
         zDhs+smv7F3YxhWBo9VpxOojLKP7az4YIzipvqqKPI+sy4S8LQJ+uceoYHwheqLjUpCd
         Vpv/W5Q0Mbcfacs9zWcpSW43s+Bx/aqY1GTM1NGnUTVAYvAXJn8XsKDgJw+B4VabT2BE
         mbN0vyvXDNvh3Pz98gzEYhTyqPVScwYkEeQU+pJTh99gZQxJy7J8A2pUM3ZNH3MQUMaZ
         bv8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790531515; x=1791136315;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kwmzHbcrjIY/XcCe6sCdMKV/UzCFAPbJtQGnBjUsEZY=;
        b=vhjTZrJ16ZeZSSVDhHSYjCbG7ncZXD2QAzrqbiK+1LduTz7F89E7vc0C8XwWbpHtbH
         +khvEBsK6JLadF9nYZLRRuuj68IjrC76qLNA7Byn5V59kQwzP+X0GobVcNepIcynFAD7
         kKr8fL2p1ybmTVQzyk9ROKw8LtdLqgO6HBNzBAuNl3r3LLWvQXGTaNbX2pSvNZOcaQzA
         qiJCsALUI41H3aRfnHFVN+WOGYfw2N+U4ROaifMPi/Bt6apvLtnB/G6NL1hIISk9DBF3
         2IVLmDqeGAyFIP5qW0XhxDhyf4Q6ocDWUsZtuZJFhC2t252BglojP+Hx0dPSgdj2S8nr
         MJ2w==
X-Forwarded-Encrypted: i=1; AKwUvBxWTFjB+QRItvQGHstkDgBMWQImUKWfE6EpUrYAp33yjII1x2/frXJyQozoI6VRI69J4H98zg4XiuD+DCA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLo5WhWh03nihwqJwFoe7kh3Rzfl/6ho11qmQ7hZ2zBolxXGQiv
	zvD78BHypvwm79cMP4JPh8Q+jWsnAtZPoAID5AZuRXtq00OEKQfcSiGs
X-Gm-Gg: AYBFou0AcGT/p16eaJRXG0/PnkoXkasHwolL+CGi9i2IT5thVETGgz/1HznVpl3x6Y0
	ZGipPXoucChGUU/ZY3V3Q/9wj5P+oDL5ofsuHhZGq9A3hxS7etF4icfSq5C8hnHIJfiBaxwOnNc
	CpGBY7Dbr5Pod+pYGz5Q56hsU6S2MAYIZUFb3bcaJM19yW7ULQlXjZbUT3jYzt7JRb2wC35/8iM
	gIX3PoUBmXKZSPFdm/g2DLXzkeknechWQtvip0whqkhNGzLS4+wisvP4DWeal5/4WU3I2PaPdqr
	9ZDfrN+8gukDSGsW8ayUiSfo3iKFZgWPWK7SvWWzRjy/5DKzsHBDf/ESHUqUF49xk0JDXL2kyCA
	W5Mo+dXtBFwtNi4IYRfJ6X/6QV7ooknbn+L8F8+aNf3i9lBbxVjVb/jsJBo+VWSdO41SHcV9his
	Pl0rPskQ/hg/0++ew34QN+fRLh4tW46lrRF9hWc5spO96NKXfUbuInE9q0ePLgZB15NLf0Z/86r
	bwnJgJk+x4=
X-Received: by 2002:a17:90b:440c:b0:3a0:c8e6:ab30 with SMTP id 98e67ed59e1d1-3a0c8e6b9b6mr5659510a91.59.1790531515391;
        Sun, 27 Sep 2026 10:51:55 -0700 (PDT)
Received: from celestia ([2402:1980:867:387a:70b:38f1:a1dd:9303])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b9355e54sm15597784a91.5.2026.09.27.10.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 10:51:54 -0700 (PDT)
From: Liew Rui Yan <aethernet65535@gmail.com>
To: SJ Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Liew Rui Yan <aethernet65535@gmail.com>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] mm/damon/tests/core-kunit: add test for unconditionally skipping the last region
Date: Mon, 28 Sep 2026 01:51:43 +0800
Message-ID: <20260927175159.60703-1-aethernet65535@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit b3723b596b54 ("mm/damon/core: fix unconditionally skip last
region") fixed a minor bug.

Add a KUnit test case to cover this behavior and prevent regressions in
the future.

Signed-off-by: Liew Rui Yan <aethernet65535@gmail.com>
---

Changes from v2:
- v2: https://lore.kernel.org/damon/20260925045350.66595-1-aethernet65535@gmail.com
- Change the commit message, mention the fix rather than the original
  bug.

Changes from v1 RESEND:
- v1 RESEND: https://lore.kernel.org/damon/20260919080453.628679-1-aethernet65535@gmail.com
- Drop braces for single line, as suggested [1] in coding-style.
- Set min_region_sz initial value to power-of-2 value, '1'.
- [1] https://docs.kernel.org/process/coding-style.html#placing-braces-and-spaces

Changes from v1:
- v1: https://lore.kernel.org/damon/20260831113735.3349-1-aethernet65535@gmail.com
- Resend since the dependent patch is merged into mm-new, that would
  help us getting AI review help.

---
 mm/damon/tests/core-kunit.h | 42 +++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/mm/damon/tests/core-kunit.h b/mm/damon/tests/core-kunit.h
index 4a536d41cdb2..f4237436e1b4 100644
--- a/mm/damon/tests/core-kunit.h
+++ b/mm/damon/tests/core-kunit.h
@@ -1632,6 +1632,47 @@ static void damon_test_rand(struct kunit *test)
 	}
 }
 
+static void damon_test_last_region_quota_reset(struct kunit *test)
+{
+	struct damos s = {0};
+	struct damon_target *t;
+	struct damon_region *r1, *r2;
+	unsigned long min_region_sz = 1;
+	bool skipped;
+
+	t = damon_new_target();
+	if (!t)
+		kunit_skip(test, "target alloc fail");
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
@@ -1664,6 +1705,7 @@ static struct kunit_case damon_test_cases[] = {
 	KUNIT_CASE(damon_test_is_last_region),
 	KUNIT_CASE(damon_test_walk_control_obsolete),
 	KUNIT_CASE(damon_test_rand),
+	KUNIT_CASE(damon_test_last_region_quota_reset),
 	{},
 };
 
-- 
2.55.0

