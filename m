Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F39432E64
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 08:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788252536; cv=none; b=eXWcNMjJLMijM6Qp0APPcfKZJnjeYSWxiOQ08/aZ4cNprf8VUkueg0cGhoWB7n6Wh5VelXTFZAFY2615cUkok+50HlGfKiszXQmW7vcruYC3GzFGVQZCl20pbmnkBLEqqSaD6w5wnNV2Mzv2T2O3eYX2d4iaPEsEm4IPyQn9TWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788252536; c=relaxed/simple;
	bh=eH4GftPimneHUdJhlkp4iP0hr0FLZ59+6jsWlKgpMf0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ev/rz3NqDJtxHtxFPudMDPssrvL9ocU3ess3tdFokYKRUTku5GqL8uPrGX+l51Y4XDxaOBhxQcvMfNUX0lNLG9wUJRgzHUUhv6MK2+wI7fOn7hmXgUiO4EX31S4QPWqpAWz6jttS2kTmwYg77/3bERhi9Y6r5Omc8Zz6zPbmhfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ftsIrc8H; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ftsIrc8H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=g1
	fgC7TS23+f8CRqs1a7s25sfFirY0QStyUqTz1H+C0=; b=ftsIrc8HTu58+vVJLu
	GrYYpgFjFmIUioXWc+BiBtFrOfSCZEVQP41v2zkDjYSxk5f3XGDNpc0/aqvENfZf
	A2Go9LeKDDFhSGx0yTa3k94I12lHeC8xrS5unKE8YRUEyB9GpCN6CN6xwBeCDM53
	9m6wce2j7vp3nibw3vMW16QP4=
