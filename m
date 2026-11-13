Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596169;
	b=YbhYbXPFc2ApFIWFFzzvMF9hrYfE2gOcX4FBMtCsak1r6A78Th9DP1Uy/S2PofVpB5mI
	 aqqgib4f9LTzkTH5m9Z1ndZvKDbW+/hTCtU1Zf3bzAUObSVlsv/OgSCoNIxiCTUIw98SA
	 qKcVsSWaxhxUIwnP5w4uxiV0x4YREHpyVNrDS2w9PaGcdj892MPzfBK+8Ef4Ov+kYMQg+
	 z7/rK2OGNFHHuKkPTeaWmQl2MdpKdhw2xIuuYEP7aByRI9LzgUUhWI/BGnMk6r2KKjLUy
	 NCQ1J5676kiOiSsDYUBkJvAmfbjkXBpCZ+4H39RxVqeIaI3wF3AGfFO/qdI7NpZbwDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596169;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=ab6jQE+uJD46Ll5FCTsmdW/Hp44XQBfAYxsnpCJz+D4=;
	b=Ups9R3yXicO2/I1ip1AlGiFlw2LddTauswaAaudAFm9tLjp7iUNRKGzijom0d5xYQNaj
	 jvxY0V4gDo+ZuXnjUo/580lQie0iRwGVO/pqlY6cQDHMB/92BU5OJ458m7m7sLcSaxwRs
	 GFErUspfBXGz9qv5P6idNQIMYCsvWd+DALTAB/J75ELZ1A2lu49kWgxkfh8pHGwIJCX6e
	 d6T7s83QdZRr5XP0pLbu02eGq+nRIcic7IWa2B4L3C1ayNJS/8XUdybpcoJZi7PTzO0LS
	 ZAqV+OWpeZ3i6vVqDAkkyeab82bUnYt6SY60uScFMfEujDrGYwTUwGpGLb/B4uVTo5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=are3EysM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775FD6071040
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=are3EysM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C47F1F000C6;
	Fri, 13 Nov 2026 18:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794596169;
	bh=ab6jQE+uJD46Ll5FCTsmdW/Hp44XQBfAYxsnpCJz+D4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=are3EysM1jA1csE0F2A4zqg4HWywNrj29LCGP/RVLXJtm8cr4O2xBP6WHjffQBzrT
	 LPZFO9rKE7/kJTAHQtCfvPSxT+ioFVXdt8U5SaBx1Jp76hZWHSZlka5llH7LcFpnSS
	 QIEeyqItCGRqteyEPa5MWsSakzBvkXTATk+yU9c7j75xwkZjNgQ+MSIOOPGNYNqgNl
	 sdHW+anINi+EiqoIzTKJnRuIBQbKZbS1xhF6KGS35IpTiv9K9L6NVGwbpfMXi4sH6r
	 3qATtXCewl3sNMf2ZI6ra+O3JlPziRH8Tbk/TI7Fe+7a+LHertNw7jEV0YLNv+ohQQ
	 qrh/MrXqdZubw==
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
Subject: [PATCH v8 04/16] mm/mglru: lift the forced protection of reclaimer
Date: Sat, 14 Nov 2026 02:55:29 +0800
Message-Id: <20261113185541.70203-5-baohua@kernel.org>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261113185541.70203-1-baohua@kernel.org>
References: <20261113185541.70203-1-baohua@kernel.org>
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

When a type is drained down to MIN_NR_GENS gens, the reclaimer will
fail to make any progress on that type without aging.

However aging comes with a cost, and it will take time to finish. Even
if we do aging more proactively, when under great pressure, gens will
still be drained very fast so the new gens produced by aging can't catch
up with the consumption. With MIN_NR_GENS setting blocking the reclaim,
we will run into OOM. This OOM can be reproduced by the previous test
program [1] used for fixing another aging problem [2]. When running in
great pressure, certain workloads will keep seeing premature OOM with
MGLRU, and never see any OOM with classical LRU.

This might get worse if we implement async aging, or avoid hotness
inversion in aging, as they will slow down the aging process even more.

To fix this, let's first drop the get_nr_gens() == MIN_NR_GENS early
return and let the raised-priority scan bound cover max_seq itself.

Mapped folios will still survive as the rmap PTE check will keep them.
Unmapped cache folios may thrashing more when under great pressure,
which is really a problem that should be fixed with refault distance
and frequecy aware promotoin instead [3].

