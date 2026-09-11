Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3503EC2E3
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789118560; cv=none; b=gqWidv/mDfjukqljj/BmTieFeAT5414gHIZzyXrcVDu7aBha/G6D+jg63sW/fASE+OaEMiVRyXls7qOAM7SVIkjUvo22na+QV0LGINnjAn77X3vonCYTYuR/WZqWKhA+Gazzsatog4u18Bq9CU78xVj8RV5GY+5jKfpsJSFRMPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789118560; c=relaxed/simple;
	bh=n/AN+RytR5d0aPr9CSLxFwRIv8UVe/O6pb/VfqS4a6w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MiXocmdrCTV6v0R2ZwJgN6p2HAvvBgH1NKgWDD3nIHNTwZ7NQZ/yorFV89V+B3KvEDcHkJ5LPHX4WX/nPE60+Zyi7NmB943YRo2THHvFIPzCs5zDqRba6XNZqwqti2lNqi0dA1jt0t0Edg/vn9+d1/8zmgEY66bc84hKuWYtHN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id 801C53E97F;
	Fri, 11 Sep 2026 09:22:24 +0000 (UTC)
From: Alexandre Ghiti <alex@ghiti.fr>
To: Johannes Weiner <hannes@cmpxchg.org>,
	Yosry Ahmed <yosry@kernel.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chris Li <chrisl@kernel.org>,
	Kairui Song <kasong@tencent.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Wei Xu <weixugc@google.com>,
	Joonsoo Kim <iamjoonsoo.kim@lge.com>
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH v4 2/3] mm: swap: refault on swap-in, not in the swap cache allocator
Date: Fri, 11 Sep 2026 11:20:06 +0200
Message-ID: <20260911092012.92399-3-alex@ghiti.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911092012.92399-1-alex@ghiti.fr>
References: <20260911092012.92399-1-alex@ghiti.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alex@ghiti.fr
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: dmFkZTEXUoAcTyxqs6DHuS9bexJcXxMxDWHXvKBIE5yJKvJ1l5Z5tjXpj2z0YH4g69HcaifX7LU9iZAtDhaYvP1e6KaK12VCqCrwmqG0NiWAe2+yovGW8qe4hB7tMi9RhbFgIMptkZyZ7V5on3kMbTXoq15zOJ+7iTP43ZJYgRBXQTZOPpguoIqpSHHa6HkjKM3Q0x0dGvABnyZRjNbmajTuj4am1MQqXUSyzSfzN7UanmP7HnKdCUySLAOiF0Yhc2e6aMBpt40WHxFOlZTqYIlLiFbVTSIGxPc3fgOKENtxC7Tenicq834qOzgDJXh3T2uEU9hPdjXCK8TIqSLZ6ur7kyo4dEUxqeq1g+09o/ki3xxHK6EOnUU+5YWUPXUfL+Tfn0jVbpl6XAAe4RCNC94YcogjvcPO8033kW0XCG8LziHlmwPNU1+Xv8v1OvftMmgsLn5FaCriQd7NcA/Dekyn3A+nZq2AVzY8wIHKmWObOnevHduJUKiBAI8A3GZhcscJ4qnXt0yJBGdEQKNCUr8p9TA5Us0t+aR3/qXXssnZ+EV+pLsIFeXxHF4YYLmZKlXVUauboGjgoansfJAXH8TibeuaHoSacortRDdhUEuYptE436XIuDVLSbZY5fjWLsEkdWnQdTEjn4tlBMENgaD0EYuEmmPzGtv3RxaHXbKhFHMh5A

The swap cache allocator evaluates the refault of every folio it
allocates.  zswap writeback also allocates through it: the shrinker puts
a buffer folio in the swap cache to write the compressed data out, and
that allocation is then counted as an anon refault (and, if the eviction
looks recent, as an activation) even though nothing faulted the page
back in.  On a workload that writes back continuously this inflates
workingset_refault_anon and workingset_activate_anon substantially.

Move the refault evaluation out of the allocator and into the two
swap-in callers.  zswap writeback keeps allocating the buffer, but no
longer reports a refault for it.

The callers cannot read the shadow themselves before allocating: the
allocation can sleep, so another swap-in may install a folio, have it
reclaimed and leave a newer shadow behind, and this caller would then
win the insertion but refault against the stale snapshot.  Hand the
shadow back from __swap_cache_alloc_folio() instead, which already
captures it under ci->lock in __swap_cache_add_check(), at the point the
insertion that displaces it succeeds.

The refault is evaluated before folio_add_lru(), as it was before this
patch, so workingset_refault() still sets PG_workingset/PG_active while
the folio is off the LRU: folio_add_lru() consumes both when it picks
the LRU list, and under MGLRU when it picks the generation.

Fixes: aae466b0052e ("mm/swap: implement workingset detection for anonymous LRU")
Signed-off-by: Nhat Pham <nphamcs@gmail.com>
Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
---
 mm/swap.h       |  3 ++-
 mm/swap_state.c | 28 +++++++++++++++++++++-------
 mm/zswap.c      |  2 +-
 3 files changed, 24 insertions(+), 9 deletions(-)

diff --git a/mm/swap.h b/mm/swap.h
index 8679cb61268e..5e959bedf5a3 100644
--- a/mm/swap.h
+++ b/mm/swap.h
@@ -314,7 +314,8 @@ void *swap_cache_get_shadow(swp_entry_t entry);
 void swap_cache_del_folio(struct folio *folio);
 struct folio *__swap_cache_alloc_folio(swp_entry_t target_entry, gfp_t gfp_mask,
 				       unsigned long orders, struct vm_fault *vmf,
-				       struct mempolicy *mpol, pgoff_t ilx);
+				       struct mempolicy *mpol, pgoff_t ilx,
+				       void **shadowp);
 /* Below helpers require the caller to lock and pass in the swap cluster. */
 void __swap_cache_add_folio(struct swap_cluster_info *ci,
 			    struct folio *folio, swp_entry_t entry);
