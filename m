Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792706554;
	b=EfrzD/4eq5LOxQhHCrRSkH6VFnoh0h48b+j0FT99/fLn9hM7eINHUE6XS4DZCbUvuf+b
	 4YSWuFnlKSI/hrWL4nFigFaPcvLQlm2cwk4NYpEAZ4+aD1Ur8w3v/JHUTxKcdWEamzoUs
	 YROqvRG1S/STxFEjdT7PD1QbC+wY2AV6jm0shMt861KNDhOgXfqDVPCr6mNA6E/8aHkoC
	 X+UtQn5Ac22zIoknmhA+F30L3pcyVDwhRaDgRgxa59EHzi12o0GBSNcLCGo88LrsRVYBi
	 Tw6g9rulnxwnQM/4jUbC955a6VA2VGwHwjVQGQBvxuJlCKhpOeZenEbcPYeEVH/G4/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792706554;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=MgkFapEPLD9roD9P/vcmIEGrXkWeL1ACQEKipCA2Y9A=;
	b=1c5qZPhR6r6O3is9efWaj4QVYQZra9/d9qNOIOSEgQK++Teo+jk8hgfnAa7kPI1y5t2k
	 3Uxm3gX46w4jIYgkcw8q6MxYVQexeKvscDMU1t6acYlKl8SZqE6i1UKe8vytz9oXPC+SL
	 pLtTj+Ia2bTXX2KxUc5/e42Jrx3NY9zvQ1wJXlJxRi+YpLniDLy+tHoxyOiUtSISSgyGd
	 F5vodDLQjapnHsbM37S8Kc9KefcfMuOaXW9b+6mkj9DAAKQx9dl3IvhwjKNwSxpTvsx1v
	 tUZCO9ACAQwOiEGsi/XdIY1XcwvMZXJFGYcquZj1KXUdS+xSz4zgmt7I8qaOh686Hqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OJ3zIY6W;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AECA606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 22:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OJ3zIY6W
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DABB61F031E0;
	Thu, 22 Oct 2026 22:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792706553;
	bh=MgkFapEPLD9roD9P/vcmIEGrXkWeL1ACQEKipCA2Y9A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OJ3zIY6Wjh3VYB+tgueOZ6vDCEvwe+ck5yzv/T+zwiDUQUo9drDt1ha4p+5UOlitv
	 xNOQMIdX0n/aKPcaLFEHsGBR6SvrTXmwiZjq6JSrwDc7dHiEhcLRNQYpdk42LDJ5jn
	 OrWfAKFDkhfSjZb+HQl1hxnFD9+GJ/BiofDiuI3rwP2wrKV6lsou9hqVXG+iZJgxYc
	 PI3DrexfD3NjLP28hIENJRuDI5+ji2RoQRedUSs4EyH+frIJjoG5+QNuFmLHS4FESK
	 DdFJHXtpFXMC1xUm7NNoj38MdXmlEQN/VV7bZgU0645Wbf7+Vi/jXYCKNz3eWRULdR
	 XMF6hWvERkCqQ==
From: "Barry Song (Xiaomi)" <baohua@kernel.org>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: hui.zhu@linux.dev,
	axelrasmussen@google.com,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
	david@kernel.org,
	hannes@cmpxchg.org,
	linux-kernel@vger.kernel.org,
	ljs@kernel.org,
	mhocko@kernel.org,
	qi.zheng@linux.dev,
	ryncsn@gmail.com,
	shakeel.butt@linux.dev,
	weixugc@google.com,
	yuanchu@google.com,
	zhuhui@kylinos.cn,
	baoquan.he@linux.dev,
	liuxiang.277@bytedance.com,
	wangzicheng@honor.com,
	lianux.mm@gmail.com,
	kasong@tencent.com,
	liam@infradead.org,
	surenb@google.com,
	mhocko@suse.com,
	rppt@kernel.org,
	zhangbo56@xiaomi.com,
	lyugaofei@xiaomi.com,
	ridong.chen@linux.dev,
	kunwu.chan@gmail.com
Subject: [RFC PATCH v5 04/14] mm/mglru: lift the forced protection of reclaimer
Date: Fri, 23 Oct 2026 06:01:53 +0800
Message-Id: <20261022220203.91911-5-baohua@kernel.org>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261022220203.91911-1-baohua@kernel.org>
References: <20261022220203.91911-1-baohua@kernel.org>
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
---
 mm/vmscan.c | 34 +++++++++++++++++++++++++---------
 1 file changed, 25 insertions(+), 9 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index d7eb15533de1..2cccaa5dd4e7 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4834,7 +4834,7 @@ void lru_gen_reparent_memcg(struct mem_cgroup *memcg, struct mem_cgroup *parent,
  ******************************************************************************/
 
 static bool sort_folio(struct lruvec *lruvec, struct folio *folio, struct scan_control *sc,
-		       int min_gen, int tier_idx)
+		       int min_gen, int max_gen, int tier_idx)
 {
 	int gen = folio_lru_gen(folio);
 	int type = folio_is_file_lru(folio);
@@ -4851,12 +4851,22 @@ static bool sort_folio(struct lruvec *lruvec, struct folio *folio, struct scan_c
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
@@ -4911,15 +4921,16 @@ static int scan_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
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
@@ -4932,18 +4943,24 @@ static int scan_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
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
@@ -4954,8 +4971,7 @@ static int scan_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
 			VM_WARN_ON_ONCE_FOLIO(folio_zonenum(folio) != zone, folio);
 
 			scanned += delta;
-
-			if (sort_folio(lruvec, folio, sc, gen, tier))
+			if (sort_folio(lruvec, folio, sc, gen, max_gen, tier))
 				sorted += delta;
 			else if (isolate_folio(lruvec, folio, sc)) {
 				list_add(&folio->lru, list);
-- 
2.34.1

