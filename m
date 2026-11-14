Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794686976;
	b=XAbG5gJIcUoUZ4vrbmDcEOSBosX2rjkHcHY0u+37MIsGatw//U6iVAemKzQYdznwofjp
	 9RZ4PR1Pr2pCeSXesqLKv97+1GAU6AJ+3XXVV+1XUtINBl3xBHG92X2Kpi3iFJ0x5CT5h
	 Z9GWcDhJRw2OICp2Gx3CE3PDVxYNckulfwqH0Kjg2Vjt96HstTCz5LLfzqZfVINgIMq0P
	 IMDmY0K+GbiR6e++r9L3tmev/zeH9zvjeZYqaR+BC+l7zi0+2AgsEzOqbXc1FyMNS2oMP
	 Lhf/e1vQbjZok79kRVi3+HSGtuwtOE3gINQmUZBImS6m8NbkIkUjwVSsV/B5hUTC4Sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794686976;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=KMsf6Mo2Oliqh2qahQUMTcuFw8dO50/oLEMB2urj64g=;
	b=o4UfPCPNguhK4EWi/nTJPGcLxmzCZa6Ds8va0+dpRk3mZ340WKjZaE70hkcIQ8ZLmPXi
	 dmGMpjXWkU001QOSi3oo3os4qBgrz1+A8Gah0sit+JustIjNs5iULjUqbncqs1P7+5PgE
	 N3eHip/GbM1wMlHxXMoZnniMonG4yMkHaNFVT5vmYNJikDqzUszm1kivw/PbonlPL2NDn
	 ltz2vitwhrhxUK0PTQGjWsMxXpLoi/DkcmLZeoKYrfH+FR29Feu8e9CAZwXHTiI1Vs5Uz
	 HToJ/3CjNk2CAxNdH2XjUtZ6yE5Chn5UpXTOH6frmtumDIWH4Aizx+u4JkBspVphwBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OrKapMpP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38DE606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 20:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OrKapMpP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBA4A1F000C4;
	Sat, 14 Nov 2026 20:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794686975;
	bh=KMsf6Mo2Oliqh2qahQUMTcuFw8dO50/oLEMB2urj64g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OrKapMpP6pkOi0Fuy4QrZNWpY7WBehVmVTM50FXTiI/Ke0bvtDiGixm7H2HeACL/V
	 WjFFrZMfegaoxr9692/qNEyP587PYjLyGjE7h4dkB3UU+BRFGC4u2z7DNGo5yf6pqx
	 IyLGT/WIoTfRJCpqhZkIaJmlwZcYXGMoUKrFk0Sx1WS30a3+9kAzfhwF74s86SV9LH
	 nugw5tT7mHnEvEQXf579/nxA5evaIyblcXqTWJInVbiLQSe7ovxbqjK+KfDO/BXSG+
	 yp7KB6IDCrTXMrKm94u/8T6wikGpATZdDSQUZtXqSf/prgIetlBhgFScZZJ+MqocSs
	 07Z/i9wlz+sWQ==
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
	Barry Song <baohua@kernel.org>,
	Kunwu Chan <chentao@kylinos.cn>
Subject: [PATCH v9 16/16] mm/mglru: Avoid scan anon while swapcache is low for GFP_NOIO allocation
Date: Sun, 15 Nov 2026 04:08:03 +0800
Message-Id: <20261114200803.23129-17-baohua@kernel.org>
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

From: Bo Zhang <zhangbo56@xiaomi.com>

