Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794439654;
	b=e1ZwFN8VrvsTYblWqruZB29Xt8BIFX3oZzKYlljzQiXdMXNJEp1J50lmfPuOyHOn9cKj
	 x6JnQX8XEm8W63Sb+4EDlsS6LR9+xI0+Snm0kpvvlLnShlIf7xO3DmGUbt5x/vzMoLxYK
	 705r+x15qnlS408qF0r2s+BRk1icp6ncJyZ4A8H1QAGCD/0/JmVmeEbEP2RLViybQVXS8
	 G2KNQQsUqB9bNKZF04CD/zmkgUajCKF8ZXlnjiEHx+bcktnnyWpCKc5E+ndnDY/gqeSkU
	 L7XHlOgDJfu5sZcdq01BBP00PQy+3CWwt0MUJVSYWL8LuEv25beuLSLsKDik51kxUqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794439654;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=mzO4KiqZw719W+0CmuqrZxCm8Y3trZUlrMTybnCiAns=;
	b=L59bON8yVggvKU+kCdAuozP6Etvg82iv2lZUlnAYFZD90bxUnLX1ZMySUztPd7a3HBF7
	 ck5GFyLbn/2YImPAVN20vBDLDIUgfHJYNoA7Fo1+By1jrmVizbcrDXLEKtLcQ75e/RcRP
	 jkb3cEQx7zkPo18cYr/bvAzRDkW4tI/GK8/DZXQ5s52y1qu9S/avHYr4X0Z8VVpZp2uOE
	 P+8IOyyYPsPmiycP/oqriKpMMgJCEBFpqNoJ7JN6UuPP0VSHlnYBtaqURBdqXFBuPznS3
	 QaPMVJC5ad6t+hcqXd1/9bobGvzOUObkw/rU8ZcaF4owRBMqB/ZA4SiaahmwPWABR4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Iq2EVakL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A989E60A263B
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Iq2EVakL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68EBC1F00A08;
	Wed, 11 Nov 2026 23:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794439654;
	bh=mzO4KiqZw719W+0CmuqrZxCm8Y3trZUlrMTybnCiAns=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Iq2EVakL0MhzMjJN/wPKDl5O+vbqbX16HeJU7+ZbRzhfWqhoFz5ZKXQZvz1w+T1Dh
	 KF7kUlO4GnmYu/rJ9WBO037T2whfizPK9qfARINQmf/WU+uE6o0mdUJgDhsrdsk2BD
	 +vHXCGDZnWUr0SHJUYqthnjYoc4qrGHzxTy7vAulu7g6xadWDlyp31AZdJmuGSmTE1
	 /VjiXN4BZwD5AbUWu/lxEOyAX8SquKAvnqDbEgXviM3t0XTihH2dIDWoxZh3hyUze/
	 NIQwLPCscGRMe4sfAGPYo/XEB9VF4W1tuxytr5WtLdmJ/FrEtnrRTwCRP37zrXP3VE
	 x7W+68/cOUQcg==
From: "Barry Song (Xiaomi)" <baohua@kernel.org>
To: akpm@linux-foundation.org
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
	linux-mm@kvack.org,
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
Subject: [PATCH v7 16/16] mm/mglru: Avoid scan anon while swapcache is low for GFP_NOIO allocation
Date: Thu, 12 Nov 2026 07:26:03 +0800
Message-Id: <20261111232603.9934-17-baohua@kernel.org>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261111232603.9934-1-baohua@kernel.org>
References: <20261111232603.9934-1-baohua@kernel.org>
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
index d51303a5cb67..9f759d213614 100644
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
 
@@ -4212,6 +4205,8 @@ static void lruvec_evictable_size(struct lruvec *lruvec, struct scan_control *sc
 	int type;
 	unsigned long seq;
 	struct lru_gen_folio *lrugen = &lruvec->lrugen;
+	struct mem_cgroup *memcg = lruvec_memcg(lruvec);
+	int nid = lruvec_pgdat(lruvec)->node_id;
 	DEFINE_MAX_SEQ(lruvec);
 	DEFINE_MIN_SEQ(lruvec);
 
@@ -4219,6 +4214,8 @@ static void lruvec_evictable_size(struct lruvec *lruvec, struct scan_control *sc
 	nr[LRU_GEN_FILE] = 0;
 
 	for_each_evictable_type(type, swappiness) {
+		if (type == LRU_GEN_ANON && !can_reclaim_anon_pages(memcg, nid, sc))
+			continue;
 		for (seq = min_seq[type]; seq <= max_seq; seq++)
 			nr[type] += lruvec_gen_size(lrugen, type, seq, sc->reclaim_idx + 1);
 	}
@@ -4893,23 +4890,19 @@ static void lru_gen_balance_scan(struct lruvec *lruvec, struct scan_control *sc,
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
2.34.1

