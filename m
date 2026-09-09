Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066E83D3CF4
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 07:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788937652; cv=none; b=eOPpZJguAEnhN/zBT6dVuc39ziRt2vkvI6sKn43o/tZVIrORzHyWjrV8ukR1xBwqDKWW3nDR3bp1TORt2bHmC1MqVmvH0zH/jbpHG6DM3GaL2o6WteERayuxN5ZQLJHP5OAnrmEV5nsPB9OybnKWoKMSvOS0sXS2QkiXFi/JJ7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788937652; c=relaxed/simple;
	bh=8wIBjUz9IF5gEp20IIQYNH4b9XuoZQvuwa1sJkjCEyA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NaHBFxZorAARMe+ezSXsJpLOJ6vXLqU9QOFxCNhmkV5I3KkmeD0OrRyXAnVMEUSHLwJmfL5WdbDBzkYhCTdauVa03WmmNCtjJFch9XO9+EX1VxuOL2b5vVX+I1WweZjYKcBREs0tIhmxGkZSgY8Yiwqy2JNiKHoGTQiDJv0iJG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k4RSFTT7; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k4RSFTT7"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-398e9698a70so5002813a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 00:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788937645; x=1789542445; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4zwWptEuC/b5qmaSqXScFrcDGg6WicaoLVMMEs633Yk=;
        b=k4RSFTT72RQA0CU5KcApTsNaMublA5yJrTtW0HucExEQZaKpsj8poOLnFcUgO53ZOr
         6E0YddUcqUYUznVok0IkQTE3aFJIKxUAlwYl9ccMOGDv4VglZ1m3cY4AHkgKqPj4lWg8
         Q3nUslwMJ5KkfK+8BwLfwCKJVZVS6sTuYYfM6vzfriDVB5dvlCY6bTKIlj8fZ520Kli2
         aC8fxIebIfuFCcT1qS/SJWHsb3nucxAljVO8/Z0Wt3JoU1eHUCgh6ZxABfBvP2PD7lqF
         HLsDCoNdSnc2Hz54pEAzaH8T7ntqlwoY0PIurBxv62bbzOt2e16aUZbL249kKxlrqZxu
         TeYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788937645; x=1789542445;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4zwWptEuC/b5qmaSqXScFrcDGg6WicaoLVMMEs633Yk=;
        b=IqWyYT/SAdt3lpjFlLPM+P1GNbYJ74hg6vMhhEWA6jiEDtmrPlU62G9WF+bH+JfkyW
         /Qv6dvcot6atDHTboFYNNawD9VyflKQrW3gKmMeyGlpgEXDqB0W3fITlGrzyQW1bWqNk
         CS8eTLlxLOUP4bl/ad5ZR+WZXVMhfze4nhGgf61DPJ/MNOsypCfO9Jk3y0E0ZoGtvyNK
         VVoTlAVBkO8topTRknmNcYbJfO0uDegzeRVox9rvVLb9Mykeft1wcA3FfwzgC4iWXKWq
         tyMuoIzTkY5Eu3GwLuebJOKIVa2MH+5LZhMkOyeqlNabiZ5MhOF2tysb+nDzHYzKJ1vL
         VIQA==
X-Forwarded-Encrypted: i=1; AKwUvByG/68iKX257dT4HGAuOggLFq8cHxLcvfDg/D0jxAhaVuRHZ+3hwEr0R5fr2kIpdx71VDP32sBZkvlXy34=@vger.kernel.org
X-Gm-Message-State: AFuF++ndGSjLlHzyeYBSYCndCA9uMvtludBiZNbpTHqqUmhdWWxe5tjd
	87xLMOjYYtxj1/1WoYBilExnpGqI2BlLXuI5UOOfvUoQd7ZsE5WXLFHU