Link: https://github.com/ryncsn/emm-test-project/tree/master/file-anon-mix-pressure [1]
Link: https://lore.kernel.org/linux-mm/20260428-mglru-reclaim-v7-0-02fabb92dc43@tencent.com/ [2]
Link: https://lore.kernel.org/linux-mm/20260502-mglru-fg-v1-0-913619b014d9@tencent.com/ [3]
Signed-off-by: Kairui Song <kasong@tencent.com>
Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 mm/vmscan.c | 34 +++++++++++++++++++++++++---------
 1 file changed, 25 insertions(+), 9 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 6006508250c5..0e8b3161f8f5 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4677,7 +4677,7 @@ void lru_gen_reparent_memcg(struct mem_cgroup *memcg, struct mem_cgroup *parent,
  ******************************************************************************/
 
 static bool sort_folio(struct lruvec *lruvec, struct folio *folio, struct scan_control *sc,
-		       int min_gen, int tier_idx)
+		       int min_gen, int max_gen, int tier_idx)
 {
 	int gen = folio_lru_gen(folio);
 	int type = folio_is_file_lru(folio);
@@ -4694,12 +4694,22 @@ static bool sort_folio(struct lruvec *lruvec, struct folio *folio, struct scan_c
 	if (!folio_evictable(folio))
 		return false;
 
-	/* promoted */
+	/* promoted, or moved due to reparenting. */
 	if (gen != min_gen) {
 		list_move(&folio->lru, &lrugen->folios[gen][type][zone]);
 		return true;
 	}
 
+	/*
+	 * We are reclaiming the last gen left. Folios in this gen can no
+	 * longer be promoted or protected, so just isolate them. The one
+	 * exception is lru_gen_reparent_memcg(), which is handled above.
+	 */
+	if (min_gen == max_gen) {
+		VM_WARN_ON_ONCE(zone > sc->reclaim_idx);
+		return false;
+	}
+
 	/* protected */
 	if (tier > tier_idx || refs + workingset == BIT(LRU_REFS_WIDTH) + 1) {
 		gen = folio_inc_gen(lruvec, folio, min_gen);
@@ -4754,15 +4764,16 @@ static int scan_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
 		       struct list_head *list, int *isolatedp)
 {
 	int i;
-	int gen;
 	enum node_stat_item item;
 	int sorted = 0;
 	int scanned = 0;
 	int isolated = 0;
 	int skipped = 0;
+	int gen, max_gen;
 	unsigned long min_seq;
 	unsigned long remaining = nr_to_scan;
 	struct lru_gen_folio *lrugen = &lruvec->lrugen;
+	DEFINE_MAX_SEQ(lruvec);
 
 	VM_WARN_ON_ONCE(nr_to_scan > MAX_LRU_BATCH);
 	VM_WARN_ON_ONCE(!list_empty(list));
@@ -4775,18 +4786,24 @@ static int scan_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
 	if (sc->priority == DEF_PRIORITY)
 		min_seq = lrugen->min_seq[type];
 	else
-		min_seq = lruvec_populated_min_seq(lruvec, type, lrugen->max_seq - MIN_NR_GENS + 1);
-
-	if (get_nr_gens(lruvec, type) == MIN_NR_GENS)
-		return 0;
+		min_seq = lruvec_populated_min_seq(lruvec, type, lrugen->max_seq);
 
 	gen = lru_gen_from_seq(min_seq);
+	max_gen = lru_gen_from_seq(max_seq);
+
 	for (i = MAX_NR_ZONES; i > 0; i--) {
 		LIST_HEAD(moved);
 		int skipped_zone = 0;
 		int zone = (sc->reclaim_idx + i) % MAX_NR_ZONES;
 		struct list_head *head = &lrugen->folios[gen][type][zone];
 
+		/*
+		 * If there is only one gen left, rotating the unreclaimable
+		 * zone become meaningless, just skip them.
+		 */
+		if (gen == max_gen && zone > sc->reclaim_idx)
+			continue;
+
 		while (!list_empty(head)) {
 			struct folio *folio = lru_to_folio(head);
 			int delta = folio_nr_pages(folio);
@@ -4797,8 +4814,7 @@ static int scan_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
 			VM_WARN_ON_ONCE_FOLIO(folio_zonenum(folio) != zone, folio);
 
 			scanned += delta;
-
-			if (sort_folio(lruvec, folio, sc, gen, tier))
+			if (sort_folio(lruvec, folio, sc, gen, max_gen, tier))
 				sorted += delta;
 			else if (isolate_folio(lruvec, folio, sc)) {
 				list_add(&folio->lru, list);
-- 
2.39.3 (Apple Git-146)

