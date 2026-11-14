Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794686908;
	b=OSWMibMMHWJQOj6+uxMen59Yh/XbNFmi3//IyW9BHQ1kYiUSo/pq4wTOlSdXHLKwz+0k
	 ZAlpXzKTsCsKIUrrD3mKqCmhPdk0ERkbtuQLgom9uviOPi31o23M17fgECyXlVuj5g6S/
	 zTlMuzJLrAMGMnN7kB/H0He9CxA0+PaUicfO3cHt5mCtq/JZrULub0exE+vBZ5t5jNhs7
	 vDNPfJcuuqq7PHVqvtqV0kBAAjYQSVjevmDloZDkJfVmitbq+HTiJt9bUe11p/8uQI4pd
	 M2hzj7wp4a242ds5k66Jaw/Ggx+ogVFN3lo4xM9hXb+JENz4YUsDVvIbXdavLRi4qOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794686908;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=HXoUqML7mEBlG9YfP/qGkHleFIA4Us/MYTiwOeE/Oqg=;
	b=xQs9EdDHQZla97wa7kh+ShGJOAHnZYj9LS5xt6c8GUcBn6j0aUZy5FdJldBSWw+21pvt
	 A+c2aWR2u25nSbLSf7QvZBiFjJo9ffIum2W7F6VzhdX6hjQPMnxhITMeBjknh/XKGDQba
	 5IHAZamxo98/QDnduaFojTImB09SlE6p7L2KgTytZPx3EJk8iQPgesZuF7uNBBhONhZEl
	 2naHeA/SfxW1nObX6VGNrJblvp67F/JF5BA0U038ajLVsE6H/iXZRuYGhzSrMrJh8X+17
	 0ZeC0DLBU15hAEk798V3CKRbtt6hcmyvqutVaGaqc9HLJHNOAYbR/+b2duxwBRWs54A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WMu7WC2n;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C101B606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 20:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WMu7WC2n
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7DDA1F000C5;
	Sat, 14 Nov 2026 20:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794686908;
	bh=HXoUqML7mEBlG9YfP/qGkHleFIA4Us/MYTiwOeE/Oqg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WMu7WC2nE1B7J0kUwsQtpGJEhWVCljh4nyn7guibBdUhLkM2/ww2nJYdBOh9XnumC
	 pZi/DZFNSumCTJrQAQWwe+KBpuJ43UMKPCE4HWujsGhRjG6xCY7wyCdY6lqEOdcOkY
	 pMsv6Ivler1iNEuejYw4VkaXHxSI5cQC+P5VzCIj/AoM6WIA3BunaQJOP2EwGvnCUD
	 D6Wt3ds4MDKp5YubOz+aP55/06NewqdFBhxajqmtHQtgD93uEZBZi29lI/vVM978gD
	 3XiIDAjeywqSbIQifYoYUxRrZLDssjSG8mt/zSsxI16YgPC5bR0m+fgqzPSm90D4Kv
	 ITHe8ntQcTa2Q==
From: "Barry Song (Xiaomi)" <baohua@kernel.org>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: axelrasmussen@google.com,
	baolin.wang@linux.alibaba.com,
	baoquan.he@linux.dev,
	hannes@cmpxchg.org,
	hui.zhu@linux.dev,
	kasong@tencent.com,
	kunwu.chan@gmail.com,
	liam@infradead.org,
	lianux.mm@gmail.com,
	linux-kernel@vger.kernel.org,
	liuxiang.277@bytedance.com,
	lyugaofei@xiaomi.com,
	mhocko@kernel.org,
	mhocko@suse.com,
	qi.zheng@linux.dev,
	ridong.chen@linux.dev,
	rppt@kernel.org,
	ryncsn@gmail.com,
	shakeel.butt@linux.dev,
	surenb@google.com,
	wangzicheng@honor.com,
	weixugc@google.com,
	yuanchu@google.com,
	zhangbo56@xiaomi.com,
	zhuhui@kylinos.cn,
	sidchintamaneni@gmail.com,
	Barry Song <baohua@kernel.org>
Subject: [PATCH v9 03/16] mm/mglru: reclaim from the oldest populated gen
Date: Sun, 15 Nov 2026 04:07:50 +0800
Message-Id: <20261114200803.23129-4-baohua@kernel.org>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261114200803.23129-1-baohua@kernel.org>
References: <20261114200803.23129-1-baohua@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kairui Song <kasong@tencent.com>

Currently MGLRU tries to keep the gen numbers of the two types in sync,
avoiding reducing the gen number of one type when the other type has
more gens, as described in the comment in try_to_inc_min_seq().

This makes scan_folios() stuck reclaiming the type with fewer gens: it
always scanned the oldest gen of the type, even when that gen was
empty, so reclaim made no progress on that type unless forced aging
created a new gen and eliminated the dead empty gen.

There are other approaches, like lifting the gen number
synchronization [1]. However, that would break the gen layout used by
lru_gen_folio_seq(): newly added folios would no longer have a
well-defined hotness according to their gen number, which reduces
accuracy. It is also not pressure-aware, since with gentle reclaim we
still want to respect the gen layout (hotness).

Instead, reclaim from whichever populated oldest gen is left, but only
when the default reclaim priority can't satisfy the reclaimer's
requirement. This is typical for swappiness limitations: e.g., low
swappiness asks the reclaimer to reclaim from file, but file gens are
drained, so the reclaim cycle fails and priority is raised.

