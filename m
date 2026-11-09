Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794219675;
	b=5JIQGZo20vGGfZ4WMc7BzGmXqnDd0h5qHHhSvOhxYQcnKdVyeiBXtDH7pfIkHjLIvUHs
	 XWlbVOOFl3TTocv3ruXeJN8zXGjzlZ5s4ZFuKeMg1XRHfj/BLKZmmZJ+WcIUCy++ei5K5
	 Uj2tTc8gGQeGpB3+b0Dx7j/zV2qvnJctMS5DF5VBQzSYo3m6YhDfbVIs2YwF1h40WF7N/
	 JCAbPyjwTVuv4Us3OqLOO85oAMFmSbEz++G3S0UvhnLeCc0sLmtjNBCdtfAw6AqJsu7es
	 U2vHDoqeQkit22Y+JrrGxMZfVWAPA/nM09n7XuVXmWvN5Ax0/qU3/CQjZJ2VryBZIuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794219675;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer;
	bh=LEE36WKHPllDbgW6toyyKwEMHeM9L2iqzDg0LSw7oBg=;
	b=MgRZhbQAI6veSY4kTaNudfdaz0cVTX0c+VpHjNvpqbZOqGArr3t7HrKn6yl3e05X8O4j
	 3SlIKZdgu3NiJcuI7HXWJ/HKWGzWAy8Eu5DzCisX4n6BCjFdYMBPpiUtVGupD8sfU1PiM
	 UDdl06HFcZBNRjSzzYGxkq8wr6fNbgHHJczGNGCTvXp/zeYoufPrWQsXoowwxGNibE1h3
	 /B4FhLsPSRlUoWWhWQ3ZZ/MtcgZT3HgamMZ/uGphrk/hgtDiFoQBfSMR2FlQSOJwdobKV
	 J4krcTtk0ffK0H25p0A8/Vn3k19ZDox+osKUJTFpq8pYY6s6wJlS6rPA1CXDgpTG/FQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Qt4xMok/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6143606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 10:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qt4xMok/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A79F1F0089F;
	Mon,  9 Nov 2026 10:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794219674;
	bh=LEE36WKHPllDbgW6toyyKwEMHeM9L2iqzDg0LSw7oBg=;
	h=From:Date:Subject:To:Cc;
	b=Qt4xMok/6i9WJyzQgvcCCe5846EdlQheWoqjqy5zjZ+oHVk+OQ4qZUjgKxmmwhFkh
	 Mx5uQ6SsxH8VDEhFF7u78hinQ4FWGsQyn5iq91phY8/g8hba6CJMY3KTZS06kVRjyR
	 f83dEh5YTOZIv1uDZh1/Ggq4iZlB7tLjqPN0jG6BwXkrDxiyd4ovYTKkoWN2AC1+g2
	 oDfMl9i96CQq6DMDJHZfZzUfecZMx85wCljTowP9wDq0uSox89yG+bKMsp22fJ3+hK
	 rnUesbNTWlrLPK5CxSjYdm5edGRzHSwhThM+ps1OwBqcVEWCO8l6uqsRO2CbpbiUXr
	 EEbfgm8rBz7rg==
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Date: Mon, 09 Nov 2026 11:20:59 +0100
Subject: [PATCH v2] mm, vmscan: make kswapd unreserve highatomic pageblocks
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
Message-Id: <20261109-kswapd-highatomic-unreserve-v2-1-6587ca75c77f@kernel.org>
X-B4-Tracking: v=1; b=H4sIAIqe8WoC/32NSw6DIBQAr2JYlwaw0s+q92hcIDzl1RYMKG1jv
 HvR7rucZDIzkwgBIZJLMZMACSN6l0HsCqKtch1QNJmJYEJyVjLax5caDLXYWTX6J2o6uQC5koA
 eQUpxBi0rw0guDAFafG/1W/3jODV30OOaXA2LcfThs+0TX73fibPD31PilNPy1EDFmVSmra49B
 AePvQ8dqZdl+QI+30mq2QAAAA==
