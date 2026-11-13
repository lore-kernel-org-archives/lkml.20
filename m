Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596230;
	b=dA2KdsRnThxGtO1fHGHqo7u7e3zT0AzXOfsaXza6WCogWi/S067B3IYCnUafks+TTx58
	 ugLO2pzkhLFzFMeHtetx7jxOeSi1V8yJhgeKD0I38LT5l+JI6Yn4VexUgbF/R/3f7sBfD
	 aj4+RJONnEFUvIw/TGuxb6C2eZxAfPEMQLMr+0BswEkLcjWNhKnbOczsSxt7ADtOq+n7D
	 r4Txjcddc0kG3COxfE+VgAhNRlJQMt/kffgcje2HxugoxAnc5GS7lioP1sv5evOmT0MvS
	 BGujgnMLDYjHYCmLsrMN/cSPLXQvNUFKqdmMN55k7ilcThVHFgKUNED98pVKilVSxdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596230;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=1OlEjsYmm/cCbozumkFGrfD7ywJiG+WaDbYa8rQI19o=;
	b=L6P4eulgEeoV7rRFMzYqfpnAfl6HL8oxCAyfJKVPYu8CV/bp3X6Dbk414cI67dcpzGNr
	 Yv5HapDlZsI6rDxxoXh416J0JArVR6qotfJ8AUUcvrc/RnAWXacV8+OOWuuLf6To8ebec
	 0fIs4xOZ9mYthT7pNuw2W2c86P/SpooN2uqRHJjdn86L4vbTdAfE6zgeFbV1qMTLeZewG
	 u/OUqUR54MI3M4fAhhTUolXd4MPsJhkw7B2gSmHo0ThSz6c2s8vb3EHw2EBmBMjYVAMk/
	 AI4bbbKG0E1dvoDWxpxui25TNaJGJd/3ZPW3nCIHDdcWmExLCMw9pIpvDe43PtUHLwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XYnhaxNn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D394606B606
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XYnhaxNn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BD871F000C5;
	Fri, 13 Nov 2026 18:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794596230;
	bh=1OlEjsYmm/cCbozumkFGrfD7ywJiG+WaDbYa8rQI19o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XYnhaxNnpgQvF9GbMZUF1rfFEXUUigOusiUfT8Ks0H92KBLiFW7prcfxLi1rzgVmu
	 7G0CcbOHJtYxRog8gCMUipGroH14GJtbQeCwiEwhZUxBVOskxQ1Sb794LD/4t/fOGh
	 AjwzTD0ASqqQnNiYFPAIMR8u/WKtVWRfDrV5lMOLKvBoxs/zRlO6lsd6YErjC0C1M9
	 ZzHV0qcMUdesqUpi8+tLY7czQUdzXhWpsal0b9AFenITdDKZdxAdnQf8zw6UYgs6ik
	 xibmDuRSaDTxcydDpSfgYyvUih5iDSzVEDOQuz50f+4oytQ4EYn+/ffe6Ocum2VWvO
	 gSO3YdVjxtXDg==
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
Subject: [PATCH v8 16/16] mm/mglru: Avoid scan anon while swapcache is low for GFP_NOIO allocation
Date: Sat, 14 Nov 2026 02:55:41 +0800
Message-Id: <20261113185541.70203-17-baohua@kernel.org>
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

From: Bo Zhang <zhangbo56@xiaomi.com>

With GFP_NOIO, we cannot reclaim anon folios unless they are in
the swap cache. CLRU skips anon reclaim when the swap cache is
very low by commit 74d9aa0d8e98 ("mm: vmscan: avoid anon scanning
for GFP_NOIO with low swapcache"). Apply the same logic to MGLRU.

The new scan-budget-based mechanism makes this straightforward to
implement. Thanks also to Xiang Liu, who previously attempted to fix
this before we had the scan-budget-based model [1].

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
index 9ebfa3e4eeb0..18a3332c71e9 100644
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
 
@@ -4211,6 +4204,8 @@ static void lruvec_evictable_size(struct lruvec *lruvec, struct scan_control *sc
 	int type;
 	unsigned long seq;
 	struct lru_gen_folio *lrugen = &lruvec->lrugen;
+	struct mem_cgroup *memcg = lruvec_memcg(lruvec);
+	int nid = lruvec_pgdat(lruvec)->node_id;
 	DEFINE_MAX_SEQ(lruvec);
 	DEFINE_MIN_SEQ(lruvec);
 
@@ -4218,6 +4213,8 @@ static void lruvec_evictable_size(struct lruvec *lruvec, struct scan_control *sc
 	nr[LRU_GEN_FILE] = 0;
 
 	for_each_evictable_type(type, swappiness) {
+		if (type == LRU_GEN_ANON && !can_reclaim_anon_pages(memcg, nid, sc))
+			continue;
 		for (seq = min_seq[type]; seq <= max_seq; seq++)
 			nr[type] += lruvec_gen_size(lrugen, type, seq, sc->reclaim_idx + 1);
 	}
@@ -4904,23 +4901,19 @@ static void lru_gen_balance_scan(struct lruvec *lruvec, struct scan_control *sc,
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