At the default priority the scan quota is 1/4096 of the evictable
size, and the old behavior is kept there to respect the hotness
distribution. Once priority is raised, the quota is at least 1/2048,
so the hotness bias introduced by reclaiming from a younger gen is
bounded by that quota, which seems fair. Global reclaim for MGLRU may
start with DEF_PRIORITY / 2 (1/64); the ratio is still reasonable at
that point, and when global pressure is more critical, we should
reclaim harder.

Note that scan_folios() still refuses to reclaim a type left with only
MIN_NR_GENS gens, so a completely drained type still requires aging.
This change only avoids scanning empty gens when populated reclaimable
gens remain.

Link: https://lore.kernel.org/linux-mm/20260726122123.7614-4-baohua@kernel.org/ [1]
Signed-off-by: Kairui Song <kasong@tencent.com>
Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>
Signed-off-by: Barry Song <baohua@kernel.org>
---
 mm/vmscan.c | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index ae3e13b1fb27..1197e15065fe 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -3312,11 +3312,9 @@ static int __folio_inc_gen(struct folio *folio, int old_gen, bool *increased)
 }
 
 /* protect pages accessed multiple times through file descriptors */
-static int folio_inc_gen(struct lruvec *lruvec, struct folio *folio)
+static int folio_inc_gen(struct lruvec *lruvec, struct folio *folio, int old_gen)
 {
-	int type = folio_is_file_lru(folio);
-	struct lru_gen_folio *lrugen = &lruvec->lrugen;
-	int new_gen, old_gen = lru_gen_from_seq(lrugen->min_seq[type]);
+	int new_gen;
 	bool gen_increased;
 
 	new_gen = __folio_inc_gen(folio, old_gen, &gen_increased);
@@ -4679,7 +4677,7 @@ void lru_gen_reparent_memcg(struct mem_cgroup *memcg, struct mem_cgroup *parent,
  ******************************************************************************/
 
 static bool sort_folio(struct lruvec *lruvec, struct folio *folio, struct scan_control *sc,
-		       int tier_idx)
+		       int min_gen, int tier_idx)
 {
 	int gen = folio_lru_gen(folio);
 	int type = folio_is_file_lru(folio);
@@ -4697,14 +4695,14 @@ static bool sort_folio(struct lruvec *lruvec, struct folio *folio, struct scan_c
 		return false;
 
 	/* promoted */
-	if (gen != lru_gen_from_seq(lrugen->min_seq[type])) {
+	if (gen != min_gen) {
 		list_move(&folio->lru, &lrugen->folios[gen][type][zone]);
 		return true;
 	}
 
 	/* protected */
 	if (tier > tier_idx || refs + workingset == BIT(LRU_REFS_WIDTH) + 1) {
-		gen = folio_inc_gen(lruvec, folio);
+		gen = folio_inc_gen(lruvec, folio, min_gen);
 		list_move(&folio->lru, &lrugen->folios[gen][type][zone]);
 
 		/* don't count the workingset being lazily promoted */
@@ -4719,7 +4717,7 @@ static bool sort_folio(struct lruvec *lruvec, struct folio *folio, struct scan_c
 
 	/* ineligible */
 	if (zone > sc->reclaim_idx) {
-		gen = folio_inc_gen(lruvec, folio);
+		gen = folio_inc_gen(lruvec, folio, min_gen);
 		list_move_tail(&folio->lru, &lrugen->folios[gen][type][zone]);
 		return true;
 	}
@@ -4762,17 +4760,27 @@ static int scan_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
 	int scanned = 0;
 	int isolated = 0;
 	int skipped = 0;
+	unsigned long min_seq;
 	unsigned long remaining = nr_to_scan;
 	struct lru_gen_folio *lrugen = &lruvec->lrugen;
 
 	VM_WARN_ON_ONCE(nr_to_scan > MAX_LRU_BATCH);
 	VM_WARN_ON_ONCE(!list_empty(list));
 
+	/*
+	 * Respect the gen hotness distribution at low priority to avoid
+	 * aging and scan cost, but prefer to satisfy the reclaimers request
+	 * when under pressure to respect swappiness more and reduce IO cost.
+	 */
+	if (sc->priority == DEF_PRIORITY)
+		min_seq = lrugen->min_seq[type];
+	else
+		min_seq = lruvec_populated_min_seq(lruvec, type, lrugen->max_seq - MIN_NR_GENS + 1);
+
 	if (get_nr_gens(lruvec, type) == MIN_NR_GENS)
 		return 0;
 
-	gen = lru_gen_from_seq(lrugen->min_seq[type]);
-
+	gen = lru_gen_from_seq(min_seq);
 	for (i = MAX_NR_ZONES; i > 0; i--) {
 		LIST_HEAD(moved);
 		int skipped_zone = 0;
@@ -4790,7 +4798,7 @@ static int scan_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
 
 			scanned += delta;
 
-			if (sort_folio(lruvec, folio, sc, tier))
+			if (sort_folio(lruvec, folio, sc, gen, tier))
 				sorted += delta;
 			else if (isolate_folio(lruvec, folio, sc)) {
 				list_add(&folio->lru, list);
-- 
2.39.3 (Apple Git-146)

