Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792706606;
	b=lczgAYdwn7dUCe+o0S6225G2UROT/FcGya0HvNa1ef/+AhS8JNraZglV5QYirY0XqssK
	 s8yPNzKO5s0H69e/hyQyfK6DClhEPL8Kn9kq2R0mgYWIQEOcLo8jwQtl16vj/xGThLH9u
	 fDcy+5DNgm8/MIKwGLWmX0HaZUwN736dprQvCxE0q9vadodKS9ZKEUW3M/r7DznISh1hx
	 5CIRLhdHJNIx+MC6O0TX5CVrxS1pmqyKcid1gBBzMbnNE/FJUPr086dSLmfiTCsWAt9yR
	 QQ5SZ8uLEu6zkNSpkpLkuKKjt+xESw+eeJXdbt1tDqvR9JRKENhHrEXsqorQSdBVXNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792706606;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=x5g4D3hEwc7GK+nQos56fFKgAhNh3H0jKC5fCgXobkg=;
	b=bdiRReQ3avIJP0YtVLsvawp08I/CsQiOSjlbRKhdkAEk7DUF04ZdfcD6BsF2e6mW3zOG
	 PQ1OD0SxMPlz4bklD2QIiE+qlfXuj3nuJC3heM8IM+KGG1SLryp+VrSw5K70+wYClY3Iz
	 sIDs88eeR/ILi9p30VHF0aDC8fng6Xv0WHeVGS95gA7SHAwP33JI/5a7S9mFC769CwtT3
	 X0NLVOreYn7hj4wb1HtFELBmbaze8Jcmk8CUIAlTpNRzHm0+p8gTrKdG2x54ljqX+l4NI
	 efDcBrFKYTNKOru4jWxIjAsMX0ajztvVLOdw+j9y1J9tsuVvYZDDkBhn3MYpDYXMugA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DpnLxfxC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8966B606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 22:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DpnLxfxC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85C181F01829;
	Thu, 22 Oct 2026 22:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792706606;
	bh=x5g4D3hEwc7GK+nQos56fFKgAhNh3H0jKC5fCgXobkg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DpnLxfxCgxMDb32Z2c8mEShELG4hi0o4Yo00Cxrxh1xB7RIknx6C7gC8fgtZGN6HI
	 KMkbyw2c9MEhy/qdoVTDrc9QY9hsMNeKvCT/iGbL0YvyZzVX/rPdb1ClNy614kxCFL
	 TDvTU0rnJk+8yotIbkKZH8kawmZT+PNUwzWU7rGfng7QGLnJYxGlx4XKA0CHT99bGm
	 uhPDuyT6deMTTrsAlAyyLkcqY4xZmd555jRLS9FxPQL3DXl4662uIkLTkOoomN5/rQ
	 Wo8wxH3JYEHotpZXhLcFx28w7f8IHGOE0pWalAmLDJSeeZK4sOx6U1hVjs3IPTh0ps
	 dUe00IyGnD+aA==
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
Subject: [RFC PATCH v5 14/14] mm/mglru: Avoid scan anon while swapcache is low for GFP_NOIO allocation
Date: Fri, 23 Oct 2026 06:02:03 +0800
Message-Id: <20261022220203.91911-15-baohua@kernel.org>
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
---
 mm/vmscan.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 6d5a823667e0..d72a5aef3a0f 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -379,13 +379,6 @@ static inline bool reclaimable_anon_is_low(struct mem_cgroup *memcg,
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
 
@@ -5061,26 +5054,23 @@ static void lru_gen_balance_scan(struct lruvec *lruvec, struct scan_control *sc,
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
 	if (swappiness <= MIN_SWAPPINESS) {
 		nr[LRU_GEN_ANON] = 0;
 		nr[LRU_GEN_FILE] = min_t(u64, total_scan, nr[LRU_GEN_FILE]);
-		return;
 	}
 
 	if (swappiness == SWAPPINESS_ANON_ONLY) {
 		nr[LRU_GEN_FILE] = 0;
 		nr[LRU_GEN_ANON] = min_t(u64, total_scan, nr[LRU_GEN_ANON]);
-		return;
 	}
 
+	if (!nr[LRU_GEN_ANON] || !nr[LRU_GEN_FILE])
+		return;
+
 	for (int type = LRU_GEN_ANON; type <= LRU_GEN_FILE; type++) {
 		int hist = lru_hist_from_seq(READ_ONCE(lrugen->min_seq[type]));
 		/* start at MIN_LRU_BATCH to smooth the rate on gen start */
@@ -5306,6 +5296,8 @@ static void lru_gen_prepare_scan(struct lruvec *lruvec, struct scan_control *sc,
 	unsigned long total;
 
 	lruvec_evictable_size(lruvec, swappiness, nr_to_scan);
+	if (!can_reclaim_anon_pages(memcg, lruvec_pgdat(lruvec)->node_id, sc))
+		nr_to_scan[LRU_GEN_ANON] = 0;
 	total = nr_to_scan[LRU_GEN_ANON] + nr_to_scan[LRU_GEN_FILE];
 
 	/* Just scrape all pages calculated above if this memcg was deleted */
-- 
2.34.1