Received: from hpc (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgC3qo4OkZZqHFWTNA--.28200S3;
	Tue, 01 Sep 2026 16:47:12 +0800 (CST)
From: john <love_goo@163.com>
To: akpm@linux-foundation.org,
	liuye@kylinos.cn,
	hannes@cmpxchg.org,
	mhocko@kernel.org,
	david@kernel.org,
	ljs@kernel.org,
	hughd@google.com,
	mgorman@techsingularity.net,
	yang@os.amperecomputing.com
Cc: zhangqiuhao@huawei.com,
	wangkefeng.wang@huawei.com,
	mawupeng1@huwei.com,
	love_goo@163.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Wupeng Ma <mawupeng1@huawei.com>
Subject: [PATCH resend 1/2] mm: vmscan: charge isolate overshoot against scan quota
Date: Tue,  1 Sep 2026 16:47:05 +0800
Message-ID: <20260901084706.3784449-2-love_goo@163.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901084706.3784449-1-love_goo@163.com>
References: <20260901084706.3784449-1-love_goo@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PCgvCgC3qo4OkZZqHFWTNA--.28200S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxCr15urW8AF1fJw1rZr1kZrb_yoW7Jw47pa
	9rG3y2vrWrJ390gryUZF4kCr4akFW3AFWUtFZFvF17ZF1fWFyfG347G39FgFWUu348ZFWS
	v39rKF97Wa1jq37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pihFx8UUUUU=
X-CM-SenderInfo: 5oryvsxjrrqiywtou0bp/xtbC6xCo4GqWkRA0gQAA37

From: Wupeng Ma <mawupeng1@huawei.com>

shrink_lruvec() charges the per-LRU budget nr[lru] in SWAP_CLUSTER_MAX
(32) chunks, but isolate_lru_folios() may scan far more per call: a
large folio can jump scan by many pages at once (a PMD-sized folio
counts 512), and a zone-ineligible LRU walks the whole list without
feeding scan back.  The overshoot is never refunded, so shrink_lruvec()
keeps charging only 32 per round and rescans the same folios.

Have isolate_lru_folios() record its scanned count in sc->nr_isolate_scanned
and let shrink_lruvec() subtract the overshoot from the remaining quota so
the next round skips already-scanned folios.  The field is reset to 0
before each shrink_list() call, as shrink_list() only reaches
isolate_lru_folios() on some paths (active + skipped_deactivate,
too_many_isolated stall bail out early); a stale value would otherwise
be charged.  The budget floor stays nr_to_scan via max() so an empty
LRU (sc->nr_isolate_scanned = 0) still advances and cannot deadlock.

Co-developed-by: Qiuhao Zhang <zhangqiuhao@huawei.com>
Signed-off-by: Qiuhao Zhang <zhangqiuhao@huawei.com>
Signed-off-by: Wupeng Ma <mawupeng1@huawei.com>
---
 mm/vmscan.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index f11491ee9ed5c..823af9e86efd3 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -166,6 +166,9 @@ struct scan_control {
 	/* Incremented by the number of inactive pages that were scanned */
 	unsigned long nr_scanned;
 
+	/* Number of pages that were scanned from isolate_lru_folios() */
+	unsigned long nr_isolate_scanned;
+
 	/* Number of pages freed so far during a call to shrink_zones() */
 	unsigned long nr_reclaimed;
 
@@ -1670,7 +1673,6 @@ static __always_inline void update_lru_sizes(struct lruvec *lruvec,
  * @nr_to_scan:	The number of eligible pages to look through on the list.
  * @lruvec:	The LRU vector to pull pages from.
  * @dst:	The temp list to put pages on to.
- * @nr_scanned:	The number of pages that were scanned.
  * @sc:		The scan_control struct for this reclaim session
  * @lru:	LRU list id for isolating
  *
@@ -1678,8 +1680,7 @@ static __always_inline void update_lru_sizes(struct lruvec *lruvec,
  */
 static unsigned long isolate_lru_folios(unsigned long nr_to_scan,
 		struct lruvec *lruvec, struct list_head *dst,
-		unsigned long *nr_scanned, struct scan_control *sc,
-		enum lru_list lru)
+		struct scan_control *sc, enum lru_list lru)
 {
 	struct list_head *src = &lruvec->lists[lru];
 	unsigned long nr_taken = 0;
@@ -1763,7 +1764,7 @@ static unsigned long isolate_lru_folios(unsigned long nr_to_scan,
 			skipped += nr_skipped[zid];
 		}
 	}
-	*nr_scanned = total_scan;
+	sc->nr_isolate_scanned = total_scan;
 	trace_mm_vmscan_lru_isolate(sc->reclaim_idx, sc->order, nr_to_scan,
 				    total_scan, skipped, nr_taken, lru);
 	update_lru_sizes(lruvec, lru, nr_zone_taken);
@@ -2011,8 +2012,8 @@ static unsigned long shrink_inactive_list(unsigned long nr_to_scan,
 
 	lruvec_lock_irq(lruvec);
 
-	nr_taken = isolate_lru_folios(nr_to_scan, lruvec, &folio_list,
-				     &nr_scanned, sc, lru);
+	nr_taken = isolate_lru_folios(nr_to_scan, lruvec, &folio_list, sc, lru);
+	nr_scanned = sc->nr_isolate_scanned;
 
 	__mod_node_page_state(pgdat, NR_ISOLATED_ANON + file, nr_taken);
 	item = PGSCAN_KSWAPD + reclaimer_offset(sc);
@@ -2068,7 +2069,6 @@ static void shrink_active_list(unsigned long nr_to_scan,
 			       enum lru_list lru)
 {
 	unsigned long nr_taken;
-	unsigned long nr_scanned;
 	vma_flags_t vma_flags;
 	LIST_HEAD(l_hold);	/* The folios which were snipped off */
 	LIST_HEAD(l_active);
@@ -2082,12 +2082,11 @@ static void shrink_active_list(unsigned long nr_to_scan,
 
 	lruvec_lock_irq(lruvec);
 
-	nr_taken = isolate_lru_folios(nr_to_scan, lruvec, &l_hold,
-				     &nr_scanned, sc, lru);
+	nr_taken = isolate_lru_folios(nr_to_scan, lruvec, &l_hold, sc, lru);
 
 	__mod_node_page_state(pgdat, NR_ISOLATED_ANON + file, nr_taken);
 
-	mod_lruvec_state(lruvec, PGREFILL, nr_scanned);
+	mod_lruvec_state(lruvec, PGREFILL, sc->nr_isolate_scanned);
 
 	lruvec_unlock_irq(lruvec);
 
@@ -6013,10 +6012,21 @@ static void shrink_lruvec(struct lruvec *lruvec, struct scan_control *sc)
 		for_each_evictable_lru(lru) {
 			if (nr[lru]) {
 				nr_to_scan = min(nr[lru], SWAP_CLUSTER_MAX);
-				nr[lru] -= nr_to_scan;
 
+				sc->nr_isolate_scanned = 0;
 				nr_reclaimed += shrink_list(lru, nr_to_scan,
 							    lruvec, sc);
+				/*
+				 * isolate_lru_folios() may scan far more
+				 * than nr_to_scan when the LRU holds
+				 * ineligible folios (zone-skip) or large
+				 * folios. Charge that overshoot against the
+				 * remaining quota (clamped by min() so it
+				 * cannot go negative) so the next iteration
+				 * does not rescan the same skipped folios.
+				 */
+				nr[lru] -= min(nr[lru],
+					       max(nr_to_scan, sc->nr_isolate_scanned));
 			}
 		}
 
-- 
2.53.0

