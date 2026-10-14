Received: from mta1.migadu.com (out-203.mta1.migadu.com [95.215.58.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCADF4B26F8
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791968480; cv=none; b=LDICKs+2gfGsmUa8bLPTqq4/d48ZY74hIHzBiti8TQegmJwUJHIdwnBkfUE2n8fiCY6YgTR4fI+qazA/9+vijXlYnSfaim958kjhwDJZmReZ/UbcbG3xSCr/CDsWw+3+ULHNs4szBHnwW70yI5K+OJh085tEqPqcPv2GfDcnlH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791968480; c=relaxed/simple;
	bh=3zJjm6DiujVRRMFJWBEXTYsYUWwxY7lpqrEEqgi3VfI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jUDEUdWVH15R50oF5VpBuDiNGoeKNGHVfp+1gxTFgIJv8vA/FYqVZ+xxJ+UZ4meDWobSyBClSYA2DblSveR5mrPbViMb0Ry/2yfCkbsGtt8wwOeJ6xmgpyDMe/KZ8ySeCZZYKK5R+o5Cx84sAsb1OvU75QwHpxyLY8VQev5Fdf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=n9Zi1TdJ; arc=none smtp.client-ip=95.215.58.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="n9Zi1TdJ"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=3zJjm6DiujVRRMFJWBEXTYsYUWwxY7lpqrEEqgi3VfI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791968475; v=1; x=1792573275;
 b=n9Zi1TdJT42pITaZqc9CCPRDkoCAwu5JB+vUWldT2AVxfrZAj7gXMx6zZi8MLuzAoIqUIIqu
 dsTU9/WTYEC3qwHEVv+/epjf40mWTZZL/CNn4Dhlq7B8jOT/ZvQ2unKya/6r8mVpkRX3Ztntzs5
 3f51CGAXeOb8oJtYaAI4gRV4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id a323c927ff3d4d89;
	Wed, 14 Oct 2026 09:01:15 +0000
X-Mizu-Trace-ID: a323c927ff3d4d89
X-Migadu-Flow: FLOW_OUT
From: Hui Zhu <hui.zhu@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	Kairui Song <kasong@tencent.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Wei Xu <weixugc@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	David Hildenbrand <david@kernel.org>,
	Michal Hocko <mhocko@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: Hui Zhu <zhuhui@kylinos.cn>
Subject: [PATCH v6 2/2] mm/vmscan: throttle MGLRU eviction when isolated folios pile up
Date: Wed, 14 Oct 2026 17:00:24 +0800
Message-ID: <2a5d323c1caede0f2e2d2016b99893abe656d372.1791968227.git.zhuhui@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791968227.git.zhuhui@kylinos.cn>
References: <cover.1791968227.git.zhuhui@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hui Zhu <zhuhui@kylinos.cn>

The legacy path throttles direct reclaim via too_many_isolated() when
isolated folios pile up, but MGLRU's evict_folios() isolates folios
without this check, which can lead to unnecessary swapping, thrashing
and OOM.

Add lru_gen_too_many_isolated() and throttle_evictable_types(), called
from evict_folios() before the lruvec lock is taken since throttling
sleeps.

The check is per lruvec rather than node-wide: reclaimers contend per
lruvec, and a node-wide check would let isolation in one memcg throttle
reclaim in another. The threshold is the evictable size of the type
divided by MIN_NR_GENS, approximating one generation.

Since isolate_folios() picks the type from refault feedback and may fall
back to the other one, throttle_evictable_types() collects the types
that are not over-isolated and have evictable folios, and sleeps only
when all of them are over-isolated. The mask is passed to
isolate_folios() to restrict its choice and fallback, so an
over-isolated type never blocks the other, and isolation never lands on
a throttled or empty type.

Like the legacy path, kswapd and !writeback_throttling_sane() reclaim
are exempt, the threshold is raised for GFP_NOIO/GFP_NOFS callers, and
a dying task fakes progress to exit reclaim quickly.

Tested with threads write-touching a 48MB anonymous working set in a
16MB memcg backed by swap delayed 50ms via dm-delay. With 192 threads
the task is OOM-killed without this patch and survives with it. With
64 threads both kernels survive the 60s run, and the patched kernel
completes ~22% more touches (301B vs 246B).

Signed-off-by: Hui Zhu <zhuhui@kylinos.cn>
---
 include/linux/mmzone.h |   2 +
 mm/vmscan.c            | 171 +++++++++++++++++++++++++++++++++++++----
 2 files changed, 159 insertions(+), 14 deletions(-)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index c070b867e2f3..e8fc002c98c0 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -583,6 +583,8 @@ struct lru_gen_folio {
 	/* can be modified without holding the LRU lock */
 	atomic_long_t evicted[NR_HIST_GENS][ANON_AND_FILE][MAX_NR_TIERS];
 	atomic_long_t refaulted[NR_HIST_GENS][ANON_AND_FILE][MAX_NR_TIERS];
+	/* the number of folios isolated from this lruvec and being reclaimed */
+	atomic_long_t nr_isolated[ANON_AND_FILE];
 	/* whether the multi-gen LRU is enabled */
 	bool enabled;
 	/* the memcg generation this lru_gen_folio belongs to */
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 3bd604204ec7..2d551a1f91c7 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4232,25 +4232,34 @@ static void set_initial_priority(struct pglist_data *pgdat, struct scan_control
 	sc->priority = clamp(priority, DEF_PRIORITY / 2, DEF_PRIORITY);
 }
 
-static unsigned long lruvec_evictable_size(struct lruvec *lruvec, int swappiness)
+static unsigned long lruvec_type_evictable_size(struct lruvec *lruvec, int type)
 {
-	int gen, type, zone;
+	int gen, zone;
 	unsigned long seq, total = 0;
 	struct lru_gen_folio *lrugen = &lruvec->lrugen;
 	DEFINE_MAX_SEQ(lruvec);
 	DEFINE_MIN_SEQ(lruvec);
 
-	for_each_evictable_type(type, swappiness) {
-		for (seq = min_seq[type]; seq <= max_seq; seq++) {
-			gen = lru_gen_from_seq(seq);
-			for (zone = 0; zone < MAX_NR_ZONES; zone++)
-				total += max(READ_ONCE(lrugen->nr_pages[gen][type][zone]), 0L);
-		}
+	for (seq = min_seq[type]; seq <= max_seq; seq++) {
+		gen = lru_gen_from_seq(seq);
+		for (zone = 0; zone < MAX_NR_ZONES; zone++)
+			total += max(READ_ONCE(lrugen->nr_pages[gen][type][zone]), 0L);
 	}
 
 	return total;
 }
 
+static unsigned long lruvec_evictable_size(struct lruvec *lruvec, int swappiness)
+{
+	unsigned long total = 0;
+	int type;
+
+	for_each_evictable_type(type, swappiness)
+		total += lruvec_type_evictable_size(lruvec, type);
+
+	return total;
+}
+
 static bool lruvec_is_sizable(struct lruvec *lruvec, struct scan_control *sc)
 {
 	unsigned long total;
@@ -4913,16 +4922,129 @@ static inline bool is_single_type_reclaim(int swappiness)
 	       swappiness == SWAPPINESS_ANON_ONLY;
 }
 
+/*
+ * The MGLRU counterpart to too_many_isolated().
+ *
+ * too_many_isolated() compares node-wide isolated counts against
+ * node-wide inactive sizes. It predates per-memcg LRU lists, which
+ * moved isolation to per-lruvec granularity. MGLRU reclaimers contend
+ * per lruvec, so this check is per lruvec as well, and isolation in
+ * one memcg does not throttle reclaim in another.
+ *
+ * The legacy threshold, the size of the inactive list, is not usable
+ * here either: in MGLRU the inactive counters are only a compatibility
+ * shim - they jump around when swap runs out or a memcg hits its swap
+ * limit, and proactive aging can inflate them. Compare against the
+ * total number of evictable pages of the type divided by MIN_NR_GENS,
+ * approximating the size of one generation - the same unit the
+ * original MGLRU aging heuristics used.
+ */
+static bool lru_gen_too_many_isolated(struct lruvec *lruvec, int type,
+				      struct scan_control *sc)
+{
+	unsigned long isolated, evictable;
+
+	if (current_is_kswapd())
+		return false;
+
+	if (!writeback_throttling_sane(sc))
+		return false;
+
+	isolated = atomic_long_read(&lruvec->lrugen.nr_isolated[type]);
+	evictable = lruvec_type_evictable_size(lruvec, type);
+
+	/*
+	 * GFP_NOIO/GFP_NOFS callers are allowed to isolate more pages, so
+	 * they won't be blocked by normal direct-reclaimers, forming a
+	 * circular deadlock.
+	 */
+	if (gfp_has_io_fs(sc->gfp_mask))
+		evictable >>= 3;
+
+	return isolated > evictable / MIN_NR_GENS;
+}
+
+/*
+ * Unlike the legacy path, where the LRU list to isolate from is known
+ * before isolation, isolate_folios() picks the type from the refault
+ * feedback and may fall back to the other one. Therefore, instead of
+ * throttling on a single type, collect the evictable types that do not
+ * have too many isolated folios, and only sleep when all of them do.
+ *
+ * Returns the mask of the types isolate_folios() may isolate from, or
+ * 0 if reclaim should stop. Also sets @fatal to tell the caller that
+ * the task received a fatal signal while waiting.
+ */
+static unsigned int throttle_evictable_types(struct lruvec *lruvec,
+					     int swappiness,
+					     struct scan_control *sc,
+					     bool *fatal)
+{
+	unsigned int allowed;
+	bool stalled = false;
+	struct pglist_data *pgdat = lruvec_pgdat(lruvec);
+	int i;
+
+	*fatal = false;
+
+	for (;;) {
+		allowed = 0;
+		for_each_evictable_type(i, swappiness) {
+			/*
+			 * A type with no evictable folios has nothing to
+			 * isolate. Don't allow it, otherwise reclaim can be
+			 * redirected to it and spin making no progress, e.g.
+			 * when the only type with folios is over-isolated.
+			 */
+			if (!lruvec_type_evictable_size(lruvec, i))
+				continue;
+
+			if (!lru_gen_too_many_isolated(lruvec, i, sc))
+				allowed |= BIT(i);
+		}
+
+		if (allowed) {
+			/* Wake up reclaimers waiting on the isolation to go down. */
+			wake_throttle_isolated(pgdat);
+			return allowed;
+		}
+
+		/*
+		 * All evictable types are over-isolated. Like the legacy
+		 * path, wait once for concurrent reclaimers to put their
+		 * isolated folios back; give up if that makes no progress.
+		 */
+		if (stalled)
+			return 0;
+
+		stalled = true;
+		reclaim_throttle(pgdat, VMSCAN_THROTTLE_ISOLATED);
+
+		/* We are about to die and free our memory. Return now. */
+		if (fatal_signal_pending(current)) {
+			*fatal = true;
+			return 0;
+		}
+	}
+}
+
 static int isolate_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
 			  struct scan_control *sc, int swappiness,
-			  struct list_head *list, int *isolated,
-			  int *isolate_type, int *isolate_scanned)
+			  unsigned int allowed, struct list_head *list,
+			  int *isolated, int *isolate_type, int *isolate_scanned)
 {
 	bool type_fallback_allowed = !is_single_type_reclaim(swappiness);
 	int type = get_type_to_scan(lruvec, swappiness);
 	int total_scanned = 0, scanned, tier;
 	bool tried = false;
 
+	/*
+	 * The preferred type may have been excluded by
+	 * throttle_evictable_types(); start from the other one.
+	 */
+	if (!(allowed & BIT(type)))
+		type = !type;
+
 retry:
 	tier = get_tier_idx(lruvec, type);
 	scanned = scan_folios(nr_to_scan, lruvec, sc,
@@ -4937,9 +5059,11 @@ static int isolate_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
 
 	/*
 	 * We are running out of the current reclaim type. Fall back to
-	 * the other type if allowed.
+	 * the other type if allowed. Only fall back to a type that is
+	 * not throttled.
 	 */
-	if (!scanned && !tried && type_fallback_allowed) {
+	if (!scanned && !tried && type_fallback_allowed &&
+	    (allowed & BIT(!type))) {
 		type = !type;
 		tried = true;
 		type_fallback_allowed = false;
@@ -4973,18 +5097,36 @@ static int evict_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
 	bool skip_retry = false;
 	struct mem_cgroup *memcg = lruvec_memcg(lruvec);
 	struct pglist_data *pgdat = lruvec_pgdat(lruvec);
+	unsigned int allowed;
+	bool fatal;
+
+	allowed = throttle_evictable_types(lruvec, swappiness, sc, &fatal);
+	if (!allowed) {
+		/*
+		 * We are about to die and free our memory. Like the legacy
+		 * path, pretend some pages were reclaimed so reclaim
+		 * unwinds quickly instead of looping back into the
+		 * throttle.
+		 */
+		if (fatal)
+			sc->nr_reclaimed += SWAP_CLUSTER_MAX;
+
+		return 0;
+	}
 
 	lruvec_lock_irq(lruvec);
 
 	/* In case folio deletion left empty old gens, flush them */
 	try_to_inc_min_seq(lruvec, swappiness);
 
-	scanned = isolate_folios(nr_to_scan, lruvec, sc, swappiness,
+	scanned = isolate_folios(nr_to_scan, lruvec, sc, swappiness, allowed,
 				 &list, &isolated, &type, &type_scanned);
 	nr_isolated = isolated;
-	if (nr_isolated)
+	if (nr_isolated) {
 		__mod_node_page_state(pgdat, NR_ISOLATED_ANON + type,
 				      nr_isolated);
+		atomic_long_add(nr_isolated, &lruvec->lrugen.nr_isolated[type]);
+	}
 
 	/* Scanning may have emptied the oldest gen, flush it */
 	if (scanned)
@@ -5047,6 +5189,7 @@ static int evict_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
 		goto retry;
 	}
 
+	atomic_long_sub(nr_isolated, &lruvec->lrugen.nr_isolated[type]);
 	mod_node_page_state(pgdat, NR_ISOLATED_ANON + type, -nr_isolated);
 
 	if (nr_isolated > total_reclaimed)
-- 
2.43.0

