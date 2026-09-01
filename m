Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A8A30BF69
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 14:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788272118; cv=none; b=fAtlRoj1n+91o4ODpFLnIcde+OXommkAOj62RPDN2AtnkuwQhjK0NmeNpyC2F4WTFxGd2Mru/kFwSGIf2BDT/SkTlUSSqy/M6xeGa+KnPS0cZGsCY/ou5JYCgi4TvDJbpspUIOkBmGgxfTiRXVnr11GS9jphpV3NB4hSYP+sts8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788272118; c=relaxed/simple;
	bh=FU4bIvESXfUDT39fdAx5J2BTWTMbhbo0sGzqm9jWGyA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u3JTwjMXor0t9DDsoKvDDROPX0mN9NJKCiqDWBpNnmqrRtFUV9/6ov5JJdCPRLaeg0mEAfIeREo9KdTAhl1Kx4c1yZefnUymm4J9Exjc3m+yqvW8ZK5+JeS20e7SZ1fXygqpKEWQo+JDfXyNugTUuKkZpwAD61+KxPTx0G/D7Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r9LGv+qt; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r9LGv+qt"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so39607435e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 07:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788272115; x=1788876915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WLQD5GRtLcBENC91U/en+E67ds0eDp4Ln87ubW+kt04=;
        b=r9LGv+qtiJUM4+QBPThHZPbqX3IVdOEVbXZusoDmpWlvtq8bxb1WT9qrHlSSzK8inq
         ekSn0HxHW6ke+c6Rn9nHGwC+RfCDYaRDhCBfU/srs/s/iAD0QwMxYHSdw/vUIPhRBzhL
         Ed9gBScFHxEip7S9NMgb86DNULrUi2HuSEgfKVxlzNDAwkkMUohuIBVaXx/JGWcVUnZZ
         h1sKz7H02K8fIY8aRdk3Dq9w9BDw9yS3gXJQbZz//QCVeqEZrm1CbozL4/AQpYIDKuGi
         piAyJTZDW3+SevMzJrSYNxw2JoLETyTHJFTWQPchcib+rkO4GEYlhuvhezVJIQ00JuNC
         pP/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788272115; x=1788876915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WLQD5GRtLcBENC91U/en+E67ds0eDp4Ln87ubW+kt04=;
        b=EBXWtz2Wvxiew2iG9FiKrWByStEW84OtQdtVP3ecNafyqQQ5eea/5T0yB7MSz9TJjA
         3xB+OQrJQ4E2ef/UK8XfnRFLCafg3PF8REG0PJZxRuaGVCKGMnyH8d0ZMk5x40vjwiR1
         2vHQXvOytWPlC6QQN7EwKHXiwNF7QQnXJzaIPycHqoHarafZS+PGgi/euKGTgIi/mu1R
         5ONFsrCWmI5Atq49lDsRjFsLQ/BnEVhfNVcydZLR2a/CggbtPkh1jvegJ6oU+6mjvhlb
         CAvP5274byYKVskTNAfOdtH7DvZIifsL9F08FXSafavfxPgjT7ZKgfLa00EBKwL2MZYI
         b0gg==
X-Forwarded-Encrypted: i=1; AHgh+Rrn1TYLUtp5FT61hvataTAJqOklKKu8flBva3L73tmPyx6B9gdf8Nrtg2LYy+WVvhejgFWFLdKWkEzPlhg=@vger.kernel.org
X-Gm-Message-State: AFuF++m+HEZLYrQqJLIoB0ffyW7Vn3iU4VT1TlOg5WlRbLBXmitf8Pqf
	XkixaajNBkQoootvuNNEYWb3rPCACbe1KTh7pIFLHO4WjhBx5vZwQPyg