X-Change-ID: 20261030-kswapd-highatomic-unreserve-7e6629ec65d0
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>, 
 David Hildenbrand <david@kernel.org>, Qi Zheng <qi.zheng@linux.dev>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>, 
 Kairui Song <kasong@tencent.com>, Barry Song <baohua@kernel.org>, 
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
 Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 JP Kobryn <jp.kobryn@linux.dev>, Frank van der Linden <fvdl@google.com>, 
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>, 
 "Jose A. Perez de Azpillaga" <azpijr@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
X-Mailer: b4 0.16.0

A customer has reported excessive reclaim activity despite memory above
high watermarks. Analyzing support data (including sar log) revealed the
following scenario:

- the system has almost all memory reserved as 1G hugepages for kvm
  guests, and operates normally
- due to a spike of memory pressure from userspace, highatomic
  reservations occur (probably due to e.g. concurrent network receive
  activity)
- on one of the 8 NUMA nodes, this creates a situation where free pages
  are above high watermark, but when __zone_watermark_unusable_free()
  considers highatomic pageblocks, the result appears to be below the
  low watermark
- pgdat_balanced() is false, kswapd hopelessly keeps trying to balance,
  spending cpu time and disrupting the system. It has nothing to reclaim
  because the node is filled with hugetlbfs hugepages.
- since the overal memory pressure is under control again and there are
  no allocations restricted to the affected node, they are satisfied
  from other nodes without going through direct reclaim
- since direct reclaim is the only code that calls
  unreserve_highatomic_pageblock(), this never happens and nothing fixes
  the situation

Note this was observed on a 6.4-based kernel and there have been recent
fixes upstream limiting the highatomic reservation side, but I don't
think they can prevent the same happening in mainline, only perhaps
lower the chances. Nothing seems to prevent the issue completely.

For example, while we limit the amount of highatomic pageblocks to 1% of
the zone, this calculation does not subtract the amount of hugepages or
otherwise permanent allocations, so the highatomic pageblocks can end up
taking much higher share of actually reclaimable memory.

The most targeted fix thus appears to be to allow kswapd perform the
highatomic pageblock unreserve to match direct reclaim. It's also
somewhat similar in principle to how kswapd reduces watermark boosting.

Hook this highatomic unreserve to the moment we exit the loop in
balance_pgdat() due to exhausting reclaim priority, which means pgdat
was not balanced and the last kswapd_shrink_node() attempt returned
false or failed to reclaim anything. Even if that last attempt made the
pgdat balanced, kswapd was struggling enough, so unreserving is far from
premature. This should be a more conservative variant of when direct
reclaim failure triggers the unreserving. Pass force as true to make
sure repeated failures fully unreserve everything. Also make sure we
don't count kswapd failures until then. Don't restart immediately as
the kswapd() loop will call balance_pgdat() again if the unreserve does
not lead to a balanced pgdat.

The only caveat is that direct reclaim knows which migratetype it wants
to allocate and thus changes the highatomic pageblock to. Kswapd doesn't
track that, so use MIGRATE_UNMOVABLE. Highatomic allocations usually are
not movable, and this will avoid creating nominally movable pageblocks
polluted with unmovable pages, so it should be the least problematic
default.

Signed-off-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
---
We interrupt the regular stream of AI fixes by something a bit
different. RFC to get agreement on the approach. Haven't tried
reproducing the issue in mainline, but it seems quite clear to me from
the data I've seen.
---
Changes in v2:
- Don't unreserve prematurely (Jose, sashiko)
- Fix movable->unmovable in comment (Jose, sashiko)
- Prevent exhausting kswapd failures (sashiko)
- Link to v1: https://patch.msgid.link/20261104-kswapd-highatomic-unreserve-v1-1-38be5106adf5@kernel.org
---
 mm/page_alloc.c | 126 +++++++++++++++++++++++++++++---------------------------
 mm/page_alloc.h |   3 ++
 mm/vmscan.c     |  24 ++++++++++-
 3 files changed, 91 insertions(+), 62 deletions(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index a8cac5e01066..785a13570788 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -3476,6 +3476,68 @@ static void reserve_highatomic_pageblock(struct page *page, int order,
 	}
 }
 