diff --git a/mm/swap_state.c b/mm/swap_state.c
index bf8ff2d2dbf1..c95d1ddf3193 100644
--- a/mm/swap_state.c
+++ b/mm/swap_state.c
@@ -409,7 +409,8 @@ void __swap_cache_replace_folio(struct swap_cluster_info *ci,
 static struct folio *__swap_cache_alloc(struct swap_cluster_info *ci,
 					swp_entry_t targ_entry, gfp_t gfp,
 					unsigned int order, struct vm_fault *vmf,
-					struct mempolicy *mpol, pgoff_t ilx)
+					struct mempolicy *mpol, pgoff_t ilx,
+					void **shadowp)
 {
 	int err;
 	swp_entry_t entry;
@@ -483,12 +484,13 @@ static struct folio *__swap_cache_alloc(struct swap_cluster_info *ci,
 
 	/* memsw uncharges swap when folio is added to swap cache */
 	memcg1_swapin(folio);
-	if (shadow)
-		workingset_refault(folio, shadow);
 
 	node_stat_mod_folio(folio, NR_FILE_PAGES, nr_pages);
 	lruvec_stat_mod_folio(folio, NR_SWAPCACHE, nr_pages);
 
+	if (shadowp)
+		*shadowp = shadow;
+
 	return folio;
 }
 
@@ -500,6 +502,7 @@ static struct folio *__swap_cache_alloc(struct swap_cluster_info *ci,
  * @vmf: fault information
  * @mpol: NUMA memory allocation policy to be applied
  * @ilx: NUMA interleave index, for use only when MPOL_INTERLEAVE
+ * @shadowp: Returns the shadow the allocation displaced, NULL to ignore
  *
  * Allocate a folio in the swap cache for one swap slot, typically before
  * doing IO (e.g. swap in or zswap writeback). The swap slot indicated by
@@ -515,7 +518,8 @@ static struct folio *__swap_cache_alloc(struct swap_cluster_info *ci,
  */
 struct folio *__swap_cache_alloc_folio(swp_entry_t targ_entry, gfp_t gfp,
 				       unsigned long orders, struct vm_fault *vmf,
-				       struct mempolicy *mpol, pgoff_t ilx)
+				       struct mempolicy *mpol, pgoff_t ilx,
+				       void **shadowp)
 {
 	int order, err;
 	struct folio *ret;
@@ -530,7 +534,7 @@ struct folio *__swap_cache_alloc_folio(swp_entry_t targ_entry, gfp_t gfp,
 
 	do {
 		ret = __swap_cache_alloc(ci, targ_entry, gfp, order,
-					 vmf, mpol, ilx);
+					 vmf, mpol, ilx, shadowp);
 		if (!IS_ERR(ret))
 			break;
 		err = PTR_ERR(ret);
@@ -646,17 +650,22 @@ static struct folio *swap_cache_read_folio(struct swap_io_ctx *ctx,
 		pgoff_t ilx, bool readahead)
 {
 	struct folio *folio;
+	void *shadow = NULL;
 
 	do {
 		folio = swap_cache_get_folio(entry);
 		if (folio)
 			return folio;
-		folio = __swap_cache_alloc_folio(entry, gfp, BIT(0), NULL, mpol, ilx);
+		folio = __swap_cache_alloc_folio(entry, gfp, BIT(0), NULL, mpol,
+						 ilx, &shadow);
 	} while (PTR_ERR(folio) == -EEXIST);
 
 	if (IS_ERR_OR_NULL(folio))
 		return NULL;
 
+	if (shadow)
+		workingset_refault(folio, shadow);
+
 	folio_add_lru(folio);
 	swap_read_folio(ctx, folio);
 	if (readahead) {
@@ -688,17 +697,22 @@ struct folio *swapin_sync(swp_entry_t entry, gfp_t gfp, unsigned long orders,
 {
 	struct swap_io_ctx ctx = {};
 	struct folio *folio;
+	void *shadow = NULL;
 
 	do {
 		folio = swap_cache_get_folio(entry);
 		if (folio)
 			return folio;
-		folio = __swap_cache_alloc_folio(entry, gfp, orders, vmf, mpol, ilx);
+		folio = __swap_cache_alloc_folio(entry, gfp, orders, vmf, mpol,
+						 ilx, &shadow);
 	} while (PTR_ERR(folio) == -EEXIST);
 
 	if (IS_ERR(folio))
 		return folio;
 
+	if (shadow)
+		workingset_refault(folio, shadow);
+
 	folio_add_lru(folio);
 	swap_read_folio(&ctx, folio);
 	swap_read_submit(&ctx);
diff --git a/mm/zswap.c b/mm/zswap.c
index 0d2efe21f18a..16b78d44fdd0 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -1002,7 +1002,7 @@ static int zswap_writeback_entry(struct zswap_entry *entry,
 
 	mpol = get_task_policy(current);
 	folio = __swap_cache_alloc_folio(swpentry, GFP_KERNEL, BIT(0), NULL, mpol,
-					 NO_INTERLEAVE_INDEX);
+					 NO_INTERLEAVE_INDEX, NULL);
 	put_swap_device(si);
 
 	/*
-- 
2.53.0-Meta