X-Gm-Gg: AR+sD10dHk4jAV3N2soq/NBNIrYO4KyoceFKPRIBAkoWeRXv+4ch5KDdaU2Dd6oCfya
	nU3rKnOj2w35L1AX8rXKq90GLkTcdXzWo0AzrSw2btvkeTxNLZTBEnE/8CRyzMNsgmGi1utrsGH
	wGDEc2cBBVnEiUym3uzKHVlTLf7LldQEF/bLIMFkz4pXW6UtLp2SE104tJ/3KyFU6TTJ+3z1Qbo
	so+m3687mt4TMP/HYLbdqvAEBEmx5cStJ54TYb/aQHazWJEHjTfqqu/Wn6FtVtiJ/nWtWx1TTHp
	TPIJE4s403ILW68JiSIdE/AXQfEpOqW/14I16D6xgtcMvwPa5Bt+X3pLFhuBfaq5UdUjYS/D+Ht
	DUcazwXl/DIgjepEv1ic1OOinvM3TZj8aeg6N82WYgi2dBDf4j1lSIkA9Uk06HaAbmXyaMkqOyn
	3/bxaa4iyWPBovnqnS3xrieIbRbFcl3mD/fTojW4cD/dpq/95inLl6EQqpm9A8tGq2ruj5eG/tG
	I1xFrUIiyiPSQ==
X-Received: by 2002:a05:600c:8411:b0:499:4892:d022 with SMTP id 5b1f17b1804b1-49b91c279e1mr626555745e9.8.1788272114769;
        Tue, 01 Sep 2026 07:15:14 -0700 (PDT)
