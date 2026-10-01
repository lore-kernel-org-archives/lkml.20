Received: from mail-pz2-f37.google.com (mail-pz2-f37.google.com [74.125.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172032DECBF
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 00:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790813671; cv=none; b=ZdXs0y6WZs9GyovungFjAhspMhwkshsCXiPk4ExrIGqOYl8mmxe4K46KepUw6YdBebknrfTYc9SG89+e0CeXLkQBDZJNsyULxikjbUdoZzxW1GROl3B9dIVkb2eqMpqq6tX8oE/DrSJDn3hgUnjiUemzzetyp6F7RoBs4XkjmFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790813671; c=relaxed/simple;
	bh=Jn0mOoVjtQ15qWd0oqbYjSwTsr6g5QhXGD/Tygn/9bo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=U08BW9ofjU817oAXSSh7OWbT9Z+N5qamUFpGlADQZE9LdJVcBCR9Ma11y/dVTZDG4cRFe9a/xhP5+GPex5rPD+ABZbmD9PS6/eU5/2sW+V/NkopkjZ/chOzidPT5Kt5/snW7FMJgnwZ+naKRDQzts43f68e3y6OeJLsfLHDFE2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R6gf+A15; arc=none smtp.client-ip=74.125.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R6gf+A15"
Received: by mail-pz2-f37.google.com with SMTP id d2e1a72fcca58-88732460a36so766878b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790813669; x=1791418469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9y30WpELg39m0gWRlLIOMYQuYZ98WLf1dAoujzXj64A=;
        b=R6gf+A15aQeU2MJXGgSxoFKyLcj5kf6qh++0uNb2ydNFHJVMM/Pmd2WgXCIsDYUwH2
         9TPGYX8BfSA9jY1+B8YNdnh3crK3ibua/t9gjSJPh6TQZnU0TllTEbZOJ0stZA3Js0B3
         Ely2oOeuf/hr6W3wGKtlJMM9oTIZSgPNJpPxsRQAPtc152MEF8bydrK07DdCTna5aYkA
         F2L8tkFsZxhjw7muYWQgMvjY9O5cCmPrHvi2NyEpybFQThE3lLj3882Hrs2LMmy2lrNL
         MEkwXXoyjArCW0HM4IDXlnB50ySTsQCojmjEKLSlohnMC1rAJ158dndpjWtGA/O+Mm95
         F73Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790813669; x=1791418469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9y30WpELg39m0gWRlLIOMYQuYZ98WLf1dAoujzXj64A=;
        b=mY+rn2P2kG5gpxqh8UDIYRiZ0SE3FAZU7k3vjjAYszFdHZgx01cbV8rmXbu6DQGNoh
         HnkrqYpQpis2OSeWXHc+Une1O8unWlk9NJ9uK1CfU3eA0TtWN6UmwelEgQj24OOpCqES
         L90PhplCHbUizq/YO/23wWTpcqHe2J7V9flhr0YlcZgCIvXC99gJp8NklN4tAu3dtU7A
         DmPofkAiBNHrN481M9dfR0HgwWSa2BeJy+HUJyEh0w1QrYh54tE05HlRCjyU3CJ4I+Y0
         qPOj6DGLSgCXxeBJQMyx+ipX5sScuU1iWTB7mRLgivvmr3D95S/vPmTnZRxMiKDMTLcE
         4RhA==
X-Forwarded-Encrypted: i=1; AKwUvBy65XThEWSIwFcqyDGp+M9lG7ZXkDCswrAUtUJwi4HtlH7qO7EP2vUNE/oj/nAG0Qbw4fScjoK02pJryaQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nPLFwJ0QmUGXXNaPUyT3VgfHC59fHFNBJKyH8aWlB6zommUxXK
	uk/h6cndF2GHx5sO7ncQieT5PcOzaME3QQq7FYYwv33EuHJc+xBW9HfG
X-Gm-Gg: AYBFou0ZdQkL3RYft9NvcnjLMeutYWA+AUMSyhxTyyCv7XeBFak/iDMfUxNeids4XWb
	H8YzjFNj5uuq3BV5WXr2nIuMb2nxA1Ku1oGgVIvkUJ9PGGd4EO/4+ZRYO/WlSZe6oumIcatIiQ+
	BNMGAq+2l2/lNb7XanlQhQuDZ8/U9zD0jaFdcfoaiGf7OPImO05ZhZXiYUJvreBrzJAEz8rqFEl
	osuU2/Y1S08GT4cpqkYay/zc3qgHhsYNOpRrNwOUGR9x8DRRmrLls6T9fG0jICs++KoDaeD1CnL
	SAalwlExXrL8X5ezLBzCgiLClS9gnrS/l99SESwIILy7JXRB7a15Dh8KARmC2SxDb4h3k73kS2a
	63HcbUkI1tsGfQRXvSuxz5uut3/fWkZqhc40YVBF9JQ6gcrfOi/cMDHoj+Vf6UTo8YQz8v2yHo3
	vAgKrouFV7TPBhDJxONrNVSs1yW6HEGe15ftSI7Sdd4V2n1a3KSp3UEGEK5DNlkAFQWC6YoGZxs
	UezkrhOkr3W1J2KjOelZIPXc1I=
X-Received: by 2002:a05:6a00:3019:b0:857:726d:2e96 with SMTP id d2e1a72fcca58-8874c4dc5b1mr2481627b3a.19.1790813669343;
        Wed, 30 Sep 2026 17:14:29 -0700 (PDT)
Received: from zhangbo56-PC.mioffice.cn ([43.224.245.235])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88818814b2bsm253287b3a.19.2026.09.30.17.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 17:14:29 -0700 (PDT)
From: Bo Zhang <zhangbo0325@gmail.com>
X-Google-Original-From: Bo Zhang <zhangbo56@xiaomi.com>
To: akpm@linux-foundation.org,
	vbabka@kernel.org,
	david@kernel.org
Cc: surenb@google.com,
	mhocko@suse.com,
	brendan.jackman@linux.dev,
	hannes@cmpxchg.org,
	ziy@nvidia.com,
	ljs@kernel.org,
	liam@infradead.org,
	rppt@kernel.org,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	kasong@tencent.com,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	zhaonanzhe@xiaomi.com,
	lipengfei28@xiaomi.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Bo Zhang <zhangbo56@xiaomi.com>
Subject: [RFC PATCH v2 1/4] mm: compaction: parameterize fragmentation score by order
Date: Thu,  1 Oct 2026 08:14:09 +0800
Message-Id: <20261001001412.3837085-2-zhangbo56@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261001001412.3837085-1-zhangbo56@xiaomi.com>
References: <20261001001412.3837085-1-zhangbo56@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The proactive compaction fragmentation score functions are hardwired to
COMPACTION_HPAGE_ORDER (typically order-9 for 2MB THP). To later allow
proactive compaction to target other orders (e.g. smaller mTHP orders),
generalize these helpers to take an explicit order argument:

  - fragmentation_score_zone(zone, order)
  - fragmentation_score_zone_weighted(zone, order)
  - fragmentation_score_node(pgdat, order)

All callers pass COMPACTION_HPAGE_ORDER, so this patch is a pure
refactor with no functional change.

Signed-off-by: Bo Zhang <zhangbo56@xiaomi.com>
---
 mm/compaction.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/mm/compaction.c b/mm/compaction.c
index 4994e200bbec..ecd3e6cf54fc 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -2208,16 +2208,16 @@ static bool kswapd_is_running(pg_data_t *pgdat)
 
 /*
  * A zone's fragmentation score is the external fragmentation wrt to the
- * COMPACTION_HPAGE_ORDER. It returns a value in the range [0, 100].
+ * given order. It returns a value in the range [0, 100].
  */
-static unsigned int fragmentation_score_zone(struct zone *zone)
+static unsigned int fragmentation_score_zone(struct zone *zone, unsigned int order)
 {
-	return extfrag_for_order(zone, COMPACTION_HPAGE_ORDER);
+	return extfrag_for_order(zone, order);
 }
 
 /*
  * A weighted zone's fragmentation score is the external fragmentation
- * wrt to the COMPACTION_HPAGE_ORDER scaled by the zone's size. It
+ * wrt to the given order scaled by the zone's size. It
  * returns a value in the range [0, 100].
  *
  * The scaling factor ensures that proactive compaction focuses on larger
@@ -2225,11 +2225,11 @@ static unsigned int fragmentation_score_zone(struct zone *zone)
  * ZONE_DMA32. For smaller zones, the score value remains close to zero,
  * and thus never exceeds the high threshold for proactive compaction.
  */
-static unsigned int fragmentation_score_zone_weighted(struct zone *zone)
+static unsigned int fragmentation_score_zone_weighted(struct zone *zone, unsigned int order)
 {
 	unsigned long score;
 
-	score = zone->present_pages * fragmentation_score_zone(zone);
+	score = zone->present_pages * fragmentation_score_zone(zone, order);
 	return div64_ul(score, zone->zone_pgdat->node_present_pages + 1);
 }
 
@@ -2240,7 +2240,7 @@ static unsigned int fragmentation_score_zone_weighted(struct zone *zone)
  * the node's score falls below the low threshold, or one of the back-off
  * conditions is met.
  */
-static unsigned int fragmentation_score_node(pg_data_t *pgdat)
+static unsigned int fragmentation_score_node(pg_data_t *pgdat, unsigned int order)
 {
 	unsigned int score = 0;
 	int zoneid;
@@ -2251,7 +2251,7 @@ static unsigned int fragmentation_score_node(pg_data_t *pgdat)
 		zone = &pgdat->node_zones[zoneid];
 		if (!populated_zone(zone))
 			continue;
-		score += fragmentation_score_zone_weighted(zone);
+		score += fragmentation_score_zone_weighted(zone, order);
 	}
 
 	return score;
@@ -2269,12 +2269,13 @@ static unsigned int fragmentation_score_wmark(bool low)
 static bool should_proactive_compact_node(pg_data_t *pgdat)
 {
 	int wmark_high;
+	unsigned int order = COMPACTION_HPAGE_ORDER;
 
 	if (!sysctl_compaction_proactiveness || kswapd_is_running(pgdat))
 		return false;
 
 	wmark_high = fragmentation_score_wmark(false);
-	return fragmentation_score_node(pgdat) > wmark_high;
+	return fragmentation_score_node(pgdat, order) > wmark_high;
 }
 
 static enum compact_result __compact_finished(struct compact_control *cc)
@@ -2305,13 +2306,14 @@ static enum compact_result __compact_finished(struct compact_control *cc)
 
 	if (cc->proactive_compaction) {
 		int score, wmark_low;
+		unsigned int order = COMPACTION_HPAGE_ORDER;
 		pg_data_t *pgdat;
 
 		pgdat = cc->zone->zone_pgdat;
 		if (kswapd_is_running(pgdat))
 			return COMPACT_PARTIAL_SKIPPED;
 
-		score = fragmentation_score_zone(cc->zone);
+		score = fragmentation_score_zone(cc->zone, order);
 		wmark_low = fragmentation_score_wmark(true);
 
 		if (score > wmark_low)
@@ -3237,10 +3239,11 @@ static int kcompactd(void *p)
 		timeout = default_timeout;
 		if (should_proactive_compact_node(pgdat)) {
 			unsigned int prev_score, score;
+			unsigned int order = COMPACTION_HPAGE_ORDER;
 
-			prev_score = fragmentation_score_node(pgdat);
+			prev_score = fragmentation_score_node(pgdat, order);
 			compact_node(pgdat, true);
-			score = fragmentation_score_node(pgdat);
+			score = fragmentation_score_node(pgdat, order);
 			/*
 			 * Defer proactive compaction if the fragmentation
 			 * score did not go down i.e. no progress made.
-- 
2.34.1