X-Gm-Gg: AYBFou0MHQyhS0rkab/+7Au9U13BaBcs6wmhKWybkqSjO+NiB847fXuCHGeqNhO+JEu
	MiRcNqtq7oDng5BLc9gqtdJkREmXNVtxwNVCCBcYJjRljLPgz1jSSSIkxAiAO+7hzOj8VMELpU+
	4l85ZvJcMaKaQDk1F+D2zinXM9puRlhVYSBuB4wLSpInleNK+1xBKqLeMr+eUJWwWb/dWec0Bhb
	vL4KIxSePSwC80APT6Ae1W4gTkf9TVwOhCYx0uu0XLilIXvqlxQYULYZm4ZZ4rGioLERlzbsdCp
	8/UuLlDxtOmynNXsaXdjiB3Cr7Rk9s2uzMn5OwtxLAICnf5p9l1wVIfSg1NAVJLFSgFmz6ymDnu
	BL+vvX17mtnk6+IDUKuv9DZJUSbM+gXFCtY3hJAF9H0p4FKJjj8LfhSKB479wqP50GZZGatEFtT
	3N9eXugLlh+XwBHfQgp3B07jkMIeLqKapzjM6XHDmyHAr/Zrj3ZcWZTAZRSnomogEHd4nyZC+wc
	WW0pR0rb3KIp7Qx5omdsFVQAZTk
X-Received: by 2002:a17:90b:1a88:b0:38f:efed:5448 with SMTP id 98e67ed59e1d1-39b2619138bmr47894514a91.8.1788937640108;
        Wed, 09 Sep 2026 00:07:20 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08d0d7e8sm38243802a91.16.2026.09.09.00.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 00:07:19 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: sj@kernel.org,
	akpm@linux-foundation.org
Cc: damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Kunwu Chan <kunwu.chan@gmail.com>,
	Lian Wang <lianux.mm@gmail.com>
Subject: [PATCH v2] mm/damon/tests/core-kunit: improve nr_samples_per_aggr test isolation
Date: Wed,  9 Sep 2026 15:07:11 +0800
Message-ID: <20260909070711.2448346-1-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Test the zero sample interval case with a non-zero aggregation
interval, and keep the zero/zero case to cover the zero-result
fallback.

Also make the overflow case use an explicit sample interval so that
it does not depend on the zero sample interval fallback.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
Reviewed-by: Lian Wang <lianux.mm@gmail.com>
---
Changes in v2:
- Use 0/0 for the zero-result case, consistent with damon_set_attrs().
- Update commit msg and add Reviewed-by tag.
- Link to v1: https://lore.kernel.org/damon/20260908063635.2208922-1-kunwu.chan@gmail.com/
---
 mm/damon/tests/core-kunit.h | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/mm/damon/tests/core-kunit.h b/mm/damon/tests/core-kunit.h
index c01e6a75cad..a47a5cdf285 100644
--- a/mm/damon/tests/core-kunit.h
+++ b/mm/damon/tests/core-kunit.h
@@ -627,12 +627,20 @@ static void damon_test_set_regions(struct kunit *test)
 
 static void damon_test_nr_samples_per_aggr(struct kunit *test)
 {
-	struct damon_attrs attrs = {
+	struct damon_attrs attrs;
+
+	/* Zero sample interval is treated as one. */
+	attrs = (struct damon_attrs){
 		.sample_interval = 0,
-		.aggr_interval = 0,
+		.aggr_interval = 5000,
 	};
+	KUNIT_EXPECT_EQ(test, damon_nr_samples_per_aggr(&attrs), 5000);
 
-	/* Zero aggregation interval doesn't cause division by zero */
+	/* Zero sample and aggregation intervals cover the zero-result fallback. */
+	attrs = (struct damon_attrs){
+		.sample_interval = 0,
+		.aggr_interval = 0,
+	};
 	KUNIT_EXPECT_EQ(test, damon_nr_samples_per_aggr(&attrs), 1);
 
 	/*
@@ -640,7 +648,10 @@ static void damon_test_nr_samples_per_aggr(struct kunit *test)
 	 * overflow
 	 */
 	if (ULONG_MAX > UINT_MAX) {
-		attrs.aggr_interval = (unsigned long)UINT_MAX + 1;
+		attrs = (struct damon_attrs){
+			.sample_interval = 1,
+			.aggr_interval = (unsigned long)UINT_MAX + 1,
+		};
 		KUNIT_EXPECT_EQ(test, damon_nr_samples_per_aggr(&attrs),
 				UINT_MAX);
 	}

base-commit: d118502628f8b673be9023db8bdf878f64a7ed45
-- 
2.43.0