Received: from outlook.com ([2a02:587:6022:4b00:1b6:8132:8387:474d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce10153sm77227925e9.4.2026.09.01.07.15.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 01 Sep 2026 07:15:13 -0700 (PDT)
From: Christos Skarlos <christosskarlos.kernel@gmail.com>
To: akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Christos Skarlos <christosskarlos.kernel@gmail.com>
Subject: [PATCH] mm/page_alloc: fix various coding style warnings
Date: Tue,  1 Sep 2026 17:15:04 +0300
Message-ID: <20260901141504.1518-1-christosskarlos.kernel@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Resolve several coding style issues flagged by checkpatch.pl:
- Replace spaces with tabs for proper code indentation.
- Add missing blank lines after variable declarations.
- Replace bare 'unsigned' with 'unsigned int'.
- Fix suspect code indentation in conditional statements.

No functional changes are introduced.

Signed-off-by: Christos Skarlos <christosskarlos.kernel@gmail.com>
---
 mm/page_alloc.c | 42 +++++++++++++++++++++++-------------------
 1 file changed, 23 insertions(+), 19 deletions(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 12fac9084c48..7c9152c58084 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -575,7 +575,7 @@ void __meminit init_pageblock_migratetype(struct page *page,
 static int page_outside_zone_boundaries(struct zone *zone, struct page *page)
 {
 	int ret;
-	unsigned seq;
+	unsigned int seq;
 	unsigned long pfn = page_to_pfn(page);
 	unsigned long sp, start_pfn;
 
@@ -846,7 +846,7 @@ static inline void __del_page_from_free_list(struct page *page, struct zone *zon
 {
 	int nr_pages = 1 << order;
 
-        VM_WARN_ONCE(get_pageblock_migratetype(page) != migratetype,
+	VM_WARN_ONCE(get_pageblock_migratetype(page) != migratetype,
 		     "page type is %d, passed migratetype is %d (nr=%d)\n",
 		     get_pageblock_migratetype(page), migratetype, nr_pages);
 
@@ -2927,6 +2927,7 @@ static bool free_frozen_page_commit(struct zone *zone,
 	    zone_watermark_ok(zone, 0, high_wmark_pages(zone),
 			      ZONE_MOVABLE, 0)) {
 		struct pglist_data *pgdat = zone->zone_pgdat;
+
 		clear_bit(ZONE_BELOW_HIGH, &zone->flags);
 
 		/*
@@ -3155,6 +3156,7 @@ int __isolate_free_page(struct page *page, unsigned int order)
 	 */
 	if (order >= pageblock_order - 1) {
 		struct page *endpage = page + (1 << order) - 1;
+
 		for (; page < endpage; page += pageblock_nr_pages) {
 			int mt = get_pageblock_migratetype(page);
 			/*
@@ -3821,9 +3823,9 @@ get_page_from_freelist(gfp_t gfp_mask, unsigned int order, int alloc_flags,
 		unsigned long mark;
 
 		if (cpusets_enabled() &&
-			(alloc_flags & ALLOC_CPUSET) &&
-			!__cpuset_zone_allowed(zone, gfp_mask))
-				continue;
+		    (alloc_flags & ALLOC_CPUSET) &&
+		    !__cpuset_zone_allowed(zone, gfp_mask))
+			continue;
 		/*
 		 * When allocating a page cache page for writing, we
 		 * want to get it from a node that is within its dirty
@@ -3943,16 +3945,16 @@ get_page_from_freelist(gfp_t gfp_mask, unsigned int order, int alloc_flags,
 			prep_new_page(page, order, gfp_mask, alloc_flags);
 
 			return page;
-		} else {
-			if (cond_accept_memory(zone, order, alloc_flags))
-				goto try_this_zone;
+		}
+		if (cond_accept_memory(zone, order, alloc_flags))
+			goto try_this_zone;
 
-			/* Try again if zone has deferred pages */
-			if (deferred_pages_enabled()) {
-				if (_deferred_grow_zone(zone, order))
-					goto try_this_zone;
+		/* Try again if zone has deferred pages */
+		if (deferred_pages_enabled()) {
+			if (_deferred_grow_zone(zone, order))
+				goto try_this_zone;
 			}
-		}
+
 	}
 
 	/*
@@ -4637,7 +4639,7 @@ bool gfp_pfmemalloc_allowed(gfp_t gfp_mask)
  * Returns true if a retry is viable or false to enter the oom path.
  */
 static inline bool
-should_reclaim_retry(gfp_t gfp_mask, unsigned order,
+should_reclaim_retry(gfp_t gfp_mask, unsigned int order,
 		     struct alloc_context *ac, int alloc_flags,
 		     bool did_some_progress, int *no_progress_loops)
 {
@@ -4673,9 +4675,9 @@ should_reclaim_retry(gfp_t gfp_mask, unsigned order,
 		bool wmark;
 
 		if (cpusets_enabled() &&
-			(alloc_flags & ALLOC_CPUSET) &&
-			!__cpuset_zone_allowed(zone, gfp_mask))
-				continue;
+		    (alloc_flags & ALLOC_CPUSET) &&
+		    !__cpuset_zone_allowed(zone, gfp_mask))
+			continue;
 
 		available = reclaimable = zone_reclaimable_pages(zone);
 		available += zone_page_state_snapshot(zone, NR_FREE_PAGES);
@@ -5713,6 +5715,7 @@ static unsigned long nr_free_zone_pages(int offset)
 	for_each_zone_zonelist(zone, z, zonelist, offset) {
 		unsigned long size = zone_managed_pages(zone);
 		unsigned long high = high_wmark_pages(zone);
+
 		if (size > high)
 			sum += size - high;
 	}
@@ -5865,7 +5868,7 @@ int find_next_best_node(int node, nodemask_t *used_node_mask)
  * DMA zone, if any--but risks exhausting DMA zone.
  */
 static void build_zonelists_in_node_order(pg_data_t *pgdat, int *node_order,
-		unsigned nr_nodes)
+		unsigned int nr_nodes)
 {
 	struct zoneref *zonerefs;
 	int i;
@@ -6393,6 +6396,7 @@ void __init setup_per_cpu_pageset(void)
 	 */
 	for_each_possible_cpu(cpu) {
 		struct per_cpu_zonestat *pzstats = &per_cpu(boot_zonestats, cpu);
+
 		memset(pzstats->vm_numa_event, 0,
 		       sizeof(pzstats->vm_numa_event));
 	}
@@ -6803,7 +6807,7 @@ static void setup_min_unmapped_ratio(void)
 
 	for_each_zone(zone)
 		zone->zone_pgdat->min_unmapped_pages += (zone_managed_pages(zone) *
-						         sysctl_min_unmapped_ratio) / 100;
+							 sysctl_min_unmapped_ratio) / 100;
 }
 
 
-- 
2.50.1 (Apple Git-155)