+bool unreserve_highatomic_pageblock_zone(struct zone *zone, int migratetype,
+					 bool force)
+{
+	/*
+	 * Preserve at least one pageblock unless memory pressure
+	 * is really high.
+	 */
+	if (!force && zone->nr_reserved_highatomic <= pageblock_nr_pages)
+		return false;
+
+	guard(spinlock_irqsave)(&zone->lock);
+	for (int order = 0; order < NR_PAGE_ORDERS; order++) {
+		struct free_area *area = &(zone->free_area[order]);
+		unsigned long size;
+		struct page *page;
+		int ret;
+
+		page = get_page_from_free_area(area, MIGRATE_HIGHATOMIC);
+		if (!page)
+			continue;
+
+		size = max(pageblock_nr_pages, 1UL << order);
+		/*
+		 * It should never happen but changes to locking could
+		 * inadvertently allow a per-cpu drain to add pages to
+		 * MIGRATE_HIGHATOMIC while unreserving so be safe and watch for
+		 * underflows.
+		 */
+		if (WARN_ON_ONCE(size > zone->nr_reserved_highatomic))
+			size = zone->nr_reserved_highatomic;
+		zone->nr_reserved_highatomic -= size;
+
+		/*
+		 * Convert to migratetype and avoid the normal pageblock
+		 * stealing heuristics. Minimally, the caller is doing the work
+		 * and needs the pages. More importantly, if the block was
+		 * always converted to MIGRATE_UNMOVABLE or another type then
+		 * the number of pageblocks that cannot be completely freed may
+		 * increase.
+		 */
+		if (order < pageblock_order)
+			ret = move_freepages_block(zone, page,
+					MIGRATE_HIGHATOMIC, migratetype);
+		else {
+			move_to_free_list(page, zone, order,
+					  MIGRATE_HIGHATOMIC,
+					  migratetype);
+			change_pageblock_range(page, order, migratetype);
+			ret = 1;
+		}
+		/*
+		 * Reserving the block(s) already succeeded,
+		 * so this should not fail on zone boundaries.
+		 */
+		WARN_ON_ONCE(ret == -1);
+		if (ret > 0)
+			return true;
+	}
+
+	return false;
+}
+
 /*
  * Used when an allocation is about to fail under memory pressure. This
  * potentially hurts the reliability of high-order allocations when under
@@ -3491,70 +3553,12 @@ static bool unreserve_highatomic_pageblock(const struct alloc_context *ac,
 	struct zonelist *zonelist = ac->zonelist;
 	struct zoneref *z;
 	struct zone *zone;
-	struct page *page;
-	int order;
-	int ret;
 
 	for_each_zone_zonelist_nodemask(zone, z, zonelist, ac->highest_zoneidx,
 								ac->nodemask) {
-		/*
-		 * Preserve at least one pageblock unless memory pressure
-		 * is really high.
-		 */
-		if (!force && zone->nr_reserved_highatomic <=
-					pageblock_nr_pages)
-			continue;
-
-		guard(spinlock_irqsave)(&zone->lock);
-		for (order = 0; order < NR_PAGE_ORDERS; order++) {
-			struct free_area *area = &(zone->free_area[order]);
-			unsigned long size;
-
-			page = get_page_from_free_area(area, MIGRATE_HIGHATOMIC);
-			if (!page)
-				continue;
-
-			size = max(pageblock_nr_pages, 1UL << order);
-			/*
-			 * It should never happen but changes to
-			 * locking could inadvertently allow a per-cpu
-			 * drain to add pages to MIGRATE_HIGHATOMIC
-			 * while unreserving so be safe and watch for
-			 * underflows.
-			 */
-			if (WARN_ON_ONCE(size > zone->nr_reserved_highatomic))
-				size = zone->nr_reserved_highatomic;
-			zone->nr_reserved_highatomic -= size;
-
-			/*
-			 * Convert to ac->migratetype and avoid the normal
-			 * pageblock stealing heuristics. Minimally, the caller
-			 * is doing the work and needs the pages. More
-			 * importantly, if the block was always converted to
-			 * MIGRATE_UNMOVABLE or another type then the number
-			 * of pageblocks that cannot be completely freed
-			 * may increase.
-			 */
-			if (order < pageblock_order)
-				ret = move_freepages_block(zone, page,
-							   MIGRATE_HIGHATOMIC,
-							   ac->migratetype);
-			else {
-				move_to_free_list(page, zone, order,
-						  MIGRATE_HIGHATOMIC,
-						  ac->migratetype);
-				change_pageblock_range(page, order,
-						       ac->migratetype);
-				ret = 1;
-			}
-			/*
-			 * Reserving the block(s) already succeeded,
-			 * so this should not fail on zone boundaries.
-			 */
-			WARN_ON_ONCE(ret == -1);
-			if (ret > 0)
-				return ret;
-		}
+		if (unreserve_highatomic_pageblock_zone(zone,
+							ac->migratetype, force))
+			return true;
 	}
 
 	return false;