With GFP_NOIO, we cannot reclaim anon folios unless they are in
the swap cache. CLRU skips anon reclaim when the swap cache is
very low by commit 74d9aa0d8e98 ("mm: vmscan: avoid anon scanning
for GFP_NOIO with low swapcache"). Apply the same logic to MGLRU.

The new scan-budget-based mechanism makes this straightforward to
implement. Thanks also to Xiang Liu, who previously attempted to fix
this before we had the scan-budget-based model [1].

One thing worth noting is that, for GFP_NOIO allocations, the
lruvec size accounted for by lruvec_evictable_size() may be
underestimated during lru_gen_age_node(), even though we count
all zones for the min_ttl check.

As explained in the commit message, the proper solution is to
decouple the size check from min_ttl handling. We leave that
improvement to a separate patch series.

[1] https://lore.kernel.org/linux-mm/179248830836.1744016.8424217811286616919.noio-mglru-rfc-v2@bytedance.com/

Cc: Xiang Liu <liuxiang.277@bytedance.com>
Signed-off-by: Bo Zhang <zhangbo56@xiaomi.com>
Co-developed-by: Barry Song (Xiaomi) <baohua@kernel.org>
Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
Reviewed-by: Kunwu Chan <chentao@kylinos.cn>
---
 mm/vmscan.c | 27 ++++++++++-----------------
 1 file changed, 10 insertions(+), 17 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index a9b97d23838b..4960ac012392 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -272,13 +272,6 @@ static inline bool reclaimable_anon_is_low(struct mem_cgroup *memcg,
 	if (!sc || (sc->gfp_mask & __GFP_IO))
 		return false;
 
-	/*
-	 * FIXME: MGLRU doesn't fully respect can_reclaim_anon_pages() for the
-	 * scanning type, so only apply this to the traditional LRU for now.
-	 */
-	if (lru_gen_enabled())
-		return false;
-
 	if (memcg) {
 		struct lruvec *lruvec = mem_cgroup_lruvec(memcg, pgdat);
 
@@ -4214,6 +4207,8 @@ static void lruvec_evictable_size(struct lruvec *lruvec, struct scan_control *sc
 	int type;
 	unsigned long seq;
 	struct lru_gen_folio *lrugen = &lruvec->lrugen;
+	struct mem_cgroup *memcg = lruvec_memcg(lruvec);
+	int nid = lruvec_pgdat(lruvec)->node_id;
 	DEFINE_MAX_SEQ(lruvec);
 	DEFINE_MIN_SEQ(lruvec);
 
@@ -4221,6 +4216,8 @@ static void lruvec_evictable_size(struct lruvec *lruvec, struct scan_control *sc
 	nr[LRU_GEN_FILE] = 0;
 
 	for_each_evictable_type(type, swappiness) {
+		if (type == LRU_GEN_ANON && !can_reclaim_anon_pages(memcg, nid, sc))
+			continue;
 		for (seq = min_seq[type]; seq <= max_seq; seq++)
 			nr[type] += lruvec_gen_size(lrugen, type, seq, max_zone);
 	}
@@ -4903,23 +4900,19 @@ static void lru_gen_balance_scan(struct lruvec *lruvec, struct scan_control *sc,
 {
 	struct lru_gen_folio *lrugen = &lruvec->lrugen;
 	u64 refault_rate[ANON_AND_FILE], anon_factor, file_factor;
-	u64 anon_scan, file_scan, total;
+	u64 anon_scan, file_scan;
 	u64 anon_weight, file_weight;
 	int size_bias;
 
-	total = nr[LRU_GEN_ANON] + nr[LRU_GEN_FILE];
-	if (!total)
-		return;
-
-	if (swappiness <= MIN_SWAPPINESS) {
+	if (swappiness <= MIN_SWAPPINESS)
 		nr[LRU_GEN_ANON] = 0;
-		nr[LRU_GEN_FILE] = min_t(u64, total_scan, nr[LRU_GEN_FILE]);
-		return;
-	}
 
-	if (swappiness == SWAPPINESS_ANON_ONLY) {
+	if (swappiness == SWAPPINESS_ANON_ONLY)
 		nr[LRU_GEN_FILE] = 0;
+
+	if (!nr[LRU_GEN_ANON] || !nr[LRU_GEN_FILE]) {
 		nr[LRU_GEN_ANON] = min_t(u64, total_scan, nr[LRU_GEN_ANON]);
+		nr[LRU_GEN_FILE] = min_t(u64, total_scan, nr[LRU_GEN_FILE]);
 		return;
 	}
 
-- 
2.39.3 (Apple Git-146)

