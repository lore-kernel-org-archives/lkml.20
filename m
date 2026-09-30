Received: from mail-wr2-f8.google.com (mail-wr2-f8.google.com [74.125.225.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176514CCDC6
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790769505; cv=none; b=GyBJlZHvvqK6s7307Mp/R6gs+wvktqtc9asQPM24iSGoNVXgpI4EhZXDNi3ePXF1vn2RWZ9WQWiBww1LJwopGwivectg+m45BN4RjVNt8avX9OO8CE/0GOhbbFDhULkcXqXA/unHM9V8nYSDV7NLnDIZbYO+Rbyc6tSD3WXlfqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790769505; c=relaxed/simple;
	bh=HmRlEKvsiaUzaGJNjBp6Bt9PpaxWq+TWrDMAI5HRAFA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tfuPJ671RzFJ0Rh/3rodfP+7ToIatrb78HvytCaI3m1ExMUxvkt+Q5gsc5TlvQwnqdnlGTrOtvnpB3GX9dZevlMR6qW2CArYQnd0hmjb2SdDqDZ7F2cSk3uGfpmeCSDPl/4jbM2m90UNPvEX2D48Yyg8bzy67L+wMGYnGEhIxIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H0cFmDEc; arc=none smtp.client-ip=74.125.225.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H0cFmDEc"
Received: by mail-wr2-f8.google.com with SMTP id ffacd0b85a97d-48b02aab050so179940f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 04:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790769502; x=1791374302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HhTlHttBfOfSCYbgzOBqnm1PlGqLGY0jClNl8O2m0Co=;
        b=H0cFmDEcWdto9Cdi+qTORI7jpoijecaH/p8O0p4FDW5dQvrIFQy9YsHKs+W4s/pyRJ
         c0qfWdvpkIEYPpYYVAAfiyZAClc4TtVPhi5kHgjBolZ89znLCJGu0+JhSIAi+ViL5KM1
         1X0R6TFWNcKtL2lnOKbFf93mefShHa/PmWV8yjv5THChgWklaSPeb6bl5rT0ZpZu9Vav
         OKB3N3CoDYDqfxPj4CsBq16o8F6+9tmM2ZuECJn11nDihPjd6R9GHXBCe7Z9BYLyJUy+
         KlgkNcWChZc8W3WVTWcsFcebAkfzzbItjamnwIziDy6Ry+Pu7oZ9BTtQRq7c/OrWmtl5
         Dh0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790769502; x=1791374302;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HhTlHttBfOfSCYbgzOBqnm1PlGqLGY0jClNl8O2m0Co=;
        b=LbegvunidLy2vb/ZYa0jqRr32HuSGUxnP9FNnByoWhpR/txMIWKld6bUNchxvhKiby
         Z5M8ua3Y5GJnwgv2tNIp94zaXMkGW5L6mP2EqCUAa1J3xlvKJkvAOU45Hpae9lMKeap+
         ALzaiONm+g2YzaXFf/1hHzcI4I1GWDUFnhaYD5eRU8F/zlmah+Kalq0mFYpAktVfJ47h
         YPBB4mx9gRrFLblifX84ORD3HTiEoII3swT74l7aEVCy9+Qch79JkWQrhqCbMCPcL/at
         sAWM0+7c6r+2XMiO3XjxXnSMZtfdZfjdwwxVwS+aq/LWW21SiHTvl6xg73rGxAXa7rbu
         9Inw==
X-Forwarded-Encrypted: i=1; AKwUvBzEWrF0LVdNrMpreHlpPLhnnMnKFV6a1u9P5IzFPtI1NXtPdTOZRWnBi8FSW6omCZ69Qp3rUcCaSoOm6Ig=@vger.kernel.org
X-Gm-Message-State: AFq9FYLCIJlaQN0eZKJbBbx2JW8Yg/v5zwpUazh6HUXbQi7RRLJZTlDv
	NJ03v5XpxR6rLndmWi/qCvKs2tKK7V69WbZ76DfGkb3q7Uf3G8branrP
X-Gm-Gg: AYBFou2tDErYtVhjwhzNLlH8vWE4QvL717Rtux0+yaknU4mBEQsrhXRw3LzKniXfQ2h
	5xNVex++d7rG5bNt9ZBpXzXHu02K3zN/Npj0GNnyI8AVaAuz8XEfSmVQQgko8x57ziVCfEbgOAm
	qtC1MbypFFenYzl2TAIZgeeFQcneqw3GqAcTPP7Yee2/5+7f+GvY1wy010qlBb949jVYWr6hjQS
	sctYIfeP2gqly3K8gYlCgonOOS2QVL9F3JZlfHY7q2EnW7MvElkmcXh49keqVZuZb9ztVzUYxyx
	IlcFFqdhQUdefHqYIkv9wLDiXyPhfsCpGJEzcRMMqXwg1aRcz5JbEsj93x4HKm1stJ7hpmE9Uic
	SxfSqIlL6tUjKmMMXClB4eDlffy3KtFv6KC899+YdpQI/O8gohXiS2pZCRKhgE2uluZfuZrm35J
	6z3Vx+E0lbsN2KNJ74IWyRdsJWPJwBMhAhxoTYakMJHFVdeSAw/3RkspR5JMaPnc1AVhB3KQSt1
	T2YnbDVJP3ieEQyKjirHchH1S53Xdq0Ex+TVWN+Pkpx3JbB6qpDez/IOmV2sTtwMJ0gT/e1IK9v
	0EEwW687CI6+uZBzfUg510AilHPmYpv4uw==
X-Received: by 2002:a05:6000:2888:b0:48a:f486:2f4b with SMTP id ffacd0b85a97d-48b024ea6dbmr2815254f8f.19.1790769502098;
        Wed, 30 Sep 2026 04:58:22 -0700 (PDT)
Received: from lima-kernel.telekom.ip (84-115-220-212.cable.dynamic.surfer.at. [84.115.220.212])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b028b237esm3334148f8f.0.2026.09.30.04.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 04:58:21 -0700 (PDT)
From: Jaeyeon Lee <jaeyeon.lee.dev@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Jaeyeon Lee <jaeyeon.lee.dev@gmail.com>
Subject: [PATCH] mm/damon/ops-common: fix age_in_sec overflow on 32-bit
Date: Wed, 30 Sep 2026 13:58:12 +0200
Message-ID: <20260930115812.138864-1-jaeyeon.lee.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

damon_hot_score() calculates the age of a region by multiplying r->age
and the aggregation interval.  On 32-bit architectures, unsigned long
is 32 bits, so the multiplication overflows once the age exceeds about
4295 seconds.  Then old regions are scored as if they were young.

Fix it by doing the calculation in 64-bit arithmetic using div_u64().
Also make age_in_sec u64, so the result is not truncated back to 32
bits.

The issue was discovered [1] by Sashiko.

[1] https://lore.kernel.org/20260623011652.1354-1-sj@kernel.org

Fixes: 198f0f4c58b9 ("mm/damon/vaddr,paddr: support pageout prioritization")
Assisted-by: LLM
Signed-off-by: Jaeyeon Lee <jaeyeon.lee.dev@gmail.com>
---
 mm/damon/ops-common.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/mm/damon/ops-common.c b/mm/damon/ops-common.c
index 77366f42b3e5..7a7429359dc8 100644
--- a/mm/damon/ops-common.c
+++ b/mm/damon/ops-common.c
@@ -164,7 +164,7 @@ int damon_hot_score(struct damon_ctx *c, struct damon_region *r,
 			struct damos *s)
 {
 	int freq_subscore;
-	unsigned int age_in_sec;
+	u64 age_in_sec;
 	int age_in_log, age_subscore;
 	unsigned int freq_weight = s->quota.weight_nr_accesses;
 	unsigned int age_weight = s->quota.weight_age;
@@ -174,7 +174,8 @@ int damon_hot_score(struct damon_ctx *c, struct damon_region *r,
 			DAMON_MAX_SUBSCORE,
 			damon_nr_samples_per_aggr(&c->attrs));
 
-	age_in_sec = (unsigned long)r->age * c->attrs.aggr_interval / 1000000;
+	age_in_sec = div_u64((u64)r->age * c->attrs.aggr_interval,
+			     USEC_PER_SEC);
 	if (age_in_sec)
 		age_in_log = min_t(int, ilog2(age_in_sec) + 1,
 				DAMON_MAX_AGE_IN_LOG);
-- 
2.43.0