diff --git a/mm/page_alloc.h b/mm/page_alloc.h
index e238ee91ed24..9fba6480b18d 100644
--- a/mm/page_alloc.h
+++ b/mm/page_alloc.h
@@ -282,6 +282,9 @@ static inline bool free_area_empty(struct free_area *area, int migratetype)
 	return list_empty(&area->free_list[migratetype]);
 }
 
+bool unreserve_highatomic_pageblock_zone(struct zone *zone, int migratetype,
+					 bool force);
+
 /* Convert GFP flags to their corresponding migrate type */
 #define GFP_MOVABLE_MASK (__GFP_RECLAIMABLE|__GFP_MOVABLE)
 #define GFP_MOVABLE_SHIFT 3
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 9959ca158ce8..af3079c6e32d 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -7317,6 +7317,7 @@ static int balance_pgdat(pg_data_t *pgdat, int order, int highest_zoneidx)
 	unsigned long pflags;
 	unsigned long nr_boost_reclaim;
 	unsigned long zone_boosts[MAX_NR_ZONES] = { 0, };
+	bool has_highatomic = false;
 	bool boosted;
 	struct zone *zone;
 	struct scan_control sc = {
@@ -7342,6 +7343,8 @@ static int balance_pgdat(pg_data_t *pgdat, int order, int highest_zoneidx)
 	for_each_managed_zone_pgdat(zone, pgdat, i, highest_zoneidx) {
 		nr_boost_reclaim += zone->watermark_boost;
 		zone_boosts[i] = zone->watermark_boost;
+		if (zone->nr_reserved_highatomic)
+			has_highatomic = true;
 	}
 	boosted = nr_boost_reclaim;
 
@@ -7478,13 +7481,32 @@ static int balance_pgdat(pg_data_t *pgdat, int order, int highest_zoneidx)
 	 * If the reclaim was boosted, we might still be far from the
 	 * watermark_high at this point. We need to avoid increasing the
 	 * failure count to prevent the kswapd thread from stopping.
+	 * We also don't want to stop unreserving highatomic pageblocks,
+	 * if there are any.
 	 */
-	if (!sc.nr_reclaimed && !boosted) {
+	if (!sc.nr_reclaimed && !boosted && !has_highatomic) {
 		int fail_cnt = atomic_inc_return(&pgdat->kswapd_failures);
 		/* kswapd context, low overhead to trace every failure */
 		trace_mm_vmscan_kswapd_reclaim_fail(pgdat->node_id, fail_cnt);
 	}
 
+	/*
+	 * We exhausted all reclaim priority and didn't balance pgdat (except
+	 * perhaps during the last attempt, but it's unlikely), even if we
+	 * reclaimed something. If there are highatomic pageblocks, unreserve
+	 * some.
+	 * Convert them to unmovable ones as kswapd doesn't have a target
+	 * migratetype, and unmovable should minimize permanent fragmentation.
+	 */
+	if (sc.priority < 1 && has_highatomic) {
+		for (int i = 0; i <= highest_zoneidx; i++) {
+			struct zone *zone = pgdat->node_zones + i;
+
+			unreserve_highatomic_pageblock_zone(zone,
+					MIGRATE_UNMOVABLE, true);
+		}
+	}
+
 out:
 	clear_reclaim_active(pgdat, highest_zoneidx);
 

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261030-kswapd-highatomic-unreserve-7e6629ec65d0

